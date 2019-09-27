<?php
namespace IA\PaymentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Payum\Core\Model\Token;

/**
 * @ORM\Table(name="IAP_PaymentTokens")
 * @ORM\Entity
 */
class PaymentToken extends Token
{
}
