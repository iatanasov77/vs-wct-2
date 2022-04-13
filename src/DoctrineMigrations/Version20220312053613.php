<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220312053613 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE VSPAY_PaymentDetails (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, payment_method INT NOT NULL, details VARCHAR(255) NOT NULL, type ENUM(\'agreement\', \'payment\'), INDEX IDX_5F667026A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSUS_MailchimpAudiences (id INT AUTO_INCREMENT NOT NULL, audience_id VARCHAR(16) NOT NULL, description VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSUS_NewsletterSubscriptions (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, mailchimp_audience_id INT NOT NULL, user_email VARCHAR(64) NOT NULL, date DATETIME NOT NULL, INDEX IDX_E521F0DCA76ED395 (user_id), INDEX IDX_E521F0DCF03423AE (mailchimp_audience_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSUS_PayedServiceCategories (id INT AUTO_INCREMENT NOT NULL, taxon_id INT DEFAULT NULL, UNIQUE INDEX UNIQ_9E88F124DE13F470 (taxon_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSUS_PayedServiceSubscriptionPeriods (id INT AUTO_INCREMENT NOT NULL, payed_service_id INT DEFAULT NULL, subscription_period VARCHAR(64) NOT NULL, price VARCHAR(255) NOT NULL, currency VARCHAR(255) NOT NULL, INDEX IDX_1018A6BE5139FC0A (payed_service_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSUS_PayedServiceSubscriptions (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, payed_service_id INT DEFAULT NULL, payment_details_id INT DEFAULT NULL, date DATETIME NOT NULL, INDEX IDX_11A46ECAA76ED395 (user_id), INDEX IDX_11A46ECA5139FC0A (payed_service_id), INDEX IDX_11A46ECA8EEC86F7 (payment_details_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSUS_PayedServices (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, title VARCHAR(64) NOT NULL, description VARCHAR(255) NOT NULL, INDEX IDX_5E8A244512469DE2 (category_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE VSPAY_PaymentDetails ADD CONSTRAINT FK_5F667026A76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('ALTER TABLE VSUS_NewsletterSubscriptions ADD CONSTRAINT FK_E521F0DCA76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('ALTER TABLE VSUS_NewsletterSubscriptions ADD CONSTRAINT FK_E521F0DCF03423AE FOREIGN KEY (mailchimp_audience_id) REFERENCES VSUS_MailchimpAudiences (id)');
        $this->addSql('ALTER TABLE VSUS_PayedServiceCategories ADD CONSTRAINT FK_9E88F124DE13F470 FOREIGN KEY (taxon_id) REFERENCES VSAPP_Taxons (id)');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptionPeriods ADD CONSTRAINT FK_1018A6BE5139FC0A FOREIGN KEY (payed_service_id) REFERENCES VSUS_PayedServices (id)');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD CONSTRAINT FK_11A46ECAA76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD CONSTRAINT FK_11A46ECA5139FC0A FOREIGN KEY (payed_service_id) REFERENCES VSUS_PayedServices (id)');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD CONSTRAINT FK_11A46ECA8EEC86F7 FOREIGN KEY (payment_details_id) REFERENCES VSPAY_PaymentDetails (id)');
        $this->addSql('ALTER TABLE VSUS_PayedServices ADD CONSTRAINT FK_5E8A244512469DE2 FOREIGN KEY (category_id) REFERENCES VSUS_PayedServiceCategories (id)');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id maintenance_page_id  INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions DROP FOREIGN KEY FK_11A46ECA8EEC86F7');
        $this->addSql('ALTER TABLE VSUS_NewsletterSubscriptions DROP FOREIGN KEY FK_E521F0DCF03423AE');
        $this->addSql('ALTER TABLE VSUS_PayedServices DROP FOREIGN KEY FK_5E8A244512469DE2');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptionPeriods DROP FOREIGN KEY FK_1018A6BE5139FC0A');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions DROP FOREIGN KEY FK_11A46ECA5139FC0A');
        $this->addSql('DROP TABLE VSPAY_PaymentDetails');
        $this->addSql('DROP TABLE VSUS_MailchimpAudiences');
        $this->addSql('DROP TABLE VSUS_NewsletterSubscriptions');
        $this->addSql('DROP TABLE VSUS_PayedServiceCategories');
        $this->addSql('DROP TABLE VSUS_PayedServiceSubscriptionPeriods');
        $this->addSql('DROP TABLE VSUS_PayedServiceSubscriptions');
        $this->addSql('DROP TABLE VSUS_PayedServices');
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
        $this->addSql('ALTER TABLE VSUM_AvatarImage CHANGE type type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE path path VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_ResetPasswordRequests CHANGE selector selector VARCHAR(24) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE hashedToken hashedToken VARCHAR(128) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UserRoles CHANGE role role VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_Users CHANGE api_token api_token VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE salt salt VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE password password VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE roles_array roles_array LONGTEXT NOT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:array)\', CHANGE username username VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE email email VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE prefered_locale prefered_locale VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE confirmation_token confirmation_token VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UsersActivities CHANGE activity activity VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UsersInfo CHANGE first_name first_name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE last_name last_name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE country country VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE mobile mobile VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE website website VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE occupation occupation VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSUM_UsersNotifications CHANGE notification notification VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
    }
}
