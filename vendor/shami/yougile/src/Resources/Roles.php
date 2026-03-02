<?php

namespace Yougile\Resources;
use Yougile\BaseClient;
use Yougile\Yougile;


class Roles extends Yougile
{

    /**
     * @var string
     */
    public static $res = "projects";

    use BaseClient;

    /**
     * @param $id
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function get_list($id){
        return $this->request( self::$res . "/" . $id . "/roles" , 'GET');
    }

    /**
     * @param $params
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function create($id, $params){
        return $this->request( self::$res . "/" . $id . "/roles" , 'POST', $params);
    }

    /**
     * @param $id_prj
     * @param $id_role
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function get_by_id($id_prj, $id_role){
        return $this->request(self::$res . "/" . $id_prj . "/roles/" . $id_role, 'GET');
    }

    /**
     * @param $id_prj
     * @param $id_role
     * @param $params
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function update($id_prj, $id_role, $params){
        return $this->request(self::$res . "/" . $id_prj . "/roles/" . $id_role, 'PUT', $params);
    }

    /**
     * @param $id_prj
     * @param $id_role
     * @return mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function delete($id_prj, $id_role){
        return $this->request(self::$res . "/" . $id_prj . "/roles/" . $id_role, 'DELETE');
    }

}