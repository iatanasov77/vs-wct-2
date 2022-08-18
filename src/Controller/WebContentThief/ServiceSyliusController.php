<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use Vankosoft\ApplicationBundle\Component\Status;
use App\Component\Deployer\Sylius\Sylius;

class ServiceSyliusController extends AbstractController
{
    private $sylius;
    
    public function __construct( Sylius $sylius )
    {
        $this->sylius   = $sylius;
    }
    
    public function getCreateProductRequestBody( $repertoryId, $mapperId, Request $request ): Response
    {
        $cpRequestBody  =    $this->sylius->makeCreateProductRequestBody( [], [] );
        
        $response       = [
            'status'        => Status::STATUS_OK,
            'requestBody'   => $cpRequestBody,
        ];
        return new JsonResponse( $response );
    }
}
