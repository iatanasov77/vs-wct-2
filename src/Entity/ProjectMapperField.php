<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Sylius\Component\Resource\Model\ResourceInterface;

/**
 * ProjectMapperField
 *
 * @ORM\Table(name="WCT_ProjectMapperFields")
 * @ORM\Entity
 */
class ProjectMapperField implements ResourceInterface
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
     * @ORM\ManyToOne(targetEntity="ProjectMapper", inversedBy="fields")
     * @ORM\JoinColumn(name="project_mapper_id", referencedColumnName="id")
     */
    private $mapper;
    
    /**
     * @ORM\ManyToOne(targetEntity="ProjectField", inversedBy="parsedFields")
     * @ORM\JoinColumn(name="project_field_id", referencedColumnName="id")
     */
    private $projectField;
    
    /**
     * @var string
     *
     * @ORM\Column(name="map_field", type="string", length=255, nullable=false)
     */
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
