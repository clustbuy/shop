<?php 
include_once('site/classes/aModule.class.php');

class popular_categories extends aModule
{
    /**
     * Блок популярных категорий для главной страницы
     * Загружает данные из таблицы popular_categories
     */
    function execute($arr)
    {
        // Получаем популярные категории из БД
        $query = "SELECT pc.id, pc.category_id, pc.sort, pc.image, 
                         t.name as title, t.id as guid
                  FROM popular_categories pc
                  LEFT JOIN tree t ON pc.category_id = t.id
                  WHERE pc.active = 1
                  ORDER BY pc.sort ASC";
        
        $categories = rows($query);
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('categories', $categories);
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/popular_categories/popular_categories.tpl'));
    }
}

