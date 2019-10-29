<?php namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\Range;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;

use IA\PaymentBundle\Form\CreditCard as CreditCardForm;
use IA\PaymentBundle\Entity\AgreementDetailsDetails;

/*
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

// https://github.com/Payum/Payum/blob/master/docs/symfony/custom-purchase-examples/paypal-pro-checkout.md

class PaypalProController extends PayumController
{
    public function prepareAction($planId, Request $request)
    {
        $gatewayName = 'paypal_pro_checkout_credit_card';

        $form = $this->createForm( CreditCardForm::class, null, [
            'action' => $this->generateUrl( 'ia_payment_paypal_prepare', ['planId' => $planId] ),
            'method' => 'POST',
        ]);
        
        $form->handleRequest( $request );
        if ( $form->isSubmitted() ) {
            $data = $form->getData();
            $storage = $this->getPayum()->getStorage( AgreementDetailsDetails::class );

            $payment = $storage->create();
            $payment['ACCT']        = new SensitiveValue( $data['acct'] );
            $payment['CVV2']        = new SensitiveValue( $data['cvv'] );
            $payment['EXPDATE']     = new SensitiveValue( $data['exp_date']->format( 'my' ) );
            $payment['AMT']         = number_format( $data['amt'], 2 );   // Amount
            $payment['CURRENCY']    = $data['currency'];
            $payment->setPaymentMethod( 'paypal_pro_checkout_credit_card' );
            $storage->update($payment);

            $captureToken = $this->getPayum()->getTokenFactory()->createCaptureToken(
                $gatewayName,
                $payment,
                'ia_payment_paypal_done'
            );
            //$captureToken->setTargetUrl( $this->generateUrl( 'ia_payment_paypal_capture', ['payum_token' => $captureToken->getHash()] ) );
            
            return $this->redirect( $captureToken->getTargetUrl() );
        }

        return $this->render('IAPaymentBundle:PaymentMethod/PaypalPro:prepare.html.twig', array(
            'form' => $form->createView(),
        ));
    }
    
    public function captureAction(Request $request)
    {
        $payum          = $this->getPayum();
        
        /** @var \Payum\Core\Payum $payum */
        $token = $payum->getHttpRequestVerifier()->verify( $request );
        
        $gateway = $payum->getGateway( $token->getGatewayName() );
        
        $agreementStatus = new GetHumanStatus( $token );
        $gateway->execute( $agreementStatus );
        // var_dump( $agreementStatus->isCaptured() ); die;
        
        if ( false == $agreementStatus->isPending() ) {
            //if ( false == $agreementStatus->isCaptured() ) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }
        
        
        
        /** @var \Payum\Core\GatewayInterface $gateway */
        if ($reply = $gateway->execute( new Capture($token), true)) {
            if ($reply instanceof HttpRedirect) {
                header("Location: ".$reply->getUrl());
                die();
            }
            
            throw new \LogicException( 'Unsupported reply', null, $reply );
        }
        
        /** @var \Payum\Core\Payum $payum */
        //$payum->getHttpRequestVerifier()->invalidate($token);
        
        return $this->redirect( $token->getAfterUrl() );
    }
    
    public function doneAction( Request $request )
    {
        $gatewayName = 'paypal_pro_checkout_credit_card';
        
        $payum  = $this->getPayum();
        
        /** @var \Payum\Core\Payum $payum */
        $storage = $payum->getStorage( AgreementDetailsDetails::class );
        
        $payment = $storage->create();
        $storage->update( $payment );
        
        $captureToken = $payum->getTokenFactory()->createCaptureToken( $gatewayName, $payment, 'create_recurring_payment.php' );
        
        return $this->redirect( $captureToken->getTargetUrl() );
    }
}
