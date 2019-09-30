<?php namespace IA\WebContentThiefBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController as Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

use IA\WebContentThiefBundle\Entity\ProjectListingField;
use IA\WebContentThiefBundle\Entity\ProjectDetailsField;

class ProjectsJsonController extends Controller
{
    const TYPE_LISTING_FIELD    = 'listing';
    const TYPE_DETAILS_FIELD    = 'details';
    
    public function addFieldsAction( Request $request )
    {
        $projectId = $request->request->get( 'projectId' );
        $fieldsetId = $request->request->get( 'fieldsetId' );
        $type       = $request->request->get( 'type' );
        
        if ( $type != self::TYPE_LISTING_FIELD && $type != self::TYPE_DETAILS_FIELD ) {
            return new JsonResponse([
                'status'    => 'ERROR!',
                'messge'    => 'WCT2: Invalid Field Type'
            ]);
        }
        
        $fr = $this->getDoctrine()->getRepository('IA\WebContentThiefBundle\Entity\Fieldset');
        $oFieldset = $fieldsetId ? $fr->findOneBy(array('id' => $fieldsetId)) : null;
        if(!$oFieldset) {
            throw new \Exception('Fieldset with id:'.$fieldsetId.' not found!');
        }
        
        $pr = $this->getDoctrine()->getRepository('IA\WebContentThiefBundle\Entity\Project');
        $oProject = $projectId ? $pr->findOneBy(array('id' => $projectId)) : null;
        if(!$oProject) {
            throw new \Exception('Project not found!');
        }
        
        switch ( $type ) {
            case self::TYPE_LISTING_FIELD:
                $this->addListingFields( $oProject, $oFieldset );
                break;
            case self::TYPE_DETAILS_FIELD:
                $this->addDetailsFields( $oProject, $oFieldset );
                break;
        }
        
        return new JsonResponse([
            'status'  => 'Success!'
        ]);
    }
    
    protected function addListingFields( $oProject, $oFieldset )
    {
        foreach($oFieldset->getFields() as $field) {
            $projectField = new ProjectListingField();
            $projectField->setTitle($field->getTitle());
            $projectField->setType($field->getType());
            $projectField->setXquery('');
            $oProject->addListingField($projectField);
        }
        
        $em = $this->getDoctrine()->getManager();
        $em->persist($oProject);
        $em->flush();
    }
    
    protected function addDetailsFields( $oProject, $oFieldset )
    {
        foreach($oFieldset->getFields() as $field) {
            $projectField = new ProjectDetailsField();
            $projectField->setTitle($field->getTitle());
            $projectField->setType($field->getType());
            $projectField->setXquery('');
            $oProject->addDetailsField($projectField);
        }
        
        $em = $this->getDoctrine()->getManager();
        $em->persist($oProject);
        $em->flush();
    }
}