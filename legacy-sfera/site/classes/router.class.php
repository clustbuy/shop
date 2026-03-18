<?php include_once('site/classes/aModule.class.php');

class router extends aModule{
    function execute($arr)
    {
        $_SESSION['ts']['011_router_class_begin'] = (string)get_period();

        $rout = $arr['rout'];
        $dir = array(); // Инициализация $dir

        if(isset($arr['q']))
        {
            $post = array_filter(explode('/', $arr['q']));
            $dir = $post;                // $dir[0] - алиас модуля
            $post = array_reverse($post);     // $post[0] - алиас запрашиваемой страницы
            $_SESSION['smarty']->assign('post', $post);  // отправляем в шаблонизатор
        }
        $_SESSION['ts']['013_router_array_reverse_post'] = (string)get_period();

            if ($dir['0'] == 'admin')
            {

                // Проверяем action=logout (должен обрабатываться всегда)
                if (isset($_GET['action']) && $_GET['action'] === 'logout') {
                    print ($_SESSION['smarty']->fetch('str:admin/auth'));
                    die();
                }

                // Админ-панель - проверка авторизации
                if (!isset($_SESSION['admin_user'])) {
                    print ($_SESSION['smarty']->fetch('str:admin/auth'));
                }
                else switch ($dir['1'])
                {                         
                    case 'banners':             print ($_SESSION['smarty']->fetch('str:admin/banners'));                break;
                    case 'wholesaler_banners':  print ($_SESSION['smarty']->fetch('str:admin/wholesaler_banners'));     break;
                    case 'permissions':         print ($_SESSION['smarty']->fetch('str:admin/permissions'));            break;
                    case 'profile':             print ($_SESSION['smarty']->fetch('str:admin/profile'));                break;
                    case 'users':               print ($_SESSION['smarty']->fetch('str:admin/users'));                  break;
                    case 'products':            print ($_SESSION['smarty']->fetch('str:admin/products'));               break;
                    case 'import':              print ($_SESSION['smarty']->fetch('str:admin/import'));                 break;
                    case 'ozon_import':         print ($_SESSION['smarty']->fetch('str:admin/ozon_import'));            break;
                    case 'menu':                print ($_SESSION['smarty']->fetch('str:admin/menu'));                   break;
                    case 'popular_categories':  print ($_SESSION['smarty']->fetch('str:admin/popular_categories'));     break;
                    case 'top10_products':      print ($_SESSION['smarty']->fetch('str:admin/top10_products'));         break;
                    case 'reviews':             print ($_SESSION['smarty']->fetch('str:admin/reviews'));                break;
                    case 'yandex_import':       print ($_SESSION['smarty']->fetch('str:admin/yandex_import'));          break;

                    default:                    print ($_SESSION['smarty']->fetch('str:admin/desktop'));                break;
                }
                die();
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
        
        if(!isset($_SESSION['cart']['total_cart_amount']))
        {
            $_SESSION['cart'] = array(
                'total_cart_amount' => 0,
                'total_cart_sum' => 0,
                'items' => 0,
                'discount' => 0,
                'user' => ['phone' => '']
            );
        }
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);

        $_SESSION['ts']['014_router_cart_init'] = (string)get_period();

        if (empty($arr['q']))
        {
            // если пусто, считаем что это index и сразу отправляем на страницу главной витрины
            print ($_SESSION['smarty']->fetch('str:'.$rout.'/showcase'));

            $_SESSION['ts']['115_router_after_show_case'] = (string)get_period();
        }
        else
        {
            switch ($dir['0']) {

                case 'phpinfo':        phpinfo();   die();           break;

                case 'login':         print ($_SESSION['smarty']->fetch('str:'.$rout.'/login'));                  break;
                case 'orders':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/orders'));                 break;
                case 'favorites':     print ($_SESSION['smarty']->fetch('str:'.$rout.'/favorites'));              break;
                case 'catalog':       print ($_SESSION['smarty']->fetch('str:'.$rout.'/catalog'));                break;
                case 'series':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/series'));                 break;
                case 'seriya':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/seriya'));                 break;
                case 'topics':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/topics'));                 break;
                case 'topic':         print ($_SESSION['smarty']->fetch('str:'.$rout.'/topic'));                  break;
                case 'product_types': print ($_SESSION['smarty']->fetch('str:'.$rout.'/product_types'));          break;
                case 'product_type':  print ($_SESSION['smarty']->fetch('str:'.$rout.'/product_type'));           break;
                case 'authors':       print ($_SESSION['smarty']->fetch('str:'.$rout.'/authors'));                break;
                case 'author':        print ($_SESSION['smarty']->fetch('str:'.$rout.'/author'));                 break;
                case 'hashtag':       print ($_SESSION['smarty']->fetch('str:'.$rout.'/hashtag_products'));       break;
                case 'product':       print ($_SESSION['smarty']->fetch('str:'.$rout.'/product'));                break;
                case 'register':      print ($_SESSION['smarty']->fetch('str:'.$rout.'/register'));               break;
                case 'profile':       print ($_SESSION['smarty']->fetch('str:'.$rout.'/profile'));                break;
                case 'checkout':      print ($_SESSION['smarty']->fetch('str:'.$rout.'/checkout'));               break;
                case 'thankyoupage':  print ($_SESSION['smarty']->fetch('str:'.$rout.'/thankyoupage'));           break;


                case 'cart':          print ($_SESSION['smarty']->fetch('str:'.$rout.'/cart'));                   break;
                case 'showcase':      print ($_SESSION['smarty']->fetch('str:'.$rout.'/showcase'));               break;
                case 'category':      print ($_SESSION['smarty']->fetch('str:'.$rout.'/category'));               break;
                case 'search':	      print ($_SESSION['smarty']->fetch('str:'.$rout.'/search'));	              break;
                case 'ajax':          print ($_SESSION['smarty']->fetch('str:'.$rout.'/ajax'));                   break;
                case 'order':         print ($_SESSION['smarty']->fetch('str:'.$rout.'/order'));                  break;
                case 'page':          print ($_SESSION['smarty']->fetch('str:'.$rout.'/page'));                   break;
                case 'yml':	          print ($_SESSION['smarty']->fetch('str:'.$rout.'/yml'));	                  break;

                case 'contact':	      print ($_SESSION['smarty']->fetch('str:'.$rout.'/contact'));	              break;
                case 'about':         print ($_SESSION['smarty']->fetch('str:'.$rout.'/about'));                  break;
                case 'certificate':   print ($_SESSION['smarty']->fetch('str:'.$rout.'/certificate'));            break;
                case 'delivery':      print ($_SESSION['smarty']->fetch('str:'.$rout.'/delivery'));               break;
                case 'help':          print ($_SESSION['smarty']->fetch('str:'.$rout.'/help'));                   break;
                case 'where':         print ($_SESSION['smarty']->fetch('str:'.$rout.'/where'));                  break;
                case 'our_authors':   print ($_SESSION['smarty']->fetch('str:'.$rout.'/our_authors'));            break;

                case 'sms':
                    include_once 'site/modules/sfera/sms/sms.class.php';
                    $m = new sms();
                    $action = isset($dir[1]) ? $dir[1] : 'phone';
                    $m->execute(['params' => [$action]]);
                    break;

                case 'logout':
                    unset($_SESSION['auth_user']);
                    unset($_SESSION['cart']['user']);
                    header('Location: /');
                    exit; 


                default:	        http_response_code(404);
                                    print ($_SESSION['smarty']->fetch('str:'.$rout.'/e404'));
                                    break;
            }

        }


        echo "<script> var v = ".json_encode($_SESSION['ts']).";console.log(v);</script>";

        $time = 0; foreach($_SESSION['ts'] as $v){$time += $v;}
        echo "<script> var v = ".json_encode(array('tolal_time' => $time)).";console.log(v);</script>";

        die();
    }

    function detect_mobile()
    {
        require_once 'site/libs/Mobile_Detect.php';
        $mobile = null;
        $detect = new Mobile_Detect;
        if ($detect->isMobile() && !$detect->isTablet()) {
            $mobile = 1;
        } else if ($detect->isTablet()) {
            $mobile = 2;
        } else
        {
            $mobile = 0;
        }
        return $mobile;
    }
}
