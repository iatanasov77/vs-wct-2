<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Vankosoft\CmsBundle\Model\File;

#[ORM\Entity]
#[ORM\Table(name: "WCT_ProjectRepertoryFields_Files")]
class ProjectRepertoryFieldFile extends File
{
    /** @var ProjectRepertoryField */
    #[ORM\OneToOne(targetEntity: ProjectRepertoryField::class, inversedBy: "repertoryFieldFile", cascade: ["persist", "remove"], orphanRemoval: true)]
    #[ORM\JoinColumn(name: "owner_id", referencedColumnName: "id", nullable: true, onDelete: "CASCADE")]
    protected $owner;
    
    public function getRepertoryField()
    {
        return $this->owner;
    }
    
    public function setRepertoryField( ProjectRepertoryField $repertoryField ): self
    {
        $this->setOwner( $repertoryField );
        
        return $this;
    }
}