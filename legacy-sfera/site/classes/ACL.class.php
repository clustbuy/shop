<?php
/**
 * Класс для управления правами доступа (Access Control List)
 */
class ACL
{
    /**
     * Проверяет наличие права у текущего пользователя
     * @param string $module Модуль (banners, wholesaler_banners, menu, pages, users)
     * @param string $action Действие (access, view, create, edit, delete)
     * @return bool
     */
    public static function check($module, $action)
    {
        // Если пользователь не авторизован
        if (!isset($_SESSION['admin_user'])) {
            return false;
        }
        
        $user = $_SESSION['admin_user'];
        
        // Роль admin имеет все права всегда
        if ($user['role'] === 'admin') {
            return true;
        }
        
        // Проверяем право в БД
        $query = "
            SELECT COUNT(*) as has_permission
            FROM admin_role_permissions arp
            JOIN admin_permissions ap ON arp.permission_id = ap.id
            JOIN admin_roles ar ON arp.role_id = ar.id
            WHERE ar.name = '" . noSQL($user['role']) . "'
            AND ap.module = '" . noSQL($module) . "'
            AND ap.action = '" . noSQL($action) . "'
            AND arp.granted = 1
        ";
        
        $result = row($query);
        
        return ($result && $result['has_permission'] > 0);
    }
    
    /**
     * Проверяет доступ к модулю (приложению)
     * Учитывает индивидуальные права пользователя
     * @param string $module Модуль (banners, wholesaler_banners, permissions, users)
     * @return bool
     */
    public static function hasModuleAccess($module)
    {
        // Если пользователь не авторизован
        if (!isset($_SESSION['admin_user'])) {
            return false;
        }
        
        $user = $_SESSION['admin_user'];
        
        // Роль admin имеет все права всегда
        if ($user['role'] === 'admin') {
            return true;
        }
        
        // Проверяем индивидуальные права пользователя
        $user_id = $user['id'];
        $query = "
            SELECT access 
            FROM admin_user_module_access 
            WHERE user_id = " . intval($user_id) . "
            AND module = '" . noSQL($module) . "'
        ";
        
        $userAccess = row($query);
        
        // Если есть индивидуальная настройка - используем её
        if ($userAccess !== false) {
            return (bool)$userAccess['access'];
        }
        
        // Иначе проверяем права роли
        return self::check($module, 'access');
    }
    
    /**
     * Получить все права роли
     * @param string $role_name Название роли
     * @return array
     */
    public static function getRolePermissions($role_name)
    {
        $query = "
            SELECT ap.id, ap.module, ap.action, ap.title, ap.description,
                   IFNULL(arp.granted, 0) as granted
            FROM admin_permissions ap
            LEFT JOIN admin_role_permissions arp ON ap.id = arp.permission_id
                AND arp.role_id = (SELECT id FROM admin_roles WHERE name = '" . noSQL($role_name) . "')
            ORDER BY ap.module, ap.action
        ";
        
        return rows($query);
    }
    
    /**
     * Получить все роли
     * @return array
     */
    public static function getRoles()
    {
        return rows("SELECT * FROM admin_roles ORDER BY name");
    }
    
    /**
     * Получить все права
     * @return array
     */
    public static function getPermissions()
    {
        return rows("SELECT * FROM admin_permissions ORDER BY module, action");
    }
    
    /**
     * Установить права для роли
     * @param int $role_id ID роли
     * @param array $permissions Массив ID прав
     * @return bool
     */
    public static function setRolePermissions($role_id, $permissions)
    {
        // Удаляем старые права
        q("DELETE FROM admin_role_permissions WHERE role_id = " . intval($role_id));
        
        // Добавляем новые
        if (!empty($permissions)) {
            foreach ($permissions as $permission_id) {
                q("INSERT INTO admin_role_permissions (role_id, permission_id, granted) 
                   VALUES (" . intval($role_id) . ", " . intval($permission_id) . ", 1)");
            }
        }
        
        return true;
    }
    
    /**
     * Проверить наличие права с выбросом исключения
     * @param string $module
     * @param string $action
     * @throws Exception
     */
    public static function require($module, $action)
    {
        if (!self::check($module, $action)) {
            throw new Exception('Доступ запрещён: недостаточно прав');
        }
    }
    
    /**
     * Получить индивидуальные права пользователя на модули
     * @param int $user_id ID пользователя
     * @return array Массив ['module' => access]
     */
    public static function getUserModuleAccess($user_id)
    {
        $query = "
            SELECT module, access
            FROM admin_user_module_access
            WHERE user_id = " . intval($user_id) . "
        ";
        
        $rows = rows($query);
        $result = [];
        
        foreach ($rows as $row) {
            $result[$row['module']] = (bool)$row['access'];
        }
        
        return $result;
    }
    
    /**
     * Установить индивидуальные права пользователя на модули
     * @param int $user_id ID пользователя
     * @param array $modules Массив ['module' => access]
     * @return bool
     */
    public static function setUserModuleAccess($user_id, $modules)
    {
        // Удаляем старые настройки
        q("DELETE FROM admin_user_module_access WHERE user_id = " . intval($user_id));
        
        // Добавляем новые
        if (!empty($modules)) {
            foreach ($modules as $module => $access) {
                $access_value = $access ? 1 : 0;
                q("INSERT INTO admin_user_module_access (user_id, module, access) 
                   VALUES (" . intval($user_id) . ", '" . noSQL($module) . "', $access_value)");
            }
        }
        
        return true;
    }
    
    /**
     * Получить список всех модулей с правами доступа
     * @return array
     */
    public static function getAvailableModules()
    {
        $query = "
            SELECT DISTINCT module
            FROM admin_permissions
            WHERE action = 'access'
            ORDER BY module
        ";
        
        return rows($query);
    }
}

