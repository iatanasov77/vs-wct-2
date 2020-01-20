<?php namespace App\Component;

class ProjectField
{
    public static function types()
    {
        return [
            'Text'      => 'text',
            'Picture'   => 'picture',
            'Link'      => 'link',
        ];
    }
    
    public static function destinations()
    {
        return [
            'Listing'   => 'listing',
            'Details'   => 'details'
        ];
    }
    
    public static function parseModes()
    {
        return [
            'CSS'   => 'css',
            'XPATH' => 'xpath'
        ];
    }
}
