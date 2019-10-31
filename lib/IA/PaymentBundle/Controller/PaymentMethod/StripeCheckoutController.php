<?php  namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;
use Payum\Core\Request\GetHumanStatus;

use IA\PaymentBundle\Entity\PaymentDetails;

class StripeCheckoutController extends PayumController
{
    public function prepareAction( $planId, Request $request )
    {
        $gatewayName = 'stripe_checkout_gateway';
        
        $storage = $this->getPayum()->getStorage( PaymentDetails::class );
     
        $ppr = $this->getDoctrine()->getRepository('IAPaidMembershipBundle:PackagePlan');
        $packagePlan = $ppr->find( $planId );
        if (!$packagePlan) {
            throw new \Exception('Invalid Request!!!');
        }
        
        /** @var PaymentDetails $details */
        $payment = $storage->create();
   
        $payment->setPaymentMethod( 'stripe' );
        $payment->setPackagePlan( $packagePlan );
        
        $details    = [
            'amount'        => $packagePlan->getPrice(),
            'currency'      => $packagePlan->getCurrency(),
            'description'   => $packagePlan->getDescription(),
            'NOSHIPPING'    => 1
        ];
        //$payment->setDetails( $details );
        
        $storage->update($payment);
        
        $captureToken = $this->get( 'payum' )->getTokenFactory()->createCaptureToken(
            $gatewayName,
            $payment,
            'ia_payment_stripe_checkout_done' // the route to redirect after capture;
        );
        
        return $this->redirect( $captureToken->getTargetUrl() );
    }
    
    public function doneAction( Request $request )
    {
        $token = $this->getPayum()->getHttpRequestVerifier()->verify( $request );
        
        $gateway = $this->getPayum()->getGateway( $token->getGatewayName() );
        
        $agreementStatus = new GetHumanStatus( $token );
        $gateway->execute( $agreementStatus );
        if ( false == $agreementStatus->isCaptured() ) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }
        
        $agreement = $agreementStatus->getModel();
        $packagePlan = $agreement->getPlan();
        
        return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', [
            'paymentId' => $packagePlan->getId()
        ]));
    }
}
