<?php

namespace Yougile\Resources;

use Yougile\BaseClient;
use Yougile\Yougile;


class Chats extends Yougile
{

    public static $res = "chats";

    use BaseClient;

    /**
     * @param $id
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function get_list($id){
        return $this->request(self::$res . '/' . $id . "/messages", 'GET');
    }

    /**
     * @param $params
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function create($id, $params){
        return $this->request( self::$res . '/' . $id . "/messages", $params);
    }

    /**
     * @param $chatId
     * @param $id
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function get_by_id($chatId, $id){
        return $this->request(self::$res . '/' . $chatId . "/messages/". $id, 'GET');
    }

    /**
     * @param $chatId
     * @param $id
     * @param $params
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function update($chatId, $id, $params){
        return $this->request(self::$res . '/' . $chatId . "/messages/". $id, 'PUT', $params);
    }


}