<?php namespace App\Controller\WebContentThief;

use Symfony\Component\HttpFoundation\Request;
use Vankosoft\ApplicationBundle\Controller\AbstractCrudController;

use App\Component\ProjectField as ProjectFieldHelper;
use App\Component\Collector\Collector;
use App\Form\ProjectCollectorForm;

class ProjectsController extends AbstractCrudController
{
    protected function customData( Request $request, $entity = NULL ): array
    {
        if( $entity && $entity->getId() && $entity->getDetailsLink() ) {
            $collector      = $this->get( 'vs_wct.collector' );
            
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
        } else {
            $detailsUrl     = null;
            $collectorForm  = null;
        }
        
        return [
            'categories'    => $this->get( 'vs_wct.repository.project_categories' )->findAll(),
            'detailsUrl'    => $detailsUrl,
            'collectorForm' => $collectorForm ? $collectorForm->createView() : null,
        ];
    }
    
    protected function prepareEntity( &$entity, &$form, Request $request )
    {
        $entity->setUser( $this->getUser() );
        
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
}
