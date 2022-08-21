<?php namespace App\Component\Deployer;

class Deployer
{
    // Deployers
    const DEPLOYER_SYLIUS       = 'sylius';
    const DEPLOYER_MAGENTO      = 'magento';
    const DEPLOYER_PRESTASHOP   = 'prestashop';
    
    public static function DeployersAvailable()
    {
        return [
            self::DEPLOYER_SYLIUS       => 'Sylius',
            self::DEPLOYER_MAGENTO      => 'Magento',
            self::DEPLOYER_PRESTASHOP   => 'PrestaShop',
        ];
    }
}
