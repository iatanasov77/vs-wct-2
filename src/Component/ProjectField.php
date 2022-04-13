<?php namespace App\Component;

class ProjectField
{
    const COLLECTION_LISTING    = 'listing';
    const COLLECTION_DETAILS    = 'details';
    
    const TYPE_TEXT             = 'text';
    const TYPE_PICTURE          = 'picture';
    const TYPE_LINK             = 'link';
    
    public static function types()
    {
        return [
            self::TYPE_TEXT      => 'Text',
            self::TYPE_PICTURE   => 'Picture',
            self::TYPE_LINK      => 'Link',
        ];
    }
    
    public static function destinations()
    {
        return [
            self::COLLECTION_LISTING   => 'Listing',
            self::COLLECTION_DETAILS   => 'Details',
        ];
    }
    
    public static function parseModes()
    {
        return [
            'css'   => 'CSS',
            'xpath' => 'XPATH',
        ];
    }
}
