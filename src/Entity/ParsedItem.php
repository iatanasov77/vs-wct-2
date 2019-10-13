<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Entity\Project;
use JMS\Serializer\Annotation as JMS;

/**
 * WCT Parced Items
 *
 * @ORM\Table(name="WCT_ParcedItems")
 * @ORM\Entity(repositoryClass="App\Entity\Repository\ParsedItemsRepository")
 * @ORM\HasLifecycleCallbacks
 */
class ParsedItem
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
     * @ORM\ManyToOne(targetEntity="Project")
     * @ORM\JoinColumn(name="projectId", referencedColumnName="id")
     * @JMS\Exclude()
     */
    public $project;

    /**
     * @var string
     *
     * @ORM\Column(name="runSession", type="string", length=64, nullable=false)
     */
    private $runSession;

    /**
     * @var string
     *
     * @ORM\Column(name="itemUrl", type="string", length=256, nullable=false)
     */
    private $itemUrl;

    /**
     * @var string
     *
     * @ORM\Column(name="fields", type="text", nullable=false)
     */
    private $fields;

    /**
     * @var datetime $created
     *
     * @ORM\Column(name="created", type="datetime")
     */
    private $created;

    /**
     * @var datetime $updated
     * 
     * @ORM\Column(name="updated", type="datetime", nullable = true)
     */
    private $updated;

    /**
     * Gets triggered only on insert
     * 
     * @ORM\PrePersist
     */
    public function onPrePersist()
    {
        $this->created = new \DateTime("now");
    }

    /**
     * Gets triggered every time on update

     * @ORM\PreUpdate
     */
    public function onPreUpdate()
    {
        $this->updated = new \DateTime("now");
    }

    
    /**
     * Set project
     *
     * @param Project $project
     * @return ParsedItems
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
    
    function getId()
    {
        return $this->id;
    }

    function getRunSession()
    {
        return $this->runSession;
    }

    function getItemUrl()
    {
        return $this->itemUrl;
    }

    function getFields()
    {
        return $this->fields;
    }

    function getCreated()
    {
        return $this->created;
    }

    function getUpdated()
    {
        return $this->updated;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setRunSession($runSession)
    {
        $this->runSession = $runSession;
        return $this;
    }

    function setItemUrl($itemUrl)
    {
        $this->itemUrl = $itemUrl;
        return $this;
    }

    function setFields($fields)
    {
        $this->fields = $fields;
        return $this;
    }

    function setCreated(DateTime $created)
    {
        $this->created = $created;
        return $this;
    }

    function setUpdated(DateTime $updated)
    {
        $this->updated = $updated;
        return $this;
    }

}
