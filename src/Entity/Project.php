<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;
use Sylius\Component\Resource\Model\TimestampableTrait;
//use Sylius\Component\Resource\Model\TranslatableTrait;

use App\Entity\UserManagement\User;

#[ORM\Entity]
#[ORM\Table(name: "WCT_Projects")]
class Project implements ResourceInterface
{
    use TimestampableTrait;
    
    /** @var int */
    #[ORM\Id, ORM\Column(type: "integer"), ORM\GeneratedValue(strategy: "IDENTITY")]
    private $id;
    
    /** @var ProjectCategory */
    #[ORM\ManyToOne(targetEntity: ProjectCategory::class, inversedBy: "projects")]
    #[ORM\JoinColumn(name: "category_id", referencedColumnName: "id")]
    private $category;
    
    /** @var User */
    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: "projects")]
    #[ORM\JoinColumn(name: "user_id", referencedColumnName: "id")]
    private $user;
    
    /** @var PictureCropper | null */
    #[ORM\ManyToOne(targetEntity: PictureCropper::class, inversedBy: "projects")]
    #[ORM\JoinColumn(name: "picture_cropper_id", referencedColumnName: "id", nullable: true)]
    private $pictureCropper;
    
    /** @var string */
    #[ORM\Column(name: "title", type: "string", length: 128, nullable: false)]
    private $title;

    /** @var string */
    #[ORM\Column(name: "url", type: "string", length: 128, nullable: false)]
    private $url;
    
    /** @var string */
    #[ORM\Column(name: "listing_container_element", type: "string", length: 128, nullable: true, options: ["comment" => "The XPath using as base container when we parse fields in listing pages. ( In details pages is using the first parent with id attribute as base container.) "])]
    private $listingContainerElement;
    
    /** @var string */
    #[ORM\Column(name: "details_link", type: "string", length: 128, nullable: true)]
    private $detailsLink;
    
    /** @var string */
    #[ORM\Column(name: "pager_link", type: "string", length: 128, nullable: true)]
    private $pagerLink;

    /** @var Collection | ProjectField[] */
    #[ORM\OneToMany(targetEntity: ProjectField::class, mappedBy: "project", indexBy: "id", cascade: ["persist", "remove"], orphanRemoval: true)]
    private $fields;
    
    /** @var Collection | ProjectMapper[] */
    #[ORM\OneToMany(targetEntity: ProjectMapper::class, mappedBy: "project", indexBy: "id", cascade: ["persist", "remove"], orphanRemoval: true)]
    private $mappers;
    
    /** @var Collection | ProjectRepertory[] */
    #[ORM\OneToMany(targetEntity: ProjectRepertory::class, mappedBy: "project", indexBy: "id", cascade: ["persist", "remove"], orphanRemoval: true)]
    private $repertories;
    
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->fields       = new ArrayCollection();
        $this->mappers      = new ArrayCollection();
        $this->repertories  = new ArrayCollection();
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
    
    public function getCategory(): ?ProjectCategory
    {
        return $this->category;
    }
    
    public function setCategory(?ProjectCategory $category): self
    {
        $this->category = $category;
        
        return $this;
    }
    
    /**
     * Set userid
     *
     * @param UserManagement\User $user
     * 
     * @return Project
     */
    public function setUser($user): self
    {
        $this->user = $user;
        
        return $this;
    }
    
    /**
     * Get user
     *
     * @return UserManagement\User
     */
    public function getUser()
    {
        return $this->user;
    }
    
    public function setPictureCropper($pictureCropper): self
    {
        $this->pictureCropper = $pictureCropper;
        
        return $this;
    }
    
    public function getPictureCropper()
    {
        return $this->pictureCropper;
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
    
    /**
     * Get url
     *
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
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

    public function getListingContainerElement()
    {
        return $this->listingContainerElement;    
    }
    
    public function setListingContainerElement( $listingContainerElement )
    {
        $this->listingContainerElement  = $listingContainerElement;
        
        return $this;
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

    public function getFields(): Collection
    {
        return $this->fields;
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
    
    public function getMappers(): Collection
    {
        return $this->mappers;
    }
    
    public function addMapper( ProjectMapper $mapper )
    {
        if( ! $this->mappers->contains( $mapper ) ) {
            $mapper->setProject( $this );
            $this->mappers->add( $mapper );
        }
        
        return $this;
    }
    
    public function removeMapper( ProjectMapper $mapper )
    {
        if( $this->mappers->contains( $mapper ) ) {
            $this->mappers->removeElement( $mapper );
        }
        
        return $this;
    }
    
    public function getRepertories(): Collection
    {
        return $this->repertories;
    }
    
    public function addRepertoy( ProjectRepertory $repertory )
    {
        if( ! $this->repertories->contains( $repertory ) ) {
            $repertory->setProject( $this );
            $this->repertories->add( $repertory );
        }
        
        return $this;
    }
    
    public function removeRepertory( ProjectRepertory $repertory )
    {
        if( $this->repertories->contains( $repertory ) ) {
            $this->repertories->removeElement( $repertory );
        }
        
        return $this;
    }
    
    /**
     * Needed of CrudOwnerModelsVoter
     * @return \App\Entity\UserManagement\User
     */
    public function getOwner()
    {
        return $this->user;
    }
}
