<?php
namespace App\Component;

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;
use Symfony\Component\Security\Core\Authorization\AuthorizationChecker;
use Symfony\Component\HttpFoundation\RequestStack;

use Knp\Menu\FactoryInterface;
use Knp\Menu\Matcher\Voter\RouteVoter;

class MenuBuilder implements ContainerAwareInterface
{
    use ContainerAwareTrait;
    
    protected $securityContext;
    
    protected $isLoggedIn;
    
    protected $isAdmin;
    
    public function __construct( AuthorizationChecker $securityContext, RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
        $this->securityContext = $securityContext;
        $this->isLoggedIn = $this->securityContext->isGranted('IS_AUTHENTICATED_FULLY');
        $this->isAdmin = $this->securityContext->isGranted('ROLE_ADMIN');
    }
    
    public function mainMenu(FactoryInterface $factory)
    {
        $request    = $this->requestStack->getCurrentRequest();
        $menu       = $factory->createItem('root');
        
        //Projects
        $menu->addChild('Projects', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_document_alt')));
        $menu['Projects']->addChild('List Projects', array('route' => 'ia_web_content_thief_projects_index'));
        $menu['Projects']->addChild('Create New Project', array(
            'route' => 'ia_web_content_thief_projects_create'
        ));
        if ( $request->get( '_route' ) == 'ia_web_content_thief_projects_update' ) {
            $menu['Projects']->addChild('Edit Project', ['route' => 'ia_web_content_thief_projects_update', 'routeParameters' => ['id' => $request->query->get('id')]]);
        }
        
        
        // Fieldsets
        $menu->addChild('Fieldsets', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_table')));
        $menu['Fieldsets']->addChild('List Fieldsets', array('route' => 'ia_web_content_thief_fieldsets_index'));
        $menu['Fieldsets']->addChild('Create New Fieldset', array(
            'route' => 'ia_web_content_thief_fieldsets_create',
            'routeParameters' => array('id' => 0)
        ));
        
        
        
        if($this->isAdmin) {
            // Users
            $menu->addChild('Users', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_genius')));
            $menu['Users']->addChild('List Users', array('route' => 'ia_users_users_index'));
            $menu['Users']->addChild('Create New User', array(
                'route' => 'ia_users_users_create',
                'routeParameters' => array('id' => 0)
            ));
            
            // Membership
            $menu->addChild('Membership', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_genius')));
            
            $menu['Membership']->addChild('List Packages', array('route' => 'ia_users_packages_index'));
            $menu['Membership']->addChild('Create New Package', array(
                'route' => 'ia_users_packages_create',
                'routeParameters' => array('id' => 0)
            ));
            $menu['Membership']->addChild('List Plans', array('route' => 'ia_users_plans_index'));
            $menu['Membership']->addChild('Create New Plan', array(
                'route' => 'ia_users_plans_create',
                'routeParameters' => array('id' => 0)
            ));
            $menu['Membership']->addChild('List Package Plans', array('route' => 'ia_users_packageplans_index'));
            $menu['Membership']->addChild('Create New PackagePlan', array(
                'route' => 'ia_users_packageplans_create',
                'routeParameters' => array('id' => 0)
            ));
            
            // Payment Methods
            $menu->addChild('Payment Methods', array('route' => 'ia_payment_methods_index', 'attributes' => array('iconClass' => 'icon_genius')));
            
            // Taxonomy
            $menu->addChild('Taxonomy', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_genius')));
            $menu['Taxonomy']->addChild('List Vocabularies', array('route' => 'ia_taxonomy_vocabularies_index'));
            $menu['Taxonomy']->addChild('Create New Vocabulary', array(
                'route' => 'ia_taxonomy_vocabularies_create',
                'routeParameters' => array('id' => 0)
            ));
            
            $menu->addChild('Static Pages', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_genius')));
            $menu['Static Pages']->addChild('List Pages', array('route' => 'ia_cms_pages_index'));
            $menu['Static Pages']->addChild('Create New Page', array(
                'route' => 'ia_cms_pages_create',
                'routeParameters' => array('id' => 0)
            ));
            
        }
        
        return $menu;
    }
    
    public function profileMenu(FactoryInterface $factory)
    {
        $menu = $factory->createItem('root');
        
        $menu->addChild('My Profile', array('route' => 'ia_users_profile_show', 'attributes' => array('iconClass' => 'fas fa-user mr-2')));
        $menu->addChild('Log Out', array('route' => 'app_logout', 'attributes' => array('iconClass' => 'fas fa-power-off mr-2')));
        $menu->addChild('Documentation', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'fas fa-cog mr-2')));
        
        return $menu;
    }
    
    public function breadcrumbsMenu(FactoryInterface $factory)
    {
        $bcmenu = $this->mainMenu($factory);
        return $this->getCurrentMenuItem($bcmenu) ?: $factory->createItem('Edit');
    }
    
    public function getCurrentMenuItem($menu)
    {
        $voter = new RouteVoter($this->container->get('request_stack'));
        
        foreach ($menu as $item) {
            if ($voter->matchItem($item)) {
                return $item;
            }
            
            if ($item->getChildren() && $currentChild = $this->getCurrentMenuItem($item)) {
                return $currentChild;
            }
        }
        
        return null;
    }
    
}
