<?php namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class TestTemplateController extends Controller
{
    public function tabs()
    {
        return $this->render( 'pages/tabs.html.twig' );
    }
}
