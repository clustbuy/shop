<?php 
include_once('site/classes/aModule.class.php');

class product_carousel extends aModule
{
    /**
     * Карусель товаров
     * Выполняет отображение мини-карусели с товарами (верхняя правая часть)
     * Показывает 3 случайных товара из базы данных
     */
    function execute($arr)
    {
        // Получаем параметры из сессии
        $session_name = $_SESSION['session_name'];
        
        // Получаем 3 случайных товара из базы данных с ценами
        $query = "SELECT p.id, p.name, p.picture, pr.price as product_price
                  FROM products p
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE p.is_new = 1 
                  ORDER BY RAND()
                  LIMIT 3";
        
        $result = rows($query);
        
        // Преобразуем результаты в формат, ожидаемый шаблоном
        $products = array();
        foreach ($result as $row) {
            // Получаем изображение из поля picture
            $image = !empty($row['picture']) ? $row['picture'] : '';
            
            // Форматируем цену
            $price = isset($row['product_price']) && $row['product_price'] > 0 
                ? number_format(round($row['product_price']), 0, ',', ' ') . ' ₽'
                : 'Цена не указана';
            
            $products[] = array(
                'image' => $image,
                'title' => isset($row['name']) ? $row['name'] : 'Товар без названия',
                'price' => $price,
                'link' => '/product/' . $row['id'] . '/'
            );
        }
        
        // Если товаров нет в БД, используем заглушку
        if (empty($products)) {
            $products = array(
                array(
                    'image' => '/assets/sfera/img/placeholder.jpg',
                    'title' => 'Товары не найдены',
                    'price' => '—',
                    'link' => '/catalog/'
                )
            );
        }
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('products', $products);
        $_SESSION['smarty']->assign('carousel_id', 'product');
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/product_carousel/product_carousel.tpl'));
    }
}

