<?php 
include_once('site/classes/aModule.class.php');

class catalog_menu extends aModule
{
    /**
     * Рубрикатор каталога для dropdown меню
     * Загружает дерево категорий из таблицы tree
     */
    function execute($arr)
    {
        // Получаем корневые категории (где parent_id пустой или NULL)
        $query = "SELECT id, name, parent_id 
                  FROM tree 
                  WHERE (parent_id = '' OR parent_id IS NULL)
                  ORDER BY name ASC";
        
        $root_categories = rows($query);
        
        // Строим дерево категорий
        $categories = [];
        foreach ($root_categories as $category) {
            $category_data = [
                'id' => $category['id'],
                'name' => $category['name'],
                'children' => $this->getChildren($category['id'])
            ];
            $categories[] = $category_data;
        }
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('categories', $categories);
        
        // Определяем шаблон (по умолчанию catalog_menu.tpl, или из параметра tpl)
        $tpl = isset($arr['tpl']) ? $arr['tpl'] : 'catalog_menu';
        $template_path = 'sfera/catalog_menu/' . $tpl . '.tpl';
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch($template_path));
    }
    
    /**
     * Рекурсивно получает дочерние категории
     */
    private function getChildren($parent_id)
    {
        $parent_id_safe = noSQL($parent_id);
        $query = "SELECT id, name, parent_id 
                  FROM tree 
                  WHERE parent_id = '$parent_id_safe'
                  ORDER BY name ASC";
        
        $children = rows($query);
        
        $result = [];
        foreach ($children as $child) {
            $child_data = [
                'id' => $child['id'],
                'name' => $child['name'],
                'children' => $this->getChildren($child['id'])
            ];
            $result[] = $child_data;
        }
        
        return $result;
    }
}

