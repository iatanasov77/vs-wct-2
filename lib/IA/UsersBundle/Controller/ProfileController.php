<?php namespace IA\UsersBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use IA\UsersBundle\Form\ProfileFormType;

class ProfileController extends Controller
{
    public function showAction( Request $request )
    {
        $form = $this->createForm( ProfileFormType::class, $this->getUser()->getUserInfo() );
        
        /*
         * Fetch Available Packages
         */
        $pr                     = $this->getDoctrine()->getRepository( 'IAUsersBundle:Package' );
        $packages               = $pr->findAll();
        
        $paymentMethods         = $this->container->getParameter( 'ia_payment.methods' ); 
        $subscriptionDetails    = $this->userSubscriptionDetails();
        
        return $this->render( 'IAUsersBundle:Profile:show.html.twig', [
            'subscription'          => $this->getUser()->getSubscription(),
            'subscriptionDetails'   => $subscriptionDetails,
            'form'                  => $form->createView(),
            'packages'              => $packages,
            'paymentMethods'        => $paymentMethods
        ]);
    }
    
    private function userSubscriptionDetails()
    {
        $sr             = $this->getDoctrine()->getRepository( 'IAUsersBundle:UserSubscription' );
        $subscription   = $this->getUser()->getSubscription();
        
        return [
            'active'    => $sr->isActive( $subscription )
        ];
    }
}

