<?php namespace App\Form;

use Vankosoft\ApplicationBundle\Form\AbstractForm;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

use Doctrine\ORM\EntityManagerInterface;

use App\Component\Deployer\Deployer;
use App\Entity\Project;
use App\Entity\ProjectMapper;
use App\Entity\ProjectMapperField;
use App\Repository\ProjectFieldsRepository;

//class ProjectMapperForm extends AbstractType
class ProjectMapperForm extends AbstractForm
{
    protected $pfRepo;
    
    public function __construct(
        string $dataClass,
        //ProjectFieldsRepository $pfRepo
        EntityManagerInterface $em
    ) {
        parent::__construct( $dataClass );
        
        //$this->pfRepo   = $pfRepo;
        $this->pfRepo   = $em->getRepository( ProjectMapper::class );
    }
    
    public function buildForm( FormBuilderInterface $builder, array $options ): void
    {
        parent::buildForm( $builder, $options );
        
        $fields = $this->initFields( $builder->getData() );
        
        $builder
            ->add( 'projectId', HiddenType::class, [
                'mapped'    => false,
            ])
            
            ->add( 'title', TextType::class, [
                'label'                 => 'vs_wct.form.name',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'deployer', ChoiceType::class, [
                'label'                 => 'vs_wct.form.mapper.deployer',
                'translation_domain'    => 'WebContentThief',
                'choices'               => \array_flip( Deployer::DeployersAvailable() ),
                'placeholder'           => 'vs_wct.form.mapper.deployer_placeholder',
                //'data'                  => Deployer::DEPLOYER_SYLIUS,
            ])
            
            ->add( 'fields', CollectionType::class, [
                'mapped'        => false,
                'entry_type'    => Type\MapperFieldType::class,
                'entry_options'  => [
                    'project'  => isset( $options['project'] ) ? $options['project'] : new Project(),
                ],
                'allow_add'     => true,
                'allow_delete'  => true,
                'prototype'     => true,
                'by_reference'  => false,
                'data'          => $fields ?: $options['fields'],
            ])
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver ): void
    {
        parent::configureOptions( $resolver );
        
        $resolver
            ->setDefaults([
                'csrf_protection'   => false,
                'data_class' => ProjectMapper::class,
                
                'fields'     => [
                    new ProjectMapperField(),
                ],
            ])
            
            ->setDefined([
                'fields',
                'project'
            ])
            
            ->setAllowedTypes( 'fields', 'array' )
            ->setAllowedTypes( 'project', Project::class )
        ;
    }
    
    public function getName()
    {
        return 'vs_wct.mapper';
    }
    
    private function initFields( $entity )
    {
        $fields  = null;
        if ( $entity && $entity->getId() ) {
            //$fields  = $this->pfRepo->getFields( $entity );
            $fields  = $entity->getFields();
            if ( $fields ) {
                $fields[]    = new ProjectMapperField();
            }
        }
        
        return $fields;
    }
    
    private function createField( array $data )
    {
        $field  = new ProjectMapperField();
        
        $field->setType( $data[0] );
        $field->setTitle( $data[1] );
        
        return $field;
    }
}
