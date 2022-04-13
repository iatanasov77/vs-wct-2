<?php namespace App\Entity;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;

/**
 * WctProjectfields
 *
 * @ORM\Table(name="WCT_ProjectFields")
 * @ORM\Entity
 */
class ProjectField implements ResourceInterface
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
     * @ORM\ManyToOne(targetEntity="Project", inversedBy="fields")
     * @ORM\JoinColumn(name="project_id", referencedColumnName="id")
     */
    private $project;
    
    /**
     * @var string
     *
     * @ORM\Column(name="collection_type", type="string", columnDefinition="enum('listing', 'details')")
     */
    private $collectionType;
    
     /**
     * @ORM\Column(name="type", type="string", columnDefinition="enum('text', 'picture', 'link')")
     */
    private $type;
    
    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=256, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="xquery", type="string", length=256, nullable=true)
     */
    private $xquery;
    
    /**
     * @var Collection|ProjectCategory[]
     *
     * @ORM\OneToMany(targetEntity="App\Entity\ProjectRepertoryField", mappedBy="projectField")
     */
    private $parsedFields;

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
}
