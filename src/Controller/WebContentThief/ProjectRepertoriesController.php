<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use Vankosoft\ApplicationBundle\Component\Status;
use App\Entity\ProjectRepertory;

class ProjectRepertoriesController extends AbstractController
{
    public function previewRepertoryAction( $id, Request $request ): Response
    {
        $repertory  = $this->getDoctrine()->getRepository( ProjectRepertory::class )->find( $id );
        
        return $this->render( 'Pages/ProjectRepertories/preview.html.twig', [
            'repertory' => $repertory,
        ]);
    }
    
    /**
     * Get Repertory Items as JSON for Mappers
     * 
     * @param integer $id
     * @param Request $request
     * 
     * @return Response
     */
    public function getJsonAction( $id, Request $request ): Response
    {
        $repertory      = $this->getDoctrine()->getRepository( ProjectRepertory::class )->find( $id );
        
        $response           = [
            'status'    => Status::STATUS_OK,
            'repertory' => [],
        ];
        $i  = 0;
        foreach ( $repertory->getItems() as $item ) {
            $response['repertory'][$i]  = [
                'itemId'    => $item->getId(),
                'fields'    => [],
            ];
            foreach ( $item->getFields() as $field ) {
                $response['repertory'][$i]['fields'][]    = [
                    'projectField'  => $field->getProjectField()->getId(),
                    'content'       => $field->getContent(),
                ];
            }
            
            $i++;
        }
        
        return new JsonResponse( $response );
    }
}
