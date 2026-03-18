<?php include_once('site/classes/aModule.class.php');

class about extends aModule
{
    function execute($arr)
    {

        print ($_SESSION['smarty']->fetch('sfera/about/about.tpl'));
    }
}