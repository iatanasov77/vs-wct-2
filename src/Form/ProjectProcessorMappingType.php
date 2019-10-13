<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use IAWebContentThiefBundle\Component\MapProcessor\AbstractMapProcessor;
use IAWebContentThiefBundle\Form\Elements\ProjectProcessorMappingType as RowMappingType;

class ProjectProcessorMappingType extends AbstractType
{

    private $processor;
    
    public function __construct(AbstractMapProcessor $processor)
    {
        $this->processor = $processor;
    }
    
    public function getName()
    {
        return 'processor_' . $this->processor->getId();
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('mappings', 'collection', array(
                'type'         => new RowMappingType($this->processor),
                'allow_add'    => true,
                'allow_delete' => true,
                'prototype'    => true,
                'by_reference' => false
            ))
            
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IAWebContentThiefBundle\Entity\ProjectProcessor'
        ));
    }

}


