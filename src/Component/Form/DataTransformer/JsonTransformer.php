<?php namespace App\Component\Form\DataTransformer;

use Symfony\Component\Form\DataTransformerInterface;

/**
 * Handles transforming json to array and backward
 */
class JsonTransformer implements DataTransformerInterface
{
    
    /**
     * @inheritDoc
     */
    public function reverseTransform( $value ): array
    {
        if ( empty( $value ) ) {
            return [];
        }
        
        return \json_decode( $value, true );
    }
    
    /**
     * @ihneritdoc
     */
    public function transform( $value ): string
    {
        if ( empty( $value ) ) {
            return \json_encode( [] );
        }
        
        return \json_encode( $value );
    }
}
