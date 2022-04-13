<?php namespace App\Component;

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
        $client     = new FileGetContents( new Psr17Factory() );
        $browser    = new BuzzBrowser( $client, new Psr17Factory() );
        $response   = $browser->get( $url );
        $urlContent = $response->getBody()->__toString();
        
        $this->_fixAssetUrls( $url, $urlContent );
        
        return $urlContent;
    }
    
    private function _fixAssetUrls( $url, &$urlContent )
    {
        $urlInfo    = \parse_url( $url );
        $baseUrl    = $urlInfo['scheme'] . '://' . $urlInfo['host'] . '/';
        
        $search = ['src="//'];
        $replace = ['SRC_NOT_REPLACE'];
        $urlContent = str_replace( $search, $replace, $urlContent );
        
        $search = [
            'href="/',
            'src="/',
            //'<link rel="preload" href="/'
        ];
        $replace = [
            'href="' . $baseUrl,
            'src="'. $baseUrl,
            //'<link rel="preload" href="' . $baseUrl
        ];
        $urlContent = str_replace( $search, $replace, $urlContent );
        
        $search = ['SRC_NOT_REPLACE'];
        $replace = ['src="//'];
        $urlContent = str_replace( $search, $replace, $urlContent );
    }
}

