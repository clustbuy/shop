<?php

// use DateTime;

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
    const TIMEOUT_SEC = 5;
}
/* 
require '../../../vendor/autoload.php';


$inn     = '7721581040';
$token   = "3ab30f043510035177906a0ffdee464036ee48ab";
$dadata  = new DadataClient($token, null);
$result  = $dadata->findById("party", $inn, 1);

echo json_encode($result);
 */