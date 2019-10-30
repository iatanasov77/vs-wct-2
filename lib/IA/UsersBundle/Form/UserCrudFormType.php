<?php

namespace IA\UsersBundle\Form;

use Sylius\Bundle\ResourceBundle\Form\Type\AbstractResourceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;

use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;

use IA\UsersBundle\Form\Type\ProfileType;

class UserCrudFormType extends AbstractResourceType  implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    public function __construct( $container = null )
    {
        $this->container = $container;
    }
    
    public function getName()
    {
        return 'ia_users_users';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder
            //->add('apiKey', HiddenType::class)
            //->add('enabled', CheckboxType::class, array('label' => 'Enabled'))
                
//             ->add('profile', ProfileType::class, array(
//                 'label' => false,
//                 'data_class' => 'IA\UsersBundle\Entity\User'
//             ))

            ->add('email', TextType::class, array('label' => 'registration.Email', 'translation_domain' => 'IAUsersBundle'))
            ->add('username', TextType::class, array('label' => 'registration.userName', 'translation_domain' => 'IAUsersBundle'))
            ->add('password', PasswordType::class, array('label' => 'registration.password', 'translation_domain' => 'IAUsersBundle'))
                
            ->add('btnSave', SubmitType::class, array('label' => 'Save'))
            ->add('btnCancel', ButtonType::class, array('label' => 'Cancel'))
        ;
    }

    public function configureOptions( OptionsResolver $resolver ): void
    {
        $resolver->setDefaults(array(
            'data_class' => 'IA\UsersBundle\Entity\User'
        ));
    }

}

