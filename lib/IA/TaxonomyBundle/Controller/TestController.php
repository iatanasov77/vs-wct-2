<?php

namespace IA\TaxonomyBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

class TestController extends Controller
{
 
    public function setParentAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $r = $this->getDoctrine()->getRepository('IATaxonomyBundle:Term');
        
//        $r->recover();
//        $em->flush();
        
        //$response = $r->verify();
        //$response = $r->getNodesHierarchy();
        $response = $r->buildTreeArray($r->getNodesHierarchy());
        var_dump($response);
        return new Response('');
        
        $parent = $r->find(3);
        $child = $r->find(5);
        
        $child->setParent($parent);

        $em->persist($parent);
        $em->persist($child);
        $em->flush();
        
        return new Response('SUCCESS!!!');
    }
    
   
}
