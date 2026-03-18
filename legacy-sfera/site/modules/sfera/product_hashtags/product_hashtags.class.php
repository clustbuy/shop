<?php 
include_once('site/classes/aModule.class.php');

class product_hashtags extends aModule
{
    /**
     * Модуль отображения хэштегов для карточки товара
     * Получает хэштеги через связку v_products_o_products и product_hashtags
     */
    function execute($arr)
    {
        //echo "<script> var v = ".json_encode(print_r($arr, true)).";console.log(v);</script>"; //die();
        $product_id = isset($arr['product_id']) ? $arr['product_id'] : '';
        
        if (empty($product_id)) {
            error_log('product_hashtags: product_id not provided');
            return;
        }
        
        error_log("=== product_hashtags: Loading hashtags for product: $product_id ===");
        
        // Получаем хэштеги через связку v_products_o_products
        // Используем MIN(ph.id) чтобы получить один ID на каждый уникальный хэштег
        $query = "SELECT MIN(ph.id) as hashtag_id, ph.value
                  FROM v_products_o_products vpo
                  INNER JOIN product_hashtags ph ON vpo.product_id = ph.product_id
                  WHERE vpo.offer_id = '" . noSQL($product_id) . "'
                  GROUP BY ph.value
                  ORDER BY ph.value ASC";


        error_log("SQL Query: $query");

        $_SESSION['ts']['product_hashtags_query'] = (string)get_period();

        $result = rows($query);
        $_SESSION['ts']['product_hashtags_sql_res'] = (string)get_period();

        error_log("Found hashtags: " . count($result));
        
        // Форматируем данные хэштегов
        $hashtags = [];
        foreach ($result as $row) {
            $hashtag_id = isset($row['hashtag_id']) ? $row['hashtag_id'] : 0;
            $hashtag_value = isset($row['value']) ? $row['value'] : '';
            
            if (!empty($hashtag_value) && $hashtag_id > 0) {
                $hashtags[] = [
                    'id' => $hashtag_id,  // ID для ссылки
                    'value' => $hashtag_value  // Значение для отображения
                ];
            }
        }
        
        // Передаем данные в шаблон
        $_SESSION['smarty']->assign('product_id', $product_id);
        $_SESSION['smarty']->assign('hashtags', $hashtags);
        $_SESSION['smarty']->assign('hashtags_count', count($hashtags));
        
        // Выводим результат рендера шаблона
        print ($_SESSION['smarty']->fetch('sfera/product_hashtags/product_hashtags.tpl'));
    }
}

