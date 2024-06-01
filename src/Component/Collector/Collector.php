<?php namespace App\Component\Collector;

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\Filesystem\Filesystem;
use Doctrine\ORM\EntityManagerInterface;
use Vankosoft\CmsBundle\Component\Uploader\FileUploaderInterface;

use App\Component\Browser;
use App\Entity\Project;

abstract class Collector implements ContainerAwareInterface
{
    const STATUS_SUCCESS    = 0;
    const STATUS_ERROR      = 1;
    
    /** @var ContainerInterface */
    protected $container;
    
    /** @var EntityManagerInterface */
    protected $em;
    
    /** @var FileUploaderInterface */
    protected $uploader;
    
    /** @var Crawler */
    protected $crawler;
    
    /** @var SymfonyStyle | null */
    protected $output;
    
    protected $status;
    
    /** @var Project */
    protected $project;
    
    /** @var string */
    protected $currentUrl;
    
    /** @var int */
    protected $collectCountMax;
    
    /** @var array */
    protected $pageUrls;
    
    /** @var array */
    protected $pageItemUrls;
    
    /** @var array */
    protected $projectListingFields;
    
    /** @var array */
    protected $projectDetailsFields;
    
    public function __construct( ContainerInterface $container )
    {
        $this->container    = $container;
        
        $this->em           = $this->container->get( 'doctrine' )->getManager();
        $this->uploader     = $this->container->get( 'vs_wct.repertory_fields_files_uploader' );
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
    
    public function initialize( Project $project, ?SymfonyStyle $output ): self
    {
        $this->project          = $project;
        $this->collectCountMax  = 20;
        $this->output           = $output;
        
        $this->setCrawlerUrl( $this->project->getUrl() );
        if ( $this->status == self::STATUS_SUCCESS ) {
            $this->pageUrls             = $this->_getPageUrls();
            $this->pageItemUrls         = $this->_getPageItemUrls();
            
            $this->projectListingFields = [];
            foreach( $this->getProjectListingFields() as $field ) {
                $slug  = $this->getContainer()->get( 'vs_application.slug_generator' )->generate( $field->getTitle() );
                $this->projectListingFields[$slug]  = $field;
            }
            
            $this->projectDetailsFields = [];
            foreach( $this->getProjectDetailsFields() as $field ) {
                $slug  = $this->getContainer()->get( 'vs_application.slug_generator' )->generate( $field->getTitle() );
                $this->projectDetailsFields[$slug]  = $field;
            }
        }
        
        return $this;
    }
    
    public function getDetailsUrl()
    {
        if ( count( $this->pageItemUrls ) ) {
            return $this->pageItemUrls[0];
        }
        
        return null;
    }
    
    /**
     * @return ContainerInterface
     *
     * @throws \LogicException
     */
    protected function getContainer(): ContainerInterface
    {
        if ( null === $this->container ) {
            throw new \LogicException( 'The container is not yet set.' );
        }
        
        return $this->container;
    }
    
    protected function getProjectListingFields()
    {
        return $this->getContainer()->get( 'vs_wct.repository.project_fields' )->getProjectListingFields( $this->project );
    }
    
    protected function getProjectDetailsFields()
    {
        return $this->getContainer()->get( 'vs_wct.repository.project_fields' )->getProjectDetailsFields( $this->project );
    }
    
    protected function setCrawlerUrl( string $url )
    {
        if ( $this->currentUrl == $url ) {
            return;
        }
        
        try {
            $this->crawler->clear();
            $this->crawler->add( ( new Browser() )->browseUrl( $url ) );
            $this->currentUrl   = $url;
            $this->status       = self::STATUS_SUCCESS;
        } catch ( \Exception $e ) {
            $this->status       = self::STATUS_ERROR;
            
            if ( $this->output ) {
                //$this->output->writeln( '<info>Installing VankoSoft Application...</info>' );
                $this->output->writeln( '<error>VankoSoft Exception: ' . $e->getMessage() . '</error>' );
            }
        }
    }
    
    protected function debugCollectedData( $parsedListingFields, $parsedDetailsFields, $runAt )
    {
        $environement   = $this->container->getParameter( 'applicationEnvironemnt' );
        if ( $environement == 'dev' ) {
            $logToFile  = $this->container->getParameter( 'kernel.project_dir' ) . '/var/CollectorDumps/' . $runAt->getTimestamp() . '.log';
            $filesystem = new Filesystem();
            
            $filesystem->dumpFile( $logToFile, json_encode( $parsedListingFields, JSON_PRETTY_PRINT ) );
            $filesystem->appendToFile( $logToFile, json_encode( $parsedDetailsFields, JSON_PRETTY_PRINT ) );
        }
    }
    
    abstract public function runCollector( string $collectionType ): void;
    
    abstract protected function _getPageUrls(): array;
    
    abstract protected function _getPageItemUrls(): array;
}
