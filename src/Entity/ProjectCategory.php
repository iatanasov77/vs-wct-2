<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

use Sylius\Component\Resource\Model\ResourceInterface;
use Vankosoft\ApplicationBundle\Model\Interfaces\TaxonInterface;

/**
 * @ORM\Table(name="WCT_ProjectCategories")
 * @ORM\Entity
 */
class ProjectCategory implements ResourceInterface
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
     * @var TaxonInterface
     *
     * @ORM\OneToOne(targetEntity="App\Entity\Application\Taxon", cascade={"all"}, orphanRemoval=true)
     * @ORM\JoinColumn(name="taxon_id", referencedColumnName="id", nullable=false)
     */
    private $taxon;
    
    /**
     * @var ProjectCategory
     *
     * @ORM\ManyToOne(targetEntity="App\Entity\ProjectCategory", inversedBy="children", cascade={"all"})
     */
    private $parent;
    
    /**
     * @var Collection|ProjectCategory[]
     *
     * @ORM\OneToMany(targetEntity="App\Entity\ProjectCategory", mappedBy="parent")
     */
    private $children;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Project", mappedBy="category", orphanRemoval=true)
     */
    private $projects;
    
    public function __construct()
    {
        $this->children = new ArrayCollection();
        $this->projects = new ArrayCollection();
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
    
    /**
     * {@inheritdoc}
     */
    public function getParent(): ?ProjectCategory
    {
        return $this->parent;
    }
    
    /**
     * {@inheritdoc}
     */
    public function setParent( ?ProjectCategory $parent ): self
    {
        $this->parent = $parent;
        
        return $this;
    }
    
    public function getChildren() : Collection
    {
        //return $this->children;
        return $this->taxon->getChildren();
    }
    
    /**
     * @return Collection|Project[]
     */
    public function getProjects(): Collection
    {
        return $this->projects;
    }
    
    public function addProject( Project $project ): self
    {
        if ( ! $this->projects->contains( $project ) ) {
            $this->projects[] = $project;
            $project->setCategory( $this );
        }
        
        return $this;
    }
    
    public function removeProject( Project $project ): self
    {
        if ( $this->projects->contains( $project ) ) {
            $this->projects->removeElement( $project );
        }
        
        return $this;
    }
    
    /**
     * {@inheritdoc}
     */
    public function getTaxon(): ?TaxonInterface
    {
        return $this->taxon;
    }
    
    /**
     * {@inheritdoc}
     */
    public function setTaxon( ?TaxonInterface $taxon ): self
    {
        $this->taxon = $taxon;
        
        return $this;
    }
    
    public function getName()
    {
        return $this->taxon ? $this->taxon->getName() : '';
    }
    
    public function setName( string $name ): self
    {
        if ( ! $this->taxon ) {
            // Create new taxon into the controller and set the properties passed from form
            return $this;
        }
        $this->taxon->setName( $name );
        
        return $this;
    }
    
    public function __toString()
    {
        return $this->taxon ? $this->taxon->getName() : '';
    }
}
