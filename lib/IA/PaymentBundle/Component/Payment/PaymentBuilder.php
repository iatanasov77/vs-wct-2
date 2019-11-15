<?php namespace IA\PaymentBundle\Component\Payment;

use Payum\Core\Payum;
use Payum\Core\Request\GetCurrency;

use IA\PaymentBundle\Entity\Agreement;
use IA\PaymentBundle\Entity\Payment;

/*
 * When execute action Payum\Paypal\ExpressCheckout\Nvp\Action\ConvertPaymentAction
 * price is divided by divisor
 *
 * zaradi tova prawq integer umnojen po divisor
 */

class PaymentBuilder
{
    private $payum;
    private $storage;
    
    /*
     * Currency divisor is hardcoded in this var since i dont know how to get it
     */
    private $currencyDivisor    = 100;
    
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
        
        $payment    = $this->storage->create();
        $divisor    = $this->getCurrencyDivisor( $packagePlan->getCurrency() );
        
        $payment->setPackagePlan( $packagePlan );
        $payment->setNumber( uniqid() );
        $payment->setCurrencyCode( $packagePlan->getCurrency() );
        $payment->setTotalAmount( $packagePlan->getPrice() * $divisor );
        $payment->setDescription( $packagePlan->getCurrency() );
        $payment->setClientId( $user->getId() );
        $payment->setClientEmail( $user->getEmail() );
        
        $payment->setAmount( $packagePlan->getPrice() );
        
        return $payment;
    }
    
    public function getCurrencyDivisor( $currencyCode )
    {
//         $currency = new GetCurrency( $currencyCode );
        
//         return pow( 10, $currency->exp );

        // Currency divisor is hardcoded in this var since i dont know how to get it
        return $this->currencyDivisor;
        
    }
}
