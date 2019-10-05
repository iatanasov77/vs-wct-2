<?php
namespace IA\WebContentThiefBundle\Component;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\DomCrawler\Crawler;

use IA\WebContentThiefBundle\Entity\Project;
use IA\WebContentThiefBundle\Entity\ParsedItem;
use IA\WebContentThiefBundle\Entity\FieldType;

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
        $itemUrls = $this->_getItemUrls();
        $count = 0;
        foreach($itemUrls as $url) {
            $count++;
            
            $this->_createCrawler($url);
            $parsedFields = array();
            foreach($this->project->getDetailsFields() as $field)
            {
                $parsedField = $crawler->filterXPath($field->getXquery());
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
            $this->_saveLocaly($parsedFields, $url);
            $this->em->flush();
            
            //$this->_parse( $parsedFields );
                
            if($count == $this->project->getParseCountMax())
                break;
        }
    }
    
    
    protected function _saveLocaly($parsedFields, $url)
    {
        // Create New ParsedItem Entity and init with project and session values
        $parsedItem = new ParsedItem();
        $parsedItem->setProject($this->project);
        $parsedItem->setRunSession($this->_generateSessionId());

        // Assign current item values
        $parsedItem->setItemUrl($url);
        $parsedItem->setFields(serialize($parsedFields));
        $this->em->persist($parsedItem);
    }
    
    protected function _getItemUrls()
    {
        // /html/body/main/div[3]/div/div/div/div[3]/ul/li[1]/a
        //$testCrawler = $this->crawler->filterXPath("html/body/main/div[3]/div/div/div/div/ul/li")->text();
//         $testCrawler = $this->crawler->filter("ul.paging li a.active")->text();
//         var_dump($testCrawler);  die;
        
        /*
         * Fetch Pages Urls
         */
        if ( $this->project->getParseMode() == 'xpath' ) {
            $pageUrls = $this->crawler->filterXPath($this->project->getPagerLink())->each(function (Crawler $node, $i) {
                return $node->attr('href');
            });
        } elseif( $this->project->getParseMode() == 'css' ) {
            $pageUrls = $this->crawler->filter($this->project->getPagerLink())->each(function (Crawler $node, $i) {
                return $node->attr('href');
            });
        } else {
            throw new \Exception( 'Unknown Parse Mode' );
        }
        
        $itemUrls = $this->_getPageItemUrls();
        if(count($itemUrls) >= $this->project->getParseCountMax())
            return $itemUrls;
      
        foreach($pageUrls as $pUrl) {
            $this->_createCrawler($pUrl);
            
            $itemUrls = array_unique(array_merge($itemUrls, $this->_getPageItemUrls()));
            if(count($itemUrls) >= $this->project->getParseCountMax())
                break;
        }

        return $itemUrls;
    }
    
    protected function _getPageItemUrls()
    {
        /*
         * Fetch Item Urls ( ... and Listing Page Fields may be ... )
         */
        $itemUrls = $this->crawler->filterXPath($this->project->getDetailsLink())->each(function (Crawler $node, $i) {
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
        return md5(uniqid(rand(), true));
    }
    
    protected function _parse( $parsedFields )
    {
        foreach($this->project->getProcessors() as $processor) {
            $prClass    = $processor->getClass();
            $pr         = new $prClass;
            $pr->process( $parsedFields );
        }
    }
}

