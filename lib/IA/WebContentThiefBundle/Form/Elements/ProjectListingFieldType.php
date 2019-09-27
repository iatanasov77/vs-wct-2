<?php

namespace IA\WebContentThiefBundle\Form\Elements;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class ProjectListingFieldType extends AbstractType
{

    public function getName()
    {
        return 'FormProjectField';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, array('required' => false))
            ->add('type', EntityType::class, array(
                'class' => 'IA\WebContentThiefBundle\Entity\FieldType',
                'choice_label' => 'title'
            ))
            ->add('xquery', TextType::class, array('required' => false))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IA\WebContentThiefBundle\Entity\ProjectListingField'
        ));
    }

}

