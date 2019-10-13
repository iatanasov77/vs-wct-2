<?php
namespace App\EventListener;

use Symfony\Component\EventDispatcher\GenericEvent;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;

use IAWebContentThiefBundle\Entity\MapperMapping;

class MapperListener implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    public function onCreate(GenericEvent $event)
    {
        $procClass = $event->getSubject()->getProcessor();
        if(!empty($procClass) && class_exists($procClass)) {
            $processor = new $procClass($this->container);
            
            foreach($processor->getSchema() as $processorField) {
                $mapping = new MapperMapping();
                $mapping->setMapProcessorField($processorField);
                
                $event->getSubject()->addMapping($mapping);
            }
        }
    }
}
