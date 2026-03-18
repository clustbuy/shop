<?php 
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class product extends aModule
{
    function execute($arr)
    {
        // Получаем ID товара из URL
        $data = getDataFromPath($arr['send_params']['q']);
        $product_id = isset($data['product']) ? $data['product'] : '';
        
        if (empty($product_id)) {
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получаем данные товара из таблицы products с ценой
        $product_id_safe = noSQL($product_id);
        $product = row("SELECT p.*, pr.price as product_price
                       FROM products p
                       LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                       WHERE BINARY p.id = BINARY '$product_id_safe'");
        
        if (empty($product)) {
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Формируем breadcrumbs
        $breadcrumbs = array();
        $breadcrumbs[] = array('title' => 'Главная', 'url' => '/');
        $breadcrumbs[] = array('title' => 'Каталог', 'url' => '/catalog/');
        
        // Если есть категория, добавляем её в breadcrumbs
        if (!empty($product['category_id'])) {
            $category_id_safe = noSQL($product['category_id']);
            $category = row("SELECT id, name FROM tree WHERE BINARY id = BINARY '$category_id_safe'");
            if ($category) {
                $breadcrumbs[] = array('title' => $category['name'], 'url' => '/catalog/' . $category['id'] . '/');
            }
        }
        
        // Получаем атрибуты товара из таблицы attributes, исключая служебные поля
        $excluded_attributes = array(
            'Новинка',
            'Отгружать упаковками',
            'Отображать',
            'Стандарт',
            'Тип обложки'
        );
        $excluded_safe = array_map(function($attr) {
            return "'" . noSQL($attr) . "'";
        }, $excluded_attributes);
        $excluded_list = implode(',', $excluded_safe);
        $attributes = rows("SELECT name, value FROM attributes WHERE product_id = '$product_id_safe' AND name NOT IN ($excluded_list) ORDER BY name ASC");
        
        // Для атрибута "Серия" получаем ID из view v_seriya
        // Для атрибута "Тематика" получаем ID из view v_tematika
        // Для атрибута "Тип товара" получаем ID из view v_tip_tovara
        foreach ($attributes as &$attr) {
            if ($attr['name'] == 'Серия' && !empty($attr['value'])) {
                $seriya_name_safe = noSQL($attr['value']);
                $seriya_info = row("SELECT id FROM v_seriya WHERE BINARY value = BINARY '$seriya_name_safe' LIMIT 1");
                if ($seriya_info && isset($seriya_info['id'])) {
                    $attr['seriya_id'] = intval($seriya_info['id']);
                }
            }
            if ($attr['name'] == 'Тематика' && !empty($attr['value'])) {
                $tematika_name_safe = noSQL($attr['value']);
                $tematika_info = row("SELECT id FROM v_tematika WHERE BINARY value = BINARY '$tematika_name_safe' LIMIT 1");
                if ($tematika_info && isset($tematika_info['id'])) {
                    $attr['topic_id'] = intval($tematika_info['id']);
                }
            }
            if ($attr['name'] == 'Тип товара' && !empty($attr['value'])) {
                $tip_tovara_name_safe = noSQL($attr['value']);
                $tip_tovara_info = row("SELECT id FROM v_tip_tovara WHERE BINARY value = BINARY '$tip_tovara_name_safe' LIMIT 1");
                if ($tip_tovara_info && isset($tip_tovara_info['id'])) {
                    $attr['product_type_id'] = intval($tip_tovara_info['id']);
                }
            }
        }
        unset($attr); // Сбрасываем ссылку
        
        // Получаем изображения товара из таблицы o_images
        // Проверяем наличие товара в v_products_o_products
        $ozon_product = row("SELECT product_id FROM v_products_o_products WHERE offer_id = '$product_id_safe' LIMIT 1");

        // Товар найден в v_products_o_products, получаем primary_image из o_products
        $ozon_product_id = noSQL($ozon_product['product_id']);

        $images = rows("SELECT * FROM o_images WHERE product_id = '$ozon_product_id' ORDER BY image_order ASC");

        $product_images = array();
        foreach ($images as $image) {
            $product_images[] = array(
                'url' => "/o_images/".$image['product_id']."/".$image['image_order'].".jpg"
            );
        }

        // Определяем главное изображение через новую функцию
        $main_image_url = getProductImageUrl($product_id);
        
        // Проверяем, что главное изображение не дублируется в галерее
        $main_image_exists = false;
        foreach ($product_images as $img) {
            if ($img['url'] == $main_image_url) {
                $main_image_exists = true;
                break;
            }
        }
        // Если главное изображение отсутствует в галерее, добавляем его первым
        if (!$main_image_exists) {
            array_unshift($product_images, array('url' => $main_image_url));
        }
        
        // Подготовка данных для шаблона
        $product_price = isset($product['product_price']) && $product['product_price'] > 0 ? round($product['product_price']) : 0;
        
        $_SESSION['smarty']->assign('product', $product);
        $_SESSION['smarty']->assign('product_id', $product_id);
        $_SESSION['smarty']->assign('breadcrumbs', $breadcrumbs);
        $_SESSION['smarty']->assign('product_name', isset($product['name']) ? $product['name'] : '');
        $_SESSION['smarty']->assign('product_price', $product_price);
        $_SESSION['smarty']->assign('product_image', isset($product['picture']) ? $product['picture'] : (isset($product['image']) ? $product['image'] : ''));
        $_SESSION['smarty']->assign('product_description', isset($product['description']) ? $product['description'] : '');
        $_SESSION['smarty']->assign('attributes', $attributes);
        $_SESSION['smarty']->assign('product_images', $product_images);
        
        // Передаем данные корзины и избранного
        if (!isset($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        }
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
        
        if (!isset($_SESSION['favorites']['items'])) {
            $_SESSION['favorites']['items'] = array();
        }
        $_SESSION['smarty']->assign('favorites', $_SESSION['favorites']);
        
        // Получаем отзывы и статистику
        // Сначала получаем SKU товара из v_products_o_products
        $ozon_product = row("SELECT sku FROM v_products_o_products WHERE offer_id = '$product_id_safe' LIMIT 1");
        $reviews = array();
        $reviews_stats = array(
            'average_rating' => 0,
            'total_count' => 0,
            'rating_distribution' => array(
                5 => array('count' => 0, 'percent' => 0),
                4 => array('count' => 0, 'percent' => 0),
                3 => array('count' => 0, 'percent' => 0),
                2 => array('count' => 0, 'percent' => 0),
                1 => array('count' => 0, 'percent' => 0)
            )
        );
        
        if ($ozon_product && !empty($ozon_product['sku'])) {
            $sku = intval($ozon_product['sku']);
            
            // Получаем все отзывы для статистики (все с рейтингом)
            $all_reviews = rows("SELECT 
                                rating
                            FROM o_reviews 
                            WHERE sku = $sku 
                            AND rating IS NOT NULL");
            
            // Получаем отзывы с текстом для отображения
            $reviews_raw = rows("SELECT 
                                review_id,
                                rating,
                                text,
                                date,
                                state
                            FROM o_reviews 
                            WHERE sku = $sku 
                            AND rating IS NOT NULL
                            AND text IS NOT NULL
                            AND text != ''
                            AND TRIM(text) != ''
                            ORDER BY date DESC");
            
            // Форматируем даты для отзывов
            $reviews = array();
            $months = array(
                1 => 'января', 2 => 'февраля', 3 => 'марта', 4 => 'апреля',
                5 => 'мая', 6 => 'июня', 7 => 'июля', 8 => 'августа',
                9 => 'сентября', 10 => 'октября', 11 => 'ноября', 12 => 'декабря'
            );
            
            foreach ($reviews_raw as $review) {
                $formatted_date = '';
                if (!empty($review['date'])) {
                    $date_obj = DateTime::createFromFormat('Y-m-d H:i:s', $review['date']);
                    if ($date_obj) {
                        $day = $date_obj->format('j');
                        $month = intval($date_obj->format('n'));
                        $year = $date_obj->format('Y');
                        $formatted_date = $day . ' ' . (isset($months[$month]) ? $months[$month] : '') . ' ' . $year;
                    }
                }
                
                // Получаем первую букву из текста для аватара
                $first_letter = mb_substr(trim($review['text']), 0, 1, 'UTF-8');
                $first_letter = mb_strtoupper($first_letter, 'UTF-8');
                
                $reviews[] = array(
                    'review_id' => $review['review_id'],
                    'rating' => intval($review['rating']),
                    'text' => $review['text'],
                    'date' => $review['date'],
                    'formatted_date' => $formatted_date,
                    'first_letter' => $first_letter,
                    'state' => $review['state']
                );
            }
            
            // Вычисляем статистику по всем отзывам (не только с текстом)
            $total_reviews = count($all_reviews);
            $reviews_stats['total_count'] = $total_reviews;
            
            if ($total_reviews > 0) {
                $sum_rating = 0;
                $rating_counts = array(5 => 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0);
                
                foreach ($all_reviews as $review) {
                    $rating = intval($review['rating']);
                    if ($rating >= 1 && $rating <= 5) {
                        $sum_rating += $rating;
                        $rating_counts[$rating]++;
                    }
                }
                
                // Средний рейтинг
                $reviews_stats['average_rating'] = round($sum_rating / $total_reviews, 1);
                
                // Распределение по звездам и проценты
                foreach ($rating_counts as $stars => $count) {
                    $reviews_stats['rating_distribution'][$stars]['count'] = $count;
                    $reviews_stats['rating_distribution'][$stars]['percent'] = $total_reviews > 0 
                        ? round(($count / $total_reviews) * 100, 4) 
                        : 0;
                }
            }
        }
        
        // Передаем отзывы и статистику в шаблон
        $_SESSION['smarty']->assign('reviews', $reviews);
        $_SESSION['smarty']->assign('reviews_stats', $reviews_stats);

        print ($_SESSION['smarty']->fetch('sfera/product/product.tpl'));
    }
}
