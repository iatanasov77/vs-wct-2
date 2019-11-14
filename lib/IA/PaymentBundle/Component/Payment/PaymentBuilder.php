<?php namespace IA\PaymentBundle\Component\Payment;

use Payum\Core\Payum;

use IA\PaymentBundle\Entity\Agreement;
use IA\PaymentBundle\Entity\Payment;

class PaymentBuilder
{
    private $payum;
    private $storage;
    
    public function __construct( Payum $payum )
    {
        $this->payum   = $payum;
    }
    
    public function updateStorage( $model )
    {
        $this->storage->update( $model );
    }
    
    public function buildAgreement( $user, $packagePlan ) 
    {
        $this->storage = $this->payum->getStorage( Agreement::class );
        
        /** @var $agreement AgreementDetails */
        $agreement = $this->storage->create();
        
        $agreement->setPackagePlan( $packagePlan );
        
        return $agreement;
    }
    
    public function buildPayment( $user, $packagePlan )
    {
        $this->storage = $this->payum->getStorage( Payment::class );
        
        $payment = $this->storage->create();
        
        $payment->setPaymentMethod( 'paypal_express_checkout_recurring_payment' );
        $payment->setPackagePlan( $packagePlan );
        // number_format( $packagePlan->getPrice(), 2, ',', '' )
        $payment->setNumber( uniqid() );
        $payment->setCurrencyCode( $packagePlan->getCurrency() );
        $payment->setTotalAmount( $packagePlan->getPrice() );
        $payment->setDescription( $packagePlan->getCurrency() );
        $payment->setClientId( $user->getId() );
        $payment->setClientEmail( $user->getEmail() );
        
        return $payment;
    }
}
