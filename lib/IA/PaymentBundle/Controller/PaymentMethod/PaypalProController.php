<?php
namespace IA\PaymentBundle\Controller\PaymentMethod;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\Range;
use IA\PaymentBundle\Form\CreditCard as CreditCardForm;

/*
 * TEST CARDS
 * ===========

 Card Type  |	Card Number	    |  Exp. Date | CVV Code
 --------------------------------------------------------
 Visa       | 4263982640269299  |   02/2023  |  837
 Visa       | 4263982640269299  |   04/2023  |  738
 
 */
class PaypalProController extends PayumController
{
    public function testAction($planId, Request $request)
    {
        die('EHO');
    }
    
    public function indexAction()
    {
        
    }
    
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
            $storage = $this->getPayum()->getStorage( 'IA\PaymentBundle\Entity\PaymentDetails' );

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

            return $this->redirect( $captureToken->getTargetUrl() );
        }

        return $this->render('IAPaymentBundle:PaymentMethod/PaypalPro:prepare.html.twig', array(
            'form' => $form->createView(),
        ));
    }
    
    public function doneAction( Request $request )
    {
        echo 'DONE';
    }
}
