<?php

namespace App\Form\Elements;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class ProjectDetailsFieldType extends AbstractType
{

    public function getName()
    {
        return 'FormProjectField';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, ['required' => false, 'attr' => ['placeholder' => 'Enter a Title']])
            ->add( 'type', ChoiceType::class, [
                'required'      => true,
                'placeholder'   => '-- Choose a Type --',
                'choices'       => \App\Component\ProjectField::types()
            ])
            ->add('xquery', TextType::class, ['required' => false, 'attr' => ['placeholder' => 'Enter a XPath']])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => 'App\Entity\ProjectDetailsField'
        ]);
    }

}

