<?php

namespace IA\PaidMembershipBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Entity\User;
use IA\PaymentBundle\Entity\PaymentDetails;

/**
 * Plan
 *
 * @ORM\Table(name="IAPM_UsersSubscriptions")
 * @ORM\Entity
 */
class UserSubscription
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
     * @ORM\OneToOne(targetEntity="App\Entity\User", mappedBy="subscription")
     * @ORM\JoinColumn(name="userId", referencedColumnName="id")
     */
    private $user;

    /**
     * @ORM\OneToOne(targetEntity="PackagePlan")
     * @ORM\JoinColumn(name="planId", referencedColumnName="id")
     */
    private $plan;

    /**
     *
     * @var type 
     * 
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;


    /**
     * @ORM\OneToOne(targetEntity="IA\PaymentBundle\Entity\PaymentDetails", inversedBy="userSubscription", cascade={"persist"})
     * @ORM\JoinColumn(name="paymentDetailsId", referencedColumnName="id")
     */
    private $paymentDetails;

    function getId()
    {
        return $this->id;
    }

    function getUser()
    {
        return $this->user;
    }

    function getPlan()
    {
        return $this->plan;
    }

    function getDate()
    {
        return $this->date;
    }

    function setId($id)
    {
        $this->id = $id;
        
        return $this;
    }

    function setUser($user)
    {
        $this->user = $user;
        
        return $this;
    }

    function setPlan($plan)
    {
        $this->plan = $plan;
        
        return $this;
    }

    function setDate(type $date)
    {
        $this->date = $date;
        
        return $this;
    }

    function getPaymentMethod()
    {
        return $this->paymentDetails->getPaymentMethod();
    }

    function getPaymentDetails()
    {
        return $this->paymentDetails;
    }

    function setPaymentDetails(PaymentDetails $paymentDetails)
    {
        $this->paymentDetails = $paymentDetails;

        return $this;
    }

}
