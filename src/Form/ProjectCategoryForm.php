<?php namespace App\Form;

use Vankosoft\ApplicationBundle\Form\AbstractForm;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\HttpFoundation\RequestStack;

use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

use Vankosoft\ApplicationBundle\Component\I18N;

class ProjectCategoryForm extends AbstractForm
{
    protected $requestStack;
    
    public function __construct(
        string $dataClass,
        RequestStack $requestStack
    ) {
        parent::__construct( $dataClass );
        
        $this->requestStack = $requestStack;
    }
    
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        parent::buildForm( $builder, $options );
        
        $builder
            ->add( 'currentLocale', ChoiceType::class, [
                'choices'               => \array_flip( I18N::LanguagesAvailable() ),
                'data'                  => $this->requestStack->getCurrentRequest()->getLocale(),
                'mapped'                => false,
                'label'                 => 'vs_wct.form.locale',
                'translation_domain'    => 'WebContentThief',
            ])
            ->add( 'name', TextType::class, [
                'label'                 => 'vs_wct.form.name',
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
        return 'vs_wct.project_category';
    }
}
