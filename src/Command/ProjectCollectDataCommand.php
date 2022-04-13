<?php namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

use App\Component\Collector\Collector;

final class ProjectCollectDataCommand extends AbstractCommand
{
    protected static $defaultName = 'wct:project:collect';
    
    public function __construct( ContainerInterface $container )
    {
        parent::__construct( $container );
    }
    
    protected function configure(): void
    {
        $this
            ->setDescription( 'WCT Project Collect Data Command.' )
            ->setHelp(<<<EOT
The <info>%command.name%</info> command allows user to collect data for a WCT Project.
EOT
            )
            ->addOption(
                'project-id',
                'p',
                InputOption::VALUE_REQUIRED,
                'Project ID That Should To Be Collected.',
                null
            )
            ->addOption(
                'collection-type',
                'c',
                InputOption::VALUE_OPTIONAL,
                'Collection Type To Be Collected.',
                'listing'
            )
        ;
    }
    
    protected function execute( InputInterface $input, OutputInterface $output ): int
    {
        $collector          = $this->getContainer()->get( 'vs_wct.collector' );
        $project            = $this->getContainer()->get( 'vs_wct.repository.projects' )
                                                    ->find( $input->getOption( 'project-id' ) );
        $collectionType     = $input->getOption( 'collection-type' );
        
        $outputStyle        = new SymfonyStyle( $input, $output );
        $collector->initialize( $project, $outputStyle );
        
        if ( $collector->getStatus() == Collector::STATUS_SUCCESS ) {
            $collector->runCollector();
            $errored    = false;
        } else {
            $errored    = true;
        }
        
        return $errored ? Command::FAILURE : Command::SUCCESS;
    }
    
    private function createProjectItem()
    {
        $entityManager      = $this->getContainer()->get( 'doctrine.orm.entity_manager' );
    }
}