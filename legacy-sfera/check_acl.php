<?php
/**
 * Скрипт для проверки состояния ACL системы
 * Использование: http://localhost/check_acl.php
 */

error_reporting(E_ALL);
session_start();

// Инициализация системы
require 'vendor/autoload.php';
include_once('site/libs/config.php');
require_once('site/libs/smarty/Smarty.class.php');
require_once('site/libs/mysql.php');
include_once('site/functions.php');

// Попытка подключиться к БД, если ещё не подключены
if (!isset($GLOBALS['dbid']) || !$GLOBALS['dbid']) {
    dbconnect();
}

header('Content-Type: text/html; charset=utf-8');

echo "<h1>Проверка ACL системы</h1>";
echo "<style>body { font-family: 'Segoe UI', sans-serif; padding: 20px; } table { border-collapse: collapse; margin: 20px 0; } td, th { border: 1px solid #ddd; padding: 8px; text-align: left; } th { background: #f0f0f0; } .ok { color: green; font-weight: bold; } .error { color: red; font-weight: bold; } code { background: #f5f5f5; padding: 2px 6px; border-radius: 3px; } pre { background: #f5f5f5; padding: 10px; border-radius: 4px; overflow: auto; }</style>";

// Проверка подключения к БД
echo "<h2>1. Подключение к БД</h2>";
if (isset($GLOBALS['dbid']) && $GLOBALS['dbid']) {
    echo "<p class='ok'>✓ Подключено</p>";
    echo "<p>База данных: <code>{$GLOBALS['config']['db_name']}</code></p>";
} else {
    echo "<p class='error'>✗ Не подключено</p>";
    echo "<p>Проверьте настройки в <code>site/libs/config.php</code></p>";
    exit;
}

// Проверка таблиц
echo "<h2>2. Проверка таблиц</h2>";
$tables = ['admin_roles', 'admin_permissions', 'admin_role_permissions', 'admin_users'];
foreach ($tables as $table) {
    $result = q("SHOW TABLES LIKE '$table'");
    if (mysqli_num_rows($result) > 0) {
        $count = row("SELECT COUNT(*) as cnt FROM $table");
        echo "<p class='ok'>✓ Таблица $table существует (записей: {$count['cnt']})</p>";
    } else {
        echo "<p class='error'>✗ Таблица $table НЕ СУЩЕСТВУЕТ</p>";
    }
}

// Проверка ролей
echo "<h2>3. Роли</h2>";
$roles_check = q("SHOW TABLES LIKE 'admin_roles'");
if (mysqli_num_rows($roles_check) > 0) {
    $roles = rows("SELECT * FROM admin_roles");
    if (!empty($roles)) {
        echo "<table><tr><th>ID</th><th>Name</th><th>Title</th><th>Description</th></tr>";
        foreach ($roles as $role) {
            echo "<tr><td>{$role['id']}</td><td>{$role['name']}</td><td>{$role['title']}</td><td>{$role['description']}</td></tr>";
        }
        echo "</table>";
    } else {
        echo "<p class='error'>✗ Роли не найдены</p>";
    }
} else {
    echo "<p class='error'>✗ Таблица admin_roles не существует</p>";
}

// Проверка прав
echo "<h2>4. Права</h2>";
$perms_check = q("SHOW TABLES LIKE 'admin_permissions'");
if (mysqli_num_rows($perms_check) > 0) {
    $perms = rows("SELECT * FROM admin_permissions LIMIT 10");
    if (!empty($perms)) {
        echo "<table><tr><th>ID</th><th>Module</th><th>Action</th><th>Title</th></tr>";
        foreach ($perms as $perm) {
            echo "<tr><td>{$perm['id']}</td><td>{$perm['module']}</td><td>{$perm['action']}</td><td>{$perm['title']}</td></tr>";
        }
        echo "</table>";
        $total = row("SELECT COUNT(*) as cnt FROM admin_permissions");
        echo "<p>Всего прав: {$total['cnt']}</p>";
    } else {
        echo "<p class='error'>✗ Права не найдены</p>";
    }
} else {
    echo "<p class='error'>✗ Таблица admin_permissions не существует</p>";
}

// Проверка пользователей
echo "<h2>5. Пользователи</h2>";
$users = rows("SELECT id, login, name, role, active FROM admin_users");
if (!empty($users)) {
    echo "<table><tr><th>ID</th><th>Login</th><th>Name</th><th>Role</th><th>Active</th></tr>";
    foreach ($users as $user) {
        echo "<tr><td>{$user['id']}</td><td>{$user['login']}</td><td>{$user['name']}</td><td>{$user['role']}</td><td>" . ($user['active'] ? 'Да' : 'Нет') . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "<p class='error'>✗ Пользователи не найдены</p>";
}

// Проверка текущей сессии
echo "<h2>6. Текущая сессия</h2>";
if (isset($_SESSION['admin_user'])) {
    echo "<p class='ok'>✓ Пользователь авторизован</p>";
    echo "<pre>";
    print_r($_SESSION['admin_user']);
    echo "</pre>";
    
    // Подключаем класс ACL только если таблицы существуют
    $tables_exist = true;
    foreach (['admin_roles', 'admin_permissions', 'admin_role_permissions'] as $table) {
        $check = q("SHOW TABLES LIKE '$table'");
        if (mysqli_num_rows($check) == 0) {
            $tables_exist = false;
            break;
        }
    }
    
    if ($tables_exist) {
        include_once('site/classes/ACL.class.php');
        
        // Проверка прав
        echo "<h3>Проверка прав текущего пользователя:</h3>";
        $test_permissions = [
            ['banners', 'view'],
            ['banners', 'edit'],
            ['banners', 'delete'],
            ['users', 'permissions']
        ];
        
        echo "<table><tr><th>Модуль</th><th>Действие</th><th>Разрешено?</th></tr>";
        foreach ($test_permissions as $test) {
            try {
                $allowed = ACL::check($test[0], $test[1]);
                echo "<tr><td>{$test[0]}</td><td>{$test[1]}</td><td>" . ($allowed ? "<span class='ok'>✓ Да</span>" : "<span class='error'>✗ Нет</span>") . "</td></tr>";
            } catch (Exception $e) {
                echo "<tr><td>{$test[0]}</td><td>{$test[1]}</td><td><span class='error'>✗ Ошибка: " . $e->getMessage() . "</span></td></tr>";
            }
        }
        echo "</table>";
    } else {
        echo "<p class='error'>✗ Таблицы ACL не созданы, проверка прав невозможна</p>";
    }
} else {
    echo "<p class='error'>✗ Пользователь не авторизован</p>";
    echo "<p><a href='/admin/'>Войти в админку</a></p>";
}

// Тест API
echo "<h2>7. Тест API</h2>";
if (isset($_SESSION['admin_user'])) {
    echo "<p>Попробуйте открыть:</p>";
    echo "<ul>";
    echo "<li><a href='/admin/permissions/?action=list_roles' target='_blank'>/admin/permissions/?action=list_roles</a></li>";
    echo "<li><a href='/admin/permissions/?action=list_permissions' target='_blank'>/admin/permissions/?action=list_permissions</a></li>";
    echo "<li><a href='/admin/permissions/?action=list_users' target='_blank'>/admin/permissions/?action=list_users</a></li>";
    echo "</ul>";
}

echo "<hr>";
echo "<p><strong>Инструкции:</strong></p>";
echo "<ol>";
echo "<li>Если таблицы не существуют, выполните: <code>mysql -u root -p sfera < sql/create_permissions_tables.sql</code></li>";
echo "<li>Если пользователь не авторизован, <a href='/admin/'>войдите в админку</a></li>";
echo "<li>Если роли/права пусты, выполните SQL скрипт заново</li>";
echo "<li>После исправлений очистите кеш: <code>del site\\libs\\smarty\\templates_c\\*.php</code></li>";
echo "</ol>";

