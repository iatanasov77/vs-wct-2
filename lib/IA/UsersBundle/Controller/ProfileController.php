<?php

namespace IA\UsersBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use IA\UsersBundle\Form\ProfileFormType;

class ProfileController extends Controller
{
    public function showAction(Request $request)
    {
        $form = $this->createForm(new ProfileFormType(), $this->getUser());
        
        /*
         * Fetch Available Packages
         */
        $pr = $this->getDoctrine()->getRepository('IAPaidMembershipBundle:Package');
//        $search = array('enabled' => 1);
//        $order = array();
//        $packages = $pr->findBy($search, $order);
        $packages = $pr->findAll();
        
        $tplVars = array(
            'form' => $form->createView(),
            'packages' => $packages
        );
        return $this->render('IAUsersBundle:Profile:show.html.twig', $tplVars);
    }
    
}

