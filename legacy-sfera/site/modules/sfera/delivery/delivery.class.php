<?php include_once('site/classes/aModule.class.php');

class delivery extends aModule
{
    function execute($arr)
    {
        print ($_SESSION['smarty']->fetch('sfera/delivery/delivery.tpl'));
    }
}
