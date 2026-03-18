<?php
include_once('site/classes/aModule.class.php');

class sms extends aModule
{
    function execute($arr)
    {
        while (ob_get_level()) {
            ob_end_clean();
        }
        ob_start();
        
        header('Content-Type: application/json; charset=utf-8');
        
        $action = isset($arr['params'][0]) ? $arr['params'][0] : '';
        
        if ($action === 'send') {
            $this->sendCode();
        } elseif ($action === 'verify') {
            $this->verifyCode();
        } else {
            echo json_encode(['success' => false, 'message' => 'Неверный запрос']);
        }
        
        ob_end_flush();
        exit;
    }
    
private function getDb()
{
    static $conn = null;
    
    if ($conn === null) {
        // Пробуем разные варианты хоста
        $hosts = ['localhost', '127.0.0.1', 'mariadb-10.4', 'mysql'];
        $user = 'root';
        $pass = '';
        $dbname = 'sfera';
        
        foreach ($hosts as $host) {
            $conn = @mysqli_connect($host, $user, $pass, $dbname);
            if ($conn) {
                mysqli_set_charset($conn, 'utf8mb4');
                break;
            }
        }
        
        if (!$conn) {
            echo json_encode([
                'success' => false, 
                'message' => 'Ошибка подключения к БД. Проверьте параметры в sms.class.php'
            ]);
            die();
        }
    }
    
    return $conn;
}
    
    private function sendCode()
    {
        $db = $this->getDb();
        
        $contact = isset($_POST['contact']) ? $_POST['contact'] : '';
        $type = isset($_POST['type']) ? $_POST['type'] : 'phone';
        
        if (empty($contact)) {
            echo json_encode(['success' => false, 'message' => 'Контакт не передан']);
            return;
        }
        
        // Валидация
        if ($type === 'phone') {
            $contact_clean = preg_replace('/\D/', '', $contact);
            if (strlen($contact_clean) < 11) {
                echo json_encode(['success' => false, 'message' => 'Неправильный номер']);
                return;
            }
        } else {
            $contact_clean = trim($contact);
            if (!filter_var($contact_clean, FILTER_VALIDATE_EMAIL)) {
                echo json_encode(['success' => false, 'message' => 'Неправильный email']);
                return;
            }
        }
        
        // Генерируем код
        $code = str_pad(rand(0, 9999), 4, '0', STR_PAD_LEFT);
        
        // Экранируем
        $contact_escaped = mysqli_real_escape_string($db, $contact_clean);
        $type_escaped = mysqli_real_escape_string($db, $type);
        $code_escaped = mysqli_real_escape_string($db, $code);
        
        // Удаляем старые коды
        if ($type === 'phone') {
            mysqli_query($db, "DELETE FROM sms_codes WHERE phone = '".$contact_escaped."' AND created_at < DATE_SUB(NOW(), INTERVAL 15 MINUTE)");
            $sql = "INSERT INTO sms_codes (phone, type, code, created_at) VALUES ('".$contact_escaped."', '".$type_escaped."', '".$code_escaped."', NOW())";
        } else {
            mysqli_query($db, "DELETE FROM sms_codes WHERE email = '".$contact_escaped."' AND created_at < DATE_SUB(NOW(), INTERVAL 15 MINUTE)");
            $sql = "INSERT INTO sms_codes (email, type, code, created_at) VALUES ('".$contact_escaped."', '".$type_escaped."', '".$code_escaped."', NOW())";
        }
        
        $result = mysqli_query($db, $sql);
        
        if (!$result) {
            echo json_encode(['success' => false, 'message' => 'Ошибка БД: ' . mysqli_error($db)]);
            return;
        }
        
        // Отправка кода
        if ($type === 'email') {
            // Отправка email
            $subject = 'Код подтверждения';
            $message = 'Ваш код подтверждения: ' . $code . "\n\nКод действует 15 минут.";
            $headers = 'From: noreply@sfera.ru' . "\r\n" .
                      'Content-Type: text/plain; charset=UTF-8';
            
            @mail($contact_clean, $subject, $message, $headers);
        }
        
        // Сохраняем в сессию
        $_SESSION['verify_contact'] = $contact_clean;
        $_SESSION['verify_type'] = $type;
        
        // Логируем код (для тестирования)
        error_log("Code for $contact_clean ($type): $code");
        
        echo json_encode([
            'success' => true,
            'message' => 'Код отправлен',
            'debug_code' => $code // ДЛЯ ТЕСТА - уберите в продакшене
        ]);
    }
    
    private function verifyCode()
    {
        $db = $this->getDb();
        
        $code = isset($_POST['code']) ? $_POST['code'] : '';
        $contact = isset($_SESSION['verify_contact']) ? $_SESSION['verify_contact'] : '';
        $type = isset($_SESSION['verify_type']) ? $_SESSION['verify_type'] : 'phone';
        
        if (empty($code)) {
            echo json_encode(['success' => false, 'message' => 'Код не передан']);
            return;
        }
        
        if (empty($contact)) {
            echo json_encode(['success' => false, 'message' => 'Сначала отправьте контакт']);
            return;
        }
        
        $contact_escaped = mysqli_real_escape_string($db, $contact);
        $code_escaped = mysqli_real_escape_string($db, $code);
        
        // Определяем поле для поиска
        $field = ($type === 'phone') ? 'phone' : 'email';
        
        // Ищем код
        $result = mysqli_query($db, "SELECT id FROM sms_codes 
                                     WHERE $field = '".$contact_escaped."' 
                                     AND code = '".$code_escaped."' 
                                     AND type = '".$type."'
                                     AND created_at > DATE_SUB(NOW(), INTERVAL 15 MINUTE) 
                                     ORDER BY id DESC LIMIT 1");
        
        if (!$result || mysqli_num_rows($result) == 0) {
            echo json_encode(['success' => false, 'message' => 'Неверный код или истёк']);
            return;
        }
        
        // Ищем или создаём пользователя
        if ($type === 'phone') {
            $userResult = mysqli_query($db, "SELECT id, phone, email, name FROM users WHERE phone = '".$contact_escaped."' LIMIT 1");
        } else {
            $userResult = mysqli_query($db, "SELECT id, phone, email, name FROM users WHERE email = '".$contact_escaped."' LIMIT 1");
        }
        
        if (mysqli_num_rows($userResult) == 0) {
            // Создаём нового пользователя
            if ($type === 'phone') {
                mysqli_query($db, "INSERT INTO users (phone, created_at) VALUES ('".$contact_escaped."', NOW())");
                $userResult = mysqli_query($db, "SELECT id, phone, email, name FROM users WHERE phone = '".$contact_escaped."' LIMIT 1");
            } else {
                mysqli_query($db, "INSERT INTO users (email, created_at) VALUES ('".$contact_escaped."', NOW())");
                $userResult = mysqli_query($db, "SELECT id, phone, email, name FROM users WHERE email = '".$contact_escaped."' LIMIT 1");
            }
        }
        
        $user = mysqli_fetch_assoc($userResult);
        
        // Авторизуем пользователя
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['auth_user'] = [
            'id' => $user['id'],
            'phone' => $user['phone'],
            'email' => $user['email'],
            'name' => $user['name']
        ];
        
        // Сохраняем в корзину
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }
        
        if (!isset($_SESSION['cart']['user'])) {
            $_SESSION['cart']['user'] = [];
        }
        
        if ($type === 'phone') {
            $_SESSION['cart']['user']['phone'] = $user['phone'];
        } else {
            $_SESSION['cart']['user']['email'] = $user['email'];
        }
        
        // Очищаем временные данные
        unset($_SESSION['verify_contact']);
        unset($_SESSION['verify_type']);
        
        echo json_encode(['success' => true, 'message' => 'Успешно']);
    }
}
