<?php

/**
 * Description of encode
 *
 * @author alexnas
 */

class EncodeClass {

    protected $key = "0eb62a80dd08987b3b32f2552add9296e27217144004e43b81ef514e";
    //protected $key = "";
    protected $algoritm = "MCRYPT_BLOWFISH_COMPAT";
    protected $mode = MCRYPT_MODE_ECB;
    protected $algoritms = [
        "MCRYPT_BLOWFISH" => ["name" => MCRYPT_BLOWFISH, "show" => "BLOWFISH", "delta" => 4],
        "MCRYPT_BLOWFISH_COMPAT" => ["name" => MCRYPT_BLOWFISH_COMPAT, "show" => "BLOWFISH_COMPAT", "delta" => 4],
        "MCRYPT_RC2" => ["name" => MCRYPT_RC2, "show" => "RC2", "delta" => 4],
        "MCRYPT_GOST" => ["name" => MCRYPT_GOST, "show" => "GOST", "delta" => 4],
        "MCRYPT_SERPENT" => ["name" => MCRYPT_SERPENT, "show" => "SERPENT", "delta" => 8],
        "MCRYPT_TWOFISH" => ["name" => MCRYPT_TWOFISH, "show" => "TWOFISH", "delta" => 8],
        "MCRYPT_LOKI97" => ["name" => MCRYPT_LOKI97, "show" => "LOKI97", "delta" => 8],
        "MCRYPT_SAFERPLUS" => ["name" => MCRYPT_SAFERPLUS, "show" => "SAFERPLUS", "delta" => 8],
        "MCRYPT_CAST_256" => ["name" => MCRYPT_CAST_256, "show" => "CAST_256", "delta" => 8],
        "MCRYPT_RIJNDAEL_128" => ["name" => MCRYPT_RIJNDAEL_128, "show" => "RIJNDAEL_128", "delta" => 8],
        "MCRYPT_RIJNDAEL_192" => ["name" => MCRYPT_RIJNDAEL_192, "show" => "RIJNDAEL_192", "delta" => 8],
        "MCRYPT_RIJNDAEL_256" => ["name" => MCRYPT_RIJNDAEL_256, "show" => "RIJNDAEL_256", "delta" => 12],
    ];

    public function encode($string) {
        
        if(!$this->key) {
            return $string;
        }

        $key_size = mcrypt_get_key_size($this->algoritms[$this->algoritm]["name"], $this->mode);

        if ($this->mode === MCRYPT_MODE_CBC) {

            $iv_size = mcrypt_get_iv_size($this->algoritms[$this->algoritm]["name"], $this->mode);

            $iv = mcrypt_create_iv($iv_size, MCRYPT_DEV_URANDOM);

            $encoded = base64_encode(mcrypt_encrypt($this->algoritms[$this->algoritm]["name"], $this->key, $string, $this->mode, $iv)) . base64_encode($iv);
        } elseif ($this->mode === MCRYPT_MODE_ECB) {

            $encoded = base64_encode(mcrypt_encrypt($this->algoritms[$this->algoritm]["name"], $this->key, $string, $this->mode));
        }

        return $encoded;
    }

    public function decode($string) {
        
        if(!$this->key) {
            return $string;
        }

        if ($this->mode === MCRYPT_MODE_CBC) {

            $iv_size = mcrypt_get_iv_size($this->algoritms[$this->algoritm]["name"], $this->mode) + $this->algoritms[$this->algoritm]["delta"];

            $string_len = strlen($string);

            $new_string_len = $string_len - $iv_size;

            $new_string = base64_decode(substr($string, 0, $new_string_len));

            $iv = base64_decode(substr($string, -$iv_size));

            $decoded = mcrypt_decrypt($this->algoritms[$this->algoritm]["name"], $this->key, $new_string, $this->mode, $iv);
        } elseif ($this->mode === MCRYPT_MODE_ECB) {

            $decoded = mcrypt_decrypt($this->algoritms[$this->algoritm]["name"], $this->key, base64_decode($string), $this->mode);
        }
        
        return $decoded;
    }

}
