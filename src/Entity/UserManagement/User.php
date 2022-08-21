<?php namespace App\Entity\UserManagement;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Vankosoft\UsersBundle\Model\User as BaseUser;
use Vankosoft\UsersSubscriptionsBundle\Model\Interfaces\SubscribedUserInterface;
use Vankosoft\UsersSubscriptionsBundle\Model\Traits\SubscribedUserTrait;
use Vankosoft\PaymentBundle\Model\Interfaces\PaymentsUserInterface;
use Vankosoft\PaymentBundle\Model\Traits\PaymentsUserTrait;

use App\Entity\Project;

/**
 * @ORM\Entity
 * @ORM\Table(name="VSUM_Users")
 */
class User extends BaseUser implements SubscribedUserInterface, PaymentsUserInterface
{
    use SubscribedUserTrait;
    use PaymentsUserTrait;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Project", mappedBy="user", orphanRemoval=true)
     */
    private $projects;
    
    public function __construct()
    {
        parent::__construct();
        
        $this->projects = new ArrayCollection();
    }
    
    /**
     * {@inheritDoc}
     */
    public function getRoles()
    {
        /* Use RolesArray ( OLD WAY )*/
        //return $this->getRolesFromArray();
        
        /* Use RolesCollection */
        return $this->getRolesFromCollection();
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
            $project->addCategory( $this );
        }
        
        return $this;
    }
    
    public function removeProject( Project $project ): self
    {
        if ( ! $this->projects->contains( $project ) ) {
            $this->projects->removeElement( $project );
            $project->removeCategory( $this );
        }
        
        return $this;
    }
}
