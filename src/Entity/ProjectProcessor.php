<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;
use Sylius\Component\Resource\Model\ToggleableTrait;

/**
 * ProjectProcessor
 *
 * @ORM\Table(name="WCT_ProjectProcessors")
 * @ORM\Entity
 */
class ProjectProcessor implements ResourceInterface
{
    use ToggleableTrait;
    
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
     * @ORM\Column(name="service", type="string", length=255, nullable=false)
     */
    private $service;
    
    /**
     * @var Collection|ProjectMapper[]
     *
     * @ORM\OneToMany(targetEntity="App\Entity\ProjectMapper", mappedBy="processor")
     */
    private $mappers;
    
    public function __construct()
    {
        $this->mappers  = new ArrayCollection();
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
    
    public function getService()
    {
        return $this->service;
    }
    
    public function setService( string $service )
    {
        $this->service  = $service;
        
        return $this;
    }
    
    /**
     * @return Collection|ProjectMapper[]
     */
    public function getMappers(): Collection
    {
        return $this->mappers;
    }
    
    public function addMapper( ProjectMapper $mapper ): self
    {
        if ( ! $this->mappers->contains( $mapper ) ) {
            $this->mappers[] = $mapper;
            $mapper->setProcessor( $this );
        }
        
        return $this;
    }
    
    public function removeMapper( ProjectMapper $mapper ): self
    {
        if ( $this->mappers->contains( $mapper ) ) {
            $this->mappers->removeElement( $mapper );
        }
        
        return $this;
    }
}
