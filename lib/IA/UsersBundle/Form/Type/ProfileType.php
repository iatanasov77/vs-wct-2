<?php

namespace IA\UsersBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProfileType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
       
        $builder
            ->add('apiKey', 'hidden')
            ->add('firstName', null, array('label' => 'registration.firstName', 'translation_domain' => 'IAUsersBundle'))
            ->add('lastName', 'text', array('label' => 'registration.lastName', 'translation_domain' => 'IAUsersBundle'))
            ->add('country', 'country', array('label' => 'registration.yourCountry', 'translation_domain' => 'IAUsersBundle'))
            ->add('birthday', 'birthday', array('label' => 'registration.yourBirthday', 'translation_domain' => 'IAUsersBundle', 'widget'=>'single_text'))
            ->add('occupation', 'text', array('label' => 'registration.occupation', 'translation_domain' => 'IAUsersBundle', 'required' => false))
            ->add('mobile', 'text', array('label' => 'registration.mobile', 'translation_domain' => 'IAUsersBundle', 'required' => false))
            ->add('website', 'url', array('label' => 'registration.websiteUrl', 'translation_domain' => 'IAUsersBundle', 'required' => false))
        ;
    }
    
    public function getName()
    {
        return 'profile';
    }
    
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'inherit_data' => true,
            'csrf_protection' => false,
            'allow_extra_fields' => true,
        ));
    }
}
