<?php

namespace IA\WebContentThiefBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use IAWebContentThiefBundle\Entity\ProjectProcessor;
use IAWebContentThiefBundle\Entity\ProjectProcessorMapping;
use IAWebContentThiefBundle\Form\ProjectProcessorType;
use IAWebContentThiefBundle\Form\ProjectProcessorMappingType;

class ProjectProcessorsController extends Controller
{

    public function createAction(Request $request)
    {
        $processor = new ProjectProcessor();
        $form = $this->createForm(new ProjectProcessorType($this->container), $processor);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($processor);
            $em->flush();
            return new Response('SUCCESS!!!');
        }

        $tplVars = array('form' => $form->createView());
        return $this->render('IAWebContentThiefBundle:ProjectProcessors:create.html.twig', $tplVars);
    }
    
    public function deleteAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $processor = $em->getRepository('IAWebContentThiefBundle:ProjectProcessor')->find($id);
        if (!$processor) {
            throw $this->createNotFoundException(
                'No processor found for id '.$id
            );
        }
        $em->remove($processor);
        $em->flush();
        
        return new Response('SUCCESS!!!');
    }

    public function getOptionsFormAction(Request $request)
    {
        $processorService = $request->query->get('class');
        if(empty($processorService)) {
            return new Response('');
        }
        if(!$this->container->has($processorService)) {
            throw new IAWebContentThiefBundle\Component\MapProcessor\Exception('Map Processor Service is not defined!');
        }
        $processor = $this->container->get($processorService);
        $form = $this->createForm($processor->getForm());

        $tplVars = array(
            'form' => $form->createView()
        );
        return $this->render('IAWebContentThiefBundle:ProjectProcessors:options-form.html.twig', $tplVars);
    }
    
    public function getMappingFormAction(Request $request)
    {
        $processorId = $request->query->get('processorId');
        if($processorId) {
            $projectProcessorOptions = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:ProjectProcessor')->find($processorId);
        }
        if(!$projectProcessorOptions) {
            return new Response('');
        }
        
        /*
         * Create Processor
         */
        $processorService = $projectProcessorOptions->getClass();
        if(!$this->container->has($processorService)) {
            throw new IAWebContentThiefBundle\Component\MapProcessor\Exception('Map Processor Service is not defined!');
        }
        $processor = $this->container->get($processorService);
        $processor->setProcessorOptions($projectProcessorOptions);
        
        /*
         * Create Form
         */
        $form = $this->createForm(new ProjectProcessorMappingType($processor), $projectProcessorOptions);

        $pairProcessors = $this->container->getParameter('ia_web_content_thief.map_processors');
        $processorType = $pairProcessors[$processor->getService()];
        $tplVars = array(
            'form' => $form->createView(),
            'processor' => $processor,
            'processorType' => $processorType
        );
        return $this->render('IAWebContentThiefBundle:ProjectProcessors:mappings-form.html.twig', $tplVars);
    }
    
    public function saveMappingsAction(Request $request, $id)
    {
        if(!$request->isMethod('POST')) {
            throw new \Exception("Invalid Request!!!");
        }
        
        $em = $this->getDoctrine()->getManager();
        $processor = $em->getRepository('IAWebContentThiefBundle:ProjectProcessor')->find($id);
        
        $post = $request->request->get('processor_5');
        foreach($post['mappings'] as $mapData) {
            $mapping = new ProjectProcessorMapping();
            $mapping->setProjectFieldAlias($mapData['projectFieldAlias']);
            $mapping->setMapProcessorField($mapData['mapProcessorField']);
            
            $processor->addMapping($mapping);
        }

        $em->persist($processor);
        $em->flush();
        
        return new Response('SUCCESS!!!');
    }

}
