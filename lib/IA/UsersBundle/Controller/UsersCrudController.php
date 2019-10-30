<?php

namespace IA\UsersBundle\Controller;

use Sylius\Bundle\ResourceBundle\Controller\ResourceController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Spatie\Url\Url as SpatieUrl;

use IA\UsersBundle\Entity\User;
use IA\UsersBundle\Entity\UserInfo;
use IA\UsersBundle\Form\UserCrudFormType;

class UsersCrudController extends ResourceController
{
    public function createAction( Request $request ): Response
    {
        $tplVars    = $this->processRequest( $request );
        return $this->render('IAUsersBundle:UsersCrud:create.html.twig', $tplVars);
    }
    
    public function updateAction( Request $request ) : Response
    {
        $tplVars    = $this->processRequest( $request );
        return $this->render( 'IAUsersBundle:UsersCrud:create.html.twig', $tplVars );
    }
    
    protected function processRequest( Request $request )
    {
        //$id = Url::ProjectsUrlGetId();
        $id = $this->getId();
        
        $er = $this->getDoctrine()->getRepository( 'IA\UsersBundle\Entity\User' );
        $user = $id ? $er->find($id) : new User();
        
        $form = $this->createForm( UserCrudFormType::class, $user, ['data' => $user] );
        
        //if($form->isSubmitted()) {
        if($request->isMethod('POST') || $request->isMethod('PUT')) {
            $form->handleRequest($request);
            $formUser   = $form->getData();
            
            $email   = $formUser->getEmail();
            $username   = $formUser->getUserName();
            $password   = $formUser->getPassword();
            
            $userManager = $this->get('fos_user.user_manager');
            $user = $userManager->createUser();
            $user->setUsername( $username );
            $user->setEmail( $email );
            $user->setEmailCanonical( $email );
            //$user->setLocked( 0 ); // don't lock the user
            $user->setEnabled( 1 ); // enable the user or enable it later with a confirmation token in the email
            // this method will encrypt the password with the default settings :)
            $user->setPlainPassword( $password );
            $userManager->updateUser( $user );
            
            return $this->redirect($this->generateUrl('ia_users_users_crud_index'));
        }
        
        $tplVars = array(
            'form'          => $form->createView(),
            'item'          => $user,
        );
        return $tplVars;
    }
    
    protected function getId()
    {
        $url = SpatieUrl::fromString( $_SERVER['REQUEST_URI'] );
        return intval( $url->getSegment( 3 ) );
    }
    
}
