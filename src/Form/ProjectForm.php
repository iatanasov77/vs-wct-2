<?php namespace App\Form;

use Vankosoft\ApplicationBundle\Form\AbstractForm;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\HttpFoundation\RequestStack;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

use Vankosoft\ApplicationBundle\Component\I18N;
use App\Entity\ProjectCategory;
use App\Entity\Project;
use App\Entity\ProjectField;
use App\Form\Type\ProjectFieldType;
use App\Repository\ProjectFieldsRepository;
use App\Component\ProjectField as ProjectFieldHelper;

class ProjectForm extends AbstractForm
{
    protected $requestStack;
    protected $pfRepo;
    
    public function __construct(
        string $dataClass,
        RequestStack $requestStack,
        ProjectFieldsRepository $pfRepo
    ) {
        parent::__construct( $dataClass );
        
        $this->requestStack = $requestStack;
        $this->pfRepo       = $pfRepo;
    }
    
    public function buildForm( FormBuilderInterface $builder, array $options ): void
    {
        parent::buildForm( $builder, $options );

        $fields = $this->initFields( $builder->getData() );
        
        $builder
            ->add( 'title', TextType::class, [
                'label'                 => 'vs_wct.form.name',
                'translation_domain'    => 'WebContentThief',
            ])
            ->add( 'category', EntityType::class, [
                'class'                 => ProjectCategory::class,
                'choice_label'          => 'name',
                'required'              => true,
                'label'                 => 'vs_wct.form.category',
                'placeholder'           => 'vs_wct.form.category_placeholder',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'url', TextType::class, [
                'label'                 => 'Url',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'listingContainerElement', TextType::class, [
                'required'              => false,
                'label'                 => 'Listing Container Element',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'detailsLink', TextType::class, [
                'required'              => false,
                'label'                 => 'Details Link',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'pagerLink', TextType::class, [
                'required'              => false,
                'label'                 => 'Pager Link',
                'translation_domain'    => 'WebContentThief',
            ])
            
            ->add( 'listingFields', CollectionType::class, [
                'mapped'        => false,
                'entry_type'    => ProjectFieldType::class,
                'allow_add'     => true,
                'allow_delete'  => true,
                'prototype'     => true,
                'by_reference'  => false,
                'data'          => $fields[ProjectFieldHelper::COLLECTION_LISTING] ?: $options['listingFields'],
            ])
            
            ->add( 'detailsFields', CollectionType::class, [
                'mapped'        => false,
                'entry_type'    => ProjectFieldType::class,
                'allow_add'     => true,
                'allow_delete'  => true,
                'prototype'     => true,
                'by_reference'  => false,
                'data'          => $fields[ProjectFieldHelper::COLLECTION_DETAILS] ?: $options['detailsFields'],
            ])
        ;
    }
    
    public function configureOptions( OptionsResolver $resolver ): void
    {
        parent::configureOptions( $resolver );
        
        $resolver
            ->setDefaults([
                'csrf_protection'   => false,
                
                'listingFields'     => [
//                     $this->createField( ['link', 'Details Link'] ),
//                     $this->createField( ['link', 'Pager Link'] ),
                    new ProjectField(),
                ],
                'detailsFields'     => [
                    new ProjectField(),
                ],
            ])
            
            ->setDefined([
                'project',
                
                'listingFields',
                'detailsFields',
            ])
            
            ->setAllowedTypes( 'project', Project::class )
            ->setAllowedTypes( 'listingFields', 'array' )
            ->setAllowedTypes( 'detailsFields', 'array' )
        ;
    }
    
    public function getName()
    {
        return 'vs_wct.project';
    }
    
    private function initFields( $entity )
    {
        $listingFields  = null;
        $detaisFields   = null;
        if ( $entity->getId() ) {
            $listingFields  = $this->pfRepo->getProjectListingFields( $entity );
            if ( $listingFields ) {
                $listingFields[]    = new ProjectField();
            }
            
            $detaisFields   = $this->pfRepo->getProjectDetailsFields( $entity );
            if ( $detaisFields ) {
                $detaisFields[]     = new ProjectField();
            }
        }
        
        return [
            ProjectFieldHelper::COLLECTION_LISTING  => $listingFields,
            ProjectFieldHelper::COLLECTION_DETAILS  => $detaisFields,
        ];
    }
    
    private function createField( array $data )
    {
        $field  = new ProjectField();
        
        $field->setType( $data[0] );
        $field->setTitle( $data[1] );
        
        return $field;
    }
}
