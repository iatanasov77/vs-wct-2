<?php

namespace IA\WebContentThiefBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use IAWebContentThiefBundle\Entity\Project;

use IAWebContentThiefBundle\Form\ProjectType;

use IAWebContentThiefBundle\Utils\RemoteContent;

class ConnectionsController extends Controller
{

    public function listAction()
    {
        $er = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:Project');


        $tplVars = array(
            'items' => $er->findAll(),
            'countProjects' => $er->countTotal()
        );
        return $this->render('IAWebContentThiefBundle:Projects:list.html.twig', $tplVars);
    }

    public function editAction($id) 
    {
        
    }
    
}
