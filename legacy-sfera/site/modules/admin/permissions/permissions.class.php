<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class permissions extends aModule
{
    function __construct() {
        parent::__construct();
        file_put_contents('permissions_class_load.log', "permissions constructor called\n", FILE_APPEND);
    }
    /**
     * API модуль управления правами доступа
     */
    function execute($arr)
    {
        // ОТЛАДКА: Записываем в файл каждый шаг
        $log_file = 'permissions_debug.log';
        file_put_contents($log_file, "=== START execute() ===\n", FILE_APPEND);
        file_put_contents($log_file, "Time: " . date('Y-m-d H:i:s') . "\n", FILE_APPEND);
        file_put_contents($log_file, "GET: " . print_r($_GET, true) . "\n", FILE_APPEND);
        file_put_contents($log_file, "arr: " . print_r($arr, true) . "\n", FILE_APPEND);
        
        // ВАЖНО: Очищаем весь буфер вывода перед JSON
        while (ob_get_level()) {
            ob_end_clean();
        }
        file_put_contents($log_file, "Buffer cleared\n", FILE_APPEND);
        
        // Проверка авторизации
        if (!isset($_SESSION['admin_user'])) {
            file_put_contents($log_file, "ERROR: Not authorized\n", FILE_APPEND);
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Unauthorized']);
            exit;
        }
        file_put_contents($log_file, "User: " . $_SESSION['admin_user']['login'] . "\n", FILE_APPEND);
        
        // Проверяем существование таблиц ACL
        $tables_check = q("SHOW TABLES LIKE 'admin_roles'");
        if (mysqli_num_rows($tables_check) == 0) {
            file_put_contents($log_file, "ERROR: Tables not found\n", FILE_APPEND);
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false, 
                'message' => 'ACL tables not found. Please run: sql/create_permissions_tables.sql'
            ]);
            exit;
        }
        file_put_contents($log_file, "Tables OK\n", FILE_APPEND);
        
        // Проверка прав доступа (только если роль не admin)
        if ($_SESSION['admin_user']['role'] !== 'admin') {
            if (!ACL::check('users', 'permissions')) {
                file_put_contents($log_file, "ERROR: Access denied\n", FILE_APPEND);
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Access denied: insufficient permissions']);
                exit;
            }
        }
        file_put_contents($log_file, "Permissions OK\n", FILE_APPEND);
        
        $action = isset($_GET['action']) ? $_GET['action'] : 'list_roles';
        file_put_contents($log_file, "Action: $action\n", FILE_APPEND);
        
        switch ($action) {
            case 'list_roles':
                file_put_contents($log_file, "Calling list_roles()\n", FILE_APPEND);
                $this->list_roles();
                break;
                
            case 'list_permissions':
                file_put_contents($log_file, "Calling list_permissions()\n", FILE_APPEND);
                $this->list_permissions();
                break;
                
            case 'get_role_permissions':
                file_put_contents($log_file, "Calling get_role_permissions()\n", FILE_APPEND);
                $this->get_role_permissions();
                break;
                
            case 'save_role_permissions':
                file_put_contents($log_file, "Calling save_role_permissions()\n", FILE_APPEND);
                $this->save_role_permissions();
                break;
                
            case 'list_users':
                file_put_contents($log_file, "Calling list_users()\n", FILE_APPEND);
                $this->list_users();
                break;
                
            case 'update_user_role':
                file_put_contents($log_file, "Calling update_user_role()\n", FILE_APPEND);
                $this->update_user_role();
                break;
                
            case 'get_user_module_access':
                file_put_contents($log_file, "Calling get_user_module_access()\n", FILE_APPEND);
                $this->get_user_module_access();
                break;
                
            case 'save_user_module_access':
                file_put_contents($log_file, "Calling save_user_module_access()\n", FILE_APPEND);
                $this->save_user_module_access();
                break;
                
            default:
                file_put_contents($log_file, "Default: calling list_roles()\n", FILE_APPEND);
                $this->list_roles();
                break;
        }
        
        file_put_contents($log_file, "Before exit\n", FILE_APPEND);
        exit;
    }
    
    /**
     * Список ролей
     */
    private function list_roles()
    {
        $log_file = 'permissions_debug.log';
        file_put_contents($log_file, "=== INSIDE list_roles() ===\n", FILE_APPEND);
        
        header('Content-Type: application/json');
        file_put_contents($log_file, "Header set\n", FILE_APPEND);
        
        $roles = ACL::getRoles();
        file_put_contents($log_file, "Roles fetched: " . count($roles) . "\n", FILE_APPEND);
        file_put_contents($log_file, "Roles data: " . print_r($roles, true) . "\n", FILE_APPEND);
        
        $response = [
            'success' => true,
            'data' => $roles,
            'total' => count($roles)
        ];
        
        $json = json_encode($response);
        file_put_contents($log_file, "JSON created: " . strlen($json) . " bytes\n", FILE_APPEND);
        file_put_contents($log_file, "JSON: $json\n", FILE_APPEND);
        
        echo $json;
        file_put_contents($log_file, "JSON echoed\n", FILE_APPEND);
        file_put_contents($log_file, "=== END list_roles() ===\n\n", FILE_APPEND);
    }
    
    /**
     * Список всех прав
     */
    private function list_permissions()
    {
        header('Content-Type: application/json');
        
        $permissions = ACL::getPermissions();
        
        echo json_encode([
            'success' => true,
            'data' => $permissions,
            'total' => count($permissions)
        ]);
    }
    
    /**
     * Получить права роли
     */
    private function get_role_permissions()
    {
        header('Content-Type: application/json');
        
        $role_id = isset($_GET['role_id']) ? intval($_GET['role_id']) : 0;
        
        if (!$role_id) {
            echo json_encode(['success' => false, 'message' => 'Role ID not specified']);
            return;
        }
        
        // Получаем название роли
        $role = row("SELECT * FROM admin_roles WHERE id = $role_id");
        
        if (!$role) {
            echo json_encode(['success' => false, 'message' => 'Role not found']);
            return;
        }
        
        // Получаем все права с отметкой, какие назначены этой роли
        $permissions = ACL::getRolePermissions($role['name']);
        
        echo json_encode([
            'success' => true,
            'role' => $role,
            'permissions' => $permissions
        ]);
    }
    
    /**
     * Сохранить права роли
     */
    private function save_role_permissions()
    {
        header('Content-Type: application/json');
        
        $data = json_decode(file_get_contents('php://input'), true);
        
        $role_id = isset($data['role_id']) ? intval($data['role_id']) : 0;
        $permissions = isset($data['permissions']) ? $data['permissions'] : [];
        
        if (!$role_id) {
            echo json_encode(['success' => false, 'message' => 'Role ID not specified']);
            return;
        }
        
        // Проверяем, что роль существует и не является admin
        $role = row("SELECT * FROM admin_roles WHERE id = $role_id");
        
        if (!$role) {
            echo json_encode(['success' => false, 'message' => 'Role not found']);
            return;
        }
        
        if ($role['name'] === 'admin') {
            echo json_encode(['success' => false, 'message' => 'Cannot modify admin role permissions']);
            return;
        }
        
        // Сохраняем права
        ACL::setRolePermissions($role_id, $permissions);
        
        echo json_encode([
            'success' => true,
            'message' => 'Permissions updated successfully'
        ]);
    }
    
    /**
     * Список пользователей
     */
    private function list_users()
    {
        $log_file = 'permissions_debug.log';
        file_put_contents($log_file, "=== INSIDE list_users() ===\n", FILE_APPEND);
        
        header('Content-Type: application/json');
        file_put_contents($log_file, "Header set\n", FILE_APPEND);
        
        $query = "
            SELECT au.id, au.login, au.name, au.email, au.role, au.active, au.created_at, au.last_login,
                   ar.title as role_title
            FROM admin_users au
            LEFT JOIN admin_roles ar ON au.role = ar.name
            ORDER BY au.created_at DESC
        ";
        file_put_contents($log_file, "Query: $query\n", FILE_APPEND);
        
        $users = rows($query);
        file_put_contents($log_file, "Users fetched: " . count($users) . "\n", FILE_APPEND);
        
        $response = [
            'success' => true,
            'data' => $users,
            'total' => count($users)
        ];
        
        $json = json_encode($response);
        file_put_contents($log_file, "JSON created: " . strlen($json) . " bytes\n", FILE_APPEND);
        
        echo $json;
        file_put_contents($log_file, "JSON echoed\n", FILE_APPEND);
        file_put_contents($log_file, "=== END list_users() ===\n\n", FILE_APPEND);
    }
    
    /**
     * Обновить роль пользователя
     */
    private function update_user_role()
    {
        header('Content-Type: application/json');
        
        $user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : 0;
        $role = isset($_POST['role']) ? noSQL($_POST['role']) : '';
        
        if (!$user_id || !$role) {
            echo json_encode(['success' => false, 'message' => 'User ID and role are required']);
            return;
        }
        
        // Проверяем, что роль существует
        $role_exists = row("SELECT id FROM admin_roles WHERE name = '$role'");
        
        if (!$role_exists) {
            echo json_encode(['success' => false, 'message' => 'Role not found']);
            return;
        }
        
        // Обновляем роль пользователя
        $query = "UPDATE admin_users SET role = '$role' WHERE id = $user_id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'User role updated successfully'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Failed to update user role'
            ]);
        }
    }
    
    /**
     * Получить индивидуальные права пользователя на модули
     */
    private function get_user_module_access()
    {
        header('Content-Type: application/json');
        
        $user_id = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;
        
        if (!$user_id) {
            echo json_encode(['success' => false, 'message' => 'User ID is required']);
            return;
        }
        
        // Получаем информацию о пользователе
        $user = row("SELECT id, login, name, role FROM admin_users WHERE id = $user_id");
        
        if (!$user) {
            echo json_encode(['success' => false, 'message' => 'User not found']);
            return;
        }
        
        // Получаем список всех модулей
        $modules = ACL::getAvailableModules();
        
        // Получаем индивидуальные настройки пользователя
        $userAccess = ACL::getUserModuleAccess($user_id);
        
        // Получаем права роли для сравнения
        $rolePermissions = ACL::getRolePermissions($user['role']);
        $roleAccess = [];
        foreach ($rolePermissions as $perm) {
            if ($perm['action'] === 'access') {
                $roleAccess[$perm['module']] = (bool)$perm['granted'];
            }
        }
        
        // Формируем результат
        $result = [];
        foreach ($modules as $module) {
            $moduleName = $module['module'];
            $roleHasAccess = isset($roleAccess[$moduleName]) ? $roleAccess[$moduleName] : false;
            $userHasCustom = isset($userAccess[$moduleName]);
            $userHasAccess = $userHasCustom ? $userAccess[$moduleName] : $roleHasAccess;
            
            $result[] = [
                'module' => $moduleName,
                'role_access' => $roleHasAccess,
                'user_access' => $userHasAccess,
                'is_custom' => $userHasCustom
            ];
        }
        
        echo json_encode([
            'success' => true,
            'user' => $user,
            'modules' => $result
        ]);
    }
    
    /**
     * Сохранить индивидуальные права пользователя на модули
     */
    private function save_user_module_access()
    {
        header('Content-Type: application/json');
        
        $user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : 0;
        $modules = isset($_POST['modules']) ? json_decode($_POST['modules'], true) : [];
        
        if (!$user_id) {
            echo json_encode(['success' => false, 'message' => 'User ID is required']);
            return;
        }
        
        if (!is_array($modules)) {
            echo json_encode(['success' => false, 'message' => 'Invalid modules data']);
            return;
        }
        
        // Сохраняем права
        if (ACL::setUserModuleAccess($user_id, $modules)) {
            echo json_encode([
                'success' => true,
                'message' => 'User module access updated successfully'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Failed to update user module access'
            ]);
        }
    }
}

