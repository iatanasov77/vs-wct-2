<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectMappers")]
class ProjectMapper implements ResourceInterface
{
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var Project */
    #[ORM\ManyToOne(targetEntity: Project::class, inversedBy: "mappers")]
    #[ORM\JoinColumn(name: "project_id", referencedColumnName: "id")]
    private $project;
    
    /** @var string */
    #[ORM\Column(name: "title", type: "string", length: 128, nullable: false)]
    private $title;
    
    /** @var string */
    #[ORM\Column(name: "deployer", type: "string", columnDefinition: "ENUM('sylius', 'magento', 'prestashop')")]
    private $deployer;
    
    /** @var Collection | ProjectMapperField[] */
    #[ORM\OneToMany(targetEntity: ProjectMapperField::class, mappedBy: "mapper", indexBy: "id", cascade: ["persist", "remove"], orphanRemoval: true)]
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
    
    public function getTitle(): ?string
    {
        return $this->title;
    }
    
    public function setTitle(?string $title): self
    {
        $this->title = $title;
        
        return $this;
    }
    
    public function getDeployer(): ?string
    {
        return $this->deployer;
    }
    
    public function setDeployer(?string $deployer): self
    {
        $this->deployer = $deployer;
        
        return $this;
    }
    
    public function getFields(): Collection
    {
        return $this->fields;
    }
    
    public function addField( ProjectMapperField $field )
    {
        if( ! $this->fields->contains( $field ) ) {
            //die( 'EHO' );
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
