<?php

namespace App\Entity;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use Sylius\Component\Resource\Model\SlugAwareInterface;

/**
 * FieldsetsField
 *
 * @ORM\Table(name="WCT_Fieldsets_Fields")
 * @ORM\Entity
 */
class FieldsetField implements SlugAwareInterface
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
     * @var string
     *
     * @Gedmo\Slug(fields={"title"})
     * @ORM\Column(name="slug", type="string", length=128, nullable=false, unique=true)
     */
    private $slug;
    
    /**
     * 
     * @ORM\Column(name="type", type="string", columnDefinition="enum('text', 'picture', 'link')")
     */
    private $type;
    
    /**
     * 
     * @ORM\ManyToOne(targetEntity="Fieldset", inversedBy="fields")
     * @ORM\JoinColumn(name="fieldsetId", referencedColumnName="id")
     */
    private $fieldset;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=64, nullable=false)
     */
    private $title;


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
     * Set type
     *
     * @param FieldType $type
     * @return FieldsetsField
     */
    public function setType($type)
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
    
    /**
     * Set fieldset
     *
     * @param Fieldset $fieldset
     * @return FieldsetField
     */
    public function setFieldset(Fieldset $fieldset)
    {
        $this->fieldset = $fieldset;

        return $this;
    }

    /**
     * Get fieldset
     *
     * @return Fieldset
     */
    public function getFieldset()
    {
        return $this->fieldset;
    }

    /**
     * Set title
     *
     * @param string $title
     * @return FieldsetsField
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
}
