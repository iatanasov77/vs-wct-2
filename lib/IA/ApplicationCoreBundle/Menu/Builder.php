<?php

namespace IA\Bundle\ApplicationBundle\Menu;

use Knp\Menu\FactoryInterface;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;
use Symfony\Component\Security\Core\SecurityContextInterface;

use Knp\Menu\Matcher\Voter\RouteVoter;

class Builder implements ContainerAwareInterface
{
    use ContainerAwareTrait;

    protected $securityContext;
    
    protected $isLoggedIn;
    
    protected $isAdmin;
    
    public function __construct(SecurityContextInterface $securityContext) {
        $this->securityContext = $securityContext;
        $this->isLoggedIn = $this->securityContext->isGranted('IS_AUTHENTICATED_FULLY');
        $this->isAdmin = $this->securityContext->isGranted('ROLE_ADMIN');
    }
    
    public function mainMenu(FactoryInterface $factory)
    {
        $menu = $factory->createItem('root');

        //Projects
        $menu->addChild('Projects', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_document_alt')));
        $menu['Projects']->addChild('List Projects', array('route' => 'ia_web_content_thief_projects_index'));
        $menu['Projects']->addChild('Create New Project', array(
            'route' => 'ia_web_content_thief_projects_create',
            'routeParameters' => array('id' => 0)
        ));

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
            $menu['Membership']->addChild('List Packages', array('route' => 'ia_paid_membership_packages_index'));
            $menu['Membership']->addChild('Create New Package', array(
                'route' => 'ia_paid_membership_packages_create',
                'routeParameters' => array('id' => 0)
            ));
            $menu['Membership']->addChild('List Plans', array('route' => 'ia_paid_membership_plans_index'));
            $menu['Membership']->addChild('Create New Plan', array(
                'route' => 'ia_paid_membership_plans_create',
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
        
        $menu->addChild('My Profile', array('route' => 'ia_users_profile_show', 'attributes' => array('iconClass' => 'icon_profile')));
        $menu->addChild('Log Out', array('route' => 'logout', 'attributes' => array('iconClass' => 'icon_key_alt')));
        $menu->addChild('Documentation', array('uri' => 'javascript:;', 'attributes' => array('iconClass' => 'icon_key_alt')));
        
        return $menu;
    }

    public function breadcrumbsMenu(FactoryInterface $factory)
    {
        $bcmenu = $this->mainMenu($factory);
        return $this->getCurrentMenuItem($bcmenu) ?: $factory->createItem('Edit');
    }

    public function getCurrentMenuItem($menu)
    {
        $voter = new RouteVoter($this->container->get('request'));

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
