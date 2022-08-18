<?php namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

use App\Component\Deployer\Deployer;

class ProjectDeployerForm extends AbstractType
{
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        $builder
            ->add( 'projectId', HiddenType::class, ['required' => true] )
            ->add( 'repertoryId', HiddenType::class, ['required' => true] )
            
            ->add( 'deployer', ChoiceType::class, [
                'label'                 => 'Deployer',
                'translation_domain'    => 'WebContentThief',
                'choices'               => \array_flip( Deployer::DeployersAvailable() ),
                'placeholder'           => '-- Choose a Deployer --',
                //'data'                  => Deployer::DEPLOYER_SYLIUS,
            ])
            
            ->add( 'baseUrl', TextType::class, [
                'label'                 => 'Base URL',
                'translation_domain'    => 'WebContentThief',
            ])
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver ): void
    {
        parent::configureOptions( $resolver );
        
        $resolver
            ->setDefaults([
                'csrf_protection'   => false,
            ])
        ;
    }
    
    public function getName()
    {
        return 'vs_wct.deployer';
    }
}
