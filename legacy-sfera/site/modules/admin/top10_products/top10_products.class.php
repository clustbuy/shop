<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class top10_products extends aModule
{
    /**
     * API модуль управления топ-10 товарами
     */
    function execute($arr)
    {
        // ВАЖНО: Очищаем весь буфер вывода перед JSON
        while (ob_get_level()) {
            ob_end_clean();
        }
        
        // Проверка авторизации
        if (!isset($_SESSION['admin_user'])) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Unauthorized']);
            exit;
        }
        
        $action = isset($_GET['action']) ? $_GET['action'] : 'list';
        
        // Проверка прав доступа
        $actionPermissions = [
            'list' => 'view',
            'create' => 'create',
            'delete' => 'delete',
            'updateSort' => 'sort',
            'search_product' => 'view'
        ];
        
        $requiredPermission = isset($actionPermissions[$action]) ? $actionPermissions[$action] : 'view';
        
        if (!ACL::check('top10_products', $requiredPermission)) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false, 
                'message' => 'Доступ запрещён: недостаточно прав'
            ]);
            exit;
        }
        
        switch ($action) {
            case 'list':
                $this->list_top10();
                break;
                
            case 'create':
                $this->create_top10();
                break;
                
            case 'delete':
                $this->delete_top10();
                break;
                
            case 'updateSort':
                $this->update_sort();
                break;
                
            case 'search_product':
                $this->search_product();
                break;
                
            default:
                $this->list_top10();
                break;
        }
        
        exit;
    }
    
    /**
     * Список топ-10 товаров
     */
    private function list_top10()
    {
        header('Content-Type: application/json');
        
        $query = "SELECT t.id, t.product_id, t.sort, t.active,
                         p.name as product_name
                  FROM top10_products t
                  LEFT JOIN products p ON BINARY t.product_id = BINARY p.id
                  ORDER BY t.sort ASC";
        
        $items = rows($query);
        
        echo json_encode([
            'success' => true,
            'data' => $items,
            'total' => count($items)
        ]);
    }
    
    /**
     * Добавить товар в топ-10
     */
    private function create_top10()
    {
        header('Content-Type: application/json');
        
        $product_id = isset($_POST['product_id']) ? trim($_POST['product_id']) : '';
        
        if (empty($product_id)) {
            echo json_encode([
                'success' => false,
                'message' => 'ID товара не указан'
            ]);
            return;
        }
        
        // Защита от SQL-инъекций
        $product_id_safe = noSQL($product_id);
        
        // Проверяем, существует ли товар
        $product = row("SELECT id, name FROM products WHERE BINARY id = BINARY '$product_id_safe'");
        if (empty($product)) {
            echo json_encode([
                'success' => false,
                'message' => 'Товар с указанным ID не найден'
            ]);
            return;
        }
        
        // Проверяем, не добавлен ли уже товар
        $existing = row("SELECT id FROM top10_products WHERE product_id = '$product_id_safe'");
        if (!empty($existing)) {
            echo json_encode([
                'success' => false,
                'message' => 'Товар уже добавлен в топ-10'
            ]);
            return;
        }
        
        // Получаем максимальный sort для установки в конец
        $maxSort = row("SELECT MAX(sort) as max_sort FROM top10_products");
        $sort = isset($maxSort['max_sort']) ? intval($maxSort['max_sort']) + 1 : 0;
        
        $query = "INSERT INTO top10_products (product_id, sort) 
                  VALUES ('$product_id_safe', $sort)";
        
        if (q($query)) {
            $id = insert_id();
            echo json_encode([
                'success' => true,
                'message' => 'Товар добавлен в топ-10',
                'data' => [
                    'id' => $id,
                    'product_id' => $product_id,
                    'product_name' => $product['name'],
                    'sort' => $sort
                ]
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка добавления товара'
            ]);
        }
    }
    
    /**
     * Удалить товар из топ-10
     */
    private function delete_top10()
    {
        header('Content-Type: application/json');
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        
        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'ID не указан']);
            return;
        }
        
        $query = "DELETE FROM top10_products WHERE id = $id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Товар удалён из топ-10'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка удаления'
            ]);
        }
    }
    
    /**
     * Обновить сортировку после drag & drop
     */
    private function update_sort()
    {
        header('Content-Type: application/json');
        
        $order = isset($_POST['order']) ? $_POST['order'] : '';
        
        if (empty($order)) {
            echo json_encode(['success' => false, 'message' => 'Порядок не указан']);
            return;
        }
        
        // Декодируем JSON
        if (is_string($order)) {
            $order = json_decode($order, true);
        }
        
        if (!is_array($order)) {
            echo json_encode(['success' => false, 'message' => 'Неверный формат данных']);
            return;
        }
        
        $i = 0;
        foreach ($order as $id) {
            $id = intval($id);
            if ($id > 0) {
                q("UPDATE top10_products SET sort = $i WHERE id = $id");
                $i++;
            }
        }
        
        echo json_encode([
            'success' => true,
            'message' => 'Порядок сохранён'
        ]);
    }
    
    /**
     * Поиск товара по ID
     */
    private function search_product()
    {
        header('Content-Type: application/json');
        
        $product_id = isset($_GET['product_id']) ? trim($_GET['product_id']) : '';
        
        if (empty($product_id)) {
            echo json_encode([
                'success' => false,
                'message' => 'ID товара не указан'
            ]);
            return;
        }
        
        // Защита от SQL-инъекций
        $product_id_safe = noSQL($product_id);
        
        $product = row("SELECT id, name FROM products WHERE BINARY id = BINARY '$product_id_safe'");
        
        if (empty($product)) {
            echo json_encode([
                'success' => false,
                'message' => 'Товар не найден'
            ]);
            return;
        }
        
        echo json_encode([
            'success' => true,
            'data' => $product
        ]);
    }
}

