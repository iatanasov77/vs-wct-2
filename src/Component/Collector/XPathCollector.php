<?php namespace App\Component\Collector;

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\Console\Style\SymfonyStyle;

use App\Component\Browser;
use App\Entity\Project;
use App\Component\ProjectField as ProjectFieldHelper;

class XPathCollector extends Collector implements ContainerAwareInterface
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
    
    /**
     * FOR DEBUGING PURPOSES
     * 
     * @param string $xquery
     */
    public function getDomNode( $xquery )
    {
        return $this->crawler->filterXPath( $xquery );
    }
    
    public function getDetailsUrl()
    {
        if ( count( $this->pageItemUrls ) ) {
            return $this->pageItemUrls[0];
        }
         
        return null;
    }
    
    public function runCollector()
    {
        $runAt      = new \DateTime();
        $repertory  = $this->getContainer()->get( 'vs_wct.factory.project_repertories' )->createNew();
        $repertory->setProject( $this->project );
        $repertory->setCode( $runAt->getTimestamp() );
        $repertory->setCreatedAt( $runAt );
        $this->em->persist( $repertory );
        
        $parsedListingFields    = $this->parseListingFields();
        $parsedDetailsFields    = $this->parseDetailsFields();
        
        /** Log Collected Data AND Exit */
        //$this->debugCollectedData( $parsedListingFields, $parsedDetailsFields );
        
        if ( count( $parsedListingFields ) ) {
            foreach( $parsedListingFields as $index => $parsedItem ) {
                $repertoryItem  = $this->getContainer()->get( 'vs_wct.factory.project_repertory_items' )->createNew();
                foreach( $parsedItem as $fieldSlug => $fieldContent ) {
                    $repertoryField  = $this->getContainer()->get( 'vs_wct.factory.project_repertory_fields' )->createNew();
                    $repertoryField->setProjectField( $this->projectListingFields[$fieldSlug] );
                    $repertoryField->setContent( $fieldContent );
                    
                    $repertoryItem->addField( $repertoryField );
                }
                if ( isset( $parsedDetailsFields[$index] ) ) {
                    foreach( $parsedDetailsFields[$index] as $fieldSlug => $fieldContent ) {
                        $repertoryField  = $this->getContainer()->get( 'vs_wct.factory.project_repertory_fields' )->createNew();
                        $repertoryField->setProjectField( $this->projectDetailsFields[$fieldSlug] );
                        $repertoryField->setContent( $fieldContent );
                        
                        $repertoryItem->addField( $repertoryField );
                    }
                }
                
                $repertory->addItem( $repertoryItem );
            }
        } else {
            foreach( $parsedDetailsFields as $index => $parsedItem ) {
                $repertoryItem  = $this->getContainer()->get( 'vs_wct.factory.project_repertory_items' )->createNew();
                foreach( $parsedItem as $fieldSlug => $fieldContent ) {
                    $repertoryField  = $this->getContainer()->get( 'vs_wct.factory.project_repertory_fields' )->createNew();
                    $repertoryField->setProjectField( $this->projectDetailsFields[$fieldSlug] );
                    $repertoryField->setContent( $fieldContent );
                    
                    $repertoryItem->addField( $repertoryField );
                }
                
                $repertory->addItem( $repertoryItem );
            }
        }
        
        $this->em->persist( $repertory );
        $this->em->flush();
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
    
    private function getProjectListingFields()
    {
        return $this->getContainer()->get( 'vs_wct.repository.project_fields' )->getProjectListingFields( $this->project );
    }
    
    private function getProjectDetailsFields()
    {
        return $this->getContainer()->get( 'vs_wct.repository.project_fields' )->getProjectDetailsFields( $this->project );
    }
    
    private function setCrawlerUrl( string $url )
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
    
    private function parseListingFields(): array
    {
        if ( ! in_array( $this->project->getUrl(), $this->pageUrls ) ) {
            array_unshift( $this->pageUrls, $this->project->getUrl() );
        }
        
        $itemsKey       = 0;
        $parsedFields   = [];
        foreach ( $this->pageUrls as $url ) {
            if( empty( $url ) ) continue;
            
            $this->setCrawlerUrl( $url );
            foreach( $this->projectListingFields as $fieldSlug => $field ) {
                $domField = $this->crawler->filterXPath( $field->getXquery() );
                
                $itemsCount = $domField->count();
                if( $itemsCount ) {
                    if( $field->getType() == ProjectFieldHelper::TYPE_TEXT ) {
                        $domField->each( function ( Crawler $node, $i ) use ( &$parsedFields, $itemsKey, $fieldSlug )
                        {
                            $parsedFields[$itemsKey + $i][$fieldSlug] = $node->text();
                        });
                        
                    } elseif( $field->getType() == ProjectFieldHelper::TYPE_LINK ) {
                        $domField->each( function ( Crawler $node, $i ) use ( &$parsedFields, $itemsKey, $fieldSlug )
                        {
                            $parsedFields[$itemsKey + $i][$fieldSlug] = $node->attr( 'href' );
                        });
                    } elseif( $field->getType() == ProjectFieldHelper::TYPE_PICTURE ) {
                        $domField->each( function ( Crawler $node, $i ) use ( &$parsedFields, $itemsKey, $fieldSlug )
                        {
                            $parsedFields[$itemsKey + $i][$fieldSlug] = $node->attr( 'src' );
                        });
                        //@TODO download picture
                    }
                }
            }
            
            $itemsKey   += $itemsCount;
            if ( $itemsKey > $this->collectCountMax ) break;
        }
        
        return $parsedFields;
    }
    
    private function parseDetailsFields(): array
    {
        if ( ! in_array( $this->project->getUrl(), $this->pageUrls ) ) {
            array_unshift( $this->pageUrls, $this->project->getUrl() );
        }
        
        $itemsKey       = 0;
        $parsedFields   = [];
        foreach( $this->pageUrls as $url ) {
            if( empty( $url ) ) continue;
            
            $this->setCrawlerUrl( $url );
            foreach( $this->_getPageItemUrls() as $itemUrl ) {
                $this->setCrawlerUrl( $itemUrl );
                foreach( $this->projectDetailsFields as $fieldSlug => $field ) {
                    $domField   = $this->crawler->filterXPath( $field->getXquery() );
                    
                    $itemsCount = $domField->count();
                    if( $itemsCount ) {
                        if( $field->getType() == ProjectFieldHelper::TYPE_TEXT ) {
                            $parsedFields[$itemsKey][$fieldSlug] = $domField->text();
                        } elseif( $field->getType() == ProjectFieldHelper::TYPE_LINK ) {
                            $parsedFields[$itemsKey][$fieldSlug] = $domField->attr( 'href' );
                        } elseif( $field->getType() == ProjectFieldHelper::TYPE_PICTURE ) {
                            $parsedFields[$itemsKey][$fieldSlug] = $domField->attr( 'src' );
                            //@TODO download picture
                        }
                    }
                }
                
                $itemsKey++;
                if ( $itemsKey > $this->collectCountMax ) break;
            }
            
            if ( $itemsKey > $this->collectCountMax ) break;
        }
        
        return $parsedFields;
    }
    
    private function _getPageUrls()
    {
        $pageUrls  = [];
        if ( $this->project && $this->project->getPagerLink() ) {
            $domPageUrls    = $this->crawler->filterXPath( $this->project->getPagerLink() );
            $domPageUrls->each( function ( Crawler $node, $i ) use ( &$pageUrls )
            {
                $pageUrls[] = $node->attr( 'href' );
            });
        }
        
        return $pageUrls;
    }
    
    private function _getPageItemUrls()
    {
        $itemUrls   = [];
        if ( $this->project && $this->project->getDetailsLink() ) {
            $domItemUrls    = $this->crawler->filterXPath( $this->project->getDetailsLink() );
            $domItemUrls->each( function ( Crawler $node, $i ) use ( &$itemUrls )
            {
                $itemUrls[] = $node->attr( 'href' );
            });
        }
        
        return $itemUrls;
    }
    
    private function debugCollectedData( $parsedListingFields, $parsedDetailsFields )
    {
        $logToFile  = $this->container->getParameter( 'kernel.project_dir' ) . '/var/CollectorDumps/' . $runAt->getTimestamp() . '.log';
        $this->container->get( 'filesystem' )->dumpFile( $logToFile, json_encode( $parsedListingFields, JSON_PRETTY_PRINT ) );
        $this->container->get( 'filesystem' )->appendToFile( $logToFile, json_encode( $parsedDetailsFields, JSON_PRETTY_PRINT ) );
        die;
    }
}
