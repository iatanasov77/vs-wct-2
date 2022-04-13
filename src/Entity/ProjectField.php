<?php namespace App\Entity;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
<<<<<<< HEAD
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;
=======
>>>>>>> 19b2b198590823e41b1f1ae2c0617fb0b827b2f5

/**
 * WctProjectfields
 *
 * @ORM\Table(name="WCT_ProjectFields")
 * @ORM\Entity
 */
<<<<<<< HEAD
class ProjectField implements ResourceInterface
{
=======
class ProjectField
{
    
    /**
     * @ORM\ManyToOne(targetEntity="Project", inversedBy="fields")
     * @ORM\JoinColumn(name="projectId", referencedColumnName="id")
     */
    private $project;
    
>>>>>>> 19b2b198590823e41b1f1ae2c0617fb0b827b2f5
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
<<<<<<< HEAD
     * @ORM\Column(name="collection_type", type="string", columnDefinition="enum('listing', 'details')")
     */
    private $collectionType;
    
     /**
     * @ORM\Column(name="type", type="string", columnDefinition="enum('text', 'picture', 'link')")
     */
    private $type;
=======
     * @ORM\Column(name="title", type="string", length=256, nullable=false)
     */
    private $title;
>>>>>>> 19b2b198590823e41b1f1ae2c0617fb0b827b2f5
    
    /**
     * @ORM\Column(name="type", type="string", columnDefinition="enum('text', 'picture', 'link')")
     */
    private $type;

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

<<<<<<< HEAD
    public function __construct()
    {
        $this->parsedFields = new ArrayCollection();
    }
    
=======
    /**
     * @ORM\Column(name="page", type="string", columnDefinition="enum('listing', 'details')")
     */
    private $page;

>>>>>>> 19b2b198590823e41b1f1ae2c0617fb0b827b2f5
    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

<<<<<<< HEAD
    public function getCollectionType(): ?string
    {
        return $this->collectionType;
    }
    
    public function setCollectionType($collectionType): self
    {
        $this->collectionType = $collectionType;
        
        return $this;
    }

=======
>>>>>>> 19b2b198590823e41b1f1ae2c0617fb0b827b2f5
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
    
<<<<<<< HEAD
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
=======
    public function setPage($page)
    {
        $this->page = $page;
>>>>>>> 19b2b198590823e41b1f1ae2c0617fb0b827b2f5
        
        return $this;
    }
    
<<<<<<< HEAD
    public function removeParsedField( ProjectRepertoryField $parsedField ): self
    {
        if ( $this->parsedFields->contains( $parsedField ) ) {
            $this->parsedFields->removeElement( $parsedField );
            $parsedField->setProjectField( null );
        }
        
        return $this;
=======
    public function getPage()
    {
        return $this->page;
>>>>>>> 19b2b198590823e41b1f1ae2c0617fb0b827b2f5
    }
}
