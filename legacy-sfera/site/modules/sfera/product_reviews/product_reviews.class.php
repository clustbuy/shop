<?php 
include_once('site/classes/aModule.class.php');

class product_reviews extends aModule
{
    /**
     * Блок обзоров продукции для главной страницы
     * Загружает данные из таблицы product_reviews
     */
    function execute($arr)
    {
        // Получаем первые 10 активных обзоров из БД, отсортированных по sort
        $query = "SELECT id, name, title, image, content, parent_id, sort, active
                  FROM product_reviews
                  WHERE active = 1
                  ORDER BY sort ASC
                  LIMIT 10";
        
        $reviews = rows($query);
        
        // Создаем массив с индексами 0-9 для удобного доступа в шаблоне
        $reviews_array = array();
        for ($i = 0; $i < 10; $i++) {
            $reviews_array[$i] = isset($reviews[$i]) ? $reviews[$i] : null;
        }
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('reviews', $reviews_array);
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/product_reviews/product_reviews.tpl'));
    }
}

