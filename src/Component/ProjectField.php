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
}
