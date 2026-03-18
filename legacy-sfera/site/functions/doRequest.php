<?php

function doRequest($link, $method = 'GET', $data = null, $auth = null)
{
    $headers = [];
    $ch = curl_init($link);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    if ($method === 'POST') {
        if (empty(@json_decode($data))) {
            $data = http_build_query($data);
        }
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        $headers[] = 'Content-type: application/json';
    } else {
        curl_setopt($ch, CURLOPT_URL, $link . '?' . http_build_query($data));
    }
    
    if ($auth) {
        $headers[] = $auth;
        curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
    }

    $body = curl_exec($ch);
    curl_close($ch);

    $json = json_decode($body, true);
    if ($json) {
        return $json;
    }

    return $body;
}


?>