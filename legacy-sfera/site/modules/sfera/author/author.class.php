<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class author extends aModule
{
    function execute($arr)
    {
        // ОТЛАДКА: Выводим информацию о вызове контроллера
        error_log("=== Author controller execute() called ===");
        error_log("GET params: " . print_r($_GET, true));
        error_log("arr params: " . print_r($arr, true));
        
        // Получаем имя автора из GET параметра
        $author_name = isset($_GET['author_name']) ? trim($_GET['author_name']) : '';
        
        // Если не нашли в $_GET, пробуем получить из $arr
        if (empty($author_name) && isset($arr['send_params']['author_name'])) {
            $author_name = trim($arr['send_params']['author_name']);
        }
        
        // Декодируем URL-encoded строку
        if (!empty($author_name)) {
            $author_name = urldecode($author_name);
            // Убеждаемся, что кодировка правильная
            if (!mb_check_encoding($author_name, 'UTF-8')) {
                $author_name = mb_convert_encoding($author_name, 'UTF-8', 'auto');
            }
        }
        
        error_log("Author name extracted: " . $author_name);
        error_log("Author name after decode: " . bin2hex($author_name));
        
        if (empty($author_name)) {
            // Если имя автора не указано, перенаправляем на страницу авторов
            error_log("Author name is empty, redirecting to /authors/");
            header('Location: /authors/');
            die();
        }
        
        $author_name_safe = noSQL($author_name);
        error_log("Author name safe: " . $author_name_safe);
        
        // Проверяем, существует ли автор
        $query_check = "SELECT 
                            author_name,
                            COUNT(*) AS cnt
                          FROM authors
                          WHERE author_name = '$author_name_safe'
                          GROUP BY author_name";
        error_log("Checking author query: " . $query_check);
        
        $authorInfo = row($query_check);
        error_log("Author info result: " . print_r($authorInfo, true));
        
        if (!$authorInfo) {
            // Автор не найден - показываем 404
            error_log("Author not found, showing 404");
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получение параметров пагинации
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $limit = 20;
        $offset = ($page - 1) * $limit;
        
        // Получаем все товары этого автора
        $query = "SELECT DISTINCT p.id, p.name, p.description, p.picture, p.category_id, p.quantity, pr.price as product_price
                  FROM products p
                  INNER JOIN authors a ON p.id = a.product_id
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE a.author_name = '$author_name_safe'
                  ORDER BY p.name ASC";
        
        // Получаем общее количество товаров
        $totalQuery = "SELECT COUNT(DISTINCT p.id) as total
                       FROM products p
                       INNER JOIN authors a ON p.id = a.product_id
                       WHERE a.author_name = '$author_name_safe'";
        
        error_log("Total query: " . $totalQuery);
        $totalResult = row($totalQuery);
        error_log("Total result: " . print_r($totalResult, true));
        $total = isset($totalResult['total']) ? (int)$totalResult['total'] : 0;
        error_log("Total count: " . $total);
        
        // Получаем товары с пагинацией
        $productsQuery = $query . " LIMIT $limit OFFSET $offset";
        error_log("Products query: " . $productsQuery);
        $products = rows($productsQuery);
        error_log("Products count: " . (is_array($products) ? count($products) : 0));
        
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
        error_log("Formatted products count: " . count($formattedProducts));
        
        // Вычисляем пагинацию
        $pages = $total > 0 ? ceil($total / $limit) : 1;
        $startPage = max(1, $page - 2);
        $endPage = min($pages, $page + 2);
        
        error_log("Pagination: page=$page, pages=$pages, startPage=$startPage, endPage=$endPage");
        
        // Подготовка данных для шаблона
        $authorData = [
            'name' => $authorInfo['author_name'],
            'count' => intval($authorInfo['cnt'])
        ];
        error_log("Author data: " . print_r($authorData, true));
        
        $_SESSION['smarty']->assign('author', $authorData);
        $_SESSION['smarty']->assign('products', $formattedProducts);
        $_SESSION['smarty']->assign('total', $total);
        $_SESSION['smarty']->assign('page', $page);
        $_SESSION['smarty']->assign('pages', $pages);
        $_SESSION['smarty']->assign('startPage', $startPage);
        $_SESSION['smarty']->assign('endPage', $endPage);
        $_SESSION['smarty']->assign('pageTitle', 'Книги автора: ' . $authorInfo['author_name']);
        
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
        
        error_log("About to display template: sfera/author/author.tpl");
        $templatePath = 'site/modules/sfera/author/author.tpl';
        error_log("Template file exists: " . (file_exists($templatePath) ? 'YES' : 'NO'));
        
        // Проверяем, что Smarty инициализирован
        if (!isset($_SESSION['smarty'])) {
            error_log("ERROR: Smarty not initialized!");
            die("ERROR: Smarty not initialized");
        }
        
        error_log("Calling Smarty display()...");
        
        // Очищаем все буферы вывода перед выводом шаблона
        while (ob_get_level()) {
            ob_end_clean();
        }
        
        // Включаем отображение ошибок
        $old_error_reporting = error_reporting(E_ALL);
        $old_display_errors = ini_get('display_errors');
        ini_set('display_errors', 1);
        
        error_log("Before display call, ob_get_level: " . ob_get_level());
        
        try {
            $_SESSION['smarty']->display('sfera/author/author.tpl');
            error_log("Template displayed successfully");
        } catch (Exception $e) {
            error_log("EXCEPTION in display: " . $e->getMessage());
            error_log("Stack trace: " . $e->getTraceAsString());
            if (ob_get_level()) {
                ob_end_clean();
            }
            die("EXCEPTION: " . $e->getMessage());
        } catch (Error $e) {
            error_log("FATAL ERROR in display: " . $e->getMessage());
            error_log("Stack trace: " . $e->getTraceAsString());
            if (ob_get_level()) {
                ob_end_clean();
            }
            die("FATAL ERROR: " . $e->getMessage());
        } catch (Throwable $e) {
            error_log("THROWABLE in display: " . $e->getMessage());
            error_log("Stack trace: " . $e->getTraceAsString());
            if (ob_get_level()) {
                ob_end_clean();
            }
            die("THROWABLE: " . $e->getMessage());
        } finally {
            error_reporting($old_error_reporting);
            ini_set('display_errors', $old_display_errors);
        }
        
        error_log("After display call completed");
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

