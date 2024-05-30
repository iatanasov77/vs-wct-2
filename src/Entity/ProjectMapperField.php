<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Sylius\Component\Resource\Model\ResourceInterface;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectMapperFields")]
class ProjectMapperField implements ResourceInterface
{
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var ProjectMapper */
    #[ORM\ManyToOne(targetEntity: ProjectMapper::class, inversedBy: "fields")]
    #[ORM\JoinColumn(name: "project_mapper_id", referencedColumnName: "id")]
    private $mapper;
    
    /** @var ProjectField */
    #[ORM\ManyToOne(targetEntity: ProjectField::class, inversedBy: "parsedFields")]
    #[ORM\JoinColumn(name: "project_field_id", referencedColumnName: "id")]
    private $projectField;
    
    /** @var string */
    #[ORM\Column(name: "map_field", type: "string", length: 255, nullable: false)]
    private $mapField;
    
    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }
    
    public function getMapper()
    {
        return $this->mapper;
    }
    
    public function setMapper( ProjectMapper $mapper )
    {
        $this->mapper   = $mapper;
        
        return $this;
    }
        
    public function getProjectField()
    {
        return $this->projectField;
    }
    
    public function setProjectField( ProjectField $projectsField )
    {
        $this->projectField = $projectsField;
        
        return $this;
    }
    
    public function getMapField()
    {
        return $this->mapField;
    }
    
    public function setMapField( string $mapField )
    {
        $this->mapField = $mapField;
        
        return $this;
    }
}
