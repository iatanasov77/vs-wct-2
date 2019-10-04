<?php

namespace IA\PaidMembershipBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use IAPaidMembershipBundle\Entity\UserSubscription;
/**
 * @TODO Да се преместят контролерите за плащането в този бъндъл (като например RecurringPaymentController).
 */
class SubscriptionController extends Controller
{
    public function subscribeAction($planId, Request $request)
    {
        return $this->redirect($this->generateUrl('a_payment_paypal_express_checkout_prepare_recurring_payment_agreement', array(
            'planId' => $planId,
        )));
    }
    
    public function createAction($paymentId, Request $request)
    {
        $pdr = $this->getDoctrine()->getRepository('IA\Budle\PaymentBundle\Entity\PaymentDetails');
        $paymentDetails = $pdr->find($paymentId);
        if(!$paymentDetails) {
            throw new Exception('Error with payment.');
        }

        $subscription = new UserSubscription();
        $subscription->setPaymentDetails($paymentDetails);
        
        $user = $this->getUser();
        $user->setSubscription($subscription);
        
        
        $em = $this->getDoctrine()->getManager();
        $em->persist($subscription);
        $em->flush();
        
        return $this->redirect($this->generateUrl('ia_users_profile_show'));
    }
    
}

