<?php
session_start();
require 'vendor/autoload.php';
include_once('site/libs/config.php');
require_once('site/libs/smarty/Smarty.class.php');
require_once('site/libs/mysql.php');
include_once('site/functions.php');
include_once('site/classes/aModule.class.php');
include_once('site/classes/router.class.php');

$res = rows('SELECT `offer_id`, `images` FROM `imported_items`');

foreach ($res as $k=>$v) {
    $product_id = $v['offer_id'];
    $images = json_decode($v['images']);

    foreach ($images as $image) {
        $url = $image;
        $stmt = q("REPLACE INTO images (product_id, url) VALUES ('".$product_id."', '".$url."')");
    }

}
