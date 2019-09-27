<?php

namespace IA\PaymentBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Credit Card Form Type for PayPal Pro Direct Payments
 */
class GatewayConfigType extends AbstractType
{

    public function getName()
    {
        return 'config';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder->add('factory', 'hidden');
        if(isset($options['data']['sandbox'])) {
            $builder->add('sandbox', 'hidden');
        }
        
        foreach($options['data'] as $optKey => $optVal) {
            if(in_array($optKey, array('factory', 'sandbox')))
                continue;
            $builder->add($optKey, 'text', array('attr' => array('size'=>100)));
        }
    }
}



