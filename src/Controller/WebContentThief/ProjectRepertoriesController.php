<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

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
        
        $repertoryItems    = [];
        foreach ( $repertory->getItems() as $item ) {
            $repertoryItems[$item->getId()]  = [];
            foreach ( $item->getFields() as $field ) {
                $repertoryItems[$item->getId()][]   = '';
            }
        }
        
        return new JsonResponse( $repertoryItems );
    }
}
