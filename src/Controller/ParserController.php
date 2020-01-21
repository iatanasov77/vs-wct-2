<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\Project;
use App\Component\Parser;

class ParserController extends Controller
{
    public function runProjectAction($projectId)
    {
        $er = $this->getDoctrine()->getRepository( 'App\Entity\Project' );
        
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
        $er = $this->getDoctrine()->getRepository('App\Entity\ProjectProcessor');
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
        $pir = $this->getDoctrine()->getRepository('App\Entity\ParsedItem');
        $parserItems = $pir->findBy(array('runSession' => $runSession));
        
        var_dump($parserItems); die;
        
        return new Response();
    }
}
