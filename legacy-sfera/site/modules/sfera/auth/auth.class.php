<?php
include_once('site/classes/aModule.class.php');

class auth extends aModule
{
    public function execute($arr): void
    {
        $action = isset($arr['params'][0]) ? $arr['params'][0] : 'login';

        switch ($action) {
            case 'register':
                $this->do_register();
                break;

            case 'logout':
                $this->do_logout();
                break;

            case 'login':
            default:
                // логин либо показ формы
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    $this->do_login();
                } else {
                    $this->show_login_form();
                }
                break;
        }
    }

    private function show_login_form(): void
    {
        $error = $_SESSION['user_login_error'] ?? '';
        unset($_SESSION['user_login_error']);

        $_SESSION['smarty']->assign('error', $error);
        print $_SESSION['smarty']->fetch('sfera/auth/login.tpl');
    }

    private function show_register_form(array $errors = [], array $old = []): void
    {
        $_SESSION['smarty']->assign('errors', $errors);
        $_SESSION['smarty']->assign('old', $old);
        print $_SESSION['smarty']->fetch('sfera/auth/register.tpl');
    }

    private function do_login(): void
    {
        $login    = isset($_POST['login']) ? noSQL(trim($_POST['login'])) : '';
        $password = isset($_POST['password']) ? trim($_POST['password']) : '';

        if ($login === '' || $password === '') {
            $_SESSION['user_login_error'] = 'Заполните все поля';
            header('Location: /login/');
            exit;
        }

        $user = row("
            SELECT * FROM users
            WHERE login = '".$login."' AND active = 1
            LIMIT 1
        ");

        if (empty($user) || !password_verify($password, $user['password'])) {
            $_SESSION['user_login_error'] = 'Неверный логин или пароль';
            header('Location: /login/');
            exit;
        }

        $_SESSION['user'] = [
            'id'    => $user['id'],
            'login' => $user['login'],
            'name'  => $user['name'],
            'email' => $user['email'],
        ];

        q("UPDATE users SET last_login = NOW() WHERE id=".intval($user['id']));
        header('Location: /');
        exit;
    }

    private function do_register(): void
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            $this->show_register_form();
            return;
        }

        $login     = isset($_POST['login']) ? noSQL(trim($_POST['login'])) : '';
        $password  = isset($_POST['password']) ? trim($_POST['password']) : '';
        $password2 = isset($_POST['password2']) ? trim($_POST['password2']) : '';
        $name      = isset($_POST['name']) ? noSQL(trim($_POST['name'])) : '';
        $email     = isset($_POST['email']) ? noSQL(trim($_POST['email'])) : '';

        $errors = [];
        if ($login === '' || $password === '' || $password2 === '') {
            $errors[] = 'Заполните обязательные поля';
        }
        if ($password !== $password2) {
            $errors[] = 'Пароли не совпадают';
        }

        $u = row("SELECT id FROM users WHERE login='".$login."' LIMIT 1");
        if ($u) {
            $errors[] = 'Логин уже занят';
        }

        if ($errors) {
            $this->show_register_form($errors, [
                'login' => $login,
                'name'  => $name,
                'email' => $email,
            ]);
            return;
        }

        $hash = password_hash($password, PASSWORD_DEFAULT);

        q("
            INSERT INTO users (login,password,name,email,active)
            VALUES ('".$login."','".$hash."','".$name."','".$email."',1)
        ");

        $_SESSION['user_login_error'] = 'Аккаунт создан, войдите';
        header('Location: /login/');
        exit;
    }

    private function do_logout(): void
    {
        unset($_SESSION['user']);
        header('Location: /');
        exit;
    }
}
