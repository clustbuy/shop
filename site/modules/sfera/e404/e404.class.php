<?php include_once('site/classes/aModule.class.php');

class e404 extends aModule
{
    function execute($arr)
    {
        //echo "<pre>"; print_r($arr); echo "</pre>"; //die();

        insert('log_404', [
            'text'  => json_encode($arr, JSON_UNESCAPED_UNICODE),
            'ip'    => $this->get_ip()
        ]);
        //print ($_SESSION['smarty']->fetch('sfera/e404/e404.tpl'));
        print ($_SESSION['smarty']->fetch('sfera/e404/e404.tpl'));
    }
}