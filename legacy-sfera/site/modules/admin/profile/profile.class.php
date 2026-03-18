<?php 
include_once('site/classes/aModule.class.php');

class profile extends aModule
{
    /**
     * Модуль управления профилем администратора
     */
    function execute($arr)
    {
        // Проверка авторизации
        if (!isset($_SESSION['admin_user'])) {
            header('Location: /admin/');
            exit;
        }
        
        $action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'view';
        $user = $_SESSION['admin_user'];
        
        switch ($action) {
            case 'view':
                $this->show_profile($user);
                break;
                
            case 'change_password':
                $this->change_password($user);
                break;
                
            default:
                $this->show_profile($user);
                break;
        }
    }
    
    /**
     * Показать форму профиля
     */
    private function show_profile($user)
    {
        // Получаем полные данные пользователя из БД
        $query = "SELECT * FROM admin_users WHERE id = " . intval($user['id']);
        $user_data = row($query);
        
        if (empty($user_data)) {
            $_SESSION['smarty']->assign('error', 'Пользователь не найден');
        } else {
            $_SESSION['smarty']->assign('user', $user_data);
        }
        
        // Проверяем сообщения
        $message = isset($_SESSION['profile_message']) ? $_SESSION['profile_message'] : '';
        $message_type = isset($_SESSION['profile_message_type']) ? $_SESSION['profile_message_type'] : '';
        unset($_SESSION['profile_message']);
        unset($_SESSION['profile_message_type']);
        
        $_SESSION['smarty']->assign('message', $message);
        $_SESSION['smarty']->assign('message_type', $message_type);
        
        print ($_SESSION['smarty']->fetch('admin/profile/profile.tpl'));
    }
    
    /**
     * Изменить пароль
     */
    private function change_password($user)
    {
        $current_password = isset($_POST['current_password']) ? trim($_POST['current_password']) : '';
        $new_password = isset($_POST['new_password']) ? trim($_POST['new_password']) : '';
        $confirm_password = isset($_POST['confirm_password']) ? trim($_POST['confirm_password']) : '';
        
        // Валидация
        if (empty($current_password) || empty($new_password) || empty($confirm_password)) {
            $_SESSION['profile_message'] = 'Заполните все поля';
            $_SESSION['profile_message_type'] = 'error';
            header('Location: /admin/profile/');
            exit;
        }
        
        if ($new_password !== $confirm_password) {
            $_SESSION['profile_message'] = 'Новые пароли не совпадают';
            $_SESSION['profile_message_type'] = 'error';
            header('Location: /admin/profile/');
            exit;
        }
        
        if (strlen($new_password) < 6) {
            $_SESSION['profile_message'] = 'Пароль должен содержать минимум 6 символов';
            $_SESSION['profile_message_type'] = 'error';
            header('Location: /admin/profile/');
            exit;
        }
        
        // Проверяем текущий пароль
        $query = "SELECT password FROM admin_users WHERE id = " . intval($user['id']);
        $user_data = row($query);
        
        if (!password_verify($current_password, $user_data['password'])) {
            $_SESSION['profile_message'] = 'Неверный текущий пароль';
            $_SESSION['profile_message_type'] = 'error';
            header('Location: /admin/profile/');
            exit;
        }
        
        // Обновляем пароль
        $new_hash = password_hash($new_password, PASSWORD_DEFAULT);
        $update_query = "UPDATE admin_users 
                         SET password = '" . noSQL($new_hash) . "' 
                         WHERE id = " . intval($user['id']);
        
        q($update_query);
        
        $_SESSION['profile_message'] = 'Пароль успешно изменён';
        $_SESSION['profile_message_type'] = 'success';
        header('Location: /admin/profile/');
        exit;
    }
}

