<?php 
include_once('site/classes/aModule.class.php');

class login extends aModule
{
    function execute($arr)
    {
        $_SESSION['smarty']->assign('title', 'Вход в аккаунт');
        
        // Если пользователь уже авторизован, перенаправляем в профиль
        if (isset($_SESSION['auth_user'])) {
            header('Location: /profile');
            exit;
        }
        
        print ($_SESSION['smarty']->fetch('sfera/login/login.tpl'));
    }
}
