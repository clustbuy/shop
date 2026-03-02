<?php


namespace Yougile\Resources;
use Yougile\BaseClient;
use Yougile\StickersClient;
use Yougile\Yougile;


class Stringstickers extends Yougile
{

    public static $res = "string-stickers";

    use BaseClient, StickersClient;


}
