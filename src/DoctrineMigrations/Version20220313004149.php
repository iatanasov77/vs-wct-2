<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220313004149 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE VSPAY_GatewayConfig (id INT AUTO_INCREMENT NOT NULL, gateway_name VARCHAR(255) NOT NULL, factory_name VARCHAR(255) NOT NULL, config LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', active TINYINT(1) NOT NULL, use_sandbox TINYINT(1) NOT NULL, sandbox_config LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:json)\', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSPAY_Payment (id INT AUTO_INCREMENT NOT NULL, payment_method_id INT DEFAULT NULL, payment_details_id INT DEFAULT NULL, number VARCHAR(255) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, client_email VARCHAR(255) DEFAULT NULL, client_id VARCHAR(255) DEFAULT NULL, total_amount INT DEFAULT NULL, currency_code VARCHAR(255) DEFAULT NULL, details LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', INDEX IDX_8936E3C05AA1164F (payment_method_id), INDEX IDX_8936E3C08EEC86F7 (payment_details_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSPAY_PaymentMethod (id INT AUTO_INCREMENT NOT NULL, gateway_id INT DEFAULT NULL, name VARCHAR(64) NOT NULL, active TINYINT(1) NOT NULL, INDEX IDX_1CCD1B9F577F8E00 (gateway_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE VSPAY_Payment ADD CONSTRAINT FK_8936E3C05AA1164F FOREIGN KEY (payment_method_id) REFERENCES VSPAY_PaymentMethod (id)');
        $this->addSql('ALTER TABLE VSPAY_Payment ADD CONSTRAINT FK_8936E3C08EEC86F7 FOREIGN KEY (payment_details_id) REFERENCES VSPAY_PaymentDetails (id)');
        $this->addSql('ALTER TABLE VSPAY_PaymentMethod ADD CONSTRAINT FK_1CCD1B9F577F8E00 FOREIGN KEY (gateway_id) REFERENCES VSPAY_GatewayConfig (id)');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id maintenance_page_id  INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )');
        $this->addSql('ALTER TABLE VSPAY_PaymentDetails CHANGE details details LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', CHANGE type type ENUM(\'agreement\', \'payment\')');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE VSPAY_PaymentMethod DROP FOREIGN KEY FK_1CCD1B9F577F8E00');
        $this->addSql('ALTER TABLE VSPAY_Payment DROP FOREIGN KEY FK_8936E3C05AA1164F');
        $this->addSql('DROP TABLE VSPAY_GatewayConfig');
        $this->addSql('DROP TABLE VSPAY_Payment');
        $this->addSql('DROP TABLE VSPAY_PaymentMethod');
        $this->addSql('ALTER TABLE VSAPP_Applications CHANGE title title VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE hostname hostname VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE code code VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_InstalationInfo CHANGE version version VARCHAR(12) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_Locale CHANGE code code VARCHAR(12) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_LogEntries CHANGE locale locale VARCHAR(8) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE action action VARCHAR(8) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE object_id object_id VARCHAR(64) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE object_class object_class VARCHAR(191) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE data data LONGTEXT DEFAULT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:array)\', CHANGE username username VARCHAR(191) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE theme theme VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE maintenance_page_id  maintenance_page_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id) REFERENCES VSCMS_Pages (id) ON UPDATE NO ACTION ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id)');
        $this->addSql('ALTER TABLE VSAPP_TaxonImage CHANGE type type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE path path VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_TaxonTranslations CHANGE locale locale VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE name name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE slug slug VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE description description LONGTEXT DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_Taxonomy CHANGE code code VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE name name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE description description LONGTEXT NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_Taxons CHANGE code code VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSAPP_Translations CHANGE locale locale VARCHAR(8) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE object_class object_class VARCHAR(191) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE field field VARCHAR(32) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE foreign_key foreign_key VARCHAR(64) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE content content LONGTEXT DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSCMS_Documents CHANGE title title VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSCMS_FileManagerFile CHANGE type type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE path path VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE original_name original_name VARCHAR(255) DEFAULT \'\' NOT NULL COLLATE `utf8_unicode_ci` COMMENT \'The Original Name of the File.\'');
        $this->addSql('ALTER TABLE VSCMS_Pages CHANGE slug slug VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE title title VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE description description VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE text text LONGTEXT NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSCMS_TocPage CHANGE title title VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE description description VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE text text LONGTEXT DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSPAY_PaymentDetails CHANGE details details VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE type type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_AvatarImage CHANGE type type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE path path VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_ResetPasswordRequests CHANGE selector selector VARCHAR(24) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE hashedToken hashedToken VARCHAR(128) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UserRoles CHANGE role role VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_Users CHANGE api_token api_token VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE salt salt VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE password password VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE roles_array roles_array LONGTEXT NOT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:array)\', CHANGE username username VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE email email VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE prefered_locale prefered_locale VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE confirmation_token confirmation_token VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UsersActivities CHANGE activity activity VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UsersInfo CHANGE first_name first_name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE last_name last_name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE country country VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE mobile mobile VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE website website VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE occupation occupation VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UsersNotifications CHANGE notification notification VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUS_MailchimpAudiences CHANGE audience_id audience_id VARCHAR(16) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE description description VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUS_NewsletterSubscriptions CHANGE user_email user_email VARCHAR(64) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptionPeriods CHANGE subscription_period subscription_period VARCHAR(64) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE price price VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE currency currency VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUS_PayedServices CHANGE title title VARCHAR(64) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE description description VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
    }
}
