<?php namespace App;

use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\Config\Resource\FileResource;
use Symfony\Component\Routing\RouteCollectionBuilder;

use Vankosoft\ApplicationBundle\Component\Application\Kernel as BaseKernel;

class WebContentThiefKernel extends BaseKernel
{
    const VERSION   = '1.8.1';
    const APP_ID    = 'web-content-thief';
    
    /**
     * {@inheritDoc}
     * @see \Symfony\Component\HttpKernel\Kernel::getProjectDir()
     * 
     * READ HERE: https://symfony.com/doc/current/reference/configuration/kernel.html#project-directory
     */
    public function getProjectDir(): string
    {
        return \dirname( __DIR__ );
    }
    
    protected function __getConfigDir(): string
    {
        return $this->getProjectDir() . '/config/applications/web-content-thief';
    }
}
