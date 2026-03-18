<?php
include_once('site/classes/aModule.class.php');

class our_authors extends aModule
{
    function execute($arr)
    {

        print ($_SESSION['smarty']->fetch('sfera/our_authors/our_authors.tpl'));
    }
}

