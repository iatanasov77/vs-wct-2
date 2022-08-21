<?php namespace App\Component\Deployer;

use Vankosoft\ApplicationBundle\Component\SlugGenerator;

use App\Entity\ProjectMapper;
use App\Entity\ProjectRepertory;

abstract class AbstractDeployer
{
    /** @var SlugGenerator */
    protected $slugGenerator;
    
    public function __construct(
        SlugGenerator $slugGenerator
    ) {
        $this->slugGenerator            = $slugGenerator;
    }
    
    abstract public function getSchema(): array;
    
    abstract public function makeRequestBody( $endPointKey, $mapper, $repertory ): array;
    
    public function easyuiComboTreeData() : array
    {
        $data   = [];
        $this->buildEasyuiCombotreeData( $this->getSchema(), $data );
        
        return $data;
    }
    
    protected function getMapperFields( ProjectMapper $mapper ): array
    {
        $mapperFields   = [];
        foreach ( $mapper->getFields() as $field ) {
            $mapperFields[$field->getMapField()]  = $field->getProjectField()->getSlug();
        }
        
        return $mapperFields;
    }
    
    protected function getRepertoryItems( ProjectRepertory $repertory ): array
    {
        $repertoryItems = [];
        $i  = 0;
        foreach ( $repertory->getItems() as $item ) {
            $repertoryItems[$i]  = [
                'itemId'    => $item->getId(),
                'fields'    => [],
            ];
            foreach ( $item->getFields() as $field ) {
                $repertoryItems[$i]['fields'][$field->getProjectField()->getSlug()]    = $field->getContent();
            }
            
            $i++;
        }
        
        return $repertoryItems;
    }
    
    protected function buildEasyuiCombotreeData( $tree, &$data )
    {
        if ( is_array( $tree ) ) {
            $index    = 0;
            foreach( $tree as $key => $node ) {
                $data[$index]   = [
                    'id'        => $key,
                    'text'      => $key,
                    'children'  => [],
                    //'disabled'  => ! $isLeaf
                ];
                
                $this->buildEasyuiCombotreeData( $node, $data[$index]['children'] );
                $index++;
            }
        }
    }
}
