<?php namespace App\Component\Collector;

use Symfony\Component\DomCrawler\Crawler;
use App\Component\ProjectField as ProjectFieldHelper;

final class XPathCollector extends Collector
{
    /**
     * FOR DEBUGING PURPOSES
     * 
     * @param string $xquery
     */
    public function getDomNode( $xquery )
    {
        return $this->crawler->filterXPath( $xquery );
    }
    
    public function runCollector( string $collectionType ): void
    {
        $runAt      = new \DateTime();
        $repertory  = $this->getContainer()->get( 'vs_wct.factory.project_repertories' )->createNew();
        $repertory->setProject( $this->project );
        $repertory->setCode( $runAt->getTimestamp() );
        $repertory->setCollectionType( $collectionType );
        $repertory->setCreatedAt( $runAt );
        //$this->em->persist( $repertory );
        
        $parsedListingFields    = $this->parseListingFields();
        $parsedDetailsFields    = $this->parseDetailsFields();
        
        /** Log Collected Data AND Exit */
        //$this->debugCollectedData( $parsedListingFields, $parsedDetailsFields );
        
        if ( count( $parsedListingFields ) ) {
            foreach( $parsedListingFields as $index => $parsedItem ) {
                $repertoryItem  = $this->getContainer()->get( 'vs_wct.factory.project_repertory_items' )->createNew();
                foreach( $parsedItem as $fieldSlug => $fieldContent ) {
                    $repertoryField = $this->getContainer()->get( 'vs_wct.factory.project_repertory_fields' )->createNew();
                    $projectField   = $this->projectListingFields[$fieldSlug];
                    
                    $repertoryField->setProjectField( $projectField );
                    $repertoryField->setContent( $fieldContent );
                    
                    if ( $projectField->getType() == ProjectFieldHelper::TYPE_PICTURE ) {
                        $this->uploader->createRepertoryFieldFile( $repertoryField, $fieldContent );
                    }
                    
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
                    $repertoryField = $this->getContainer()->get( 'vs_wct.factory.project_repertory_fields' )->createNew();
                    $projectField   = $this->projectDetailsFields[$fieldSlug];
                    
                    $repertoryField->setProjectField( $projectField );
                    $repertoryField->setContent( $fieldContent );
                    
                    if ( $projectField->getType() == ProjectFieldHelper::TYPE_PICTURE ) {
                        $this->uploader->createRepertoryFieldFile( $repertoryField, $fieldContent );
                    }
                    
                    $repertoryItem->addField( $repertoryField );
                }
                
                $repertory->addItem( $repertoryItem );
            }
        }
        
        if ( $repertory->getItems()->count() ) {
            $this->em->persist( $repertory );
            $this->em->flush();
        }
    }
    
    protected function _getPageUrls(): array
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
    
    protected function _getPageItemUrls(): array
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
                $xquery     = $field->getXquery();
                if ( ! $xquery ) {
                    continue;
                }
                $domField   = $this->crawler->filterXPath( $xquery );
                
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
                    $xquery     = $field->getXquery();
                    if ( ! $xquery ) {
                        continue;
                    }
                    $domField   = $this->crawler->filterXPath( $xquery );
                    
                    $itemsCount = $domField->count();
                    if( $itemsCount ) {
                        if( $field->getType() == ProjectFieldHelper::TYPE_TEXT ) {
                            $parsedFields[$itemsKey][$fieldSlug] = $domField->text();
                        } elseif( $field->getType() == ProjectFieldHelper::TYPE_LINK ) {
                            $parsedFields[$itemsKey][$fieldSlug] = $domField->attr( 'href' );
                        } elseif( $field->getType() == ProjectFieldHelper::TYPE_PICTURE ) {
                            $parsedFields[$itemsKey][$fieldSlug] = $domField->attr( 'src' );
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
}
