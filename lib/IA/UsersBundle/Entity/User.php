<?php namespace IA\UsersBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
//use Uecode\Bundle\ApiKeyBundle\Model\ApiKeyUser as BaseUser;
use Sylius\Component\Resource\Model\ResourceInterface;
use Doctrine\ORM\Mapping as ORM;
use IA\Component\Utils;

/**
 * @ORM\Entity
 * @ORM\Table(name="IAUM_Users")
 */
class User extends BaseUser implements ResourceInterface
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
    
    /**
     * @ORM\OneToOne(targetEntity="UserInfo")
     * @ORM\JoinColumn(name="user_info_id", referencedColumnName="id")
     */
    protected $userInfo;

    /**
     * @ORM\OneToOne(targetEntity="IA\PaidMembershipBundle\Entity\UserSubscription", inversedBy="user")
     * @ORM\JoinColumn(name="subscriptionId", referencedColumnName="id")
     */
    protected $subscription;
    
    public function getUserInfo()
    {
        return $this->userInfo;
    }
    
    public function setUuserInfo( $userInfo )
    {
        $this->userInfo = $userInfo;
        
        return $this;
    }
    
    public function getSubscription() 
    {
        return $this->subscription;
    }

    public function setSubscription(&$subscription)
    {
        $subscription->setUser($this);
        $this->subscription = $subscription;
        
        return $this;
    }

    public function __toString()
    {
        return ( string ) $this->userInfo->getFullName();
    }
}
