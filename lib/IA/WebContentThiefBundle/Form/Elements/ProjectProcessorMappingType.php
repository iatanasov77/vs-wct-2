<?php

namespace IA\WebContentThiefBundle\Form\Elements;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use IAWebContentThiefBundle\Component\MapProcessor\AbstractMapProcessor;

class ProjectProcessorMappingType extends AbstractType
{

    private $processor;
    
    public function __construct(AbstractMapProcessor $processor)
    {
        $this->processor = $processor;
    }
    
    public function getName()
    {
        return 'FormMapping';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('mapProcessorField', 'choice', array(
                'label' => 'Processor Field',
                'choices' => array('' => '-- Select processor field --') + $this->processor->getSchema()
            ))
            ->add('projectFieldAlias', 'choice', array(
                'label' => 'Project Field',
                'choices' =>  array('' => '-- Select project field --') + $this->processor->getProjectFields()
            ))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IAWebContentThiefBundle\Entity\ProjectProcessorMapping'
        ));
    }

}


