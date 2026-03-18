<?php 
include_once('site/classes/aModule.class.php');

class auth extends aModule
{
    /**
     * Модуль авторизации в админ-панели
     */

    function execute($arr)
    {
        $_SESSION['smarty']->assign('now', now());
        $session_name = $_SESSION['session_name'];

        
        // Получаем action из POST или GET
        $action = isset($_POST['action']) ? $_POST['action'] : (isset($_GET['action']) ? $_GET['action'] : 'form');
        
        switch ($action) {
            case 'form':
                $this->show_form();
                break;
                
            case 'login':
                $this->do_login();
                break;
                
            case 'logout':
                $this->do_logout();
                break;
                
            default:
                $this->show_form();
                break;
        }
    }

    /**
     * Показать форму авторизации
     */
    private function show_form()
    {
        // Передаем возможную ошибку
        $error = isset($_SESSION['admin_login_error']) ? $_SESSION['admin_login_error'] : '';
        unset($_SESSION['admin_login_error']);
        
        $_SESSION['smarty']->assign('error', $error);
        print ($_SESSION['smarty']->fetch('admin/auth/auth.tpl'));
    }
    
    /**
     * Выполнить вход
     */
    private function do_login()
    {
        $login = isset($_POST['login']) ? noSQL(trim($_POST['login'])) : '';
        $password = isset($_POST['password']) ? trim($_POST['password']) : '';
        
        if (empty($login) || empty($password)) {
            $_SESSION['admin_login_error'] = 'Заполните все поля';
            header('Location: /admin/');
            exit;
        }
        
        // Ищем пользователя в БД
        $query = "SELECT * FROM admin_users 
                  WHERE login = '" . $login . "' 
                  AND active = 1 
                  LIMIT 1";
        
        $user = row($query);
        
        if (empty($user)) {
            $_SESSION['admin_login_error'] = 'Неверный логин или пароль';
            header('Location: /admin/');
            exit;
        }
        
        // Проверяем пароль
        if (!password_verify($password, $user['password'])) {
            $_SESSION['admin_login_error'] = 'Неверный логин или пароль';
            header('Location: /admin/');
            exit;
        }
        
        // Авторизация успешна
        $_SESSION['admin_user'] = array(
            'id' => $user['id'],
            'login' => $user['login'],
            'name' => $user['name'],
            'email' => $user['email'],
            'role' => $user['role']
        );
        
        // Обновляем время последнего входа
        $update_query = "UPDATE admin_users 
                         SET last_login = NOW() 
                         WHERE id = " . intval($user['id']);
        q($update_query);
        
        // Перенаправляем в админку
        header('Location: /admin/');
        exit;
    }
    
    /**
     * Выход из системы
     */
    private function do_logout()
    {
        unset($_SESSION['admin_user']);
        header('Location: /admin/');
        exit;
    }
}

