<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function index()
    {
        // For Testing Only
        return $this->render( '@IAWebContentThief/Projects/index.html.twig', [
            'items' => []
        ]);
    }
}
