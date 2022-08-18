<?php namespace App\Component\Deployer\Sylius;


use Vankosoft\ApplicationBundle\Component\SlugGenerator;

/**
 *
 * https://github.com/Sylius/SyliusAdminApiBundle/blob/master/docs/products.md
 * 
 * Schema for Create Product
 * =========================
 * {
 *     "code": "TEST1",
 *     "translations": {
 *         "en_US": {
 *             "name": "API Product 1",
 *             "slug": "api-product-1",
 *             "locale": "en_US"
 *         }
 *     }
 * };
 *
 */
class Sylius
{
    /** @var SlugGenerator */
    private $slugGenerator;
    
    public function __construct(
        SlugGenerator $slugGenerator
    ) {
        $this->slugGenerator            = $slugGenerator;
    }
    
    public function schemaCreateProduct()
    {
        return [
            'code'          => 'code',
            'translations'  => [
                'en_US' => [
                    'name'  => 'name',
                    'slug'      => 'slug',
                    'locale'    => 'locale',
                ]
            ]
        ];
    }
    
    public function makeCreateProductRequestBody( $mapperFields, $data )
    {
        $productName    = 'API Product 1';
        $code   = $this->slugGenerator->generate( $productName, '_', true );
        $slug   = $this->slugGenerator->generate( $productName );
        
        foreach ( $mapperFields as $mf ) {
            
        }
    }
}
