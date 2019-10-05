<?php

namespace IA\UsersBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
//use Uecode\Bundle\ApiKeyBundle\Model\ApiKeyUser as BaseUser;
use Sylius\Component\Resource\Model\ResourceInterface;
use Doctrine\ORM\Mapping as ORM;
use IA\Component\Utils;

/**
 * @ORM\Entity
 * @ORM\Table(name="Users")
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
     * @var string
     *
     * @ORM\Column(name="firstName", type="string", length=128, nullable=false)
     */
    protected $firstName;

    /**
     * @var string
     *
     * @ORM\Column(name="lastName", type="string", length=128, nullable=false)
     */
    protected $lastName;

    /**
     * @var string
     *
     * @ORM\Column(name="country", type="string", length=3, nullable=false)
     */
    protected $country;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="birthday", type="datetime", nullable=true)
     */
    protected $birthday;

    /**
     * @var string
     *
     * @ORM\Column(name="mobile", type="integer", length=16, nullable=true)
     */
    protected $mobile;

    /**
     * @var string
     *
     * @ORM\Column(name="website", type="string", length=64, nullable=true)
     */
    protected $website;
    
    /**
     * @var string
     *
     * @ORM\Column(name="occupation", type="string", length=64, nullable=true)
     */
    protected $occupation;
    
    /**
     * @ORM\OneToOne(targetEntity="IA\PaidMembershipBundle\Entity\UserSubscription", inversedBy="user")
     * @ORM\JoinColumn(name="subscriptionId", referencedColumnName="id")
     */
    protected $subscription;
    
    function getSubscription() 
    {
        return $this->subscription;
    }

    function setSubscription(&$subscription)
    {
        $subscription->setUser($this);
        $this->subscription = $subscription;
        
        return $this;
    }


    
    public function setEmail($email) 
    {
        parent::setEmail($email);
        $this->setUsername($email);
        
        return $this;
    }
    
    function getFirstName()
    {
        return $this->firstName;
    }

    function getLastName()
    {
        return $this->lastName;
    }

    function setFirstName($firstName)
    {
        $this->firstName = $firstName;

        return $this;
    }

    function setLastName($lastName)
    {
        $this->lastName = $lastName;

        return $this;
    }

    function getCountry()
    {
        return $this->country;
    }

    function getBirthday()
    {
        return $this->birthday;
    }

    function getMobile()
    {
        return $this->mobile;
    }

    function getWebsite()
    {
        return $this->website;
    }

    function setCountry($country)
    {
        $this->country = $country;

        return $this;
    }

    function setBirthday(\DateTime $birthday)
    {
        $this->birthday = $birthday;

        return $this;
    }

    function setMobile($mobile)
    {
        $this->mobile = $mobile;

        return $this;
    }

    function setWebsite($website)
    {
        $this->website = $website;

        return $this;
    }

    function getOccupation() {
        return $this->occupation;
    }
    
    function setOccupation($occupation) {
        $this->occupation = $occupation;

        return $this;
    }

    public function getFullName()
    {
        return $this->firstName . ' ' . $this->lastName;
    }

    public function __toString()
    {
        return (string)$this->getFullName();
    }

}
