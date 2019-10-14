<?php

namespace IA\ApplicationCoreBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class IAApplicationCoreBundle extends Bundle
{
    public function boot()
    {
        //$user = $this->container->get('security.context')->getToken()->getUser();
        //var_dump($user); die;
        //$this->container->get('twig')->addGlobal('user', $user);
    }
}
