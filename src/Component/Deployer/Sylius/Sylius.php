<?php namespace App\Component\Deployer\Sylius;


/**
 *
 * https://github.com/Sylius/SyliusAdminApiBundle/blob/master/docs/products.md
 *
 */
class Sylius
{
    public static function schemaCreateProduct()
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
        
        
        /*
         
        {
            "code": "TEST1",
            "translations": {
                "en_US": {
                    "name": "API Product 1",
                    "slug": "api-product-1",
                    "locale": "en_US"
                    }
                }
        };
        
        */
    }
}
