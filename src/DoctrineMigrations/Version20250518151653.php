<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250518151653 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE TABLE VSAPI_RefreshTokens (id INT AUTO_INCREMENT NOT NULL, refresh_token VARCHAR(128) NOT NULL, username VARCHAR(255) NOT NULL, valid DATETIME NOT NULL, UNIQUE INDEX UNIQ_BB25E413C74F2195 (refresh_token), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id maintenance_page_id  INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSCAT_PricingPlanSubscriptions CHANGE pricing_plan_id pricing_plan_id INT NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSCAT_Products ADD average_rating DOUBLE PRECISION DEFAULT '0' NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSPAY_PromotionRules DROP FOREIGN KEY FK_9D727099139DF194
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSPAY_PromotionRules ADD CONSTRAINT FK_9D727099139DF194 FOREIGN KEY (promotion_id) REFERENCES VSPAY_Promotions (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSUM_UsersInfo CHANGE title title ENUM('mr', 'mrs', 'miss')
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSUS_PayedServiceSubscriptionPeriods CHANGE payed_service_id payed_service_id INT NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSUS_PayedServicesAttributes CHANGE payed_service_id payed_service_id INT NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ApiHosts CHANGE credentials credentials JSON NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ProjectFields CHANGE collection_type collection_type ENUM('listing', 'details'), CHANGE type type ENUM('text', 'picture', 'link')
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ProjectMappers CHANGE deployer deployer ENUM('sylius', 'magento', 'prestashop')
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ProjectRepertories CHANGE collection_type collection_type ENUM('listing', 'details')
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            DROP TABLE VSAPI_RefreshTokens
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id  maintenance_page_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id) REFERENCES VSCMS_Pages (id) ON UPDATE NO ACTION ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSCAT_PricingPlanSubscriptions CHANGE pricing_plan_id pricing_plan_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSCAT_Products DROP average_rating
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSPAY_PromotionRules DROP FOREIGN KEY FK_9D727099139DF194
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSPAY_PromotionRules ADD CONSTRAINT FK_9D727099139DF194 FOREIGN KEY (promotion_id) REFERENCES VSPAY_Promotions (id) ON UPDATE NO ACTION ON DELETE NO ACTION
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSUM_UsersInfo CHANGE title title VARCHAR(255) DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSUS_PayedServiceSubscriptionPeriods CHANGE payed_service_id payed_service_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE VSUS_PayedServicesAttributes CHANGE payed_service_id payed_service_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ApiHosts CHANGE credentials credentials JSON NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ProjectFields CHANGE collection_type collection_type VARCHAR(255) DEFAULT NULL, CHANGE type type VARCHAR(255) DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ProjectMappers CHANGE deployer deployer VARCHAR(255) DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE WCT_ProjectRepertories CHANGE collection_type collection_type VARCHAR(255) DEFAULT NULL
        SQL);
    }
}
