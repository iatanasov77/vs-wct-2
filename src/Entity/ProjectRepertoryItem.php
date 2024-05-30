<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectRepertoryItems")]
class ProjectRepertoryItem implements ResourceInterface
{
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var ProjectRepertory */
    #[ORM\ManyToOne(targetEntity: ProjectRepertory::class, inversedBy: "items")]
    #[ORM\JoinColumn(name: "project_repertory_id", referencedColumnName: "id")]
    private $repertory;
    
    /** @var Collection | ProjectRepertoryField[] */
    #[ORM\OneToMany(targetEntity: ProjectRepertoryField::class, mappedBy: "item", indexBy: "id", cascade: ["persist", "remove"], orphanRemoval: true)]
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
    
    public function getRepertory()
    {
        return $this->repertory;
    }
    
    public function setRepertory(ProjectRepertory $repertory): self
    {
        $this->repertory = $repertory;
        
        return $this;
    }
    
    public function getFields(): Collection
    {
        return $this->fields;
    }
    
    public function addField( ProjectRepertoryField $field )
    {
        if( ! $this->fields->contains( $field ) ) {
            $field->setItem( $this );
            $this->fields->add( $field );
        }
        
        return $this;
    }
    
    public function removeField( ProjectRepertoryField $field )
    {
        if( $this->fields->contains( $field ) ) {
            $this->fields->removeElement( $field );
        }
        
        return $this;
    }
}