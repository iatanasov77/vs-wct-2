<?php namespace App\Controller\WebContentThief;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\KernelInterface;

use App\ApplicationBundle\Controller\Traits\ConsoleCommandTrait;

class CollectorController extends AbstractController
{
    use ConsoleCommandTrait;
    
    private $kernel;
    
    public function __construct( KernelInterface $kernel )
    {
        $this->kernel   = $kernel;
    }
    
    public function collectDataAction( Request $request ): Response
    {
        if ( $request->isMethod( 'post' ) ) {
            $formData   = $request->request->get( 'project_collector_form' );
            $command    = [
                'command'           => 'wct:project:collect',
                '--project-id'      => $formData['projectId'],
                '--collection-type' => $formData['collectionType'],
            ];
            
            return $this->streamedCommandResponse( $command );
        }
    }
    
    protected function getKernel(): KernelInterface
    {
        return $this->kernel;
    }
}
