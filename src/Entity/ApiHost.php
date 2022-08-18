<?php namespace App\Entity;

use Sylius\Component\Resource\Model\ResourceInterface;
use Doctrine\ORM\Mapping as ORM;

/**
 * WctProjectfields
 *
 * @ORM\Table(name="WCT_ApiHosts")
 * @ORM\Entity
 */
class ApiHost implements ResourceInterface
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;
    
    /**
     * @var string
     *
     * @ORM\Column(name="base_url", type="string", length=256, nullable=false)
     */
    private $baseUrl;
    
    /**
     * @var array
     * 
     * @ORM\Column(type="json")
     */
    private $credentials;
    
    public function __construct()
    {
        $this->credentials  = [];
    }
    
    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
    
    public function getBaseUrl(): ?string
    {
        return $this->baseUrl;
    }
    
    public function setBaseUrl($baseUrl): self
    {
        $this->baseUrl = $baseUrl;
        
        return $this;
    }
    
    public function getCredentials(): ?array
    {
        return $this->credentials;
    }
    
    public function setCredentials($credentials): self
    {
        $this->credentials = $credentials;
        
        return $this;
    }
}
