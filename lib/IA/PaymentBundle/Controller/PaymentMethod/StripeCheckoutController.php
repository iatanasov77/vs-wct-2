<?php  namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;

class StripeCheckoutController extends AbstractPaymentMethodController
{
    const GATEWAY   = 'stripe_checkout_gateway';
    
    protected function getErrorMessage( $details )
    {
        return 'STRIPE ERROR: ' . $details['error']['message'];
    }
    
    /*
     * TEST MAIL: i.atanasov77@gmail.com
     * 
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
    public function prepareAction( Request $request )
    {
        $ppr            = $this->getDoctrine()->getRepository( 'IAUsersBundle:PackagePlan' );
        
        $packagePlan    = $ppr->find( $request->query->get( 'packagePlanId' ) );
        if ( ! $packagePlan ) {
            throw new \Exception('Invalid Request!!!');
        }
        
        $pb         = $this->get( 'ia_payment_builder' );
        $payment    = $pb->buildPayment( $this->getUser(), $packagePlan, self::GATEWAY );
        
        $payment->setPaymentMethod( 'stripe' );
//         $payment->setDetails([
//             'currency'      => $packagePlan->getCurrency(),
//             'amount'        => (float) $packagePlan->getPrice(),
//             'description'   => $packagePlan->getDescription()
//         ]);
        
         $pb->updateStorage( $payment );
        
        $captureToken = $this->get( 'payum' )->getTokenFactory()->createCaptureToken(
            self::GATEWAY,
            $payment,
            'ia_payment_stripe_checkout_done' // the route to redirect after capture;
        );
        
        return $this->redirect( $captureToken->getTargetUrl() );
    }
}
