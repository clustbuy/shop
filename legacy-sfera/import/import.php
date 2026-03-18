<?php

session_start();
require 'vendor/autoload.php';
include_once('site/libs/config.php');
require_once('site/libs/smarty/Smarty.class.php');
require_once('site/libs/mysql.php');
include_once('site/functions.php');
include_once('site/classes/aModule.class.php');
include_once('site/classes/router.class.php');


$allProducts = [];
$lastId = "";
do {
    $response = apiRequest('/v3/product/list', [
        'limit' => 100,
        'last_id' => $lastId,
        'filter' => ['visibility' => 'ALL']
    ]);
    $products = $response['result']['items'];


    if (!empty($products)) {

        $ids = array();
        foreach ($products as $product) {
            $ids[] = $product['offer_id'];
        }
        $res = apiRequest('/v3/product/info/list', ['offer_id' => $ids]);

        foreach($res['items'] as $item)
        {
            insert('import', array(
                'json' => json_encode($item, JSON_UNESCAPED_UNICODE)
            ));
        }


        $allProducts = array_merge($allProducts, $products);
        $lastId = $response['result']['last_id']; // Обновляем last_id для следующего запроса
    } else {
        $lastId = ""; // Нет товаров — останавливаем
    }
} while ($lastId !== "");

//echo json_encode($allProducts);
//echo "<script> var v = ".json_encode(print_r($allProducts, true)).";console.log(v);</script>"; //die();


function apiRequest($endpoint, $data) {
    $url = "https://api-seller.ozon.ru" . $endpoint;

    $headers = [
        'Client-Id: 357120',
        'Api-Key: 22e19133-a76e-4e10-9e5e-264971e0dd32',
        'Content-Type: application/json'
    ];

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

    $response = curl_exec($curl);
    if(!$response) {
        throw new Exception('Ошибка запроса: ' . curl_error($curl));
    }
    curl_close($curl);

    return json_decode($response, true);
}
