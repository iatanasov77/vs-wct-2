<?php namespace App\Controller\WebContentThief;

use Symfony\Component\HttpFoundation\Request;
use Vankosoft\ApplicationBundle\Controller\AbstractCrudController;
use Vankosoft\ApplicationBundle\Controller\TaxonomyHelperTrait;

class ProjectsCategoryController extends AbstractCrudController
{
    use TaxonomyHelperTrait;
    
    protected function customData( Request $request, $entity = NULL ): array
    {
        $taxonomy   = $this->get( 'vs_application.repository.taxonomy' )->findByCode(
            $this->getParameter( 'vs_wct.project-categories.taxonomy_code' )
        );
        
        return [
            'categories'    => $this->get( 'vs_wct.repository.project_categories' )->findAll(),
            'taxonomyId'    => $taxonomy->getId(),
        ];
    }
    
    protected function prepareEntity( &$entity, &$form, Request $request )
    {
        $translatableLocale = $form['currentLocale']->getData();
        $categoryName       = $form['name']->getData();
        
        $parentCategory     = null;
        $entity->setName( $categoryName );
        
        if ( $entity->getTaxon() ) {
            $entityTaxon    = $entity->getTaxon();
            
            $entityTaxon->setCurrentLocale( $translatableLocale );
            $entityTaxon->setName( $categoryName );
            $entityTaxon->setCode( $this->createTaxonCode( $categoryName ) );
            
            if ( $parentCategory ) {
                $entityTaxon->setParent( $parentCategory->getTaxon() );
            }
        } else {
            $taxonomy   = $this->get( 'vs_application.repository.taxonomy' )->findByCode(
                $this->getParameter( 'vs_wct.project-categories.taxonomy_code' )
            );
            
            $entityTaxon    = $this->createTaxon(
                $categoryName,
                $translatableLocale,
                $parentCategory ? $parentCategory->getTaxon() : null,
                $taxonomy->getId()
            );
        }
        
        $entity->setTaxon( $entityTaxon );
        $entity->setParent( $parentCategory );
        
        $this->getDoctrine()->getManager()->persist( $entityTaxon );
    }
}
