<?php namespace App\Controller;

use Sylius\Bundle\ResourceBundle\Controller\ResourceController;
use App\Form\FieldsetType;
use App\Form\Elements\FieldsetFieldType;
use App\Entity\Fieldset;
use App\Entity\FieldsetField;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class FieldsetsController extends ResourceController
{

    public function listAction()
    {
        $er = $this->getDoctrine()->getRepository('App\Entity\Fieldset');

        $tplVars = array(
            'items' => $er->findAll(),
        );
        return $this->render('pages/Fieldsets/index.html.twig', $tplVars);
    }

    public function createAction(Request $request) : Response
    {
        return $this->editAction($request);
    }
    
    public function updateAction(Request $request) : Response
    {
        return $this->editAction($request);
    }
    
    public function editAction(Request $request)
    {
        //$id     = \App\Component\Url::GetParameter( 'id' );
        $id     = $request->attributes->get( 'id' );
        
        $er = $this->getDoctrine()->getRepository('App\Entity\Fieldset');
        $oFieldset = $id ? $er->findOneBy(array('id' => $id)) : new Fieldset();

        //$request = $this->get('request');
        $form = $this->createForm( FieldsetType::class, $oFieldset, ['data' => $oFieldset]);
        if($request->isMethod('POST')) {
            $form->handleRequest($request);
            if($form->isValid()) {
                // Ã�â€™Ã�Â°Ã�Â»Ã�Â¸Ã�Â´Ã�Â°Ã‘â€ Ã�Â¸Ã‘ï¿½Ã‘â€šÃ�Â° Ã�Â³Ã‘Å Ã‘â‚¬Ã�Â¼Ã�Â¸
            }
            
            $em = $this->getDoctrine()->getManager();
            $em->persist($form->getData());
            $em->flush();
            
            return $this->redirect($this->generateUrl('ia_web_content_thief_fieldsets_index'));
        }
        
        $tplVars = array(
            'form' => $form->createView(),
            'item' => $oFieldset
        );
        return $this->render('pages/Fieldsets/edit.html.twig', $tplVars);
    }



    function addFieldAction()
    {
        $er = $this->getDoctrine()->getRepository('App\Entity\FieldsetField');

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
        return $this->render('pages/Fieldsets/add-field.html.twig', $tplVars);
    }

}
    