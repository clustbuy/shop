<?php include_once('site/classes/aModule.class.php');

class certificate extends aModule
{
    function execute($arr)
    {

        print ($_SESSION['smarty']->fetch('sfera/certificate/certificate.tpl'));
    }
}