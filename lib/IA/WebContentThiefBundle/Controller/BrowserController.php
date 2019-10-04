<?php

namespace IA\WebContentThiefBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use IA\WebContentThiefBundle\Component\Browser;
use Symfony\Component\HttpFoundation\Request;

class BrowserController extends Controller
{
    public function browseAction(Request $request)
    {
        $url = $request->query->get('url');
        $browser = new Browser();
        $html = $browser->browseUrl(urldecode($url));
        
        return new Response($html);
    }
}
