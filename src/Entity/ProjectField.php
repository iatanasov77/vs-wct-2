<?php namespace App\Entity;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectFields")]
class ProjectField implements ResourceInterface
{
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var Project */
    #[ORM\ManyToOne(targetEntity: Project::class, inversedBy: "fields")]
    #[ORM\JoinColumn(name: "project_id", referencedColumnName: "id")]
    private $project;
    
    /** @var string */
    #[ORM\Column(name: "collection_type", type: "string", columnDefinition: "ENUM('listing', 'details')")]
    private $collectionType;
    
    /** @var string */
    #[ORM\Column(name: "type", type: "string", columnDefinition: "ENUM('text', 'picture', 'link')")]
    private $type;
    
    /** @var string */
    #[ORM\Column(name: "title", type: "string", length: 255, nullable: false)]
    private $title;
    
    /** @var string */
    #[ORM\Column(name: "xquery", type: "string", length: 255, nullable: true)]
    private $xquery;
    
    /** @var Collection | ProjectRepertoryField[] */
    #[ORM\OneToMany(targetEntity: ProjectRepertoryField::class, mappedBy: "projectField", indexBy: "id", cascade: ["persist", "remove"], orphanRemoval: true)]
    private $parsedFields;
    
    /** @var string */
    #[ORM\Column(type: "string", length: 255, unique: true)]
    #[Gedmo\Slug(fields: ["title", "id"])]
    private $slug;
    
    public function __construct()
    {
        $this->parsedFields = new ArrayCollection();
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
    
    public function getCollectionType(): ?string
    {
        return $this->collectionType;
    }
    
    public function setCollectionType($collectionType): self
    {
        $this->collectionType = $collectionType;
        
        return $this;
    }
    
    /**
     * Set title
     *
     * @param string $title
     * @return WctProjectfields
     */
    public function setTitle($title): self
    {
        $this->title = $title;
        
        return $this;
    }
    
    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }
    
    /**
     * Set xquery
     *
     * @param string $xquery
     * @return WctProjectfields
     */
    public function setXquery($xquery): self
    {
        $this->xquery = $xquery;
        
        return $this;
    }
    
    /**
     * Get xquery
     *
     * @return string
     */
    public function getXquery()
    {
        return $this->xquery;
    }
    
    /**
     * Set project
     *
     * @param Project $project
     * @return ProjectField
     */
    public function setProject(Project $project): self
    {
        $this->project = $project;
        
        return $this;
    }
    
    /**
     * Get project
     *
     * @return Project
     */
    public function getProject()
    {
        return $this->project;
    }
    
    /**
     * Set type
     *
     * @return ProjectField
     */
    public function setType($type)
    {
        $this->type = $type;
        
        return $this;
    }
    
    /**
     * Get type
     */
    public function getType()
    {
        return $this->type;
    }
    
    /**
     * @return Collection|ProjectRepertoryField[]
     */
    public function getParsedFields(): Collection
    {
        return $this->parsedFields;
    }
    
    public function addParsedField( ProjectRepertoryField $parsedField ): self
    {
        if ( ! $this->parsedFields->contains( $parsedField ) ) {
            $this->parsedFields[] = $parsedField;
            $parsedField->setProjectField( $this );
        }
        
        return $this;
    }
    
    public function removeParsedField( ProjectRepertoryField $parsedField ): self
    {
        if ( $this->parsedFields->contains( $parsedField ) ) {
            $this->parsedFields->removeElement( $parsedField );
            $parsedField->setProjectField( null );
        }
        
        return $this;
    }
    
    public function getSlug(): ?string
    {
        return $this->slug;
    }
    
    public function setSlug($slug): self
    {
        $this->slug = $slug;
        
        return $this;
    }
}
