<?php  namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;
use Payum\Core\Request\GetHumanStatus;

use IA\PaymentBundle\Entity\PaymentModel;
use IA\PaymentBundle\Entity\PaymentDetails;
use Symfony\Component\HttpFoundation\JsonResponse;

class StripeCheckoutController extends PayumController
{
    const GATEWAY   = 'stripe_checkout_gateway';
    
    public function prepareAction( Request $request )
    {
        $storage = $this->getPayum()->getStorage( PaymentDetails::class );
        //$storage = $this->getPayum()->getStorage( PaymentModel::class );
     
        $ppr = $this->getDoctrine()->getRepository('IAUsersBundle:PackagePlan');
        $packagePlan = $ppr->find( $request->query->get( 'packagePlanId' ) );
        if (!$packagePlan) {
            throw new \Exception('Invalid Request!!!');
        }
        
        $payment = $storage->create();
        
        $payment->setType( PaymentDetails::TYPE_PAYMENT );
        $payment->setPaymentMethod( 'stripe' );
        $payment->setPackagePlan( $packagePlan );
        
//         $payment->setNumber( uniqid() );
//         $payment->setCurrencyCode( $packagePlan->getCurrency() );
//         $payment->setTotalAmount( $packagePlan->getPrice() );
//         $payment->setDescription( $packagePlan->getDescription() );
//         $payment->setClientId( 'anId' );
//         $payment->setClientEmail( 'foo@example.com' );

        $payment['number']          = uniqid();
        $payment['currencyCode']    = $packagePlan->getCurrency();
        $payment['totalAmount']     = $packagePlan->getPrice();
        $payment['description']     = $packagePlan->getDescription();
        $payment['clientId']        = 'anId';
        $payment['clientEmail']     = 'foo@example.com';
        
        $storage->update( $payment );
        
        $captureToken = $this->get( 'payum' )->getTokenFactory()->createCaptureToken(
            self::GATEWAY,
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
        $payment = $status->getModel();
        
        if ( ! $status->isCaptured() ) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }
        
        return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', [
            'paymentId' => $payment->getId()
        ]));
    }
}
