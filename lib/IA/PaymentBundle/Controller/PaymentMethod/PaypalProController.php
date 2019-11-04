<?php namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\Range;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;

use IA\PaymentBundle\Form\CreditCard as CreditCardForm;
use IA\PaymentBundle\Entity\PaymentDetails;

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
    const GATEWAY   = 'paypal_pro_checkout_gateway';
    
    public function prepareAction( Request $request )
    {
        $ppr = $this->getDoctrine()->getRepository( 'IAUsersBundle:PackagePlan' );
        
        $packagePlanId  = $request->query->get( 'packagePlanId' );
        $packagePlan = $ppr->find( $packagePlanId );
        if ( ! $packagePlan ) {
            throw new \Exception('Invalid Request!!!');
        }
        
        $form = $this->createForm( CreditCardForm::class, null, [
            'action' => $this->generateUrl( 'ia_payment_paypal_prepare' ) . "?packagePlanId=" . $request->query->get( 'packagePlanId' ),
            'method' => 'POST',
        ]);
        
        $form->handleRequest( $request );
        if ( $form->isSubmitted() ) {
            $data = $form->getData();
            $storage = $this->getPayum()->getStorage( PaymentDetails::class );

            $payment = $storage->create();
            
            $payment->setType( PaymentDetails::TYPE_PAYMENT );
            $payment->setPaymentMethod( 'paypal_express_checkout_recurring_payment' );
            $payment->setPackagePlan( $packagePlan );
            
            $payment['ACCT']        = new SensitiveValue( $data['acct'] );
            $payment['CVV2']        = new SensitiveValue( $data['cvv'] );
            $payment['EXPDATE']     = new SensitiveValue( $data['exp_date']->format( 'my' ) );
            $payment['AMT']         = number_format( $data['amt'], 2 );   // Amount
            $payment['CURRENCY']    = $data['currency'];
            $payment->setPaymentMethod( 'paypal_pro_checkout_credit_card' );
            $storage->update($payment);

            $captureToken = $this->getPayum()->getTokenFactory()->createCaptureToken(
                self::GATEWAY,
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
        $storage = $this->getPayum()->getStorage( PaymentDetails::class );
        $payment = $storage->create();
        $storage->update( $payment );
        
        $captureToken = $this->getPayum()->getTokenFactory()->createCaptureToken( self::GATEWAY, $payment, 'create_recurring_payment.php' );
        
        return $this->redirect( $captureToken->getTargetUrl() );
    }
}
