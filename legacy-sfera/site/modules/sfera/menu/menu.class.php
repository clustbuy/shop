<?php include_once('site/classes/aModule.class.php');

class menu extends aModule
{
    function execute($arr)
    {
        // Проверяем, является ли это AJAX-запросом для подкатегорий
        if (isset($arr['action']) && $arr['action'] === 'get_subcategories') {
            return $this->getSubcategories($arr['category_id'] ?? 0);
        }

        switch ($arr['tpl'])
        {
            case 'categories_menu':
                $categories = $this->getTopLevelCategories();
                
                // Получаем товары только для категорий первого уровня
                $items = [];
                if (!empty($categories)) {
                    $category_ids = array_column($categories, 'id');
                    $ids_str = implode(',', array_map('intval', $category_ids));
                    
                    $query = "SELECT DISTINCT ic.category_id, sf.* 
                             FROM item_category ic
                             JOIN item i ON i.id = ic.item_id
                             JOIN sima_feed sf ON sf.art = i.sid
                             WHERE ic.category_id IN ({$ids_str})
                             GROUP BY ic.category_id";
                    $category_items = rows($query, 'category_id');
                    
                    foreach ($categories as $category) {
                        if (isset($category_items[$category['id']])) {
                            $items[$category['id']] = [$category_items[$category['id']]];
                        }
                    }
                }
                
                $_SESSION['smarty']->assign('cat_items', $items);
                $_SESSION['smarty']->assign('cat_menu', $categories);
                return $_SESSION['smarty']->fetch("sfera/menu/".$arr['tpl'].".tpl");

            case 'vertical_menu':
                $categories = $this->getTopLevelCategories();
                $_SESSION['smarty']->assign('cat_menu', $categories);
                //echo "<script> var cat_menu = ".json_encode($res).";console.log(cat_menu);</script>";
                return $_SESSION['smarty']->fetch("sfera/menu/".$arr['tpl'].".tpl");

            case 'search_select':
                $categories = $this->getTopLevelCategories();
                $_SESSION['smarty']->assign('search_select_menu', $categories);
                return $_SESSION['smarty']->fetch("sfera/menu/".$arr['tpl'].".tpl");

            case 'mobile_drawer':
                $categories = $this->getTopLevelCategories();
                $_SESSION['smarty']->assign('mobile_drawer_menu', $categories);
                return $_SESSION['smarty']->fetch("sfera/menu/".$arr['tpl'].".tpl");

            default:
                return '';
        }

        /*
        $res = $this->get_c(1);
        $_SESSION['smarty']->assign('cat_menu', $res);

        $res = rows("SELECT * FROM tree WHERE parent_id = 1 AND active = 1 ORDER BY sort ", "id");

        //echo "<script> var top_menu = ".json_encode($res).";console.log(top_menu);</script>";

        // var_dump($res);

        $_SESSION['smarty']->assign('top_menu', $res);

        $i=0;
        $cat_menu = array();
        foreach($this->get_c(1) as $k=>$v)
        {
            $i++;

            if($v['active']) $cat_menu['all'][$k] = $v;

            if($i <= 11)
            {
                $cat_menu['part1'][$k] = $v;
            }
            else
            {
                $cat_menu['part2'][$k] = $v;
            }
        }

        $_SESSION['smarty']->assign('cat_menu', $cat_menu);


        print ($_SESSION['smarty']->fetch("sfera/menu/{$arr['tpl']}.tpl"));
        */


        /*

        //$res = $this->get_c(10390630);
        //$_SESSION['smarty']->assign('cat_menu', $res);
        //echo "<pre>"; print_r($res); echo "</pre>"; //die();

        $i=0;
        $cat_menu = array();
        $res = rows("SELECT * FROM tree WHERE parent_id = 1 AND active = 1 ORDER BY sort ", "id");

        foreach($this->get_c(1) as $k=>$v)
        {
            $i++;

            if($v['active']) $cat_menu['all'][$k] = $v;

            if($i <= 11)
            {
                $cat_menu['part1'][$k] = $v;
            }
            else
            {
                $cat_menu['part2'][$k] = $v;
            }
        }

        $_SESSION['smarty']->assign('top_menu', $cat_menu);
        print ($_SESSION['smarty']->fetch("sfera/menu/{$arr['tpl']}.tpl"));

    	*/
    }

    function get_c($node)
    {
        $nodes = array();
        $res = rows("SELECT id, id, parent_id, has_childs, title FROM tree WHERE active = 1 AND parent_id = ".$node." ORDER BY sort ASC ", "id");
        if(count($res)>0)
            foreach($res as $k=>$t)
            {
                $nodes[$k] = $t;

                if(count(rows("SELECT id FROM tree WHERE parent_id = ".$t['id']." ORDER BY sort ASC "))>0)
                {
                    $nodes[$k]['childrens'] = $this->get_c($t['id']);
                }
                else
                {
                    $nodes[$k]['childrens'] = [];
                }
            }
        return $nodes;
    }

    private function getTopLevelCategories()
    {
        // Получаем только категории первого уровня
        $query = "SELECT c.* 
                 FROM category c 
                 WHERE c.is_adult = 0 
                   AND c.level = 1
                 ORDER BY c.path";
        $result = rows($query);
        
        if (empty($result)) {
            return [];
        }
        
        // Проверяем наличие подкатегорий
        $category_ids = array_column($result, 'id');
        $ids_str = implode(',', array_map('intval', $category_ids));
        
        $query = "SELECT DISTINCT parent.id 
                 FROM category parent 
                 JOIN category child ON child.path LIKE CONCAT(parent.path, '/%')
                 WHERE parent.id IN ({$ids_str})";
        $has_children = rows_list($query, 'id');
        
        // Формируем результат
        $categories = [];
        foreach ($result as $row) {
            $categories[] = [
                'id' => $row['id'],
                'title' => $row['name'],
                'has_childs' => in_array($row['id'], $has_children),
                'childrens' => [], // Будет заполнено через AJAX
                'level' => $row['level'],
                'path' => $row['path'],
                'icon' => $row['icon']
            ];
        }
        
        return $categories;
    }

    private function getSubcategories($parent_id)
    {
        // Получаем прямых потомков указанной категории
        $query = "SELECT c.* 
                 FROM category c 
                 WHERE c.is_adult = 0 
                   AND c.path LIKE (
                       SELECT CONCAT(path, '/%') 
                       FROM category 
                       WHERE id = " . (int)$parent_id . "
                   )
                   AND c.level = (
                       SELECT level + 1 
                       FROM category 
                       WHERE id = " . (int)$parent_id . "
                   )
                 ORDER BY c.path";
        $result = rows($query);
        
        if (empty($result)) {
            return json_encode(['success' => true, 'categories' => []]);
        }
        
        // Проверяем наличие подкатегорий
        $category_ids = array_column($result, 'id');
        $ids_str = implode(',', array_map('intval', $category_ids));
        
        $query = "SELECT DISTINCT parent.id 
                 FROM category parent 
                 JOIN category child ON child.path LIKE CONCAT(parent.path, '/%')
                 WHERE parent.id IN ({$ids_str})";
        $has_children = rows_list($query, 'id');
        
        // Формируем результат
        $categories = [];
        foreach ($result as $row) {
            $categories[] = [
                'id' => $row['id'],
                'title' => $row['name'],
                'has_childs' => in_array($row['id'], $has_children),
                'childrens' => [], // Будет заполнено при необходимости через следующий AJAX-запрос
                'level' => $row['level'],
                'path' => $row['path'],
                'icon' => $row['icon']
            ];
        }
        
        return json_encode(['success' => true, 'categories' => $categories]);
    }
}