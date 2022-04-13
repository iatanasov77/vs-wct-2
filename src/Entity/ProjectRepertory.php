<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;

/**
 * WctProjectRepertories
 *
 * @ORM\Table(name="WCT_ProjectRepertories")
 * @ORM\Entity
 */
class ProjectRepertory implements ResourceInterface
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
     * @ORM\Column(name="code", type="string", length=128, nullable=false, unique=true)
     */
    private $code;
    
    /**
     * @var \DateTimeInterface
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=false)
     */
    private $createdAt;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ProjectRepertoryItem", mappedBy="repertory", cascade={"persist"})
     */
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
    
    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }
    
    public function setCreatedAt( ?\DateTimeInterface $createdAt ): void
    {
        $this->createdAt = $createdAt;
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
