<?php

namespace IA\TaxonomyBundle\Form;

use Sylius\Bundle\ResourceBundle\Form\Type\AbstractResourceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use IATaxonomyBundle\Form\Type\TermType;

class VocabularyForm extends AbstractResourceType
{

    public function getName()
    {
        return 'ia_taxonomy_vocabularies';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder
            ->add('enabled', 'checkbox', array('label' => 'Enabled'))
            ->add('name', 'text', array('label' => 'Title'))
            
//            ->add('terms', 'collection', array(
//                'type'         => new TermType(),
//                'allow_add'    => true,
//                'allow_delete' => true,
//                'prototype'    => true,
//                'by_reference' => false
//            ))
                
            ->add('btnSave', 'submit', array('label' => 'Save'))
            ->add('btnCancel', 'button', array('label' => 'Cancel'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(array(
            'data_class' => 'IATaxonomyBundle\Entity\Vocabulary'
        ));
    }

}

