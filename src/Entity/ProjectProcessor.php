<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use App\Component\MapProcessor\ProcessorOptionsInterface;

/**
 * Project Processor
 *
 * @ORM\Table(name="WCT_Projects_Processors")
 * @ORM\Entity
 */
class ProjectProcessor implements ProcessorOptionsInterface
{

    /**
     * @ORM\ManyToOne(targetEntity="Project", inversedBy="processors")
     * @ORM\JoinColumn(name="projectId", referencedColumnName="id")
     */
    public $project;
    
    private $projectId;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=128, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="class", type="string", length=128, nullable=false)
     */
    private $class;

    /**
     * @var string
     *
     * @ORM\Column(name="options", type="string", length=256, nullable=false)
     */
    private $options;

    /**
     * @ORM\OneToMany(targetEntity="ProjectProcessorMapping", mappedBy="processor", cascade={"persist"})
     */
    private $mappings;
    

    public function __construct()
    {
        $this->mappings = new ArrayCollection();
    }

    function getProjectId() {
     return $this->projectId;
    }

    function setProjectId($projectId) {
        $this->projectId = $projectId;
        
        return $this;
    }


    
    function getId()
    {
        return $this->id;
    }

    function getTitle()
    {
        return $this->title;
    }

    function getClass()
    {
        return $this->class;
    }

    function getOptions()
    {
        return $this->options;
    }

    function setId($id)
    {
        $this->id = $id;
        
        return $this;
    }

    function setTitle($title)
    {
        $this->title = $title;
        
        return $this;
    }

    function setClass($class)
    {
        $this->class = $class;
        
        return $this;
    }

    function setOptions($options)
    {
        $this->options = $options;
        
        return $this;
    }
    
    /**
     * Set project
     *
     * @param Project $project
     * @return Mapper
     */
    public function setProject(Project $project)
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
    
    function getMappings()
    {
        return $this->mappings->toArray();
    }
    
    function resetMappings()
    {
        $this->mappings = new ArrayCollection();
        
        return $this;
    }

            public function addMapping(ProjectProcessorMapping $mapping)
    {
        if(!$this->mappings->contains($mapping)) {
            $mapping->setProcessor($this);
            $this->mappings->add($mapping);
        }

        return $this;
    }

    public function removeMapping(ProjectProcessorMapping $mapping)
    {
        if($this->mappings->contains($mapping)) {
            $this->mappings->removeElement($mapping);
        }

        return $this;
    }
    
    public function getProcessorOptions()
    {
        return json_decode($this->getOptions());
    }
    
    public function getProjectFields()
    {
        $fields = array();
        
        foreach($this->getProject()->getListingFields() as $field) {
            $fields[$field->getXquery()] = $field->getTitle();
        }
        foreach($this->getProject()->getDetailsFields() as $field) {
            $fields[$field->getXquery()] = $field->getTitle();
        }
        
        return $fields;
    }

}
