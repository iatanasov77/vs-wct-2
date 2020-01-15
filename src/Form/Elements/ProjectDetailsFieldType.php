<?php

namespace App\Form\Elements;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

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
            ->add('type', EntityType::class, array(
                'class' => 'App\Entity\FieldType',
                'choice_label' => 'title',
                'placeholder' => '-- Choose a Type --',
            ))
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

