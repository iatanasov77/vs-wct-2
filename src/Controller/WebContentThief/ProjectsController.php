<?php namespace App\Controller\WebContentThief;

use Symfony\Component\HttpFoundation\Request;
use Vankosoft\ApplicationBundle\Controller\AbstractCrudController;
use Vankosoft\ApplicationBundle\Controller\Traits\FilterFormTrait;

use App\Component\ProjectField as ProjectFieldHelper;
use App\Component\Collector\Collector;
use App\Form\ProjectCollectorForm;
use App\Form\ProjectDeployerForm;
use App\Form\ProjectMapperForm;
use App\Entity\ProjectMapper;
use App\Entity\ProjectCategory;

class ProjectsController extends AbstractCrudController
{
    use FilterFormTrait;
    
    protected function customData( Request $request, $entity = NULL ): array
    {
        $filterForm     = null;
        $filterCategory = null;
        
        if( $entity && $entity->getId() ) {
            $collector      = $this->get( 'vs_wct.xpath_collector' );
            
            $collector->initialize( $entity, null );
            if ( $collector->getStatus() == Collector::STATUS_SUCCESS ) {
                $detailsUrl     = $collector->getDetailsUrl();
            } else {
                $detailsUrl     = null;
            }
            
            $collectorForm  = $this->createForm( ProjectCollectorForm::class, null, [
                //'action'    => $this->generateUrl( 'wct_user_profile_show' ),
                'method'    => 'POST',
            ]);
            
            $deployerForm   = $this->createForm( ProjectDeployerForm::class, null, [
                'method'    => 'POST',
                'project'   => $entity,
            ]);
            
            $oMapper        = new ProjectMapper();
            $mapperForm     = $this->createForm( ProjectMapperForm::class, $oMapper, [
                'method'    => 'POST',
                'project'   => $entity,
            ]);
        } else {
            $detailsUrl     = null;
            $collectorForm  = null;
            $deployerForm   = null;
            $mapperForm     = null;
            
            $filterCategory = $request->attributes->get( 'filterCategory' );
            $filterForm     = $this->getFilterForm( ProjectCategory::class, $filterCategory, $request );
        }
        
        
        
        return [
            'filterForm'        => $filterForm ? $filterForm->createView() : null,
            'filterCategory'    => $filterCategory ?: null,
            
            'detailsUrl'        => $detailsUrl,
            'collectorForm'     => $collectorForm ? $collectorForm->createView() : null,
            'deployerForm'      => $deployerForm ? $deployerForm->createView() : null,
            'mapperForm'        => $mapperForm ? $mapperForm->createView() : null,
        ];
    }
    
    protected function prepareEntity( &$entity, &$form, Request $request )
    {
        //$currentUser    = $this->getUser();
        $currentUser    = $this->get( 'vs_users.security_bridge' )->getUser();
        $entity->setUser( $currentUser );
        
        foreach ( $form['listingFields']->getData() as $field ) {
            if ( empty( $field->getTitle() ) )
                continue;
            
            $field->setCollectionType( ProjectFieldHelper::COLLECTION_LISTING );
            $entity->addField( $field );
        }
        
        foreach ( $form['detailsFields']->getData() as $field ) {
            if ( empty( $field->getTitle() ) )
                continue;
            
            $field->setCollectionType( ProjectFieldHelper::COLLECTION_DETAILS );
            $entity->addField( $field );
        }
    }
    
    protected function getFilterRepository()
    {
        return $this->get( 'vs_wct.repository.project_categories' );
    }
}
