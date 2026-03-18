<?php

function getDataFromPath($path = '')
{
    $filePath = $path == '' ? $_SERVER['REQUEST_URI'] : $path;
    $filePath = explode("/", $filePath);

    $data = array();
    for ($i = 0; $i < count($filePath); $i++) {
        $key = $filePath[$i];
        $i++;
        $val = $filePath[$i];
        $keyName = urldecode($key);
        $data[$keyName] = urldecode($val);
    }
    return $data;
}

?>