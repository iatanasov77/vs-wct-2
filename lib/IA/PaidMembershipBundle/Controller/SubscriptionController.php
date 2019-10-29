<?php

namespace IA\PaidMembershipBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use IA\PaidMembershipBundle\Entity\UserSubscription;
use IA\PaidMembershipBundle\Entity\PackagePlan;
/**
 * @TODO Ð”Ð° Ñ�Ðµ Ð¿Ñ€ÐµÐ¼ÐµÑ�Ñ‚Ñ�Ñ‚ ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»ÐµÑ€Ð¸Ñ‚Ðµ Ð·Ð° Ð¿Ð»Ð°Ñ‰Ð°Ð½ÐµÑ‚Ð¾ Ð² Ñ‚Ð¾Ð·Ð¸ Ð±ÑŠÐ½Ð´ÑŠÐ» (ÐºÐ°Ñ‚Ð¾ Ð½Ð°Ð¿Ñ€Ð¸Ð¼ÐµÑ€ RecurringPaymentController).
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
        $pdr = $this->getDoctrine()->getRepository('IA\PaymentBundle\Entity\PaymentDetails');
        $paymentDetails = $pdr->find($paymentId);
        if(!$paymentDetails) {
            throw new Exception('Error with payment.');
        }

        $subscription = new UserSubscription();
        $subscription->setPaymentDetails($paymentDetails);
        $subscription->setDate( new \DateTime() );
        $subscription->setPlan( $this->getDoctrine()->getRepository( PackagePlan::class )->find( $paymentId ) );
        
        $user = $this->getUser();
        $user->setSubscription($subscription);
        
        $em = $this->getDoctrine()->getManager();
        $em->persist($subscription);
        $em->flush();
        
        return $this->redirect($this->generateUrl('ia_users_profile_show'));
    }
    
}

