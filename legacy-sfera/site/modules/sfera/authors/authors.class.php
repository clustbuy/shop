<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class authors extends aModule
{
    function execute($arr)
    {
        // Получаем параметр author из URL для фильтрации по автору
        $data = isset($arr['send_params']['q']) ? getDataFromPath($arr['send_params']['q']) : [];
        $author_name = isset($data['authors']) ? $data['authors'] : '';
        
        // Если указан конкретный автор, показываем его книги
        if (!empty($author_name)) {
            $this->showAuthorBooks($author_name);
            return;
        }
        
        // Иначе показываем список всех авторов
        $this->showAuthorsList();
    }
    
    /**
     * Показать список всех авторов в алфавитном порядке
     */
    private function showAuthorsList()
    {
        // Получаем всех авторов с количеством книг, отсортированных по алфавиту
        $query = "SELECT 
                    author_name,
                    COUNT(*) AS cnt
                  FROM authors a
                  GROUP BY author_name
                  ORDER BY author_name ASC";
        
        $result = rows($query);
        
        $authors = [];
        if ($result && is_array($result)) {
            foreach ($result as $row) {
                $authors[] = [
                    'name' => $row['author_name'],
                    'count' => intval($row['cnt'])
                ];
            }
        }
        
        // Группируем авторов по первой букве для удобного отображения
        $groupedAuthors = [];
        foreach ($authors as $author) {
            if (!empty($author['name'])) {
                $firstLetter = mb_strtoupper(mb_substr($author['name'], 0, 1, 'UTF-8'), 'UTF-8');
                if (!isset($groupedAuthors[$firstLetter])) {
                    $groupedAuthors[$firstLetter] = [];
                }
                $groupedAuthors[$firstLetter][] = $author;
            }
        }
        
        // Подготовка данных для шаблона
        $_SESSION['smarty']->assign('authors', $authors);
        $_SESSION['smarty']->assign('groupedAuthors', $groupedAuthors);
        $_SESSION['smarty']->assign('pageTitle', 'Авторы');
        
        // Проверяем, что шаблон существует
        $templatePath = 'site/modules/sfera/authors/authors.tpl';
        if (!file_exists($templatePath)) {
            die("ERROR: Template not found: $templatePath");
        }
        
        try {
            $_SESSION['smarty']->display('sfera/authors/authors.tpl');
        } catch (Exception $e) {
            die("ERROR displaying template: " . $e->getMessage());
        }
    }
    
    /**
     * Показать книги конкретного автора
     */
    private function showAuthorBooks($author_name)
    {
        $author_name_safe = noSQL($author_name);
        
        // Получаем информацию об авторе
        $authorInfo = row("SELECT 
                            author_name,
                            COUNT(*) AS cnt
                          FROM authors
                          WHERE BINARY author_name = BINARY '$author_name_safe'
                          GROUP BY author_name");
        
        if (!$authorInfo) {
            // Автор не найден - показываем 404
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));
            die();
        }
        
        // Получаем все товары этого автора
        $query = "SELECT DISTINCT p.id, p.name, p.description, p.picture
                  FROM products p
                  INNER JOIN authors a ON p.id = a.product_id
                  WHERE BINARY a.author_name = BINARY '$author_name_safe'
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
        $_SESSION['smarty']->assign('author', [
            'name' => $authorInfo['author_name'],
            'count' => intval($authorInfo['cnt'])
        ]);
        $_SESSION['smarty']->assign('products', $formattedProducts);
        $_SESSION['smarty']->assign('pageTitle', 'Книги автора: ' . $authorInfo['author_name']);
        
        $_SESSION['smarty']->display('sfera/authors/author_books.tpl');
    }
}

