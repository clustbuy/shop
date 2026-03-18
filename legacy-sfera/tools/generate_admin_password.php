<?php
/**
 * Генератор хеша пароля для администратора
 * Использование: php tools/generate_admin_password.php
 */

if ($argc > 1) {
    $password = $argv[1];
} else {
    $password = 'admin123'; // По умолчанию
}

$hash = password_hash($password, PASSWORD_DEFAULT);

echo "\n===========================================\n";
echo "Генератор хеша пароля администратора\n";
echo "===========================================\n\n";

echo "Пароль: {$password}\n";
echo "Хеш:    {$hash}\n\n";

echo "SQL для обновления:\n";
echo "-------------------------------------------\n";
echo "UPDATE admin_users \n";
echo "SET password = '{$hash}' \n";
echo "WHERE login = 'admin';\n";
echo "-------------------------------------------\n\n";

echo "SQL для нового пользователя:\n";
echo "-------------------------------------------\n";
echo "INSERT INTO admin_users (login, password, name, email, role) \n";
echo "VALUES (\n";
echo "    'admin',\n";
echo "    '{$hash}',\n";
echo "    'Администратор',\n";
echo "    'admin@sfera.ru',\n";
echo "    'admin'\n";
echo ");\n";
echo "-------------------------------------------\n\n";

// Проверка хеша
if (password_verify($password, $hash)) {
    echo "✅ Хеш успешно проверен!\n\n";
} else {
    echo "❌ Ошибка проверки хеша!\n\n";
}

