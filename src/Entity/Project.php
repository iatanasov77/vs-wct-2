<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Sylius\Component\Resource\Model\ResourceInterface;
use Sylius\Component\Resource\Model\TimestampableTrait;
use Sylius\Component\Resource\Model\ToggleableTrait;
//use Sylius\Component\Resource\Model\TranslatableTrait;

/**
 * Project
 *
 * @ORM\Table(name="WCT_Projects", uniqueConstraints={@ORM\UniqueConstraint(name="url_UNIQUE", columns={"url"})}, indexes={@ORM\Index(name="categoryId", columns={"categoryId"}), @ORM\Index(name="userId", columns={"userId"})})
 * @ORM\Entity(repositoryClass="App\Entity\Repository\ProjectsRepository")
 */
class Project implements ResourceInterface
{
    use TimestampableTrait;
    use ToggleableTrait;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="parseCountMax", type="integer", length=8, nullable=false, options={"default" = 100})
     */
    private $parseCountMax;
    
    /**
     * @var string
     *
     * @ORM\Column(name="parseMode", type="string", columnDefinition="enum('css', 'xpath')")
     */
    private $parseMode;

    /**
     * @var string
     *
     * @ORM\Column(name="url", type="string", length=128, nullable=false)
     */
    private $url;
    
    /**
     * @var string
     *
     * @ORM\Column(name="detailsPage", type="string", length=128, nullable=true)
     */
    private $detailsPage;

    /**
     * @var integer
     *
     * @ORM\Column(name="categoryId", type="integer", nullable=true)
     */
    private $categoryid;

    /**
     * @var integer
     *
     * @ORM\Column(name="userId", type="integer", nullable=true)
     */
    private $userid;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=128, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="detailsLink", type="string", length=256, nullable=false)
     */
    private $detailsLink;

    /**
     * @var string
     *
     * @ORM\Column(name="pagerLink", type="string", length=256, nullable=false)
     */
    private $pagerLink;

    /**
     * @var string
     *
     * @ORM\Column(name="nopic", type="string", length=128, nullable=true)
     */
    private $nopic;

    /**
     * @var boolean
     *
     * @ORM\Column(name="pictureCropTop", type="boolean", nullable=true)
     */
    private $picturecroptop;

    /**
     * @var boolean
     *
     * @ORM\Column(name="pictureCropRight", type="boolean", nullable=true)
     */
    private $picturecropright;

    /**
     * @var boolean
     *
     * @ORM\Column(name="pictureCropBottom", type="boolean", nullable=true)
     */
    private $picturecropbottom;

    /**
     * @var boolean
     *
     * @ORM\Column(name="pictureCropLeft", type="boolean", nullable=true)
     */
    private $picturecropleft;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ProjectField", mappedBy="project", cascade={"persist", "remove"}, orphanRemoval=true)
     */
    private $fields;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ProjectProcessor", mappedBy="project", cascade={"persist"})
     */
    private $processors;
    
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->fields       = new ArrayCollection();
        $this->processors   = new ArrayCollection();
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

    public function getParseCountMax() {
        return $this->parseCountMax;
    }
    
    public function setParseCountMax($parseCountMax) {
        $this->parseCountMax = $parseCountMax;
        return $this;
    }

    public function setParseMode($parseMode)
    {
        $this->parseMode = $parseMode;
        
        return $this;
    }
    
    public function getParseMode()
    {
        return $this->parseMode;
    }
    
    /**
     * Set url
     *
     * @param string $url
     * @return WctProjects
     */
    public function setUrl($url)
    {
        $this->url = $url;

        return $this;
    }

    /**
     * Get url
     *
     * @return string 
     */
    public function getUrl()
    {
        return $this->url;
    }

    public function setDetailsPage($detailsPage)
    {
        $this->detailsPage = $detailsPage;
        
        return $this;
    }
   
    public function getDetailsPage()
    {
        return $this->detailsPage;
    }
    
    /**
     * Set categoryid
     *
     * @param integer $categoryid
     * @return WctProjects
     */
    public function setCategoryid($categoryid)
    {
        $this->categoryid = $categoryid;

        return $this;
    }

    /**
     * Get categoryid
     *
     * @return integer 
     */
    public function getCategoryid()
    {
        return $this->categoryid;
    }

    /**
     * Set userid
     *
     * @param integer $userid
     * @return WctProjects
     */
    public function setUserid($userid)
    {
        $this->userid = $userid;

        return $this;
    }

    /**
     * Get userid
     *
     * @return integer 
     */
    public function getUserid()
    {
        return $this->userid;
    }

    /**
     * Set title
     *
     * @param string $title
     * @return Project
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

    public function getDetailsLink()
    {
        return $this->detailsLink;
    }

    public function setDetailsLink($detailsLink)
    {
        $this->detailsLink = $detailsLink;
        return $this;
    }
    
    public function getPagerLink()
    {
        return $this->pagerLink;
    }

    
    public function setPagerLink($pagerLink)
    {
        $this->pagerLink = $pagerLink;
        return $this;
    }

    /**
     * Set nopic
     *
     * @param string $nopic
     * @return WctProjects
     */
    public function setNopic($nopic)
    {
        $this->nopic = $nopic;

        return $this;
    }

    /**
     * Get nopic
     *
     * @return string 
     */
    public function getNopic()
    {
        return $this->nopic;
    }

    /**
     * Set picturecroptop
     *
     * @param boolean $picturecroptop
     * @return WctProjects
     */
    public function setPicturecroptop($picturecroptop)
    {
        $this->picturecroptop = $picturecroptop;

        return $this;
    }

    /**
     * Get picturecroptop
     *
     * @return boolean 
     */
    public function getPicturecroptop()
    {
        return $this->picturecroptop;
    }

    /**
     * Set picturecropright
     *
     * @param boolean $picturecropright
     * @return WctProjects
     */
    public function setPicturecropright($picturecropright)
    {
        $this->picturecropright = $picturecropright;

        return $this;
    }

    /**
     * Get picturecropright
     *
     * @return boolean 
     */
    public function getPicturecropright()
    {
        return $this->picturecropright;
    }

    /**
     * Set picturecropbottom
     *
     * @param boolean $picturecropbottom
     * @return WctProjects
     */
    public function setPicturecropbottom($picturecropbottom)
    {
        $this->picturecropbottom = $picturecropbottom;

        return $this;
    }

    /**
     * Get picturecropbottom
     *
     * @return boolean 
     */
    public function getPicturecropbottom()
    {
        return $this->picturecropbottom;
    }

    /**
     * Set picturecropleft
     *
     * @param boolean $picturecropleft
     * @return WctProjects
     */
    public function setPicturecropleft($picturecropleft)
    {
        $this->picturecropleft = $picturecropleft;

        return $this;
    }

    /**
     * Get picturecropleft
     *
     * @return boolean 
     */
    public function getPicturecropleft()
    {
        return $this->picturecropleft;
    }

    /**
     * Set active
     *
     * @param boolean $active
     * @return WctProjects
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active
     *
     * @return boolean 
     */
    public function getActive()
    {
        return $this->active;
    }

    public function getFields()
    {
        return $this->fields->toArray();
    }

    public function addField( ProjectField $field )
    {
        if( ! $this->fields->contains( $field ) ) {
            $field->setProject( $this );
            $this->fields->add( $field );
        }
        
        return $this;
    }

    public function removeField( ProjectField $field )
    {
        if( $this->fields->contains( $field ) ) {
            $this->fields->removeElement( $field );
        }

        return $this;
    }
    
    public function getProcessors()
    {
        return $this->processors->toArray();
    }

    public function addProcessor( ProjectProcessor $processor )
    {
        if(!$this->processors->contains($processor)) {
            $processor->setProject($this);
            $this->processors->add($processor);
        }

        return $this;
    }

    public function removeProcessor(ProjectProcessor $processor)
    {
        if($this->processors->contains($processor)) {
            $this->processors->removeElement($processor);
        }

        return $this;
    }

}
