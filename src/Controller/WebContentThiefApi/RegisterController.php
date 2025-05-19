<?php namespace App\Controller\WebContentThiefApi;

use Vankosoft\UsersBundle\Controller\RegisterController as BaseRegisterController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;
use Symfony\Contracts\Translation\TranslatorInterface;
use Doctrine\Persistence\ManagerRegistry;
use Sylius\Component\Resource\Repository\RepositoryInterface;
use Sylius\Component\Resource\Factory\Factory;
use Vankosoft\ApplicationBundle\Component\Context\ApplicationContextInterface;
use Vankosoft\ApplicationBundle\Component\IntlSubdivision\IntlSubdivision;
use Vankosoft\UsersBundle\Security\UserManager;
use Vankosoft\UsersBundle\Security\AnotherLoginFormAuthenticator;

use App\Entity\UserManagement\UserInfo;

class RegisterController extends BaseRegisterController
{
    use GlobalFormsTrait;
    
	/** @var RepositoryInterface */
	private $customerGroupRepository;
	
    public function __construct(
        ManagerRegistry $doctrine,
        TranslatorInterface $translator,
		ApplicationContextInterface $applicationContext,
        UserManager $userManager,
        RepositoryInterface $usersRepository,
        Factory $usersFactory,
        RepositoryInterface $userRolesRepository,
        MailerInterface $mailer,
        RepositoryInterface $pagesRepository,
        UserAuthenticatorInterface $guardHandler,
        AnotherLoginFormAuthenticator $authenticator,
        array $parameters,
        RepositoryInterface $customerGroupRepository,
    ) {
        parent::__construct(
            $doctrine,
            $translator,
            $applicationContext,
            $userManager,
            $usersRepository,
            $usersFactory,
            $userRolesRepository,
            $mailer,
            $pagesRepository,
            $guardHandler,
            $authenticator,
            $parameters
        );
        
        $this->customerGroupRepository	= $customerGroupRepository;
    }
    
    public function index( Request $request, MailerInterface $mailer ): Response
    {
        if ( $this->getUser() ) {
            return $this->redirectToRoute( $this->params['defaultRedirect'] );
        }
        
        if ( $request->isMethod( 'post' ) ) {
            //return parent::index( $request, $mailer );
            return $this->handleRegisterForm( $request, $mailer );
        }
        
        $params = [
            'shoppingCart'  => $this->getShoppingCart( $request ),
        ];

        return $this->render( '@VSUsers/Register/register.html.twig', \array_merge( $params, $this->templateParams( $this->getForm() ) ) );
    }
    
    public function getStatesForCountry( $countryCode, Request $request ): Response
    {
        $states = IntlSubdivision::getStatesAndProvincesForCountry( $countryCode );
        
        return new JsonResponse( $states );
    }
    
    protected function handleRegisterForm( Request $request, MailerInterface $mailer )
    {
        $form   = $this->getForm();
        $form->handleRequest( $request );
        if ( $form->isSubmitted() ) {
            $em             = $this->doctrine->getManager();
            $formUser       = $form->getData();
            $plainPassword  = $form->get( "plain_password" )->getData();
            $oUser          = $this->userManager->createUser(
                \strstr( $formUser->getEmail(), '@', true ),
                $formUser->getEmail(),
                $plainPassword
            );
            
            $oUser->addRole( $this->userRolesRepository->findByTaxonCode( $this->params['registerRole'] ) );
			$oUser->addApplication( $this->applicationContext->getApplication() );
			$oUser->setGroup( $this->customerGroupRepository->findByTaxonCode( $this->params['registerGroup'] ) );
            
            $preferedLocale = $form->get( "prefered_locale" )->getData();
            $oUser->setPreferedLocale( $preferedLocale );
            $oUser->setVerified( false );
            $oUser->setEnabled( false );
            
            /** Populate UserInfo Values */
            $oUser->getInfo()->setTitle( $form->get( "title" )->getData() );
            $oUser->getInfo()->setFirstName( $form->get( "firstName" )->getData() );
            $oUser->getInfo()->setLastName( $form->get( "lastName" )->getData() );
            $oUser->getInfo()->setBirthday( $form->get( "birthday" )->getData() );
            $oUser->getInfo()->setCountry( $form->get( "country" )->getData() );
            $oUser->getInfo()->setState( $form->get( "state" )->getData() );
            $oUser->getInfo()->setCity( $form->get( "city" )->getData() );
            $oUser->getInfo()->setAddress( $form->get( "address" )->getData() );
            $oUser->getInfo()->setZip( $form->get( "zip" )->getData() );
            $oUser->getInfo()->setPhone( $form->get( "phone" )->getData() );
            $oUser->getInfo()->setMobile( $form->get( "mobile" )->getData() );
            
            $em->persist( $oUser );
            $em->flush();
            
            $this->sendConfirmationMail( $oUser, $mailer );
            
            return $this->redirectToRoute( $this->params['defaultRedirect'] );
        }
    }
}
