<?php  namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;
use Payum\Core\Request\GetHumanStatus;

use IA\PaymentBundle\Entity\PaymentModel;
use IA\PaymentBundle\Entity\Payment;
use Symfony\Component\HttpFoundation\JsonResponse;

class StripeCheckoutController extends PayumController
{
    const GATEWAY   = 'stripe_checkout_gateway';
    
    /*
     * TEST MAIL: i.atanasov77@gmail.com
     * 
     * TEST CARDS
     * ===========
     
     Card Type  |	Card Number	    |  Exp. Date  | CVV Code
     --------------------------------------------------------
     Visa       | 4242424242424242  |   Any future| Any 3
                |                   |      date   | digits
     ---------------------------------------------------------
     Visa       | 4263982640269299  |   02/2023   |  837
     --------------------------------------------------------
     Visa       | 4263982640269299  |   04/2023   |  738
     
     */
    public function prepareAction( Request $request )
    {
        $storage = $this->getPayum()->getStorage( Payment::class );

        $ppr = $this->getDoctrine()->getRepository('IAUsersBundle:PackagePlan');
        $packagePlan = $ppr->find( $request->query->get( 'packagePlanId' ) );
        if (!$packagePlan) {
            throw new \Exception('Invalid Request!!!');
        }
        
        $payment = $storage->create();
        
        $payment->setPaymentMethod( 'stripe' );
        $payment->setPackagePlan( $packagePlan );
        
        $details    = [
            'currency'  => $packagePlan->getCurrency(),
            'amount'   => $packagePlan->getPrice(),
            'description'   => $packagePlan->getDescription()
        ];
        $payment->setDetails( $details );
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
            throw new HttpException( 400, 'The right payum gateway status is: ' . $status->getValue() );
        }
        
        return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', [
            'paymentId' => $payment->getId()
        ]));
    }
}
