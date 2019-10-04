<?php

namespace IA\TaxonomyBundle\Entity\Repository;

use Sylius\Component\Resource\Model\ResourceInterface;
use Sylius\Component\Resource\Repository\RepositoryInterface as ResourceRepositoryInterface;
use Sylius\Bundle\ResourceBundle\Doctrine\ORM\EntityRepository as ResourceRepository;
use Gedmo\Tree\Entity\Repository\NestedTreeRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\ClassMetadata;
use Doctrine\ORM\Query\Expr\Join;


/**
 * TermsRepository
 * 
 * Ако можех да използвам 'Gedmo Doctrine Extensions - dev-master' щях да използвам за 
 * базов клас Sylius\Bundle\ResourceBundle\Doctrine\ORM\EntityRepository,
 * а за NestedTree щях да използвам трейта на Gedmo Gedmo\Tree\Traits\Repository\ORM\NestedTreeRepositoryTrait
 * 
 * но не става щото в SyliusResourceBundle използват стара версия на Stof Doctrine Extensions, а те
 * от своя страна зависят от стара версия на Gedmo Doctrine Extension
 * 
 */
class TermsRepository extends NestedTreeRepository implements ResourceRepositoryInterface
{

    /**
     * Sylius Resource Repository
     *
     * @var Sylius\Bundle\ResourceBundle\Doctrine\ORM\EntityRepository
     */
    private $rr;
    
    protected $_vocabularyId;
    
    public function __construct(EntityManager $em, ClassMetadata $class)
    {
        parent::__construct($em, $class);
        $this->rr = new ResourceRepository($em, $class);
    }
    
    function getVocabularyId()
    {
        return $this->_vocabularyId;
    }

    function setVocabularyId($vocabularyId)
    {
        $this->_vocabularyId = $vocabularyId;
        return $this;
    }
    
    /**
     * {@inheritdoc}
     */
    public function createPaginator(array $criteria = [], array $sorting = []) : iterable
    {
        return $this->rr->createPaginator($criteria, $sorting);
    }

    /**
     * {@inheritdoc}
     */
    public function add(ResourceInterface $resource) : void
    {
        $this->rr->add($resource);
    }

    /**
     * {@inheritdoc}
     */
    public function remove(ResourceInterface $resource) : void
    {
        $this->rr->remove($resource);
    }
    
    public function getJsTree()
    {        
        $rootNode = (object) [
            'text' => 'Categories',
            'state' => (object) [
                'opened' => true,
            ],
            'data' => (object) [
                'termId' => 0
            ]
        ];

        $nodes = $this->getNodesHierarchy();
        $nestedTree = array();
        $l = 0;
        if (count($nodes) > 0) {
            $stack = array();
            foreach ($nodes as $child) {
                $item = (object) [
                    'text' => $child['name'],
                    'data' => (object) [
                        'termId' => $child['id']
                    ]
                ];
                $item->children = array();
                $l = count($stack); // Number of stack items
                
                // Stack is empty (we are inspecting the root)
                if ($l == 0) {
                    // Assigning the root child
                    $i = count($nestedTree);
                    $nestedTree[$i] = $item;
                    $stack[] = &$nestedTree[$i];
                } else {
                    // Add child to parent
                    $i = count($stack[$l - 1]->children);
                    $stack[$l - 1]->children[$i] = $item;
                    $stack[] = &$stack[$l - 1]->children[$i];
                }
            }
        }

        $rootNode->children = $nestedTree;
        
        return $rootNode;
    }

    public function getNodesHierarchyQueryBuilder($node = null, $direct = false, array $options = array(), $includeNode = false)
    {
        $qb = parent::getNodesHierarchyQueryBuilder($node, $direct, $options, $includeNode);
        if($this->_vocabularyId) {
            $qb->innerJoin('IATaxonomyBundle\Entity\Vocabulary', 'v', Join::WITH, 'v.id = node.vocabulary_id')
                ->andWhere('v.id = ' . $this->_vocabularyId);
        }
        
        return $qb;
    }
}
