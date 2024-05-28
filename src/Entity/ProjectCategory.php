<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;
use Vankosoft\ApplicationBundle\Model\Interfaces\TaxonDescendentInterface;
use Vankosoft\ApplicationBundle\Model\Traits\TaxonDescendentEntity;
use App\Entity\UserManagement\User;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectCategories")]
class ProjectCategory implements ResourceInterface, TaxonDescendentInterface
{
    use TaxonDescendentEntity;
    
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var User */
    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: "projectCategories")]
    private $user;
    
    /** @var ProjectCategory */
    #[ORM\ManyToOne(targetEntity: ProjectCategory::class, inversedBy: "children", cascade: ["all"])]
    private $parent;
    
    /** @var Collection | ProjectCategory[] */
    #[ORM\OneToMany(targetEntity: ProjectCategory::class, mappedBy: "parent", cascade: ["persist", "remove"], orphanRemoval: true)]
    private $children;
    
    /** @var Collection | Project[] */
    #[ORM\ManyToMany(targetEntity: Project::class, mappedBy: "category", indexBy: "id")]
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
    
    public function __toString()
    {
        return $this->taxon ? $this->taxon->getName() : '';
    }
}
