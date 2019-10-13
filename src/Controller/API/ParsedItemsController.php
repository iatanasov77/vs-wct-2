<?php

namespace App\Controller\API;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use JMS\Serializer\SerializerBuilder;

class ParsedItemsController extends Controller
{
    public function getItemsAction($projectId)
    {
        $pir = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:ParsedItem');
        $lastSession = $pir->lastSession($projectId);
        $parserItems = $pir->findBy(array('project' => $projectId, 'runSession' => $lastSession));
        
        // Serialize and return response
        $serializer = SerializerBuilder::create()->build();
        $response = $serializer->serialize($parserItems, 'json');
     
        return new Response($response);
    }
}

