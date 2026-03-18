<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

/**
 * API модуль управления страницами (меню)
 * Работает по принципу tree из engine.js
 */
class menu extends aModule
{
    function execute($arr)
    {
        // Очищаем буфер вывода перед JSON
        while (ob_get_level()) {
            ob_end_clean();
        }
        
        // Проверка авторизации
        if (!isset($_SESSION['admin_user'])) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Unauthorized']);
            exit;
        }
        
        $action = isset($_GET['action']) ? $_GET['action'] : 'getNode';
        
        // Проверка прав доступа
        $actionPermissions = [
            'getNode' => 'view',
            'list_pages' => 'view',
            'get_page' => 'view',
            'create' => 'create',
            'update' => 'edit',
            'delete' => 'delete',
            'saveOrder' => 'edit'
        ];
        
        $requiredPermission = isset($actionPermissions[$action]) ? $actionPermissions[$action] : 'view';
        
        if (!ACL::check('menu', $requiredPermission)) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false, 
                'message' => 'Доступ запрещён: недостаточно прав'
            ]);
            exit;
        }
        
        switch ($action) {
            case 'getNode':
                $this->getNode();
                break;
                
            case 'list_pages':
                $this->list_pages();
                break;
                
            case 'get_page':
                $this->get_page();
                break;
                
            case 'create':
                $this->create_page();
                break;
                
            case 'update':
                $this->update_page();
                break;
                
            case 'delete':
                $this->delete_page();
                break;
                
            case 'saveOrder':
                $this->saveOrder();
                break;
                
            default:
                $this->getNode();
                break;
        }
        
        exit;
    }
    
    /**
     * Получить дочерние узлы для TreeLoader (как в engine.js)
     * Используется для асинхронной загрузки узлов
     */
    private function getNode()
    {
        header('Content-Type: application/json');
        
        $node = isset($_REQUEST['node']) ? intval($_REQUEST['node']) : 0;
        
        // Если node = 0, возвращаем корневые узлы (parent_id IS NULL или parent_id = 0)
        if ($node == 0 || $node == 'root') {
            $query = "SELECT id, name, title, parent_id, sort, active 
                      FROM pages 
                      WHERE parent_id IS NULL OR parent_id = 0 
                      ORDER BY sort ASC";
        } else {
            $query = "SELECT id, name, title, parent_id, sort, active 
                      FROM pages 
                      WHERE parent_id = $node 
                      ORDER BY sort ASC";
        }
        
        $pages = rows($query);
        
        $nodes = [];
        foreach ($pages as $page) {
            // Проверяем, есть ли дочерние узлы
            $hasChildren = row("SELECT COUNT(*) as cnt FROM pages WHERE parent_id = " . intval($page['id']));
            $leaf = ($hasChildren && $hasChildren['cnt'] > 0) ? false : true;
            
            $nodes[] = [
                'id' => intval($page['id']),
                'text' => $page['name'],
                'name' => $page['name'],
                'title' => $page['title'],
                'parent_id' => $page['parent_id'] ? intval($page['parent_id']) : null,
                'sort' => intval($page['sort']),
                'status' => intval($page['active']),
                'leaf' => $leaf,
                'expanded' => false
            ];
        }
        
        echo json_encode($nodes);
    }
    
    /**
     * Получить всё дерево страниц (для TreeStore)
     */
    private function list_pages()
    {
        header('Content-Type: application/json');
        
        // Получаем все страницы
        $query = "SELECT id, name, title, parent_id, sort, active FROM pages ORDER BY sort ASC";
        $pages = rows($query);
        
        // Строим дерево
        $tree = $this->buildTree($pages);
        
        echo json_encode([
            'success' => true,
            'children' => $tree
        ]);
    }
    
    /**
     * Построить дерево из плоского массива
     */
    private function buildTree($items, $parentId = null)
    {
        $branch = [];
        
        foreach ($items as $item) {
            // Нормализуем parent_id: NULL, '', 0 - всё считается корневым (null)
            $rawParentId = $item['parent_id'];
            if ($rawParentId === null || $rawParentId === '' || intval($rawParentId) === 0) {
                $itemParentId = null;
            } else {
                $itemParentId = intval($rawParentId);
            }
            
            // Нормализуем compareParentId аналогично
            if ($parentId === null || $parentId === '' || intval($parentId) === 0) {
                $compareParentId = null;
            } else {
                $compareParentId = intval($parentId);
            }
            
            if ($itemParentId === $compareParentId) {
                $children = $this->buildTree($items, $item['id']);
                
                $node = [
                    'id' => intval($item['id']),
                    'text' => $item['name'],
                    'name' => $item['name'],
                    'title' => $item['title'],
                    'parent_id' => $item['parent_id'],
                    'sort' => intval($item['sort']),
                    'status' => intval($item['active']),
                    'leaf' => empty($children),
                    'expanded' => false
                ];
                
                if (!empty($children)) {
                    $node['children'] = $children;
                }
                
                $branch[] = $node;
            }
        }
        
        return $branch;
    }
    
    /**
     * Получить данные страницы
     */
    private function get_page()
    {
        header('Content-Type: application/json');
        
        $page_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        
        if (!$page_id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID страницы обязателен'
            ]);
            return;
        }
        
        $query = "SELECT * FROM pages WHERE id = " . $page_id . " LIMIT 1";
        $page = row($query);
        
        if (!$page) {
            echo json_encode([
                'success' => false,
                'message' => 'Страница не найдена'
            ]);
            return;
        }
        
        echo json_encode([
            'success' => true,
            'data' => $page
        ]);
    }
    
    /**
     * Создать страницу
     */
    private function create_page()
    {
        header('Content-Type: application/json');
        
        $name = isset($_POST['name']) ? noSQL($_POST['name']) : '';
        $title = isset($_POST['title']) ? noSQL($_POST['title']) : '';
        $parent_id = isset($_POST['parent_id']) ? $_POST['parent_id'] : null;
        $content = isset($_POST['content']) ? $_POST['content'] : '';
        $sort = isset($_POST['sort']) ? intval($_POST['sort']) : 0;
        $status = isset($_POST['status']) ? intval($_POST['status']) : 1;
        
        if (empty($name)) {
            echo json_encode([
                'success' => false,
                'message' => 'Название обязательно'
            ]);
            return;
        }
        
        // Преобразуем parent_id
        $parentIdInt = null;
        if ($parent_id !== null && $parent_id !== '' && $parent_id !== 'null' && $parent_id !== 'undefined' && $parent_id != 0) {
            $parentIdInt = intval($parent_id);
        }
        
        // Экранируем content
        if (isset($GLOBALS['dbid']) && $GLOBALS['dbid']) {
            $contentEscaped = mysqli_real_escape_string($GLOBALS['dbid'], $content);
        } else {
            $contentEscaped = addslashes($content);
        }
        
        $nameEscaped = noSQL($name);
        $titleEscaped = noSQL($title);
        // Используем 0 для корневых элементов (как в базе данных)
        $parentSql = $parentIdInt !== null ? $parentIdInt : 0;
        
        // Вычисляем sort
        if ($sort <= 0) {
            if ($parentIdInt !== null) {
                $maxSort = row("SELECT MAX(sort) as max_sort FROM pages WHERE parent_id = $parentIdInt");
            } else {
                $maxSort = row("SELECT MAX(sort) as max_sort FROM pages WHERE parent_id IS NULL OR parent_id = 0");
            }
            $sort = ($maxSort && $maxSort['max_sort'] !== null) ? intval($maxSort['max_sort']) + 1 : 1;
        }
        
        $query = "INSERT INTO pages (name, title, parent_id, content, sort, active) 
                  VALUES ('$nameEscaped', '$titleEscaped', $parentSql, '$contentEscaped', $sort, $status)";
        
        $result = q($query);
        
        if ($result) {
            $id = insert_id();
            
            if (!$id || $id <= 0) {
                $lastIdResult = row("SELECT LAST_INSERT_ID() as id");
                if ($lastIdResult && isset($lastIdResult['id']) && $lastIdResult['id'] > 0) {
                    $id = intval($lastIdResult['id']);
                }
            }
            
            echo json_encode([
                'success' => true,
                'message' => 'Страница создана',
                'data' => [
                    'id' => intval($id),
                    'name' => $name,
                    'title' => $title,
                    'parent_id' => $parentIdInt,
                    'sort' => $sort,
                    'status' => $status
                ]
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка создания страницы'
            ]);
        }
    }
    
    /**
     * Обновить страницу
     */
    private function update_page()
    {
        header('Content-Type: application/json');
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        $name = isset($_POST['name']) ? noSQL($_POST['name']) : '';
        $title = isset($_POST['title']) ? noSQL($_POST['title']) : '';
        $parent_id = isset($_POST['parent_id']) ? (($_POST['parent_id'] !== null && $_POST['parent_id'] !== 'null' && $_POST['parent_id'] !== '' && $_POST['parent_id'] != 0) ? intval($_POST['parent_id']) : null) : null;
        $content = isset($_POST['content']) ? $_POST['content'] : '';
        $sort = isset($_POST['sort']) ? intval($_POST['sort']) : 0;
        $status = isset($_POST['status']) ? intval($_POST['status']) : 1;
        
        if (!$id || empty($name)) {
            echo json_encode([
                'success' => false,
                'message' => 'ID и название обязательны'
            ]);
            return;
        }
        
        // Экранируем content
        if (isset($GLOBALS['dbid']) && $GLOBALS['dbid']) {
            $contentEscaped = mysqli_real_escape_string($GLOBALS['dbid'], $content);
        } else {
            $contentEscaped = addslashes($content);
        }
        
        // Используем 0 для корневых элементов (как в базе данных)
        $parentSql = $parent_id !== null ? $parent_id : 0;
        
        $query = "UPDATE pages 
                  SET name = '$name', 
                      title = '$title', 
                      parent_id = $parentSql, 
                      content = '$contentEscaped',
                      sort = $sort,
                      active = $status
                  WHERE id = $id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Страница обновлена'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка обновления страницы'
            ]);
        }
    }
    
    /**
     * Удалить страницу
     */
    private function delete_page()
    {
        header('Content-Type: application/json');
        
        $id = 0;
        if (isset($_POST['id'])) {
            $id = intval($_POST['id']);
        } elseif (isset($_GET['id'])) {
            $id = intval($_GET['id']);
        } elseif (isset($_REQUEST['id'])) {
            $id = intval($_REQUEST['id']);
        }
        
        if (!$id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID обязателен'
            ]);
            return;
        }
        
        // Проверяем, нет ли дочерних страниц
        $children = rows("SELECT id FROM pages WHERE parent_id = $id");
        if (count($children) > 0) {
            echo json_encode([
                'success' => false,
                'message' => 'Нельзя удалить страницу, у которой есть дочерние страницы'
            ]);
            return;
        }
        
        $query = "DELETE FROM pages WHERE id = $id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Страница удалена'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка удаления страницы'
            ]);
        }
    }
    
    /**
     * Сохранить порядок после drag-and-drop (как в engine.js)
     */
    private function saveOrder()
    {
        header('Content-Type: application/json');
        
        $node_id = isset($_POST['node_id']) ? intval($_POST['node_id']) : 0;
        $parent_id = isset($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
        $order = isset($_POST['order']) ? $_POST['order'] : '';
        
        if (!$node_id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID узла обязателен'
            ]);
            return;
        }
        
        // Обновляем parent_id для перетаскиваемого узла
        // Используем 0 для корневых элементов (как в базе данных)
        $parentSql = ($parent_id > 0) ? $parent_id : 0;
        q("UPDATE pages SET parent_id = $parentSql WHERE id = $node_id");
        
        // Обновляем порядок сортировки (как updateSort в index — копия.php)
        if (!empty($order)) {
            $this->updateSort($order);
        }
        
        echo json_encode([
            'success' => true,
            'message' => ''
        ]);
    }
    
    /**
     * Обновить порядок сортировки (как updateSort в index — копия.php)
     */
    private function updateSort($order)
    {
        // Декодируем JSON массив
        $order = str_replace(['[', ']', '"'], '', $order);
        $orderArray = explode(',', $order);
        
        $i = 1; // sort начинается с 1
        foreach ($orderArray as $id) {
            $id = intval($id);
            if ($id > 0) {
                q("UPDATE pages SET sort = $i WHERE id = $id");
                $i++;
            }
        }
    }
}
