<?php namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Request\GetHumanStatus;

/*
 * TEST ACCOUNTS
 * -----------------------------------------------
 * sb-wsp2g401218@personal.example.com / 8o?JWT#6
 */
class PaypalExpressCheckoutController extends PayumController
{   
    const GATEWAY   = 'paypal_express_checkout_gateway';
    
    public function prepareAction( Request $request )
    {
        $ppr = $this->getDoctrine()->getRepository( 'IAUsersBundle:PackagePlan' );
        
        $packagePlan = $ppr->find( $request->query->get( 'packagePlanId' ) );
        if ( ! $packagePlan ) {
            throw new \Exception( 'Invalid Request!!!' );
        }

        if ( $request->isMethod( 'POST' ) ) {
            $pb         = $this->get( 'ia_payment_builder' );
            $payment    = $pb->buildPayment( $this->getUser(), $packagePlan );
            $divisor    = $pb->getCurrencyDivisor( $packagePlan->getCurrency() );
            
            $payment->setPaymentMethod( 'paypal_express_checkout_NOT_recurring_payment' );
            $payment->setDetails([
                'PAYMENTREQUEST_0_AMT'          => $packagePlan->getPrice() * $divisor,
                'PAYMENTREQUEST_0_CURRENCYCODE' => $packagePlan->getCurrency(),
                'PAYMENTREQUEST_0_DESC'         => $packagePlan->getDescription(),
                'NOSHIPPING'                    => 1
            ]);
            $pb->updateStorage( $payment );
            
            $captureToken = $this->getPayum()->getTokenFactory()->createCaptureToken(
                self::GATEWAY, 
                $payment,
                'ia_payment_paypal_express_checkout_done'
            );
            
            return $this->redirect( $captureToken->getTargetUrl() );
        }

        $tplVars = array(
            'formAction'    => $this->generateUrl( 'ia_payment_paypal_express_checkout_prepare' ) . '?packagePlanId=' . $packagePlan->getId(),
            'packagePlan'   => $packagePlan
        );
        return $this->render('IAPaymentBundle:PaymentMethod/PaypalExpressCheckout:CheckoutForm.html.twig', $tplVars);
    }

    public function doneAction( Request $request )
    {
        $token      = $this->getPayum()->getHttpRequestVerifier()->verify( $request );
        
        // you can invalidate the token. The url could not be requested any more.
        $this->getPayum()->getHttpRequestVerifier()->invalidate( $token );
        
        $gateway    = $this->getPayum()->getGateway( $token->getGatewayName() );
        $status     = new GetHumanStatus( $token );
        
        $gateway->execute( $status );
        //if ( ! $status->isPending() ) {
        if ( ! $status->isCaptured() ) {
            throw new HttpException( 400, 'The right payum gateway status is: ' . $status->getValue() );
        }
        $payment        = $status->getFirstModel();

        return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', ['paymentId' => $payment->getId()] ) );
    }
}
