<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class desktop extends aModule
{
    /**
     * Главный модуль админ-панели (Desktop интерфейс)
     */
    function execute($arr)
    {
        // Проверка авторизации
        if (!isset($_SESSION['admin_user'])) {
            header('Location: /admin/');
            exit;
        }
        
        $session_name = $_SESSION['session_name'];
        
        // Обработка выхода
        if (isset($arr['action']) && $arr['action'] == 'logout') {
            unset($_SESSION['admin_user']);
            header('Location: /admin/');
            exit;
        }
        
        // Передаем данные пользователя в шаблон
        $_SESSION['smarty']->assign('admin_user', $_SESSION['admin_user']);
        
        // Проверяем права доступа к модулям
        $moduleAccess = [
            'banners' => ACL::hasModuleAccess('banners'),
            'wholesaler_banners' => ACL::hasModuleAccess('wholesaler_banners'),
            'permissions' => ACL::hasModuleAccess('permissions'),
            'users' => ACL::hasModuleAccess('users'),
            'products' => ACL::hasModuleAccess('products'),
            'import' => ACL::hasModuleAccess('import'),
            'menu' => ACL::hasModuleAccess('menu'),
            'ozon_import' => ACL::hasModuleAccess('ozon_import'),
            'yandex_import' => ACL::hasModuleAccess('yandex_import')
        ];
        $_SESSION['smarty']->assign('moduleAccess', $moduleAccess);
        
        // Выводим desktop интерфейс
        print ($_SESSION['smarty']->fetch('admin/desktop/desktop.tpl'));
    }
}

