<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use Vankosoft\ApplicationBundle\Component\Status;
use App\Entity\ApiHost;

class ApiHostsExtController extends AbstractController
{
    public function getJsonAction( $id, Request $request ): Response
    {
        $apiHost            = $this->getDoctrine()->getRepository( ApiHost::class )->find( $id );
        $response           = [
            'status'    => Status::STATUS_OK,
            'apiHost'    => [
                'baseUrl'       => $apiHost->getBaseUrl(),
                'credentials'   => $apiHost->getCredentials(),
            ]
        ];
        
        return new JsonResponse( $response );
    }
}
