<?php

namespace Yougile;
use GuzzleHttp\Client;

class Yougile
{

    const API_URL = "https://yougile.com/api-v2/";

    protected $id_company;

    protected $api_key;

    /**
     * Yougile constructor.
     * @param $id_c
     * @param $key
     */
    public function __construct($id_company , $api_key){
        $this->api_key = $api_key;
        $this->id_company = $id_company;
    }

    /**
     * @param $resource
     * @return mixed
     */
    public function api($resource){
        $resource = ucfirst(strtolower($resource));
        $class = __NAMESPACE__ . '\Resources\\' . $resource;
        return new $class($this->id_company , $this->api_key);
    }

    /**
     * @param $res
     * @param $method
     * @param array $params
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function request($res, $method, array $params = []){
        $request = $this->make_request($res);
        $response = $this->send_request($request, $method, $params);
        return json_decode($response->getBody());
    }

    /**
     * @param $res
     * @return string
     */
    protected function make_request($res){
        return self::API_URL . $res;
    }

    /**
     * @param $request
     * @param string $method
     * @param array $params
     * @return \Psr\Http\Message\ResponseInterface
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    protected function send_request($request, $method = 'POST', $params = []){
        $headers = [
            'Authorization' => 'Bearer ' . $this->api_key ,
            'Accept'        => 'application/json',
        ];
        $client = new Client();
        return $client->request($method, $request, [
            'headers' => $headers,
            'json' => $params
        ]);
    }


}