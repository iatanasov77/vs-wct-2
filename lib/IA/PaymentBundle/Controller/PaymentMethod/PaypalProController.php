<?php
namespace IA\PaymentBundle\Controller\PaymentMethod;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\Security\SensitiveValue;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\Range;
use IA\PaymentBundle\Form\CreditCard as CreditCardForm;

class PaypalProController extends PayumController
{
    public function prepareAction($planId, Request $request)
    {
        $gatewayName = 'paypal_pro_checkout';

        $form = $this->createForm(new CreditCardForm());
        $form->handleRequest($request);
        if ($form->isValid()) {
            $data = $form->getData();

            $storage = $this->getPayum()->getStorage('IA\PaymentBundle\Entity\PaymentDetails');

            $payment = $storage->create();
            $payment['ACCT'] = new SensitiveValue($data['acct']);
            $payment['CVV2'] = new SensitiveValue($data['cvv2']);
            $payment['EXPDATE'] = new SensitiveValue($data['exp_date']);
            $payment['AMT'] = number_format($data['amt'], 2);
            $payment['CURRENCY'] = $data['currency'];
            $storage->update($payment);

            $captureToken = $this->getPayum()->getTokenFactory()->createCaptureToken(
                $gatewayName,
                $payment,
                'acme_payment_done'
            );

            return $this->forward('PayumBundle:Capture:do', array(
                'payum_token' => $captureToken,
            ));
        }

        return $this->render('IAPaymentBundle:PaymentMethod/PaypalPro:prepare.html.twig', array(
            'form' => $form->createView(),
        ));
    }

}
