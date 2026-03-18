<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class ozon_import extends aModule
{
    private $logFile = null;
    private $writeLog = null;
    
    /**
     * Модуль импорта категорий из Ozon
     */
    function execute($arr)
    {
        // Увеличиваем лимит времени выполнения для импорта
        set_time_limit(0);
        ignore_user_abort(true);
        
        // ВАЖНО: Очищаем весь буфер вывода перед JSON
        // Делаем это максимально агрессивно
        while (ob_get_level() > 0) {
            ob_end_clean();
        }
        
        // Отключаем буферизацию вывода
        if (ob_get_level() == 0) {
            ob_start();
        }
        
        // Проверка авторизации
        if (!isset($_SESSION['admin_user'])) {
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Unauthorized']);
            exit;
        }
        
        $action = isset($_GET['action']) ? $_GET['action'] : 'import_categories';
        
        // Проверка прав доступа
        if (!ACL::check('ozon_import', 'execute')) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false, 
                'message' => 'Доступ запрещён: недостаточно прав'
            ]);
            exit;
        }
        
        switch ($action) {
            case 'import_categories':
                $this->import_categories();
                break;
                
            case 'import_products':
                $this->import_products();
                break;
                
            case 'import_attr_names':
                $this->import_attr_names();
                break;
                
            case 'import_reviews':
                $this->import_reviews();
                break;
                
            case 'import_images':
                $this->import_images();
                break;
                
            default:
                //$this->import_categories();
                break;
        }
        
        exit;
    }
    
    /**
     * Импорт категорий из Ozon API
     */
    private function import_categories()
    {
        // Увеличиваем лимит времени выполнения для импорта
        set_time_limit(0);
        ignore_user_abort(true);
        
        // Очищаем буфер вывода перед JSON
        while (ob_get_level() > 0) {
            ob_end_clean();
        }
        
        header('Content-Type: application/json');
        
        // Создаем файл лога для этого импорта
        $logDir = $_SERVER['DOCUMENT_ROOT'] . '/upload/logs/';
        if (!is_dir($logDir)) {
            mkdir($logDir, 0755, true);
        }
        $logFile = $logDir . 'ozon_import_log_' . date('Y-m-d_H-i-s') . '_' . session_id() . '.txt';
        $this->logFile = $logFile;
        
        // Функция для записи в лог
        $writeLog = function($message) use ($logFile) {
            $timestamp = date('Y-m-d H:i:s');
            $logMessage = "[{$timestamp}] {$message}\n";
            file_put_contents($logFile, $logMessage, FILE_APPEND);
            error_log($message); // Также пишем в error_log
        };
        
        $writeLog("=== Начало импорта категорий из Ozon ===");
        
        try {
            // Получаем дерево категорий из Ozon API
            // Для этого эндпоинта отправляем пустой объект {} вместо пустого массива []
            $writeLog("Запрос к API Ozon: /v1/description-category/tree");
            $response = $this->apiRequest('/v1/description-category/tree', new stdClass(), $writeLog);
            
            // Логируем ответ от API для отладки
            $writeLog("Получен ответ от API Ozon");
            $writeLog("Тип ответа: " . gettype($response));
            if (is_array($response)) {
                $writeLog("Ключи ответа: " . implode(', ', array_keys($response)));
            }
            if (isset($response['result'])) {
                $writeLog("Тип result: " . gettype($response['result']));
                $writeLog("Количество корневых категорий: " . (is_array($response['result']) ? count($response['result']) : 'not array'));
            }
            
            if (!isset($response['result']) || !is_array($response['result'])) {
                $errorMsg = 'Неверный формат ответа от API Ozon';
                if (isset($response['error'])) {
                    $errorMsg .= '. Ошибка API: ' . (is_string($response['error']) ? $response['error'] : json_encode($response['error']));
                }
                if (isset($response['message'])) {
                    $errorMsg .= '. Сообщение: ' . (is_string($response['message']) ? $response['message'] : json_encode($response['message']));
                }
                echo json_encode([
                    'success' => false,
                    'message' => $errorMsg,
                    'debug' => [
                        'response_type' => gettype($response),
                        'response_keys' => is_array($response) ? array_keys($response) : null,
                        'has_result' => isset($response['result']),
                        'result_type' => isset($response['result']) ? gettype($response['result']) : null
                    ]
                ]);
                return;
            }
            
            $writeLog("Получено корневых категорий: " . count($response['result']));
            
            // Очищаем таблицу перед импортом
            $writeLog("Очистка таблицы o_categories...");
            q("TRUNCATE TABLE o_categories");
            $writeLog("Таблица очищена");
            
            // Импортируем дерево категорий
            $imported = 0;
            $totalCategories = count($response['result']);
            $writeLog("Начало импорта {$totalCategories} корневых категорий");
            
            foreach ($response['result'] as $index => $category) {
                try {
                    $count = $this->importCategoryTree($category, null, 0, '', $writeLog);
                    $imported += $count;
                    
                    // Логируем прогресс каждые 5 категорий
                    if (($index + 1) % 5 == 0 || ($index + 1) == $totalCategories) {
                        $writeLog("Прогресс: обработано " . ($index + 1) . " из {$totalCategories} корневых категорий, импортировано всего: {$imported}");
                    }
                } catch (Exception $e) {
                    $writeLog("ОШИБКА при обработке корневой категории #{$index}: " . $e->getMessage());
                    $writeLog("Данные категории: " . print_r($category, true));
                    // Продолжаем обработку остальных категорий
                    continue;
                }
            }
            
            $writeLog("=== Импорт завершен ===");
            $writeLog("Всего импортировано категорий: {$imported}");
            
            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            // Отправляем JSON ответ
            $responseData = [
                'success' => true,
                'message' => "Импорт завершен. Импортировано категорий: {$imported}",
                'count' => $imported,
                'log_file' => basename($logFile)
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ и закрываем соединение
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                // Для других SAPI
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
            
        } catch (Exception $e) {
            $writeLog("КРИТИЧЕСКАЯ ОШИБКА при импорте: " . $e->getMessage());
            $writeLog("Stack trace: " . $e->getTraceAsString());
            
            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            $responseData = [
                'success' => false,
                'message' => 'Ошибка при импорте: ' . $e->getMessage(),
                'log_file' => isset($logFile) ? basename($logFile) : null
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
        }
    }
    
    /**
     * Рекурсивная функция импорта дерева категорий
     */
    private function importCategoryTree($category, $parentId = null, $level = 0, $path = '', $writeLog = null)
    {
        $count = 0;
        
        // Если функция записи в лог не передана, создаем заглушку
        if ($writeLog === null) {
            $writeLog = function($message) {
                error_log($message);
            };
        }
        
        try {
            // Формируем путь
            $categoryName = isset($category['category_name']) ? $category['category_name'] : 
                           (isset($category['type_name']) ? $category['type_name'] : '');
            $newPath = $path ? $path . ' > ' . $categoryName : $categoryName;
            
            // Определяем ID категории
            $categoryId = null;
            if (isset($category['description_category_id'])) {
                $categoryId = $category['description_category_id'];
            } elseif (isset($category['type_id'])) {
                $categoryId = $category['type_id'];
            }
            
            if (!$categoryId) {
                $writeLog("ПРЕДУПРЕЖДЕНИЕ: Пропущена категория без ID. Данные: " . print_r($category, true));
                return $count;
            }
        
        // Подготавливаем данные для вставки
        $data = [
            'description_category_id' => $categoryId,
            'category_name' => $categoryName,
            'type_id' => isset($category['type_id']) && $category['type_id'] !== null ? intval($category['type_id']) : null,
            'type_name' => isset($category['type_name']) && $category['type_name'] !== '' ? $category['type_name'] : null,
            'parent_id' => $parentId !== null ? intval($parentId) : null,
            'disabled' => isset($category['disabled']) ? ($category['disabled'] ? 1 : 0) : 0,
            'level' => $level,
            'path' => $newPath
        ];
        
        // Вставляем или обновляем категорию
        try {
            $existing = row("SELECT id FROM o_categories WHERE description_category_id = " . intval($categoryId));
            if ($existing) {
                // Обновляем существующую запись
                $updateFields = [];
                $updateFields[] = "`category_name` = '" . noSQL($data['category_name']) . "'";
                $updateFields[] = "`type_id` = " . ($data['type_id'] !== null ? intval($data['type_id']) : 'NULL');
                $updateFields[] = "`type_name` = " . ($data['type_name'] !== null ? "'" . noSQL($data['type_name']) . "'" : 'NULL');
                $updateFields[] = "`parent_id` = " . ($data['parent_id'] !== null ? intval($data['parent_id']) : 'NULL');
                $updateFields[] = "`disabled` = " . intval($data['disabled']);
                $updateFields[] = "`level` = " . intval($data['level']);
                $updateFields[] = "`path` = '" . noSQL($data['path']) . "'";
                
                $updateQuery = "UPDATE `o_categories` SET " . implode(', ', $updateFields) . 
                              " WHERE `id` = " . intval($existing['id']);
                $result = q($updateQuery);
                if (!$result) {
                    $mysqlError = mysqli_error($GLOBALS['dbid']);
                    $writeLog("ОШИБКА: Не удалось обновить категорию ID {$categoryId}: " . $mysqlError);
                    $writeLog("Запрос: " . $updateQuery);
                    return $count; // Пропускаем эту категорию, продолжаем дальше
                }
            } else {
                // Вставляем новую запись с правильной обработкой NULL
                $fields = [];
                $values = [];
                
                $fields[] = "`description_category_id`";
                $values[] = intval($data['description_category_id']);
                
                $fields[] = "`category_name`";
                $values[] = "'" . noSQL($data['category_name']) . "'";
                
                $fields[] = "`type_id`";
                $values[] = $data['type_id'] !== null ? intval($data['type_id']) : 'NULL';
                
                $fields[] = "`type_name`";
                $values[] = $data['type_name'] !== null ? "'" . noSQL($data['type_name']) . "'" : 'NULL';
                
                $fields[] = "`parent_id`";
                $values[] = $data['parent_id'] !== null ? intval($data['parent_id']) : 'NULL';
                
                $fields[] = "`disabled`";
                $values[] = intval($data['disabled']);
                
                $fields[] = "`level`";
                $values[] = intval($data['level']);
                
                $fields[] = "`path`";
                $values[] = "'" . noSQL($data['path']) . "'";
                
                $insertQuery = "INSERT INTO `o_categories` (" . implode(', ', $fields) . ") VALUES (" . implode(', ', $values) . ")";
                $result = q($insertQuery);
                if (!$result) {
                    $mysqlError = mysqli_error($GLOBALS['dbid']);
                    $writeLog("ОШИБКА: Не удалось вставить категорию ID {$categoryId}: " . $mysqlError);
                    $writeLog("Запрос: " . $insertQuery);
                    $writeLog("Данные: " . print_r($data, true));
                    $writeLog("Название категории: " . $categoryName);
                    $writeLog("Type ID: " . ($data['type_id'] !== null ? $data['type_id'] : 'NULL'));
                    $writeLog("Type name: " . ($data['type_name'] !== null ? $data['type_name'] : 'NULL'));
                    // Продолжаем выполнение, не прерываем импорт
                    return $count; // Пропускаем эту категорию, продолжаем дальше
                }
                
                // Логируем успешную вставку каждые 1000 записей
                $insertedId = insert_id();
                if ($insertedId % 1000 == 0) {
                    $writeLog("Прогресс: Вставлена категория ID {$categoryId} (ID в БД: {$insertedId}), всего обработано: {$count}");
                }
            }
        } catch (Exception $e) {
            $writeLog("ИСКЛЮЧЕНИЕ при обработке категории ID {$categoryId}: " . $e->getMessage());
            $writeLog("Данные категории: " . print_r($category, true));
            return $count; // Пропускаем эту категорию, продолжаем дальше
        }
        
            $count++;
            
            // Обрабатываем дочерние категории
            if (isset($category['children']) && is_array($category['children']) && !empty($category['children'])) {
                try {
                    // Получаем ID вставленной категории
                $currentParentId = $existing ? $existing['id'] : insert_id();
                if (!$currentParentId) {
                    $writeLog("ОШИБКА: Не удалось получить parent ID для категории ID {$categoryId}. Existing: " . ($existing ? 'yes' : 'no'));
                    return $count; // Возвращаем то, что уже обработано
                }
                
                foreach ($category['children'] as $childIndex => $child) {
                    try {
                        $childCount = $this->importCategoryTree($child, $currentParentId, $level + 1, $newPath, $writeLog);
                        $count += $childCount;
                    } catch (Exception $e) {
                        $writeLog("ОШИБКА при обработке дочернего элемента {$childIndex} категории ID {$categoryId}: " . $e->getMessage());
                        $writeLog("Данные дочернего элемента: " . print_r($child, true));
                        // Продолжаем обработку остальных дочерних элементов
                        continue;
                    }
                }
            } catch (Exception $e) {
                $writeLog("ИСКЛЮЧЕНИЕ при обработке дочерних элементов категории ID {$categoryId}: " . $e->getMessage());
                // Продолжаем выполнение, возвращаем то, что уже обработано
            }
            }
            
            return $count;
        } catch (Exception $e) {
            $writeLog("ИСКЛЮЧЕНИЕ в importCategoryTree (внешний блок): " . $e->getMessage());
            $writeLog("Данные категории: " . print_r($category, true));
            $writeLog("Stack trace: " . $e->getTraceAsString());
            return $count; // Возвращаем то, что уже обработано
        }
    }
    
    /**
     * Запрос к API Ozon (возвращает сырой ответ без декодирования JSON)
     */
    private function apiRequestRaw($endpoint, $data, $writeLog = null)
    {
        // Если функция записи в лог не передана, создаем заглушку
        if ($writeLog === null) {
            $writeLog = function($message) {
                error_log($message);
            };
        }
        
        $url = "https://api-seller.ozon.ru" . $endpoint;
        
        $headers = [
            'Client-Id: 357120',
            'Api-Key: 22e19133-a76e-4e10-9e5e-264971e0dd32',
            'Content-Type: application/json'
        ];
        
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_POST, true);
        
        // Если данные - пустой объект, отправляем пустой JSON объект {}
        // Если данные - массив, отправляем как есть
        if ($data instanceof stdClass) {
            curl_setopt($curl, CURLOPT_POSTFIELDS, '{}');
        } else {
            curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
        }
        
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        
        // Настройки SSL для стабильного соединения
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
        curl_setopt($curl, CURLOPT_TIMEOUT, 60);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
        
        // Дополнительные настройки для стабильности
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($curl, CURLOPT_MAXREDIRS, 5);
        
        $response = curl_exec($curl);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        $curlError = curl_error($curl);
        
        if (!$response) {
            curl_close($curl);
            throw new Exception('Ошибка запроса: ' . $curlError);
        }
        
        curl_close($curl);
        return $response;
    }
    
    /**
     * Запрос к API Ozon
     */
    private function apiRequest($endpoint, $data, $writeLog = null)
    {
        // Если функция записи в лог не передана, создаем заглушку
        if ($writeLog === null) {
            $writeLog = function($message) {
                error_log($message);
            };
        }
        
        $url = "https://api-seller.ozon.ru" . $endpoint;
        
        $headers = [
            'Client-Id: 357120',
            'Api-Key: 22e19133-a76e-4e10-9e5e-264971e0dd32',
            'Content-Type: application/json'
        ];
        
        // Логируем запрос (только для отладки, можно отключить)
        // $writeLog("=== Запрос к API Ozon ===");
        // $writeLog("URL: " . $url);
        // $writeLog("Data: " . json_encode($data));
        
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_POST, true);
        
        // Если данные - пустой объект, отправляем пустой JSON объект {}
        // Если данные - массив, отправляем как есть
        if ($data instanceof stdClass) {
            curl_setopt($curl, CURLOPT_POSTFIELDS, '{}');
        } else {
            curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
        }
        
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        
        // Настройки SSL для стабильного соединения
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
        curl_setopt($curl, CURLOPT_TIMEOUT, 60);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
        
        // Дополнительные настройки для стабильности
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($curl, CURLOPT_MAXREDIRS, 5);
        
        $response = curl_exec($curl);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        $curlError = curl_error($curl);
        
        // Логируем только критические ошибки
        if (!$response) {
            curl_close($curl);
            
            // Если это SSL ошибка, пробуем повторить запрос
            if (strpos($curlError, 'SSL') !== false || strpos($curlError, 'SSL_read') !== false) {
                sleep(2);
                
                // Повторная попытка
                $retryCurl = curl_init($url);
                curl_setopt($retryCurl, CURLOPT_POST, true);
                if ($data instanceof stdClass) {
                    curl_setopt($retryCurl, CURLOPT_POSTFIELDS, '{}');
                } else {
                    curl_setopt($retryCurl, CURLOPT_POSTFIELDS, json_encode($data));
                }
                curl_setopt($retryCurl, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($retryCurl, CURLOPT_HTTPHEADER, $headers);
                curl_setopt($retryCurl, CURLOPT_SSL_VERIFYPEER, true);
                curl_setopt($retryCurl, CURLOPT_SSL_VERIFYHOST, 2);
                curl_setopt($retryCurl, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
                curl_setopt($retryCurl, CURLOPT_TIMEOUT, 60);
                curl_setopt($retryCurl, CURLOPT_CONNECTTIMEOUT, 30);
                curl_setopt($retryCurl, CURLOPT_FOLLOWLOCATION, true);
                curl_setopt($retryCurl, CURLOPT_MAXREDIRS, 5);
                
                $response = curl_exec($retryCurl);
                $httpCode = curl_getinfo($retryCurl, CURLINFO_HTTP_CODE);
                $curlError = curl_error($retryCurl);
                
                if ($response) {
                    curl_close($retryCurl);
                } else {
                    curl_close($retryCurl);
                    throw new Exception('Ошибка запроса после повторной попытки: ' . $curlError);
                }
            } else {
                throw new Exception('Ошибка запроса: ' . $curlError);
            }
        }
        curl_close($curl);
        
        $result = json_decode($response, true);
        $jsonError = json_last_error();
        
        if ($jsonError !== JSON_ERROR_NONE) {
            throw new Exception('Ошибка декодирования JSON: ' . json_last_error_msg() . ' (код: ' . $jsonError . ')');
        }
        
        return $result;
    }
    
    /**
     * Импорт товаров из Ozon API
     */
    private function import_products()
    {
        // Увеличиваем лимит времени выполнения для импорта
        set_time_limit(0);
        ignore_user_abort(true);
        
        // Очищаем буфер вывода перед JSON
        while (ob_get_level() > 0) {
            ob_end_clean();
        }
        
        header('Content-Type: application/json');
        
        // Создаем файл лога для этого импорта
        $logDir = $_SERVER['DOCUMENT_ROOT'] . '/upload/logs/';
        if (!is_dir($logDir)) {
            mkdir($logDir, 0755, true);
        }
        $logFile = $logDir . 'ozon_import_products_log_' . date('Y-m-d_H-i-s') . '_' . session_id() . '.txt';
        $this->logFile = $logFile;
        
        // Функция для записи в лог
        $writeLog = function($message) use ($logFile) {
            $timestamp = date('Y-m-d H:i:s');
            $logMessage = "[{$timestamp}] {$message}\n";
            file_put_contents($logFile, $logMessage, FILE_APPEND);
            error_log($message); // Также пишем в error_log
        };
        
        $writeLog("=== Начало импорта товаров из Ozon ===");
        
        try {
            // Очищаем таблицы перед импортом
            $writeLog("Очистка таблиц перед импортом...");
            q("TRUNCATE TABLE o_products");
            q("TRUNCATE TABLE o_images");
            q("TRUNCATE TABLE o_attributes");
            $writeLog("Таблицы очищены");
            
            $allProducts = [];
            $lastId = "";
            $totalImported = 0;
            $batchNumber = 0;
            
            do {
                $batchNumber++;
                $writeLog("Обработка батча #{$batchNumber}, last_id: " . ($lastId ?: 'пусто'));
                
                // Получаем список товаров порциями по 100
                $response = $this->apiRequest('/v3/product/list', [
                    'limit' => 100,
                    'last_id' => $lastId,
                    'filter' => ['visibility' => 'ALL']
                ], $writeLog);
                
                if (!isset($response['result']['items']) || !is_array($response['result']['items'])) {
                    $writeLog("ОШИБКА: Неверный формат ответа от API");
                    $writeLog("Ответ: " . print_r($response, true));
                    break;
                }
                
                $products = $response['result']['items'];
                $writeLog("Получено товаров в батче: " . count($products));
                
                if (!empty($products)) {
                    // Собираем product_id для получения детальной информации через /v4/product/info/attributes
                    $productIds = [];
                    foreach ($products as $product) {
                        if (isset($product['product_id'])) {
                            $productIds[] = (string)$product['product_id'];
                        }
                    }
                    
                    $attributesData = [];
                    if (!empty($productIds)) {
                        // Задержка перед запросом
                        // sleep(1);
                        
                        try {
                            $attributesResponse = $this->apiRequest('/v4/product/info/attributes', [
                                'filter' => [
                                    'product_id' => $productIds,
                                    'visibility' => 'ALL'
                                ],
                                'limit' => 100,
                                'sort_dir' => 'ASC'
                            ], $writeLog);
                            
                            if (isset($attributesResponse['result']) && is_array($attributesResponse['result'])) {


                                // Сохраняем товары в базу данных
                                $batchImported = 0;
                                foreach ($attributesResponse['result'] as $product) {
                                    try {

                                        $item = array(
                                            'product_id' => $product['id'],
                                            'offer_id' => $product['offer_id'],
                                            'barcode' => $product['barcode'],
                                            'sku' => isset($product['sku']) ? $product['sku'] : null,
                                            'name' => $product['name'],
                                            'height' => $product['height'],
                                            'depth' => $product['depth'],
                                            'width' => $product['width'],
                                            'dimension_unit' => $product['dimension_unit'],
                                            'weight' => $product['weight'],
                                            'weight_unit' => $product['weight_unit'],
                                            'description_category_id' => $product['description_category_id'],
                                            'type_id' => $product['type_id'],
                                            'primary_image' => $product['primary_image']

                                        );

                                        insert('o_products', $item);

                                        // Изображения
                                        $i = 0;
                                        $img = array(
                                            'product_id' => $product['id'],
                                            'image_url' => $product['primary_image'],
                                            'image_order' => $i++
                                        );
                                        insert('o_images', $img);

                                        foreach ($product['images'] as $img) {

                                            $img = array(
                                                'product_id' => $product['id'],
                                                'image_url' => $img,
                                                'image_order' => $i++
                                            );
                                            insert('o_images', $img);
                                        }


                                        // Сохраняем атрибуты в таблицу o_attributes
                                        foreach ($product['attributes'] as $attribute) {
                                            $attr = array(
                                                'product_id' => $product['id'],
                                                'dictionary_value_id' => $attribute['id'],
                                                'value' => $attribute['values'][0]['value']
                                            );
                                            insert('o_attributes', $attr);

                                        }

                                        $batchImported++;
                                        $totalImported++;

                                    } catch (Exception $e) {
                                        // Логируем только критические ошибки
                                        if (strpos($e->getMessage(), 'ОШИБКА') !== false || strpos($e->getMessage(), 'КРИТИЧЕСКАЯ') !== false) {
                                            $writeLog("ОШИБКА при обработке товара product_id {$product['offer_id']}: " . $e->getMessage());
                                        }
                                        continue;
                                    }
                                }


                            } else {
                                $writeLog("ПРЕДУПРЕЖДЕНИЕ: Ответ от /v4/product/info/attributes не содержит 'result' или это не массив");
                                $writeLog("DEBUG: Ключи ответа: " . (is_array($attributesResponse) ? implode(', ', array_keys($attributesResponse)) : 'not array'));
                            }
                        } catch (Exception $e) {
                            $writeLog("ОШИБКА при получении атрибутов: " . $e->getMessage());
                            // Продолжаем без атрибутов
                        }
                    }
                    

                    // Обновляем last_id для следующего запроса
                    if (isset($response['result']['last_id']) && $response['result']['last_id'] !== "") {
                        $lastId = $response['result']['last_id'];
                    } else {
                        $lastId = "";
                    }
                } else {
                    $writeLog("Нет товаров в батче, завершение импорта");
                    $lastId = "";
                }
                
            } while ($lastId !== "");
            
            $writeLog("=== Импорт товаров завершен ===");
            $writeLog("Всего импортировано товаров: {$totalImported}");
            $writeLog("Всего обработано батчей: {$batchNumber}");


            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            // Отправляем JSON ответ
            $responseData = [
                'success' => true,
                'message' => "Импорт товаров завершен. Импортировано товаров: {$totalImported}",
                'count' => $totalImported,
                'batches' => $batchNumber,
                'log_file' => basename($logFile)
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ и закрываем соединение
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
            
        } catch (Exception $e) {
            $writeLog("КРИТИЧЕСКАЯ ОШИБКА при импорте товаров: " . $e->getMessage());
            $writeLog("Stack trace: " . $e->getTraceAsString());
            
            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            $responseData = [
                'success' => false,
                'message' => 'Ошибка при импорте товаров: ' . $e->getMessage(),
                'log_file' => isset($logFile) ? basename($logFile) : null
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
        }
    }
    
    /**
     * Импорт названий атрибутов из Ozon API
     */
    private function import_attr_names()
    {
        // Увеличиваем лимит времени выполнения для импорта
        set_time_limit(0);
        ignore_user_abort(true);
        
        // Очищаем буфер вывода перед JSON
        while (ob_get_level() > 0) {
            ob_end_clean();
        }
        
        header('Content-Type: application/json');
        
        // Создаем файл лога для этого импорта
        $logDir = $_SERVER['DOCUMENT_ROOT'] . '/upload/logs/';
        if (!is_dir($logDir)) {
            mkdir($logDir, 0755, true);
        }
        $logFile = $logDir . 'ozon_import_attr_names_log_' . date('Y-m-d_H-i-s') . '_' . session_id() . '.txt';
        $this->logFile = $logFile;
        
        // Функция для записи в лог
        $writeLog = function($message) use ($logFile) {
            $timestamp = date('Y-m-d H:i:s');
            $logMessage = "[{$timestamp}] {$message}\n";
            file_put_contents($logFile, $logMessage, FILE_APPEND);
            error_log($message);
        };
        
        $writeLog("=== Начало импорта названий атрибутов из Ozon ===");
        
        try {
            // Очищаем таблицу перед импортом
            $writeLog("Очистка таблицы o_attr_name...");
            q("TRUNCATE TABLE o_attr_name");
            $writeLog("Таблица очищена");


            $res = rows('SELECT * FROM v_o_product_categories');
            foreach ($res as $row) {
                $requestData = [
                    'description_category_id' => $row['description_category_id'],
                    'language' => 'DEFAULT',
                    'type_id' => $row['type_id']
                ];


                $writeLog("Запрос к API /v1/description-category/attribute");
                $writeLog("Параметры: " . json_encode($requestData, JSON_UNESCAPED_UNICODE));

                $response = $this->apiRequest('/v1/description-category/attribute', $requestData, $writeLog);


                if (!isset($response['result']) || !is_array($response['result'])) {
                    $writeLog("ОШИБКА: Неверный формат ответа от API");
                    $writeLog("Ответ: " . print_r($response, true));

                    header('Content-Type: application/json');
                    echo json_encode([
                        'success' => false,
                        'message' => 'Неверный формат ответа от API',
                        'log_file' => basename($logFile)
                    ]);
                    exit;
                }

                $attributes = $response['result'];
                $writeLog("Получено атрибутов: " . count($attributes));

                $imported = 0;
                $skipped = 0;

                foreach ($attributes as $attr) {
                    if (!isset($attr['id']) || !isset($attr['name'])) {
                        $skipped++;
                        continue;
                    }

                    $attrId = intval($attr['id']);
                    $attrName = $attr['name'];

                    // Проверяем, существует ли уже такой атрибут
                    $existing = row("SELECT id FROM o_attr_name WHERE id = " . intval($attrId));

                    if ($existing) {
                        // Обновляем существующий
                        $updateQuery = "UPDATE o_attr_name SET name = '" . noSQL($attrName) . "' WHERE id = " . intval($attrId);
                        q($updateQuery);
                    } else {
                        // Вставляем новый
                        $insertQuery = "INSERT INTO o_attr_name (id, name) VALUES (" . intval($attrId) . ", '" . noSQL($attrName) . "')";
                        q($insertQuery);
                    }

                    $imported++;
                }

                $writeLog("=== Импорт названий атрибутов для категории завершен ===");
                $writeLog("Импортировано: {$imported}");
                $writeLog("Пропущено: {$skipped}");

            }
            
            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            $responseData = [
                'success' => true,
                'message' => "Импорт названий атрибутов завершен. Импортировано: {$imported}",
                'count' => $imported,
                'skipped' => $skipped,
                'log_file' => basename($logFile)
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
            
        } catch (Exception $e) {
            $writeLog("КРИТИЧЕСКАЯ ОШИБКА при импорте названий атрибутов: " . $e->getMessage());
            $writeLog("Stack trace: " . $e->getTraceAsString());
            
            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            $responseData = [
                'success' => false,
                'message' => 'Ошибка при импорте названий атрибутов: ' . $e->getMessage(),
                'log_file' => isset($logFile) ? basename($logFile) : null
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
        }
    }
    
    /**
     * Импорт отзывов из Ozon API
     */
    private function import_reviews()
    {
        // Увеличиваем лимит времени выполнения для импорта
        set_time_limit(0);
        ignore_user_abort(true);
        
        // Очищаем буфер вывода перед JSON
        while (ob_get_level() > 0) {
            ob_end_clean();
        }
        
        header('Content-Type: application/json');
        
        // Создаем файл лога для этого импорта
        $logDir = $_SERVER['DOCUMENT_ROOT'] . '/upload/logs/';
        if (!is_dir($logDir)) {
            mkdir($logDir, 0755, true);
        }
        $logFile = $logDir . 'ozon_import_reviews_log_' . date('Y-m-d_H-i-s') . '_' . session_id() . '.txt';
        $this->logFile = $logFile;
        
        // Функция для записи в лог
        $writeLog = function($message) use ($logFile) {
            $timestamp = date('Y-m-d H:i:s');
            $logMessage = "[{$timestamp}] {$message}\n";
            file_put_contents($logFile, $logMessage, FILE_APPEND);
            error_log($message); // Также пишем в error_log
        };
        
        $writeLog("=== Начало импорта отзывов из Ozon ===");
        
        try {
            // Устанавливаем кодировку utf8mb4 для поддержки эмодзи и 4-байтовых UTF-8 символов
            q("SET NAMES 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'");
            q("SET character_set_client='utf8mb4'");
            q("SET character_set_results='utf8mb4'");
            q("SET collation_connection='utf8mb4_unicode_ci'");
            
            // Очищаем таблицу лога импорта перед началом нового импорта
            q("TRUNCATE TABLE import_reviews_log");
            
            // Проверяем, есть ли сохраненный прогресс для продолжения импорта
            $savedProgress = row("SELECT last_id, page_number, imported_count FROM import_reviews_log ORDER BY id DESC LIMIT 1");
            $continueImport = false;
            $lastId = null;
            $pageNumber = 0;
            $totalImported = 0;
            
            if ($savedProgress && !empty($savedProgress['last_id'])) {
                // Продолжаем импорт с сохраненного места
                $lastId = $savedProgress['last_id'];
                $pageNumber = isset($savedProgress['page_number']) ? intval($savedProgress['page_number']) : 0;
                $totalImported = isset($savedProgress['imported_count']) ? intval($savedProgress['imported_count']) : 0;
                $continueImport = true;
                $writeLog("Продолжение импорта с last_id: {$lastId}, страница: {$pageNumber}, импортировано: {$totalImported}");
            } else {
                // Начинаем новый импорт
                $writeLog("Начало нового импорта");
                // Очищаем таблицу отзывов только при новом импорте
                q("TRUNCATE TABLE o_reviews");
            }
            
            $totalSkipped = 0;
            $limit = 100; // API требует диапазон [20, 100]
            $hasMore = true;
            
            while ($hasMore) {
                $pageNumber++;
                // Логируем только каждую 10-ю страницу
                if ($pageNumber % 10 == 0 || $pageNumber == 1) {
                    $writeLog("Страница #{$pageNumber}, импортировано: {$totalImported}");
                }
                
                // Запрос к API Ozon для получения отзывов
                // Структура запроса согласно документации Ozon API
                $requestData = [
                    'filter' => [
                        'state' => 'ALL' // Можно использовать 'APPROVED', 'REJECTED', 'ALL'
                    ],
                    'limit' => $limit
                ];
                
                // Добавляем last_id для пагинации, если он есть
                if ($lastId !== null) {
                    $requestData['last_id'] = $lastId;
                }
                
                // Повторные попытки при сетевых ошибках и ошибках декодирования JSON
                $maxRetries = 3;
                $retryDelay = 2; // секунды
                $response = null;
                $retryCount = 0;
                $rawResponse = null;
                
                while ($retryCount < $maxRetries) {
                    try {
                        // Получаем сырой ответ от API
                        $rawResponse = $this->apiRequestRaw('/v1/review/list', $requestData, $writeLog);
                        
                        // Пытаемся декодировать JSON
                        $response = json_decode($rawResponse, true);
                        $jsonError = json_last_error();
                        
                        if ($jsonError !== JSON_ERROR_NONE) {
                            // Ошибка декодирования JSON - пробуем повторить
                            throw new Exception('Ошибка декодирования JSON: ' . json_last_error_msg() . ' (код: ' . $jsonError . ')');
                        }
                        
                        break; // Успешный запрос, выходим из цикла
                    } catch (Exception $e) {
                        $retryCount++;
                        $errorMessage = $e->getMessage();
                        
                        // Проверяем, является ли это ошибкой, которую можно повторить
                        $isRetryableError = (
                            strpos($errorMessage, 'Empty reply') !== false ||
                            strpos($errorMessage, 'timeout') !== false ||
                            strpos($errorMessage, 'Connection') !== false ||
                            strpos($errorMessage, 'SSL') !== false ||
                            strpos($errorMessage, 'декодирования JSON') !== false
                        );
                        
                        if ($isRetryableError && $retryCount < $maxRetries) {
                            $writeLog("Ошибка (попытка {$retryCount}/{$maxRetries}): {$errorMessage}. Повтор через {$retryDelay} сек...");
                            sleep($retryDelay);
                            $retryDelay *= 2; // Увеличиваем задержку с каждой попыткой
                        } else {
                            // Не повторяемая ошибка или исчерпаны попытки
                            if ($retryCount >= $maxRetries && isset($rawResponse) && $rawResponse) {
                                // Логируем сырой ответ для отладки при последней неудачной попытке
                                $writeLog("ОШИБКА: Не удалось декодировать ответ после {$maxRetries} попыток");
                                $writeLog("Первые 500 символов ответа: " . substr($rawResponse, 0, 500));
                            }
                            // Останавливаем импорт при критической ошибке, но сохраняем прогресс
                            $response = null;
                            break; // Выходим из цикла повторных попыток
                        }
                    }
                }
                
                if (!isset($response) || !$response) {
                    $writeLog("ОШИБКА: Не удалось получить ответ от API после {$maxRetries} попыток. Импорт остановлен.");
                    $writeLog("Прогресс сохранен. Можно продолжить импорт позже.");
                    // Сохраняем текущий прогресс перед остановкой
                    if ($lastId) {
                        $existingLog = row("SELECT id FROM import_reviews_log LIMIT 1");
                        if ($existingLog) {
                            q("UPDATE import_reviews_log SET 
                                last_id = '" . noSQL($lastId) . "',
                                page_number = " . intval($pageNumber) . ",
                                imported_count = " . intval($totalImported) . "
                                WHERE id = " . intval($existingLog['id']));
                        }
                    }
                    break; // Останавливаем импорт
                }
                
                try {
                    // API возвращает отзывы напрямую в массиве 'reviews', а не в 'result'
                    $reviews = [];
                    if (isset($response['reviews']) && is_array($response['reviews'])) {
                        $reviews = $response['reviews'];
                    } elseif (isset($response['result']['reviews']) && is_array($response['result']['reviews'])) {
                        $reviews = $response['result']['reviews'];
                    } elseif (isset($response['result']['items']) && is_array($response['result']['items'])) {
                        $reviews = $response['result']['items'];
                    } else {
                        $writeLog("ОШИБКА: Неверный формат ответа от API");
                        break;
                    }
                    
                    if (empty($reviews)) {
                        $hasMore = false;
                        break;
                    }
                    
                    // Обрабатываем каждый отзыв
                    foreach ($reviews as $review) {
                        try {
                            // review_id - это UUID строка, а не число
                            $reviewId = isset($review['id']) ? $review['id'] : null;
                            
                            // Подготавливаем данные для вставки
                            // Сохраняем только необходимые поля из API
                            
                            // Преобразуем дату из ISO 8601 формата в MySQL DATETIME формат
                            $dateValue = null;
                            if (isset($review['published_at']) && !empty($review['published_at'])) {
                                try {
                                    // Парсим ISO 8601 дату (например: 2022-04-12T09:48:14.057009Z)
                                    $dateTime = new DateTime($review['published_at']);
                                    $dateValue = $dateTime->format('Y-m-d H:i:s');
                                } catch (Exception $e) {
                                    $writeLog("ПРЕДУПРЕЖДЕНИЕ: Не удалось распарсить дату '{$review['published_at']}': " . $e->getMessage());
                                    $dateValue = null;
                                }
                            }
                            
                            // Обрабатываем текст - если пустая строка, то NULL
                            $textValue = isset($review['text']) && trim($review['text']) !== '' ? $review['text'] : null;
                            
                            // Сохраняем только необходимые поля: review_id, sku, rating, text, date, state
                            $reviewDataRaw = [
                                'review_id' => $reviewId, // UUID строка
                                'sku' => isset($review['sku']) ? intval($review['sku']) : null, // SKU для связи с товарами
                                'rating' => isset($review['rating']) ? intval($review['rating']) : null,
                                'text' => $textValue,
                                'date' => $dateValue, // Преобразованная дата в формате MySQL
                                'state' => isset($review['status']) ? $review['status'] : null // status -> state
                            ];
                            
                            // Удаляем NULL значения из массива, чтобы функция insert() не вставляла пустые строки
                            $reviewData = array_filter($reviewDataRaw, function($value) {
                                return $value !== null && $value !== '';
                            });
                            
                            // review_id обязателен, проверяем его наличие
                            if (!isset($reviewData['review_id']) || empty($reviewData['review_id'])) {
                                $writeLog("ПРЕДУПРЕЖДЕНИЕ: Пропущен отзыв без review_id");
                                $totalSkipped++;
                                continue;
                            }
                            
                            // Проверяем, существует ли уже такой отзыв
                            $existing = row("SELECT id FROM o_reviews WHERE review_id = '" . noSQL($reviewData['review_id']) . "'");
                            
                            if ($existing) {
                                // Обновляем существующий отзыв
                                $updateFields = [];
                                foreach ($reviewDataRaw as $key => $value) {
                                    if ($value === null) {
                                        $updateFields[] = "`{$key}` = NULL";
                                    } elseif ($key === 'sku' || $key === 'rating') {
                                        $updateFields[] = "`{$key}` = " . intval($value);
                                    } else {
                                        $updateFields[] = "`{$key}` = '" . noSQL($value) . "'";
                                    }
                                }
                                
                                $updateQuery = "UPDATE `o_reviews` SET " . implode(', ', $updateFields) . 
                                              " WHERE `id` = " . intval($existing['id']);
                                q($updateQuery);
                            } else {
                                // Вставляем новый отзыв
                                // Используем прямой SQL запрос для правильной обработки NULL значений
                                $fields = [];
                                $values = [];
                                
                                foreach ($reviewDataRaw as $key => $value) {
                                    $fields[] = "`{$key}`";
                                    if ($value === null) {
                                        $values[] = 'NULL';
                                    } elseif ($key === 'sku' || $key === 'rating') {
                                        $values[] = intval($value);
                                    } else {
                                        $values[] = "'" . noSQL($value) . "'";
                                    }
                                }
                                
                                $insertQuery = "INSERT INTO `o_reviews` (" . implode(', ', $fields) . ") VALUES (" . implode(', ', $values) . ")";
                                
                                    try {
                                        q($insertQuery);
                                        $totalImported++;
                                        // Логируем прогресс каждые 500 отзывов
                                        if ($totalImported % 500 == 0) {
                                            $writeLog("Импортировано: {$totalImported}");
                                        }
                                    } catch (Exception $e) {
                                        $totalSkipped++;
                                        // Логируем только первые 5 ошибок
                                        if ($totalSkipped <= 5) {
                                            $writeLog("ОШИБКА при вставке отзыва: " . $e->getMessage());
                                        }
                                    }
                            }
                            
                        } catch (Exception $e) {
                            $totalSkipped++;
                            // Логируем только первые 5 ошибок
                            if ($totalSkipped <= 5) {
                                $writeLog("ОШИБКА при обработке отзыва: " . $e->getMessage());
                            }
                            continue;
                        }
                    }
                    
                    // Сохраняем прогресс импорта в таблицу лога после успешной обработки страницы
                    // Обновляем или вставляем запись с текущим last_id и номером страницы
                    $savedLastId = isset($response['last_id']) && !empty($response['last_id']) ? $response['last_id'] : null;
                    
                    // Проверяем, есть ли уже запись в логе
                    $existingLog = row("SELECT id FROM import_reviews_log LIMIT 1");
                    if ($existingLog) {
                        // Обновляем существующую запись
                        if ($savedLastId) {
                            q("UPDATE import_reviews_log SET 
                                last_id = '" . noSQL($savedLastId) . "',
                                page_number = " . intval($pageNumber) . ",
                                imported_count = " . intval($totalImported) . "
                                WHERE id = " . intval($existingLog['id']));
                        } else {
                            q("UPDATE import_reviews_log SET 
                                last_id = NULL,
                                page_number = " . intval($pageNumber) . ",
                                imported_count = " . intval($totalImported) . "
                                WHERE id = " . intval($existingLog['id']));
                        }
                    } else {
                        // Вставляем новую запись
                        if ($savedLastId) {
                            q("INSERT INTO import_reviews_log (last_id, page_number, imported_count) VALUES 
                                ('" . noSQL($savedLastId) . "', " . intval($pageNumber) . ", " . intval($totalImported) . ")");
                        } else {
                            q("INSERT INTO import_reviews_log (last_id, page_number, imported_count) VALUES 
                                (NULL, " . intval($pageNumber) . ", " . intval($totalImported) . ")");
                        }
                    }
                    
                    // Проверяем, есть ли еще страницы
                    // API использует last_id и has_next для пагинации
                    if (isset($response['has_next']) && $response['has_next'] == true) {
                        // Обновляем last_id для следующего запроса
                        if (isset($response['last_id']) && !empty($response['last_id'])) {
                            $lastId = $response['last_id'];
                            // Небольшая задержка между запросами
                            usleep(500000); // 0.5 секунды
                        } else {
                            $hasMore = false;
                        }
                    } else {
                        $hasMore = false;
                        // Импорт завершен, очищаем лог
                        q("TRUNCATE TABLE import_reviews_log");
                    }
                    
                } catch (Exception $e) {
                    $writeLog("ОШИБКА при обработке страницы #{$pageNumber}: " . $e->getMessage());
                    $hasMore = false;
                }
            }
            
            $writeLog("=== Импорт отзывов завершен ===");
            $writeLog("Всего импортировано отзывов: {$totalImported}");
            $writeLog("Всего пропущено: {$totalSkipped}");
            $writeLog("Обработано страниц: {$pageNumber}");
            
            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            // Отправляем JSON ответ
            $responseData = [
                'success' => true,
                'message' => "Импорт отзывов завершен. Импортировано отзывов: {$totalImported}",
                'count' => $totalImported,
                'skipped' => $totalSkipped,
                'pages' => $pageNumber,
                'log_file' => basename($logFile)
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ и закрываем соединение
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
            
        } catch (Exception $e) {
            $writeLog("КРИТИЧЕСКАЯ ОШИБКА при импорте отзывов: " . $e->getMessage());
            $writeLog("Stack trace: " . $e->getTraceAsString());
            
            // Очищаем буфер перед отправкой ответа
            while (ob_get_level() > 0) {
                ob_end_clean();
            }
            
            $responseData = [
                'success' => false,
                'message' => 'Ошибка при импорте отзывов: ' . $e->getMessage(),
                'log_file' => isset($logFile) ? basename($logFile) : null
            ];
            
            echo json_encode($responseData);
            
            // Принудительно отправляем ответ
            if (function_exists('fastcgi_finish_request')) {
                fastcgi_finish_request();
            } else {
                if (ob_get_level() > 0) {
                    ob_end_flush();
                }
                flush();
            }
        }
    }
    
    /**
     * Импорт изображений из таблицы o_images
     * Скачивает изображения по URL и сохраняет их в папки /o_images/{product_id}/
     */
    private function import_images()
    {
        // Увеличиваем лимит времени выполнения для импорта
        set_time_limit(0);
        ignore_user_abort(true);
        
        // Очищаем буфер вывода перед JSON
        while (ob_get_level() > 0) {
            ob_end_clean();
        }
        
        header('Content-Type: application/json');
        
        // Создаем файл лога для этого импорта
        $logDir = $_SERVER['DOCUMENT_ROOT'] . '/upload/logs/';
        if (!is_dir($logDir)) {
            mkdir($logDir, 0755, true);
        }
        $logFile = $logDir . 'ozon_import_images_log_' . date('Y-m-d_H-i-s') . '_' . session_id() . '.txt';
        $this->logFile = $logFile;
        
        $this->writeLog = function($message) use ($logFile) {
            $timestamp = date('Y-m-d H:i:s');
            $logMessage = "[$timestamp] $message\n";
            file_put_contents($logFile, $logMessage, FILE_APPEND);
        };
        
        $log = $this->writeLog;
        $log("=== Начало импорта изображений ===");
        
        try {
            // Получаем все записи из o_images
            $images = rows("SELECT product_id, image_url, image_order FROM o_images ORDER BY product_id, image_order ASC");
            
            if (empty($images)) {
                $log("Нет изображений для импорта");
                echo json_encode([
                    'success' => false,
                    'message' => 'Нет изображений для импорта',
                    'log_file' => basename($logFile)
                ]);
                return;
            }
            
            $log("Найдено изображений: " . count($images));
            
            // Создаем базовую папку для изображений
            $baseDir = $_SERVER['DOCUMENT_ROOT'] . '/o_images/';
            if (!is_dir($baseDir)) {
                mkdir($baseDir, 0755, true);
                $log("Создана базовая папка: $baseDir");
            }
            
            $processed = 0;
            $success_count = 0;
            $error_count = 0;
            $current_product_id = null;
            
            foreach ($images as $image) {
                $product_id = $image['product_id'];
                $image_url = $image['image_url'];
                $image_order = $image['image_order'];
                
                // Создаем папку для product_id, если она еще не создана
                if ($current_product_id !== $product_id) {
                    $productDir = $baseDir . $product_id . '/';
                    if (!is_dir($productDir)) {
                        mkdir($productDir, 0755, true);
                        $log("Создана папка для product_id: $product_id");
                    }
                    $current_product_id = $product_id;
                }
                
                $processed++;
                
                // Проверяем, существует ли уже файл
                $filePath = $baseDir . $product_id . '/' . $image_order . '.jpg';
                if (file_exists($filePath)) {
                    $log("Файл уже существует, пропускаем: $filePath");
                    $success_count++;
                    continue;
                }
                
                // Скачиваем изображение
                $log("Скачивание изображения: product_id=$product_id, order=$image_order, url=$image_url");
                
                $ch = curl_init($image_url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
                curl_setopt($ch, CURLOPT_TIMEOUT, 30);
                curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36');
                
                $imageData = curl_exec($ch);
                $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                $error = curl_error($ch);
                curl_close($ch);
                
                if ($httpCode !== 200 || $imageData === false || !empty($error)) {
                    $error_count++;
                    $log("Ошибка скачивания изображения: product_id=$product_id, order=$image_order, HTTP=$httpCode, error=$error");
                    continue;
                }
                
                // Проверяем, что это действительно изображение
                $imageInfo = @getimagesizefromstring($imageData);
                if ($imageInfo === false) {
                    $error_count++;
                    $log("Ошибка: загруженные данные не являются изображением: product_id=$product_id, order=$image_order");
                    continue;
                }
                
                // Сохраняем изображение
                $saved = file_put_contents($filePath, $imageData);
                
                if ($saved === false) {
                    $error_count++;
                    $log("Ошибка сохранения файла: $filePath");
                    continue;
                }
                
                $success_count++;
                $log("Успешно сохранено: $filePath (размер: " . number_format($saved) . " байт)");
                
                // Выводим прогресс каждые 10 изображений
                if ($processed % 10 == 0) {
                    $log("Прогресс: обработано $processed из " . count($images) . ", успешно: $success_count, ошибок: $error_count");
                }
            }
            
            $log("=== Импорт завершен ===");
            $log("Всего обработано: $processed");
            $log("Успешно загружено: $success_count");
            $log("Ошибок: $error_count");
            
            echo json_encode([
                'success' => true,
                'message' => "Импорт изображений завершен. Обработано: $processed, успешно: $success_count, ошибок: $error_count",
                'processed' => $processed,
                'success_count' => $success_count,
                'error_count' => $error_count,
                'log_file' => basename($logFile)
            ]);
            
        } catch (Exception $e) {
            $log("КРИТИЧЕСКАЯ ОШИБКА: " . $e->getMessage());
            $log("Трассировка: " . $e->getTraceAsString());
            
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка при импорте изображений: ' . $e->getMessage(),
                'log_file' => basename($logFile)
            ]);
        }
    }
}

