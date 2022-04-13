<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Sylius\Component\Resource\Model\ResourceInterface;

/**
 * PictureCropper
 * 
 * Using Croppers
 * --------------
 * https://symfony.com/bundles/LiipImagineBundle/current/index.html
 * https://www.web-hints.com/blog/automatic-resizing-and-cropping-of-images-using-symfony
 * 
 * @ORM\Table(name="WCT_PictureCroppers")
 * @ORM\Entity
 */
class PictureCropper implements ResourceInterface
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
     * @ORM\OneToMany(targetEntity="Project", mappedBy="pictureCropper")
     */
    private $projects;
    
    /**
     * @var boolean
     *
     * @ORM\Column(name="crop_top", type="boolean", nullable=true)
     */
    private $cropTop;
    
    /**
     * @var boolean
     *
     * @ORM\Column(name="crop_right", type="boolean", nullable=true)
     */
    private $cropRight;
    
    /**
     * @var boolean
     *
     * @ORM\Column(name="crop_bottom", type="boolean", nullable=true)
     */
    private $cropBottom;
    
    /**
     * @var boolean
     *
     * @ORM\Column(name="crop_left", type="boolean", nullable=true)
     */
    private $cropLeft;
    
    public function __construct()
    {
        $this->projects  = new ArrayCollection();
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
    
    public function setCroptop($cropTop)
    {
        $this->cropTop = $cropTop;
        
        return $this;
    }
    
    public function getCropTop()
    {
        return $this->cropTop;
    }
    
    public function setCropRight($cropRight)
    {
        $this->cropRight = $cropRight;
        
        return $this;
    }

    public function getCropRight()
    {
        return $this->cropRight;
    }

    public function setCropBottom($cropBottom)
    {
        $this->cropBottom = $cropBottom;
        
        return $this;
    }

    public function getCropBottom()
    {
        return $this->cropBottom;
    }

    public function setCropLeft($cropLeft)
    {
        $this->cropLeft = $cropLeft;
        
        return $this;
    }

    public function getCropLeft()
    {
        return $this->cropLeft;
    }
    
    /**
     * @return Collection|Project[]
     */
    public function getProjects(): Collection
    {
        return $this->projects;
    }
    
    public function addProject( Project $project ): self
    {
        if ( ! $this->projects->contains( $project ) ) {
            $this->projects[] = $project;
            $project->setPictureCropper( $this );
        }
        
        return $this;
    }
    
    public function removeProject( Project $project ): self
    {
        if ( $this->projects->contains( $project ) ) {
            $this->projects->removeElement( $project );
            $project->setPictureCropper( null );
        }
        
        return $this;
    }
}
