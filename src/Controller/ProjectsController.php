<?php

namespace App\Controller;

use Sylius\Bundle\ResourceBundle\Controller\ResourceController;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\HttpFoundation\Response;
use App\Entity\Project;

use App\Form\ProjectType;

use App\Component\Browser;
use Symfony\Component\DomCrawler\Crawler;
use App\Component\Url;

class ProjectsController extends ResourceController
{
    
    public function indexAction(Request $request): Response
    {
        $er = $this->getDoctrine()->getRepository('App\Entity\Project');

        $tplVars = array(
            'items' => $er->findAll(),
            'countProjects' => $er->countTotal()
        );
        return $this->render('pages/Projects/index.html.twig', $tplVars);
    }

    public function createAction(Request $request): Response
    {
        $id = Url::ProjectsUrlGetId();
        
        $er = $this->getDoctrine()->getRepository('App\Entity\Project');
        $oProject = $id ? $er->find($id) : new Project();
        
        $form = $this->createForm(ProjectType::class, $oProject, ['data' => $oProject]); 
        
        //if($form->isSubmitted()) {
        if($request->isMethod('POST') || $request->isMethod('PUT')) {
            $form->handleRequest($request);
            $em = $this->getDoctrine()->getManager();
            $em->persist($form->getData());
            $em->flush();
            
            return $this->redirect($this->generateUrl('ia_web_content_thief_projects_index'));
        }
        
        $tplVars = array(
            'form'          => $form->createView(),
            'item'          => $oProject,
            'listingFieldsDef'  => json_encode( $this->listingFieldsDefinition( $oProject ) ),
            'detailsFieldsDef'  => json_encode( $this->detailsFieldsDefinition( $oProject ) ),
        );
        return $this->render('pages/Projects/edit.html.twig', $tplVars);
    }

    public function updateAction( Request $request ) : Response
    {
        return $this->createAction( $request );
    }
    
    public function deleteProjectAction($id)
    {
        $projectId = $this->_getParam("project");
        if ($oProject = Doctrine_Core::getTable('Model_ParserProject')->findOneBy('id', $projectId)) {
            $oProject->delete();
        }
        $this->_helper->redirector('list', 'index');
    }

    public function previewProjectAction($id)
    {
        $previewFields = array();
        $projectId = $this->_getParam("projectId");

        $oParser = new SvProject_Parser();
        $allAds = $oParser->run($projectId, TRUE);

        $this->view->assign('iProjectId', $projectId);
        $this->view->assign('allAds', $allAds[$projectId]);
    }

    public function runProjectAction($id)
    {
        $projectId = $this->_getParam("project");
        $previewFields = array();

        $oParser = new SvProject_Parser();
        try {
            $oParser->run($projectId);
        } catch (DontCatchException $e) {
            echo '<pre>';
            die(var_dump($e));
        }

        $this->_helper->redirector('list', 'index');
    }

    public function copyProjectAction($id)
    {
        $projectId = $this->_getParam("project");
        $oProject = Doctrine_Core::getTable('Model_ParserProject')->findOneBy('id', $projectId);

        $oProjectCopy = new Model_ParserProject();
        $oProjectCopy->url = $oProject->url . '_(COPY)';
        $oProjectCopy->user_id = $oProject->user_id;
        $oProjectCopy->category_id = $oProject->category_id;
        $oProjectCopy->project_title = $oProject->project_title . ' (COPY)';
        $oProjectCopy->active = $oProject->active;

        $aFields = $oProject->fields->toArray();
        $i = 0;
        foreach ($aFields as $f) {
            $oProjectCopy->fields[$i]['fields_caption'] = $f['fields_caption'];
            $oProjectCopy->fields[$i]['xquery'] = $f['xquery'];

            $i++;
        }

        $commonFieldsAds = array('title', 'description', 'price', 'region', 'city', 'zip');
        $aFieldsAds = $oProject->fieldsAds->toArray();
        $i = 0;
        foreach ($aFieldsAds as $f) {
            if (in_array($f['fields_caption'], $commonFieldsAds)) {
                $oProjectCopy->fieldsAds[$i]['fields_caption'] = $f['fields_caption'];
                $oProjectCopy->fieldsAds[$i]['xquery'] = $f['xquery'];
            }
            $i++;
        }


        //echo '<pre>'; die(var_dump($oProjectCopy->fields->toArray()));
        $oProjectCopy->save();
        $this->_helper->redirector('list', 'index');
    }
    
    protected function listingFieldsDefinition( $project )
    {
        $fields = [
            [
                'title'     => 'Pager Link',
                'id_target' => 'project_pagerLink',
                'id_source' => 'project_pagerLink_source'
            ],
            [
                'title'     => 'Details Link',
                'id_target' => 'project_detailsLink',
                'id_source' => 'project_detailsLink_source'
            ],
        ];
        
        $i      = 0;
        foreach ( $project->getListingFields() as $field ) {
            $fields[]   = [
                'title'     => ucfirst( $field->getTitle() ),
                'id_target' => 'project_listingFields_' . $i . '_xquery',
                'id_source' => 'project_listingFields_' . $i . '_xquery_source'
            ];
            $i++;
        }
        
        return $fields;
    }
    
    protected function detailsFieldsDefinition( $project )
    {
        $fields = [];
        
        $i      = 0;
        foreach ( $project->getDetailsFields() as $field ) {
            $fields[]   = [
                'title'     => ucfirst( $field->getTitle() ),
                'id_target' => 'project_detailsFields_' . $i . '_xquery',
                'id_source' => 'project_detailsFields_' . $i . '_xquery_source'
            ];
            $i++;
        }
        
        return $fields;
    }
}
