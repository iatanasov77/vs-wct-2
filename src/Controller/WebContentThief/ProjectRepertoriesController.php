<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use App\Entity\ProjectRepertory;

class ProjectRepertoriesController extends AbstractController
{
    public function previewRepertoryAction( $id, Request $request )
    {
        $repertory  = $this->getDoctrine()->getRepository( ProjectRepertory::class )->find( $id );
        
        return $this->render( 'Pages/ProjectRepertories/preview.html.twig', [
            'repertory' => $repertory,
        ]);
    }
}