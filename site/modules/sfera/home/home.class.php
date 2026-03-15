<?php include_once('site/classes/aModule.class.php');

class home extends aModule
{
    function execute($arr)
    {
        //echo "<pre>"; print_r($arr); echo "</pre>"; //die();

        
        //print ($_SESSION['smarty']->fetch('sfera/e404/e404.tpl'));
        print ($_SESSION['smarty']->fetch('sfera/home/home.tpl'));
    }
}