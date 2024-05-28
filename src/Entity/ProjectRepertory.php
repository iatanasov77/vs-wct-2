<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Sylius\Component\Resource\Model\ResourceInterface;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectRepertories")]
class ProjectRepertory implements ResourceInterface
{
    use TimestampableEntity;
    
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var Project */
    #[ORM\ManyToOne(targetEntity: Project::class, inversedBy: "fields")]
    #[ORM\JoinColumn(name: "project_id", referencedColumnName: "id")]
    private $project;
    
    /** @var string */
    #[ORM\Column(name: "code", type: "string", length: 128, nullable: false, unique: true)]
    private $code;
    
    /** @var Collection | ProjectRepertoryItem[] */
    #[ORM\OneToMany(targetEntity: ProjectRepertoryItem::class, mappedBy: "repertory", indexBy: "id", cascade: ["persist", "remove"], orphanRemoval: true)]
    private $items;
    
    public function __construct()
    {
        $this->items    = new ArrayCollection();
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
    
    public function getCode()
    {
        return $this->code;
    }
    
    public function setCode( $code ): self
    {
        $this->code = $code;
        
        return $this;
    }
    
    public function getItems(): Collection
    {
        return $this->items;
    }
    
    public function addItem( ProjectRepertoryItem $item )
    {
        if( ! $this->items->contains( $item ) ) {
            $item->setRepertory( $this );
            $this->items->add( $item );
        }
        
        return $this;
    }
    
    public function removeItem( ProjectRepertoryItem $item )
    {
        if( $this->items->contains( $item ) ) {
            $this->items->removeElement( $item );
        }
        
        return $this;
    }
}
