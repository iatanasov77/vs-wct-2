<?php namespace App\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

use App\Component\ProjectField as ProjectFieldHelper;
use App\Entity\ProjectField;

class ProjectFieldType extends AbstractType
{
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        //echo '<pre>'; var_dump($options['data']);die;
        $builder
            ->add( 'type', ChoiceType::class, [
                'required'              => false,
                'choices'               => \array_flip( ProjectFieldHelper::types() ),
                'placeholder'           => 'vs_wct.form.project.field_type_placeholder',
                'translation_domain'    => 'WebContentThief',
            ])
            ->add( 'title', TextType::class, [
                'required'              => false,
                'translation_domain'    => 'WebContentThief',
                'attr' => [
                    'placeholder' => 'vs_wct.form.project.field_title_placeholder',
                ],
            ])
            ->add( 'xquery', TextType::class, [
                'required'              => false,
                'translation_domain'    => 'WebContentThief',
                'attr' => [
                    'placeholder' => 'vs_wct.form.project.field_xquery_placeholder',
                ],
            ])
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver )
    {
        $resolver->setDefaults(array(
            'data_class' => ProjectField::class
        ));
    }
    
    public function getName()
    {
        return 'FormFieldsetField';
    }
}
