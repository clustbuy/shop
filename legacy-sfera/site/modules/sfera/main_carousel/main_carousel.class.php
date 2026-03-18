<?php 
include_once('site/classes/aModule.class.php');

class main_carousel extends aModule
{
    /**
     * Главная карусель баннеров
     * Выполняет отображение основной карусели с баннерами (3/4 ширины экрана)
     * Баннеры загружаются из таблицы sfera.banners
     */
    function execute($arr)
    {
        // Получаем параметры из сессии
        $session_name = $_SESSION['session_name'];
        
        // Получаем баннеры из базы данных, отсортированные по полю sort
        $query = "SELECT id, url, name, title, sort 
                  FROM banners 
                  ORDER BY sort ASC";
        
        $banners = rows($query);
        
        // Если баннеры не найдены в БД, используем заглушку
        if (empty($banners)) {
            $banners = array(
                array(
                    'url' => '/assets/sfera/img/placeholder.jpg',
                    'name' => 'placeholder',
                    'title' => 'Добавьте баннеры в таблицу banners'
                )
            );
        }
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('banners', $banners);
        $_SESSION['smarty']->assign('carousel_id', 'main');
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/main_carousel/main_carousel.tpl'));
    }
}

