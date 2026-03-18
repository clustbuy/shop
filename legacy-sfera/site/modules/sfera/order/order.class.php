<?php include_once('site/classes/aModule.class.php');


class order extends aModule
{
    function ajax($arr){require("func.ajax.php");}

    function make($arr){

        $ip = $this->get_ip();

        $cart = $_SESSION['cart'];
        $order_keys = $this->make_order_num();
        $order = [];

        $full_sum = 0;
        $discount_sum = 0;
        $pay_sum = 0;
        $bonus = $cart['bonus'];
        $cart_weight = 0;
        $cart_volume = 0;
        $cart_density = 0;
        $customerKey = $cart['user']['phone'];
        $name = '';
        $phone = $cart['user']['phone'];
        $email = null;
        $comment_user = null;
        $tracking_id = null;
        $cart_url = null;
        $user_id = 0;
        $user_role = null;
        $user_card_code = null;
        //$ip = $this->get_ip();
        $user_agent = $_SERVER['HTTP_USER_AGENT'];
        $total_bill = 0;
        $piece_weight = 0;
        $piece_cost = 0;
        $sizes = [];
        $art = '';

        $nn = 1; // номер по порядку

        foreach ($cart['items'] as $k => $cart_item) {

            $item = row("SELECT * FROM items WHERE guid = ".intval($cart_item["guid"]));


            $item_array = array(
                'order_num'     =>  $order_keys['order_num'],
                'order_code'    =>  $order_keys['order_code'],
                'bill'          =>  $item["bill"],
                'cost'          =>  $item["cost"],
                'piece_weight'  =>  $piece_weight, //$item['weight'],
                'piece_cost'    =>  $item["cost"],
                'sum'           =>  $item["cost"] * $cart_item["product_amount"],
                'amount'        =>  $cart_item["product_amount"],
                'art'           =>  $item["art"],
                'guid'          =>  $item["guid"],
                'title'         =>  $item['title']

            );

            insert('order_pos', $item_array);

            $item_array['item_type']    = $item['item_type'];
            $order['items'][$nn] = $item_array;

            $full_sum += $cart_item["cost"];
            $total_bill += $cart_item["bill"];

            $nn++;
        }


        $pay_sum += $full_sum;

        $proc_array = [
            'id'                => $order_keys['order_num'],
            'order_code'        => $order_keys['order_code'],

            'full_sum'          => $full_sum,
            'discount_sum'      => $discount_sum,
            'pay_sum'           => $pay_sum,
            'name'              => $name,
            'phone'             => $phone,
            'email'             => $email,
            'comment_user'      => $comment_user,

            'user_id'           => $user_id,
            'user_role'         => $user_role,
            'user_card_code'    => $user_card_code,
            'ip'                => $ip,
            'user_agent'        => $user_agent
        ];

        insert('order', $proc_array);

        $order['data'] =  $proc_array;
        $_SESSION['order'] = $order;


        return $order;

    }


    function execute($arr)
    {
        $p = $arr['send_params'];

        if(
            $p['task'] == 'get_pickpoint_list'
            ||  $p['task'] == 'get_pickpoint_data'
            ||  $p['task'] == 'calc_pickpoint_cost'
            ||  $p['task'] == 'order_complete'
            ||  $p['task'] == 'check_code'
            ||  $p['task'] == 'check_phone'

        )
        {
            $this->ajax($arr);
            die();
        }

        $order = $this->make($arr);


        $order_num= $order['data']['order_code'];


        //die();

        $pay_sum = 0;
        $orderItems = array();

        foreach($order['items'] as $k  => $i)
        {
            $orderItems[] = array(
                "name"            =>   $i['title'],
                "quantity"        =>   intval($i['amount']),
                "amount"          =>   $i['cost'] * 100 * intval($i['amount']),
                "price"           =>   $i['cost'] * 100,
                "description"     =>   $i['title'],
                "tax"             =>   "vat20",
                "paymentObject"   =>   "commodity",
                "paymentMethod"   =>   "full_prepayment",
                "article"         =>   $i['art'],
                "declaredValue"   =>   $i['cost'] * 100 * intval($i['amount']),
                "weight"          =>   $i['weight']
            );

            $pay_sum += $i['cost'] * 100 * intval($i['amount']);
        }

        $cart_order = array(
            "shopId"              =>   "f1d624ba-2fb8-4424-b837-3593ba1268d3",
            "itemsAmount"         =>   $pay_sum,
            "orderId"             =>   $order_num,
            "taxation"            =>   "osn",
            "customerKey"         =>   $customerKey,
            "description"         =>   "Заказ № ".$order_num,
            "successPageUrl"      =>   "https://ru.market/order/?id=".$order_num,
            "isForceRedirect"     =>   true
        );

        $cart_order['orderItems'] = $orderItems;

        $cart_order['deliveryCondition'] = array(
            "tax"                   =>   "vat20"
        );

        $cart_order['deliveryCondition']['shippingParameters'] = array(
            "metashipShopId"        =>   "63a657f3-f243-48af-a3a4-95cb55e8d3a4",
            "metashipWarehouseId"   =>   "32315fc5-f266-4a19-8da6-84cd7594d4a5",
            "types"                 =>   ["PostOffice","DeliveryPoint"],
            "weight"                =>   $cart_weight,
            "length"                =>   $sizes['max_l'],
            "width"                 =>   $sizes['max_w'],
            "height"                =>   $sizes['max_h']
        );

        $cart_order['deliveryCondition']['freeDelivery']['postOffice'] = array(
            "deliveryPriceBefore"   =>   50000,
            "checkoutPriceAfter"    =>   1000000
        );

        $cart_order['deliveryCondition']['freeDelivery']['courier'] = array(
            "deliveryPriceBefore"   =>   100000,
            "checkoutPriceAfter"    =>   2000000
        );

        $cart_order['deliveryCondition']['freeDelivery']['deliveryPoint'] = array(
            "deliveryPriceBefore"   =>   100000,
            "checkoutPriceAfter"    =>   1500000
        );

        $cart_order_json = json_encode($cart_order, JSON_UNESCAPED_UNICODE);

        //echo $cart_order_json; die();


                $body = '
        {
            "shopId":"f1d624ba-2fb8-4424-b837-3593ba1268d3",
            "itemsAmount":10000,
            "orderId":"'.$order_num.'",
            "taxation":"osn",
            "customerKey":"79645351331",
            "description":"Заказ № '.$order_num.'",
            "successPageUrl":"https://ru.market/order?'.$order_num.'",
            "isForceRedirect":false,
            "orderItems":
            [
                {
                    "name":"Монитор NTSC",
                    "quantity":1,
                    "amount":10000,
                    "price":10000,
                    "description":"Монитор заднего вида, NTSC, 12 В",
                    "tax":"vat20",
                    "paymentObject":"commodity",
                    "paymentMethod":"full_prepayment",
                    "article":"944-009",
                    "declaredValue":10000,
                    "weight":0.207
                }
            ],
            "deliveryCondition":
            {
                "tax":"vat20",
                "shippingParameters":
                {
                    "metashipShopId":"63a657f3-f243-48af-a3a4-95cb55e8d3a4",
                    "metashipWarehouseId":"32315fc5-f266-4a19-8da6-84cd7594d4a5",
                    "types":["Courier","PostOffice","DeliveryPoint"],
                    "weight":0.207,
                    "length":6,
                    "width":17,
                    "height":13
                },
                "freeDelivery":
                {
                    "postOffice":
                    {
                        "deliveryPriceBefore":50000,
                        "checkoutPriceAfter":1000000
                    },
                    "courier":
                    {
                        "deliveryPriceBefore":100000,
                        "checkoutPriceAfter":2000000
                    },
                    "deliveryPoint":
                    {
                        "deliveryPriceBefore":100000,
                        "checkoutPriceAfter":1500000
                    }
                }
            }
        }';



        //"deliveryPayment":
        //    [
        //        {
        //            "deliveryKind":"disabled",
        //            "paymentTypes":["card"]
        //        }
        //    ]


        //$curl = curl_init();


        //echo "<pre>"; print_r($cart_order); echo "</pre>"; //die();

        //die();

        if(!R)
        {
            $certPath   =   __DIR__.'/01-certificate-2024-06-18-tinkoffapi.pem';
            $keyPath    =   __DIR__.'/1-private.key';
        }
        else
        {
            $certPath   =  '/var/www/keys/tinkoff/01-certificate-2024-06-18-tinkoffapi.pem';
            $keyPath    =  '/var/www/keys/tinkoff/1-private.key';
        }


        //curl_setopt($curl, CURLOPT_SSLCERT, $certFile);
        //curl_setopt($curl, CURLOPT_SSLKEY, $keyFile);


        try {
            $ch = curl_init();
            // Check if initialization had gone wrong*
            if ($ch === false) {
                throw new Exception('failed to initialize');
            }

            curl_setopt_array($ch, array(
                CURLOPT_URL => 'https://secured-openapi.tbank.ru/api/v2/checkout/order',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => $cart_order_json,  // $body
                CURLOPT_HTTPHEADER => array(
                    'Content-Type: application/json',
                    'Accept: application/json',
                    'Authorization: Bearer t.W6LFFCm1GcbQROGlUVdXuHAoOJjPULlmwuGXxMjQ3a15PSvYK51vtupYdyNqhaXQ2AFFw88hSrFiV3OC-W8oMw'
                ),
            ));
            curl_setopt($ch, CURLOPT_SSLCERT, $certPath);
            curl_setopt($ch, CURLOPT_SSLKEY, $keyPath);


            // Better to explicitly set URL
            //curl_setopt($ch, CURLOPT_URL, 'http://example.com/');
            // That needs to be set; content will spill to STDOUT otherwise
            //curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            // Set more options




            //echo "<pre>"; print_r($cart_order_json); echo "</pre>"; //die();

            //if(!R) die();

            $content = curl_exec($ch);

            //echo "<pre>"; print_r($content); echo "</pre>"; die();

            insert('t_log', array(
                'content'           => $content,
                'cart_order_json'   => $cart_order_json
            ));

            // Check the return value of curl_exec(), too
            if ($content === false) {
                throw new Exception(curl_error($ch), curl_errno($ch));
            }
            // Check HTTP return code, too; might be something else than 200
            $httpReturnCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            // Process $content here
        } catch(Exception $e) {
            trigger_error(sprintf(
                'Curl failed with error #%d: %s',
                $e->getCode(), $e->getMessage()),
                E_USER_ERROR);
        } finally {
            // Close curl handle unless it failed to initialize
            if (is_resource($ch)) {
                curl_close($ch);

                $content = json_decode($content, true);
                update('order', ['id' => $order_keys['order_num']], array(
                                                                                    'checkoutOrderId' => $content['checkoutOrderId'],
                                                                                    'status' => 2
                    )
                );
                header('Location: '.$content['url']); // переходим на страницу корзины, которую для нас сформировал банк.
            }
        }


        //echo '<script> var arr = ' .json_encode($arr). ';console.log(arr);</script>'; //die();
        //echo '<script> var session_id = ' .json_encode(session_id()). ';console.log(session_id);</script>'; //die();

        //print ($_SESSION['smarty']->fetch("sfera/order/checkout.tpl"));

        //print ($_SESSION['smarty']->fetch("sfera/order/".TPL.".tpl"));

    }

    function make_order_num()
    {

        $salt = "50626";
        $date1 = new DateTime("2022-04-14");
        $date2 = new DateTime("now");
        $interval = $date1->diff($date2); //print_r($interval)."\n";

        $days = $interval->format('%a');$hours = $interval->format('%h');
        $minutes = $interval->format('%i');$seconds = $interval->format('%s');
        $s = $seconds + $minutes*60 + $hours*3600 + $days*24*3600;// + 900000000;

        //for($i=1; $i<=1000; $i++)
        //{
        usleep(rand(1,1000000));
        $time = new \DateTimeImmutable();
        $u = $time->format("u");
        if ($u<50000) $u+= 49999;

        $str = $u.$s;

        //echo $u."\t".$s."\t";

        $order_num = implode("-", str_split(base_convert($str, 10, 36), 3));

        //echo strtoupper($promocode)."<br/>";
        //echo base_convert($promocode, 36, 10)."\n";
        //}

        return array('order_code' => strtoupper($order_num), 'order_num' => intval($str));
    }


}
?>