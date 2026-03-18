<?php include_once('site/classes/aModule.class.php');

class breadcrumbs extends aModule
{
    function execute($arr)
    {
        $data = getDataFromPath($arr['send_params']['q']);
        
        switch ($arr['tpl']) {
            case 'item':
                // Получаем данные товара из sima_feed
                $sql = "SELECT 
                           sf.*,
                           ic.category_id
                       FROM sima_feed sf
                       JOIN item i ON i.sid = sf.art
                       JOIN item_category ic ON ic.item_id = i.id
                       WHERE sf.art = " . (int)$data['product'];
                       
                $product = $_SESSION['mysql']->getRow($sql);
                
                if ($product) {
                    // Получаем путь категории
                    $breadcrumbs = $this->getCategoryPath($product['category_id']);
                    // Добавляем название товара в конец
                    $breadcrumbs[] = [
                        'id' => $product['art'],
                        'title' => $product['title'],
                        'url' => '/product/' . $product['art']
                    ];
                }
                break;
                
            case 'category':
                if ($data['category']) {
                    $breadcrumbs = $this->getCategoryPath($data['category']);
                }
                $arr['tpl'] = 'item';
                break;
                
            default:
                $breadcrumbs = [];
        }
        
        $_SESSION['smarty']->assign('breadcrumbs', $breadcrumbs);
        return $_SESSION['smarty']->fetch('sfera/breadcrumbs/'.TPL.'/'.$arr['tpl'].'.tpl');
    }
    
    private function getCategoryPath($category_id)
    {
        // Получаем данные категории с путем
        $sql = "SELECT c.* 
                FROM category c 
                WHERE c.id = " . (int)$category_id;
                
        $category = $_SESSION['mysql']->getRow($sql);
        
        if (!$category) {
            return [];
        }
        
        // Разбираем путь для построения хлебных крошек
        $path_ids = explode('/', trim($category['path'], '/'));
        
        if (empty($path_ids)) {
            return [];
        }
        
        // Получаем все категории из пути
        $sql = "SELECT id, name, slug, path 
                FROM category 
                WHERE id IN (" . implode(',', array_map('intval', $path_ids)) . ")
                ORDER BY FIELD(id, " . implode(',', array_map('intval', $path_ids)) . ")";
                
        $categories = $_SESSION['mysql']->getAll($sql);
        
        // Формируем хлебные крошки
        $breadcrumbs = [];
        foreach ($categories as $cat) {
            $breadcrumbs[] = [
                'id' => $cat['id'],
                'title' => $cat['name'],
                'url' => '/category/' . ($cat['slug'] ?: $cat['id'])
            ];
        }
        
        return $breadcrumbs;
    }
}