<?php namespace App\Command;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Helper\ProgressBar;
use Symfony\Component\Console\Helper\Table;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\NullOutput;
use Symfony\Component\Console\Output\OutputInterface;

use Vankosoft\ApplicationBundle\Command\ContainerAwareCommand;

abstract class AbstractWctCommand extends ContainerAwareCommand
{
    protected function getEnvironment(): string
    {
        return (string) $this->getParameter( 'kernel.environment' );
    }
    
    protected function isDebug(): bool
    {
        return (bool) $this->getParameter( 'kernel.debug' );
    }
    
    protected function renderTable( array $headers, array $rows, OutputInterface $output ): void
    {
        $table  = new Table( $output );
        
        $table
            ->setHeaders( $headers )
            ->setRows( $rows )
            ->render()
        ;
    }
    
    protected function createProgressBar( OutputInterface $output, int $length = 10 ): ProgressBar
    {
        $progress   = new ProgressBar( $output );
        $progress->setBarCharacter( '<info>░</info>' );
        $progress->setEmptyBarCharacter( ' ' );
        $progress->setProgressCharacter( '<comment>░</comment>' );
        
        $progress->start( $length );
        
        return $progress;
    }
    
    protected function ensureDirectoryExistsAndIsWritable( string $directory, OutputInterface $output ): void
    {
        $checker    = $this->get( 'vs_app.installer.checker.command_directory' );
        $checker->setCommandName( $this->getName() );
        
        $checker->ensureDirectoryExists( $directory, $output );
        $checker->ensureDirectoryIsWritable( $directory, $output );
    }
}
