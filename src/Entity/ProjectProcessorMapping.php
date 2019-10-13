<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Sylius\Component\Resource\Model\ResourceInterface;

/**
 * MapperMapping
 *
 * @ORM\Table(name="WCT_Projects_Processors_Mappings")
 * @ORM\Entity
 */
class ProjectProcessorMapping implements ResourceInterface
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
     * @ORM\ManyToOne(targetEntity="ProjectProcessor", inversedBy="mappings")
     * @ORM\JoinColumn(name="projectProcessorId", referencedColumnName="id")
     */
    private $processor;

    /**
     * @var string
     *
     * @ORM\Column(name="projectFieldAlias", type="string", length=64, nullable=false)
     */
    private $projectFieldAlias;

    /**
     * @var string
     *
     * @ORM\Column(name="mapProcessorField", type="string", length=64, nullable=false)
     */
    private $mapProcessorField;

    
    /**
     * Set mapper
     *
     * @param ProjectProcessor $processor
     * @return ProjectProcessorMapping
     */
    public function setProcessor(ProjectProcessor $processor)
    {
        $this->processor = $processor;

        return $this;
    }

    /**
     * Get mapper
     *
     * @return Mapper
     */
    public function getProcessor()
    {
        return $this->processor;
    }
    
    function getId()
    {
        return $this->id;
    }

    function getProjectFieldAlias()
    {
        return $this->projectFieldAlias;
    }

    function getMapProcessorField()
    {
        return $this->mapProcessorField;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setProjectFieldAlias($projectFieldAlias)
    {
        $this->projectFieldAlias = $projectFieldAlias;
        return $this;
    }

    function setMapProcessorField($mapProcessorField)
    {
        $this->mapProcessorField = $mapProcessorField;
        return $this;
    }

}
