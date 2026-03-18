<?php include_once('site/classes/aModule.class.php');

class item extends aModule
{
    function execute($arr)
    {
        //echo "<pre>"; print_r($arr); echo "</pre>"; //die();
        $items = rows("SELECT * FROM items WHERE guid = ".intval($arr['params'][0]));

        if(count($items)) // если товар существует
        {
            $v = $items[0];

            $v['category'] = row("SELECT * FROM tree WHERE  id = ".$v['node']." ");
            $v['gallery'] = rows("SELECT url FROM gallery WHERE  item_guid = ".$v['guid']." ");

            $query = "SELECT * FROM parameters WHERE  item_guid = ".$v['guid'];
            //echo "<pre>"; print_r($query); echo "</pre>"; //die();
            $v['params'] = rows($query);

            echo "<script> var v = ".json_encode($v).";console.log(v);</script>"; //die();

            $_SESSION['smarty']->assign('items_json', json_encode(array('0' => $v), JSON_UNESCAPED_UNICODE));
            $_SESSION['smarty']->assign('item', $v);

            $_SESSION['smarty']->display('sfera/item/d.tpl');
            //$_SESSION['smarty']->display('sfera/item/_'.TPL.'.tpl');

        }
        else
        {
            http_response_code(404);
            print ($_SESSION['smarty']->fetch('str: market/e404')); die();
        }
	}
}
?>