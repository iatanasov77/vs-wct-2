<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class ProjectProcessorType extends AbstractType implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    public function getName()
    {
        return 'ia_web_content_thief_project_processors';
    }

    public function __construct($container = null)
    {
        $this->container = $container;
    }
    
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->setAction($this->container->get('router')->generate('ia_web_content_thief_project_processors_create'))
            ->add('projectId', 'hidden')
            ->add('options', 'hidden')
            ->add('title', 'text', array('label' => 'Title'))
            ->add('class', 'choice', array(
                'label'   => 'Type',
                'choices' => array('' => '-- Select Processor --') + $this->container->getParameter('ia_web_content_thief.map_processors')
            ))
            ->add('btnAdd', 'submit', array('label' => 'Add Processor'))
            ->add('btnCancel', 'button', array('label' => 'Cancel'))
                
            ->addEventListener(FormEvents::SUBMIT, array($this, 'onSubmit'))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'IAWebContentThiefBundle\Entity\ProjectProcessor'
        ));
    }
    
    /**
     * Submit Event Listener Callback
     * 
     * @param FormEvent $event
     * 
     * @TODO Ð¢ÑƒÐº Ð·Ð°Ð²ÑŠÑ€Ñ‚Ñ�Ñ… Ð³Ð¾Ð»Ñ�Ð¼Ð° Ð¼Ð°Ð³Ð¸Ñ� , Ñ‰Ðµ Ñ‚Ñ€Ñ�Ð±Ð²Ð° Ð´Ð° Ñ� Ñ€Ð°Ð·Ð½Ð¸Ñ‰Ñ�.
     */
    public function onSubmit(FormEvent $event)
    {
        $data = $event->getData();
        
        $em = $this->container->get('doctrine.orm.entity_manager');
        $project = $em->getRepository('IAWebContentThiefBundle:Project')->find($_POST['ia_web_content_thief_project_processors']['projectId']);
        $data->setProject($project);
        
        $options = $_POST['options'];
        unset($options['_token']);
        $data->setOptions(json_encode($options));
        
        $event->setData($data);
    }

}



