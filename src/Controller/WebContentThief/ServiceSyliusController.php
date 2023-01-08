<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Doctrine\Persistence\ManagerRegistry;

use Vankosoft\ApplicationBundle\Component\Status;
use App\Component\Deployer\Sylius\Sylius;
use App\Entity\ProjectMapper;
use App\Entity\ProjectRepertory;

class ServiceSyliusController extends AbstractController
{
    /** @var ManagerRegistry **/
    private $doctrine;
    
    private $sylius;
    
    public function __construct(
        ManagerRegistry $doctrine,
        Sylius $sylius
    ) {
        $this->doctrine = $doctrine;
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
        $mapper         = $this->doctrine->getRepository( ProjectMapper::class )->find( $mapperId );
        $repertory      = $this->doctrine->getRepository( ProjectRepertory::class )->find( $repertoryId );
        
        $cpRequestBody  =    $this->sylius->makeRequestBody( 'create_product', $mapper, $repertory );
        
        $response       = [
            'status'        => Status::STATUS_OK,
            'requestBody'   => $cpRequestBody,
        ];
        return new JsonResponse( $response );
    }
}
