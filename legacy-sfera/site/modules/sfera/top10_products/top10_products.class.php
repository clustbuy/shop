<?php 
include_once('site/classes/aModule.class.php');

class top10_products extends aModule
{
    /**
     * Блок топ-10 товаров для главной страницы
     * Загружает данные из таблицы top10_products
     */
    function execute($arr)
    {
        // Получаем топ-10 товаров из БД с количеством
        $query = "SELECT t.id, t.product_id, t.sort, t.active,
                         p.name as product_name,
                         pr.price as product_price,
                         p.quantity
                  FROM top10_products t
                  LEFT JOIN products p ON BINARY t.product_id = BINARY p.id
                  LEFT JOIN prices pr ON t.product_id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE t.active = 1
                  ORDER BY t.sort ASC
                  LIMIT 10";
        
        $result = rows($query);
        
        // Форматируем данные товаров
        $products = [];
        foreach ($result as $row) {
            $product_id = isset($row['product_id']) ? $row['product_id'] : '';
            
            // Получаем рейтинг и количество отзывов
            $rating_data = $this->getProductRating($product_id);
            
            // Получаем URL изображения через новую функцию
            $image_url = getProductImageUrl($product_id);
            
            $products[] = [
                'id' => isset($row['id']) ? $row['id'] : '',
                'product_id' => $product_id,
                'sort' => isset($row['sort']) ? $row['sort'] : 0,
                'active' => isset($row['active']) ? $row['active'] : 0,
                'product_name' => isset($row['product_name']) ? $row['product_name'] : '',
                'product_price' => isset($row['product_price']) && $row['product_price'] > 0 ? round($row['product_price']) : 0,
                'quantity' => isset($row['quantity']) ? intval($row['quantity']) : 99,
                'rating' => $rating_data['rating'],
                'reviews_count' => $rating_data['reviews_count'],
                'image_url' => $image_url
            ];
        }
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('products', $products);
        
        // Передаем данные корзины для отображения состояния товаров
        if (!isset($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        }
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
        
        // Передаем данные избранного для отметки товаров
        if (!isset($_SESSION['favorites']['items'])) {
            $_SESSION['favorites']['items'] = array();
        }
        $_SESSION['smarty']->assign('favorites', $_SESSION['favorites']);
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/top10_products/top10_products.tpl'));
    }
    
    /**
     * Получить рейтинг и количество отзывов для товара
     */
    private function getProductRating($product_id)
    {
        $product_id_safe = noSQL($product_id);
        
        // Получаем SKU товара из v_products_o_products
        $ozon_product = row("SELECT sku FROM v_products_o_products WHERE offer_id = '$product_id_safe' LIMIT 1");
        
        $rating = 0;
        $reviews_count = 0;
        
        if ($ozon_product && !empty($ozon_product['sku'])) {
            $sku = intval($ozon_product['sku']);
            
            // Получаем средний рейтинг и количество отзывов
            $rating_data = row("SELECT 
                                AVG(rating) as avg_rating,
                                COUNT(*) as total_count
                              FROM o_reviews 
                              WHERE sku = $sku 
                              AND rating IS NOT NULL");
            
            if ($rating_data) {
                $rating = isset($rating_data['avg_rating']) ? round($rating_data['avg_rating'], 1) : 0;
                $reviews_count = isset($rating_data['total_count']) ? intval($rating_data['total_count']) : 0;
            }
        }
        
        return [
            'rating' => $rating,
            'reviews_count' => $reviews_count
        ];
    }
}

