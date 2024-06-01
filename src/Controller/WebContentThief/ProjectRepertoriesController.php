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
use App\Entity\ProjectRepertoryItem;

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
        $project    = $repertory->getProject();
        $em         = $this->doctrine->getManager();
        
        $this->removeRepertoryFiles( $repertory );
        $em->remove( $repertory );
        $em->flush();
        
        return $this->redirectToRoute( 'vs_wct_projects_update', ['id' => $project->getId()] );
    }
    
    public function deleteRepertoryItemAction( $id, Request $request ): Response
    {
        $repertoryItem  = $this->doctrine->getRepository( ProjectRepertoryItem::class )->find( $id );
        $repertory      = $repertoryItem->getRepertory();
        $em         = $this->doctrine->getManager();
        
        $this->removeRepertoryItemFiles( $repertoryItem );
        $em->remove( $repertoryItem );
        $em->flush();
        
        return $this->redirectToRoute( 'vs_wct_project_preview_repertory', ['id' => $repertory->getId()] );
    }
    
    private function removeRepertoryFiles( ProjectRepertory $repertory )
    {
        foreach ( $repertory->getItems() as $item ) {
            $this->removeRepertoryItemFiles( $item );
        }
    }
    
    private function removeRepertoryItemFiles( ProjectRepertoryItem $item )
    {
        //$em         = $this->doctrine->getManager();
        $filesystem = new Filesystem();
        
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
