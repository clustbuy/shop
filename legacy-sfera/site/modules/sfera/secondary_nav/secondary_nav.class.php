<?php 
include_once('site/classes/aModule.class.php');

class secondary_nav extends aModule
{
    /**
     * Вторичное навигационное меню
     * Загружает структуру меню из таблицы pages
     */
    function execute($arr)
    {
        //echo "<pre>"; print_r($arr); echo "</pre>"; die();
        // Загружаем страницы из БД
        $menu_items = $this->loadMenuFromDatabase();
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('menu_items', $menu_items);
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/secondary_nav/secondary_nav.tpl'));

    }
    
    /**
     * Загрузка меню из таблицы pages
     */
    private function loadMenuFromDatabase()
    {
        // Загружаем все активные страницы, отсортированные по parent_id и sort
        $query = "SELECT id, name, title, parent_id, sort, active 
                  FROM pages 
                  WHERE active = 1 
                  ORDER BY parent_id ASC, sort ASC";
        
        $pages = rows($query);
        
        if (empty($pages)) {
            return array();
        }
        
        // Строим дерево меню
        return $this->buildMenuTree($pages, 0);
    }
    
    /**
     * Построение дерева меню из плоского массива страниц
     */
    private function buildMenuTree($pages, $parentId = 0)
    {
        $menu = array();
        
        foreach ($pages as $page) {
            // Нормализуем parent_id (NULL, '', 0 - всё корневой уровень)
            $pageParentId = ($page['parent_id'] === null || $page['parent_id'] === '' || intval($page['parent_id']) === 0) 
                ? 0 
                : intval($page['parent_id']);
            
            if ($pageParentId === intval($parentId)) {
                // Формируем ссылку на страницу
                $link = $this->generatePageLink($page);
                
                // Ищем дочерние страницы
                $submenu = $this->buildMenuTree($pages, $page['id']);
                
                $menuItem = array(
                    'id' => $page['id'],
                    'title' => !empty($page['title']) ? $page['title'] : $page['name'],
                    'link' => $link
                );
                
                // Если есть подменю - добавляем
                if (!empty($submenu)) {
                    $menuItem['submenu'] = $submenu;
                }
                
                $menu[] = $menuItem;
            }
        }
        
        return $menu;
    }
    
    /**
     * Генерация ссылки на страницу
     */
    private function generatePageLink($page)
    {
        return '/page/' . $page['id'] . '/';
    }
}


