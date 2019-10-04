<?php
namespace IA\WebContentThiefBundle\Component\MapProcessor;

use IA\WebContentThiefBundle\Component\MapProcessor\ProcessorOptionsInterface;

abstract class AbstractMapProcessor
{
    protected $form;
    
    protected $projectProcessorOptions;
    
    public function getForm()
    {
        return $this->form;
    }
    
    public function setForm($form)
    {
        $this->form = $form;
        
        return $this;
    }
    
    public function getOptions() {
        if ( $this->projectProcessorOptions )
            return $this->projectProcessorOptions->getProcessorOptions();
    }

    public function getProjectFields()
    {
        return $this->projectProcessorOptions->getProjectFields();
    }
    
    public function getId() {
        return $this->projectProcessorOptions->getId();
    }
    
    public function getService() {
        return $this->projectProcessorOptions->getClass();
    }
    
    public function getTitle() {
        return $this->projectProcessorOptions->getTitle();
    }

    public function setProcessorOptions(ProcessorOptionsInterface $projectProcessorOptions) {
        $this->projectProcessorOptions = $projectProcessorOptions;
        
        return $this;
    }

    abstract public function getSchema();
    
    abstract public function process($parsedFields);
}
