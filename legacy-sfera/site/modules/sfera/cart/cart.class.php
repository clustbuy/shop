<?php include_once('site/classes/aModule.class.php');

class cart extends aModule
{
    function set_discount_sum($p)   {
        $_SESSION['cart']['discount_sum'] = $p['discount_sum'];
    }

    function del_promocode($p)   {
        $_SESSION['cart']['promocode'] = '';
        $_SESSION['user']['discount']['val'] = '';
    }

    function delete_product($p)   {
        // error_log('=== delete_product called ===');
        // error_log('GUID to delete: ' . $p['guid']);
        
        if (isset($_SESSION['cart']['items']) && is_array($_SESSION['cart']['items'])) {
            if (isset($_SESSION['cart']['items'][$p['guid']])) {
                unset($_SESSION['cart']['items'][$p['guid']]);
                // error_log('Product deleted from cart');
            } else {
                // error_log('Product not found in cart');
            }
        }
    }

    function clear_cart($p)   {
        // error_log('=== clear_cart called ===');
        if (!isset($_SESSION['cart']['items']) || !is_array($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        } else {
            $_SESSION['cart']['items'] = array();
        }
        // error_log('Cart cleared');
    }

    function update_item_selected($p) {
        if (isset($_SESSION['cart']['items']) && is_array($_SESSION['cart']['items'])) {
            if (isset($_SESSION['cart']['items'][$p['guid']])) {
                // Преобразуем selected в boolean: 1 или "1" -> true, 0 или "0" -> false
                $selected = isset($p['selected']) ? (intval($p['selected']) ? true : false) : true;
                $_SESSION['cart']['items'][$p['guid']]['selected'] = $selected;
            }
        }
    }

    function update_amount($p)   {
        // error_log('=== update_amount called ===');
        // error_log('GUID: ' . $p['guid'] . ', Amount: ' . $p['amount']);
        
        if (isset($_SESSION['cart']['items']) && is_array($_SESSION['cart']['items'])) {
            if (isset($_SESSION['cart']['items'][$p['guid']])) {
                $amount = intval($p['amount']);
                
                // Проверяем максимальное количество товара
                $guid = noSQL($p['guid']);
                $product = row("SELECT quantity FROM products WHERE id = '$guid'");
                
                if ($product) {
                    // Используем quantity, если есть, иначе 99
                    $max_quantity = !empty($product['quantity']) ? intval($product['quantity']) : 99;
                    
                    // Ограничиваем количество максимумом
                    if ($amount > $max_quantity) {
                        $amount = $max_quantity;
                        // error_log('Amount limited to max_quantity: ' . $max_quantity);
                    }
                    
                    // Сохраняем max_quantity в сессии для клиента
                    $_SESSION['cart']['items'][$p['guid']]['max_quantity'] = $max_quantity;
                }
                
                $_SESSION['cart']['items'][$p['guid']]['product_amount'] = $amount;
                
                // Убеждаемся, что у товара есть поле selected (по умолчанию true)
                if (!isset($_SESSION['cart']['items'][$p['guid']]['selected'])) {
                    $_SESSION['cart']['items'][$p['guid']]['selected'] = true;
                }
                
                // error_log('Amount updated to: ' . $amount);
            } else {
                // error_log('Product not found in cart');
            }
        }
    }

    function put_item($p)   {
        // error_log('=== put_item called ===');
        // error_log('Parameters: ' . print_r($p, true));
        
        $item = json_decode($p['item'], true);
        $guid = $item['guid'];
        $amount = intval($item['product_amount']);
        
        // error_log('Decoded item - guid: ' . $guid . ', amount: ' . $amount);

        // Получаем данные товара из таблицы products
        $query = "SELECT p.*, pr.price as cost 
                  FROM products p  
                  LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                  WHERE p.id = '" . noSQL($guid) . "'";
        
        // error_log('Query: ' . $query);
        $item = row($query);
        
        if (!$item) {
            // error_log('ERROR: Product not found with id: ' . $guid);
            return;
        }
        
        // error_log('Product found: ' . $item['name']);
        
        // Определяем максимальное количество для заказа
        $max_quantity = !empty($item['quantity']) ? intval($item['quantity']) : 99;
        $item['max_quantity'] = $max_quantity;

        if(isset($_SESSION['cart']['items'][$guid]))
        {
            $new_amount = $_SESSION['cart']['items'][$guid]['product_amount'] + $amount;
            // Проверяем максимальное количество
            if ($new_amount > $max_quantity) {
                $new_amount = $max_quantity;
                // error_log('Amount limited to max_quantity: ' . $max_quantity);
            }
            $item['product_amount'] = $new_amount;
            // Сохраняем состояние selected, если оно было установлено ранее
            if (isset($_SESSION['cart']['items'][$guid]['selected'])) {
                $item['selected'] = $_SESSION['cart']['items'][$guid]['selected'];
            } else {
                $item['selected'] = true; // По умолчанию true
            }
            // error_log('Product already in cart, new amount: ' . $item['product_amount']);
        }
        else
        {
            // Проверяем максимальное количество при добавлении
            if ($amount > $max_quantity) {
                $amount = $max_quantity;
                // error_log('Amount limited to max_quantity: ' . $max_quantity);
            }
            $item['product_amount'] = $amount;
            // По умолчанию товар выбран (selected = true)
            $item['selected'] = true;
            // error_log('New product in cart, amount: ' . $amount);
        }

        // Добавляем дополнительные поля для совместимости
        $item['title'] = $item['name'];
        $item['img_url'] = getProductImageUrl($guid);
        
        // Сохраняем в сессию
        $_SESSION['cart']['items'][$guid] = $item;
        
        // error_log('Item added to cart. Total items: ' . count($_SESSION['cart']['items']));
    }

    function update_item($p)   {
        // error_log('=== update_item called ===');
        $item = json_decode($p['item'], true);
        $guid = $item['guid'];
        $amount = intval($item['product_amount']);
        
        // error_log('GUID: ' . $guid . ', Amount: ' . $amount);
        
        // Если товара нет в корзине, добавляем его
        if (!isset($_SESSION['cart']['items'][$guid])) {
            // error_log('Product not in cart, adding it first');
            
            // Получаем данные товара из таблицы products
            $query = "SELECT p.*, pr.price as cost 
                      FROM products p  
                      LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
                      WHERE p.id = '" . noSQL($guid) . "'";
            
            $product = row($query);
            
            if (!$product) {
                // error_log('ERROR: Product not found with id: ' . $guid);
                return;
            }
            
            // Определяем максимальное количество для заказа
            $max_quantity = !empty($product['quantity']) ? intval($product['quantity']) : 99;
            $product['max_quantity'] = $max_quantity;
            
            // Проверяем максимальное количество
            if ($amount > $max_quantity) {
                $amount = $max_quantity;
                // error_log('Amount limited to max_quantity: ' . $max_quantity);
            }
            
            $product['product_amount'] = $amount;
            $product['title'] = $product['name'];
            $product['img_url'] = getProductImageUrl($guid);
            // По умолчанию товар выбран (selected = true)
            $product['selected'] = true;
            
            $_SESSION['cart']['items'][$guid] = $product;
            // error_log('Product added to cart with amount: ' . $amount);
        } else {
            // Товар есть в корзине, обновляем количество
            // Проверяем максимальное количество
            $guid_safe = noSQL($guid);
            $product = row("SELECT quantity FROM products WHERE id = '$guid_safe'");
            
            if ($product) {
                $max_quantity = !empty($product['quantity']) ? intval($product['quantity']) : 99;
                
                // Ограничиваем количество максимумом
                if ($amount > $max_quantity) {
                    $amount = $max_quantity;
                    // error_log('Amount limited to max_quantity: ' . $max_quantity);
                }
                
                // Сохраняем max_quantity в сессии для клиента
                $_SESSION['cart']['items'][$guid]['max_quantity'] = $max_quantity;
                
                // Сохраняем состояние selected, если оно было установлено ранее
                if (!isset($_SESSION['cart']['items'][$guid]['selected'])) {
                    $_SESSION['cart']['items'][$guid]['selected'] = true; // По умолчанию true
                }
            }
            
            $_SESSION['cart']['items'][$guid]['product_amount'] = $amount;
            // error_log('Product amount updated to: ' . $amount);
        }
    }

    function save_promocode($p)   {
        $_SESSION['cart']['promocode'] = $p['promocode'];
        $_SESSION['user']['discount']['val'] = $p['discount'];
    }


    function execute($arr)
    {
        // error_log('=== Cart execute called ===');
        // error_log('SESSION ID exists: ' . (isset($_SESSION['id']) ? 'YES' : 'NO'));
        // error_log('SESSION ID value: ' . (isset($_SESSION['id']) ? $_SESSION['id'] : 'NOT SET'));
        // error_log('Current SESSION cart: ' . print_r($_SESSION['cart'], true));
        
        // Инициализация session_id если не существует
        if (!isset($_SESSION['id']) || empty($_SESSION['id'])) {
            $_SESSION['id'] = session_id();
            // error_log('Session ID was empty, set to: ' . $_SESSION['id']);
        }
        
        // Инициализация корзины если не существует или items не массив
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        
        if (!isset($_SESSION['cart']['items']) || !is_array($_SESSION['cart']['items'])) {
            // error_log('Initializing cart items array');
            $_SESSION['cart']['items'] = array();
        }
        
        // Инициализация других полей корзины
        if (!isset($_SESSION['cart']['total_cart_amount'])) {
            $_SESSION['cart']['total_cart_amount'] = 0;
        }
        if (!isset($_SESSION['cart']['cart_sum'])) {
            $_SESSION['cart']['cart_sum'] = 0;
        }
        if (!isset($_SESSION['cart']['total_cart_sum'])) {
            $_SESSION['cart']['total_cart_sum'] = 0;
        }

        $p = $arr['send_params'];

        if (isset($p['task']) && strlen($p['task']) > 0)
        {
            // error_log('Task: ' . $p['task']);
            
            // Устанавливаем заголовок JSON
            header('Content-Type: application/json; charset=utf-8');
            
            try {
                switch ($p['task']) {
                    case 'set_discount_sum':  $this->set_discount_sum($p);  break;
                    case 'del_promocode':     $this->del_promocode($p);     break;
                    case 'delete_product':    $this->delete_product($p);    break;
                    case 'clear_cart':        $this->clear_cart($p);        break;
                    case 'update_amount':     $this->update_amount($p);     break;
                    case 'update_item_selected': $this->update_item_selected($p); break;
                    case 'get_cart':                                        break;
                    case 'put_item':          $this->put_item($p);          break;
                    case 'update_item':       $this->update_item($p);       break;
                    case 'save_promocode':    $this->save_promocode($p);    break;
                    default:
                        // error_log('Unknown task: ' . $p['task']);
                        echo json_encode(['success' => false, 'message' => 'unknown task']); 
                        die();
                }
                
                // Убеждаемся что все поля инициализированы перед calc()
                if (!isset($_SESSION['cart']['items'])) {
                    $_SESSION['cart']['items'] = array();
                }
                
                // Убеждаемся, что у всех товаров есть поле selected перед calc()
                // НО не перезаписываем существующее значение, только инициализируем если отсутствует
                if (isset($_SESSION['cart']['items']) && is_array($_SESSION['cart']['items'])) {
                    foreach ($_SESSION['cart']['items'] as $key => $item) {
                        if (!isset($item['selected'])) {
                            $_SESSION['cart']['items'][$key]['selected'] = true;
                        }
                    }
                }
                
                // error_log('Before calc() - SESSION cart items: ' . count($_SESSION['cart']['items']));
                
                $this->calc();
                
                // error_log('After calc() - SESSION cart state:');
                // error_log('  total_cart_amount: ' . $_SESSION['cart']['total_cart_amount']);
                // error_log('  cart_sum: ' . $_SESSION['cart']['cart_sum']);
                // error_log('  Items count: ' . count($_SESSION['cart']['items']));
                
                // Убеждаемся, что у всех товаров есть поле selected перед отправкой ответа
                // НО не перезаписываем существующее значение, только инициализируем если отсутствует
                if (isset($_SESSION['cart']['items']) && is_array($_SESSION['cart']['items'])) {
                    foreach ($_SESSION['cart']['items'] as $key => $item) {
                        if (!isset($item['selected'])) {
                            $_SESSION['cart']['items'][$key]['selected'] = true;
                        }
                    }
                }
                
                echo json_encode($_SESSION['cart']);
                die();
                
            } catch (Exception $e) {
                // error_log('ERROR in cart execute: ' . $e->getMessage());
                echo json_encode(['success' => false, 'error' => $e->getMessage()]);
                die();
            }
        }

        // Передаем данные корзины в шаблон
        if (!isset($_SESSION['cart']['items'])) {
            $_SESSION['cart']['items'] = array();
        }
        
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
        // error_log('Cart data assigned to Smarty. Items count: ' . count($_SESSION['cart']['items']));
        
        $_SESSION['smarty']->display('sfera/cart/cart.tpl');
    }

    function calc()
    {
        // error_log('=== calc() called ===');
        
        $cart_amount = 0;
        $cart_sum = 0;
        $cart_weight = 0;
        $bonus = 0;
        $total_bill = 0;
        $discount  = 0;

        if (isset($_SESSION['cart']['items']) && is_array($_SESSION['cart']['items'])) {
            foreach ($_SESSION['cart']['items'] as $key => $item) {
                // Убеждаемся, что у товара есть поле selected (по умолчанию true)
                if (!isset($item['selected'])) {
                    $_SESSION['cart']['items'][$key]['selected'] = true;
                }
                
                // Пропускаем товары, которые не выбраны (selected = false)
                $selected = isset($item['selected']) ? $item['selected'] : true;
                if (!$selected) {
                    continue; // Не учитываем невыбранные товары в расчетах
                }
                
                $price = isset($item['cost']) ? floatval($item['cost']) : 0;
                $bill = isset($item['bill']) ? floatval($item['bill']) : 0;
                $amount = isset($item['product_amount']) ? intval($item['product_amount']) : 1;
                $weight = isset($item['weight']) ? floatval(str_replace(',' , '.', $item['weight'])) : 0;
                
                // Обновляем max_quantity для товара, если его еще нет
                if (!isset($item['max_quantity']) || empty($item['max_quantity'])) {
                    $guid = noSQL($key);
                    $product = row("SELECT quantity FROM products WHERE id = '$guid'");
                    if ($product) {
                        $max_quantity = !empty($product['quantity']) ? intval($product['quantity']) : 99;
                        $_SESSION['cart']['items'][$key]['max_quantity'] = $max_quantity;
                    } else {
                        $_SESSION['cart']['items'][$key]['max_quantity'] = 99;
                    }
                }

                $total_bill += $bill;
                $cart_sum += $price * $amount;
                $cart_amount += $amount;
                $cart_weight += $weight;
            }
        }

        // Проверяем существование констант
        if (defined('TOTAL_COST') && defined('BONUS_RATIO') && $cart_sum > TOTAL_COST) {
            $bonus += round((($cart_sum - $total_bill) * BONUS_RATIO), 0);
        }

        $_SESSION['cart']['cart_discount'] = $discount;
        $_SESSION['cart']['bonus'] = $bonus;
        $_SESSION['cart']['total_cart_amount'] = $cart_amount;
        $_SESSION['cart']['cart_sum'] = $cart_sum;
        $_SESSION['cart']['cart_weight'] = $cart_weight;
        $_SESSION['cart']['total_cart_sum'] = $cart_sum;
        
        // error_log('Calculated: amount=' . $cart_amount . ', sum=' . $cart_sum);

        // Сохранение в базу данных (если таблица существует)
        try {
            // error_log('=== Saving cart to DB ===');
            // error_log('SESSION[id]: ' . (isset($_SESSION['id']) ? $_SESSION['id'] : 'NOT SET'));
            
            if (!isset($_SESSION['id']) || empty($_SESSION['id'])) {
                // error_log('Session ID not set, skipping DB save');
                return;
            }
            
            $session_id = noSQL($_SESSION['id']);
            $cart_json = json_encode($_SESSION['cart'], JSON_UNESCAPED_UNICODE);
            $ip = $this->get_ip();
            
            // error_log('Session ID: ' . $session_id);
            // error_log('IP: ' . $ip);
            
            // Проверяем существование таблицы
            $table_check = rows("SHOW TABLES LIKE '_cart_sessions'");
            // error_log('Table check result: ' . print_r($table_check, true));
            
            if (!is_array($table_check) || count($table_check) == 0) {
                // error_log('Table _cart_sessions does not exist, skipping DB save');
                return;
            }
            
            $exists = rows("SELECT id FROM _cart_sessions WHERE session_id = '" . $session_id . "'");
            // error_log('Exists check: ' . print_r($exists, true));
            
            if (is_array($exists) && count($exists) > 0) {
                $update_query = "UPDATE _cart_sessions SET  
                    session = '" . noSQL($cart_json) . "', 
                    ip = '" . noSQL($ip) . "',
                    cart_amount = " . intval($cart_amount) . ",
                    cart_sum = " . floatval($cart_sum) . "
                   WHERE session_id = '" . $session_id . "'";
                
                // error_log('UPDATE query: ' . $update_query);
                $result = q($update_query);
                // error_log('UPDATE result: ' . ($result ? 'SUCCESS' : 'FAILED'));
                // error_log('Cart session updated in DB');
            } else {
                // error_log('No existing session found, inserting new record');
                
                $insert_query = "INSERT INTO _cart_sessions (session_id, session, ip, cart_amount, cart_sum) VALUES (
                    '" . $session_id . "',
                    '" . noSQL($cart_json) . "', 
                    '" . noSQL($ip) . "',
                    " . intval($cart_amount) . ",
                    " . floatval($cart_sum) . "
                )";
                
                // error_log('INSERT query: ' . $insert_query);
                $result = q($insert_query);
                // error_log('INSERT result: ' . ($result ? 'SUCCESS' : 'FAILED'));
                
                if ($result) {
                    // error_log('Cart session inserted in DB successfully');
                } else {
                    // error_log('ERROR: Failed to insert cart session');
                }
            }
        } catch (Exception $e) {
            // error_log('ERROR saving cart to DB: ' . $e->getMessage());
            // error_log('Stack trace: ' . $e->getTraceAsString());
            // Продолжаем работу даже если не удалось сохранить в БД
        }
    }

}
?>