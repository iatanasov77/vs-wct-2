<?php

namespace IA\PaymentBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;

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
            ->add('gatewayName', HiddenType::class)
            ->add('factoryName', HiddenType::class)
            ->add('useSandbox', CheckboxType::class, array('required'=>false))
                
            ->add('config', GatewayConfigType::class, array('data' => $gatewayConfig->getConfig(false)))
            ->add('sandboxConfig', GatewayConfigType::class, array('data' => $gatewayConfig->getSandboxConfig()))
            
            ->add('btnSave', SubmitType::class, array('label' => 'Save'))
            ->add('btnCancel', ButtonType::class, array('label' => 'Cancel'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IA\PaymentBundle\Entity\GatewayConfig'
        ));
    }

}


