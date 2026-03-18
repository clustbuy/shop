<?php
include_once('site/classes/aModule.class.php');

class profile extends aModule
{
    function execute($arr)
    {
        $session_name = 'profile_' . time();
        $_SESSION[$session_name] = $arr;
        
        // Обработка AJAX-запросов
        if (isset($_POST['action'])) {
            $this->handleAjax();
            return;
        }
        
        // Получение ID пользователя
        $user_id = $this->getUserId();
        
        // Получение данных пользователя (если авторизован)
        $userData = null;
        if ($user_id) {
            $userData = $this->getUserData($user_id);
        }
        
        // Передача данных в шаблон
        $_SESSION['smarty']->assign('user', $userData);
        $_SESSION['smarty']->assign('is_logged_in', !empty($user_id));
        
        print($_SESSION['smarty']->fetch('sfera/profile/profile.tpl'));
    }
    
    // Получение ID пользователя из разных источников
    private function getUserId()
    {
        // Вариант 1: прямой user_id
        if (isset($_SESSION['user_id'])) {
            return $_SESSION['user_id'];
        }
        
        // Вариант 2: через auth_user
        if (isset($_SESSION['auth_user']['phone'])) {
            $phone = $_SESSION['auth_user']['phone'];
            return $this->getUserIdByPhone($phone);
        }
        
        // Вариант 3: через cart
        if (isset($_SESSION['cart']['user']['phone'])) {
            $phone = $_SESSION['cart']['user']['phone'];
            return $this->getUserIdByPhone($phone);
        }
        
        return null;
    }
    
    // Получение ID по номеру телефона
    private function getUserIdByPhone($phone)
    {
        $db = $this->getDb();
        $phone = mysqli_real_escape_string($db, $phone);
        
        $query = "SELECT id FROM users WHERE phone = '$phone' LIMIT 1";
        $result = mysqli_query($db, $query);
        
        if ($result && mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            return $row['id'];
        }
        
        return null;
    }
    
    private function getUserData($user_id)
    {
        $db = $this->getDb();
        $user_id = mysqli_real_escape_string($db, $user_id);
        
        $query = "SELECT * FROM users WHERE id = '$user_id' LIMIT 1";
        $result = mysqli_query($db, $query);
        
        if ($result && mysqli_num_rows($result) > 0) {
            return mysqli_fetch_assoc($result);
        }
        
        return null;
    }
    
    private function handleAjax()
    {
        header('Content-Type: application/json');
        
        $user_id = $this->getUserId();
        if (!$user_id) {
            echo json_encode(['success' => false, 'message' => 'Не авторизован']);
            exit;
        }
        
        $action = $_POST['action'];
        
        switch ($action) {
            case 'save_personal':
                $this->savePersonalData($user_id);
                break;
            case 'save_contact':
                $this->saveContactData($user_id);
                break;
            case 'save_address':
                $this->saveAddressData($user_id);
                break;
            default:
                echo json_encode(['success' => false, 'message' => 'Неизвестное действие']);
        }
        
        exit;
    }
    
    private function savePersonalData($user_id)
    {
        $db = $this->getDb();
        $user_id = mysqli_real_escape_string($db, $user_id);
        
        $first_name = isset($_POST['first_name']) ? mysqli_real_escape_string($db, trim($_POST['first_name'])) : '';
        $last_name = isset($_POST['last_name']) ? mysqli_real_escape_string($db, trim($_POST['last_name'])) : '';
        $middle_name = isset($_POST['middle_name']) ? mysqli_real_escape_string($db, trim($_POST['middle_name'])) : '';
        $birth_date = isset($_POST['birth_date']) ? mysqli_real_escape_string($db, $_POST['birth_date']) : NULL;
        $gender = isset($_POST['gender']) ? mysqli_real_escape_string($db, $_POST['gender']) : NULL;
        
        $query = "UPDATE users SET 
                  first_name = '$first_name',
                  last_name = '$last_name',
                  middle_name = '$middle_name',
                  birth_date = " . ($birth_date ? "'$birth_date'" : "NULL") . ",
                  gender = " . ($gender ? "'$gender'" : "NULL") . "
                  WHERE id = '$user_id'";
        
        $result = mysqli_query($db, $query);
        
        if ($result) {
            echo json_encode(['success' => true, 'message' => 'Личные данные сохранены']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка сохранения: ' . mysqli_error($db)]);
        }
    }
    
    private function saveContactData($user_id)
    {
        $db = $this->getDb();
        $user_id = mysqli_real_escape_string($db, $user_id);
        
        $email = isset($_POST['email']) ? mysqli_real_escape_string($db, trim($_POST['email'])) : '';
        $phone = isset($_POST['phone']) ? mysqli_real_escape_string($db, trim($_POST['phone'])) : '';
        
        if (!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo json_encode(['success' => false, 'message' => 'Неправильный формат email']);
            return;
        }
        
        $query = "UPDATE users SET 
                  email = " . ($email ? "'$email'" : "NULL") . ",
                  phone = " . ($phone ? "'$phone'" : "NULL") . "
                  WHERE id = '$user_id'";
        
        $result = mysqli_query($db, $query);
        
        if ($result) {
            echo json_encode(['success' => true, 'message' => 'Контактные данные сохранены']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка сохранения: ' . mysqli_error($db)]);
        }
    }
    
    private function saveAddressData($user_id)
    {
        $db = $this->getDb();
        $user_id = mysqli_real_escape_string($db, $user_id);
        
        $address = isset($_POST['address']) ? mysqli_real_escape_string($db, trim($_POST['address'])) : '';
        $city = isset($_POST['city']) ? mysqli_real_escape_string($db, trim($_POST['city'])) : '';
        $postal_code = isset($_POST['postal_code']) ? mysqli_real_escape_string($db, trim($_POST['postal_code'])) : '';
        
        $query = "UPDATE users SET 
                  address = " . ($address ? "'$address'" : "NULL") . ",
                  city = " . ($city ? "'$city'" : "NULL") . ",
                  postal_code = " . ($postal_code ? "'$postal_code'" : "NULL") . "
                  WHERE id = '$user_id'";
        
        $result = mysqli_query($db, $query);
        
        if ($result) {
            echo json_encode(['success' => true, 'message' => 'Адрес сохранен']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка сохранения: ' . mysqli_error($db)]);
        }
    }
    
    private function getDb()
    {
        static $conn = null;
        
        if ($conn === null) {
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
        }
        
        return $conn;
    }
}
