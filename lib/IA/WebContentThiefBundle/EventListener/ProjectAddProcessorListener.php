<?php
namespace IA\WebContentThiefBundle\EventListener;

use Symfony\Component\EventDispatcher\GenericEvent;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;

use IAWebContentThiefBundle\Entity\MapperMapping;

class ProjectAddProcessorListener implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    public function onCreate(GenericEvent $event)
    {
        var_dump($this->indexer); die;
        
    }
}
