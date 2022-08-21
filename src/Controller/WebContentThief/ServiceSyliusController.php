<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use Vankosoft\ApplicationBundle\Component\Status;
use App\Component\Deployer\Sylius\Sylius;
use App\Entity\ProjectMapper;
use App\Entity\ProjectRepertory;

class ServiceSyliusController extends AbstractController
{
    private $sylius;
    
    public function __construct(
        Sylius $sylius
    ) {
        $this->sylius   = $sylius;
    }
    
    public function getSchemaEasyuiCombotree( Request $request ): Response
    {
        return new JsonResponse( $this->sylius->easyuiComboTreeData() );
    }
    
    /*
     * Test: http://wct.lh/service/sylius/get-create-product-request-body/2/1
     */ 
    public function getCreateProductRequestBody( $repertoryId, $mapperId, Request $request ): Response
    {
        $mapper         = $this->getDoctrine()->getRepository( ProjectMapper::class )->find( $mapperId );
        $repertory      = $this->getDoctrine()->getRepository( ProjectRepertory::class )->find( $repertoryId );
        
        $cpRequestBody  =    $this->sylius->makeRequestBody( 'create_product', $mapper, $repertory );
        
        $response       = [
            'status'        => Status::STATUS_OK,
            'requestBody'   => $cpRequestBody,
        ];
        return new JsonResponse( $response );
    }
}
