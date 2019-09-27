<?php

namespace IA\PaymentBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Credit Card Form Type for PayPal Pro Direct Payments
 */
class CreditCard extends AbstractType
{

    public function getName()
    {
        return 'ia_payment_credit_card';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder
            ->add('acct', null, array('label' => 'form.credit_card.acct', 'translation_domain' => 'IAPaymentBundle'))
            ->add('exp_date', 'date', array(
                'label' => 'form.credit_card.expire_date', 
                'translation_domain' => 'IAPaymentBundle',
                'format' =>'MM/yyyy-d',
                'years' => range(date('Y'), date('Y')+12),
      
                'empty_value' => array('year' => '--', 'month' => '--')
            ))
            ->add('cvv', null, array('label' => 'form.credit_card.cvv2', 'translation_domain' => 'IAPaymentBundle'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
//        $resolver->setDefaults(array(
//            'data_class' => 'IA\Bundle\UsersBundle\Entity\User'
//        ));
    }

}

