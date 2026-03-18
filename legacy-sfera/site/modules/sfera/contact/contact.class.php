<?php include_once('site/classes/aModule.class.php');

class contact extends aModule
{
    function execute($arr)
    {
        print ($_SESSION['smarty']->fetch('sfera/contact/contact.tpl'));
    }
}