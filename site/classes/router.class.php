<?php include_once('site/classes/aModule.class.php');

class router extends aModule{
    function execute($arr)
    {

        $rout = $arr['rout'];
        $dir = array(); // Инициализация $dir

        if(isset($arr['q']))
        {
            $post = array_filter(explode('/', $arr['q']));
            $dir = $post;                // $dir[0] - алиас модуля
            $post = array_reverse($post);     // $post[0] - алиас запрашиваемой страницы
            $_SESSION['smarty']->assign('post', $post);  // отправляем в шаблонизатор
        }

        if ($this->url == '/catalog' || $this->url == '/catalog/') 
        {
            $mod = new opticscat();
            print $mod->execute();
            exit;
        }

        if($arr['q'] == 'sitemap.xml') {print ($_SESSION['smarty']->fetch('str:'.$rout.'/sitemap')); die();}

        if (isset($arr['unset']) && strlen($arr['unset'])>0)  {$this->clear_sess($arr);}
        if(isset($arr['clear'])){
            switch ($arr['clear']) {
                case 'cart':            unset($_SESSION['cart']);                   break;
                case 'cart_items':      unset($_SESSION['cart']['items']);          break;
                case 'auth':            unset($_SESSION['cart']['user']);           break;
                default:                                                            break;
            }
        }

        if(isset($arr['ajax'])){        print ($_SESSION['smarty']->fetch('str:ajax'));die();   }

        // обращения к корзине, обращения по апи в банк, расчет по стоимости доставки
        // расчёт промокодов, расчет скидки, авторизация по подписке



        if (empty($arr['q']))
        {
            // если пусто, считаем что это index и сразу отправляем на страницу главной витрины
            print ($_SESSION['smarty']->fetch('str:'.$rout.'/home'));

            $_SESSION['ts']['115_router_after_show_case'] = (string)get_period();
        }
        else
        {
            switch ($dir['0']) {

                case 'phpinfo':        phpinfo();             break;

                // case 'login':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/login'));               break;
                case 'orders':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/orders'));               break;
                case 'favorites':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/favorites'));               break;
                case 'catalog': include_once 'site/modules/catalog/catalog.class.php'; if(class_exists('catalog')){ $mod = new catalog(); print $mod->execute(); } else { http_response_code(404); print ($_SESSION['smarty']->fetch('str:'.$rout.'/e404')); } die(); break;case 'authors':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/authors'));               break;
                case 'authors':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/authors'));               break;
                case 'product':     print ($_SESSION['smarty']->fetch('str:'.$rout.'/product'));               break;
                // case 'register':     print ($_SESSION['smarty']->fetch('str:'.$rout.'/register'));               break;
                case 'profile':     print ($_SESSION['smarty']->fetch('str:'.$rout.'/profile'));             break;
                case 'checkout':     print ($_SESSION['smarty']->fetch('str:'.$rout.'/checkout'));           break;
                case 'cart':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/cart'));               break;
                case 'showcase':    print ($_SESSION['smarty']->fetch('str:'.$rout.'/showcase'));           break;
                //case 'product':     print ($_SESSION['smarty']->fetch('str:'.$rout.'/item'));             break;
                case 'category':    print ($_SESSION['smarty']->fetch('str:'.$rout.'/category'));           break;

                case 'search':	    print ($_SESSION['smarty']->fetch('str:'.$rout.'/search'));	            break;
                case 'ajax':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/ajax'));               break;
                case 'order':       print ($_SESSION['smarty']->fetch('str:'.$rout.'/order'));              break;
                case 'page':	    print ($_SESSION['smarty']->fetch('str:'.$rout.'/page'));	            break;
                case 'yml':	        print ($_SESSION['smarty']->fetch('str:'.$rout.'/yml'));	            break;


                default:	            http_response_code(404);
                                        print ($_SESSION['smarty']->fetch('str:'.$rout.'/e404')); 


                                        break;

            }

        }

    }


}
