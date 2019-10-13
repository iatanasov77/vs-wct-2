<?php

namespace App\Entity;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;

use Sylius\Component\Resource\Model\SlugAwareInterface;

/**
 * WctProjectfields
 *
 * @ORM\Table(name="WCT_ProjectDetailsFields")
 * @ORM\Entity
 */
class ProjectDetailsField implements SlugAwareInterface
{
    
    /**
     * @ORM\ManyToOne(targetEntity="Project", inversedBy="fields")
     * @ORM\JoinColumn(name="projectId", referencedColumnName="id")
     */
    public $project;
    
     /**
     *
     * @ORM\OneToOne(targetEntity="FieldType")
     * @ORM\JoinColumn(name="typeId", referencedColumnName="id")
     */
    private $type;
    
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
     * @ORM\Column(name="slug", type="string", length=256, nullable=false)
     * @Gedmo\Slug(fields={"title"})
     */
    private $slug;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=256, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="xquery", type="string", length=256, nullable=true)
     */
    private $xquery;



    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    function getSlug(): ?string
    {
        return $this->slug;
    }
    
    function setSlug($slug=null): void
    {
        $this->slug = $slug;
        //return $this;
    }

    /**
     * Set title
     *
     * @param string $title
     * @return WctProjectfields
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string 
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set xquery
     *
     * @param string $xquery
     * @return WctProjectfields
     */
    public function setXquery($xquery)
    {
        $this->xquery = $xquery;

        return $this;
    }

    /**
     * Get xquery
     *
     * @return string 
     */
    public function getXquery()
    {
        return $this->xquery;
    }
    
    /**
     * Set project
     *
     * @param Project $project
     * @return ProjectDetailsField
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
    
    /**
     * Set type
     *
     * @param FieldType $type
     * @return ProjectDetailsField
     */
    public function setType(FieldType $type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return FieldType
     */
    public function getType()
    {
        return $this->type;
    }
}
