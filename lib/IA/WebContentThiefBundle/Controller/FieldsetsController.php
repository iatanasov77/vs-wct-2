<?php

namespace IA\WebContentThiefBundle\Controller;

use Sylius\Bundle\ResourceBundle\Controller\ResourceController;
use IA\WebContentThiefBundle\Form\FieldsetType;
use IA\WebContentThiefBundle\Form\Elements\FieldsetFieldType;
use IA\WebContentThiefBundle\Entity\Fieldset;
use IA\WebContentThiefBundle\Entity\FieldsetField;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class FieldsetsController extends ResourceController
{

    public function listAction()
    {
        $er = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:Fieldset');

        $tplVars = array(
            'items' => $er->findAll(),
        );
        return $this->render('IAWebContentThiefBundle:Fieldsets:list.html.twig', $tplVars);
    }

    public function createAction(Request $request) : Response
    {
        return $this->editAction($request);
    }
    
    public function editAction(Request $request)
    {
        $id     = \App\Component\Url::GetParameter( 'id' );

        $er = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:Fieldset');
        $oFieldset = $id ? $er->findOneBy(array('id' => $id)) : new Fieldset();

        //$request = $this->get('request');
        $form = $this->createForm( FieldsetType::class, $oFieldset, ['data' => $oFieldset]);
        if($request->isMethod('POST')) {
            $form->handleRequest($request);
            if($form->isValid()) {
                // Валидацията гърми
            }
            
            $em = $this->getDoctrine()->getManager();
            $em->persist($form->getData());
            $em->flush();
            
            return $this->redirect($this->generateUrl('ia_web_content_thief_fieldsets_list'));
        }
        
        $tplVars = array(
            'form' => $form->createView(),
            'item' => $oFieldset
        );
        return $this->render('IAWebContentThiefBundle:Fieldsets:edit.html.twig', $tplVars);
    }



    function addFieldAction()
    {
        $er = $this->getDoctrine()->getRepository('IAWebContentThiefBundle:FieldsetField');

        $form = $this->createForm(new FieldsetFieldType(), new FieldsetField());
        $form->add('submit', 'submit', array('label' => 'Save'));

        $request = $this->get('request');
        $form->handleRequest($request);
        //if($form->isSubmitted() && $form->isValid()) {
        if($request->isMethod('POST')) {
            $formData = $form->getData();
        }

        $tplVars = array(
            'form' => $form->createView()
        );
        return $this->render('IAWebContentThiefBundle:Fieldsets:add-field.html.twig', $tplVars);
    }

}
    