<?php namespace App\Component\Collector;

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\Console\Style\SymfonyStyle;

use App\Component\Browser;
use App\Entity\Project;
use App\Component\ProjectField as ProjectFieldHelper;

class CssCollector extends Collector implements ContainerAwareInterface
{
    private $container;
    
    private $em;
    
    private $crawler;
    
    private $output;
    
    private $status;
    
    private $project;
    
    private $currentUrl;
    
    private $collectCountMax;
    
    private $pageUrls;
    
    private $pageItemUrls;
    
    private $projectListingFields;
    
    private $projectDetailsFields;
    
    public function __construct( ContainerInterface $container )
    {
        $this->container    = $container;
        $this->em           = $this->container->get( 'doctrine' )->getManager();
        $this->crawler      = new Crawler();
    }
    
    /**
     * {@inheritdoc}
     */
    public function setContainer( ContainerInterface $container = null )
    {
        $this->container    = $container;
    }
    
    public function getStatus()
    {
        return $this->status;
    }
}
