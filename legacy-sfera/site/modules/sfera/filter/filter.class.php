<?php
include_once('site/classes/aModule.class.php');

class filter extends aModule
{
    function execute($arr)
    {
        // Получаем параметры из filter_params или из $_REQUEST
        $filter_params = isset($arr['filter_params']) ? $arr['filter_params'] : array();
        
        // Получаем action URL для формы (куда отправлять фильтры)
        $action_url = isset($arr['action_url']) ? $arr['action_url'] : '/catalog/';
        
        // Получение фильтров из POST или GET параметров (POST имеет приоритет)
        // POST имеет приоритет, если форма отправлена через POST
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && (isset($_POST['author']) || isset($_POST['age']) || isset($_POST['seriya']) || isset($_POST['product_type']) || isset($_POST['topic']))) {
            $filter_authors = isset($_POST['author']) ? (is_array($_POST['author']) ? $_POST['author'] : array($_POST['author'])) : array();
            $filter_ages = isset($_POST['age']) ? (is_array($_POST['age']) ? $_POST['age'] : array($_POST['age'])) : array();
            $filter_series = isset($_POST['seriya']) ? (is_array($_POST['seriya']) ? $_POST['seriya'] : array($_POST['seriya'])) : array();
            $filter_product_types = isset($_POST['product_type']) ? (is_array($_POST['product_type']) ? $_POST['product_type'] : array($_POST['product_type'])) : array();
            $filter_topics = isset($_POST['topic']) ? (is_array($_POST['topic']) ? $_POST['topic'] : array($_POST['topic'])) : array();
            
            // После POST делаем редирект на GET с параметрами для возможности пагинации
            $redirect_url = $action_url;
            
            $params = array();
            
            // Если это поиск, сохраняем query параметр
            if (isset($_GET['query'])) {
                $params[] = 'query=' . urlencode($_GET['query']);
            }
            
            // Используем 'author[]', 'age[]', 'seriya[]', 'product_type[]', 'topic[]' для правильной передачи массивов через GET
            foreach ($filter_authors as $author) {
                $params[] = 'author[]=' . urlencode($author);
            }
            foreach ($filter_ages as $age) {
                $params[] = 'age[]=' . urlencode($age);
            }
            foreach ($filter_series as $seriya) {
                $params[] = 'seriya[]=' . urlencode($seriya);
            }
            foreach ($filter_product_types as $product_type) {
                $params[] = 'product_type[]=' . urlencode($product_type);
            }
            foreach ($filter_topics as $topic) {
                $params[] = 'topic[]=' . urlencode($topic);
            }
            
            if (!empty($params)) {
                $redirect_url .= (strpos($redirect_url, '?') !== false ? '&' : '?') . implode('&', $params);
            }
            
            header('Location: ' . $redirect_url);
            exit;
        } else {
            // Fallback to GET for pagination and direct links
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
        }
        
        // Получение авторов для фильтра (первые 4 по популярности)
        $authors = $this->getAuthors(4);
        
        // Получение возрастов для фильтра
        $ages = $this->getAges();
        
        // Получение серий для фильтра (первые 4 по популярности)
        $series = $this->getSeries(4);
        
        // Получение типов товаров для фильтра (первые 4 по популярности)
        $product_types = $this->getProductTypes(4);
        
        // Получение тематик для фильтра (первые 4 по популярности)
        $topics = $this->getTopics(4);
        
        // Подготовка данных для шаблона
        $_SESSION['smarty']->assign('authors', $authors);
        $_SESSION['smarty']->assign('ages', $ages);
        $_SESSION['smarty']->assign('series', $series);
        $_SESSION['smarty']->assign('product_types', $product_types);
        $_SESSION['smarty']->assign('topics', $topics);
        $_SESSION['smarty']->assign('filter_authors', $filter_authors);
        $_SESSION['smarty']->assign('filter_ages', $filter_ages);
        $_SESSION['smarty']->assign('filter_series', $filter_series);
        $_SESSION['smarty']->assign('filter_product_types', $filter_product_types);
        $_SESSION['smarty']->assign('filter_topics', $filter_topics);
        $_SESSION['smarty']->assign('action_url', $action_url);
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/filter/filter.tpl'));
    }
    
    /**
     * Получение списка авторов для фильтра
     * @param int $limit Количество авторов для отображения
     * @return array
     */
    private function getAuthors($limit = 4)
    {
        $limit = (int)$limit;
        $query = "SELECT 
                    author_name,
                    COUNT(*) AS cnt
                  FROM authors a
                  GROUP BY author_name
                  ORDER BY cnt DESC
                  LIMIT $limit";
        
        $result = rows($query);
        
        $authors = [];
        foreach ($result as $row) {
            $authors[] = [
                'name' => $row['author_name'],
                'count' => intval($row['cnt'])
            ];
        }
        
        return $authors;
    }
    
    /**
     * Получение списка возрастов для фильтра
     * @return array
     */
    private function getAges()
    {
        $query = "SELECT age, COUNT(*) AS cnt 
                  FROM ages 
                  GROUP BY age 
                  ORDER BY age ASC";
        
        $result = rows($query);
        
        $ages = [];
        $zeroPlus = null;
        
        foreach ($result as $row) {
            $value = trim($row['age']);
            
            // Пропускаем пустые значения
            if (empty($value)) {
                continue;
            }
            
            $ageData = [
                'value' => $value,
                'count' => intval($row['cnt'])
            ];
            
            // Отдельно сохраняем "0+" для размещения в начале
            // Проверяем различные варианты записи "0+"
            if (stripos($value, '0+') !== false || 
                $value === '0' || 
                $value === '0-' ||
                preg_match('/^0\s*\+/i', $value) ||
                preg_match('/^0\s*-\s*0/i', $value)) {
                // Если уже есть запись "0+", объединяем счетчики
                if ($zeroPlus !== null) {
                    $zeroPlus['count'] += $ageData['count'];
                    // Используем более полное значение (содержащее "+")
                    if (stripos($value, '+') !== false || stripos($value, '0+') !== false) {
                        $zeroPlus['value'] = $value;
                    }
                } else {
                    $zeroPlus = $ageData;
                }
            } else {
                // Добавляем максимальное число для сортировки
                $ageData['max_age'] = $this->extractAgeNumber($value);
                $ages[] = $ageData;
            }
        }
        
        // Сортируем возрасты по возрастанию максимального числа в диапазоне
        usort($ages, function($a, $b) {
            // Сравниваем по максимальному числу
            if ($a['max_age'] !== $b['max_age']) {
                return $a['max_age'] - $b['max_age'];
            }
            
            // Если максимальные числа равны, сравниваем по строке
            return strcmp($a['value'], $b['value']);
        });
        
        // Добавляем "0+" в начало, если он был найден
        if ($zeroPlus !== null) {
            array_unshift($ages, $zeroPlus);
        }
        
        return $ages;
    }
    
    /**
     * Извлечение числового значения возраста из строки
     * Для диапазонов (например, "3-11 лет") возвращает максимальное число
     * @param string $ageString Строка с возрастом (например, "3-5 лет", "7+", "12", "3-11 лет")
     * @return int Числовое значение возраста (максимальное для диапазонов)
     */
    private function extractAgeNumber($ageString)
    {
        // Ищем все числа в строке (используем более точный паттерн)
        if (preg_match_all('/\d+/', $ageString, $matches)) {
            $numbers = array_map('intval', $matches[0]);
            // Возвращаем максимальное число (для диапазонов это будет второе число)
            // Например: "3-11 лет" -> [3, 11] -> 11
            // "3-4 года" -> [3, 4] -> 4
            // "3-5 лет" -> [3, 5] -> 5
            // "3-7 лет" -> [3, 7] -> 7
            $maxNum = max($numbers);
            return $maxNum;
        }
        
        // Если число не найдено, возвращаем большое число для сортировки в конец
        return 999;
    }
    
    /**
     * Получение списка серий для фильтра
     * @param int $limit Количество серий для отображения
     * @return array
     */
    private function getSeries($limit = 4)
    {
        $limit = (int)$limit;
        $query = "SELECT 
                    value AS name,
                    cnt AS count
                  FROM v_seriya
                  ORDER BY cnt DESC
                  LIMIT $limit";
        
        $result = rows($query);
        
        $series = [];
        foreach ($result as $row) {
            $series[] = [
                'name' => $row['name'],
                'count' => intval($row['count'])
            ];
        }
        
        return $series;
    }
    
    /**
     * Получение списка типов товаров для фильтра
     * @param int $limit Количество типов товаров для отображения
     * @return array
     */
    private function getProductTypes($limit = 4)
    {
        $limit = (int)$limit;
        $query = "SELECT 
                    value AS name,
                    cnt AS count
                  FROM v_tip_tovara
                  ORDER BY cnt DESC
                  LIMIT $limit";
        
        $result = rows($query);
        
        $product_types = [];
        foreach ($result as $row) {
            $product_types[] = [
                'name' => $row['name'],
                'count' => intval($row['count'])
            ];
        }
        
        return $product_types;
    }
    
    /**
     * Получение списка тематик для фильтра
     * @param int $limit Количество тематик для отображения
     * @return array
     */
    private function getTopics($limit = 4)
    {
        $limit = (int)$limit;
        $query = "SELECT 
                    value AS name,
                    cnt AS count
                  FROM v_tematika
                  ORDER BY cnt DESC
                  LIMIT $limit";
        
        $result = rows($query);
        
        $topics = [];
        foreach ($result as $row) {
            $topics[] = [
                'name' => $row['name'],
                'count' => intval($row['count'])
            ];
        }
        
        return $topics;
    }
}

