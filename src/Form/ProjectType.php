<?php
namespace App\Form;

use Sylius\Bundle\ResourceBundle\Form\Type\AbstractResourceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use App\Form\Elements\ProjectListingFieldType;
use App\Form\Elements\ProjectDetailsFieldType;

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;

use App\Entity\Project;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;

class ProjectType extends AbstractResourceType implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    public function __construct($container = null)
    {
        $this->container = $container;
    }
    
    public function getName()
    {
        return 'ia_web_content_thief_projects';
    }
    
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->setMethod( 'PUT' )
            
            ->add('enabled', CheckboxType::class, array('label' => 'Enabled'))
            ->add('title', TextType::class, array('label' => 'Title'))
              
            ->add('parseCountMax', TextType::class, array('label' => 'Max Count Parsing Objects'))
            
            ->add('url', TextType::class, array('label' => 'Url')) // , array("mapped" => false)
            
            ->add('detailsPage', TextType::class, array('label'=> 'Details Page', 'required' => false))
            ->add('detailsLink', TextType::class, array('label'=> 'Details Link'))
            ->add('pagerLink', TextType::class, array('label'=> 'Pager Link'))
                
            ->add('fieldsetListing', EntityType::class, array(
                'class' => 'App\Entity\Fieldset',
                'choice_label' => 'title',
                "mapped" => false,
                'required' => false,
                'placeholder' => '-- Apply a Fieldset --',
            ))
            
            ->add('fieldsetDetails', EntityType::class, array(
                'class' => 'App\Entity\Fieldset',
                'choice_label' => 'title',
                "mapped" => false,
                'required' => false,
                'placeholder' => '-- Apply a Fieldset --',
            ))
            
            ->add('listingFields', CollectionType::class, array(
                'entry_type'   => ProjectListingFieldType::class,
                'allow_add'    => true,
                'allow_delete' => true,
                'prototype'    => true,
                'by_reference' => false
            ))
                
            ->add('detailsFields', CollectionType::class, array(
                'entry_type'   => ProjectDetailsFieldType::class,
                'allow_add'    => true,
                'allow_delete' => true,
                'prototype'    => true,
                'by_reference' => false
            ))
             
                
            ->add('btnSave', SubmitType::class, array('label' => 'Save'))
            ->add('btnCancel', ButtonType::class, array('label' => 'Cancel'))
                
                
//            ->add('links', 'collection', array(
//                'entry_type' => new ProjectLinkType(),
//                'data' => $options["data"]->getLinks(),
//                'mapped'=> false,
//                'required' => false
//            ))
        ;
    }
    
    public function configureOptions(OptionsResolver $resolver) : void
    {
        $resolver->setDefaults(array(
            'data_class' => 'App\Entity\Project'
        ));
    }
    
    protected function getXqueryFieldChoices(Project $project)
    {
        $choices = array(
            'Details Link'  => 'project_detailsLink',
            'Pager Link'    => 'project_pagerLink'
        );
        
        $i = 0;
        foreach($project->getListingFields() as $field) {
            $choices[$field->getTitle()] = 'FormProject_listingFields_'.$i++.'_xquery';
        }
        $i = 0;
        foreach($project->getDetailsFields() as $field) {
            $choices[$field->getTitle()] = 'FormProject_detailsFields_'.$i++.'_xquery';
        }
        
        
        return $choices;
    }
}