<?php
namespace IA\WebContentThiefBundle\Component\MapProcessor\Processor;

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;
use KkuetNet\PrestashopWebServiceBundle\Services\PrestashopWebService;
use IA\WebContentThiefBundle\Component\MapProcessor\AbstractMapProcessor;
use IA\WebContentThiefBundle\Component\MapProcessor\Exception;

/**
 *  $siteUrl = 'http://babymarket.lh/';
 *  $homeKey = 'RICF0KCOG6XI185TWHY9JGN6O2T1OUZV';
 *  $officeKey = 'XQE24IFDS5H6YQ3ZWTTYCEWZ3GDKGT6E';
 */
class Prestashop15 extends AbstractMapProcessor implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    /**
     * @var PrestaShopWebservice Instance
     */
    private $_ps;
    
    
    protected function ps()
    {        
        if(!$this->_ps) {
            $options = $this->getOptions();
            if(!isset($options->baseUrl) || !isset($options->apiKey)) {
                //$options->baseUrl   = 'http://wct2.lh';
                //$options->apiKey    = 'API_KEY';
                
                //throw new Exception('"baseUrl" and "apiKey" options not exists!');
            }
        
            $psws = new PrestashopWebService($this->container);
            $debug = false;
            $this->_ps = $psws->personalInstance($options->baseUrl, $options->apiKey, $debug);
        }
        
        return $this->_ps;
    }
    
    
    public function __construct($container = null)
    {
        $this->container = $container;
    }
    
    public function getSchema()
    {
        $options = $this->getOptions();
        $xml = $this->ps()->get(array('url' => $options->baseUrl.'/api/products?schema=synopsis'));
        $schema = (array)$xml->children()->children();
        $schemaKeys = is_array($schema) ? array_keys($schema) : array();
        
        return array_combine($schemaKeys, $schemaKeys);
    }
    
    public function process($parsedFields)
    {
        
        $opt = array('resource' => 'products');
        $xml = $this->ps()->get(array('url' => $this->getOptions()->baseUrl.'/api/products?schema=synopsis'));
        $resources = $xml->children()->children();

        foreach($this->projectProcessorOptions->getMappings() as $mapping) {
            if(isset($resources->{$mapping->getMapProcessorField()}) && isset($parsedFields[$mapping->getProjectFieldAlias()])) {
                $resources->{$mapping->getMapProcessorField()} = $parsedFields[$mapping->getProjectFieldAlias()];
            }
        }

        $opt = array('resource' => 'products');
        $opt['postXml'] = $xml->asXML();
        $xml = $this->ps()->add($opt);
    }
    
}
