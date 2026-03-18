<?php
include_once('site/classes/aModule.class.php');

class page extends aModule
{
    function execute($arr)
    {
        // Получаем ID страницы (например, /page/32 -> $id = 32)
        $page_id = isset($arr['params'][0]) ? intval($arr['params'][0]) : 0;

        // Если ID не число или 0 — 404
        if ($page_id <= 0) {
            $this->show404();
            return;
        }

        $items_query = array(
            'from'  => 'pages',
            'where' => array('id' => $page_id),
            'limit' => 1
        );

        $page_data = sel($items_query, true);


        if (empty($page_data)) {
            $this->show404();
            return;
        }


        $_SESSION['smarty']->assign('page', $page_data);      // Вся инфа о странице
        $_SESSION['smarty']->assign('content', $page_data['content']); // Сам HTML контент
        $_SESSION['smarty']->assign('title', $page_data['title']); // Заголовок для <title>

        print $_SESSION['smarty']->fetch('sfera/page/page.tpl');
    }


    private function show404() {
        header("HTTP/1.0 404 Not Found");
        print ($_SESSION['smarty']->fetch('sfera/e404/e404.tpl'));
        exit();
    }
}
?>
