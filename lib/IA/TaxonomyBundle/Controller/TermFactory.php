<?php

namespace IA\TaxonomyBundle\Controller;

use Sylius\Component\Resource\Factory\FactoryInterface;
use  IATaxonomyBundle\Entity\Term;
use Doctrine\ORM\EntityRepository;

/**
 * Creates resources based on theirs FQCN.
 *
 * @author Paweł Jędrzejewski <pawel@sylius.org>
 */
class TermFactory implements FactoryInterface
{

    /**
     * Vocabulary Entity Repository
     * 
     * @var EntityRepository
     */
    private $vr;
    
    public function __construct(EntityRepository $vr)
    {
        $this->vr = $vr;
    }
    
    /**
     * {@inheritdoc}
     */
    public function createNew()
    {
        throw new \Exception('Use method "createNewTerm($vocabularyId)"  instead.');
    }
    
    public function createNewTerm($vocabularyId)
    {
        $vocabulary = $this->vr->find($vocabularyId);
        if(!$vocabulary) {
            throw new \Exception("Cannot find this vocabulary");
        }
        return new Term($vocabulary);
    }
}

