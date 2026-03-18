<?php 
include_once('site/classes/aModule.class.php');

class promo_carousel extends aModule
{
    /**
     * Карусель промо-акций
     * Выполняет отображение мини-карусели с промо-акциями (нижняя правая часть)
     */
    function execute($arr)
    {
        // Получаем параметры из сессии
        $session_name = $_SESSION['session_name'];
        
        // Здесь будет логика получения промо-акций из БД
        // Пока используем статические данные для демонстрации
        $promos = array(
            array(
                'title' => 'Скидки до 70%',
                'subtitle' => 'На электронику',
                'background' => 'linear-gradient(135deg, #FF0080 0%, #FF1744 100%)',
                'link' => '#'
            ),
            array(
                'title' => 'Доставка',
                'subtitle' => 'Бесплатно от 3000₽',
                'background' => 'linear-gradient(135deg, #00A859 0%, #009951 100%)',
                'link' => '#'
            )
        );
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('promos', $promos);
        $_SESSION['smarty']->assign('carousel_id', 'promo');
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/promo_carousel/promo_carousel.tpl'));
    }
}

