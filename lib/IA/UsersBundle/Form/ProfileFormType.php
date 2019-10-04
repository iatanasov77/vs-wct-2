<?php

namespace IA\UsersBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use IA\UsersBundle\Form\Type\ProfileType;

class ProfileFormType extends AbstractType
{

    public function getName()
    {
        return 'ia_users_profile';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder
            ->add('profile', new ProfileType(), array(
                'label' => false,
                'data_class' => 'IA\UsersBundle\Entity\User'
            ))
            
            ->add('btnSave', 'submit', array('label' => 'form.save', 'translation_domain' => 'IAUsersBundle'))
            ->add('btnCancel', 'button', array('label' => 'form.cancel', 'translation_domain' => 'IAUsersBundle'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IA\UsersBundle\Entity\User'
        ));
    }

}


