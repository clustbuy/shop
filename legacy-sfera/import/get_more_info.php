<?php
ini_set('memory_limit', '2G');
session_start();
require 'vendor/autoload.php';
include_once('site/libs/config.php');
require_once('site/libs/smarty/Smarty.class.php');
require_once('site/libs/mysql.php');
include_once('site/functions.php');
include_once('site/classes/aModule.class.php');
include_once('site/classes/router.class.php');

$res = rows('SELECT `json` FROM `import`');

//$allProducts = [];
foreach ($res as $k=>$v) {

    $obj = json_decode($v['json'], true);
    $product = array(
        'id' => $obj['id'],
        'name' => $obj['name'],
        'offer_id' => $obj['offer_id'],
        //'is_archived' => is_true($obj['is_archived'])?1:0,
        //'is_autoarchived' => is_true($obj['is_autoarchived'])?1:0,
        //'barcodes' => json_encode($obj['barcodes']),
        //'description_category_id' => $obj['description_category_id'],
        //'type_id' => $obj['type_id'],
        //'created_at' => $obj['created_at'],
        'images' => json_encode($obj['images'], JSON_UNESCAPED_UNICODE),
        //'currency_code' => $obj['currency_code'],
        //'marketing_price' => $obj['marketing_price'],
        //'min_price' => $obj['min_price'],
        //'old_price' => $obj['old_price'],
        'price' => $obj['price'],
        'volume_weight' => $obj['volume_weight'],
        //'updated_at' => $obj['updated_at'],
        //'vat' => $obj['vat'],
        'primary_image' => $obj['primary_image'][0],
        'sku' => $obj['sku']
    );

    insert('imported_items', $product);

    //$allProducts[] = $product;
}