<?php include_once('site/classes/aModule.class.php');

class item extends aModule
{
    function execute($arr)
    {
        // Получаем ID товара из параметров
        $item_id = intval($arr['params'][0]);
        error_log("Получен ID товара: " . $item_id);
        
        // Получаем данные товара
        $item = $this->getItem($item_id);
        
        if ($item) {
            // Получаем атрибуты товара
            $item['attributes'] = $this->getItemAttributes($item_id);
            
            // Получаем рекомендованные товары
            $item['recommended'] = $this->getRecommendedItems($item);
            
            // Подготовка данных для шаблона
            $_SESSION['smarty']->assign('item', $item);
            //$_SESSION['smarty']->assign('items_json', json_encode([0 => $item]));
            $_SESSION['smarty']->assign('item_json', json_encode($item, JSON_UNESCAPED_UNICODE));
            
            print($_SESSION['smarty']->fetch('sfera/item/'.TPL.'.tpl'));
        } else {
            error_log("Товар не найден: " . $item_id);
            http_response_code(404);
            print($_SESSION['smarty']->fetch('sfera/tpl/'.TPL.'/404.tpl'));
        }
    }
    
    private function getItem($item_id)
    {
        // Логируем входные данные
        error_log("getItem вызван с item_id: " . $item_id);
        
        // Первый запрос - используем строковое сравнение для больших чисел
        $sql = "SELECT * FROM sima_feed WHERE art = '" . addslashes($item_id) . "'";
        error_log("SQL запрос 1: " . $sql);
        $result = row($sql);
        error_log("Результат первого запроса: " . print_r($result, true));
        
        if (!$result) {
            error_log("Результат не найден в таблице sima_feed");
            return null;
        }

        // Получаем данные из таблицы item
        $sql = "SELECT price, wholesale_price, balance FROM item WHERE sid = '" . addslashes($item_id) . "'";
        error_log("SQL запрос 2: " . $sql);
        $item_data = row($sql);
        error_log("Результат второго запроса (цены): " . print_r($item_data, true));
        
        // Получаем розничную и оптовую цены
        $retail_price = floatval($item_data['price'] ?: $result['cost_retail'] ?: 0);
        $wholesale_price = floatval($item_data['wholesale_price'] ?: $result['cost_wholesale'] ?: 0);
        
        // Проверяем разницу между ценами
        $price_diff = $retail_price - $wholesale_price;
        $min_diff = $retail_price * 0.1; // 10% от розничной цены
        
        error_log("Розничная цена: " . $retail_price);
        error_log("Оптовая цена: " . $wholesale_price);
        error_log("Разница: " . $price_diff);
        error_log("Минимальная разница (10%): " . $min_diff);
        
        // Если разница меньше или равна 10% от розничной цены, устанавливаем retail = 2*wholesale
        if ($price_diff <= $min_diff) {
            $retail_price = $wholesale_price * 2;
            $price_diff = $retail_price - $wholesale_price;
            error_log("Малая разница: устанавливаем retail = 2*wholesale: " . $retail_price);
        }
        
        // Рассчитываем комиссию платформы (50% от разницы)
        $platform_commission = $price_diff * 0.5;
        
        // Рассчитываем итоговую цену и округляем до целых рублей
        $final_price = round($wholesale_price + $platform_commission);
        
        error_log("Комиссия платформы: " . $platform_commission);
        error_log("Итоговая цена (после округления): " . $final_price);
        
        // Получаем данные о бренде
        $sql = "SELECT name, description FROM trademark WHERE name = '" . addslashes($result['brand']) . "'";
        error_log("SQL запрос 3: " . $sql);
        $brand_data = row($sql);
        error_log("Результат третьего запроса: " . print_r($brand_data, true));

        // Получаем данные о стране
        $sql = "SELECT name FROM country WHERE name = '" . addslashes($result['country']) . "'";
        error_log("SQL запрос 4: " . $sql);
        $country_data = row($sql);
        error_log("Результат четвертого запроса: " . print_r($country_data, true));
        
        // Обработка URL изображений
        $gallery_urls = [];
        error_log("Raw gallery_urls from database: " . print_r($result['gallery_urls'], true));
        
        if (!empty($result['gallery_urls'])) {
            // Разделяем URL по точке с запятой
            $urls = array_filter(explode(';', $result['gallery_urls']));
            error_log("After explode gallery_urls: " . print_r($urls, true));
            
            // Удаляем пробелы и пустые значения
            $urls = array_map('trim', $urls);
            $urls = array_filter($urls);
            error_log("After trim gallery_urls: " . print_r($urls, true));
            
            // Формируем массив объектов с url
            foreach ($urls as $url) {
                if (!empty($url)) {
                    $gallery_urls[] = ['url' => $url];
                }
            }
            error_log("Final gallery_urls array: " . print_r($gallery_urls, true));
        }
        
        // Форматируем данные товара
        $item = [
            'id' => $result['art'],
            'title' => $result['title'],
            'name' => $result['title'],
            'category' => $result['title'],
            'cost' => $final_price,
            'price' => [
                'retail' => $retail_price,
                'wholesale' => $wholesale_price,
                'unit' => $result['ed_izm']
            ],
            'stock' => [
                'available' => intval($item_data['balance'] ?: $result['ostatok']),
                'min_order' => intval($result['min']),
                'multiple' => intval($result['kratno'])
            ],
            'dimensions' => [
                'length' => floatval($result['l']),
                'width' => floatval($result['w']),
                'height' => floatval($result['h']),
                'weight' => floatval($result['weight']),
                'unit_length' => $result['lu'],
                'unit_width' => $result['wu'],
                'unit_height' => $result['hu']
            ],
            'media' => [
                'main_image' => $result['photo_url'],
                'gallery' => $gallery_urls
            ],
            'description' => $result['descr'],
            'properties' => json_decode($result['properties'], true) ?: [],
            'brand' => [
                'name' => $brand_data['name'] ?: $result['brand'],
                'description' => $brand_data['description'] ?: ''
            ],
            'country' => $country_data['name'] ?: $result['country'],
            'marking' => $result['chestn_znak'],
            'specifications' => $this->getItemAttributes($item_id)
        ];

        // Добавляем данные для Knockout
        $_SESSION['smarty']->assign('item_json', json_encode($item, JSON_UNESCAPED_UNICODE));
        
        return $item;
    }
    
    private function getItemAttributes($item_id)
    {
        $sql = "SELECT 
                    a.name as attr_name,
                    a.description as attr_description,
                    dt.name as data_type,
                    u.name as unit_name,
                    ai.boolean_value,
                    ai.int_value,
                    ai.float_value,
                    ai.datetime_value,
                    ai.numrange_value,
                    o.name as option_name
                FROM attr_item ai
                JOIN item i ON i.id = ai.item_id
                JOIN attr a ON a.id = ai.attribute_id
                LEFT JOIN datatype dt ON dt.id = a.data_type_id
                LEFT JOIN unit u ON u.id = a.unit_id
                LEFT JOIN `option` o ON o.id = ai.option_value
                WHERE i.sid = " . (int)$item_id;
                
        $result = rows($sql);
        
        $attributes = [];
        foreach ($result as $row) {
            $value = null;
            
            // Определяем значение в зависимости от типа данных
            switch ($row['data_type']) {
                case 'boolean':
                    $value = (bool)$row['boolean_value'];
                    break;
                case 'integer':
                    $value = $row['int_value'];
                    break;
                case 'float':
                    $value = $row['float_value'];
                    break;
                case 'datetime':
                    $value = $row['datetime_value'];
                    break;
                case 'option':
                    $value = $row['option_name'];
                    break;
                case 'range':
                    $value = $row['numrange_value'];
                    break;
            }
            
            $attributes[] = [
                'name' => $row['attr_name'],
                'description' => $row['attr_description'],
                'value' => $value,
                'unit' => $row['unit_name']
            ];
        }
        
        return $attributes;
    }
    
    private function getRecommendedItems($item)
    {
        // Получаем товары из той же категории с оптимизированным запросом
        $sql = "SELECT 
                    sf.art,
                    sf.title,
                    sf.photo_url,
                    i.price as current_price
                FROM sima_feed sf
                JOIN item i ON i.sid = sf.art
                JOIN item_category ic ON ic.item_id = i.id
                WHERE ic.category_id IN (
                    SELECT category_id 
                    FROM item_category ic2 
                    JOIN item i2 ON i2.id = ic2.item_id 
                    WHERE i2.sid = '" . addslashes($item['id']) . "'
                )
                AND sf.art != '" . addslashes($item['id']) . "'
                ORDER BY RAND()
                LIMIT 4";
                
        $result = rows($sql);
        
        $recommended = [];
        foreach ($result as $row) {
            $recommended[] = [
                'id' => $row['art'],
                'title' => $row['title'],
                'price' => $row['current_price'] ?: $row['cost_retail'],
                'image' => $row['photo_url']
            ];
        }
        
        return $recommended;
    }
}
?>