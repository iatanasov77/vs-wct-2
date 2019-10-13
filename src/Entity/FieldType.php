<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * WctFieldsetsFields
 *
 * @ORM\Table(name="WCT_Field_Types")
 * @ORM\Entity
 */
class FieldType
{
    
    const Text = 1;
    const Picture = 2;
    const Link = 3;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=64, nullable=false)
     */
    private $title;

    /*
     * You can check what field tabs is a Field such:
     *  $field->getType()->isText()
     *  $field->getType()->isPicture()
     *  $field->getType()->isLink()
     *  or such:
     *  $field->getType()->getId() === FieldType::Text
     *  ......
     */
    public function __call($name, $args)
    {
        if(strpos($name, 'is') === 0) {
            $type = ltrim($name, 'is');
            if(defined('self:'.$type)) {
                return $this->id === 'self:'.$type;
            } else {
                return $this->title === $type;
            }
        }
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

    /**
     * Set id
     *
     * @param string $id
     * @return WctFieldsetsFields
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Set title
     *
     * @param string $title
     * @return WctFieldsetsFields
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

