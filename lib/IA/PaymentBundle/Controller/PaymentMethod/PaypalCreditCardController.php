<?php namespace IA\PaymentBundle\Controller\PaymentMethod;

use Symfony\Component\HttpFoundation\Request;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Payum\Core\PayumBuilder;
use Payum\Core\Payum;
use Payum\Paypal\Rest\Model\PaymentDetails;
use Payum\Core\Request\Capture;
use Payum\Core\Reply\HttpResponse;
use Payum\Core\Reply\ReplyInterface;

use PayPal\Api\Address;
use PayPal\Api\Amount;
use PayPal\Api\CreditCard;
use PayPal\Api\Payer;
use PayPal\Api\FundingInstrument;
use PayPal\Api\Transaction;
use PayPal\Api\RedirectUrls;

class PaypalCreditCardController extends PayumController
{
    public function prepareAction( Request $request )
    {
        $packagePlanId  = $request->query->get( 'packagePlanId' );
        $packagePlan = $ppr->find( $packagePlanId );
        if ( ! $packagePlan ) {
            throw new \Exception('Invalid Request!!!');
        }
        
        $payum  = $this->configPayum();
        
        /** @var \Payum\Core\Payum $payum */
        $storage = $payum->getStorage( PaymentDetails::class );
        
        $payment = $storage->create();
        
        $payment->setType( PaymentDetails::TYPE_AGREEMENT );
        $payment->setPaymentMethod( 'paypal_express_checkout_recurring_payment' );
        $payment->setPackagePlan( $packagePlan );
        
        $storage->update($payment);
        
        $payer = new Payer();
        $payer->payment_method = "paypal";
        
        $amount = new Amount();
        $amount->currency = "USD";
        $amount->total = "1.00";
        
        $transaction = new Transaction();
        $transaction->amount = $amount;
        $transaction->description = "This is the payment description.";
        
        $captureToken = $payum->getTokenFactory()->createCaptureToken( 'paypalRest', $payment, 'create_recurring_payment.php');
        //$captureToken->setTargetUrl( $this->generateUrl( 'ia_payment_paypal_credit_card_capture', ['payum_token' => $captureToken->getHash()] ) );
        
        $redirectUrls = new RedirectUrls();
        $redirectUrls->return_url = $captureToken->getTargetUrl();
        $redirectUrls->cancel_url = $captureToken->getTargetUrl();
        
        $payment->intent = "sale";
        $payment->payer = $payer;
        $payment->redirect_urls = $redirectUrls;
        $payment->transactions = array($transaction);

        $storage->update($payment);
        
        return $this->redirect( $captureToken->getTargetUrl() );
    }
    
    public function captureAction( Request $request )
    {
        $payum  = $this->configPayum();
        
        $token = $payum->getHttpRequestVerifier()->verify( $_REQUEST );
        $gateway = $payum->getGateway($token->getGatewayName());
        
        try {
            $gateway->execute(new Capture($token));
            
            if (false == isset($_REQUEST['noinvalidate'])) {
                $payum->getHttpRequestVerifier()->invalidate($token);
            }
            
            return $this->redirect( $token->getAfterUrl() );
        } catch (HttpResponse $reply) {
            foreach ($reply->getHeaders() as $name => $value) {
                header("$name: $value");
            }
            
            http_response_code($reply->getStatusCode());
            echo ($reply->getContent());
            
            exit;
        } catch (ReplyInterface $reply) {
            throw new \LogicException('Unsupported reply', null, $reply);
        }
    }
    
    public function doneAction( Request $request )
    {
        $payum  = $this->configPayum();
        
        /** @var \Payum\Core\Payum $payum */
        $storage = $payum->getStorage( PaymentDetails::class );
        
        $payment = $storage->create();
        $storage->update($payment);
        
        $address = new Address();
        $address->line1 = "3909 Witmer Road";
        $address->line2 = "Niagara Falls";
        $address->city = "Niagara Falls";
        $address->state = "NY";
        $address->postal_code = "14305";
        $address->country_code = "US";
        $address->phone = "716-298-1822";
        
        $card = new CreditCard();
        $card->type = "visa";
        $card->number = "4417119669820331";
        $card->expire_month = "11";
        $card->expire_year = "2019";
        $card->cvv2 = "012";
        $card->first_name = "Joe";
        $card->last_name = "Shopper";
        $card->billing_address = $address;
        
        $fi = new FundingInstrument();
        $fi->credit_card = $card;
        
        $payer = new Payer();
        $payer->payment_method = "credit_card";
        $payer->funding_instruments = array($fi);
        
        $amount = new Amount();
        $amount->currency = "USD";
        $amount->total = "1.00";
        
        $transaction = new Transaction();
        $transaction->amount = $amount;
        $transaction->description = "This is the payment description.";
        
        $payment->intent = "sale";
        $payment->payer = $payer;
        $payment->transactions = array($transaction);
        
        $captureToken = $payum->getTokenFactory()->createCaptureToken('paypalRest', $payment, 'create_recurring_payment.php');
        
        return $this->redirect( $captureToken->getTargetUrl() );
    }
    
    protected function configPayum()
    {
        /** @var Payum $payum */
        $payum = (new PayumBuilder())
            ->addDefaultStorages()
            ->addStorage( PaymentDetails::class, new \Payum\Core\Storage\FilesystemStorage( sys_get_temp_dir(), PaymentDetails::class, 'idStorage' ) )
            ->addGateway( 'paypalRest', [
                'factory' => 'paypal_rest',
                'client_id' => 'ARn-1kRVAW23BEB0RAeZ5O3pt8jblMs-J75ijDIpLwpG8httmIjnxB-rvKhjqTdG-FHSfeVDFLUUBjWz',
                'client_secret' => 'ECF4KlmFaeIHsgjKGN9Ql2Sbvc3DCDwIeEprbXT3pgFEdsOEk0tajI0Nu9U_HlC89UHXmNuILDx6zTg5',
                'config_path' => '%kernel.root_dir%/sdk_config.ini',
            ])
            
            ->getPayum()
        ;
            
        return $payum;
    }
}
