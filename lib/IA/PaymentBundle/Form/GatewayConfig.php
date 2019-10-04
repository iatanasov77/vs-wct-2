<?php

namespace IA\PaymentBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use IA\PaymentBundle\Form\Type\GatewayConfigType;

/**
 * Credit Card Form Type for PayPal Pro Direct Payments
 */
class GatewayConfig extends AbstractType
{

    public function getName()
    {
        return 'ia_payment_gateway_config';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {       
        $gatewayConfig = $options['data'];
        $builder
            ->add('gatewayName', 'hidden')
            ->add('factoryName', 'hidden')
            ->add('useSandbox', 'checkbox', array('required'=>false))
                
            ->add('config', new GatewayConfigType(), array('data' => $gatewayConfig->getConfig(false)))
            ->add('sandboxConfig', new GatewayConfigType(), array('data' => $gatewayConfig->getSandboxConfig()))
            
            ->add('btnSave', 'submit', array('label' => 'Save'))
            ->add('btnCancel', 'button', array('label' => 'Cancel'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IA\PaymentBundle\Entity\GatewayConfig'
        ));
    }

}


