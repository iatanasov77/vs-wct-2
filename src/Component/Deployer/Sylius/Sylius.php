<?php namespace App\Component\Deployer\Sylius;

use App\Component\Deployer\AbstractDeployer;

/**
 *
 * https://github.com/Sylius/SyliusAdminApiBundle/blob/master/docs/products.md
 * https://master.demo.sylius.com/api/v2/docs
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
class Sylius extends AbstractDeployer
{
    public function getSchema(): array
    {
        return [
            'create_product'    => [
                'code'          => 'code',
                'translations'  => [
                    'en_US' => [
                        'name'      => 'name',
                        'slug'      => 'slug',
                        'locale'    => 'locale',
                    ]
                ]
            ]
        ];
    }
    
    public function makeRequestBody( $endPointKey, $mapper, $repertory ): array
    {
        switch ( $endPointKey ) {
            case 'create_product':
                $mapperFields   = $this->getMapperFields( $mapper );
                $repertoryItems = $this->getRepertoryItems( $repertory );
                
                return $this->makeCreateProductRequestBody( $mapperFields, $repertoryItems );
                break;
            default:
                throw new \Exception( 'NOT SUCH DEPLOYER ENDPOINT !!!' );
        }
    }
    
    /**
     * Make Api Request Body for 'Create Product'
     * 
     * Code and Slug should be suffixed with uniqid(), because sometimes 
     * there are products with the same name but its are different products
     * 
     * The problem is for deletetion because i use code for delete request.
     * One Solution is to Store Deployments in Database with generated codes
     * 
     * @param array $mapperFields
     * @param array $repertoryItems
     * 
     * @return array
     */
    private function makeCreateProductRequestBody( $mapperFields, $repertoryItems ): array
    {
        $locale     = 'en_US';
        $response   = [];
        //echo '<pre>'; var_dump( $mapperFields ); die;
        if ( ! isset( $mapperFields['name'] ) ) {
            return $response;
        }
        
        foreach ( $repertoryItems as $item ) {
            if ( ! isset( $item['fields'][$mapperFields['name']] ) ) {
                continue;
            }
            
            $productName    = $item['fields'][$mapperFields['name']];
            $code           = $this->slugGenerator->generate( $productName, '_', true );
            $slug           = $this->slugGenerator->generate( $productName );
            
            $response[]     = [
                'code'          => $code,
                'translations'  => [
                    $locale => [
                        'name'      => $productName,
                        'slug'      => $slug,
                        'locale'    => $locale,
                    ]
                ]
            ];
        }
        
        return $response;
    }
}
