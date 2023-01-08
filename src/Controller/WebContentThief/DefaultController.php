<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\Persistence\ManagerRegistry;
use Twig\Environment;

use Vankosoft\ApplicationBundle\Component\Context\ApplicationContextInterface;

use App\Entity\UsersSubscriptions\PayedService;

class DefaultController extends AbstractController
{
    /** @var ApplicationContextInterface */
    private $applicationContext;
    
    /** @var Environment */
    private $templatingEngine;
    
    /** @var ManagerRegistry **/
    private $doctrine;
    
    public function __construct(
        ApplicationContextInterface $applicationContext,
        Environment $templatingEngine,
        ManagerRegistry $doctrine
    ) {
        $this->applicationContext   = $applicationContext;
        $this->templatingEngine     = $templatingEngine;
        $this->doctrine             = $doctrine;
    }
    
    public function index( Request $request ): Response
    {
        $paidServicesRepo   = $this->doctrine->getRepository( PayedService::class );
        $paidServices       = $paidServicesRepo->findAll();
        $paymentMethods     = [];
        
        $tplVars            = [
            'paidServices'      => $paidServices,
            'paymentMethods'    => $paymentMethods,
        ];
        return new Response( $this->templatingEngine->render( $this->getTemplate(), $tplVars ) );
    }
    
    protected function getTemplate(): string
    {
        $template   = 'web-content-thief/Pages/Dashboard/index.html.twig';
        
        $appSettings    = $this->applicationContext->getApplication()->getSettings();
        if ( ! $appSettings->isEmpty() && $appSettings[0]->getTheme() ) {
            $template   = 'Pages/Dashboard/index.html.twig';
        }
        
        return $template;
    }
}
