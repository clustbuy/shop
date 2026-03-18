<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class topic extends aModule
{
    function execute($arr)
    {
        // Получаем ID тематики из GET параметра
        $topic_id = isset($_GET['topic_id']) ? (int)$_GET['topic_id'] : 0;
        
        // Если не нашли в $_GET, пробуем получить из $arr
        if ($topic_id == 0 && isset($arr['send_params']['topic_id'])) {
            $topic_id = (int)$arr['send_params']['topic_id'];
        }
        
        if ($topic_id == 0) {
            // Если ID тематики не указан, перенаправляем на страницу тематик
            header('Location: /topics/');
            die();
        }
        
        // Получаем информацию о тематике из view v_tematika по ID
        $topic_id_safe = (int)$topic_id;
        $topicInfo = row("SELECT 
                            id,
                            value AS name,
                            cnt AS count
                          FROM v_tematika
                          WHERE id = $topic_id_safe
                          LIMIT 1");
        
        if (!$topicInfo) {
            // Тематика не найдена - показываем 404
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получение параметров пагинации
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $limit = 20;
        $offset = ($page - 1) * $limit;
        
        // Получаем название тематики для поиска товаров
        $topic_name_safe = noSQL($topicInfo['name']);
        
        // Получаем все товары этой тематики по названию (так как в attributes хранится название)
        $query = "SELECT DISTINCT p.id, p.name, p.description, p.picture, p.category_id, p.quantity, pr.price as product_price
                  FROM products p
                  INNER JOIN attributes a ON p.id = a.product_id
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE BINARY a.name = 'Тематика'
                    AND BINARY a.value = BINARY '$topic_name_safe'
                  ORDER BY p.name ASC";
        
        // Получаем общее количество товаров
        $totalQuery = "SELECT COUNT(DISTINCT p.id) as total
                       FROM products p
                       INNER JOIN attributes a ON p.id = a.product_id
                       WHERE BINARY a.name = 'Тематика'
                         AND BINARY a.value = BINARY '$topic_name_safe'";
        
        $totalResult = row($totalQuery);
        $total = isset($totalResult['total']) ? (int)$totalResult['total'] : 0;
        
        // Получаем товары с пагинацией
        $productsQuery = $query . " LIMIT $limit OFFSET $offset";
        $products = rows($productsQuery);
        
        // Форматируем данные товаров
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
        
        // Вычисляем пагинацию
        $pages = $total > 0 ? ceil($total / $limit) : 1;
        $startPage = max(1, $page - 2);
        $endPage = min($pages, $page + 2);
        
        // Подготовка данных для шаблона
        $topicData = [
            'id' => intval($topicInfo['id']),
            'name' => $topicInfo['name'],
            'count' => intval($topicInfo['count'])
        ];
        
        $_SESSION['smarty']->assign('topic', $topicData);
        $_SESSION['smarty']->assign('products', $formattedProducts);
        $_SESSION['smarty']->assign('total', $total);
        $_SESSION['smarty']->assign('page', $page);
        $_SESSION['smarty']->assign('pages', $pages);
        $_SESSION['smarty']->assign('startPage', $startPage);
        $_SESSION['smarty']->assign('endPage', $endPage);
        $_SESSION['smarty']->assign('pageTitle', 'Товары тематики: ' . $topicInfo['name']);
        
        // Передаем данные корзины для счетчика
        if (!isset($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        }
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
        
        // Передаем данные избранного для отметки товаров
        if (!isset($_SESSION['favorites']['items'])) {
            $_SESSION['favorites']['items'] = array();
        }
        $_SESSION['smarty']->assign('favorites', $_SESSION['favorites']);
        
        // Проверяем, что шаблон существует
        $templatePath = 'site/modules/sfera/topic/topic.tpl';
        if (!file_exists($templatePath)) {
            die("ERROR: Template not found: $templatePath");
        }
        
        try {
            $_SESSION['smarty']->display('sfera/topic/topic.tpl');
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

