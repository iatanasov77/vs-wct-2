<?php

namespace IA\CmsBundle\DependencyInjection;

use Symfony\Component\HttpKernel\DependencyInjection\Extension;
use Symfony\Component\DependencyInjection\Extension\PrependExtensionInterface;

use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\Loader;
use Symfony\Component\Yaml\Yaml;

use Symfony\Component\Config\Definition\Processor;

/**
 * This is the class that loads and manages your bundle configuration
 *
 * To learn more see {@link http://symfony.com/doc/current/cookbook/bundles/extension.html}
 */
class IACmsExtension extends Extension implements PrependExtensionInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(array $configs, ContainerBuilder $container)
    {
        // Configuration
        $configuration = new Configuration();
        $config = $this->processConfiguration( $configuration, $configs );
        
        /*
         * Load Service and parameters
         */
        $loader = new Loader\YamlFileLoader($container, new FileLocator(__DIR__.'/../Resources/config'));
        $loader->load('services.yml');
    }
    
    public function prepend(ContainerBuilder $container)
    {
//        // get all bundles
//        $bundles = $container->getParameter('kernel.bundles');
//        
//        // determine if IAAngularApplicationBundle is registered
//        if (!isset($bundles['IAAngularApplicationBundle'])) {
//            throw new \Exception('IACmsBundle require IAAngularApplicationBundle.');
//            
//        }
//           
//        $config = Yaml::parse(file_get_contents(__DIR__ . '/../Resources/config/routing_angular.yml'));
//        
//        /*
//         * RequireJs Config
//         */
//        $container->prependExtensionConfig('hearsay_require_js', $config['requirejs']);
//        
//        /*
//         * AngularJs Config
//         */
//        $container->prependExtensionConfig( 'ia_angular_application', $config['angular']);
        
    }
    
   
}
