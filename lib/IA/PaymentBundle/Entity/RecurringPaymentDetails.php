<?php
namespace IA\PaymentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Payum\Core\Model\ArrayObject;

/*
 CREATE TABLE IAP_AgreementDetails (id INT AUTO_INCREMENT NOT NULL, details JSON NOT NULL COMMENT '(DC2Type:json_array)', number VARCHAR(64) NOT NULL, currencyCode VARCHAR(64) NOT NULL, totalAmount VARCHAR(64) NOT NULL, description VARCHAR(64) NOT NULL, clientId VARCHAR(64) NOT NULL, clientEmail VARCHAR(64) NOT NULL, userId INT DEFAULT NULL, planId INT DEFAULT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
 */

/**
 * @ORM\Table(name="IAP_RecurringPaymentDetails")
 * @ORM\Entity
 */
class RecurringPaymentDetails extends ArrayObject
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;
    
    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
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
    
}