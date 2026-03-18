<?php include_once('site/classes/aModule.class.php');

class orders extends aModule
{
    function execute($arr)
    {
        //echo "<pre>"; print_r($arr); echo "</pre>"; //die();
        print ($_SESSION['smarty']->fetch('sfera/orders/orders.tpl'));
    }
}