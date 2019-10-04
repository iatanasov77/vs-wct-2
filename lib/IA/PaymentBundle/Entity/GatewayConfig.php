<?php
namespace IA\PaymentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Payum\Core\Model\GatewayConfig as BaseGatewayConfig;

/**
 * @ORM\Table(name="IAP_GatewayConfig")
 * @ORM\Entity
 */
class GatewayConfig extends BaseGatewayConfig
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     *
     * @var integer $id
     */
    protected $id;
    
    /**
     * @var bool
     * 
     *  @ORM\Column(name="useSandbox", type="boolean", nullable=false)
     */
    protected $useSandbox;
    
    /**
     * @var array
     * 
     * @ORM\Column(name="sandboxConfig", type="array", nullable=false)
     */
    protected $sandboxConfig;
    
    /**
     * 
     * Предефинирам оригиналната функция , за да може когато се извиква за билдване на Gateway да връща конфига според флага useSandbox,
     * а когато се извиква от формата за редакция да не взима предвид този флаг
     * 
     * @param type $builder
     * @return type
     */
    public function getConfig($builder = true) 
    {
        if(!$builder)
            return parent::getConfig();
        
        return $this->useSandbox ? $this->sandboxConfig : $this->config;
    }
    
    
    public function __construct()
    {
        parent::__construct();
        $this->useSandbox = false;
        $this->sandboxConfig = array();
    }
    
    function getUseSandbox()
    {
        return $this->useSandbox;
    }

    function getSandboxConfig()
    {
        return $this->sandboxConfig;
    }

    function setUseSandbox($useSandbox)
    {
        $this->useSandbox = $useSandbox;
        return $this;
    }

    function setSandboxConfig($sandboxConfig)
    {
        $this->sandboxConfig = $sandboxConfig;
        return $this;
    }

}
