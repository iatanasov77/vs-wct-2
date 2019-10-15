<?php
/**
 * DOCUMENTATION
 * 
 * 1. Agreement Details
 * =======================
 *  {
        "PAYMENTREQUEST_0_AMT":"0.00",
        "L_BILLINGTYPE0":"RecurringPayments",
        "L_BILLINGAGREEMENTDESCRIPTION0":"10 \u20ac  per Month",
        "NOSHIPPING":1,
        "RETURNURL":"http:\/\/vswct.lh\/app_dev.php\/payment\/capture\/J4vGk_0kbMk1c2nnp0uyuL4BJ0l4Ttk0it5LfyNOsO4",
        "CANCELURL":"http:\/\/vswct.lh\/app_dev.php\/payment\/capture\/J4vGk_0kbMk1c2nnp0uyuL4BJ0l4Ttk0it5LfyNOsO4?cancelled=1",
        "INVNUM":14,
        "PAYMENTREQUEST_0_PAYMENTACTION":"Sale",
        "AUTHORIZE_TOKEN_USERACTION":"commit",
        "PAYMENTREQUEST_0_NOTIFYURL":"http:\/\/vswct.lh\/app_dev.php\/payment\/notify\/4I8K-4I45gAY1PFc5RsedKcsyggmSqcsTR91QEdnIUs",
        "TOKEN":"EC-7EY75073JS1219406",
        "TIMESTAMP":"2016-05-13T13:55:27Z",
        "CORRELATIONID":"5d7134fc28da5",
        "ACK":"Success",
        "VERSION":"65.1",
        "BUILD":"22120179",
        "BILLINGAGREEMENTACCEPTEDSTATUS":"0",
        "CHECKOUTSTATUS":"PaymentActionNotInitiated",
        "CURRENCYCODE":"USD",
        "AMT":"0.00",
        "SHIPPINGAMT":"0.00",
        "HANDLINGAMT":"0.00",
        "TAXAMT":"0.00",
        "NOTIFYURL":"http:\/\/vswct.lh\/app_dev.php\/payment\/notify\/4I8K-4I45gAY1PFc5RsedKcsyggmSqcsTR91QEdnIUs",
        "INSURANCEAMT":"0.00",
        "SHIPDISCAMT":"0.00",
        "PAYMENTREQUEST_0_CURRENCYCODE":"USD",
        "PAYMENTREQUEST_0_SHIPPINGAMT":"0.00",
        "PAYMENTREQUEST_0_HANDLINGAMT":"0.00",
        "PAYMENTREQUEST_0_TAXAMT":"0.00",
        "PAYMENTREQUEST_0_INSURANCEAMT":"0.00",
        "PAYMENTREQUEST_0_SHIPDISCAMT":"0.00",
        "PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED":"false",
        "PAYMENTREQUESTINFO_0_ERRORCODE":"0"
    }
 * 
 * 
 * 
    2. Query to Create tokens table
    ===================================
    CREATE TABLE `IAP_PaymentTokens`
    (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `hash` VARCHAR(255),
        `details` TEXT,
        `after_url` VARCHAR(255),
        `target_url` VARCHAR(255),
        `gateway_name` VARCHAR(255),
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB;
 * 
 * 
 * 
 */
namespace IA\PaymentBundle\Controller\PaymentMethod;

use IA\PaymentBundle\Entity\AgreementDetails;
use IA\PaymentBundle\Entity\RecurringPaymentDetails;
use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Request\Cancel;
use Payum\Core\Security\GenericTokenFactoryInterface;
use Payum\Paypal\ExpressCheckout\Nvp\Request\Api\CreateRecurringPaymentProfile;
use Payum\Paypal\ExpressCheckout\Nvp\Api;
use Payum\Core\Request\Sync;
use Payum\Core\Request\GetHumanStatus;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

class PaypalExpressCheckoutController extends PayumController
{

    public function createAgreementAction($planId, Request $request)
    {
        $gatewayName = 'paypal_express_checkout_recurring_payment';
        
        $ppr = $this->getDoctrine()->getRepository('IAPaidMembershipBundle:PackagePlan');
        $packagePlan = $ppr->find($planId);
        if (!$packagePlan) {
            throw new \Exception('Invalid Request!!!');
        }


        if ($request->isMethod('POST')) {
            $storage = $this->getPayum()->getStorage('IA\PaymentBundle\Entity\AgreementDetails');

            /** @var $agreement AgreementDetails */
            $agreement = $storage->create();
            
            $agreement->setUser($this->getUser());
            $agreement->setPlan($packagePlan);
            $agreement['PAYMENTREQUEST_0_AMT'] = 0;
            $agreement['L_BILLINGTYPE0'] = Api::BILLINGTYPE_RECURRING_PAYMENTS;
            $agreement['L_BILLINGAGREEMENTDESCRIPTION0'] = $packagePlan->getDescription();
            $agreement['NOSHIPPING'] = 1;
            $storage->update($agreement);

            $captureToken = $this->getPayum()->getTokenFactory()->createCaptureToken(
                    $gatewayName, $agreement, 'ia_payment_paypal_express_checkout_create_recurring_payment'
            );

            $agreement['RETURNURL'] = $captureToken->getTargetUrl();
            $agreement['CANCELURL'] = $captureToken->getTargetUrl();
            $agreement['INVNUM'] = $agreement->getId();
            $storage->update($agreement);

            //return $this->redirect($captureToken->getTargetUrl(), array('planId', $planId));
            return $this->redirect($captureToken->getTargetUrl());
        }

        $tplVars = array(
            'packagePlan' => $packagePlan,
            'gatewayName' => $gatewayName
        );
        return $this->render('IAPaymentBundle:PaymentMethod/PaypalExpressCheckout:createAgreement.html.twig', $tplVars);
    }

    public function createRecurringPaymentAction(Request $request)
    {
        $token = $this->getPayum()->getHttpRequestVerifier()->verify($request);

        $gateway = $this->getPayum()->getGateway($token->getGatewayName());

        $agreementStatus = new GetHumanStatus($token);
        $gateway->execute($agreementStatus);

        if (false == $agreementStatus->isCaptured()) {
            throw new HttpException(400, 'Billing agreement status is not success.');
        }

        $agreement = $agreementStatus->getModel();
        $packagePlan = $agreement->getPlan();
        
        $storage = $this->getPayum()->getStorage('IA\PaymentBundle\Entity\PaymentDetails');

        $payment = $storage->create();
        $payment->setPaymentMethod($gateway);
        $payment['TOKEN'] = $agreement['TOKEN'];
        $payment['DESC'] = $agreement['L_BILLINGAGREEMENTDESCRIPTION0'];
        $payment['EMAIL'] = $agreement['EMAIL'];
        $payment['AMT'] = $packagePlan->getPrice();
        $payment['CURRENCYCODE'] = $this->container->getParameter('currency');
        $payment['BILLINGFREQUENCY'] = $packagePlan->getBillingFrequency(); // Ð¿Ñ€Ð¸Ð¼ÐµÑ€: 1 Ð´ÐµÐ½, 1 Ð¼ÐµÑ�ÐµÑ† Ð¸Ð»Ð¸ 1 Ð³Ð¾Ð´Ð¸Ð½Ð° 
        $payment['PROFILESTARTDATE'] = date(DATE_ATOM);
        $payment['BILLINGPERIOD'] = $packagePlan->getBillingPeriod();

        $gateway->execute(new CreateRecurringPaymentProfile($payment));
        $gateway->execute(new Sync($payment));

        $recurringPaymentStatus = new GetHumanStatus($payment);
        $gateway->execute($recurringPaymentStatus);

        return $this->redirect($this->generateUrl('ia_paid_membership_subscription_create', array('paymentId' => $payment->getId())));
    }

    public function viewRecurringPaymentDetailsAction($gatewayName, $billingAgreementId, $recurringPaymentId, Request $request)
    {
        $gateway = $this->getPayum()->getGateway($gatewayName);

        $billingAgreementStorage = $this->getPayum()->getStorage('Acme\PaymentBundle\Entity\AgreementDetails');

        $billingAgreementDetails = $billingAgreementStorage->find($billingAgreementId);

        $billingAgreementStatus = new GetHumanStatus($billingAgreementDetails);
        $gateway->execute($billingAgreementStatus);

        $recurringPaymentStorage = $this->getPayum()->getStorage('Acme\PaymentBundle\Entity\RecurringPaymentDetails');

        $recurringPaymentDetails = $recurringPaymentStorage->find($recurringPaymentId);

        $recurringPaymentStatus = new GetHumanStatus($recurringPaymentDetails);
        $gateway->execute($recurringPaymentStatus);

        $cancelToken = null;
        if ($recurringPaymentStatus->isCaptured()) {
            $cancelToken = $this->getPayum()->getTokenFactory()->createToken(
                    $gatewayName, $recurringPaymentDetails, 'acme_paypal_express_checkout_cancel_recurring_payment', array(), $request->attributes->get('_route'), $request->attributes->get('_route_params')
            );
        }

        $tplVars = array(
            'cancelToken' => $cancelToken,
            'billingAgreementStatus' => $billingAgreementStatus,
            'recurringPaymentStatus' => $recurringPaymentStatus,
            'gatewayName' => $gatewayName
        );
        return $this->render('IAPaymentBundle:PaymentMethod/PaypalExpressCheckout:viewRecurringPaymentDetails.html.twig', $tplVars);
    }

    public function cancelRecurringPaymentAction(Request $request)
    {
        $token = $this->getPayum()->getHttpRequestVerifier()->verify($request);
        $this->getPayum()->getHttpRequestVerifier()->invalidate($token);

        $gateway = $this->getPayum()->getGateway($token->getGatewayName());

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

        $gateway->execute(new Cancel($payment));
        $gateway->execute(new Sync($payment));

        return $this->redirect($token->getAfterUrl());
    }

}
