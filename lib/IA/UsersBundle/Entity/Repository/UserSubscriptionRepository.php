<?php namespace IA\UsersBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;

use IA\UsersBundle\Entity\UserSubscription;

class UserSubscriptionRepository extends EntityRepository
{
    public function isActive( $subscription )
    {
        if ( ! $subscription instanceof UserSubscription ) {
            return false;
        }
        
        $payment    = $subscription->getPaymentDetails();
        $details    = $payment->getDetails();
        
        if ( $payment->getPaymentMethod() == 'paypal_express_checkout_recurring_payment' ) {
            return $details["STATUS"] === "Active";
        } else if ( $payment->getPaymentMethod() == 'paypal_express_checkout' ) {
            return $details["CHECKOUTSTATUS"] === "PaymentActionCompleted";
        } elseif ( $payment->getPaymentMethod() == 'paypal_pro_checkout_credit_card' ) {
            return true;
        } else {
            return false;
        }
            
    }
}
