<?php namespace IA\PaymentBundle\Controller\PaymentMethod;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Request\Cancel;
use Payum\Core\Security\GenericTokenFactoryInterface;
use Payum\Paypal\ExpressCheckout\Nvp\Request\Api\CreateRecurringPaymentProfile;
use Payum\Paypal\ExpressCheckout\Nvp\Api;
use Payum\Core\Request\Sync;
use Payum\Core\Request\GetHumanStatus;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

use Payum\Core\Model\Payment;

use IA\PaymentBundle\Entity\PaymentDetails;
use IA\PaymentBundle\Entity\AgreementDetails;
use IA\PaymentBundle\Entity\RecurringPaymentDetails;

/*
 * TEST ACCOUNTS
 * -----------------------------------------------
 * sb-wsp2g401218@personal.example.com / 8o?JWT#6
 */
class PaypalExpressCheckoutController extends PayumController
{

    public function prepareAction( $planId, Request $request )
    {
        $gatewayName = 'paypal_express_checkout_recurring_payment';
        //$gatewayName = 'paypal';
        //$gatewayName = 'offline';
        
        $ppr = $this->getDoctrine()->getRepository('IAPaidMembershipBundle:PackagePlan');
        $packagePlan = $ppr->find( $planId );
        if ( ! $packagePlan ) {
            throw new \Exception('Invalid Request!!!');
        }

        if ( $request->isMethod( 'POST' ) ) {
            
            $payum          = $this->getPayum();
            //$storage = $payum->getStorage( Payment::class );
            $storage = $payum->getStorage( PaymentDetails::class );

            /** @var $agreement AgreementDetails */
            $payment = $storage->create();
            
            /* */
            $payment->setPaymentMethod( 'paypal_express_checkout' );
            $payment->setPackagePlan( $packagePlan );
            
            $details    = [
                'PAYMENTREQUEST_0_AMT'          => $packagePlan->getPrice(),
                'PAYMENTREQUEST_0_CURRENCYCODE' => $packagePlan->getCurrency(),
                'PAYMENTREQUEST_0_DESC'         => $packagePlan->getDescription(),
                'NOSHIPPING'                    => 1
            ];
            $payment->setDetails( $details );
            
            
            //$agreement['RETURNURL'] = $captureToken->getTargetUrl();
            //$agreement['CANCELURL'] = $captureToken->getTargetUrl();
            //$agreement['INVNUM'] = $agreement->getId();
            $storage->update( $payment );
            
            $captureToken = $payum->getTokenFactory()->createCaptureToken(
                    $gatewayName, $payment, 'ia_payment_paypal_express_checkout_create_recurring_payment'
            );
            $captureToken->setTargetUrl( $this->generateUrl( 'ia_payment_paypal_express_checkout_create_recurring_payment_capture', ['payum_token' => $captureToken->getHash()] ) );
            //var_dump( $captureToken ); die;
            //return $this->redirect( $this->generateUrl( 'ia_payment_paypal_express_checkout_create_recurring_payment_capture', ['token' => 'my-blog-post'] ) . "?payum_token=" . $captureToken->getHash() );
            return $this->redirect($captureToken->getTargetUrl());
        }

        $tplVars = array(
            'packagePlan' => $packagePlan,
            'gatewayName' => $gatewayName
        );
        return $this->render('IAPaymentBundle:PaymentMethod/PaypalExpressCheckout:createAgreement.html.twig', $tplVars);
    }

    public function doneAction( Request $request )
    {
        $token      = $this->getPayum()->getHttpRequestVerifier()->verify( $request );
        $gateway    = $this->getPayum()->getGateway( $token->getGatewayName() );
        $status     = new GetHumanStatus( $token );
        
        $gateway->execute( $status );
      
        //var_dump( $agreementStatus->getValue() ); die;
        // var_dump( $agreementStatus->isCaptured() ); die;
        if ( false == $status->isPending() ) {
        //if ( false == $agreementStatus->isCaptured() ) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }

        $payment        = $status->getModel();

        return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', ['paymentId' => $payment->getId()] ) );
    }

    public function cancelAction( Request $request )
    {
        $token = $this->getPayum()->getHttpRequestVerifier()->verify($request);
        $this->getPayum()->getHttpRequestVerifier()->invalidate($token);

        $gateway = $this->getPayum()->getGateway($token->getGatewayName());

        $gateway->execute( new Cancel( $payment ) );
        $gateway->execute( new Sync( $payment ) );
        
        $status = new GetHumanStatus($token);
        $gateway->execute($status);
        if (false == $status->isCaptured()) {
            throw new HttpException(400, 'The model status must be success.');
        }
        if (false == $status->getModel() instanceof RecurringPaymentDetails) {
            throw new HttpException(400, 'The model associated with token not a recurring payment one.');
        }

        /** @var RecurringPaymentDetails $payment */
        $payment = $status->getFirstModel();

        

        return $this->redirect($token->getAfterUrl());
    }
}
