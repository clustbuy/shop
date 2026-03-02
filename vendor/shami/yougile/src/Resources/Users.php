<?php


namespace Yougile\Resources;
use Yougile\BaseClient;
use Yougile\Yougile;

class Users extends Yougile
{

    /**
     * @var string
     */
    public static $res = "users";

    use BaseClient;

    /**
     * @param $email
     * @param false $isAdmin
     * @return mixed
     */
      public function create($email, $isAdmin = false){
          $params = array(
              "email" => $email,
              "isAdmin" => $isAdmin
          );
          return $this->request( self::$res , 'POST', $params);
      }


}