<?php

namespace IA\UsersBundle\Form;

use Sylius\Bundle\ResourceBundle\Form\Type\AbstractResourceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use IA\UsersBundle\Form\Type\ProfileType;

class UserCrudFormType extends AbstractResourceType
{

    public function getName()
    {
        return 'ia_users_users';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder
            ->add('apiKey', 'hidden')
            ->add('enabled', 'checkbox', array('label' => 'Enabled'))
                
            ->add('profile', new ProfileType(), array(
                'label' => false,
                'data_class' => 'IA\UsersBundle\Entity\User'
            ))
                
            ->add('btnSave', 'submit', array('label' => 'Save'))
            ->add('btnCancel', 'button', array('label' => 'Cancel'))
        ;
    }

    public function configureOptions( OptionsResolver $resolver ): void
    {
        $resolver->setDefaults(array(
            'data_class' => 'IA\UsersBundle\Entity\User'
        ));
    }

}

