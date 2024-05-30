<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Sylius\Component\Resource\Model\ResourceInterface;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectRepertoryFields")]
class ProjectRepertoryField implements ResourceInterface
{
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var ProjectRepertoryItem */
    #[ORM\ManyToOne(targetEntity: ProjectRepertoryItem::class, inversedBy: "fields")]
    #[ORM\JoinColumn(name: "project_repertory_item_id", referencedColumnName: "id")]
    private $item;
    
    /** @var ProjectField */
    #[ORM\ManyToOne(targetEntity: ProjectField::class, inversedBy: "parsedFields")]
    #[ORM\JoinColumn(name: "project_field_id", referencedColumnName: "id")]
    private $projectField;
    
    /** @var string */
    #[ORM\Column(name: "content", type: "text")]
    private $content;
    
    /** @var ProjectRepertoryFieldFile */
    #[ORM\OneToOne(targetEntity: ProjectRepertoryFieldFile::class, mappedBy: "owner", cascade: ["persist", "remove"], orphanRemoval: true)]
    private $repertoryFieldFile;
    
    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
    
    public function getItem()
    {
        return $this->item;
    }
    
    public function setItem(ProjectRepertoryItem $item): self
    {
        $this->item = $item;
        
        return $this;
    }
    
    /**
     * Get projectField
     *
     * @return ProjectField
     */
    public function getProjectField()
    {
        return $this->projectField;
    }
    
    /**
     * Set project
     *
     * @param ProjectField $projectField
     * @return ProjectRepertoryField
     */
    public function setProjectField(ProjectField $projectField): self
    {
        $this->projectField = $projectField;
        
        return $this;
    }
    
    public function getContent()
    {
        return $this->content;
    }
    
    public function setContent(string $content): self
    {
        $this->content  = $content;
        
        return $this;
    }
    
    public function getRepertoryFieldFile()
    {
        return $this->repertoryFieldFile;
    }
    
    public function setRepertoryFieldFile($repertoryFieldFile)
    {
        $this->repertoryFieldFile = $repertoryFieldFile;
        
        return $this;
    }
}
