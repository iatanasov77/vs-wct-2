<?php namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

use Doctrine\ORM\EntityRepository;
use App\Entity\ProjectMapper;
use App\Entity\Project;
use App\Entity\ApiHost;

class ProjectDeployerForm extends AbstractType
{
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        $project    = $options['project'];
        
        $builder
            ->add( 'projectId', HiddenType::class, ['required' => true] )
            ->add( 'repertoryId', HiddenType::class, ['required' => true] )
            
            ->add( 'apiHost', EntityType::class, [
                'label'                 => 'vs_wct.form.deployer.api_host',
                'translation_domain'    => 'WebContentThief',
                
                'class'                 => ApiHost::class,
                'choice_label'          => 'baseUrl',
                'required'              => true,
                'placeholder'           => 'vs_wct.form.deployer.api_host_placeholder',
            ])
            
            ->add( 'mapper', EntityType::class, [
                'label'                 => 'vs_wct.form.deployer.mapper',
                'class'                 => ProjectMapper::class,
                'choice_label'          => 'title',
                'query_builder'         => function ( EntityRepository $er ) use ( $project )
                {
                    $qb = $er->createQueryBuilder( 'pm' );
                    if  ( $project && $project->getId() ) {
                        $qb->where( 'pm.project = :project' )->setParameter( 'project', $project->getId() );
                    }
                    
                    return $qb;
                },
            
                'required'              => true,
                'placeholder'           => 'vs_wct.form.deployer.project_mapper_placeholder',
                'translation_domain'    => 'WebContentThief',
            ])
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver ): void
    {
        parent::configureOptions( $resolver );
        
        $resolver
            ->setDefaults([
                'csrf_protection'   => false,
            ])
            
            ->setDefined([
                'project',
            ])
            
            ->setAllowedTypes( 'project', Project::class )
        ;
    }
    
    public function getName()
    {
        return 'vs_wct.deployer';
    }
}
