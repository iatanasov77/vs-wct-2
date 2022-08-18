<?php namespace App\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

use Sylius\Bundle\ResourceBundle\Doctrine\ORM\EntityRepository;
use App\Entity\Project;
use App\Entity\ProjectField;
use App\Entity\ProjectMapperField;
use App\Repository\ProjectFieldsRepository;

use App\Component\Deployer\Sylius\Sylius;

class MapperFieldType extends AbstractType
{
    protected $pfRepo;
    
    public function __construct(
        ProjectFieldsRepository $pfRepo,
        Sylius $sylius
    ) {
        $this->pfRepo   = $pfRepo;
        $this->sylius   = $sylius;
    }
    
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        //echo '<pre>'; var_dump($options['data']);die;
        $project    = $options['project'];
        
        $builder
            ->add( 'projectField', EntityType::class, [
                'class'                 => ProjectField::class,
                'choice_label'          => 'title',
                'query_builder'         => function ( EntityRepository $er ) use ( $project )
                {
                    $qb = $er->createQueryBuilder( 'pf' );
                    if  ( $project && $project->getId() ) {
                        $qb->where( 'pf.project = :project' )->setParameter( 'project', $project->getId() );
                    }
                    
                    return $qb;
                },
            
                'required'              => false,
                'placeholder'           => 'vs_wct.form.mapper.project_field_placeholder',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'mapField', ChoiceType::class, [
                'required'              => false,
                'translation_domain'    => 'WebContentThief',
                'placeholder'           => 'vs_wct.form.mapper.map_field_placeholder',
                'choices'               => $this->sylius->schemaCreateProduct(),
            ])
            /*
            ->add( 'mapField', TextType::class, [
                'required'              => false,
                'translation_domain'    => 'WebContentThief',
                'attr' => [
                    'placeholder' => 'vs_wct.form.mapper.map_field_placeholder',
                ],
            ])
            */
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver )
    {
        $resolver
            ->setDefaults([
                'data_class' => ProjectMapperField::class
            ])
            
            ->setDefined([
                'project',
            ])
            
            ->setAllowedTypes( 'project', Project::class )
        ;
    }
}
