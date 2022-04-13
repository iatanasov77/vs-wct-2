<?php namespace App\Repository;

use Sylius\Bundle\ResourceBundle\Doctrine\ORM\EntityRepository;
use App\Component\ProjectField as ProjectFieldHelper;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class ProjectFieldsRepository extends EntityRepository
{
    public function getProjectListingFields( $project ): Collection
    {
        return new ArrayCollection( $this->findBy( ['project' => $project, 'collectionType' => ProjectFieldHelper::COLLECTION_LISTING] ) );
    }
    
    public function getProjectDetailsFields( $project ): Collection
    {
        return new ArrayCollection( $this->findBy( ['project' => $project, 'collectionType' => ProjectFieldHelper::COLLECTION_DETAILS] ) );
    }
}
