<?php namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

use App\Entity\Project;

class ProjectCollectorForm extends AbstractType
{
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        $builder
            ->add( 'projectId', HiddenType::class, ['required' => true])
            
            ->add( 'parseMode', ChoiceType::class, [
                'label'         => 'Parse Mode',
                'required'      => true,
                //'placeholder'   => '-- Choose Parse Mode --',
                'choices'       => \array_flip( \App\Component\ProjectField::parseModes() ),
                'data'          => 'xpath',
            ])
            
            ->add( 'collectionType', ChoiceType::class, [
                'label'         => 'Collection Type',
                'required'      => true,
                //'placeholder'   => '-- Choose Collection Type --',
                'choices'       => \array_flip( \App\Component\ProjectField::destinations() ),
            ])
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver ) : void
    {
        parent::configureOptions( $resolver );
        
        $resolver
            ->setDefaults([
                'csrf_protection' => false,
            ])
            ->setDefined([
                'project',
            ])
            ->setAllowedTypes( 'project', Project::class )
        ;
    }
    
    public function getName()
    {
        return 'vs_web_content_thief_project_collector';
    }
}
