<?php namespace App\Entity\UsersSubscriptions;

use Doctrine\ORM\Mapping as ORM;
use Vankosoft\UsersSubscriptionsBundle\Model\PaymentDetails as PaymentDetailsBase;

/**
 * @ORM\Table(name="VSPAY_PaymentDetails")
 * @ORM\Entity
 */
class PaymentDetails extends PaymentDetailsBase
{
    
}