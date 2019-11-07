<?php

namespace IA\PaymentBundle\Controller;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Symfony\Component\HttpFoundation\Request;

use IA\PaymentBundle\Form\GatewayConfig;

use Payum\Core\Bridge\Doctrine\Storage\DoctrineStorage;

class PaymentMethodConfigController extends PayumController 
{
    
    public function indexAction(Request $request)
    {        
        $tplVars = array('methods' => $this->container->getParameter('ia_payment.methods'));
        return $this->render('IAPaymentBundle:PaymentMethodConfig:index.html.twig', $tplVars);
    }
    
    /**
     * Prepare Action
     * 
     * @return type
     */
    public function configAction($gatewayFactory, $gatewayName, Request $request)
    {
        $gatewayConfigStorage = new DoctrineStorage($this->getDoctrine()->getManager(), 'IA\PaymentBundle\Entity\GatewayConfig');
        $searchConfig = $gatewayConfigStorage->findBy(array('gatewayName'=>$gatewayName));
        $gatewayConfig = is_array($searchConfig) && isset($searchConfig[0])
                            ? $searchConfig[0] : null;

        if(!$gatewayConfig) {
            $gatewayConfig = $gatewayConfigStorage->create();
            $gatewayConfig->setGatewayName($gatewayName);
            $gatewayConfig->setFactoryName($gatewayFactory);
            
            // Set Default Config Options From Factory
            $factory = $this->get('payum')->getGatewayFactory($gatewayFactory);
            $config = $factory->createConfig();
            $defaultOptions = $config['payum.default_options'];
            if(isset($defaultOptions['sandbox'])) {
                $defaultOptions['sandbox'] = 1;
                $gatewayConfig->setSandboxConfig($defaultOptions);
                $defaultOptions['sandbox'] = 0;
            }
            $gatewayConfig->setConfig($defaultOptions);
            
        }
        $form = $this->createForm( GatewayConfig::class, $gatewayConfig);
     
        // Form Submit
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $gatewayConfigStorage->update($gatewayConfig);
        }
        
        $tplVars = array('form' => $form->createView());
        return $this->render('IAPaymentBundle:PaymentMethodConfig:config.html.twig', $tplVars);
    }
    
}
