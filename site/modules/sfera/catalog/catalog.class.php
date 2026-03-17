<?php

class catalog extends aModule
{
    function execute($arr = array())
    {
        // Пока статические данные — для быстрого старта
        // Позже замени на запрос к БД через site/libs/mysql.php
        $goods = [
            [
                'id'        => 1,
                'name'      => 'Ray-Ban RB2132 New Wayfarer',
                'brand'     => 'Ray-Ban',
                'price'     => 8990,
                'old_price' => 11990,
                'image'     => '/assets/images/goods/rayban-wayfarer.jpg',
                'color'     => 'чёрный / зелёный',
                'stock'     => true,
            ],
            [
                'id'        => 2,
                'name'      => 'Oakley Frogskins XS',
                'brand'     => 'Oakley',
                'price'     => 7500,
                'old_price' => 0,
                'image'     => '/assets/images/goods/oakley-frogskins.jpg',
                'color'     => 'матовый чёрный',
                'stock'     => true,
            ],
            [
                'id'        => 3,
                'name'      => 'Lindberg Air Titanium Rim',
                'brand'     => 'Lindberg',
                'price'     => 24500,
                'old_price' => 0,
                'image'     => '/assets/images/goods/lindberg-air.jpg',
                'color'     => 'титан серебро',
                'stock'     => false,
            ],
            // добавь ещё 6–9 карточек для теста
        ];

        $_SESSION['smarty']->assign('goods', $goods);
        $_SESSION['smarty']->assign('page_title', 'Каталог оправ — Визус Оптика');

        return $_SESSION['smarty']->fetch('catalog/list.tpl');
    }
}