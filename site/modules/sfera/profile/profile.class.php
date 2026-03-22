<?php include_once('site/classes/aModule.class.php');

class profile extends aModule
{
    function execute($arr)
    {
        print ($_SESSION['smarty']->fetch('sfera/profile/profile.tpl'));
    }
}
