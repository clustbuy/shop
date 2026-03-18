<?php include_once('site/classes/aModule.class.php');

class help extends aModule
{
    function execute($arr)
    {
        print ($_SESSION['smarty']->fetch('sfera/help/help.tpl'));
    }
}
