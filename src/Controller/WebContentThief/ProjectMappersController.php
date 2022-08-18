<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use Vankosoft\ApplicationBundle\Component\Status;
use App\Form\ProjectMapperForm;
use App\Entity\ProjectMapper;
use App\Entity\Project;

class ProjectMappersController extends AbstractController
{
    public function createAction( Request $request ): Response
    {
        $em     = $this->getDoctrine()->getManager();
        $form   = $this->createForm( ProjectMapperForm::class );
        
        $form->handleRequest( $request );
        if ( $form->isSubmitted() ) {
            $oMapper    = $form->getData();
            
            $projectId  = $form->get( "projectId" )->getData();
            $project    = $this->getDoctrine()->getRepository( Project::class )->find( $projectId );
            $oMapper->setProject( $project );
            
            $this->addFields( $oMapper, $form );
            
            $em->persist( $oMapper );
            $em->flush();
            
            //return $this->redirectToRoute( 'vs_users_profile_show' );
        }
        
        $response   = [
            'status'    => Status::STATUS_OK
        ];
        return new JsonResponse( $response );
    }
    
    public function updateAction( $id, Request $request ): Response
    {
        $em         = $this->getDoctrine()->getManager();
        $oMapper    = $this->getDoctrine()->getRepository( ProjectMapper::class )->find( $id );
        
        $form   = $this->createForm( ProjectMapperForm::class, $oMapper, [
            'method'    => 'POST',
            'project'   => $oMapper->getProject(),
        ]);

        $form->handleRequest( $request );
        if ( $form->isSubmitted() ) {
            $oMapper    = $form->getData();
            
            $this->addFields( $oMapper, $form );
            
            $em->persist( $oMapper );
            $em->flush();
            
            return $this->redirectToRoute( 'vs_wct_project_mapper_update', ['id' => $id] );
        }
        
        return $this->render( 'Pages/Mappers/update.html.twig', [
            'errors'        => $form->getErrors( true, false ),
            'mapperForm'    => $form->createView(),
            'item'          => $oMapper,
        ]);
    }
    
    private function addFields( &$entity, &$form )
    {
        foreach ( $form['fields']->getData() as $field ) {
            if ( empty( $field->getProjectField() ) ) {
                $entity->removeField( $field ); // WORKAROUND
                continue;
            }

            $entity->addField( $field );
            $field->setMapper( $entity ); // WORKAROUND
        }
    }
}
