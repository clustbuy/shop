<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class yandex_import extends aModule
{
    private $logFile = null;
    
    /**
     * Модуль импорта ПВЗ из Яндекс
     */
    function execute($arr)
    {
        // Увеличиваем лимит времени выполнения для импорта
        set_time_limit(0);
        ignore_user_abort(true);
        
        // ВАЖНО: Очищаем весь буфер вывода перед JSON
        while (ob_get_level() > 0) {
            ob_end_clean();
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
        
        $action = isset($_GET['action']) ? $_GET['action'] : 'import_points';
        
        // Проверка прав доступа
        if (!ACL::check('yandex_import', 'execute')) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false, 
                'message' => 'Доступ запрещён: недостаточно прав'
            ]);
            exit;
        }
        
        switch ($action) {
            case 'import_points':
                $this->import_points();
                break;
                
            default:
                break;
        }
        
        exit;
    }
    
    /**
     * Запись в лог
     */
    private function writeLog($message)
    {
        if ($this->logFile) {
            $timestamp = date('Y-m-d H:i:s');
            file_put_contents($this->logFile, "[{$timestamp}] {$message}\n", FILE_APPEND);
        }
    }
    
    /**
     * Импорт ПВЗ из файла response.json
     */
    private function import_points()
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
        $logFile = $logDir . 'yandex_import_points_log_' . date('Y-m-d_H-i-s') . '_' . session_id() . '.txt';
        $this->logFile = $logFile;
        $this->writeLog("Начат импорт ПВЗ из Яндекс.");
        
        // Путь к файлу с данными
        $jsonFile = $_SERVER['DOCUMENT_ROOT'] . '/upload/response.json';
        
        // Проверяем существование файла
        if (!file_exists($jsonFile)) {
            $this->writeLog("ERROR: Файл не найден: {$jsonFile}");
            echo json_encode([
                'success' => false,
                'message' => 'Файл /upload/response.json не найден',
                'log_file' => basename($logFile)
            ]);
            exit;
        }
        
        // Читаем содержимое файла
        $jsonContent = file_get_contents($jsonFile);
        if ($jsonContent === false) {
            $this->writeLog("ERROR: Не удалось прочитать файл: {$jsonFile}");
            echo json_encode([
                'success' => false,
                'message' => 'Не удалось прочитать файл /upload/response.json',
                'log_file' => basename($logFile)
            ]);
            exit;
        }
        
        // Декодируем JSON
        $points = json_decode($jsonContent, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            $this->writeLog("ERROR: Ошибка декодирования JSON: " . json_last_error_msg());
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка декодирования JSON: ' . json_last_error_msg(),
                'log_file' => basename($logFile)
            ]);
            exit;
        }
        
        if (!is_array($points)) {
            $this->writeLog("ERROR: Данные в файле не являются массивом");
            echo json_encode([
                'success' => false,
                'message' => 'Данные в файле не являются массивом',
                'log_file' => basename($logFile)
            ]);
            exit;
        }
        
        $this->writeLog("Найдено записей в файле: " . count($points));
        
        // Устанавливаем кодировку для БД
        q("SET NAMES utf8mb4");
        
        $total_processed = 0;
        $total_inserted = 0;
        $total_updated = 0;
        $total_errors = 0;
        
        // Обрабатываем каждую запись
        foreach ($points as $index => $point) {
            $total_processed++;
            
            try {
                // Извлекаем данные
                $id = isset($point['id']) ? $point['id'] : null;
                $latitude = isset($point['position']['latitude']) ? floatval($point['position']['latitude']) : null;
                $longitude = isset($point['position']['longitude']) ? floatval($point['position']['longitude']) : null;
                
                // Проверяем обязательные поля
                if (empty($id)) {
                    $this->writeLog("ERROR #{$total_processed}: Пропущена запись без ID");
                    $total_errors++;
                    continue;
                }
                
                if ($latitude === null || $longitude === null) {
                    $this->writeLog("ERROR #{$total_processed}: Пропущена запись без координат (ID: {$id})");
                    $total_errors++;
                    continue;
                }
                
                // Кодируем всю запись в JSON для поля json
                $jsonData = json_encode($point, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                if (json_last_error() !== JSON_ERROR_NONE) {
                    $this->writeLog("ERROR #{$total_processed}: Ошибка кодирования JSON для записи (ID: {$id}): " . json_last_error_msg());
                    $total_errors++;
                    continue;
                }
                
                // Проверяем, существует ли уже запись с таким ID
                $existing = row("SELECT id FROM points WHERE id = '" . noSQL($id) . "' LIMIT 1");
                
                if ($existing) {
                    // Обновляем существующую запись
                    $sql = "UPDATE points SET 
                            la = " . ($latitude !== null ? floatval($latitude) : "NULL") . ",
                            lo = " . ($longitude !== null ? floatval($longitude) : "NULL") . ",
                            json = '" . noSQL($jsonData) . "'
                            WHERE id = '" . noSQL($id) . "'";
                    
                    q($sql);
                    $total_updated++;
                    $this->writeLog("UPDATED #{$total_processed}: ID={$id}, lat={$latitude}, lon={$longitude}");
                } else {
                    // Вставляем новую запись
                    $sql = "INSERT INTO points (id, la, lo, json) VALUES (
                            '" . noSQL($id) . "',
                            " . ($latitude !== null ? floatval($latitude) : "NULL") . ",
                            " . ($longitude !== null ? floatval($longitude) : "NULL") . ",
                            '" . noSQL($jsonData) . "'
                    )";
                    
                    q($sql);
                    $total_inserted++;
                    $this->writeLog("INSERTED #{$total_processed}: ID={$id}, lat={$latitude}, lon={$longitude}");
                }
                
            } catch (Exception $e) {
                $total_errors++;
                $this->writeLog("ERROR #{$total_processed}: " . $e->getMessage());
            }
            
            // Отправляем прогресс каждые 100 записей
            if ($total_processed % 100 === 0) {
                $this->sendProgress([
                    'processed' => $total_processed,
                    'inserted' => $total_inserted,
                    'updated' => $total_updated,
                    'errors' => $total_errors
                ]);
            }
        }
        
        $this->writeLog("Импорт ПВЗ завершен. Всего обработано: {$total_processed}, добавлено: {$total_inserted}, обновлено: {$total_updated}, ошибок: {$total_errors}.");
        
        echo json_encode([
            'success' => true,
            'message' => 'Импорт ПВЗ завершен успешно.',
            'count' => $total_inserted + $total_updated,
            'inserted' => $total_inserted,
            'updated' => $total_updated,
            'processed' => $total_processed,
            'errors' => $total_errors,
            'log_file' => basename($logFile)
        ]);
        exit;
    }
    
    /**
     * Отправка прогресса (для будущего использования)
     */
    private function sendProgress($data)
    {
        // Можно реализовать отправку прогресса через SSE или WebSocket
        // Пока просто логируем
        if ($this->logFile) {
            $this->writeLog("PROGRESS: " . json_encode($data));
        }
    }
}

