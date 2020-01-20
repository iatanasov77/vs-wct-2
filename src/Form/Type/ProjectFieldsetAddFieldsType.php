<?php namespace App\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;

class ProjectFieldsetAddFieldsType extends AbstractType
{
    public function buildForm (FormBuilderInterface $builder, array $options )
    {
        $builder
            ->add( 'fieldset', EntityType::class, [
                'class' => 'App\Entity\Fieldset',
                'choice_label' => 'title',
                "mapped" => false,
                'required' => false,
                'placeholder' => '-- Choose a Fieldset --',
            ])
            ->add( 'button', ButtonType::class, [
                'label' => 'Add Fields'
                
            ])
        ;
    }
}
