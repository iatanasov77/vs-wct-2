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
use IA\PaymentBundle\Entity\PaymentModel;
use IA\UsersBundle\Entity\UserActivity;

use IA\PaymentBundle\Component\PaymentBuilder;

/*
 * TEST ACCOUNTS
 * -----------------------------------------------
 * sb-wsp2g401218@personal.example.com / 8o?JWT#6
 */
class PaypalExpressCheckoutRecurringController extends PayumController
{

    const GATEWAY   = 'paypal_express_checkout_gateway';
    
    public function prepareAction( Request $request )
    {
        $ppr = $this->getDoctrine()->getRepository( 'IAUsersBundle:PackagePlan' );
        
        $packagePlanId  = $request->query->get( 'packagePlanId' );
        $packagePlan = $ppr->find( $packagePlanId );
        if ( ! $packagePlan ) {
            throw new \Exception('Invalid Request!!!');
        }
        
        if ( $request->isMethod( 'POST' ) ) {
            
            $pb         = $this->get('ia_payment_builder');
            $agreement    = $pb->buildAgreement( $this->getUser(), $packagePlan );
            
            $agreement->setPaymentMethod( 'paypal_express_checkout_recurring_payment' );
            $agreement->setDetails([
                'PAYMENTREQUEST_0_AMT'          => 0,
                'L_BILLINGTYPE0'                => Api::BILLINGTYPE_RECURRING_PAYMENTS,
                'L_BILLINGAGREEMENTDESCRIPTION0'=> $packagePlan->getDescription(),
                'NOSHIPPING'                    => 1
            ]);
            $pb->updateStorage( $agreement );
            
            $captureToken = $this->getPayum()->getTokenFactory()->createCaptureToken(
                self::GATEWAY, $agreement, 
                'ia_payment_paypal_express_checkout_create_recurring_payment',
                ['packagePlanId' => $packagePlanId]
            );
            
            $pb->updateStorage( $agreement );
            
            return $this->redirect($captureToken->getTargetUrl());
        }

        $tplVars = array(
            'packagePlan' => $packagePlan,
            'gatewayName' => self::GATEWAY
        );
        return $this->render('IAPaymentBundle:PaymentMethod/PaypalExpressCheckout:createAgreement.html.twig', $tplVars);
    }

    public function createRecurringPaymentAction( $packagePlanId, Request $request )
    {
        $ppr = $this->getDoctrine()->getRepository('IAUsersBundle:PackagePlan');
        
        $packagePlan = $ppr->find( $packagePlanId );
        if ( ! $packagePlan ) {
            throw new \Exception('Invalid Request!!!');
        }
        
        $token          = $this->getPayum()->getHttpRequestVerifier()->verify( $request );
        $this->getPayum()->getHttpRequestVerifier()->invalidate( $token );
        $gatewayName    = $token->getGatewayName();
        
        $gateway        = $this->getPayum()->getGateway( $token->getGatewayName() );
        $status         = new GetHumanStatus( $token );
        
        $gateway->execute( $status );
        
        if ( ! $status->isCaptured() && ! $status->isPending() ) {
            throw new HttpException( 400, 'Billing agreement status is not success.' );
        }
        
        $agreement  = $status->getModel();
        
        $pb         = $this->get( 'ia_payment_builder' );
        $payment    = $pb->buildPayment( $this->getUser(), $packagePlan );
        
        $payment->setPaymentMethod( 'paypal_express_checkout_recurring_payment' );
        $payment->setDetails([
            'TOKEN'             => $agreement['TOKEN'],
            'DESC'              => $agreement['L_BILLINGAGREEMENTDESCRIPTION0'],
            'EMAIL'             => $agreement['EMAIL'],
            'AMT'               => $packagePlan->getPrice(),
            'CURRENCYCODE'      => $packagePlan->getCurrency(),
            'BILLINGFREQUENCY'  => 1,
            'PROFILESTARTDATE'  => date( DATE_ATOM ),
            'BILLINGPERIOD'     => $packagePlan->getPlan()->getSubscriptionPeriod()
        ]);
        $pb->updateStorage( $payment );
        
        $gateway->execute( new CreateRecurringPaymentProfile( $payment ) );
        $gateway->execute( new Sync( $payment ) );
        
        /*
         IF THERE IS AN ERROR ON EXECUTE THE GATEWAY SET THISE FIELDS
         =============================================================
         [ACK]	"Failure"	
        [VERSION]	"65.1"	
        [BUILD]	"53779744"	
        [L_ERRORCODE0]	"11581"	
        [L_SHORTMESSAGE0]	"Invalid Data"	
        [L_LONGMESSAGE0]	"Profile description is invalid"
        [L_SEVERITYCODE0]	"Error"	

         */
        
        $doneToken = $this->getPayum()->getTokenFactory()->createToken( $gatewayName, $payment, 'ia_payment_paypal_express_checkout_done_recurring_payment' );
        
        return $this->redirect( $doneToken->getTargetUrl() );
    }
    
    public function doneAction( Request $request )
    {
        $token      = $this->getPayum()->getHttpRequestVerifier()->verify( $request );
        $this->getPayum()->getHttpRequestVerifier()->invalidate( $token );
        
        $gateway    = $this->getPayum()->getGateway( $token->getGatewayName() );
        $status     = new GetHumanStatus( $token );
        
        $gateway->execute( $status );
      
        if ( ! $status->isCaptured() ) {
            throw new HttpException( 400, 'Billing agreement status is not success.' );
        }

        $payment            = $status->getFirstModel();

        return $this->redirect( $this->generateUrl( 'ia_paid_membership_subscription_create', [
            'paymentId' => $payment->getId()
        ]));
    }

    public function cancelAction( $paymentId, Request $request )
    {
        $gateway = $this->getPayum()->getGateway( self::GATEWAY );
        
        $ppr = $this->getDoctrine()->getRepository( 'IAPaymentBundle:Payment' );
        $payment = $ppr->find( $paymentId );
        
        $gateway->execute( new Cancel( $payment ) );
        $gateway->execute( new Sync( $payment ) );
        
        $status = new GetHumanStatus( $payment );
        $gateway->execute( $status );
        if (false == $status->isCanceled()) {
            throw new HttpException(400, 'The model status must be success.');
        }

        // Add User Activity
        $activity   = new UserActivity();
        $activity->setUser( $this->getUser() );
        $activity->setDate( new \DateTime() );
        $activity->setActivity(
            sprintf( 'User cancel recurring payment for "%s".',
                $payment->getPaymentMethod()
            )
        );
        
        $em = $this->getDoctrine()->getManager();
        $em->persist( $activity );
        $em->flush();
        
        return $this->redirect( $this->generateUrl( 'ia_users_profile_show' ) );
    }
}
