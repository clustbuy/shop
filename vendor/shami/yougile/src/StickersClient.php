<?php

namespace Yougile;

trait StickersClient{

    /**
     * @param $stickerId
     * @param $stickerStateId
     * @return mixed
     */
    public function get_states($stickerId, $stickerStateId){
        return $this->request(self::$res . "/" . $stickerId . "/states/" . $stickerStateId, 'GET');
    }

    /**
     * @param $stickerId
     * @param $stickerStateId
     * @param $params
     * @return mixed
     */
    public function update_states($stickerId, $stickerStateId, $params){
        return $this->request(self::$res . "/" . $stickerId . "/states/" . $stickerStateId, 'PUT', $params);
    }

    /**
     * @param $stickerId
     * @param $params
     * @return mixed
     */
    public function create_states($stickerId, $params){
        return $this->request( self::$res . "/" . $stickerId . "/states" , 'POST', $params);
    }


}