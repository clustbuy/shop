<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class series extends aModule
{
    function execute($arr)
    {
        // Получаем параметр series из URL для фильтрации по серии
        $data = isset($arr['send_params']['q']) ? getDataFromPath($arr['send_params']['q']) : [];
        $series_name = isset($data['series']) ? $data['series'] : '';
        
        // Если указана конкретная серия, показываем её товары
        if (!empty($series_name)) {
            $this->showSeriesProducts($series_name);
            return;
        }
        
        // Иначе показываем список всех серий
        $this->showSeriesList();
    }
    
    /**
     * Показать список всех серий в алфавитном порядке
     */
    private function showSeriesList()
    {
        // Получаем все серии с количеством товаров из view v_seriya
        $query = "SELECT 
                    id,
                    value AS name,
                    cnt AS count
                  FROM v_seriya
                  ORDER BY value ASC";
        
        $result = rows($query);
        
        $series = [];
        if ($result && is_array($result)) {
            foreach ($result as $row) {
                $series[] = [
                    'id' => intval($row['id']),
                    'name' => $row['name'],
                    'count' => intval($row['count'])
                ];
            }
        }
        
        // Группируем серии по первой букве для удобного отображения
        $groupedSeries = [];
        foreach ($series as $serie) {
            if (!empty($serie['name'])) {
                $firstLetter = mb_strtoupper(mb_substr($serie['name'], 0, 1, 'UTF-8'), 'UTF-8');
                // Если первая буква не кириллица и не латиница, используем "#"
                if (!preg_match('/[А-ЯЁA-Z]/u', $firstLetter)) {
                    $firstLetter = '#';
                }
                if (!isset($groupedSeries[$firstLetter])) {
                    $groupedSeries[$firstLetter] = [];
                }
                $groupedSeries[$firstLetter][] = $serie;
            }
        }
        
        // Сортируем группы по алфавиту
        ksort($groupedSeries);
        
        // Подготовка данных для шаблона
        $_SESSION['smarty']->assign('series', $series);
        $_SESSION['smarty']->assign('groupedSeries', $groupedSeries);
        $_SESSION['smarty']->assign('pageTitle', 'Серии');
        
        // Проверяем, что шаблон существует
        $templatePath = 'site/modules/sfera/series/series.tpl';
        if (!file_exists($templatePath)) {
            die("ERROR: Template not found: $templatePath");
        }
        
        try {
            $_SESSION['smarty']->display('sfera/series/series.tpl');
        } catch (Exception $e) {
            die("ERROR displaying template: " . $e->getMessage());
        }
    }
    
    /**
     * Показать товары конкретной серии
     */
    private function showSeriesProducts($series_name)
    {
        $series_name_safe = noSQL($series_name);
        
        // Получаем информацию о серии из view
        $seriesInfo = row("SELECT 
                            value AS name,
                            cnt AS count
                          FROM v_seriya
                          WHERE BINARY value = BINARY '$series_name_safe'
                          LIMIT 1");
        
        if (!$seriesInfo) {
            // Серия не найдена - показываем 404
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получаем все товары этой серии
        $query = "SELECT DISTINCT p.id, p.name, p.description, p.picture
                  FROM products p
                  INNER JOIN attributes a ON p.id = a.product_id
                  WHERE BINARY a.name = 'Серия'
                    AND BINARY a.value = BINARY '$series_name_safe'
                  ORDER BY p.name ASC";
        
        $products = rows($query);
        
        // Форматируем данные товаров
        $formattedProducts = [];
        foreach ($products as $product) {
            $formattedProducts[] = [
                'id' => $product['id'],
                'name' => isset($product['name']) ? $product['name'] : '',
                'description' => isset($product['description']) ? $product['description'] : '',
                'image' => isset($product['picture']) ? $product['picture'] : ''
            ];
        }
        
        // Подготовка данных для шаблона
        $_SESSION['smarty']->assign('series', [
            'name' => $seriesInfo['name'],
            'count' => intval($seriesInfo['count'])
        ]);
        $_SESSION['smarty']->assign('products', $formattedProducts);
        $_SESSION['smarty']->assign('pageTitle', 'Товары серии: ' . $seriesInfo['name']);
        
        // Используем шаблон author_books.tpl как основу (можно создать отдельный series_products.tpl позже)
        $_SESSION['smarty']->display('sfera/series/series_products.tpl');
    }
}

