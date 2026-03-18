<?php

function microtime_float()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}

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


function now()
{
    $now = array();
    list($now['year'], $now['month'], $now['months'], $now['day'], $now['hour'], $now['hours'], $now['minute'], $now['minutes'], $now['second']) = sscanf(date("Y m m d H H i i s"), "%d %d %s %d %d %s %d %s %d");
    return $now;
}

function time_format($time)
{
    $now = array();
    list($now['year'], $now['month'], $now['months'], $now['day'], $now['hour'], $now['hours'], $now['minute'], $now['minutes'], $now['second']) = sscanf(date("Y m m d H H i i s", $time), "%d %d %s %d %d %s %d %s %d");
    return $now;
}


function get_period($global_value = '')
{
    global $ts;
    list($usec, $sec) = explode(" ", microtime());
    $time = ((float)$usec + (float)$sec);
    $period = ((float)$time - (float)$ts);
    $ts = $time;
    return $period;
}

function noSQL($string)
{
    if (!$GLOBALS['dbid']) dbconnect();
    return mysqli_real_escape_string($GLOBALS['dbid'], $string);
//    return $string;
    //trim(mysqli_real_escape_string($_SESSION['db'], $string));
}

function f_call_sp($sp_arr)
{

    $db = $GLOBALS['dbid'];
    $sql = "";
    foreach ($sp_arr as $sp => $value) {
        $quotedParams = array();
        $storeProcedureName = $value['proc'];
        foreach ($value['p'] as $param) {
            array_push($quotedParams, $param === null ? 'NULL' : '"' . $param . '"');
        }
        $sql .= 'CALL ' . $storeProcedureName . '(' . implode(',', $quotedParams) . ');';
    }

    $db->multi_query($sql);
    $results = array();
    do {
        if ($result = $db->store_result()) {
            $rows = array();
            while ($row = $result->fetch_assoc()) {
                array_push($rows, $row);
            }
            $result->close();
            array_push($results, $rows);
        }
    } while ($db->more_results() && $db->next_result());

    return ($results);
}

function f_get_data($proc, $p)
{
    $out[] = array(
        'proc' => $proc,
        'p' => $p
    );
    $res = f_call_sp($out);
    $r = $res[0];

    return $r;
}

function f_child_nodes($id_cat)
{

    $menu = $_SESSION['menu'];

    // получить все id узлов, которые подчинены данному узлу
    $condition = array();
    foreach ($menu as $m) {
        if ($m['parent'] == 0) continue;
        $i = $m['id_cat'];
        do {
            if ($i == $id_cat) {
                $condition[] = $m['id_cat'];
                break;
            }
            $i = $menu[$i]['parent'];
        } while ($i != 0);
    }
    $condition[] = $id_cat;
    //$nodes = implode(",", $condition);

    return $condition;
}

function JavaScriptEncode($string)
{

    $string = "document.write('" . $string . "');";

    $js_encode = '';

    for ($x = 0; $x < strlen($string); $x++) {
        $js_encode .= '%' . bin2hex($string[$x]);
    }

    return '<script type="text/javascript">eval(decodeURIComponent(\'' . $js_encode . '\'))</script>';
}



function remove_emoji($string)
{
    // Match Enclosed Alphanumeric Supplement
    $regex_alphanumeric = '/[\x{1F100}-\x{1F1FF}]/u';
    $clear_string = preg_replace($regex_alphanumeric, '', $string);

    // Match Miscellaneous Symbols and Pictographs
    $regex_symbols = '/[\x{1F300}-\x{1F5FF}]/u';
    $clear_string = preg_replace($regex_symbols, '', $clear_string);

    // Match Emoticons
    $regex_emoticons = '/[\x{1F600}-\x{1F64F}]/u';
    $clear_string = preg_replace($regex_emoticons, '', $clear_string);

    // Match Transport And Map Symbols
    $regex_transport = '/[\x{1F680}-\x{1F6FF}]/u';
    $clear_string = preg_replace($regex_transport, '', $clear_string);
    
    // Match Supplemental Symbols and Pictographs
    $regex_supplemental = '/[\x{1F900}-\x{1F9FF}]/u';
    $clear_string = preg_replace($regex_supplemental, '', $clear_string);

    // Match Miscellaneous Symbols
    $regex_misc = '/[\x{2600}-\x{26FF}]/u';
    $clear_string = preg_replace($regex_misc, '', $clear_string);

    // Match Dingbats
    $regex_dingbats = '/[\x{2700}-\x{27BF}]/u';
    $clear_string = preg_replace($regex_dingbats, '', $clear_string);

    return $clear_string;
}

function remove_emoji_array($array)
{

    if (is_array($array)) {
        foreach ($array as $k => $v) {
            if (is_string($v)) {
                $array[$k] = remove_emoji($v);
            }
        }
    }

    return $array;
}


function isProduction()
{

    $env = getenv('ENV') ?: 'production';
    return $env == 'production';

    //return false;
}

function sendSms($phoneNumber, $message)
{
    $phoneNumber = str_replace(['-', ' ', '(', ')'], '', $phoneNumber);

    // отправка смс
    require_once 'site/libs/sms.ru.php';

    try {
        
        $smsru = new SMSRU(SMSRU_TOKEN); // Ваш уникальный программный ключ, который можно получить на главной странице

        $data = new stdClass();
        $data->to = $phoneNumber;
        $data->text = $message; // Текст сообщения

        $data->test = (R==1)?0:1; // Позволяет выполнить запрос в тестовом режиме без реальной отправки сообщения

        // $data->from = ''; // Если у вас уже одобрен буквенный отправитель, его можно указать здесь, в противном случае будет использоваться ваш отправитель по умолчанию
        // $data->time = time() + 7*60*60; // Отложить отправку на 7 часов
        // $data->translit = 1; // Перевести все русские символы в латиницу (позволяет сэкономить на длине СМС)
        // $data->partner_id = '1'; // Можно указать ваш ID партнера, если вы интегрируете код в чужую систему

        return $smsru->send_one($data); // Отправка сообщения и возврат данных в переменную
    } catch (Throwable $e) {
    }

    return false;
}
    


function comet_bye($link)
{
  mysqli_close($link);
}

function comet_connect()
{

    $link =  mysqli_connect("app.comet-server.ru",
        "15", "lPXBFPqNg3f661JcegBY0N0dPXqUBdHXqj2cHf04PZgLHxT6z55e20ozojvMRvB8", "CometQL_v1");

    //mysqli_connect("app.comet-server.ru", "", "lPXBFPqNg3f661JcegBY0N0dPXqUBdHXqj2cHf04PZgLHxT6z55e20ozojvMRvB8", "CometQL_v1");

    if(!$link)
    {
        echo json_encode(Array( "info" => "Не удалось создать соединение c CometQL (Использование CometQL не возможно)", 
                                "error" => true));
        //$this->comet_error = 1;
    }
    else
    {
 
        $result = mysqli_query (  $link, "show status" ); 
        if(mysqli_errno($link) != 0 && @mysqli_num_rows($result))
        {
            echo json_encode(Array(
                                    "info" => "<b>Error code:<a href='https://comet-server.ru/wiki/doku.php/comet:cometql:error'  target='_blank' >".mysqli_errno($link)."</a>&nbsp;&nbsp;Error text:<a href='https://comet-server.ru/wiki/doku.php/comet:cometql:error' target='_blank' >".mysqli_error($link)."</a></b>", 
                                    "error" => true
                                )
                            );
            //$this->comet_error = 1;
        }
        else 
        { 
            //$resTest[] = Array("info" => "OK", "error" => false);
            //$this->comet_error = 0;
        }
    } 

    return $link;     
}

function pushCometMessage($link, $channel, $event, $message)
{
    try {
        //$link = mysqli_connect(COMET_SERVER_HOST, COMET_DEV_ID, COMET_DEV_KEY, "CometQL_v1");

        if (!$link) {
            return false;
        }

        $query = "INSERT INTO pipes_messages (name, event, message) VALUES ('%s', '%s', '%s')";

        if (!is_string($message)) {
            $message = json_encode($message);
        }

        return mysqli_query($link, sprintf($query, $channel, $event, $message));
    } catch (Throwable $e) {
    }

    return false;
}


function get_nodes($id_cat)
{
    // получить все id узлов, которые подчинены данному узлу
    $condition = array();
    foreach ($_SESSION['categories'] as $m) {
        if ($m['parent'] == 0) continue;
        $i = $m['id_cat'];
        do {
            if ($i == $id_cat) {
                $condition[] = $m['id_cat'];
                break;
            }
            $i = $menu[$i]['parent'];
        } while ($i != 0);
    }
    $condition[] = $id_cat;
    $nodes = implode(",", $condition);

    return $nodes;
}

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

/**
 * \
 *
 * Функция проверки внешних картинок.
 *
 * @param string $url Ссылка на изображение.
 * @return bool Выводит признак существования картинки.
 **/
function isRemoteImageExists($url)
{
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HEADER, true);    // we want headers
    curl_setopt($ch, CURLOPT_NOBODY, true);    // we don't need body
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_exec($ch);
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpcode != 200) {
        return false;
    }
    return true;
}

class ProfileClient extends ClientBase
{
    const BASE_URL = "https://dadata.ru/api/v2/";

    public function __construct($token, $secret)
    {
        parent::__construct(self::BASE_URL, $token, $secret);
    }

    public function getBalance()
    {
        $url = "profile/balance";
        $response = $this->get($url);
        return $response["balance"];
    }

    public function getDailyStats($date = null)
    {
        $url = "stat/daily";
        if (!$date) {
            $date = new DateTime();
        }
        $query = ["date" => $date->format("Y-m-d")];
        $response = $this->get($url, $query);
        return $response;
    }

    public function getVersions()
    {
        $url = "version";
        $response = $this->get($url);
        return $response;
    }
}

class SuggestClient extends ClientBase
{
    const BASE_URL = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/";

    public function __construct($token)
    {
        parent::__construct(self::BASE_URL, $token, null);
    }

    public function findAffiliated($query, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        $url = "findAffiliated/party";
        $data = ["query" => $query, "count" => $count];
        $data = $data + $kwargs;
        $response = $this->post($url, $data);
        return $response["suggestions"];
    }

    public function findById($name, $query, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        $url = "findById/$name";
        $data = ["query" => $query, "count" => $count];
        $data = $data + $kwargs;
        $response = $this->post($url, $data);
        return $response["suggestions"];
    }

    public function geolocate($name, $lat, $lon, $radiusMeters = 100, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        $url = "geolocate/$name";
        $data = array(
            "lat" => $lat,
            "lon" => $lon,
            "radius_meters" => $radiusMeters,
            "count" => $count,
        );
        $data = $data + $kwargs;
        $response = $this->post($url, $data);
        return $response["suggestions"];
    }

    public function iplocate($ip, $kwargs = [])
    {
        $url = "iplocate/address";
        $query = ["ip" => $ip];
        $query = $query + $kwargs;
        $response = $this->get($url, $query);
        return $response["location"];
    }

    public function suggest($name, $query, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        $url = "suggest/$name";
        $data = ["query" => $query, "count" => $count];
        $data = $data + $kwargs;
        $response = $this->post($url, $data);
        return $response["suggestions"];
    }
}


abstract class ClientBase
{
    public $client;

    public function __construct($baseUrl, $token, $secret = null)
    {
        $headers = [
            "Content-Type" => "application/json",
            "Accept" => "application/json",
            "Authorization" => "Token " . $token,
        ];
        if ($secret) {
            $headers["X-Secret"] = $secret;
        }
        $this->client = new \GuzzleHttp\Client([
            "base_uri" => $baseUrl,
            "headers" => $headers,
            "timeout" => Settings::TIMEOUT_SEC
        ]);
    }

    protected function get($url, $query = [])
    {
        $response = $this->client->get($url, ["query" => $query]);
        return json_decode($response->getBody(), true);
    }

    protected function post($url, $data)
    {
        $response = $this->client->post($url, [
            "json" => $data
        ]);
        return json_decode($response->getBody(), true);
    }
}

class CleanClient extends ClientBase
{
    const BASE_URL = "https://cleaner.dadata.ru/api/v1/";

    public function __construct($token, $secret)
    {
        parent::__construct(self::BASE_URL, $token, $secret);
    }

    public function clean($name, $value)
    {
        $url = "clean/$name";
        $fields = array($value);
        $response = $this->post($url, $fields);
        return $response[0];
    }

    public function cleanRecord($structure, $record)
    {
        $url = "clean";
        $data = [
            "structure" => $structure,
            "data" => [$record]
        ];
        $response = $this->post($url, $data);
        return $response["data"][0];
    }
}


class DadataClient
{
    private $cleaner;
    private $profile;
    private $suggestions;

    public function __construct($token, $secret)
    {
        $this->cleaner = new CleanClient($token, $secret);
        $this->profile = new ProfileClient($token, $secret);
        $this->suggestions = new SuggestClient($token);
    }

    public function clean($name, $value)
    {
        return $this->cleaner->clean($name, $value);
    }

    public function cleanRecord($structure, $record)
    {
        return $this->cleaner->cleanRecord($structure, $record);
    }

    public function findAffiliated($query, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        return $this->suggestions->findAffiliated($query, $count, $kwargs);
    }

    public function findById($name, $query, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        return $this->suggestions->findById($name, $query, $count, $kwargs);
    }

    public function geolocate($name, $lat, $lon, $radiusMeters = 100, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        return $this->suggestions->geolocate($name, $lat, $lon, $radiusMeters, $count, $kwargs);
    }

    public function getBalance()
    {
        return $this->profile->getBalance();
    }

    public function getDailyStats($date = null)
    {
        return $this->profile->getDailyStats($date);
    }

    public function getVersions()
    {
        return $this->profile->getVersions();
    }

    public function iplocate($ip, $kwargs = [])
    {
        return $this->suggestions->iplocate($ip, $kwargs);
    }

    public function suggest($name, $query, $count = Settings::SUGGESTION_COUNT, $kwargs = [])
    {
        return $this->suggestions->suggest($name, $query, $count, $kwargs);
    }
}

class Settings
{
    const SUGGESTION_COUNT = 5;
    const TIMEOUT_SEC = 3;
}

//функция перевода числа в строку
function morph($n, $f1, $f2, $f5) 
{
    $n = abs(intval($n)) % 100;
    if ($n > 10 && $n < 20) return $f5;
    $n = $n % 10;
    if ($n > 1 && $n < 5) return $f2;
    if ($n == 1) return $f1;
    return $f5;
}

function num2str($num)
{
    $nul = 'ноль';
    $ten = array(
        array('', 'один', 'два', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять'),
        array('', 'одна', 'две', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять')
    );
    $a20 = array('десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать', 'восемнадцать', 'девятнадцать');
    $tens = array(2 => 'двадцать', 'тридцать', 'сорок', 'пятьдесят', 'шестьдесят', 'семьдесят', 'восемьдесят', 'девяносто');
    $hundred = array('', 'сто', 'двести', 'триста', 'четыреста', 'пятьсот', 'шестьсот', 'семьсот', 'восемьсот', 'девятьсот');
    $unit = array(
        array('копейка' , 'копейки',   'копеек',     1),
        array('рубль',    'рубля',     'рублей',     0),
        array('тысяча',   'тысячи',    'тысяч',      1),
        array('миллион',  'миллиона',  'миллионов',  0),
        array('миллиард', 'миллиарда', 'миллиардов', 0),
    );
 
    list($rub, $kop) = explode('.', sprintf("%015.2f", floatval($num)));
    $out = array();
    if (intval($rub) > 0) {
        foreach (str_split($rub, 3) as $uk => $v) {
            if (!intval($v)) continue;
            $uk = sizeof($unit) - $uk - 1;
            $gender = $unit[$uk][3];
            list($i1, $i2, $i3) = array_map('intval', str_split($v, 1));
            // mega-logic
            $out[] = $hundred[$i1]; // 1xx-9xx
            if ($i2 > 1) $out[] = $tens[$i2] . ' ' . $ten[$gender][$i3]; // 20-99
            else $out[] = $i2 > 0 ? $a20[$i3] : $ten[$gender][$i3]; // 10-19 | 1-9
            // units without rub & kop
            if ($uk > 1) $out[] = morph($v, $unit[$uk][0], $unit[$uk][1], $unit[$uk][2]);
        }
    } else {
        $out[] = $nul;
    }
    $out[] = morph(intval($rub), $unit[1][0], $unit[1][1], $unit[1][2]); // rub
    $out[] = $kop . ' ' . morph($kop, $unit[0][0], $unit[0][1], $unit[0][2]); // kop
    return trim(preg_replace('/ {2,}/', ' ', join(' ', $out)));
}

function get_alias(){
    return $_SERVER['HTTP_HOST'];
}

function get_req($arr)
{
    $post = array();
    $aliases = array();

    if(isset($arr['q']))
    {
        $alias = preg_split("/[\/]+/", $arr['q']); // разбираем строку
        foreach($alias as $a)	{if($a!='') {$post[] = $a; $aliases[] = $a;}}
    }

    return $post;
}

function cart_init()
{
        if(!isset($_SESSION['cart']))
        {
            $_SESSION['cart'] = array();
            $_SESSION['cart']['total_cart_amount'] = 0;
            $_SESSION['cart']['total_cart_sum'] = 0;
            $_SESSION['cart']['items'] = array();
            $_SESSION['cart']['discount'] = 0;
            $_SESSION['cart']['user'] = array('phone' => '');
        }
        $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
}



function get_ip()
{
    if (!empty($_SERVER['HTTP_CLIENT_IP']))
    {
        $ip=$_SERVER['HTTP_CLIENT_IP'];
    }
    elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
    {
        $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    else
    {
        $ip=$_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}

function message_to_telegram($text)
{
    $ch = curl_init();
    curl_setopt_array(
        $ch,
        array(
            CURLOPT_URL => 'https://api.telegram.org/bot' . TELEGRAM_TOKEN . '/sendMessage',
            CURLOPT_POST => TRUE,
            CURLOPT_RETURNTRANSFER => TRUE,
            CURLOPT_TIMEOUT => 10,
            CURLOPT_POSTFIELDS => array(
                'chat_id' => TELEGRAM_CHATID,
                'text' => $text,
            ),
        )
    );
    echo json_encode(curl_exec($ch));
}

function detect_mobile()
{
    require_once 'site/libs/Mobile_Detect.php';
    $mobile = null;
    $detect = new Mobile_Detect; 
    if ($detect->isMobile() && !$detect->isTablet()) {
        $mobile = 1;
    } else if ($detect->isTablet()) {
                $mobile = 2;
            } else
                {
                    $mobile = 0;
                }
    return $mobile;
}

function send_email($subject, $body, $recipient_email)
{

    /* 
    require("vendor/phpmailer/phpmailer/src/PHPMailer.php");
    require("vendor/phpmailer/phpmailer/src/SMTP.php");
    
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    
    require_once '/PHPMailer/src/Exception.php';
    require_once '/PHPMailer/src/PHPMailer.php';
    require_once '/PHPMailer/src/SMTP.php';
     */

    // Для более ранних версий PHPMailer  
    //require_once '/PHPMailer/PHPMailerAutoload.php'; %YuEpYa6tEs2
     
    $mail = new PHPMailer\PHPMailer\PHPMailer();
    $mail->CharSet = 'UTF-8';
     
    // Настройки SMTP
    $mail->isSMTP();
    $mail->SMTPAuth = true;
    $mail->SMTPDebug = 0;
     
    $mail->Host = 'ssl://smtp.mail.ru';
    $mail->Port = 465;
    $mail->Username = 'orders@ru.market';
    $mail->Password = 'GMitiRtY^u16';
     
    // От кого
    $mail->setFrom('orders@ru.market', 'ru.market');      
     
    // Кому
    $mail->addAddress($recipient_email, '');
    $mail->addAddress('orders@ru.market', '');
     
    // Тема письма
    $mail->Subject = $subject;
     
    // Тело письма
    //$body = '<p><strong>«Hello, world!» </strong></p>';
    $mail->msgHTML($body);
     
    // Приложение
    //$mail->addAttachment(__DIR__ . '/image.jpg');
     
    $mail->send();
}

function make_promo()
{

    $salt = "50626";
    $date1 = new DateTime("2022-04-14");
    $date2 = new DateTime("now");
    $interval = $date1->diff($date2); //print_r($interval)."\n";

    $days = $interval->format('%a');$hours = $interval->format('%h');
    $minutes = $interval->format('%i');$seconds = $interval->format('%s');
    $s = $seconds + $minutes*60 + $hours*3600 + $days*24*3600;// + 900000000;

    //for($i=1; $i<=1000; $i++)
    //{
        usleep(rand(1,1000000));
        $time = new \DateTimeImmutable();
        $u = $time->format("u");
        if ($u<50000) $u+= 49999;

        $str = $u.$s;

        //echo $u."\t".$s."\t";

        $promocode = implode("-", str_split(base_convert($str, 10, 36), 3));

        //echo strtoupper($promocode)."<br/>";
        //echo base_convert($promocode, 36, 10)."\n";
    //}

    return strtoupper($promocode);

}

function getProductImages($v, $nohash = false){
    $result = [];
//    $node = strtoupper(base_convert($v['node'], 10, 36));
    //images
//    $path = DIRECTORY_SEPARATOR."i".DIRECTORY_SEPARATOR.$node.DIRECTORY_SEPARATOR.$v['name'];
    $path = DIRECTORY_SEPARATOR."i".DIRECTORY_SEPARATOR.$v['guid'];
    $dir = getcwd().$path;
    $result['gallery'] = [];
    $result['thumbnails'] = [];
    if(is_dir($dir) ) {
        $files = scandir( $dir);
        $hash_no_photo = hash_file('md5',getcwd().'/images/no-photo.jpg');
        $size_no_photo = filesize(getcwd().'/images/no-photo.jpg');
        foreach($files as $file) {
            if (is_file($dir.DIRECTORY_SEPARATOR.$file)) {
                if(filesize($dir.DIRECTORY_SEPARATOR.$file) == $size_no_photo) {
                    if (hash_file('md5', $dir . DIRECTORY_SEPARATOR . $file) == $hash_no_photo) {
                        continue;
                    }
                }

                $result['gallery'][] = str_replace(DIRECTORY_SEPARATOR,'/',$path).'/'.$file;
            }
        }
        if(count($result['gallery']) == 0){
            $result['gallery'][] = '/images/no-photo.jpg';
        }
        // thumbnails
        $result['thumbnails'] = $result['gallery'];
        // пока не появятся папки с миниатюрами закоментируем
        /*$path = $path.DIRECTORY_SEPARATOR. '400';
        $dir = getcwd().$path;
        if(is_dir($dir)) {
            $files = scandir( $dir);
            foreach($files as $file) {
                if (is_file($dir.DIRECTORY_SEPARATOR.$file)) {
                    $result['thumbnails'][] = $path.'/'.$file;
                }
            }
        }*/
    }elseif(RELEASE == 'DEV') {
            $i = 0;
            $path = str_replace(DIRECTORY_SEPARATOR, '/', $path);
            while ($i < 5) {

                $url = 'https://ru.market' . $path . '/' . $i . '.jpg';
                // if(!remote_jpg_exists($url)){
                //     $url = '/images/no-photo.jpg';
                // }
                $result['gallery'][] = $url;
                // пока не появятся папки с миниатюрами закоментируем
//            $url = 'https://ru.market' . $path . '/400/' . $i . '.jpg';
                $result['thumbnails'][] = $url;
                $i++;
            }
    } else{
        $result['gallery'][] = '/images/no-photo.jpg';
        $result['thumbnails'][] = '/images/no-photo.jpg';
    }
    return $result;
}
function remote_jpg_exists($url){
    $headers=get_headers($url);
//    echo '<pre>'; print_r($headers); echo '</pre>';
    return stripos($headers[2],"image/jpeg")?true:false;
}

function get_subcategies_ids($category){

    $categories = [];
    $categories[] = $category['guid'];

    $cat_children1 = rows("SELECT * FROM tree WHERE parent_id =".intval($category['id']));

    if(count($cat_children1)){

        foreach($cat_children1 as $k1=>$v1)
        {
            $categories[] = $v1['guid'];
            $cat_children2 = rows("SELECT *  FROM tree WHERE parent_id = ".intval($v1['id']));

            if (count($cat_children2))
            foreach ($cat_children2 as $k2=>$v2)
            {
                $categories[] = $v2['guid'];


                $cat_children3 = rows("SELECT *  FROM tree WHERE parent_id = ".intval($v2['id']));

                if (count($cat_children3))
                    foreach ($cat_children3 as $k3=>$v3)
                    {
                        $categories[] = $v3['guid'];


                        $cat_children4 = rows("SELECT *  FROM tree WHERE parent_id = ".intval($v3['id']));

                        if (count($cat_children4))
                            foreach ($cat_children4 as $k4=>$v4)
                            {
                                $categories[] = $v4['guid'];



                            }
                    }
            }
        }



    }
    return $categories;
}

function fins_sush( $count=0, $default='ов' )
{
    if(in_array(substr($count,-2),array('11','12','13','14'))){
        return $default;
    }
    $count = substr($count,-1);
    switch ($count) {
        case "1":
            return '';
        case "2":case "3":case "4":
        return 'а';
        default:
            return $default;
    }
}


function fins( $count=0, $v1='', $v2='', $v3='')
{
    if(in_array(substr($count,-2),array('11','12','13','14'))){
        return $default;
    }
    $count = substr($count,-1);
    switch ($count) {
        case "1":
            return $v1;
        case "2":case "3":case "4":
        return $v2;
        default:
            return $v3;
    }
}


function rus_to_slug(string $text)
{

    // Пример:
    //$src = 'М-15740 Мини-открытка двойная. Тебе с любовью (Уф-лак, 4+4)';
    //echo rus_to_slug($src);
    // m_15740_mini_otkrytka_dvoynaya_tebe_s_lyubovyu_uf_lak_4_4

    // 1. Карта транслитерации
    $map = [
        'а'=>'a','б'=>'b','в'=>'v','г'=>'g','д'=>'d','е'=>'e','ё'=>'e','ж'=>'zh','з'=>'z',
        'и'=>'i','й'=>'y','к'=>'k','л'=>'l','м'=>'m','н'=>'n','о'=>'o','п'=>'p','р'=>'r',
        'с'=>'s','т'=>'t','у'=>'u','ф'=>'f','х'=>'h','ц'=>'c','ч'=>'ch','ш'=>'sh','щ'=>'sch',
        'ъ'=>'','ы'=>'y','ь'=>'','э'=>'e','ю'=>'yu','я'=>'ya',
        'А'=>'a','Б'=>'b','В'=>'v','Г'=>'g','Д'=>'d','Е'=>'e','Ё'=>'e','Ж'=>'zh','З'=>'z',
        'И'=>'i','Й'=>'y','К'=>'k','Л'=>'l','М'=>'m','Н'=>'n','О'=>'o','П'=>'p','Р'=>'r',
        'С'=>'s','Т'=>'t','У'=>'u','Ф'=>'f','Х'=>'h','Ц'=>'c','Ч'=>'ch','Ш'=>'sh','Щ'=>'sch',
        'Ъ'=>'','Ы'=>'y','Ь'=>'','Э'=>'e','Ю'=>'yu','Я'=>'ya',
        '«'=>'','»'=>'','"'=>'','\''=>'','‘'=>'','’'=>'','–'=>'-','—'=>'-',
        '№'=>'no'
    ];

    // 2. Транслитерация
    $text = strtr($text, $map);

    // 3. Заменяем всё, что не буква/цифра, на подчёркивание
    $text = preg_replace('~[^a-zA-Z0-9]+~u', '_', $text);

    // 4. Меняем дефисы на подчёркивания (под ваш формат)
    $text = str_replace('-', '_', $text);

    // 5. Убираем повторяющиеся подчёркивания и обрезаем по краям
    $text = preg_replace('~_+~', '_', $text);
    $text = trim($text, '_');

    // 6. В нижний регистр
    $text = strtolower($text);

    return $text;
}

/**
 * Получить URL изображения товара
 * Проверяет наличие товара в v_products_o_products и берет primary_image из o_products
 * Если товара нет в v_products_o_products, использует стандартный путь /import_files/{id}b.jpg
 * 
 * @param string $product_id ID товара (offer_id)
 * @return string URL изображения товара
 */
function getProductImageUrl($product_id)
{
    if (empty($product_id)) {
        return '/assets/img/product_empty.jpg';
    }
    
    $product_id_safe = noSQL($product_id);
    
    // Проверяем наличие товара в v_products_o_products
    $ozon_product = row("SELECT product_id FROM v_products_o_products WHERE offer_id = '$product_id_safe' LIMIT 1");
    
    if ($ozon_product && !empty($ozon_product['product_id'])) {
        // Товар найден в v_products_o_products, получаем primary_image из o_products
        $ozon_product_id = noSQL($ozon_product['product_id']);
        $o_product = row("SELECT primary_image FROM o_products WHERE product_id = '$ozon_product_id' AND primary_image IS NOT NULL AND primary_image != '' LIMIT 1");
        
        if ($o_product && !empty($o_product['primary_image'])) {
            // Возвращаем primary_image из o_products
            return $o_product['primary_image'];
        }
    }
    
    // Если товара нет в v_products_o_products или primary_image пустое, используем стандартный путь
    return '/import_files/' . $product_id_safe . 'b.jpg';
}



?>