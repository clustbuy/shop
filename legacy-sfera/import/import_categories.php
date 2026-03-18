<?php

session_start();
require 'vendor/autoload.php';
include_once('site/libs/config.php');
require_once('site/libs/smarty/Smarty.class.php');
require_once('site/libs/mysql.php');
include_once('site/functions.php');
include_once('site/classes/aModule.class.php');
include_once('site/classes/router.class.php');


$res = rows("SELECT * FROM categories ");

foreach($res as $row){

    $category['id'] = categoryIdToInt($row['id']);
    $category['title'] = $row['name'];
    $category['parent_id'] = categoryIdToInt($row['parent_id']);

    insert('tree', $category);
}

function categoryIdToInt(string $categoryId): int {
    // Удаляем тире из строки
    $cleaned = str_replace('-', '', $categoryId);
    // Убираем ведущие нули
    $trimmed = ltrim($cleaned, '0');
    // Если после удаления нулей ничего не осталось, значит число 0
    if ($trimmed === '') {
        return 0;
    }
    // Преобразуем к целому числу
    return (int)$trimmed;
}
