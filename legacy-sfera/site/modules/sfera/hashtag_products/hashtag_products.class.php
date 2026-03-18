<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class hashtag_products extends aModule
{
    function execute($arr)
    {
        // Получаем hashtag_id из URL
        // URL формат: /hashtag/{hashtag_id}/
        $hashtag_id = isset($arr['send_params']['q']) ? trim($arr['send_params']['q'], '/') : '';
        $hashtag_id = str_replace('hashtag/', '', $hashtag_id);
        $hashtag_id = (int)$hashtag_id;
        
        error_log("=== hashtag_products: Hashtag ID from URL: $hashtag_id ===");
        
        if ($hashtag_id <= 0) {
            // Если ID не указан, показываем 404
            error_log("=== hashtag_products: Invalid hashtag_id ===");
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получаем значение хэштега из базы по ID
        $hashtag_query = "SELECT value FROM product_hashtags WHERE id = " . (int)$hashtag_id . " LIMIT 1";
        error_log("=== hashtag_products: Query to get hashtag: $hashtag_query ===");
        
        $hashtag_row = row($hashtag_query);
        $hashtag = isset($hashtag_row['value']) ? $hashtag_row['value'] : '';
        
        error_log("=== hashtag_products: Hashtag value: $hashtag ===");
        
        if (empty($hashtag)) {
            // Если хэштег не найден, показываем 404
            error_log("=== hashtag_products: Hashtag not found for ID: $hashtag_id ===");
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получение параметров пагинации
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        if ($page < 1) $page = 1;
        $limit = 20;
        
        error_log("=== hashtag_products: Pagination - Page: $page, Limit: $limit ===");
        
        // Получение списка товаров с данным хэштегом
        $products = $this->getProducts($page, $limit, $hashtag);
        $total = $this->getProductsCount($hashtag);
        
        // Получение категорий для меню (корневые категории)
        $categories = $this->getCategories(null);
        
        // Вычисление группы страниц (по 5 страниц в группе)
        $pages = $total > 0 ? ceil($total / $limit) : 1;
        $pagesPerGroup = 5;
        $currentGroup = ceil($page / $pagesPerGroup);
        $startPage = ($currentGroup - 1) * $pagesPerGroup + 1;
        $endPage = min($currentGroup * $pagesPerGroup, $pages);
        $nextGroupStart = $endPage + 1;
        $prevGroup = $currentGroup - 1;
        $prevGroupEnd = $prevGroup > 0 ? min($prevGroup * $pagesPerGroup, $pages) : 1;
        
        // Подготовка данных для шаблона
        $_SESSION['smarty']->assign('products', $products);
        $_SESSION['smarty']->assign('categories', $categories);
        $_SESSION['smarty']->assign('category', array('id' => '', 'name' => 'Товары с тегом ' . $hashtag));
        $_SESSION['smarty']->assign('hashtag', $hashtag);
        $_SESSION['smarty']->assign('hashtag_id', $hashtag_id);
        $_SESSION['smarty']->assign('page', $page);
        $_SESSION['smarty']->assign('limit', $limit);
        $_SESSION['smarty']->assign('total', $total);
        $_SESSION['smarty']->assign('pages', $pages);
        $_SESSION['smarty']->assign('startPage', $startPage);
        $_SESSION['smarty']->assign('endPage', $endPage);
        $_SESSION['smarty']->assign('nextGroupStart', $nextGroupStart);
        $_SESSION['smarty']->assign('prevGroupEnd', $prevGroupEnd);
        $_SESSION['smarty']->assign('hasNextGroup', $nextGroupStart <= $pages);
        $_SESSION['smarty']->assign('hasPrevGroup', $currentGroup > 1);
        
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

        // Используем тот же шаблон, что и каталог
        $_SESSION['smarty']->display('sfera/hashtag_products/hashtag_products.tpl');
    }
    
    private function getProducts($page, $limit, $hashtag)
    {
        $offset = ($page - 1) * $limit;
        $hashtag_safe = noSQL($hashtag);
        
        error_log("=== getProducts called ===");
        error_log("Page: $page, Limit: $limit, Offset: $offset");
        error_log("Hashtag: $hashtag");
        
        // Получаем товары через связку v_products_o_products и product_hashtags
        $query = "SELECT DISTINCT p.*, pr.price as product_price, p.quantity
                  FROM product_hashtags ph
                  INNER JOIN v_products_o_products vpo ON ph.product_id = vpo.product_id
                  INNER JOIN products p ON vpo.offer_id = p.id
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE ph.value = '$hashtag_safe'
                  ORDER BY p.name ASC
                  LIMIT $limit OFFSET $offset";
        
        error_log("Products query: $query");
        
        $result = rows($query);
        
        error_log("Found products: " . count($result));
        
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
        
        return $products;
    }
    
    private function getProductsCount($hashtag)
    {
        $hashtag_safe = noSQL($hashtag);
        
        $count_query = "SELECT COUNT(DISTINCT p.id) AS total
                       FROM product_hashtags ph
                       INNER JOIN v_products_o_products vpo ON ph.product_id = vpo.product_id
                       INNER JOIN products p ON vpo.offer_id = p.id
                       WHERE ph.value = '$hashtag_safe'";
        
        error_log("Count query: $count_query");
        
        $result = row($count_query);
        
        $total = isset($result['total']) ? intval($result['total']) : 0;
        error_log("Total products: $total");
        
        return $total;
    }
    
    private function getCategories($parent_id = null)
    {
        if (empty($parent_id)) {
            // Корневые категории
            $where = "(parent_id = '' OR parent_id IS NULL)";
        } else {
            $parent_id_safe = noSQL($parent_id);
            $where = "parent_id = '$parent_id_safe'";
        }
        
        $res = rows("SELECT id, name, parent_id FROM tree WHERE $where ORDER BY name ASC");
        
        $categories = [];
        foreach ($res as $row) {
            $category = [
                'id' => $row['id'],
                'name' => $row['name'],
                'parent_id' => $row['parent_id'],
                'children' => $this->getCategories($row['id'])
            ];
            $categories[] = $category;
        }
        
        return $categories;
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

