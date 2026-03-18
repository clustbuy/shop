<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
include_once('site/functions/time.php');
include_once('site/functions/slug.php');
include_once('site/functions/getProductImageUrl.php');

global $ts; list($usec, $sec) = explode(" ", microtime());  $ts = ((float)$usec + (float)$sec);
session_start();
unset($_SESSION['ts']); $_SESSION['ts']['001_index_session_start'] = (string)get_period();

require 'vendor/autoload.php';
include_once('site/libs/config.php');
require_once('site/libs/smarty/Smarty.class.php');
require_once('site/libs/mysql.php');
//include_once('site/functions.php');
include_once('site/classes/aModule.class.php');
include_once('site/classes/router.class.php');
$_SESSION['ts']['002_index_load_classes'] = (string)get_period();

$rout = new router();
$rout->execute(getRequest('sfera'));

function getRequest($val='')
{
    $params = array_merge($_GET, $_POST);
    $params = array_merge($params, array('rout' => $val));

    reset($params);
    foreach ($params as $key => $value) {
        if (gettype($params[$key]) != "array") {
            if (get_magic_quotes_gpc()) {
                $value = stripslashes(trim($value));
            }
            $params[$key] = $value;
        }
    }
    return $params;
}

