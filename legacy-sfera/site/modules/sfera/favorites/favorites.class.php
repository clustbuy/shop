<?php include_once('site/classes/aModule.class.php');

class favorites extends aModule
{
    function add_item($p) {
        error_log('=== add_item to favorites ===');
        error_log('Product ID: ' . $p['product_id']);
        
        $product_id = $p['product_id'];
        
        // Получаем данные товара
        $query = "SELECT p.*, pr.price as cost 
                  FROM products p  
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE p.id = '" . noSQL($product_id) . "'";
        
        error_log('Query: ' . $query);
        $item = row($query);
        
        if (!$item) {
            error_log('ERROR: Product not found with id: ' . $product_id);
            return;
        }
        
        error_log('Product found: ' . $item['name']);
        
        // Добавляем дополнительные поля
        $item['img_url'] = getProductImageUrl($product_id);
        
        // Получаем рейтинг и количество отзывов
        $rating_data = $this->getProductRating($product_id);
        $item['rating'] = $rating_data['rating'];
        $item['reviews_count'] = $rating_data['reviews_count'];
        
        // Сохраняем в избранное
        $_SESSION['favorites']['items'][$product_id] = $item;
        
        error_log('Item added to favorites. Total items: ' . count($_SESSION['favorites']['items']));
    }
    
    function remove_item($p) {
        error_log('=== remove_item from favorites ===');
        error_log('Product ID: ' . $p['product_id']);
        
        if (isset($_SESSION['favorites']['items']) && is_array($_SESSION['favorites']['items'])) {
            if (isset($_SESSION['favorites']['items'][$p['product_id']])) {
                unset($_SESSION['favorites']['items'][$p['product_id']]);
                error_log('Product removed from favorites');
            } else {
                error_log('Product not found in favorites');
            }
        }
    }
    
    function clear_favorites($p) {
        error_log('=== clear_favorites called ===');
        $_SESSION['favorites']['items'] = array();
        error_log('Favorites cleared');
    }
    
    function execute($arr)
    {
        error_log('=== Favorites execute called ===');
        
        // Инициализация избранного если не существует
        if (!isset($_SESSION['favorites'])) {
            $_SESSION['favorites'] = array('items' => array());
            error_log('Favorites initialized');
        }
        
        if (!isset($_SESSION['favorites']['items']) || !is_array($_SESSION['favorites']['items'])) {
            error_log('Initializing favorites items array');
            $_SESSION['favorites']['items'] = array();
        }
        
        $p = $arr['send_params'];
        
        if (isset($p['task']) && strlen($p['task']) > 0)
        {
            error_log('Task: ' . $p['task']);
            
            // Устанавливаем заголовок JSON

            
            try {
                switch ($p['task']) {
                    case 'add_item':          $this->add_item($p);          break;
                    case 'remove_item':       $this->remove_item($p);       break;
                    case 'clear_favorites':   $this->clear_favorites($p);   break;
                    case 'get_favorites':                                   break;
                    default:
                        error_log('Unknown task: ' . $p['task']);
                        echo json_encode(['success' => false, 'message' => 'unknown task']); 
                        die();
                }
                
                // Инициализация корзины
                if (!isset($_SESSION['cart']['items'])) {
                    $_SESSION['cart']['items'] = array();
                }
                
                // Проверяем, какие товары из избранного уже в корзине и добавляем рейтинг
                if (isset($_SESSION['favorites']['items']) && is_array($_SESSION['favorites']['items'])) {
                    foreach ($_SESSION['favorites']['items'] as $productId => &$favoriteItem) {
                        // Проверяем, есть ли этот товар в корзине
                        if (isset($_SESSION['cart']['items'][$productId])) {
                            $favoriteItem['inCart'] = true;
                            $favoriteItem['cartQuantity'] = $_SESSION['cart']['items'][$productId]['product_amount'];
                        } else {
                            $favoriteItem['inCart'] = false;
                            $favoriteItem['cartQuantity'] = 1;
                        }
                        
                        // Получаем рейтинг и количество отзывов
                        $rating_data = $this->getProductRating($productId);
                        $favoriteItem['rating'] = $rating_data['rating'];
                        $favoriteItem['reviews_count'] = $rating_data['reviews_count'];
                    }
                    unset($favoriteItem); // Освобождаем ссылку
                }
                
                // Подсчитываем количество товаров
                $count = count($_SESSION['favorites']['items']);
                $_SESSION['favorites']['count'] = $count;
                
                error_log('Sending favorites response. Items count: ' . $count);
                echo json_encode($_SESSION['favorites']);
                die();
                
            } catch (Exception $e) {
                error_log('ERROR in favorites execute: ' . $e->getMessage());
                echo json_encode(['success' => false, 'error' => $e->getMessage()]);
                die();
            }
        }
        
        // Инициализация корзины
        if (!isset($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        }
        
        // Проверяем, какие товары из избранного уже в корзине и добавляем рейтинг
        if (isset($_SESSION['favorites']['items']) && is_array($_SESSION['favorites']['items'])) {
            foreach ($_SESSION['favorites']['items'] as $productId => &$favoriteItem) {
                // Проверяем, есть ли этот товар в корзине
                if (isset($_SESSION['cart']['items'][$productId])) {
                    $favoriteItem['inCart'] = true;
                    $favoriteItem['cartQuantity'] = $_SESSION['cart']['items'][$productId]['product_amount'];
                    error_log("Product $productId is in cart with quantity: " . $favoriteItem['cartQuantity']);
                } else {
                    $favoriteItem['inCart'] = false;
                    $favoriteItem['cartQuantity'] = 1;
                }
                
                // Получаем рейтинг и количество отзывов
                $rating_data = $this->getProductRating($productId);
                $favoriteItem['rating'] = $rating_data['rating'];
                $favoriteItem['reviews_count'] = $rating_data['reviews_count'];
            }
            unset($favoriteItem); // Освобождаем ссылку
        }
        
        // Передаем данные избранного в шаблон
        $_SESSION['smarty']->assign('favorites', $_SESSION['favorites']);
        error_log('Favorites data assigned to Smarty. Items count: ' . count($_SESSION['favorites']['items']));
        
        // Передаем данные корзины для счетчика
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
        
        $_SESSION['smarty']->display('sfera/favorites/favorites.tpl');
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
?>
