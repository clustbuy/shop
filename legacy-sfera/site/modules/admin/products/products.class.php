<?php 
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class products extends aModule
{
    /**
     * API модуль управления товарами
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
        
        $action = isset($_GET['action']) ? $_GET['action'] : 'list_categories';
        
        // Проверка прав доступа
        $actionPermissions = [
            'list_categories' => 'view',
            'list_products' => 'view',
            'create' => 'create',
            'update' => 'edit',
            'delete' => 'delete'
        ];
        
        $requiredPermission = isset($actionPermissions[$action]) ? $actionPermissions[$action] : 'view';
        
        if (!ACL::check('products', $requiredPermission)) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false, 
                'message' => 'Доступ запрещён: недостаточно прав'
            ]);
            exit;
        }
        
        switch ($action) {
            case 'list_categories':
                $this->list_categories();
                break;
                
            case 'list_products':
                $this->list_products();
                break;
                
            case 'create':
                $this->create_product();
                break;
                
            case 'update':
                $this->update_product();
                break;
                
            case 'delete':
                $this->delete_product();
                break;
                
            default:
                $this->list_categories();
                break;
        }
        
        exit;
    }
    
    /**
     * Получить дерево категорий
     * Возвращает иерархическую структуру для ExtJS TreeStore
     */
    private function list_categories()
    {
        header('Content-Type: application/json');
        
        // Получаем все категории
        $query = "SELECT id, name, parent_id FROM tree ORDER BY name";
        $categories = rows($query);
        
        // Строим дерево
        $tree = $this->buildTree($categories);
        
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
            if ($item['parent_id'] == $parentId || ($parentId === null && ($item['parent_id'] === null || $item['parent_id'] === ''))) {
                $children = $this->buildTree($items, $item['id']);
                
                $node = [
                    'id' => $item['id'],
                    'text' => $item['name'],
                    'name' => $item['name'],
                    'parent_id' => $item['parent_id'],
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
     * Получить breadcrumbs для категории
     * Возвращает цепочку категорий от корня до текущей
     */
    private function getBreadcrumbs($category_id)
    {
        $breadcrumbs = [];
        $current_id = $category_id;
        
        // Собираем цепочку от текущей категории до корня
        while ($current_id) {
            $query = "SELECT id, name, parent_id FROM tree WHERE id = '" . noSQL($current_id) . "' LIMIT 1";
            $category = row($query);
            
            if (!$category) {
                break;
            }
            
            // Добавляем категорию в начало массива (чтобы потом развернуть)
            array_unshift($breadcrumbs, [
                'id' => $category['id'],
                'name' => $category['name'],
                'slug' => rus_to_slug($category['name'])
            ]);
            
            // Переходим к родительской категории
            $current_id = $category['parent_id'];
            
            // Защита от бесконечного цикла
            if (count($breadcrumbs) > 100) {
                break;
            }
        }


        $res = "/";
        foreach ($breadcrumbs as $breadcrumb) {
            $res .= $breadcrumb['slug'].'/';
        }
        
        return $res;
    }
    
    /**
     * Получить товары категории
     */
    private function list_products()
    {
        header('Content-Type: application/json');
        
        $category_id = isset($_GET['category_id']) ? noSQL($_GET['category_id']) : null;
        
        if (!$category_id) {
            echo json_encode([
                'success' => false,
                'message' => 'Category ID is required'
            ]);
            return;
        }
        
        // Получаем breadcrumbs для категории
        $breadcrumbs = $this->getBreadcrumbs($category_id);
        
        // Ищем товары, связанные с категорией
        // Предполагаем, что есть таблица products с полем category_id
        // Если структура таблицы другая, адаптируйте запрос ниже
        
        // Вариант 1: если есть поле category_id в таблице products
        $query = "SELECT p.* 
                  FROM products p 
                  WHERE p.category_id = '" . $category_id . "' 
                  ORDER BY p.name";
        
        // Если таблицы products нет или структура другая, используйте альтернативный запрос:
        // Раскомментируйте и адаптируйте под вашу структуру:
        /*
        // Вариант 2: если используется связующая таблица product_categories
        $query = "SELECT p.* 
                  FROM products p
                  JOIN product_categories pc ON pc.product_id = p.id
                  WHERE pc.category_id = '" . $category_id . "' 
                  ORDER BY p.name";
        
        // Вариант 3: если категория хранится в JSON или другом формате
        // Адаптируйте запрос под вашу структуру
        */
        
        $products = rows($query);
        
        // Добавляем breadcrumbs и slug к каждому товару
        foreach ($products as &$product) {
            $product['breadcrumbs'] = $breadcrumbs;
            // Транслитерируем название товара для slug
            $product['slug'] = rus_to_slug($product['name']);
        }
        unset($product); // Сбрасываем ссылку
        
        echo json_encode([
            'success' => true,
            'data' => $products,
            'total' => count($products)
        ]);
    }
    
    /**
     * Создать товар
     */
    private function create_product()
    {
        header('Content-Type: application/json');
        
        $name = isset($_POST['name']) ? noSQL($_POST['name']) : '';
        $category_id = isset($_POST['category_id']) ? noSQL($_POST['category_id']) : '';
        $price = isset($_POST['price']) ? floatval($_POST['price']) : 0;
        $description = isset($_POST['description']) ? noSQL($_POST['description']) : '';
        
        if (empty($name) || empty($category_id)) {
            echo json_encode([
                'success' => false,
                'message' => 'Название и категория обязательны'
            ]);
            return;
        }
        
        // Адаптируйте под вашу структуру таблицы products
        $query = "INSERT INTO products (name, category_id, price, description) 
                  VALUES ('$name', '$category_id', $price, '$description')";
        
        if (q($query)) {
            $id = insert_id();
            echo json_encode([
                'success' => true,
                'message' => 'Товар создан',
                'data' => [
                    'id' => $id,
                    'name' => $name,
                    'category_id' => $category_id,
                    'price' => $price,
                    'description' => $description
                ]
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка создания товара'
            ]);
        }
    }
    
    /**
     * Обновить товар
     */
    private function update_product()
    {
        header('Content-Type: application/json');
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        $name = isset($_POST['name']) ? noSQL($_POST['name']) : '';
        $category_id = isset($_POST['category_id']) ? noSQL($_POST['category_id']) : '';
        $price = isset($_POST['price']) ? floatval($_POST['price']) : 0;
        $description = isset($_POST['description']) ? noSQL($_POST['description']) : '';
        
        if (!$id || empty($name)) {
            echo json_encode([
                'success' => false,
                'message' => 'ID и название обязательны'
            ]);
            return;
        }
        
        $query = "UPDATE products 
                  SET name = '$name', 
                      category_id = '$category_id', 
                      price = $price, 
                      description = '$description'
                  WHERE id = $id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Товар обновлён'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка обновления товара'
            ]);
        }
    }
    
    /**
     * Удалить товар
     */
    private function delete_product()
    {
        header('Content-Type: application/json');
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        
        if (!$id) {
            echo json_encode([
                'success' => false,
                'message' => 'ID обязателен'
            ]);
            return;
        }
        
        $query = "DELETE FROM products WHERE id = $id";
        
        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Товар удалён'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка удаления товара'
            ]);
        }
    }
}

