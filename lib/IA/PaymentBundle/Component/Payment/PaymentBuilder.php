<?php namespace IA\PaymentBundle\Component\Payment;

use Payum\Core\Payum;

use IA\PaymentBundle\Entity\PaymentModel;

class PaymentBuilder
{
    private $payum;
    
    public function __construct( Payum $payum )
    {
        $this->payum   = $payum;
    }
    
    public function build( $user, $packagePlan ) 
    {
        $storage = $this->payum->getStorage( PaymentModel::class );
        
        /** @var $agreement AgreementDetails */
        $payment = $storage->create();
        
        $payment->setType( PaymentDetails::TYPE_AGREEMENT );
        $payment->setPaymentMethod( 'paypal_express_checkout_recurring_payment' );
        $payment->setPackagePlan( $packagePlan );
        
        $payment->setNumber( uniqid() );
        $payment->setCurrencyCode( $packagePlan->getCurrency() );
        $payment->setTotalAmount( $packagePlan->getPrice() );
        $payment->setDescription( $packagePlan->getCurrency() );
        $payment->setClientId( $this->getUser()->getId() );
        $payment->setClientEmail( $this->getUser()->getEmail() );
        
        return $payment;
    }
}
