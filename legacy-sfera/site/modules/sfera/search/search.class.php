<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class search extends aModule
{
    function execute($arr)
    {
        // Получаем поисковый запрос
        $query = isset($_GET['query']) ? trim($_GET['query']) : '';
        if (empty($query)) {
            $query = isset($arr['send_params']['s']) ? trim($arr['send_params']['s']) : '';
        }
        if (empty($query)) {
            $query = isset($_SESSION['search']) ? $_SESSION['search'] : '';
        }
        
        // Сохраняем запрос в сессию
        if (!empty($query)) {
            $_SESSION['search'] = $query;
        } else {
            // Если запрос пустой, очищаем сессию
            unset($_SESSION['search']);
        }
        
        // Получение параметров
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $limit = 20;
        
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
        
        // Получение списка товаров
        $products = $this->getProducts($page, $limit, $query, $filter_authors, $filter_ages);
        $total = $this->getProductsCount($query, $filter_authors, $filter_ages);
        
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
        $_SESSION['smarty']->assign('category', array('id' => '', 'name' => 'Результаты поиска'));
        $_SESSION['smarty']->assign('search_query', $query);
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

        // Используем тот же шаблон, что и каталог
        $_SESSION['smarty']->display('sfera/catalog/catalog.tpl');
    }
    
    private function getProducts($page, $limit, $query = '', $filter_authors = array(), $filter_ages = array())
    {
        $offset = ($page - 1) * $limit;
        
        // Формируем WHERE условие для поиска
        if (empty($query)) {
            $where = "1=0"; // Если запрос пустой, не показываем товары
        } else {
            $query_safe = noSQL($query);
            // Поиск по названию товара (name) и ID
            $where = "(p.name LIKE '%$query_safe%' OR p.id LIKE '%$query_safe%')";
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
            // Очищаем и нормализуем значения возрастов (убираем пробелы, декодируем URL)
            $ages_cleaned = array_map(function($age) {
                $decoded = urldecode($age);
                return trim($decoded);
            }, $filter_ages);
            
            // Для каждого возраста проверяем, как он хранится в базе
            $ages_for_query = [];
            foreach ($ages_cleaned as $age) {
                $age_safe = noSQL($age);
                $check_query = "SELECT DISTINCT age FROM ages WHERE age = '$age_safe' LIMIT 1";
                $check_result = row($check_query);
                
                if ($check_result && isset($check_result['age'])) {
                    $ages_for_query[] = "'" . noSQL($check_result['age']) . "'";
                } else {
                    // Для "0+" проверяем различные варианты
                    if (stripos($age, '0') === 0 && (stripos($age, '+') !== false || $age === '0')) {
                        $zero_plus_variants = rows("SELECT DISTINCT age FROM ages WHERE (TRIM(age) LIKE '0+%' OR TRIM(age) = '0+' OR TRIM(age) = '0' OR age LIKE '0+%' OR age = '0+' OR age = '0' OR age LIKE '%0+%') LIMIT 10");
                        if (!empty($zero_plus_variants)) {
                            foreach ($zero_plus_variants as $variant) {
                                $variant_trimmed = trim($variant['age']);
                                $variant_safe = noSQL($variant_trimmed);
                                $ages_for_query[] = "'" . $variant_safe . "'";
                            }
                        } else {
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    } else {
                        $trimmed_match = row("SELECT DISTINCT age FROM ages WHERE TRIM(age) = '$age_safe' LIMIT 1");
                        if ($trimmed_match && isset($trimmed_match['age'])) {
                            $ages_for_query[] = "'" . noSQL(trim($trimmed_match['age'])) . "'";
                        } else {
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    }
                }
            }
            
            // Убираем дубликаты
            $ages_for_query = array_unique($ages_for_query);
            
            if (!empty($ages_for_query)) {
                $where_ages = " AND EXISTS (SELECT 1 FROM ages a WHERE a.product_id = p.id AND a.age IN (" . implode(',', $ages_for_query) . "))";
            }
        }
        
        $query_sql = "SELECT DISTINCT p.*, pr.price as product_price, p.quantity
                      FROM products p
                      LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                      WHERE $where $where_authors $where_ages
                      ORDER BY p.name ASC 
                      LIMIT $offset, $limit";
        
        $result = rows($query_sql);
        
        // Преобразуем результаты в удобный формат
        $products = [];
        foreach ($result as $row) {
            $products[] = [
                'id' => $row['id'],
                'name' => isset($row['name']) ? $row['name'] : '',
                'description' => isset($row['description']) ? $row['description'] : '',
                'image' => isset($row['picture']) ? $row['picture'] : (isset($row['image']) ? $row['image'] : ''),
                'price' => isset($row['product_price']) && $row['product_price'] > 0 ? round($row['product_price']) : 0,
                'quantity' => isset($row['quantity']) ? intval($row['quantity']) : 99
            ];
        }
        
        return $products;
    }
    
    private function getProductsCount($query = '', $filter_authors = array(), $filter_ages = array())
    {
        // Формируем WHERE условие для поиска
        if (empty($query)) {
            $where = "1=0"; // Если запрос пустой, не показываем товары
        } else {
            $query_safe = noSQL($query);
            // Поиск по названию товара (name) и ID
            $where = "(p.name LIKE '%$query_safe%' OR p.id LIKE '%$query_safe%')";
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
            // Очищаем и нормализуем значения возрастов (убираем пробелы, декодируем URL)
            $ages_cleaned = array_map(function($age) {
                $decoded = urldecode($age);
                return trim($decoded);
            }, $filter_ages);
            
            // Для каждого возраста проверяем, как он хранится в базе
            $ages_for_query = [];
            foreach ($ages_cleaned as $age) {
                $age_safe = noSQL($age);
                $check_query = "SELECT DISTINCT age FROM ages WHERE age = '$age_safe' LIMIT 1";
                $check_result = row($check_query);
                
                if ($check_result && isset($check_result['age'])) {
                    $ages_for_query[] = "'" . noSQL($check_result['age']) . "'";
                } else {
                    // Для "0+" проверяем различные варианты
                    if (stripos($age, '0') === 0 && (stripos($age, '+') !== false || $age === '0')) {
                        $zero_plus_variants = rows("SELECT DISTINCT age FROM ages WHERE (TRIM(age) LIKE '0+%' OR TRIM(age) = '0+' OR TRIM(age) = '0' OR age LIKE '0+%' OR age = '0+' OR age = '0' OR age LIKE '%0+%') LIMIT 10");
                        if (!empty($zero_plus_variants)) {
                            foreach ($zero_plus_variants as $variant) {
                                $variant_trimmed = trim($variant['age']);
                                $variant_safe = noSQL($variant_trimmed);
                                $ages_for_query[] = "'" . $variant_safe . "'";
                            }
                        } else {
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    } else {
                        $trimmed_match = row("SELECT DISTINCT age FROM ages WHERE TRIM(age) = '$age_safe' LIMIT 1");
                        if ($trimmed_match && isset($trimmed_match['age'])) {
                            $ages_for_query[] = "'" . noSQL(trim($trimmed_match['age'])) . "'";
                        } else {
                            $ages_for_query[] = "'" . $age_safe . "'";
                        }
                    }
                }
            }
            
            // Убираем дубликаты
            $ages_for_query = array_unique($ages_for_query);
            
            if (!empty($ages_for_query)) {
                $where_ages = " AND EXISTS (SELECT 1 FROM ages a WHERE a.product_id = p.id AND a.age IN (" . implode(',', $ages_for_query) . "))";
            }
        }
        
        $count_query = "SELECT COUNT(*) AS total 
                       FROM products p
                       WHERE $where $where_authors $where_ages";
        
        $result = row($count_query);
        return isset($result['total']) ? intval($result['total']) : 0;
    }
    
    private function getCategories($parent_id = null)
    {
        if (empty($parent_id)) {
            // Корневые категории
            $where = "(parent_id = '' OR parent_id IS NULL)";
        } else {
            $parent_id_safe = noSQL($parent_id);
            $where = "BINARY parent_id = BINARY '$parent_id_safe'";
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
}
