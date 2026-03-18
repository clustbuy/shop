<?php
include_once('site/classes/aModule.class.php');

class popular_categories extends aModule
{
    function execute($arr)
    {
        // Очищаем буфер вывода перед JSON
        while (ob_get_level()) {
            ob_end_clean();
        }
        
        // Проверка авторизации (используем admin_user как в других модулях)
        if (!isset($_SESSION['admin_user'])) {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode(['success' => false, 'message' => 'Unauthorized']);
            exit;
        }
        
        $action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'index';

        switch ($action) {
            case 'get_tree':
                $this->getTree();
                break;
            case 'get_popular':
                $this->getPopular();
                break;
            case 'add_popular':
                $this->addPopular();
                break;
            case 'remove_popular':
                $this->removePopular();
                break;
            case 'save_order':
                $this->saveOrder();
                break;
            case 'upload_image':
                $this->uploadImage();
                break;
            default:
                $this->showIndex();
                break;
        }
    }

    private function showIndex()
    {
        echo '';
    }

    /**
     * Получить дерево категорий для ExtJS 4.x TreeStore
     */
    private function getTree()
    {
        header('Content-Type: application/json; charset=utf-8');

        try {
            // ExtJS 4.x TreeStore передает параметр 'node'
            $node = isset($_REQUEST['node']) ? $_REQUEST['node'] : 'root';
            
            if ($node === 'root') {
                // Корневые узлы - где parent_id пустой или NULL
                $query = "SELECT id, name as text, id as guid FROM tree WHERE parent_id = '' OR parent_id IS NULL";
            } else {
                // Дочерние узлы - где parent_id = ID родителя
                $nodeEscaped = noSQL($node);
                $query = "SELECT id, name as text, id as guid FROM tree WHERE parent_id = '$nodeEscaped'";
            }

            $nodes = rows($query);
            
            if (!$nodes) {
                $nodes = [];
            }

            // Для каждого узла проверяем наличие детей
            foreach ($nodes as $k => $v) {
                $categoryId = noSQL($v['id']);
                $children = row("SELECT COUNT(*) as count FROM tree WHERE parent_id = '$categoryId'");
                
                // Устанавливаем leaf только если действительно нет детей
                $nodes[$k]['leaf'] = ($children['count'] == 0);
                
                // Если есть дети - НЕ добавляем children, ExtJS сам загрузит их
                // Просто устанавливаем expanded: false
                if ($children['count'] > 0) {
                    $nodes[$k]['expanded'] = false;
                }
            }

            echo json_encode($nodes, JSON_UNESCAPED_UNICODE);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * Получить список популярных категорий
     */
    private function getPopular()
    {
        header('Content-Type: application/json; charset=utf-8');

        try {
            $query = "SELECT pc.id, pc.category_id, pc.sort, pc.image, t.name as title, t.id as guid 
                      FROM popular_categories pc
                      LEFT JOIN tree t ON pc.category_id = t.id
                      WHERE pc.active = 1
                      ORDER BY pc.sort ASC";

            $data = rows($query);
            
            if (!$data) {
                $data = [];
            }

            echo json_encode([
                'success' => true,
                'rows' => $data,
                'results' => count($data)
            ], JSON_UNESCAPED_UNICODE);
        } catch (Exception $e) {
            echo json_encode([
                'success' => false,
                'message' => $e->getMessage(),
                'rows' => [],
                'results' => 0
            ], JSON_UNESCAPED_UNICODE);
        }
    }

    /**
     * Добавить категорию в популярные
     */
    private function addPopular()
    {
        header('Content-Type: application/json; charset=utf-8');

        $category_id = isset($_POST['category_id']) ? noSQL($_POST['category_id']) : '';

        if (empty($category_id)) {
            echo json_encode(['success' => false, 'message' => 'ID категории не указан']);
            return;
        }

        // Проверяем, не добавлена ли уже
        $check = row("SELECT id FROM popular_categories WHERE category_id = '$category_id' AND active = 1");
        if ($check) {
            echo json_encode(['success' => false, 'message' => 'Эта категория уже в списке популярных']);
            return;
        }

        // Получаем максимальный sort
        $maxSort = row("SELECT MAX(sort) as max_sort FROM popular_categories WHERE active = 1");
        $sort = ($maxSort && $maxSort['max_sort'] !== null) ? intval($maxSort['max_sort']) + 1 : 1;

        $query = "INSERT INTO popular_categories (category_id, sort, active) VALUES ('$category_id', $sort, 1)";
        
        if (q($query)) {
            echo json_encode(['success' => true, 'message' => 'Категория добавлена']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка добавления']);
        }
    }

    /**
     * Удалить категорию
     */
    private function removePopular()
    {
        header('Content-Type: application/json; charset=utf-8');

        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;

        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'ID не указан']);
            return;
        }

        if (q("DELETE FROM popular_categories WHERE id = $id")) {
            echo json_encode(['success' => true, 'message' => 'Категория удалена']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка удаления']);
        }
    }

    /**
     * Сохранить порядок
     */
    private function saveOrder()
    {
        header('Content-Type: application/json; charset=utf-8');

        $order = isset($_POST['order']) ? $_POST['order'] : '';

        if (empty($order)) {
            echo json_encode(['success' => false, 'message' => 'Порядок не указан']);
            return;
        }

        $order = str_replace(['[',']','"'], '', $order);
        $order = explode(',', $order);
        
        $i = 0;
        foreach ($order as $id) {
            $id = intval($id);
            if ($id > 0) {
                q("UPDATE popular_categories SET sort = $i WHERE id = $id");
                $i++;
            }
        }

        echo json_encode(['success' => true, 'message' => '']);
    }

    /**
     * Загрузить изображение
     */
    private function uploadImage()
    {
        header('Content-Type: application/json; charset=utf-8');

        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;

        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'ID не указан']);
            return;
        }

        if (!isset($_FILES['image']) || $_FILES['image']['error'] != 0) {
            echo json_encode(['success' => false, 'message' => 'Файл не загружен']);
            return;
        }

        $allowed = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/webp'];
        if (!in_array($_FILES['image']['type'], $allowed)) {
            echo json_encode(['success' => false, 'message' => 'Недопустимый тип файла']);
            return;
        }

        $uploadDir = 'public/images/popular_categories/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $filename = $id . '_' . time() . '.' . $extension;
        $filepath = $uploadDir . $filename;

        if (move_uploaded_file($_FILES['image']['tmp_name'], $filepath)) {
            $filepathEscaped = noSQL($filepath);
            q("UPDATE popular_categories SET image = '$filepathEscaped' WHERE id = $id");
            echo json_encode(['success' => true, 'message' => 'Изображение загружено', 'image' => $filepath]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка сохранения файла']);
        }
    }
}

