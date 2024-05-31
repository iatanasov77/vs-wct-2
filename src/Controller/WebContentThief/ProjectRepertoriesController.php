<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Symfony\Component\Filesystem\Filesystem;
use Doctrine\Persistence\ManagerRegistry;
use ZipStream;

use Vankosoft\ApplicationBundle\Component\Status;
use App\Entity\ProjectRepertory;

class ProjectRepertoriesController extends AbstractController
{
    /** @var ManagerRegistry **/
    private $doctrine;
    
    /** @var string **/
    private $repertoryFieldsFilesDirectory;
    
    public function __construct( ManagerRegistry $doctrine, string $repertoryFieldsFilesDirectory )
    {
        $this->doctrine                         = $doctrine;
        $this->repertoryFieldsFilesDirectory    = $repertoryFieldsFilesDirectory;
    }
    
    public function previewRepertoryAction( $id, Request $request ): Response
    {
        $repertory  = $this->doctrine->getRepository( ProjectRepertory::class )->find( $id );
        
        return $this->render( 'Pages/ProjectRepertories/preview.html.twig', [
            'repertory'                     => $repertory,
            'repertoryFieldsFilesDirectory' => $this->repertoryFieldsFilesDirectory,
        ]);
    }
    
    /**
     * MANUAL: https://maennchen.dev/ZipStream-PHP/guide/Symfony.html
     */
    public function downloadRepertoryAction( $id, Request $request ): Response
    {
        $repertory  = $this->doctrine->getRepository( ProjectRepertory::class )->find( $id );
        $fileName   = \sprintf( '%s.zip' , $repertory->getProject()->getTitle() );
        
        $response   = new StreamedResponse( function() use ( $repertory, $fileName )
        {
            $zip = new ZipStream\ZipStream(
                outputName: $fileName,
                defaultEnableZeroHeader: true,
                contentType: 'application/octet-stream',
            );
            
            foreach ( $repertory->getItems() as $item ) {
                foreach ( $item->getFields() as $field ) {
                    $oFile  = $field->getRepertoryFieldFile();
                    if ( ! $oFile ) {
                        continue;
                    }
                    
                    $filePath   = \sprintf( '%s/%s', $this->repertoryFieldsFilesDirectory, $oFile->getPath() );
                    if ( $streamRead = \fopen( $filePath, 'r' ) ) {
                        $zip->addFileFromStream(
                            fileName: '/TestDir1/' . $oFile->getOriginalName(),
                            stream: $streamRead,
                        );
                    } else {
                        die( 'Could not open stream for reading' );
                    }
                }
            }
            
            $zip->finish();
        });
        
        return $response;
    }
    
    /**
     * Get Repertory Items as JSON for Mappers
     * 
     * @param integer $id
     * @param Request $request
     * 
     * @return Response
     */
    public function getJsonAction( $id, Request $request ): Response
    {
        $repertory      = $this->doctrine->getRepository( ProjectRepertory::class )->find( $id );
        
        $response           = [
            'status'    => Status::STATUS_OK,
            'repertory' => [],
        ];
        $i  = 0;
        foreach ( $repertory->getItems() as $item ) {
            $response['repertory'][$i]  = [
                'itemId'    => $item->getId(),
                'fields'    => [],
            ];
            foreach ( $item->getFields() as $field ) {
                $response['repertory'][$i]['fields'][]    = [
                    'projectField'  => $field->getProjectField()->getId(),
                    'content'       => $field->getContent(),
                ];
            }
            
            $i++;
        }
        
        return new JsonResponse( $response );
    }
    
    public function deleteRepertoryAction( $id, Request $request ): Response
    {
        $repertory  = $this->doctrine->getRepository( ProjectRepertory::class )->find( $id );
        $em         = $this->doctrine->getManager();
        
        $this->removeRepertoryFiles( $repertory );
        $em->remove( $repertory );
        $em->flush();
        
        return new JsonResponse([
            'status'    => Status::STATUS_OK,
        ]);
    }
    
    private function removeRepertoryFiles( ProjectRepertory $repertory )
    {
        $em         = $this->doctrine->getManager();
        $filesystem = new Filesystem();
        
        foreach ( $repertory->getItems() as $item ) {
            foreach ( $item->getFields() as $field ) {
                $oFile  = $field->getRepertoryFieldFile();
                if ( ! $oFile ) {
                    continue;
                }
                $filePath   = \sprintf( '%s/%s', $this->repertoryFieldsFilesDirectory, $oFile->getPath() );
            
                /*
                $em->remove( $field );
                $em->flush();
                */
                $filesystem->remove( $filePath );
            }
        }
    }
}
