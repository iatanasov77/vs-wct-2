<?php namespace App\Component\Uploader;

use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\File\File;
use Sylius\Component\Resource\Factory\FactoryInterface;
use League\Flysystem\Filesystem as LeagueFilesystem;

use Vankosoft\CmsBundle\Component\Uploader\AbstractFileUploader;
use Vankosoft\CmsBundle\Component\Uploader\FilemanagerUploader;
use Vankosoft\CmsBundle\Component\Generator\FilePathGeneratorInterface;
use App\Entity\ProjectRepertoryField;

final class RepertoryFieldFileUploader extends FilemanagerUploader
{
    /** @var FactoryInterface */
    private $repertoryFieldFileFactory;
    
    /** @var string */
    private $downloadDirectory;
    
    public function __construct(
        LeagueFilesystem $filesystem,
        FilePathGeneratorInterface $filePathGenerator,
        FactoryInterface $repertoryFieldFileFactory,
        string $downloadDirectory
    ) {
        parent::__construct( $filesystem, $filePathGenerator );
        
        $this->repertoryFieldFileFactory    = $repertoryFieldFileFactory;
        $this->downloadDirectory            = $downloadDirectory;
    }
    
    public function createRepertoryFieldFile( ProjectRepertoryField &$repertoryField, string $url )
    {
        $originalFileName   = \basename( $url );
        $downloadFile       = $this->generateDownloadFile( $url );
        
        $outputStream   = \fopen( $downloadFile, 'wb' );
        $fileStream     = \fopen( $url, 'rb' );
        
        while ( ! feof( $fileStream ) ) \fwrite( $outputStream, \fread( $fileStream, 1000 ) );
        
        $repertoryFieldFile  = $this->repertoryFieldFileFactory->createNew();
        $repertoryFieldFile->setOriginalName( $originalFileName );
        $repertoryFieldFile->setRepertoryField( $repertoryField );
        
        $downloadedFile     = new File( $downloadFile );
        $repertoryFieldFile->setFile( $downloadedFile );
        $this->upload( $repertoryFieldFile );
        $repertoryFieldFile->setFile( null ); // reset File Because: Serialization of 'Symfony\Component\HttpFoundation\File\UploadedFile' is not allowed
        
        $repertoryField->setRepertoryFieldFile( $repertoryFieldFile );
    }
    
    private function generateDownloadFile( string $url ): string
    {
        $filesystem         = new Filesystem();
        $originalFilename   = \pathinfo( $url, PATHINFO_FILENAME );
        $extension          = \pathinfo( $url, PATHINFO_EXTENSION );
        
        // this is needed to safely include the file name as part of the URL
        $safeFilename       = \transliterator_transliterate( 'Any-Latin; Latin-ASCII; [^A-Za-z0-9_] remove; Lower()', $originalFilename );
        $uniqId             = \uniqid();
        
        $downloadFilePath   = \sprintf( '%s/%s-%s.%s', $this->downloadDirectory, $safeFilename, $uniqId, $extension );
        $filesystem->touch( $downloadFilePath );
        
        return $downloadFilePath;
    }
}
