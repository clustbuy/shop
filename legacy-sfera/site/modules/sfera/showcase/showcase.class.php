<?php include_once('site/classes/aModule.class.php');
class showcase extends aModule
{
    function execute($arr)
    {
        $template = 'showcase'; // TPL;
/*
        // Параметры сортировки
        $sorting = isset($arr['send_params']['sorting']) ? $arr['send_params']['sorting'] : 'price_desc';
        $order_by = 'cost_retail DESC';
        switch ($sorting) {
            case 'price':
                $order_by = 'cost_retail ASC';
                break;
            case 'price_desc':
                $order_by = 'cost_retail DESC';
                break;
            case 'popular':
                $order_by = 'ostatok DESC';
                break;
            case 'name':
                $order_by = 'title ASC';
                break;
        }

        $_SESSION['ts']['015_showcase_sorting'] = (string)get_period();

        // Параметры пагинации
        $start_limit = 40; // ITEMS_PER_PAGE
        $ajax_load_limit = 30;
        $page = isset($arr['send_params']['page']) ? (int)$arr['send_params']['page'] : 1;
        $limit = ($page > 1) ? $ajax_load_limit : $start_limit;
        $offset = ($page > 1) ? $start_limit + ($page - 2) * $limit : 0;

        // 1. Сначала получаем ID товаров для текущей страницы
        $query = "SELECT art 
                 FROM sima_feed 
                 ORDER BY {$order_by}
                 LIMIT {$limit} OFFSET {$offset}";
        
        $product_ids = rows_list($query, 'art');
        $_SESSION['ts']['016_showcase_sima_feed'] = (string)get_period();
        
        if (empty($product_ids)) {
            $items = [];
        } else {
            // 2. Получаем основные данные товаров
            $ids_str = implode(',', array_map('intval', $product_ids));
            $query = "SELECT * FROM sima_feed WHERE art IN ({$ids_str})";
            $products = rows($query, 'art');

            $_SESSION['ts']['017_showcase_sima_feed_2'] = (string)get_period();


            // 3. Получаем актуальные цены и остатки
            $query = "SELECT sid, price, wholesale_price, balance 
                     FROM item 
                     WHERE sid IN ({$ids_str})";
            $prices = rows($query, 'sid');

            $_SESSION['ts']['017_showcase_item'] = (string)get_period();

            // 4. Получаем бренды для этих товаров
            $brands = array_unique(array_column($products, 'brand'));
            if (!empty($brands)) {
                $brands_str = "'" . implode("','", array_map('noSQL', $brands)) . "'";
                $query = "SELECT name, description FROM trademark WHERE name IN ({$brands_str})";
                $brands_info = rows($query, 'name');

                $_SESSION['ts']['018_showcase_trademark'] = (string)get_period();

            } else {
                $brands_info = [];
            }

            // 5. Получаем страны
            $countries = array_unique(array_column($products, 'country'));
            if (!empty($countries)) {
                $countries_str = "'" . implode("','", array_map('noSQL', $countries)) . "'";
                $query = "SELECT name FROM country WHERE name IN ({$countries_str})";
                $countries_info = rows($query, 'name');
            } else {
                $countries_info = [];
            }

            // Форматируем данные товаров
            $items = [];
            foreach ($product_ids as $art) {
                if (!isset($products[$art])) continue;
                
                $row = $products[$art];
                $price_info = isset($prices[$art]) ? $prices[$art] : [];
                
                $items[] = [
                    'id' => $row['art'],
                    'title' => $row['title'],
                    'category' => $row['title_cat'],
                    'price' => [
                        'retail' => isset($price_info['price']) ? $price_info['price'] : $row['cost_retail'],
                        'wholesale' => isset($price_info['wholesale_price']) ? $price_info['wholesale_price'] : $row['cost_wholesale'],
                        'unit' => $row['ed_izm']
                    ],
                    'stock' => [
                        'available' => isset($price_info['balance']) ? $price_info['balance'] : $row['ostatok'],
                        'min_order' => $row['min'],
                        'multiple' => $row['kratno']
                    ],
                    'media' => [
                        'main_image' => $row['photo_url'],
                        'gallery' => explode(',', $row['gallery_urls'])
                    ],
                    'description' => $row['descr'],
                    'properties' => json_decode($row['properties'], true),
                    'brand' => [
                        'name' => $row['brand'],
                        'description' => isset($brands_info[$row['brand']]) ? $brands_info[$row['brand']]['description'] : null
                    ],
                    'country' => $row['country'],
                    'dimensions' => [
                        'length' => $row['l'],
                        'width' => $row['w'],
                        'height' => $row['h'],
                        'weight' => $row['weight']
                    ]
                ];
            }

            $_SESSION['ts']['019_showcase_after_foreach_product_ids'] = (string)get_period();
        }

        // Получаем общее количество товаров
        $count_query = "SELECT COUNT(*) as total FROM sima_feed";
        $total_count = row($count_query)['total'];

        $_SESSION['ts']['020_showcase_total_count'] = (string)get_period();
        
        $total_pages = ($total_count > $start_limit) ? 
            (1 + ceil(($total_count - $start_limit) / $ajax_load_limit)) : 1;

        // Формируем данные для отображения количества товаров на странице
        if ($page == 1) {
            $items_on_page = ($total_count == 1) ? '1' : 
                ($total_count < $start_limit ? "1-{$total_count}" : "1-{$start_limit}");
        } else {
            $from = $start_limit + ($page - 2) * $ajax_load_limit + 1;
            $to = ($page == $total_pages) ? $total_count : ($from + $ajax_load_limit - 1);
            $items_on_page = "{$from}-{$to}";
        }


        // Подготовка данных для шаблона
        $_SESSION['smarty']->assign('items_on_page', $items_on_page);
        $_SESSION['smarty']->assign('numPage', $page);
        $_SESSION['smarty']->assign('sorting', $sorting);
        $_SESSION['smarty']->assign('totalCount', $total_count);
        $_SESSION['smarty']->assign('total_pages', $total_pages);
        $_SESSION['smarty']->assign('items_r', $items);
        $_SESSION['smarty']->assign('items', json_encode($items, JSON_UNESCAPED_UNICODE));

        $_SESSION['ts']['020_showcase_after_assigns'] = (string)get_period();

        if ($page > 1) {
            print ($_SESSION['smarty']->fetch('sfera/showcase/'.$template.'/items.tpl'));
        } else {
            print ($_SESSION['smarty']->fetch('sfera/showcase/'.$template.'.tpl'));
        }
*/
        

        print ($_SESSION['smarty']->fetch('sfera/showcase/'.$template.'.tpl'));
        $_SESSION['ts']['021_showcase_after_display_templates'] = (string)get_period();
    }
}
