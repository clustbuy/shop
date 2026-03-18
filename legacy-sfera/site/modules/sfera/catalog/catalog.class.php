<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class catalog extends aModule
{
    function execute($arr)
    {
        // Получаем category_id из URL
        $data = getDataFromPath($arr['send_params']['q']);
        $category_id = isset($data['catalog']) ? $data['catalog'] : '';
        
        // Получение параметров
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $limit = 20;
        
        // Получение данных категории
        $category_data = array();
        if (!empty($category_id)) {
            $category_id_safe = noSQL($category_id);
            $category_data = rows("SELECT * FROM tree WHERE id = '$category_id_safe'");
            
            // Если категория не найдена, возвращаем 404
            if (count($category_data) == 0) {
                http_response_code(404);
                print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
                die();
            }
        }
        
        // Получение фильтров из GET параметров (фильтры обрабатываются модулем filter)
        // Проверяем оба варианта: с [] (правильный) и без [] (для обратной совместимости)
        if (isset($_GET['author[]'])) {
            $filter_authors = is_array($_GET['author[]']) ? $_GET['author[]'] : array($_GET['author[]']);
        } else if (isset($_GET['author'])) {
            $filter_authors = is_array($_GET['author']) ? $_GET['author'] : array($_GET['author']);
        } else {
            $filter_authors = array();
        }
        
        if (isset($_GET['age[]'])) {
            $filter_ages = is_array($_GET['age[]']) ? $_GET['age[]'] : array($_GET['age[]']);
        } else if (isset($_GET['age'])) {
            $filter_ages = is_array($_GET['age']) ? $_GET['age'] : array($_GET['age']);
        } else {
            $filter_ages = array();
        }
        
        if (isset($_GET['seriya[]'])) {
            $filter_series = is_array($_GET['seriya[]']) ? $_GET['seriya[]'] : array($_GET['seriya[]']);
        } else if (isset($_GET['seriya'])) {
            $filter_series = is_array($_GET['seriya']) ? $_GET['seriya'] : array($_GET['seriya']);
        } else {
            $filter_series = array();
        }
        
        if (isset($_GET['product_type[]'])) {
            $filter_product_types = is_array($_GET['product_type[]']) ? $_GET['product_type[]'] : array($_GET['product_type[]']);
        } else if (isset($_GET['product_type'])) {
            $filter_product_types = is_array($_GET['product_type']) ? $_GET['product_type'] : array($_GET['product_type']);
        } else {
            $filter_product_types = array();
        }
        
        if (isset($_GET['topic[]'])) {
            $filter_topics = is_array($_GET['topic[]']) ? $_GET['topic[]'] : array($_GET['topic[]']);
        } else if (isset($_GET['topic'])) {
            $filter_topics = is_array($_GET['topic']) ? $_GET['topic'] : array($_GET['topic']);
        } else {
            $filter_topics = array();
        }
        
        // Получение списка товаров
        $products = $this->getProducts($page, $limit, $category_id, $filter_authors, $filter_ages, $filter_series, $filter_product_types, $filter_topics);
        $total = $this->getProductsCount($category_id, $filter_authors, $filter_ages, $filter_series, $filter_product_types, $filter_topics);
        
        // Получение категорий для меню (подкатегории текущей категории)
        $categories = $this->getCategories($category_id);
        
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
        $_SESSION['smarty']->assign('category', count($category_data) > 0 ? $category_data[0] : array('id' => '', 'name' => 'Каталог'));
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

        $_SESSION['smarty']->display('sfera/catalog/catalog.tpl');
    }
    
    private function getProducts($page, $limit, $category_id = null, $filter_authors = array(), $filter_ages = array(), $filter_series = array(), $filter_product_types = array(), $filter_topics = array())
    {
        $offset = ($page - 1) * $limit;
        
        // Формируем WHERE условие для категории
        if (empty($category_id)) {
            $where = "1=1";
        } else {
            $category_id_safe = noSQL($category_id);
            // Получаем все подкатегории
            $category_data = row("SELECT * FROM tree WHERE id = '$category_id_safe'");
            if ($category_data) {
                $categories = $this->get_subcategies_ids($category_data);
                if (count($categories) > 0) {
                    $categories_safe = array_map(function($id) {
                        return "'" . noSQL($id) . "'";
                    }, $categories);
                    $where = "p.category_id IN (" . implode(',', $categories_safe) . ")";
                } else {
                    $where = "p.category_id = '$category_id_safe'";
                }
            } else {
                $where = "p.category_id = '$category_id_safe'";
            }
        }
        
        // Добавляем фильтры по авторам в WHERE
        $where_authors = "";
        if (!empty($filter_authors) && is_array($filter_authors)) {
            $authors_safe = array_map(function($author) {
                return "'" . noSQL($author) . "'";
            }, $filter_authors);
            $where_authors = " AND EXISTS (SELECT 1 FROM authors a WHERE a.product_id = p.id AND a.author_name IN (" . implode(',', $authors_safe) . "))";
        }
        
        // Добавляем фильтры по возрасту в WHERE
        $where_ages = "";
        if (!empty($filter_ages) && is_array($filter_ages)) {
            error_log("=== getProducts() - Age Filter Debug ===");
            error_log("Input filter_ages (raw): " . print_r($filter_ages, true));
            
            // Очищаем и нормализуем значения возрастов (убираем пробелы, декодируем URL)
            $ages_cleaned = array_map(function($age) {
                // Декодируем URL (0%2B становится 0+)
                $decoded = urldecode($age);
                // Убираем пробелы
                $trimmed = trim($decoded);
                error_log("Age processing: '$age' -> '$decoded' -> '$trimmed'");
                return $trimmed;
            }, $filter_ages);
            
            error_log("After cleaning (trim + urldecode): " . print_r($ages_cleaned, true));
            
            // Для каждого возраста проверяем, как он хранится в базе
            // Особенно важно для "0+" - может храниться в разных форматах
            $ages_for_query = [];
            foreach ($ages_cleaned as $age) {
                // Проверяем, есть ли в базе точное совпадение
                $age_safe = noSQL($age);
                $check_query = "SELECT DISTINCT age FROM ages WHERE age = '$age_safe' LIMIT 1";
                $check_result = row($check_query);
                
                if ($check_result && isset($check_result['age'])) {
                    // Нашли точное совпадение, используем его
                    $ages_for_query[] = "'" . noSQL($check_result['age']) . "'";
                    error_log("Found exact match for '$age': '" . $check_result['age'] . "'");
                } else {
                    // Точного совпадения нет, возможно есть варианты с пробелами или другим форматированием
                    // Для "0+" проверяем различные варианты
                    if (stripos($age, '0') === 0 && (stripos($age, '+') !== false || $age === '0')) {
                        // Ищем все варианты "0+" в базе (используем TRIM для учета пробелов)
                        $zero_plus_variants = rows("SELECT DISTINCT age FROM ages WHERE (TRIM(age) LIKE '0+%' OR TRIM(age) = '0+' OR TRIM(age) = '0' OR age LIKE '0+%' OR age = '0+' OR age = '0' OR age LIKE '%0+%') LIMIT 10");
                        error_log("Searching for 0+ variants for input '$age'. Found: " . print_r($zero_plus_variants, true));
                        if (!empty($zero_plus_variants)) {
                            foreach ($zero_plus_variants as $variant) {
                                $variant_trimmed = trim($variant['age']);
                                $variant_safe = noSQL($variant_trimmed);
                                $ages_for_query[] = "'" . $variant_safe . "'";
                            }
                        } else {
                            // Если ничего не нашли, используем исходное значение
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    } else {
                        // Для других возрастов проверяем с учетом пробелов
                        $trimmed_match = row("SELECT DISTINCT age FROM ages WHERE TRIM(age) = '$age_safe' LIMIT 1");
                        if ($trimmed_match && isset($trimmed_match['age'])) {
                            $ages_for_query[] = "'" . noSQL(trim($trimmed_match['age'])) . "'";
                        } else {
                            // Используем исходное значение
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    }
                }
            }
            
            // Убираем дубликаты
            $ages_for_query = array_unique($ages_for_query);
            
            error_log("Final ages for SQL IN: " . print_r($ages_for_query, true));
            
            if (!empty($ages_for_query)) {
                // Используем EXISTS с IN для поиска товаров с любым из выбранных возрастов (OR логика)
                $where_ages = " AND EXISTS (SELECT 1 FROM ages a WHERE a.product_id = p.id AND a.age IN (" . implode(',', $ages_for_query) . "))";
                error_log("Final where_ages clause: " . $where_ages);
            }
        }
        
        // Добавляем фильтры по сериям в WHERE
        $where_series = "";
        if (!empty($filter_series) && is_array($filter_series)) {
            $series_safe = array_map(function($serie) {
                return "'" . noSQL($serie) . "'";
            }, $filter_series);
            $where_series = " AND EXISTS (SELECT 1 FROM attributes a WHERE a.product_id = p.id AND BINARY a.name = 'Серия' AND BINARY a.value IN (" . implode(',', $series_safe) . "))";
        }
        
        // Добавляем фильтры по типам товаров в WHERE
        $where_product_types = "";
        if (!empty($filter_product_types) && is_array($filter_product_types)) {
            $product_types_safe = array_map(function($product_type) {
                return "'" . noSQL($product_type) . "'";
            }, $filter_product_types);
            $where_product_types = " AND EXISTS (SELECT 1 FROM attributes a WHERE a.product_id = p.id AND BINARY a.name = 'Тип товара' AND BINARY a.value IN (" . implode(',', $product_types_safe) . "))";
        }
        
        // Добавляем фильтры по тематикам в WHERE
        $where_topics = "";
        if (!empty($filter_topics) && is_array($filter_topics)) {
            $topics_safe = array_map(function($topic) {
                return "'" . noSQL($topic) . "'";
            }, $filter_topics);
            $where_topics = " AND EXISTS (SELECT 1 FROM attributes a WHERE a.product_id = p.id AND BINARY a.name = 'Тематика' AND BINARY a.value IN (" . implode(',', $topics_safe) . "))";
        }
        
        $query = "SELECT DISTINCT p.*, pr.price as product_price, p.quantity
                  FROM products p
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE $where $where_authors $where_ages $where_series $where_product_types $where_topics
                  ORDER BY p.name ASC 
                  LIMIT $offset, $limit";
        
        error_log("=== Final SQL Query (getProducts) ===");
        error_log($query);
        error_log("=== End Query ===");
        
        $result = rows($query);
        
        error_log("Query returned " . count($result) . " products");
        
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
    
    private function getProductsCount($category_id = null, $filter_authors = array(), $filter_ages = array(), $filter_series = array(), $filter_product_types = array(), $filter_topics = array())
    {
        // Формируем WHERE условие для категории
        if (empty($category_id)) {
            $where = "1=1";
        } else {
            $category_id_safe = noSQL($category_id);
            // Получаем все подкатегории
            $category_data = row("SELECT * FROM tree WHERE id = '$category_id_safe'");
            if ($category_data) {
                $categories = $this->get_subcategies_ids($category_data);
                if (count($categories) > 0) {
                    $categories_safe = array_map(function($id) {
                        return "'" . noSQL($id) . "'";
                    }, $categories);
                    $where = "p.category_id IN (" . implode(',', $categories_safe) . ")";
                } else {
                    $where = "p.category_id = '$category_id_safe'";
                }
            } else {
                $where = "p.category_id = '$category_id_safe'";
            }
        }
        
        // Добавляем фильтры по авторам в WHERE
        $where_authors = "";
        if (!empty($filter_authors) && is_array($filter_authors)) {
            $authors_safe = array_map(function($author) {
                return "'" . noSQL($author) . "'";
            }, $filter_authors);
            $where_authors = " AND EXISTS (SELECT 1 FROM authors a WHERE a.product_id = p.id AND a.author_name IN (" . implode(',', $authors_safe) . "))";
        }
        
        // Добавляем фильтры по возрасту в WHERE
        $where_ages = "";
        if (!empty($filter_ages) && is_array($filter_ages)) {
            error_log("=== getProductsCount() - Age Filter Debug ===");
            error_log("Input filter_ages (raw): " . print_r($filter_ages, true));
            
            // Очищаем и нормализуем значения возрастов (убираем пробелы, декодируем URL)
            $ages_cleaned = array_map(function($age) {
                // Декодируем URL (0%2B становится 0+)
                $decoded = urldecode($age);
                // Убираем пробелы
                $trimmed = trim($decoded);
                error_log("Age processing: '$age' -> '$decoded' -> '$trimmed'");
                return $trimmed;
            }, $filter_ages);
            
            error_log("After cleaning (trim + urldecode): " . print_r($ages_cleaned, true));
            
            // Для каждого возраста проверяем, как он хранится в базе
            // Особенно важно для "0+" - может храниться в разных форматах
            $ages_for_query = [];
            foreach ($ages_cleaned as $age) {
                // Проверяем, есть ли в базе точное совпадение
                $age_safe = noSQL($age);
                $check_query = "SELECT DISTINCT age FROM ages WHERE age = '$age_safe' LIMIT 1";
                $check_result = row($check_query);
                
                if ($check_result && isset($check_result['age'])) {
                    // Нашли точное совпадение, используем его
                    $ages_for_query[] = "'" . noSQL($check_result['age']) . "'";
                    error_log("Found exact match for '$age': '" . $check_result['age'] . "'");
                } else {
                    // Точного совпадения нет, возможно есть варианты с пробелами или другим форматированием
                    // Для "0+" проверяем различные варианты
                    if (stripos($age, '0') === 0 && (stripos($age, '+') !== false || $age === '0')) {
                        // Ищем все варианты "0+" в базе (используем TRIM для учета пробелов)
                        $zero_plus_variants = rows("SELECT DISTINCT age FROM ages WHERE (TRIM(age) LIKE '0+%' OR TRIM(age) = '0+' OR TRIM(age) = '0' OR age LIKE '0+%' OR age = '0+' OR age = '0' OR age LIKE '%0+%') LIMIT 10");
                        error_log("Searching for 0+ variants for input '$age'. Found: " . print_r($zero_plus_variants, true));
                        if (!empty($zero_plus_variants)) {
                            foreach ($zero_plus_variants as $variant) {
                                $variant_trimmed = trim($variant['age']);
                                $variant_safe = noSQL($variant_trimmed);
                                $ages_for_query[] = "'" . $variant_safe . "'";
                            }
                        } else {
                            // Если ничего не нашли, используем исходное значение
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    } else {
                        // Для других возрастов проверяем с учетом пробелов
                        $trimmed_match = row("SELECT DISTINCT age FROM ages WHERE TRIM(age) = '$age_safe' LIMIT 1");
                        if ($trimmed_match && isset($trimmed_match['age'])) {
                            $ages_for_query[] = "'" . noSQL(trim($trimmed_match['age'])) . "'";
                        } else {
                            // Используем исходное значение
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    }
                }
            }
            
            // Убираем дубликаты
            $ages_for_query = array_unique($ages_for_query);
            
            error_log("Final ages for SQL IN: " . print_r($ages_for_query, true));
            
            if (!empty($ages_for_query)) {
                // Используем EXISTS с IN для поиска товаров с любым из выбранных возрастов (OR логика)
                $where_ages = " AND EXISTS (SELECT 1 FROM ages a WHERE a.product_id = p.id AND a.age IN (" . implode(',', $ages_for_query) . "))";
                error_log("Final where_ages clause: " . $where_ages);
            }
        }
        
        // Добавляем фильтры по сериям в WHERE
        $where_series = "";
        if (!empty($filter_series) && is_array($filter_series)) {
            $series_safe = array_map(function($serie) {
                return "'" . noSQL($serie) . "'";
            }, $filter_series);
            $where_series = " AND EXISTS (SELECT 1 FROM attributes a WHERE a.product_id = p.id AND BINARY a.name = 'Серия' AND BINARY a.value IN (" . implode(',', $series_safe) . "))";
        }
        
        // Добавляем фильтры по типам товаров в WHERE
        $where_product_types = "";
        if (!empty($filter_product_types) && is_array($filter_product_types)) {
            $product_types_safe = array_map(function($product_type) {
                return "'" . noSQL($product_type) . "'";
            }, $filter_product_types);
            $where_product_types = " AND EXISTS (SELECT 1 FROM attributes a WHERE a.product_id = p.id AND BINARY a.name = 'Тип товара' AND BINARY a.value IN (" . implode(',', $product_types_safe) . "))";
        }
        
        // Добавляем фильтры по тематикам в WHERE
        $where_topics = "";
        if (!empty($filter_topics) && is_array($filter_topics)) {
            $topics_safe = array_map(function($topic) {
                return "'" . noSQL($topic) . "'";
            }, $filter_topics);
            $where_topics = " AND EXISTS (SELECT 1 FROM attributes a WHERE a.product_id = p.id AND BINARY a.name = 'Тематика' AND BINARY a.value IN (" . implode(',', $topics_safe) . "))";
        }
        
        $count_query = "SELECT COUNT(*) AS total 
                       FROM products p
                       WHERE $where $where_authors $where_ages $where_series $where_product_types $where_topics";
        
        error_log("=== Final SQL Query (getProductsCount) ===");
        error_log($count_query);
        error_log("=== End Query ===");
        
        $result = row($count_query);
        
        $total = isset($result['total']) ? intval($result['total']) : 0;
        error_log("Query returned total count: " . $total);
        
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
    
    private function get_subcategies_ids($category)
    {
        $ids = array($category['id']);
        $category_id_safe = noSQL($category['id']);
        $children = rows("SELECT id, name FROM tree WHERE parent_id = '$category_id_safe'");
        
        foreach($children as $child) {
            $ids = array_merge($ids, $this->get_subcategies_ids($child));
        }
        
        return $ids;
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
