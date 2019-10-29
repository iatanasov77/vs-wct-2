<?php  namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;
use Payum\Core\Request\GetHumanStatus;

use IA\PaymentBundle\Entity\AgreementDetails;

class StripeCheckoutController extends PayumController
{
    public function prepareAction( $planId, Request $request )
    {
        $gatewayName = 'stripe_checkout_gateway';
        
        $storage = $this->getPayum()->getStorage( AgreementDetails::class );
     
        $ppr = $this->getDoctrine()->getRepository('IAPaidMembershipBundle:PackagePlan');
        $packagePlan = $ppr->find( $planId );
        if (!$packagePlan) {
            throw new \Exception('Invalid Request!!!');
        }
        
        /** @var PaymentDetails $details */
        $details = $storage->create();
        $details["amount"] = 100;
        $details["currency"] = 'USD';
        $details["description"] = 'a description';
        
        $details->setPaymentMethod( 'stripe' );
        $details->setPlan( $packagePlan );
        
        $details->setNumber( uniqid() );
        $details->setCurrencyCode( 'EUR' );
        $details->setTotalAmount( 123 ); // 1.23 EUR
        $details->setDescription( 'A description' );
        $details->setClientId( 'anId' );
        $details->setClientEmail( 'sb-wsp2g401218@personal.example.com' );
        
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
