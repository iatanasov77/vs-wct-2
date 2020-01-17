<?php

namespace App\Form\Elements;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class FieldsetFieldType extends AbstractType
{

    public function getName()
    {
        return 'FormFieldsetField';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add( 'title', TextType::class, ['required' => true] )
            ->add( 'type', ChoiceType::class, [
                'required'      => true,
                'placeholder'   => '-- Choose a Type --',
                'choices'       => \App\Component\ProjectField::types()
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'App\Entity\FieldsetField'
        ));
    }

}

