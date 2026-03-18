<?php

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

?>