<?php

namespace IA\PaidMembershipBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PackagePlanType extends AbstractType
{

    public function getName()
    {
        return 'FormPackagePlan';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('plan', 'entity', array(
                'class' => 'IAPaidMembershipBundle\Entity\Plan',
                'choice_label' => 'title',
                'required' => false
            ))
            ->add('price', 'money')
            ->add('description', 'textarea')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IAPaidMembershipBundle\Entity\PackagePlan'
        ));
    }

}

