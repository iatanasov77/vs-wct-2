<?php

namespace IA\TaxonomyBundle\Form;

use Sylius\Bundle\ResourceBundle\Form\Type\AbstractResourceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use IATaxonomyBundle\Form\Type\TermType;
use IATaxonomyBundle\Entity\Repository\TermsRepository;

class TermForm extends AbstractResourceType
{

    public function getName()
    {
        return 'ia_taxonomy_terms';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {   
        $vocabulary = $options['data']->getVocabulary();
        $builder
            ->add('enabled', 'checkbox', array('label' => 'Enabled'))
            ->add('name', 'text', array('label' => 'Title'))
                 
            ->add('parent', 'hidden')
//            ->add('parent', 'entity', array(
//                'required' => false,
//                'label' => 'Parent',
//                'class' => 'IATaxonomyBundle:Term',
//                'attr' => array('class' => 'col-sm-8'),
//                'empty_value' => 'Select a term',
//                'property' => 'name',
//                'multiple' => false,
//                'expanded' => false ,
//                'query_builder' => function (TermsRepository $r)
//                {
//                    $queryBuilder = $r->createQueryBuilder('t');
//                    $query = $queryBuilder
//                        ->where($queryBuilder->expr()->isNotNull('t.parent'))
//                    ;
//
//                    return $query;
//                }
//            ))
            
            ->add('description', 'textarea', array('label' => 'Description', 'required' => false))
                
            ->add('btnSave', 'submit', array('label' => 'Save'))
            ->add('btnCancel', 'button', array('label' => 'Cancel'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(array(
            'data_class' => 'IATaxonomyBundle\Entity\Term'
        ));
    }

}

