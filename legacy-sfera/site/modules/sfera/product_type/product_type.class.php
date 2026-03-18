<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class product_type extends aModule
{
    function execute($arr)
    {
        $product_type_id = isset($_GET['product_type_id']) ? (int)$_GET['product_type_id'] : 0;
        
        if ($product_type_id == 0 && isset($arr['send_params']['product_type_id'])) {
            $product_type_id = (int)$arr['send_params']['product_type_id'];
        }
        
        if ($product_type_id == 0) {
            header('Location: /product_types/');
            die();
        }
        
        $product_type_id_safe = (int)$product_type_id;
        $productTypeInfo = row("SELECT 
                                id,
                                value AS name,
                                cnt AS count
                              FROM v_tip_tovara
                              WHERE id = $product_type_id_safe
                              LIMIT 1");
        
        if (!$productTypeInfo) {
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $limit = 20;
        $offset = ($page - 1) * $limit;
        
        $product_type_name_safe = noSQL($productTypeInfo['name']);
        
        $query = "SELECT DISTINCT p.id, p.name, p.description, p.picture, p.category_id, p.quantity, pr.price as product_price
                  FROM products p
                  INNER JOIN attributes a ON p.id = a.product_id
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE BINARY a.name = 'Тип товара'
                    AND BINARY a.value = BINARY '$product_type_name_safe'
                  ORDER BY p.name ASC";
        
        $totalQuery = "SELECT COUNT(DISTINCT p.id) as total
                       FROM products p
                       INNER JOIN attributes a ON p.id = a.product_id
                       WHERE BINARY a.name = 'Тип товара'
                         AND BINARY a.value = BINARY '$product_type_name_safe'";
        
        $totalResult = row($totalQuery);
        $total = isset($totalResult['total']) ? (int)$totalResult['total'] : 0;
        
        $productsQuery = $query . " LIMIT $limit OFFSET $offset";
        $products = rows($productsQuery);
        
        $formattedProducts = [];
        if ($products && is_array($products)) {
            foreach ($products as $product) {
                $product_id = isset($product['id']) ? $product['id'] : '';
                
                // Получаем рейтинг и количество отзывов
                $rating_data = $this->getProductRating($product_id);
                
                // Получаем URL изображения через новую функцию
                $image_url = getProductImageUrl($product_id);
                
                $formattedProducts[] = [
                    'id' => $product_id,
                    'name' => isset($product['name']) ? $product['name'] : '',
                    'description' => isset($product['description']) ? $product['description'] : '',
                    'image' => $image_url,
                    'category_id' => isset($product['category_id']) ? $product['category_id'] : '',
                    'price' => isset($product['product_price']) && $product['product_price'] > 0 ? round($product['product_price']) : 0,
                    'quantity' => isset($product['quantity']) ? intval($product['quantity']) : 99,
                    'rating' => $rating_data['rating'],
                    'reviews_count' => $rating_data['reviews_count']
                ];
            }
        }
        
        $pages = $total > 0 ? ceil($total / $limit) : 1;
        $startPage = max(1, $page - 2);
        $endPage = min($pages, $page + 2);
        
        $productTypeData = [
            'id' => intval($productTypeInfo['id']),
            'name' => $productTypeInfo['name'],
            'count' => intval($productTypeInfo['count'])
        ];
        
        $_SESSION['smarty']->assign('product_type', $productTypeData);
        $_SESSION['smarty']->assign('products', $formattedProducts);
        $_SESSION['smarty']->assign('total', $total);
        $_SESSION['smarty']->assign('page', $page);
        $_SESSION['smarty']->assign('pages', $pages);
        $_SESSION['smarty']->assign('startPage', $startPage);
        $_SESSION['smarty']->assign('endPage', $endPage);
        $_SESSION['smarty']->assign('pageTitle', 'Товары типа: ' . $productTypeInfo['name']);
        
        if (!isset($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        }
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
        
        if (!isset($_SESSION['favorites']['items'])) {
            $_SESSION['favorites']['items'] = array();
        }
        $_SESSION['smarty']->assign('favorites', $_SESSION['favorites']);
        
        $templatePath = 'site/modules/sfera/product_type/product_type.tpl';
        if (!file_exists($templatePath)) {
            die("ERROR: Template not found: $templatePath");
        }
        
        try {
            $_SESSION['smarty']->display('sfera/product_type/product_type.tpl');
        } catch (Exception $e) {
            die("ERROR displaying template: " . $e->getMessage());
        }
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

