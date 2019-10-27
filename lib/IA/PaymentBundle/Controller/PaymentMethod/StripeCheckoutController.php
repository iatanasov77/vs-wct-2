<?php  namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;

class StripeCheckoutController extends PayumController
{
    public function prepareAction( Request $request )
    {
        $gatewayName = 'stripe_checkout_gateway';
        
        $storage = $this->getPayum()->getStorage( 'IA\PaymentBundle\Entity\PaymentDetails' );
        
        /** @var PaymentDetails $details */
        $details = $storage->create();
        $details["amount"] = 100;
        $details["currency"] = 'USD';
        $details["description"] = 'a description';
        $details->setPaymentMethod( 'stripe' );
        $storage->update($details);
        
        $captureToken = $this->get( 'payum' )->getTokenFactory()->createCaptureToken(
            $gatewayName,
            $details,
            'ia_payment_stripe_checkout_done' // the route to redirect after capture;
        );
        
        return $this->redirect( $captureToken->getTargetUrl() );
    }
    
    public function doneAction( Request $request )
    {
        echo 'DONE';
    }
}
