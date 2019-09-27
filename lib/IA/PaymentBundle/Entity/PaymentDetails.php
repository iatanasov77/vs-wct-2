<?php
namespace IA\PaymentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Payum\Core\Model\ArrayObject;

/**
 * @ORM\Table(name="IAP_PaymentDetails")
 * @ORM\Entity
 */
class PaymentDetails extends ArrayObject
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;
    
    /**
     * @var string
     *
     * @ORM\Column(name="paymentMethod", type="string", length=64, nullable=false)
     */
    protected $paymentMethod;

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }
    
    function getPaymentMethod() {
        return $this->paymentMethod;
    }

    function setPaymentMethod($paymentMethod) {
        $this->paymentMethod = $paymentMethod;
        return $this;
    }
    
}