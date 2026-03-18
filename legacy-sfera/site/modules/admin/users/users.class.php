<?php 
include_once('site/classes/aModule.class.php');

class users extends aModule
{
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
        
        $action = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';
        
        switch ($action) {
            case 'list':
                $this->listUsers();
                break;
                
            case 'add':
                $this->addUser();
                break;
                
            case 'edit':
                $this->editUser();
                break;
                
            case 'delete':
                $this->deleteUser();
                break;
                
            case 'toggle_active':
                $this->toggleActive();
                break;
                
            case 'change_password':
                $this->changePassword();
                break;
                
            default:
                $this->listUsers();
                break;
        }
    }
    
    private function listUsers()
    {
        $users = rows("SELECT id, login, name, email, role, active, created_at FROM admin_users ORDER BY id");
        
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode([
            'success' => true,
            'data' => $users,
            'total' => count($users)
        ]);
        exit;
    }
    
    private function addUser()
    {
        $login = noSQL($_REQUEST['login']);
        $password = $_REQUEST['password'];
        $name = noSQL($_REQUEST['name']);
        $email = noSQL($_REQUEST['email']);
        $role = noSQL($_REQUEST['role']);
        $active = isset($_REQUEST['active']) ? 1 : 0;
        
        // Проверка обязательных полей
        if (empty($login) || empty($password) || empty($name)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Заполните все обязательные поля'
            ]);
            exit;
        }
        
        // Проверка уникальности логина
        $existing = row("SELECT id FROM admin_users WHERE login = '$login'");
        if ($existing) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Пользователь с таким логином уже существует'
            ]);
            exit;
        }
        
        // Хеширование пароля
        $password_hash = password_hash($password, PASSWORD_DEFAULT);
        
        // Добавление пользователя
        $query = "INSERT INTO admin_users (login, password, name, email, role, active, created_at) 
                  VALUES ('$login', '$password_hash', '$name', '$email', '$role', $active, NOW())";
        
        if (q($query)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => true,
                'message' => 'Пользователь успешно добавлен'
            ]);
        } else {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка при добавлении пользователя'
            ]);
        }
        exit;
    }
    
    private function editUser()
    {
        $id = intval($_REQUEST['id']);
        $login = noSQL($_REQUEST['login']);
        $name = noSQL($_REQUEST['name']);
        $email = noSQL($_REQUEST['email']);
        $role = noSQL($_REQUEST['role']);
        $active = isset($_REQUEST['active']) ? 1 : 0;
        
        // Проверка обязательных полей
        if (empty($id) || empty($login) || empty($name)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Заполните все обязательные поля'
            ]);
            exit;
        }
        
        // Проверка уникальности логина (кроме текущего пользователя)
        $existing = row("SELECT id FROM admin_users WHERE login = '$login' AND id != $id");
        if ($existing) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Пользователь с таким логином уже существует'
            ]);
            exit;
        }
        
        // Обновление пользователя
        $query = "UPDATE admin_users 
                  SET login = '$login', name = '$name', email = '$email', role = '$role', active = $active 
                  WHERE id = $id";
        
        if (q($query)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => true,
                'message' => 'Данные пользователя успешно обновлены'
            ]);
        } else {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка при обновлении данных'
            ]);
        }
        exit;
    }
    
    private function deleteUser()
    {
        $id = intval($_REQUEST['id']);
        
        // Проверка, что это не текущий пользователь
        if ($id == $_SESSION['admin_user_id']) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Нельзя удалить самого себя'
            ]);
            exit;
        }
        
        // Удаление пользователя
        $query = "DELETE FROM admin_users WHERE id = $id";
        
        if (q($query)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => true,
                'message' => 'Пользователь успешно удален'
            ]);
        } else {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка при удалении пользователя'
            ]);
        }
        exit;
    }
    
    private function toggleActive()
    {
        $id = intval($_REQUEST['id']);
        $active = intval($_REQUEST['active']);
        
        // Проверка, что это не текущий пользователь
        if ($id == $_SESSION['admin_user_id']) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Нельзя заблокировать самого себя'
            ]);
            exit;
        }
        
        // Обновление статуса
        $query = "UPDATE admin_users SET active = $active WHERE id = $id";
        
        if (q($query)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => true,
                'message' => $active ? 'Пользователь активирован' : 'Пользователь заблокирован'
            ]);
        } else {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка при изменении статуса'
            ]);
        }
        exit;
    }
    
    private function changePassword()
    {
        $id = intval($_REQUEST['id']);
        $password = $_REQUEST['password'];
        
        if (empty($password)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Введите новый пароль'
            ]);
            exit;
        }
        
        // Хеширование пароля
        $password_hash = password_hash($password, PASSWORD_DEFAULT);
        
        // Обновление пароля
        $query = "UPDATE admin_users SET password = '$password_hash' WHERE id = $id";
        
        if (q($query)) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => true,
                'message' => 'Пароль успешно изменен'
            ]);
        } else {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка при изменении пароля'
            ]);
        }
        exit;
    }
}

