<?php namespace IA\UsersBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;

use IA\UsersBundle\Entity\UserSubscription;

class UserSubscriptionRepository extends EntityRepository
{
    public function isActive( UserSubscription $subscription )
    {
        $payment    = $subscription->getPaymentDetails();
        
        if ( $payment->getPaymentMethod() == 'paypal_express_checkout_recurring_payment' ) {
            return $payment["STATUS"] === "Active";
        } else if ( $payment->getPaymentMethod() == 'paypal_express_checkout' ) {
            return $payment["CHECKOUTSTATUS"] === "PaymentActionCompleted";
        } elseif ( $payment->getPaymentMethod() == 'paypal_pro_checkout_credit_card' ) {
            return true;
        } else {
            return false;
        }
            
    }
}
