<?php
namespace App\Component;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\DomCrawler\Crawler;

use App\Entity\Project;
use App\Entity\ParsedItem;
use App\Entity\FieldType;

class Parser
{
    protected $crawler;
    
    protected $project;
    
    protected $em;
    
    public function __construct(Project $project, EntityManagerInterface $em)
    {
        $this->em = $em;
        $this->project = $project;
        $this->_createCrawler($this->project->getUrl());
    }
    
    public function parse($processor = null)
    {  
        $this->parseListingPages($processor);
        //$this->parseDetailsPages($processor);
    }
    
    public function parseListingPages($processor = null)
    {
        $pages  = $this->_getPagesUrls();
        if ( ! in_array( $this->project->getUrl(), $pages ) ) {
            array_unshift( $pages, $this->project->getUrl() );
        }
  
        $page = 0;
        $parsedFields = [];
        foreach ( $pages as $url ) {
            $page++;
            $this->_createCrawler( $url );
        
            foreach($this->project->getListingFields() as $field)
            {
                $parsedField = $this->crawler->filterXPath($field->getXquery());
                
                if($parsedField->count()) {
                    if($field->getType()->getId() == FieldType::Text) {
                        $parsedField->each( function ( Crawler $node, $i ) use ( &$parsedFields, $page, $field )
                        {
                            $parsedFields[$page][$i][$field->getSlug()] = $node->text();
                        });

                    } elseif($field->getType()->getId() == FieldType::Link) {
                        $parsedField->each( function ( Crawler $node, $i ) use ( &$parsedFields, $page, $field )
                        {
                            $parsedFields[$page][$i][$field->getSlug()] = $node->attr('href');
                        });
                    } elseif($field->getType()->getId() == FieldType::Picture) {
                        $parsedField->each( function ( Crawler $node, $i ) use ( &$parsedFields, $page, $field )
                        {
                            $parsedFields[$page][$i][$field->getSlug()] = $node->attr('src');
                        });
                        //@TODO download picture
                    }
                }
            }
            
            
            if( count( $parsedFields ) >= $this->project->getParseCountMax() )
                break;
        }

        if ( ! empty( $parsedFields ) ) {
            $this->_saveLocaly( $parsedFields, $url );
            $this->em->flush();
            $this->_parse( $parsedFields );
        }
    }
    
    public function parseDetailsPages($processor = null)
    {   
        $itemUrls = $this->_getItemUrls();
        $count = 0; var_dump($itemUrls); die;
        foreach($itemUrls as $url) {
            $count++;
            
            $this->_createCrawler( $url );
            $parsedFields = [];
            echo count( $this->project->getListingFields() ) . "<br>";
            
            foreach($this->project->getDetailsFields() as $field)
            {
                //var_dump($field);
                $parsedField = $this->crawler->filterXPath($field->getXquery());
                //$parsedField = $crawler->filterXPath('//*[@id="product_addtocart_form"]/div[3]/div[@class="price-box"]/div/span[2]/span[2]');
                if($parsedField->count()) {
                    //echo $parsedField->text() . ' - ROW<br>';
                    
                    if($field->getType()->getId() === FieldType::Text) {
                        $parsedFields[$field->getSlug()] = $parsedField->text();
                    } elseif($field->getType()->getId() === FieldType::Link) {
                        $parsedFields[$field->getSlug()] = $parsedField->attr('href');
                    } elseif($field->getType()->getId() === FieldType::Picture) {
                        $parsedFields[$field->getSlug()] = $parsedField->attr('src');
                        //@TODO download picture
                    }
                }
            }
            
            if ( ! empty( $parsedFields ) ) {
                //$this->_saveLocaly($parsedFields, $url);
                //$this->em->flush();
                //$this->_parse( $parsedFields );
            }
                
            // if($count == $this->project->getParseCountMax()) break;
        }
    }
    
    
    protected function _saveLocaly($parsedFields, $url)
    {
        //var_dump( $parsedFields );
        // Create New ParsedItem Entity and init with project and session values
        $parsedItem = new ParsedItem();
        $parsedItem->setProject($this->project);
        $parsedItem->setRunSession($this->_generateSessionId());

        // Assign current item values
        $parsedItem->setItemUrl($url);
        $parsedItem->setFields(serialize($parsedFields));
        $this->em->persist($parsedItem);
    }
    
    protected function _getPagesUrls()
    {
        /*
         * Fetch Pages Urls
         */
        if ( $this->project->getParseMode() == 'xpath' ) {
            $urls = $this->crawler->filterXPath($this->project->getPagerLink())->each(function (Crawler $node, $i) {
                //return $node->links();
                $children = $node->getNode(0)->childNodes;
                foreach ( $children as $child ) {
                    if ( $child->nodeName == 'a' ) {
                        return $child->getAttribute ( 'href' );
                    }
                }
            });
        } elseif( $this->project->getParseMode() == 'css' ) {
            $urls = $this->crawler->filter($this->project->getPagerLink())->each(function (Crawler $node, $i) {
                return $node->attr('href');
            });
        } else {
            throw new \Exception( 'Unknown Parse Mode' );
        }
        
        return array_unique( array_filter( $urls ) );
    }
    
    protected function _getItemUrls()
    {
        $pageUrls   = $this->_getPagesUrls();
        
        $itemUrls   = $this->_getPageItemUrls();
        if( count( $itemUrls ) >= $this->project->getParseCountMax() )
            return $itemUrls;
      
        foreach( $pageUrls as $pUrl ) {
            $this->_createCrawler( $pUrl );
            
            $itemUrls   = array_unique( array_merge( $itemUrls, $this->_getPageItemUrls() ) );
            if( count( $itemUrls ) >= $this->project->getParseCountMax() )
                break;
        }

        return $itemUrls;
    }
    
    protected function _getPageItemUrls()
    {
        /*
         * Fetch Item Urls ( ... and Listing Page Fields may be ... )
         */
        $itemUrls   = $this->crawler->filterXPath($this->project->getDetailsLink())->each( function ( Crawler $node, $i )
        {
            return $node->attr('href');
        });
      
        return $itemUrls;
    }
    
    protected function _createCrawler($url)
    {
        $browser        = new Browser();
        $html           = $browser->browseUrl($url);
        
        $crawler        = new Crawler($html);
        $this->crawler  = $crawler;
    }
    
    protected function _generateSessionId()
    {
        return md5( uniqid( rand(), true ) );
    }
    
    protected function _parse( $parsedFields )
    {
        foreach( $this->project->getProcessors() as $processor ) {
            $prClass    = $processor->getClass();
            $pr         = new $prClass;
            $pr->process( $parsedFields );
        }
    }
}

