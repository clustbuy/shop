<?php include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class checkout extends aModule
{
    function ajax($arr){require("func.ajax.php");}

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


        // Обработка POST запроса для создания заказа
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['create_order'])) {
            $this->createOrder();
            return;
        }
        
        // Инициализация корзины если не существует
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        if (!isset($_SESSION['cart']['items']) || !is_array($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        }
        
        // Пересчитываем корзину для актуальных данных
        include_once('site/modules/sfera/cart/cart.class.php');
        if (class_exists('cart')) {
            $cartModule = new cart();
            if (method_exists($cartModule, 'calc')) {
                $cartModule->calc();
            }
        }
        
        // Передаем данные корзины в шаблон
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);

        print ($_SESSION['smarty']->fetch('sfera/checkout/checkout.tpl'));
    }
    
    /**
     * Создание заказа
     */
    private function createOrder()
    {
        // Проверяем наличие товаров в корзине
        if (!isset($_SESSION['cart']['items']) || empty($_SESSION['cart']['items'])) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Корзина пуста']);
            exit;
        }
        
        // Получаем данные из POST
        $name = isset($_POST['recipientName']) ? trim($_POST['recipientName']) : '';
        $phone = isset($_POST['recipientPhone']) ? trim($_POST['recipientPhone']) : '';
        $email = isset($_POST['recipientEmail']) ? trim($_POST['recipientEmail']) : '';
        $comment_user = isset($_POST['orderComment']) ? trim($_POST['orderComment']) : null;
        $delivery_method = isset($_POST['delivery']) ? $_POST['delivery'] : 'pickup';
        $payment_method = isset($_POST['payment']) ? $_POST['payment'] : 'card';
        
        // Валидация обязательных полей
        if (empty($name) || empty($phone)) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Заполните обязательные поля: ФИО и Телефон']);
            exit;
        }
        
        // Генерируем номер заказа
        $order_keys = $this->make_order_num();
        error_log('== checkout == $order_keys: ' . print_r($order_keys, true));

        // Получаем IP и User Agent
        $ip = $this->get_ip();
        $user_agent = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';

        error_log('== checkout == IP: ' . $ip);

        // Инициализируем переменные для расчета из сессии корзины
        $full_sum = isset($_SESSION['cart']['cart_sum']) ? floatval($_SESSION['cart']['cart_sum']) : 0;
        $discount_sum = isset($_SESSION['cart']['cart_discount']) ? floatval($_SESSION['cart']['cart_discount']) : 0;
        $cart_weight = isset($_SESSION['cart']['cart_weight']) ? floatval($_SESSION['cart']['cart_weight']) : 0;
        $cart_volume = 0;
        $cart_density = 0;
        $bonus = isset($_SESSION['cart']['bonus']) ? floatval($_SESSION['cart']['bonus']) : 0;
        $user_id = isset($_SESSION['user_id']) ? intval($_SESSION['user_id']) : 0;
        $user_role = isset($_SESSION['user_role']) ? $_SESSION['user_role'] : null;
        $user_card_code = null;
        
        // Обрабатываем товары из корзины
        $nn = 1;
        $calculated_full_sum = 0; // Пересчитываем сумму для проверки
        
        foreach ($_SESSION['cart']['items'] as $product_id => $cart_item) {
            // Пропускаем товары, которые не выбраны (selected = false)
            $selected = isset($cart_item['selected']) ? $cart_item['selected'] : true;
            if (!$selected) {
                continue; // Не добавляем невыбранные товары в заказ
            }
            
            // Получаем данные товара из таблицы products
            $product_id_safe = noSQL($product_id);
            $product = row("SELECT p.*, pr.price as cost 
                           FROM products p 
                           LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                           WHERE p.id = '$product_id_safe'");
            
            if (!$product) {
                continue; // Пропускаем если товар не найден
            }
            
            $cost = isset($cart_item['cost']) ? floatval($cart_item['cost']) : (isset($product['cost']) ? floatval($product['cost']) : 0);
            $amount = isset($cart_item['product_amount']) ? intval($cart_item['product_amount']) : 1;
            $piece_cost = $cost;
            $sum = $cost * $amount;
            
            // Получаем вес товара если есть
            $piece_weight = isset($product['weight']) ? floatval($product['weight']) : 0;
            
            // Подготавливаем данные для order_positions
            $item_array = array(
                'order_num'     => $order_keys['order_num'],
                'order_code'    => $order_keys['order_code'],
                'pieces'        => $amount,
                'bill'          => $cost, // Используем cost как bill
                'cost'          => $cost,
                'piece_cost'    => $piece_cost,
                'amount'        => $amount,
                'sum'           => $sum,
                'art'           => isset($product['id']) ? $product['id'] : '',
                'guid'          => $product_id,
                'title'         => isset($product['name']) ? $product['name'] : '',
                'model'         => isset($product['model']) ? $product['model'] : null,
                'weight'        => $piece_weight,
                'piece_weight'  => $piece_weight
            );

            error_log('== checkout order_positions == $item_array: ' . print_r($item_array, true));

            
            // Сохраняем позицию заказа
            insert('order_positions', $item_array);
            
            $calculated_full_sum += $sum;
            $nn++;
        }
        
        // Используем сумму из сессии корзины (уже пересчитана с учетом промокода)
        // Но если она не совпадает с пересчитанной, используем пересчитанную
        if (abs($full_sum - $calculated_full_sum) > 0.01) {
            $full_sum = $calculated_full_sum;
        }
        
        // Рассчитываем итоговую сумму с учетом скидки из сессии
        $pay_sum = $full_sum - $discount_sum;
        if ($pay_sum < 0) {
            $pay_sum = 0;
        }
        
        // Подготавливаем данные для orders
        $order_data = array(
            'id'                => $order_keys['order_num'],
            'order_code'        => $order_keys['order_code'],
            'full_sum'          => $full_sum,
            'discount_sum'      => $discount_sum,
            'pay_sum'           => $pay_sum,
            'bonus'             => $bonus,
            'cart_weight'       => $cart_weight,
            'cart_volume'       => $cart_volume,
            'cart_density'      => $cart_density,
            'name'              => $name,
            'phone'             => $phone,
            'email'             => !empty($email) ? $email : null,
            'comment_user'      => $comment_user,
            'tracking_id'       => null,
            'checkoutOrderId'   => null,
            'user_id'           => $user_id,
            'user_role'         => $user_role,
            'user_card_code'    => $user_card_code,
            'ip'                => $ip,
            'user_agent'        => $user_agent
        );
        
        // Сохраняем заказ
        insert('orders', $order_data);
        
        // Сохраняем данные заказа в сессию для страницы благодарности
        $_SESSION['order'] = $order_data;
        
        // Очищаем корзину после успешного создания заказа
        $_SESSION['cart']['items'] = array();
        include_once('site/modules/sfera/cart/cart.class.php');
        if (class_exists('cart')) {
            $cartModule = new cart();
            if (method_exists($cartModule, 'calc')) {
                $cartModule->calc();
            }
        }
        
        // Перенаправляем на страницу благодарности
        header('Content-Type: application/json');
        echo json_encode([
            'success' => true, 
            'message' => 'Заказ успешно создан',
            'order_id' => $order_keys['order_num'],
            'redirect' => '/thankyoupage/'
        ]);
        exit;
    }
    
    function make_order_num()
    {

        $salt = "50626";
        $date1 = new DateTime("2025-12-10");
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

        $str = $s; //$u.$s;

        //echo $u."\t".$s."\t";

        $order_num = implode("-", str_split(base_convert($str, 10, 36), 3));

        //echo strtoupper($promocode)."<br/>";
        //echo base_convert($promocode, 36, 10)."\n";
        //}

        return array('order_code' => strtoupper($order_num), 'order_num' => intval($str));
    }

}