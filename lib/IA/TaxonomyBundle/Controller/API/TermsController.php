<?php

namespace IA\TaxonomyBundle\Controller\API;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class TermsController extends Controller
{
 
    /*
     * EXAMPLE RETURNED DATA
     * ======================
        $data = [
            (object) [
                'text' => 'Root',
                'state' => (object) [
                    'opened' => true,
                    'selected' => true
                ],
                'data' => (object) [
                    'termId' => null
                ],
                'children' => [
                    (object) [
                        'text' => 'Child 1',
                        'data' => (object) [
                            'termId' => 1
                        ],
                    ],
                    (object) [
                        'text' => 'Child 2',
                        'data' => (object) [
                            'termId' => 2
                        ],
                    ]
                ]
            ]
        ];
         
     */
    public function getJsonTreeAction($vocabularyId, Request $request)
    {
        $tr = $this->getDoctrine()->getRepository('IATaxonomyBundle\Entity\Term');
        $tr->setVocabularyId($vocabularyId);
        $data = $tr->getJsTree();
        
        return new JsonResponse($data);
    }
    

    public function getJsonGTreeTableAction($vocabularyId, Request $request)
    {
        // Example
        $data = [
            'nodes' => [
                (object)[
                    "id" => "1",
                    "name" => "node name",
                    "level" => "1", 
                    "type" => "default" 
                ], 
                (object)[
                    "id" => "2",
                    "name" => "node name 2",
                    "level" => "1", 
                    "type" => "default" 
                ]
            ]  
        ];
        return new JsonResponse($data);
    }
}
