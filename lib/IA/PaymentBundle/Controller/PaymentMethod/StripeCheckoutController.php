<?php  namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;
use Payum\Core\Request\GetHumanStatus;

use IA\PaymentBundle\Entity\PaymentModel;
use Symfony\Component\HttpFoundation\JsonResponse;

class StripeCheckoutController extends PayumController
{
    public function prepareAction( Request $request )
    {
        $gatewayName = 'stripe_checkout_gateway';
        
        $storage = $this->getPayum()->getStorage( PaymentModel::class );
     
        $ppr = $this->getDoctrine()->getRepository('IAPaidMembershipBundle:PackagePlan');
        $packagePlan = $ppr->find( $request->query->get( 'packagePlanId' ) );
        if (!$packagePlan) {
            throw new \Exception('Invalid Request!!!');
        }
        
        /** @var PaymentDetails $details */
        $payment = $storage->create();
   
        $payment->setPaymentMethod( 'stripe' );
        $payment->setPackagePlan( $packagePlan );
        
        $payment->setNumber( uniqid() );
        $payment->setCurrencyCode( $packagePlan->getCurrency() );
        $payment->setTotalAmount( $packagePlan->getPrice() );
        $payment->setDescription( $packagePlan->getDescription() );
        $payment->setClientId( 'anId' );
        $payment->setClientEmail( 'foo@example.com' );
        
        $storage->update( $payment );
        
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
        
        $status = new GetHumanStatus( $token );
        $gateway->execute( $status );
        $payment = $status->getFirstModel();
        
        if ( ! $status->isCaptured() ) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }
        
        return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', [
            'paymentId' => $payment->getId()
        ]));
    }
}
