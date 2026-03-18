<?php include_once('site/classes/aModule.class.php');

class thankyoupage extends aModule
{
    function execute($arr)
    {
        // Получаем данные заказа из сессии
        $order = isset($_SESSION['order']) ? $_SESSION['order'] : null;
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('order', $order);
        $_SESSION['smarty']->assign('pageTitle', 'Заказ принят');
        
        $_SESSION['smarty']->display('sfera/thankyoupage/thankyoupage.tpl');
    }
}

