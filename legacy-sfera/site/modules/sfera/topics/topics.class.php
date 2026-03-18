<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class topics extends aModule
{
    function execute($arr)
    {
        // Получаем параметр topic из URL для фильтрации по тематике
        $data = isset($arr['send_params']['q']) ? getDataFromPath($arr['send_params']['q']) : [];
        $topic_name = isset($data['topics']) ? $data['topics'] : '';
        
        // Если указана конкретная тематика, показываем её товары
        if (!empty($topic_name)) {
            $this->showTopicProducts($topic_name);
            return;
        }
        
        // Иначе показываем список всех тематик
        $this->showTopicsList();
    }
    
    /**
     * Показать список всех тематик в алфавитном порядке
     */
    private function showTopicsList()
    {
        // Получаем все тематики с количеством товаров из view v_tematika
        $query = "SELECT 
                    id,
                    value AS name,
                    cnt AS count
                  FROM v_tematika
                  ORDER BY value ASC";
        
        $result = rows($query);
        
        $topics = [];
        if ($result && is_array($result)) {
            foreach ($result as $row) {
                $topics[] = [
                    'id' => intval($row['id']),
                    'name' => $row['name'],
                    'count' => intval($row['count'])
                ];
            }
        }
        
        // Группируем тематики по первой букве для удобного отображения
        $groupedTopics = [];
        foreach ($topics as $topic) {
            if (!empty($topic['name'])) {
                $firstLetter = mb_strtoupper(mb_substr($topic['name'], 0, 1, 'UTF-8'), 'UTF-8');
                // Если первая буква не кириллица и не латиница, используем "#"
                if (!preg_match('/[А-ЯЁA-Z]/u', $firstLetter)) {
                    $firstLetter = '#';
                }
                if (!isset($groupedTopics[$firstLetter])) {
                    $groupedTopics[$firstLetter] = [];
                }
                $groupedTopics[$firstLetter][] = $topic;
            }
        }
        
        // Сортируем группы по алфавиту
        ksort($groupedTopics);
        
        // Подготовка данных для шаблона
        $_SESSION['smarty']->assign('topics', $topics);
        $_SESSION['smarty']->assign('groupedTopics', $groupedTopics);
        $_SESSION['smarty']->assign('pageTitle', 'Тематики');
        
        // Проверяем, что шаблон существует
        $templatePath = 'site/modules/sfera/topics/topics.tpl';
        if (!file_exists($templatePath)) {
            die("ERROR: Template not found: $templatePath");
        }
        
        try {
            $_SESSION['smarty']->display('sfera/topics/topics.tpl');
        } catch (Exception $e) {
            die("ERROR displaying template: " . $e->getMessage());
        }
    }
    
    /**
     * Показать товары конкретной тематики
     */
    private function showTopicProducts($topic_name)
    {
        $topic_name_safe = noSQL($topic_name);
        
        // Получаем информацию о тематике из view
        $topicInfo = row("SELECT 
                            value AS name,
                            cnt AS count
                          FROM v_tematika
                          WHERE BINARY value = BINARY '$topic_name_safe'
                          LIMIT 1");
        
        if (!$topicInfo) {
            // Тематика не найдена - показываем 404
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получаем все товары этой тематики
        $query = "SELECT DISTINCT p.id, p.name, p.description, p.picture
                  FROM products p
                  INNER JOIN attributes a ON p.id = a.product_id
                  WHERE BINARY a.name = 'Тематика'
                    AND BINARY a.value = BINARY '$topic_name_safe'
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
        $_SESSION['smarty']->assign('topic', [
            'name' => $topicInfo['name'],
            'count' => intval($topicInfo['count'])
        ]);
        $_SESSION['smarty']->assign('products', $formattedProducts);
        $_SESSION['smarty']->assign('pageTitle', 'Товары тематики: ' . $topicInfo['name']);
        
        // Используем шаблон topic_products.tpl
        $_SESSION['smarty']->display('sfera/topics/topic_products.tpl');
    }
}

