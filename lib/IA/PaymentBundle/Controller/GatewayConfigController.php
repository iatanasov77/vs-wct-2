<?php

namespace IA\PaymentBundle\Controller;

use Payum\Bundle\PayumBundle\Controller\PayumController;
use Symfony\Component\HttpFoundation\Request;

use IA\PaymentBundle\Entity\GatewayConfig as GatewayConfigEntity;
use IA\PaymentBundle\Form\GatewayConfig;

use Payum\Core\Bridge\Doctrine\Storage\DoctrineStorage;

class GatewayConfigController extends PayumController 
{
    
    public function indexAction(Request $request)
    {
        return $this->render('IAPaymentBundle:GatewayConfig:index.html.twig', [
            'items' => $this->getDoctrine()->getRepository( GatewayConfigEntity::class )->findAll()
        ]);
    }
    
    /**
     * Prepare Action
     * 
     * @return type
     */
    public function configAction($gatewayName, Request $request)
    {
        $gatewayConfigStorage = new DoctrineStorage($this->getDoctrine()->getManager(), 'IA\PaymentBundle\Entity\GatewayConfig');
        $searchConfig = $gatewayConfigStorage->findBy(array('gatewayName'=>$gatewayName));
        $gatewayConfig = is_array($searchConfig) && isset($searchConfig[0])
                            ? $searchConfig[0] : null;

        if(!$gatewayConfig) {
            $gatewayConfig = $gatewayConfigStorage->create();
            
//             $gatewayConfig->setGatewayName($gatewayName);
//             $gatewayConfig->setFactoryName($gatewayFactory);
            
//             // Set Default Config Options From Factory
//             $factory = $this->get('payum')->getGatewayFactory($gatewayFactory);
//             $config = $factory->createConfig();
//             $defaultOptions = $config['payum.default_options'];
//             if(isset($defaultOptions['sandbox'])) {
//                 $defaultOptions['sandbox'] = 1;
//                 $gatewayConfig->setSandboxConfig($defaultOptions);
//                 $defaultOptions['sandbox'] = 0;
//             }
//             $gatewayConfig->setConfig($defaultOptions);
            
        }
        $form = $this->createForm( GatewayConfig::class, $gatewayConfig);
     
        // Form Submit
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $gatewayConfigStorage->update($gatewayConfig);
        }
        
        return $this->render('IAPaymentBundle:PaymentMethodConfig:config.html.twig', [
            'gateway'   => $gatewayName,
            'form'      => $form->createView()
        ]);
    }
    
}
