<?php

include_once('site/classes/aModule.class.php');

class catalog extends aModule
{
    function execute($arr = array())
    {
        // Подключаемся к базе данных
        global $db;

        $sql = "SELECT 
                    p.*,
                    b.name as brand_name,
                    c.name as category_name
                FROM products p
                LEFT JOIN brands b ON p.brand_id = b.id
                LEFT JOIN categories c ON p.category_id = c.id
                WHERE p.is_active = 1
                ORDER BY p.created_at DESC, p.price ASC";

        $goods = $db->getAll($sql);

        // Передаём данные в шаблон
        $_SESSION['smarty']->assign('goods', $goods);
        $_SESSION['smarty']->assign('page_title', 'Каталог товаров — Визус Оптика');

        return $_SESSION['smarty']->fetch('catalog/list.tpl');
    }
}