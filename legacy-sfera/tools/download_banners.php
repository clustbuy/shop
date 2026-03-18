<?php
/**
 * Скрипт для скачивания баннеров с сайта tc-sfera.ru
 * Использование: php tools/download_banners.php
 */

include_once(__DIR__ . '/../site/libs/mysql.php');
include_once(__DIR__ . '/../site/functions.php');

// Директория для сохранения баннеров
$save_dir = __DIR__ . '/../assets/sfera/img/banners/';

// Создаём директорию если не существует
if (!is_dir($save_dir)) {
    mkdir($save_dir, 0755, true);
    echo "Создана директория: {$save_dir}\n";
}

// Получаем все баннеры из БД
$query = "SELECT id, url, name FROM banners WHERE url LIKE 'https://tc-sfera.ru%' ORDER BY sort ASC";
$banners = rows($query);

if (empty($banners)) {
    echo "Баннеры с внешними URL не найдены в БД\n";
    exit;
}

echo "Найдено баннеров для скачивания: " . count($banners) . "\n\n";

$downloaded = 0;
$errors = 0;

foreach ($banners as $banner) {
    echo "Обработка: {$banner['name']} (ID: {$banner['id']})\n";
    echo "URL: {$banner['url']}\n";
    
    // Определяем расширение файла
    $ext = pathinfo(parse_url($banner['url'], PHP_URL_PATH), PATHINFO_EXTENSION);
    if (empty($ext)) {
        $ext = 'jpg'; // По умолчанию
    }
    
    // Генерируем имя файла
    $filename = 'banner_' . $banner['id'] . '_' . $banner['name'] . '.' . $ext;
    $filename = preg_replace('/[^a-z0-9_\.-]/i', '_', $filename); // Убираем недопустимые символы
    $filepath = $save_dir . $filename;
    
    // Скачиваем файл
    $image_data = @file_get_contents($banner['url']);
    
    if ($image_data === false) {
        echo "  ❌ ОШИБКА: Не удалось скачать\n\n";
        $errors++;
        continue;
    }
    
    // Сохраняем файл
    if (file_put_contents($filepath, $image_data)) {
        echo "  ✅ Сохранён: {$filename}\n";
        
        // Обновляем путь в БД
        $new_url = '/assets/sfera/img/banners/' . $filename;
        $update_query = "UPDATE banners SET url = '" . noSQL($new_url) . "' WHERE id = " . intval($banner['id']);
        q($update_query);
        
        echo "  📝 Обновлён путь в БД: {$new_url}\n\n";
        $downloaded++;
    } else {
        echo "  ❌ ОШИБКА: Не удалось сохранить файл\n\n";
        $errors++;
    }
}

echo "\n===================\n";
echo "Итого:\n";
echo "Скачано успешно: {$downloaded}\n";
echo "Ошибок: {$errors}\n";
echo "===================\n";

if ($downloaded > 0) {
    echo "\n✅ Баннеры скачаны и пути обновлены в БД!\n";
    echo "Очистите кеш Smarty:\n";
    echo "del site\\libs\\smarty\\templates_c\\*.php\n";
}


