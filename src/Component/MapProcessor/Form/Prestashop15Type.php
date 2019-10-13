<?php

namespace App\Component\MapProcessor\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class Prestashop15Type extends AbstractType
{

    public function getName()
    {
        return 'options';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('baseUrl', 'text', array('label' => 'Base URL'))
            ->add('apiKey', 'text', array('label' => 'API Key'))
        ;
    }

}


