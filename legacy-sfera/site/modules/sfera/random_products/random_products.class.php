<?php 
include_once('site/classes/aModule.class.php');

class random_products extends aModule
{
    function execute($arr)
    {
        // Получаем 12 случайных товаров из всего каталога с ценами и количеством
        $query = "SELECT p.*, pr.price as product_price, p.quantity
                  FROM products p
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE is_new = 1 
                  ORDER BY RAND()
                  LIMIT 12";
        
        $result = rows($query);
        
        // Преобразуем результаты в удобный формат
        $products = [];
        foreach ($result as $row) {
            $product_id = $row['id'];
            
            // Получаем рейтинг и количество отзывов
            $rating_data = $this->getProductRating($product_id);
            
            // Получаем URL изображения через новую функцию
            $image_url = getProductImageUrl($product_id);
            
            $products[] = [
                'id' => $product_id,
                'name' => isset($row['name']) ? $row['name'] : '',
                'description' => isset($row['description']) ? $row['description'] : '',
                'image' => $image_url,
                'price' => isset($row['product_price']) && $row['product_price'] > 0 ? round($row['product_price']) : 0,
                'quantity' => isset($row['quantity']) ? intval($row['quantity']) : 99,
                'rating' => $rating_data['rating'],
                'reviews_count' => $rating_data['reviews_count']
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
        print ($_SESSION['smarty']->fetch('sfera/random_products/random_products.tpl'));
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
