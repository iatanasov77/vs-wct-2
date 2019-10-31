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
class PaypalExpressCheckoutRecurringController extends PayumController
{

    public function prepareAction( $planId, Request $request )
    {
        $gatewayName = 'paypal_express_checkout_recurring_payment';
        
        $ppr = $this->getDoctrine()->getRepository('IAPaidMembershipBundle:PackagePlan');
        $packagePlan = $ppr->find( $planId );
        if ( ! $packagePlan ) {
            throw new \Exception('Invalid Request!!!');
        }
        
        if ( $request->isMethod( 'POST' ) ) {
            
            $payum          = $this->getPayum();
            $storage = $payum->getStorage( AgreementDetails::class );

            /** @var $agreement AgreementDetails */
            $payment = $storage->create();
            
            $details    = [
                'PAYMENTREQUEST_0_AMT'          => 0,
                'L_BILLINGTYPE0'                => Api::BILLINGTYPE_RECURRING_PAYMENTS,
                'L_BILLINGAGREEMENTDESCRIPTION0'=> "Insert some description here",
                'NOSHIPPING'                    => 1
            ];
            $payment->setDetails( $details );
            
            $storage->update( $payment );
            
            $captureToken = $payum->getTokenFactory()->createCaptureToken(
                    $gatewayName, $payment, 'ia_payment_paypal_express_checkout_create_recurring_payment'
            );
            
            
            //$captureToken->setTargetUrl( $this->generateUrl( 'ia_payment_paypal_express_checkout_create_recurring_payment_capture', ['payum_token' => $captureToken->getHash()] ) );
            $storage->update( $payment );
            
            return $this->redirect($captureToken->getTargetUrl());
        }

        $tplVars = array(
            'packagePlan' => $packagePlan,
            'gatewayName' => $gatewayName
        );
        return $this->render('IAPaymentBundle:PaymentMethod/PaypalExpressCheckout:createAgreement.html.twig', $tplVars);
    }

    public function createRecurringPaymentAction( Request $request )
    {
        $token          = $this->getPayum()->getHttpRequestVerifier()->verify( $request );
        $this->getPayum()->getHttpRequestVerifier()->invalidate( $token );
        $gatewayName    = $token->getGatewayName();
        
        $gateway        = $this->getPayum()->getGateway( $token->getGatewayName() );
        $status         = new GetHumanStatus( $token );
        
        $gateway->execute( $status );
        
        
        if ( ! $status->isCaptured() ) {
            //if ( false == $agreementStatus->isCaptured() ) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }
        
        $payment        = $status->getModel();
        //var_dump( $status->getModel() ); die;
        
        
        
        $storage    = $this->getPayum()->getStorage( RecurringPaymentDetails::class );
        
        $recurringPayment = $storage->create();
        $recurringPayment['TOKEN'] = $payment['TOKEN'];
        $recurringPayment['DESC']   = $payment['L_BILLINGAGREEMENTDESCRIPTION0']; // Desc must match agreement 'L_BILLINGAGREEMENTDESCRIPTION' in prepare.php
        $recurringPayment['EMAIL'] = $payment['EMAIL'];
        $recurringPayment['AMT'] = 0.05;
        $recurringPayment['CURRENCYCODE'] = 'USD';
        $recurringPayment['BILLINGFREQUENCY'] = 7;
        $recurringPayment['PROFILESTARTDATE'] = date(DATE_ATOM);
        $recurringPayment['BILLINGPERIOD'] = Api::BILLINGPERIOD_DAY;
        
        $gateway->execute(new CreateRecurringPaymentProfile($recurringPayment));
        $gateway->execute(new Sync($recurringPayment));
        
        /*
         IF THERE IS AN ERROR ON EXECUTE THE GATEWA SET THISE FIELDS
         =============================================================
         [ACK]	"Failure"	
        [VERSION]	"65.1"	
        [BUILD]	"53779744"	
        [L_ERRORCODE0]	"11581"	
        [L_SHORTMESSAGE0]	"Invalid Data"	
        [L_LONGMESSAGE0]	"Profile description is invalid"	
        [L_SEVERITYCODE0]	"Error"	

         */
        
        $doneToken = $this->getPayum()->getTokenFactory()->createToken( $gatewayName, $recurringPayment, 'ia_payment_paypal_express_checkout_done_recurring_payment');
        return $this->redirect($doneToken->getTargetUrl());
        
        //return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', ['paymentId' => $payment->getId()] ) );
    }
    
    public function doneAction( Request $request )
    {
        $token      = $this->getPayum()->getHttpRequestVerifier()->verify( $request );
        //$this->getPayum()->getHttpRequestVerifier()->invalidate( $token );
        
        $gateway    = $this->getPayum()->getGateway( $token->getGatewayName() );
        $status     = new GetHumanStatus( $token );
        
        $gateway->execute( $status );
      
        
        if ( ! $status->isCaptured() ) {
        //if ( false == $agreementStatus->isCaptured() ) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }

        $payment        = $status->getModel();
        
        
        
        
        $storage    = $this->getPayum()->getStorage( RecurringPaymentDetails::class );
        
        $recurringPayment = $storage->create();
        $recurringPayment['TOKEN'] = $agreement['TOKEN'];
        $recurringPayment['DESC'] = 'Subscribe to weather forecast for a week. It is 0.05$ per day.'; // Desc must match agreement 'L_BILLINGAGREEMENTDESCRIPTION' in prepare.php
        $recurringPayment['EMAIL'] = $agreement['EMAIL'];
        $recurringPayment['AMT'] = 0.05;
        $recurringPayment['CURRENCYCODE'] = 'USD';
        $recurringPayment['BILLINGFREQUENCY'] = 7;
        $recurringPayment['PROFILESTARTDATE'] = date(DATE_ATOM);
        $recurringPayment['BILLINGPERIOD'] = Api::BILLINGPERIOD_DAY;
        
        $gateway->execute(new CreateRecurringPaymentProfile($recurringPayment));
        $gateway->execute(new Sync($recurringPayment));
        
        $doneToken = $payum->getTokenFactory()->createToken( $token->getGatewayName(), $recurringPayment, 'done.php' );
        
        
        
        
        
        
        

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
