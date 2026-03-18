<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

/**
 * API модуль управления обзорами продукции
 * Работает аналогично модулю menu
 */
class reviews extends aModule
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
            'list_reviews' => 'view',
            'get_review' => 'view',
            'create' => 'create',
            'update' => 'edit',
            'delete' => 'delete',
            'saveOrder' => 'edit'
        ];
        
        $requiredPermission = isset($actionPermissions[$action]) ? $actionPermissions[$action] : 'view';
        
        if (!ACL::check('reviews', $requiredPermission)) {
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
                
            case 'list_reviews':
                $this->list_reviews();
                break;
                
            case 'get_review':
                $this->get_review();
                break;
                
            case 'create':
                $this->create_review();
                break;
                
            case 'update':
                $this->update_review();
                break;
                
            case 'delete':
                $this->delete_review();
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
     * Получить дочерние узлы для TreeLoader
     */
    private function getNode()
    {
        header('Content-Type: application/json');
        
        $node = isset($_REQUEST['node']) ? intval($_REQUEST['node']) : 0;
        
        // Если node = 0, возвращаем корневые узлы (parent_id IS NULL или parent_id = 0)
        if ($node == 0 || $node == 'root') {
            $query = "SELECT id, name, title, parent_id, sort, active 
                      FROM product_reviews 
                      WHERE parent_id IS NULL OR parent_id = 0 
                      ORDER BY sort ASC";
        } else {
            $query = "SELECT id, name, title, parent_id, sort, active 
                      FROM product_reviews 
                      WHERE parent_id = $node 
                      ORDER BY sort ASC";
        }
        
        $reviews = rows($query);
        
        $nodes = [];
        foreach ($reviews as $review) {
            // Проверяем, есть ли дочерние узлы
            $hasChildren = row("SELECT COUNT(*) as cnt FROM product_reviews WHERE parent_id = " . intval($review['id']));
            $leaf = ($hasChildren && $hasChildren['cnt'] > 0) ? false : true;
            
            $nodes[] = [
                'id' => intval($review['id']),
                'text' => $review['name'],
                'name' => $review['name'],
                'title' => $review['title'],
                'parent_id' => $review['parent_id'] ? intval($review['parent_id']) : null,
                'sort' => intval($review['sort']),
                'status' => intval($review['active']),
                'leaf' => $leaf,
                'expanded' => false
            ];
        }
        
        echo json_encode($nodes);
    }
    
    /**
     * Получить всё дерево обзоров (для TreeStore)
     */
    private function list_reviews()
    {
        header('Content-Type: application/json');
        
        // Получаем все обзоры
        $query = "SELECT id, name, title, parent_id, sort, active FROM product_reviews ORDER BY sort ASC";
        $reviews = rows($query);
        
        // Строим дерево
        $tree = $this->buildTree($reviews);
        
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
     * Получить данные обзора
     */
    private function get_review()
    {
        header('Content-Type: application/json');
        
        $review_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        
        if (!$review_id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID обзора обязателен'
            ]);
            return;
        }
        
        $query = "SELECT * FROM product_reviews WHERE id = " . $review_id . " LIMIT 1";
        $review = row($query);
        
        if (!$review) {
            echo json_encode([
                'success' => false,
                'message' => 'Обзор не найден'
            ]);
            return;
        }
        
        echo json_encode([
            'success' => true,
            'data' => $review
        ]);
    }
    
    /**
     * Создать обзор
     */
    private function create_review()
    {
        header('Content-Type: application/json');
        
        $name = isset($_POST['name']) ? trim($_POST['name']) : '';
        $name_safe = noSQL($name);
        
        if (empty($name_safe)) {
            echo json_encode([
                'success' => false,
                'message' => 'Название обзора обязательно'
            ]);
            return;
        }
        
        $title = isset($_POST['title']) ? trim($_POST['title']) : '';
        $title_safe = noSQL($title);
        
        $parent_id = isset($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
        if ($parent_id <= 0) {
            $parent_id = 0;
        }
        
        // Получаем максимальный sort для нового элемента
        if ($parent_id > 0) {
            $max_sort = row("SELECT MAX(sort) as max_sort FROM product_reviews WHERE parent_id = $parent_id");
        } else {
            $max_sort = row("SELECT MAX(sort) as max_sort FROM product_reviews WHERE parent_id IS NULL OR parent_id = 0");
        }
        $sort = (isset($max_sort['max_sort']) ? $max_sort['max_sort'] : 0) + 10;
        
        $active = isset($_POST['active']) ? intval($_POST['active']) : 1;
        
        $query = "INSERT INTO product_reviews (name, title, parent_id, sort, active) 
                  VALUES ('$name_safe', '$title_safe', $parent_id, $sort, $active)";
        
        if (q($query)) {
            $id = insert_id();
            echo json_encode([
                'success' => true,
                'message' => 'Обзор создан',
                'data' => [
                    'id' => $id,
                    'name' => $name_safe,
                    'title' => $title_safe,
                    'parent_id' => $parent_id,
                    'sort' => $sort,
                    'active' => $active
                ]
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка создания обзора'
            ]);
        }
    }
    
    /**
     * Обновить обзор
     */
    private function update_review()
    {
        header('Content-Type: application/json');
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        
        if (!$id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID обзора обязателен'
            ]);
            return;
        }
        
        $name = isset($_POST['name']) ? trim($_POST['name']) : '';
        $name_safe = noSQL($name);
        
        if (empty($name_safe)) {
            echo json_encode([
                'success' => false,
                'message' => 'Название обзора обязательно'
            ]);
            return;
        }
        
        $title = isset($_POST['title']) ? trim($_POST['title']) : '';
        $title_safe = noSQL($title);
        
        $image = isset($_POST['image']) ? trim($_POST['image']) : '';
        $image_safe = noSQL($image);
        
        $content = isset($_POST['content']) ? $_POST['content'] : '';
        $content_safe = noSQL($content);
        
        $parent_id = isset($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
        if ($parent_id <= 0 || $parent_id === null) {
            $parent_id = 0;
        }
        
        $active = isset($_POST['active']) ? intval($_POST['active']) : 1;
        
        $query = "UPDATE product_reviews 
                  SET name = '$name_safe', 
                      title = '$title_safe',
                      image = '$image_safe',
                      content = '$content_safe',
                      parent_id = $parent_id,
                      active = $active
                  WHERE id = $id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Обзор обновлён'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка обновления обзора'
            ]);
        }
    }
    
    /**
     * Удалить обзор
     */
    private function delete_review()
    {
        header('Content-Type: application/json');
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        
        if (!$id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID обзора обязателен'
            ]);
            return;
        }
        
        // Проверяем, есть ли дочерние обзоры
        $children = row("SELECT COUNT(*) as cnt FROM product_reviews WHERE parent_id = $id");
        if ($children && $children['cnt'] > 0) {
            echo json_encode([
                'success' => false,
                'message' => 'Нельзя удалить обзор с дочерними обзорами'
            ]);
            return;
        }
        
        $query = "DELETE FROM product_reviews WHERE id = $id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Обзор удалён'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка удаления обзора'
            ]);
        }
    }
    
    /**
     * Сохранить порядок обзоров
     */
    private function saveOrder()
    {
        header('Content-Type: application/json');
        
        $node_id = isset($_POST['node_id']) ? intval($_POST['node_id']) : 0;
        $parent_id = isset($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
        $order_json = isset($_POST['order']) ? $_POST['order'] : '';
        
        if (!$node_id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID обзора обязателен'
            ]);
            return;
        }
        
        // Нормализуем parent_id: 0, null, '' -> 0
        if ($parent_id <= 0 || $parent_id === null) {
            $parent_id = 0;
        }
        
        // Обновляем parent_id
        $update_query = "UPDATE product_reviews SET parent_id = $parent_id WHERE id = $node_id";
        if (!q($update_query)) {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка обновления родителя'
            ]);
            return;
        }
        
        // Обновляем порядок
        if (!empty($order_json)) {
            $this->updateSort($order_json);
        }
        
        echo json_encode([
            'success' => true,
            'message' => 'Порядок сохранён'
        ]);
    }
    
    /**
     * Обновить порядок сортировки
     */
    private function updateSort($order_json)
    {
        $order = json_decode($order_json, true);
        
        if (!is_array($order)) {
            return;
        }
        
        $i = 0;
        foreach ($order as $id) {
            $id = intval($id);
            if ($id > 0) {
                q("UPDATE product_reviews SET sort = $i WHERE id = $id");
                $i++;
            }
        }
    }
}

