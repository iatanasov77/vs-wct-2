<?php namespace IA\PaymentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Payum\Core\Model\Payment as BasePayment;
use IA\UsersBundle\Entity\PackagePlan;

/**
 * @ORM\Table(name="IAP_Payments")
 * @ORM\Entity
 */
class Payment extends BasePayment
{
    
    
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;
    
    /**
     * 
     * @ORM\ManyToOne(targetEntity="IA\UsersBundle\Entity\PackagePlan", inversedBy="payments")
     * @ORM\JoinColumn(name="packagePlanId", referencedColumnName="id")
     */
    protected $packagePlan;
    
    /**
     * @var string
     *
     * @ORM\Column(name="paymentMethod", type="string", length=64, nullable=false)
     */
    protected $paymentMethod;
    
    /**
     * @var float
     *
     * @ORM\Column(name="amount", type="float", columnDefinition="DECIMAL(6, 2)", nullable=false)
     */
    protected $amount;

    public function getTotalAmount()
    {
        //return $this->amount;
        return $this->totalAmount;
    }
    
    public function getAmount()
    {
        return $this->amount;
    }
    
    public function setAmount($amount)
    {
        $this->amount = $amount;
        
        return $this;
    }
    
    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }
    
    public function getPackagePlan()
    {
        return $this->packagePlan;
    }
    
    public function setPackagePlan( PackagePlan $packagePlan )
    {
        $this->packagePlan = $packagePlan;
        
        return $this;
    }
    
    public function getPaymentMethod()
    {
        return $this->paymentMethod;
    }

    public function setPaymentMethod($paymentMethod)
    {
        $this->paymentMethod = $paymentMethod;
        return $this;
    }
    
    /* 
     * @NOTE Not need i think but see more on Payum\Core\Model\ArrayObject
     */
    public function setDetails($details)
    {
        $this->details = $details;
    }
    
    /*
     * @NOTE Not need i think but see more on Payum\Core\Model\ArrayObject
     */
    public function getDetails()
    {
        return $this->details;
    }
}