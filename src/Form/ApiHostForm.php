<?php namespace App\Form;

use Vankosoft\ApplicationBundle\Form\AbstractForm;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Vankosoft\ApplicationBundle\Component\Form\Type\JsonType;

class ApiHostForm extends AbstractForm
{
    public function __construct(
        string $dataClass
    ) {
        parent::__construct( $dataClass );
    }
    
    public function buildForm( FormBuilderInterface $builder, array $options ): void
    {
        parent::buildForm( $builder, $options );
        
        $builder
            ->add( 'baseUrl', TextType::class, [
                'label'                 => 'vs_wct.form.api_host.base_url',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'credentials', JsonType::class, [
                'label'                 => 'vs_wct.form.api_host.credentials',
                'translation_domain'    => 'WebContentThief',
            ])
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver ): void
    {
        parent::configureOptions( $resolver );
        
    }
    
    public function getName()
    {
        return 'vs_wct.api_host';
    }
}
