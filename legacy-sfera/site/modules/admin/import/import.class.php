<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class import extends aModule
{
    /**
     * API модуль импорта товаров из XML
     */
    function execute($arr)
    {
        // ВАЖНО: Очищаем весь буфер вывода перед JSON
        while (ob_get_level()) {
            ob_end_clean();
        }
        
        // Проверка авторизации
        if (!isset($_SESSION['admin_user'])) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Unauthorized']);
            exit;
        }
        
        $action = isset($_GET['action']) ? $_GET['action'] : 'start_import';
        
        // Проверка прав доступа
        if (!ACL::check('import', 'execute')) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false, 
                'message' => 'Доступ запрещён: недостаточно прав'
            ]);
            exit;
        }
        
        switch ($action) {
            case 'start_import':
                $this->start_import();
                break;
                
            case 'get_log':
                $this->get_log();
                break;
                
            case 'upload_file':
                $this->upload_file();
                break;
                
            default:
                $this->start_import();
                break;
        }
        
        exit;
    }
    
    /**
     * Запуск импорта
     */
    private function start_import()
    {
        header('Content-Type: application/json');
        
        // Путь к XML файлу
        $xmlFile = $_SERVER['DOCUMENT_ROOT'] . '/upload/File1C.xml';
        
        // Проверяем существование файла
        if (!file_exists($xmlFile)) {
            echo json_encode([
                'success' => false,
                'message' => 'Файл File1C.xml не найден в папке /upload/'
            ]);
            return;
        }
        
        // Создаем файл лога для этого импорта
        $logDir = $_SERVER['DOCUMENT_ROOT'] . '/upload/logs/';
        if (!is_dir($logDir)) {
            mkdir($logDir, 0755, true);
        }
        $logFile = $logDir . 'import_log_' . session_id() . '_' . time() . '.txt';
        $_SESSION['import_log_file'] = $logFile;
        
        // Создаем файл лога
        file_put_contents($logFile, "=== Начало импорта ===\n");
        
        // Отправляем ответ клиенту сразу, чтобы он мог начать получать сообщения через Comet
        // Игнорируем отключение клиента и продолжаем выполнение
        ignore_user_abort(true);
        set_time_limit(0);
        
        // Отправляем заголовки и начальный ответ
        if (ob_get_level()) {
            ob_end_clean();
        }
        
        echo json_encode([
            'success' => true,
            'message' => 'Импорт запущен. Отслеживайте прогресс в логе.',
            'log_file' => $logFile,
            'session_id' => session_id(),
            'comet_channel' => 'import_' . session_id()
        ]);
        
        // Отправляем ответ клиенту
        if (function_exists('fastcgi_finish_request')) {
            fastcgi_finish_request();
        } else {
            // Для других SAPI отправляем заголовки и очищаем буфер
            header('Content-Length: ' . ob_get_length());
            ob_end_flush();
            flush();
        }
        
        // Запускаем импорт (будет выполняться в фоне после отправки ответа)
        $this->run_import($xmlFile, $logFile, session_id());
    }
    
    /**
     * Выполнение импорта
     */
    private function run_import($xmlFile, $logFile, $sessionId = null)
    {
        // Увеличиваем время выполнения скрипта до бесконечности
        set_time_limit(0);
        ini_set('max_execution_time', 0);
        
        // Подключаем Comet
        include_once($_SERVER['DOCUMENT_ROOT'] . '/site/functions/comet.php');
        $cometLink = null;
        $cometChannel = 'import_' . ($sessionId ?: session_id());
        
        try {
            $cometLink = comet_connect();
        } catch (Exception $e) {
            // Comet не критичен, продолжаем без него
        }
        
        // Функция для записи в лог и отправки через Comet
        $writeLog = function($message) use ($logFile, $cometLink, $cometChannel) {
            $timestamp = date('Y-m-d H:i:s');
            $logMessage = $timestamp . ' - ' . $message;
            
            // Записываем в файл
            $log = fopen($logFile, 'a');
            fwrite($log, $logMessage . "\n");
            fclose($log);
            
            // Отправляем через Comet
            if ($cometLink) {
                try {
                    pushCometMessage($cometLink, $cometChannel, 'log', [
                        'message' => $message,
                        'timestamp' => $timestamp
                    ]);
                } catch (Exception $e) {
                    // Игнорируем ошибки Comet
                }
            }
        };
        
        try {
            $writeLog('Начало импорта...');
            
            // Загружаем XML
            $writeLog('Загрузка XML файла...');
            $xml = simplexml_load_file($xmlFile);
            
            if (!$xml) {
                $writeLog('ОШИБКА: Не удалось загрузить XML файл');
                return;
            }
            
            $writeLog('XML файл загружен успешно');
            
            // Очистка таблиц
            $writeLog('Очистка таблиц...');
            q("TRUNCATE TABLE products");
            $writeLog('Таблица products очищена');
            
            q("TRUNCATE TABLE product_properties");
            $writeLog('Таблица product_properties очищена');
            
            q("TRUNCATE TABLE price_types");
            $writeLog('Таблица price_types очищена');
            
            q("TRUNCATE TABLE tree");
            $writeLog('Таблица tree очищена');
            
            q("TRUNCATE TABLE prices");
            $writeLog('Таблица prices очищена');
            
            q("TRUNCATE TABLE attributes");
            q("TRUNCATE TABLE ages");
            $writeLog('Таблицы attributes и ages очищены');
            
            q("TRUNCATE TABLE authors");
            $writeLog('Таблица authors очищена');
            
            $writeLog('Все таблицы очищены');
            
            // Импорт категорий (tree)
            $writeLog('Импорт категорий (tree)...');
            $categoriesCount = 0;
            
            $saveGroups = function($groups, $parentId) use (&$saveGroups, &$categoriesCount, $writeLog) {
                foreach ($groups as $group) {
                    $id = (string)$group->Ид;
                    $name = (string)$group->Наименование;
                    
                    // Экранируем данные
                    $id = noSQL($id);
                    $name = noSQL($name);
                    $parentIdEscaped = $parentId ? noSQL($parentId) : null;
                    
                    // Вставка или обновление категории
                    if ($parentIdEscaped) {
                        $query = "REPLACE INTO tree (id, name, parent_id) VALUES ('$id', '$name', '$parentIdEscaped')";
                    } else {
                        $query = "REPLACE INTO tree (id, name, parent_id) VALUES ('$id', '$name', NULL)";
                    }
                    q($query);
                    $categoriesCount++;
                    
                    // Если есть вложенные группы — рекурсивно вызываем
                    if (isset($group->Группы->Группа)) {
                        $saveGroups($group->Группы->Группа, $id);
                    }
                }
            };
            
            if (isset($xml->Классификатор->Группы->Группа)) {
                $saveGroups($xml->Классификатор->Группы->Группа, null);
            }
            
            $writeLog("Импортировано категорий: $categoriesCount");
            
            // Импорт типов цен
            $writeLog('Импорт типов цен (price_types)...');
            $priceTypesCount = 0;
            
            if (isset($xml->Классификатор->ТипыЦен->ТипЦены)) {
                foreach ($xml->Классификатор->ТипыЦен->ТипЦены as $priceType) {
                    $id = noSQL((string)$priceType->Ид);
                    $name = noSQL((string)$priceType->Наименование);
                    $currency = noSQL((string)$priceType->Валюта);
                    
                    q("REPLACE INTO price_types (id, name, currency) VALUES ('$id', '$name', '$currency')");
                    $priceTypesCount++;
                }
            }
            
            $writeLog("Импортировано типов цен: $priceTypesCount");
            
            // Импорт свойств товаров
            $writeLog('Импорт свойств товаров (product_properties)...');
            $propertiesCount = 0;
            
            if (isset($xml->Классификатор->Свойства->Свойство)) {
                foreach ($xml->Классификатор->Свойства->Свойство as $property) {
                    $id = noSQL((string)$property->Ид);
                    $name = noSQL((string)$property->Наименование);
                    $value_type = noSQL((string)$property->ТипЗначений);
                    
                    q("REPLACE INTO product_properties (id, name, value_type) VALUES ('$id', '$name', '$value_type')");
                    $propertiesCount++;
                }
            }
            
            $writeLog("Импортировано свойств: $propertiesCount");
            
            // Импорт товаров
            $writeLog('Импорт товаров (products)...');
            $productsCount = 0;
            $pricesCount = 0;
            $attributesCount = 0;
            $authorsCount = 0;
            $errorsCount = 0;
            
            if (isset($xml->Каталог->Товары->Товар)) {
                foreach ($xml->Каталог->Товары->Товар as $product) {
                    $productId = (string)$product->Ид;
                    try {
                        $id = noSQL($productId);
                        $sku = noSQL((string)$product->Артикул);
                        $code = noSQL((string)$product->Код);
                        $name = noSQL((string)$product->Наименование);
                        $description = noSQL((string)$product->Описание);
                        $picture = noSQL((string)$product->Картинка);
                        $baseUnit = noSQL((string)$product->БазоваяЕдиница);
                        $quantity = intval($product->Количество);
                        
                        // Вес товара
                        $weight = null;
                        if (isset($product->Вес) && (string)$product->Вес !== '') {
                            $weight = floatval($product->Вес);
                        }
                        
                        // Категории товара (берем первую)
                        $category_id = null;
                        if (isset($product->Группы->Ид)) {
                            $category_id = noSQL((string)$product->Группы->Ид[0]);
                        }
                        
                        // Дополнительные реквизиты
                        $attributes = [];
                        if (isset($product->ЗначенияРеквизитов->ЗначениеРеквизита)) {
                            foreach ($product->ЗначенияРеквизитов->ЗначениеРеквизита as $attr) {
                                $attrName = (string)$attr->Наименование;
                                $attrValue = (string)$attr->Значение;
                                $attributes[$attrName] = $attrValue;
                            }
                        }
                        // Кодируем JSON с правильной обработкой ошибок
                        $attributesJsonRaw = json_encode($attributes, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                        if ($attributesJsonRaw === false) {
                            $writeLog("ПРЕДУПРЕЖДЕНИЕ: Не удалось закодировать JSON для товара $productId: " . json_last_error_msg());
                            $attributesJsonRaw = json_encode([], JSON_UNESCAPED_UNICODE);
                        }
                        $attributesJson = noSQL($attributesJsonRaw);
                        
                        // SQL вставка товара
                        $weightSql = $weight !== null ? $weight : 'NULL';
                        $query = "INSERT INTO products (
                            id, 
                            category_id,
                            sku, 
                            code, 
                            name, 
                            description, 
                            picture, 
                            base_unit, 
                            quantity,
                            weight,
                            attributes_json
                        ) VALUES (
                            '$id', 
                            " . ($category_id ? "'$category_id'" : 'NULL') . ",
                            '$sku', 
                            '$code',
                            '$name',
                            '$description', 
                            '$picture', 
                            '$baseUnit', 
                            $quantity,
                            $weightSql,
                            '$attributesJson'
                        ) ON DUPLICATE KEY UPDATE 
                            name = VALUES(name),
                            description = VALUES(description),
                            picture = VALUES(picture),
                            category_id = VALUES(category_id),
                            quantity = VALUES(quantity),
                            weight = VALUES(weight)";
                        
                        // Логируем начало обработки товара каждые 50 товаров
                        if ($productsCount % 50 == 0 && $productsCount > 0) {
                            $writeLog("Обрабатывается товар #$productsCount (ID: $productId)");
                        }
                        
                        q($query);
                        $productsCount++;
                        
                        // Импорт цен товара
                        if (isset($product->Цены->Цена)) {
                            foreach ($product->Цены->Цена as $price) {
                                $priceTypeId = noSQL((string)$price->ИдТипаЦены);
                                $priceValue = floatval($price->ЦенаЗаЕдиницу);
                                $currency = noSQL((string)$price->Валюта);
                                $representation = noSQL((string)$price->Представление);
                                
                                $priceQuery = "REPLACE INTO prices (
                                    product_id,
                                    price_type_id,
                                    price,
                                    currency,
                                    representation
                                ) VALUES (
                                    '$id',
                                    '$priceTypeId',
                                    $priceValue,
                                    " . ($currency ? "'$currency'" : 'NULL') . ",
                                    " . ($representation ? "'$representation'" : 'NULL') . "
                                )";
                                
                                q($priceQuery);
                                $pricesCount++;
                            }
                        }
                        
                        // Импорт атрибутов товара
                        if (isset($product->ЗначенияРеквизитов->ЗначениеРеквизита)) {
                            foreach ($product->ЗначенияРеквизитов->ЗначениеРеквизита as $attr) {
                                $attrName = noSQL((string)$attr->Наименование);
                                $attrValue = noSQL((string)$attr->Значение);
                                
                                // Сохраняем все атрибуты, даже пустые
                                $attrQuery = "REPLACE INTO attributes (
                                    product_id,
                                    name,
                                    value
                                ) VALUES (
                                    '$id',
                                    '$attrName',
                                    '$attrValue'
                                )";
                                
                                q($attrQuery);
                                $attributesCount++;
                                
                                // Обработка авторов из реквизита "Авторы"
                                if ($attrName === 'Авторы') {
                                    // Разделяем авторов по запятой, даже если значение пустое
                                    if (!empty($attrValue)) {
                                        $authorsList = explode(',', $attrValue);
                                        
                                        foreach ($authorsList as $author) {
                                            $authorName = trim(noSQL($author));
                                            
                                            // Сохраняем автора, даже если имя пустое после trim
                                            if (!empty($authorName)) {
                                                $authorQuery = "REPLACE INTO authors (
                                                    product_id,
                                                    author_name
                                                ) VALUES (
                                                    '$id',
                                                    '$authorName'
                                                )";
                                                
                                                q($authorQuery);
                                                $authorsCount++;
                                            }
                                        }
                                    }
                                }
                                
                                // Обработка возраста из реквизита "Возраст"
                                if ($attrName === 'Возраст') {
                                    // Сохраняем возраст в таблицу ages, исключая записи со словом "класс"
                                    $ageValue = trim($attrValue);
                                    if (!empty($ageValue) && stripos($ageValue, 'класс') === false) {
                                        $ageValueSafe = noSQL($ageValue);
                                        $ageQuery = "REPLACE INTO ages (
                                            product_id,
                                            age
                                        ) VALUES (
                                            '$id',
                                            '$ageValueSafe'
                                        )";
                                        
                                        q($ageQuery);
                                    }
                                }
                            }
                        }
                        
                        // Отправляем прогресс через Comet каждые 50 товаров
                        if ($productsCount % 50 == 0 && $cometLink) {
                            try {
                                pushCometMessage($cometLink, $cometChannel, 'progress', [
                                    'products' => $productsCount,
                                    'prices' => $pricesCount,
                                    'attributes' => $attributesCount,
                                    'authors' => $authorsCount,
                                    'errors' => $errorsCount
                                ]);
                            } catch (Exception $e) {
                                // Игнорируем ошибки Comet
                            }
                        }
                        
                        // Логируем каждые 100 товаров
                        if ($productsCount % 100 == 0) {
                            $writeLog("Обработано товаров: $productsCount");
                        }
                        
                    } catch (Exception $e) {
                        $errorsCount++;
                        $errorMsg = "ОШИБКА при импорте товара ID: $productId - " . $e->getMessage();
                        $writeLog($errorMsg);
                        $writeLog("Трассировка: " . $e->getTraceAsString());
                        
                        // Продолжаем импорт, но логируем ошибку
                        continue;
                    } catch (Error $e) {
                        $errorsCount++;
                        $errorMsg = "КРИТИЧЕСКАЯ ОШИБКА при импорте товара ID: $productId - " . $e->getMessage();
                        $writeLog($errorMsg);
                        $writeLog("Трассировка: " . $e->getTraceAsString());
                        
                        // Продолжаем импорт, но логируем ошибку
                        continue;
                    }
                }
            }
            
            $writeLog("Импортировано товаров: $productsCount");
            $writeLog("Импортировано цен: $pricesCount");
            $writeLog("Импортировано атрибутов: $attributesCount");
            $writeLog("Импортировано авторов: $authorsCount");
            if ($errorsCount > 0) {
                $writeLog("Ошибок при импорте: $errorsCount");
            }
            
            $writeLog('Импорт завершён успешно!');
            $writeLog("Итого: категорий - $categoriesCount, типов цен - $priceTypesCount, свойств - $propertiesCount, товаров - $productsCount, цен - $pricesCount, атрибутов - $attributesCount, авторов - $authorsCount");
            
            // Отправляем финальное сообщение через Comet
            if ($cometLink) {
                try {
                    pushCometMessage($cometLink, $cometChannel, 'complete', [
                        'success' => true,
                        'categories' => $categoriesCount,
                        'price_types' => $priceTypesCount,
                        'properties' => $propertiesCount,
                        'products' => $productsCount,
                        'prices' => $pricesCount,
                        'attributes' => $attributesCount,
                        'authors' => $authorsCount,
                        'errors' => $errorsCount
                    ]);
                } catch (Exception $e) {
                    // Игнорируем ошибки Comet
                }
            }
            
        } catch (Exception $e) {
            $writeLog('КРИТИЧЕСКАЯ ОШИБКА: ' . $e->getMessage());
            $writeLog('Трассировка: ' . $e->getTraceAsString());
            
            // Отправляем сообщение об ошибке через Comet
            if ($cometLink) {
                try {
                    pushCometMessage($cometLink, $cometChannel, 'error', [
                        'message' => $e->getMessage(),
                        'trace' => $e->getTraceAsString()
                    ]);
                } catch (Exception $e2) {
                    // Игнорируем ошибки Comet
                }
            }
        } finally {
            // Закрываем соединение с Comet
            if ($cometLink) {
                comet_bye($cometLink);
            }
        }
    }
    
    /**
     * Получить лог импорта
     */
    private function get_log()
    {
        header('Content-Type: application/json');
        
        $logFile = isset($_SESSION['import_log_file']) ? $_SESSION['import_log_file'] : null;
        
        if (!$logFile || !file_exists($logFile)) {
            echo json_encode([
                'success' => false,
                'message' => 'Лог файл не найден',
                'log' => ''
            ]);
            return;
        }
        
        $logContent = file_get_contents($logFile);
        
        echo json_encode([
            'success' => true,
            'log' => $logContent
        ]);
    }
    
    /**
     * Загрузка XML файла
     */
    private function upload_file()
    {
        header('Content-Type: application/json');
        
        // Проверяем, что файл был загружен
        if (!isset($_FILES['file']) || $_FILES['file']['error'] !== UPLOAD_ERR_OK) {
            $errorMessage = 'Ошибка загрузки файла';
            if (isset($_FILES['file']['error'])) {
                switch ($_FILES['file']['error']) {
                    case UPLOAD_ERR_INI_SIZE:
                    case UPLOAD_ERR_FORM_SIZE:
                        $errorMessage = 'Файл слишком большой';
                        break;
                    case UPLOAD_ERR_PARTIAL:
                        $errorMessage = 'Файл загружен частично';
                        break;
                    case UPLOAD_ERR_NO_FILE:
                        $errorMessage = 'Файл не был загружен';
                        break;
                }
            }
            echo json_encode([
                'success' => false,
                'message' => $errorMessage
            ]);
            return;
        }
        
        $uploadedFile = $_FILES['file'];
        $fileName = $uploadedFile['name'];
        $fileTmpName = $uploadedFile['tmp_name'];
        
        // Проверяем расширение файла
        $fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
        if ($fileExtension !== 'xml') {
            echo json_encode([
                'success' => false,
                'message' => 'Разрешена загрузка только XML файлов'
            ]);
            return;
        }
        
        // Путь для сохранения
        $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/upload/';
        
        // Создаем директорию, если её нет
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }
        
        // Имя файла для сохранения
        $targetFileName = 'File1C.xml';
        $targetPath = $uploadDir . $targetFileName;
        
        // Перемещаем файл
        if (move_uploaded_file($fileTmpName, $targetPath)) {
            // Проверяем, что это валидный XML
            $xml = @simplexml_load_file($targetPath);
            if ($xml === false) {
                unlink($targetPath);
                echo json_encode([
                    'success' => false,
                    'message' => 'Загруженный файл не является валидным XML'
                ]);
                return;
            }
            
            echo json_encode([
                'success' => true,
                'message' => 'Файл успешно загружен: ' . $targetFileName,
                'file_name' => $targetFileName,
                'file_size' => filesize($targetPath)
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Не удалось сохранить файл'
            ]);
        }
    }
}

