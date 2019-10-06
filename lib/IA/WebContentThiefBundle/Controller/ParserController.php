<?php

namespace IA\WebContentThiefBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use IA\WebContentThiefBundle\Entity\Project;
use IA\WebContentThiefBundle\Component\Parser;

class ParserController extends Controller
{
    public function runProjectAction($projectId)
    {
        $er = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:Project');
        $oProject = $er->findOneBy(array('id' => $projectId));
        if(!$oProject) {
            throw new \Exception("Invalid Request!");
        }
        
        $parser = new Parser($oProject, $this->getDoctrine()->getManager());
        $runSession = $parser->parse();
 
        return new Response();
    }
    
    public function runProcessorAction($processorId)
    {
        $er = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:ProjectProcessor');
        $oProcessor = $er->findOneBy(array('id' => $processorId));
        if(!$oProcessor) {
            throw new \Exception("Invalid Request!");
        }
        
        $parser = new Parser($oProject, $this->getDoctrine()->getManager());
        $runSession = $parser->parse();
        
        return new Response();
    }
    
    public function showSessionAction($runSession)
    {
        $pir = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:ParsedItem');
        $parserItems = $pir->findBy(array('runSession' => $runSession));
        
        var_dump($parserItems); die;
        
        return new Response();
    }
}
