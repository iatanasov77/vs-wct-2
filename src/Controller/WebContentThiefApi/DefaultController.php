<?php namespace App\Controller\WebContentThiefApi;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Twig\Environment;
use Doctrine\Persistence\ManagerRegistry;
use Sylius\Component\Resource\Repository\RepositoryInterface;

use Vankosoft\ApplicationBundle\Component\Context\ApplicationContextInterface;

class DefaultController extends AbstractController
{
    use GlobalFormsTrait;

    /** @var ApplicationContextInterface */
    private $applicationContext;
    
    /** @var Environment */
    private $templatingEngine;

    /** @var ManagerRegistry **/
    private $doctrine;
    
    /** @var RepositoryInterface */
    private $categoryRepository;
    
    /** @var RepositoryInterface */
    private $productRepository;
	
	/** @var int */
    private $latestProductsLimit;
    
    public function __construct(
        ApplicationContextInterface $applicationContext,
        Environment $templatingEngine,
        ManagerRegistry $doctrine,
        RepositoryInterface $categoryRepository,
        RepositoryInterface $productRepository,
        int $latestProductsLimit = 6
    ) {
        $this->applicationContext   = $applicationContext;
        $this->templatingEngine     = $templatingEngine;

        $this->doctrine             = $doctrine;
        $this->categoryRepository   = $categoryRepository;
        $this->productRepository    = $productRepository;
		
		$this->latestProductsLimit  = $latestProductsLimit;
    }
    
    public function index( Request $request ): Response
    {
		$featuredProducts   = $this->productRepository->getFeaturedProducts();
        $latestProducts     = $this->productRepository->findBy( [], ['updatedAt' => 'DESC'], $this->latestProductsLimit );
		
        return new Response( $this->templatingEngine->render( $this->getTemplate(), [
            'shoppingCart'      => $this->getShoppingCart( $request ),
            'categories'        => $this->categoryRepository->findAll(),
            'featuredProducts'  => $featuredProducts,
            'latestProducts'    => $latestProducts,
        ] ) );
    }
    
    protected function getTemplate(): string
    {
        $template   = 'web-content-thief-api/Pages/Dashboard/index.html.twig';
        
        $appSettings    = $this->applicationContext->getApplication()->getSettings();
        if ( ! $appSettings->isEmpty() && $appSettings[0]->getTheme() ) {
            $template   = 'Pages/Dashboard/index.html.twig';
        }
        
        return $template;
    }
}
