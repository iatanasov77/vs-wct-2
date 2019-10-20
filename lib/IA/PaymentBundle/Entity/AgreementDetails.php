<?php
namespace IA\PaymentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Payum\Core\Model\ArrayObject;

/*
 ALTER TABLE `IAP_AgreementDetails` ADD `number` VARCHAR(64) NOT NULL AFTER `planId`, ADD `currencyCode` VARCHAR(64) NOT NULL AFTER `number`, ADD `totalAmount` VARCHAR(64) NOT NULL AFTER `currencyCode`, ADD `description` VARCHAR(64) NOT NULL AFTER `totalAmount`, ADD `clientId` VARCHAR(64) NOT NULL AFTER `description`, ADD `clientEmail` VARCHAR(64) NOT NULL AFTER `clientId`; 
 * 
 */

/**
 * @ORM\Table(name="IAP_AgreementDetails")
 * @ORM\Entity
 */
class AgreementDetails extends ArrayObject
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;
    
    /**
     * @ORM\ManyToOne(targetEntity="IA\UsersBundle\Entity\User")
     * @ORM\JoinColumn(name="userId", referencedColumnName="id")
     */
    protected $user;
    
    /**
     * @ORM\ManyToOne(targetEntity="IA\PaidMembershipBundle\Entity\PackagePlan")
     * @ORM\JoinColumn(name="planId", referencedColumnName="id")
     */
    protected $plan;
    
    /**
     * @var string
     *
     * @ORM\Column(name="number", type="string", length=64, nullable=false)
     */
    protected $number;
    
    /**
     * @var string
     *
     * @ORM\Column(name="currencyCode", type="string", length=64, nullable=false)
     */
    protected $currencyCode;
    
    /**
     * @var string
     *
     * @ORM\Column(name="totalAmount", type="string", length=64, nullable=false)
     */
    protected $totalAmount;
    
    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=64, nullable=false)
     */
    protected $description;
    
    /**
     * @var string
     *
     * @ORM\Column(name="clientId", type="string", length=64, nullable=false)
     */
    protected $clientId;
    
    /**
     * @var string
     *
     * @ORM\Column(name="clientEmail", type="string", length=64, nullable=false)
     */
    protected $clientEmail;
    
    /**
     * @var string
     *
     * @ORM\Column(name="details", type="string", length=64, nullable=false)
     */
    //protected $details;
    
    public function setNumber($number)
    {
        $this->number = $number;
    }
    
    public function getNumber()
    {
        return $this->number;
    }
    
    public function setCurrencyCode($currencyCode)
    {
        $this->currencyCode = $currencyCode;
    }
    
    public function getCurrencyCode()
    {
        return $this->currencyCode;
    }
    
    public function setTotalAmount($totalAmount)
    {
        $this->totalAmount = $totalAmount;
    }
    
    public function getTotalAmount()
    {
        return $this->totalAmount;
    }
    
    public function setDescription($description)
    {
        $this->description = $description;
    }
    
    public function getDescription()
    {
        return $this->description;
    }
    
    public function setClientId($clientId)
    {
        $this->clientId = $clientId;
    }
    
    public function getClientId()
    {
        return $this->clientId;
    }
    
    public function setClientEmail($clientEmail)
    {
        $this->clientEmail = $clientEmail;
    }
    
    public function getClientEmail()
    {
        return $this->clientEmail;
    }
    
    /* */
    public function setDetails($details)
    {
        $this->details = $details;
    }
    
    public function getDetails()
    {
        return $this->details;
    }
    
    
    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }
    
    function getUser() {
        return $this->user;
    }

    function getPlan() {
        return $this->plan;
    }

    function setUser($user) {
        $this->user = $user;
        return $this;
    }

    function setPlan($plan) {
        $this->plan = $plan;
        return $this;
    }



}