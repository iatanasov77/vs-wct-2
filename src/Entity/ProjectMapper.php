<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;

/**
 * ProjectMapper
 *
 * @ORM\Table(name="WCT_ProjectMappers")
 * @ORM\Entity
 */
class ProjectMapper implements ResourceInterface
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
     * @ORM\ManyToOne(targetEntity="Project", inversedBy="mappers")
     * @ORM\JoinColumn(name="project_id", referencedColumnName="id")
     */
    private $project;
    
    /**
     * @ORM\ManyToOne(targetEntity="ProjectProcessor", inversedBy="mappers")
     * @ORM\JoinColumn(name="processor_id", referencedColumnName="id")
     */
    private $processor;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ProjectMapperField", mappedBy="projectMapper", orphanRemoval=true)
     */
    private $fields;
    
    public function __construct()
    {
        $this->fields   = new ArrayCollection();
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
    
    public function getProject(): ?Project
    {
        return $this->project;
    }
    
    public function setProject(?Project $project): self
    {
        $this->project = $project;
        
        return $this;
    }
    
    public function getProcessor(): ?ProjectProcessor
    {
        return $this->processor;
    }
    
    public function setProcessor(?ProjectProcessor $processor): self
    {
        $this->processor = $processor;
        
        return $this;
    }
    
    public function getFields(): Collection
    {
        return $this->fields;
    }
    
    public function addField( ProjectMapperField $field )
    {
        if( ! $this->fields->contains( $field ) ) {
            $field->setMapper( $this );
            $this->fields->add( $field );
        }
        
        return $this;
    }
    
    public function removeField( ProjectMapperField $field )
    {
        if( $this->fields->contains( $field ) ) {
            $this->fields->removeElement( $field );
        }
        
        return $this;
    }
}
