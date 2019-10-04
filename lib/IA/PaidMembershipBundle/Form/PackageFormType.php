<?php

namespace IA\PaidMembershipBundle\Form;

use Sylius\Bundle\ResourceBundle\Form\Type\AbstractResourceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use IAPaidMembershipBundle\Form\Type\PackagePlanType;

class PackageFormType extends AbstractResourceType
{

    public function getName()
    {
        return 'ia_paid_membership_packages';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder
            ->add('enabled', 'checkbox', array('label' => 'Enabled'))
            ->add('title', 'text', array('label' => 'Title'))
            ->add('plans', 'collection', array(
                'type'         => new PackagePlanType(),
                'allow_add'    => true,
                'allow_delete' => true,
                'prototype'    => true,
                'by_reference' => false
            ))
            ->add('btnSave', 'submit', array('label' => 'Save'))
            ->add('btnCancel', 'button', array('label' => 'Cancel'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(array(
            'data_class' => 'IAPaidMembershipBundle\Entity\Package'
        ));
    }

}
