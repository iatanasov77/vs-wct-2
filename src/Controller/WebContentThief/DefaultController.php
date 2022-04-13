<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Twig\Environment;

use Vankosoft\ApplicationBundle\Component\Context\ApplicationContextInterface;

use App\Entity\UsersSubscriptions\PayedService;

class DefaultController extends AbstractController
{
    /** @var ApplicationContextInterface */
    private $applicationContext;
    
    /** @var Environment */
    private $templatingEngine;
    
    public function __construct(
        ApplicationContextInterface $applicationContext,
        Environment $templatingEngine
    ) {
        $this->applicationContext   = $applicationContext;
        $this->templatingEngine     = $templatingEngine;
    }
    
    public function index( Request $request ): Response
    {
        $paidServicesRepo   = $this->getDoctrine()->getRepository( PayedService::class );
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
        $template   = 'web-content-thief/pages/Dashboard/index.html.twig';
        
        $appSettings    = $this->applicationContext->getApplication()->getSettings();
        if ( ! $appSettings->isEmpty() && $appSettings[0]->getTheme() ) {
            $template   = 'pages/Dashboard/index.html.twig';
        }
        
        return $template;
    }
}
