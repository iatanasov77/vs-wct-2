<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function index()
    {
        return $this->redirect($this->generateUrl( 'ia_web_content_thief_projects_index' ) );
    }
}
