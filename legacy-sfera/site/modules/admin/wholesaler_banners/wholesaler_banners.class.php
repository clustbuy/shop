<?php
include_once('site/classes/aModule.class.php');
include_once('site/classes/ACL.class.php');

class wholesaler_banners extends aModule
{
    /**
     * API модуль управления баннерами для оптовиков
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
            exit; // Останавливаем выполнение
        }

        $action = isset($_GET['action']) ? $_GET['action'] : 'list';

        // Проверка прав доступа (права называем wholesaler_banners)
        $actionPermissions = [
            'list'       => 'view',
            'upload'     => 'create',
            'create'     => 'create',
            'update'     => 'edit',
            'delete'     => 'delete',
            'sort'       => 'sort',
            'updateSort' => 'sort'
        ];

        $requiredPermission = isset($actionPermissions[$action]) ? $actionPermissions[$action] : 'view';

        if (!ACL::check('wholesaler_banners', $requiredPermission)) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => false,
                'message' => 'Доступ запрещён: недостаточно прав'
            ]);
            exit;
        }

        switch ($action) {
            case 'list':
                $this->list_banners();
                break;

            case 'create':
                $this->create_banner();
                break;

            case 'update':
                $this->update_banner();
                break;

            case 'delete':
                $this->delete_banner();
                break;

            case 'upload':
                $this->upload_banner();
                break;

            case 'sort':
                $this->sort_banners();
                break;

            case 'updateSort':
                $this->update_sort();
                break;

            default:
                $this->list_banners();
                break;
        }

        // Останавливаем выполнение после API ответа
        exit;
    }

    /**
     * Список баннеров
     */
    private function list_banners()
    {
        header('Content-Type: application/json');

        $query = "SELECT id, url, name, title, sort 
                  FROM wholesaler_banners 
                  ORDER BY sort ASC";

        $banners = rows($query);

        echo json_encode([
            'success' => true,
            'data' => $banners,
            'total' => count($banners)
        ]);
    }

    /**
     * Создать баннер
     */
    private function create_banner()
    {
        header('Content-Type: application/json');

        $url = isset($_POST['url']) ? noSQL($_POST['url']) : '';
        $name = isset($_POST['name']) ? noSQL($_POST['name']) : '';
        $title = isset($_POST['title']) ? noSQL($_POST['title']) : '';
        $sort = isset($_POST['sort']) ? intval($_POST['sort']) : 0;

        if (empty($url) || empty($name)) {
            echo json_encode([
                'success' => false,
                'message' => 'URL и название обязательны'
            ]);
            return;
        }

        $query = "INSERT INTO wholesaler_banners (url, name, title, sort) 
                  VALUES ('$url', '$name', '$title', $sort)";

        if (q($query)) {
            $id = insert_id();
            echo json_encode([
                'success' => true,
                'message' => 'Баннер создан',
                'data' => [
                    'id' => $id,
                    'url' => $url,
                    'name' => $name,
                    'title' => $title,
                    'sort' => $sort
                ]
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка создания баннера'
            ]);
        }
    }

    /**
     * Обновить баннер
     */
    private function update_banner()
    {
        header('Content-Type: application/json');

        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;

        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'ID не указан']);
            return;
        }

        $fields = [];

        if (isset($_POST['url'])) {
            $fields[] = "url = '" . noSQL($_POST['url']) . "'";
        }
        if (isset($_POST['name'])) {
            $fields[] = "name = '" . noSQL($_POST['name']) . "'";
        }
        if (isset($_POST['title'])) {
            $fields[] = "title = '" . noSQL($_POST['title']) . "'";
        }
        if (isset($_POST['sort'])) {
            $fields[] = "sort = " . intval($_POST['sort']);
        }

        if (empty($fields)) {
            echo json_encode(['success' => false, 'message' => 'Нет данных для обновления']);
            return;
        }

        $query = "UPDATE wholesaler_banners SET " . implode(', ', $fields) . " WHERE id = $id";

        if (q($query)) {
            echo json_encode([
                'success' => true,
                'message' => 'Баннер обновлён'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка обновления'
            ]);
        }
    }

    /**
     * Удалить баннер
     */
    private function delete_banner()
    {
        header('Content-Type: application/json');

        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;

        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'ID не указан']);
            return;
        }

        // Получаем URL баннера для удаления файла
        $banner = row("SELECT url FROM wholesaler_banners WHERE id = $id");

        if (empty($banner)) {
            echo json_encode(['success' => false, 'message' => 'Баннер не найден']);
            return;
        }

        // Удаляем из БД
        $query = "DELETE FROM wholesaler_banners WHERE id = $id";

        if (q($query)) {
            // Удаляем файл если он локальный
            if (strpos($banner['url'], '/assets/') === 0) {
                $file_path = $_SERVER['DOCUMENT_ROOT'] . $banner['url'];
                if (file_exists($file_path)) {
                    @unlink($file_path);
                }
            }

            echo json_encode([
                'success' => true,
                'message' => 'Баннер удалён'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Ошибка удаления'
            ]);
        }
    }

    /**
     * Загрузить файл баннера
     */
    private function upload_banner()
    {
        header('Content-Type: application/json');

        if (!isset($_FILES['file'])) {
            echo json_encode(['success' => false, 'message' => 'Файл не загружен']);
            return;
        }

        $file = $_FILES['file'];
        // Можно создать отдельную папку для оптовых баннеров
        $upload_dir = $_SERVER['DOCUMENT_ROOT'] . '/upload/wholesaler_banners/';

        // Создаем папку если её нет
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        // Проверка типа файла
        $allowed_types = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/webp'];
        if (!in_array($file['type'], $allowed_types)) {
            echo json_encode(['success' => false, 'message' => 'Неверный тип файла']);
            return;
        }

        // Генерируем уникальное имя
        $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
        $filename = 'w_banner_' . time() . '_' . uniqid() . '.' . $ext;
        $filepath = $upload_dir . $filename;

        // Перемещаем файл
        if (move_uploaded_file($file['tmp_name'], $filepath)) {
            $url = '/upload/wholesaler_banners/' . $filename;

            echo json_encode([
                'success' => true,
                'message' => 'Файл загружен',
                'url' => $url,
                'filename' => $filename
            ]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Ошибка загрузки файла']);
        }
    }

    /**
     * Массовое изменение сортировки
     */
    private function sort_banners()
    {
        header('Content-Type: application/json');

        $data = json_decode(file_get_contents('php://input'), true);

        if (!isset($data['banners']) || !is_array($data['banners'])) {
            echo json_encode(['success' => false, 'message' => 'Неверные данные']);
            return;
        }

        foreach ($data['banners'] as $banner) {
            $id = intval($banner['id']);
            $sort = intval($banner['sort']);
            q("UPDATE wholesaler_banners SET sort = $sort WHERE id = $id");
        }

        echo json_encode([
            'success' => true,
            'message' => 'Порядок обновлён'
        ]);
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

        // Очищаем от лишних символов
        $order = str_replace(array('[',']','"'), '', $order);
        $order = explode(',', $order);

        $i = 0;
        foreach ($order as $id) {
            $id = intval($id);
            if ($id > 0) {
                q("UPDATE wholesaler_banners SET sort = $i WHERE id = $id");
                $i++;
            }
        }

        echo json_encode([
            'success' => true,
            'message' => 'Порядок сохранён'
        ]);
    }
}
?>
