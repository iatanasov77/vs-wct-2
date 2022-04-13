<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Sylius\Component\Resource\Model\ResourceInterface;

/**
 * WctProjectRepertoryFields
 *
 * @ORM\Table(name="WCT_ProjectRepertoryFields")
 * @ORM\Entity
 */
class ProjectRepertoryField implements ResourceInterface
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
     * @ORM\ManyToOne(targetEntity="ProjectRepertoryItem", inversedBy="fields")
     * @ORM\JoinColumn(name="project_repertory_item_id", referencedColumnName="id")
     */
    private $item;
    
    /**
     * @ORM\ManyToOne(targetEntity="ProjectField", inversedBy="parsedFields")
     * @ORM\JoinColumn(name="project_field_id", referencedColumnName="id")
     */
    private $projectField;
    
    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text", nullable=false)
     */
    private $content;
    
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
}
