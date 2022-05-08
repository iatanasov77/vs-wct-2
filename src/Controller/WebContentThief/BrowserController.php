<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use App\Component\Browser;

class BrowserController extends AbstractController
{
    public function browseAction( Request $request )
    {
        $url = $request->query->get( 'url' );
        $browser = new Browser();
        $html = $browser->browseUrl( urldecode( $url ) );
        
        return new Response( $html );
    }
    
    public function testBrowserAction( Request $request )
    {
        return $this->render( 'Pages/Browser/test_browser.html.twig' );
    }
}
