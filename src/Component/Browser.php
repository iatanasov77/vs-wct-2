<?php
namespace App\Component;

use Buzz\Browser as BuzzBrowser;
use Buzz\Client\FileGetContents;
use Nyholm\Psr7\Factory\Psr17Factory;

class Browser
{
    /**
     * Browse URL and return its html content
     *
     * @param string $url
     * @return string
     */
    public function browseUrl( $url )
    {
        $client = new FileGetContents(new Psr17Factory());
        $browser = new BuzzBrowser($client, new Psr17Factory());
        $response = $browser->get($url);
        
        return $response->getBody()->__toString();
    }
    
    /**
     * Browse URL and return its html content
     * 
     * @param string $url
     * @return string
     */
    function browseUrlOld($url)
    {
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        $html = curl_exec($ch);
        curl_close($ch);
        var_dump($html); die;
        if (!$html) {
            throw new \Exception(sprintf("Cannot browse this url: '%s'.", $url));
        }
        
        /*
         * Reencode html text to UTF-8
         */
        $regexCharset = "/(?:<meta[^>]*http-equiv[^>])*charset=(.*?)\"/i";
        if (preg_match($regexCharset, $html, $matches)) {
            $charset = $matches[1];
            if ($charset && ($charset != 'utf-8')) {
                $html = iconv($charset, 'UTF-8', $html);
                $html = preg_replace($regexCharset, 'charset=utf-8"', $html);
            }
        }

        return $html;
    }
}

