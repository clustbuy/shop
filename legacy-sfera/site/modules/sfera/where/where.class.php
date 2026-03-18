<?php include_once('site/classes/aModule.class.php');

class where extends aModule
{
    function execute($arr)
    {
        print ($_SESSION['smarty']->fetch('sfera/where/where.tpl'));
    }
}
