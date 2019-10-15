<?php
namespace IA\PaymentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Payum\Core\Model\ArrayObject;

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
    
    //protected $paymentId;

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