<?php
namespace App\Component;

class Utils
{

    /**
     * Generates an API Key
     */
    public static function generateApiKey()
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $apikey = '';
        for($i = 0; $i < 64; $i++) {
            $apikey .= $characters[rand(0, strlen($characters) - 1)];
        }
        
        return base64_encode(sha1(uniqid('ue' . rand(rand(), rand())) . $apikey));
    }

}
