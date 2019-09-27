<?php

namespace IA\PaidMembershipBundle\Form;

use Sylius\Bundle\ResourceBundle\Form\Type\AbstractResourceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Payum\Paypal\ExpressCheckout\Nvp\Api;

use IAPaidMembershipBundle\Form\Type\PackagePlanType;

class PlanFormType extends AbstractResourceType
{

    public function getName()
    {
        return 'ia_paid_membership_plans';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {        
        $builder
            ->add('enabled', 'checkbox', array('label' => 'Enabled'))
            ->add('title', 'text', array('label' => 'Title'))
                
            ->add('subscriptionPeriod', 'choice', 
                    array('label'=>'Subscription Period', 
                        'choices'=>array(
                            ''                           => ' -- Choose a period -- ',
                            Api::BILLINGPERIOD_DAY       => 'Day',
                            Api::BILLINGPERIOD_WEEK      => 'Week',
                            Api::BILLINGPERIOD_SEMIMONTH => 'Semi Month',
                            Api::BILLINGPERIOD_MONTH     => 'Month',
                            Api::BILLINGPERIOD_YEAR      => 'Year'
                        )
                    )
            )
            
            ->add('btnSave', 'submit', array('label' => 'Save'))
            ->add('btnCancel', 'button', array('label' => 'Cancel'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
//        $resolver->setDefaults(array(
//            'data_class' => 'IA\Bundle\WebContentThiefBundle\Entity\Fieldset'
//        ));
    }

}
