<?php

$p = $arr['send_params'];

switch ($p['task']) {

    case 'calc_pickpoint_cost':


        $totalWeightKg = $_SESSION['cart']['total_cart_weight'];
        $totalVolumeCubM = $_SESSION['cart']['total_cart_volume'];
        $idPickupPoint = $p['pickpoint']['id'];
        $address = $p['pickpoint']['address']['full_address'];

        $_SESSION['delivery'] = [
            'pickup_id'         => $idPickupPoint,
            'weight'            => $totalWeightKg,
            'volume'            => $totalVolumeCubM,
            'sum'               => $_SESSION['cart']['total_cart_sum'],
            'address'           => $address,
            'cityname'          => $p['pickpoint']['address']['locality'],
            'calcPickPointCost' => 0
        ];

        $result = [
            'result'        => FALSE,
            'error'         => 'Запрос не выполнился.',
            'delivery_cost' => 0,
            'delivery'      => json_encode($_SESSION['delivery'], JSON_UNESCAPED_UNICODE),
        ];

        if (empty($_SESSION['cart']) || empty($_SESSION['cart']['items'])) {
            $result['error'] .= ' Корзина пуста';
            echo json_encode($result);

            break;
        }
        if (empty($_SESSION['cart']['total_cart_weight'])) {
            $result['error'] .= ' Не хватает данных (общий вес товаров в корзине)';
            echo json_encode($result);

            break;
        }
        $region = $p['pickpoint']['address']['region'];
        $city = $p['pickpoint']['address']['locality'];
        $zeroDeliveryCost = ['Москва', 'Санкт-Петербург'];
        if (
            in_array($region, $zeroDeliveryCost, true) ||
            in_array($city, $zeroDeliveryCost, true)
        ) {
            $result['result'] = TRUE;
            echo json_encode($result);

            break;
        }

        $apiData = row("SELECT url, value FROM _config WHERE name = 'yandex_delivery'");

        $is_oversized = $totalWeightKg >= 30 && $totalVolumeCubM >= 0.5;
        $data = doRequest(
            $apiData['url'] . '?is_oversized=' . $is_oversized,
            'POST',
            json_encode(
                [
                    'destination'  => ['platform_station_id' => $p['pickpoint']['id']],
                    'source'       => ['address' => 'Москва, Красная площадь'],
                    'tariff'       => 'self_pickup',
                    'total_weight' => $totalWeightKg
                ],
                JSON_UNESCAPED_UNICODE
            ),
            "Authorization: Bearer {$apiData['value']}"
        );

        $calcPickPointCost = 0;
        if (empty($data['message'])) {
            $calcPickPointCost = (float)$data['pricing_total'];
        }

        $_SESSION['delivery']['calcPickPointCost'] = $calcPickPointCost;
        unset($result['error']);
        $result['delivery_cost'] = $calcPickPointCost;
        $result['result'] = TRUE;
        $result['delivery'] = json_encode($_SESSION['delivery'], JSON_UNESCAPED_UNICODE);
        echo json_encode($result);


        break;


    case 'order_complete':


        $cart = $_SESSION['cart'];
        $delivery = $_SESSION['delivery'];

        $proc_array = [
            'user_id'        => $_SESSION['user']?$_SESSION['user']['id']:0,  //  -- user_id - INT(10) если залогиненый пользователь, то id пользователя, иначе 0
            'pay_type'       => (int)$p['pay_type'],  //  -- pay_type - INT(10) 0 - картой
            'delivery_type'  => $p['delivery_type'] ?? 0,  //  -- delivery_type - INT(10) 0 - доставка, 4 - самовывоз
            'discount'       => 0,  //  -- discount - TINYINT(1)  1 - есть скидка, 0 - нет скидки
            'pay_sum'        => $cart['total_cart_sum'],  //  -- pay_sum - FLOAT  сколько плачено денег карточкой должно быть
            'full_sum'       => $cart['total_cart_sum'],  //  -- full_sum - FLOAT общая сумма в корзине со скидкой!
            'name'           => noSQL($p['fio']),  //  -- имя покупателя
            'phone'          => noSQL($p['phone']),  //  -- phone - VARCHAR(255) телефон клиента
            'email'          => noSQL($p['email']),  //  -- email клиента
            'pickup_id'      => $delivery['pickup_id'],  //  -- pickup_id int(11) DEFAULT NULL, id ПВЗ
            'comment_user'   => base64_encode(json_encode($delivery, JSON_UNESCAPED_UNICODE)),  //  -- comment_user - TEXT json объект с инф по доставке
            'confirm_method' => (int)$p['confirm_method'],  //  -- confirm_method - TINYINT(1) тип подтверждения 0- перезвонить, 1- по SMS
            'ip'             => $this->get_ip(),  //  -- ip - VARCHAR(15) ip адрес пользователя , например '195.68.152.19'
            'user_agent'     => $_SERVER['HTTP_USER_AGENT'], //  -- user_agent - VARCHAR(255) 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0'
            'discount_code'  => make_promo()
        ];

        $orderId = insert('orders', $proc_array);
        $order = row("SELECT * FROM orders WHERE id = $orderId");


        // далее обрабатываем корзину
        $nn = 1; // номер по порядку

        foreach ($cart['items'] as $k => $cart_item) {
            $item_array = array(
                //0, //  -- op_parent_op_id - INT(10) 0 , устанавливается для ингредиента (id товара, в этой же таблице)
                'op_order_id'   => $orderId, //  -- op_order_id - INT(10) id заказа для которого формируется список
                'op_price'      =>  $cart_item["cost"],
                'op_amount'     =>  $cart_item["product_amount"],
                'op_sum'        =>  $cart_item["cost"] * $cart_item["product_amount"],
                'op_menu_id'    =>  $cart_item["guid"],
                'title'         =>  $cart_item['title']/*,
                ''  =>  ,
                ''  =>  ,
                ''  =>  ,*/
                //$cart_item["product_price"], //  -- op_price - FLOAT 620 цена
                //$cart_item["product_amount"], //  -- op_amount - INT(10) 1 количетво
                //0, //  -- op_is_gift - TINYINT(1) 0 - не подарок, 1 - подарок
                //$cart_item["product_price"] * $cart_item["product_amount"], //  -- op_sum - FLOAT 620 общая сумма = prce * amount
                //$cart_item["guid"], //  -- op_menu_id - INT(10) 495 id меню
                //$cart_item['title'], //  -- op_title - varchar(255) наименование товара
                //0, //  -- op_menu_size_index - INT(10) 0 - размер пиццы
                //0 //  -- op_coupon_id - INT(11) 0 , устанавливается только для подарка
            );

            /*
            op_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
            op_parent_op_id int(10) UNSIGNED DEFAULT NULL,
            op_order_id int(10) UNSIGNED DEFAULT NULL,
            op_price float DEFAULT 0,
            op_amount int(10) UNSIGNED DEFAULT NULL,
            op_is_gift tinyint(1) DEFAULT 0,
            op_sum float DEFAULT NULL,
            op_menu_id int(10) UNSIGNED DEFAULT NULL,
            title varchar(255) DEFAULT NULL,
            op_menu_size_index int(10) DEFAULT 0,
            op_coupon_id int(11) DEFAULT 0,
            debug longtext DEFAULT NULL,
            */

            $order_pos_Id = insert('order_positions', $item_array);
            $order_pos = row("SELECT * FROM order_positions WHERE op_id = $order_pos_Id");

            $r = $this->get_data('Send_order_position', $item_array);
            $op = $r[0];
            $order['items'][$nn] = $op;

            $nn++;
        }


        $_SESSION['order'] = $order;


        echo json_encode([
            "result"   => TRUE,
            "order_id" => $order['id'],
            "order"    => $order
        ]);


        exit();


    case 'check_code':



        if ($_SESSION['confirm4digitcode'] == $p['code']) {
            echo json_encode([
                "result" => TRUE
            ]);



        } else {
            echo json_encode([
                "result" => FALSE,
                "error"  => "Код не прошел проверку"
            ]);


        }


        exit();


    case 'check_phone':



        $sms_code = rand(1111, 9999);
        $result = sendSms($p['phone'], $sms_code);

        if ($result->status == 'OK') {

            $_SESSION['confirm4digitcode'] = $sms_code; // Четырехзначный код
            echo json_encode([
                "result" => TRUE
            ]);
        } else {
            echo json_encode([
                "result" => FALSE,
                "error"  => "Не удалось отправить sms с кодом подтверждения " . $sms->status_text
            ]);
        }


        exit();


    case 'get_pickpoint_list':

        $coords = $p['bounds'];
        $res = rows("SELECT id,lo,la FROM points WHERE la > ".$coords[0][0]." AND la < ".$coords[1][0]." AND lo > ".$coords[0][1]." AND lo < ".$coords[1][1]." ");
        $sql = "SELECT id,lo,la FROM points WHERE la > ".$coords[0][0]." AND la < ".$coords[1][0]." AND lo > ".$coords[0][1]." AND lo < ".$coords[1][1]." ";
        echo json_encode(["result"=>true, "points" => $res, $sql]);
        break;

    case 'get_pickpoint_data':

        $point_data = row("SELECT * FROM points WHERE la = ".$p['coords'][0]." AND lo = ".$p['coords'][1]);
        $_SESSION['delivery'] = $point_data;
        echo json_encode(["result"=>true, "point_data" => json_decode($point_data['json'], true)]);
        break;

    default:
        echo json_encode(["result" => false, "Неизвестный AJAX запрос"]);
        exit();
}

?>