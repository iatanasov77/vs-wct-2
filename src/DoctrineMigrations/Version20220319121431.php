<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220319121431 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE WCT_PictureCroppers (id INT AUTO_INCREMENT NOT NULL, crop_top TINYINT(1) DEFAULT NULL, crop_right TINYINT(1) DEFAULT NULL, crop_bottom TINYINT(1) DEFAULT NULL, crop_left TINYINT(1) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectCategories (id INT AUTO_INCREMENT NOT NULL, taxon_id INT NOT NULL, parent_id INT DEFAULT NULL, UNIQUE INDEX UNIQ_1686C1F7DE13F470 (taxon_id), INDEX IDX_1686C1F7727ACA70 (parent_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectFields (id INT AUTO_INCREMENT NOT NULL, project_id INT DEFAULT NULL, type enum(\'text\', \'picture\', \'link\'), collection_type enum(\'listing\', \'pagination\', \'details\'), title VARCHAR(256) NOT NULL, xquery VARCHAR(256) DEFAULT NULL, INDEX IDX_8D88C386166D1F9C (project_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectMapperFields (id INT AUTO_INCREMENT NOT NULL, project_mapper_id INT DEFAULT NULL, project_field_id INT DEFAULT NULL, map_field VARCHAR(255) NOT NULL, INDEX IDX_F4EA20DFA8F6C64D (project_mapper_id), INDEX IDX_F4EA20DF79798C6B (project_field_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectMappers (id INT AUTO_INCREMENT NOT NULL, project_id INT DEFAULT NULL, processor_id INT DEFAULT NULL, INDEX IDX_5B1A1CE9166D1F9C (project_id), INDEX IDX_5B1A1CE937BAC19A (processor_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectProcessors (id INT AUTO_INCREMENT NOT NULL, service VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectRepertories (id INT AUTO_INCREMENT NOT NULL, project_id INT DEFAULT NULL, code VARCHAR(128) NOT NULL, UNIQUE INDEX UNIQ_55A34A2777153098 (code), INDEX IDX_55A34A27166D1F9C (project_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectRepertoryFields (id INT AUTO_INCREMENT NOT NULL, project_repertory_id INT DEFAULT NULL, project_field_id INT DEFAULT NULL, content LONGTEXT NOT NULL, INDEX IDX_B699D5F95BE8D9AF (project_repertory_id), INDEX IDX_B699D5F979798C6B (project_field_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Projects (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, user_id INT NOT NULL, picture_cropper_id INT DEFAULT NULL, title VARCHAR(128) NOT NULL, url VARCHAR(128) NOT NULL, details_page VARCHAR(128) DEFAULT NULL, details_link VARCHAR(256) NOT NULL, pager_link VARCHAR(256) NOT NULL, INDEX IDX_A14FAC0C12469DE2 (category_id), INDEX IDX_A14FAC0CA76ED395 (user_id), INDEX IDX_A14FAC0CCCBA9FA4 (picture_cropper_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE WCT_ProjectCategories ADD CONSTRAINT FK_1686C1F7DE13F470 FOREIGN KEY (taxon_id) REFERENCES VSAPP_Taxons (id)');
        $this->addSql('ALTER TABLE WCT_ProjectCategories ADD CONSTRAINT FK_1686C1F7727ACA70 FOREIGN KEY (parent_id) REFERENCES WCT_ProjectCategories (id)');
        $this->addSql('ALTER TABLE WCT_ProjectFields ADD CONSTRAINT FK_8D88C386166D1F9C FOREIGN KEY (project_id) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields ADD CONSTRAINT FK_F4EA20DFA8F6C64D FOREIGN KEY (project_mapper_id) REFERENCES WCT_ProjectMappers (id)');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields ADD CONSTRAINT FK_F4EA20DF79798C6B FOREIGN KEY (project_field_id) REFERENCES WCT_ProjectFields (id)');
        $this->addSql('ALTER TABLE WCT_ProjectMappers ADD CONSTRAINT FK_5B1A1CE9166D1F9C FOREIGN KEY (project_id) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectMappers ADD CONSTRAINT FK_5B1A1CE937BAC19A FOREIGN KEY (processor_id) REFERENCES WCT_ProjectProcessors (id)');
        $this->addSql('ALTER TABLE WCT_ProjectRepertories ADD CONSTRAINT FK_55A34A27166D1F9C FOREIGN KEY (project_id) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields ADD CONSTRAINT FK_B699D5F95BE8D9AF FOREIGN KEY (project_repertory_id) REFERENCES WCT_ProjectRepertories (id)');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields ADD CONSTRAINT FK_B699D5F979798C6B FOREIGN KEY (project_field_id) REFERENCES WCT_ProjectFields (id)');
        $this->addSql('ALTER TABLE WCT_Projects ADD CONSTRAINT FK_A14FAC0C12469DE2 FOREIGN KEY (category_id) REFERENCES WCT_ProjectCategories (id)');
        $this->addSql('ALTER TABLE WCT_Projects ADD CONSTRAINT FK_A14FAC0CA76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('ALTER TABLE WCT_Projects ADD CONSTRAINT FK_A14FAC0CCCBA9FA4 FOREIGN KEY (picture_cropper_id) REFERENCES WCT_PictureCroppers (id)');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id maintenance_page_id  INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )');
        $this->addSql('ALTER TABLE VSPAY_PaymentDetails CHANGE type type ENUM(\'agreement\', \'payment\')');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE WCT_Projects DROP FOREIGN KEY FK_A14FAC0CCCBA9FA4');
        $this->addSql('ALTER TABLE WCT_ProjectCategories DROP FOREIGN KEY FK_1686C1F7727ACA70');
        $this->addSql('ALTER TABLE WCT_Projects DROP FOREIGN KEY FK_A14FAC0C12469DE2');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields DROP FOREIGN KEY FK_F4EA20DF79798C6B');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields DROP FOREIGN KEY FK_B699D5F979798C6B');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields DROP FOREIGN KEY FK_F4EA20DFA8F6C64D');
        $this->addSql('ALTER TABLE WCT_ProjectMappers DROP FOREIGN KEY FK_5B1A1CE937BAC19A');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields DROP FOREIGN KEY FK_B699D5F95BE8D9AF');
        $this->addSql('ALTER TABLE WCT_ProjectFields DROP FOREIGN KEY FK_8D88C386166D1F9C');
        $this->addSql('ALTER TABLE WCT_ProjectMappers DROP FOREIGN KEY FK_5B1A1CE9166D1F9C');
        $this->addSql('ALTER TABLE WCT_ProjectRepertories DROP FOREIGN KEY FK_55A34A27166D1F9C');
        $this->addSql('DROP TABLE WCT_PictureCroppers');
        $this->addSql('DROP TABLE WCT_ProjectCategories');
        $this->addSql('DROP TABLE WCT_ProjectFields');
        $this->addSql('DROP TABLE WCT_ProjectMapperFields');
        $this->addSql('DROP TABLE WCT_ProjectMappers');
        $this->addSql('DROP TABLE WCT_ProjectProcessors');
        $this->addSql('DROP TABLE WCT_ProjectRepertories');
        $this->addSql('DROP TABLE WCT_ProjectRepertoryFields');
        $this->addSql('DROP TABLE WCT_Projects');
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
        $this->addSql('ALTER TABLE VSPAY_GatewayConfig CHANGE gateway_name gateway_name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE factory_name factory_name VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE config config LONGTEXT NOT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:json)\', CHANGE sandbox_config sandbox_config LONGTEXT DEFAULT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:json)\'');
        $this->addSql('ALTER TABLE VSPAY_Payment CHANGE number number VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE description description VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE client_email client_email VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE client_id client_id VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE currency_code currency_code VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE details details LONGTEXT NOT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:json)\'');
        $this->addSql('ALTER TABLE VSPAY_PaymentDetails CHANGE details details LONGTEXT NOT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:json)\', CHANGE type type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE VSPAY_PaymentMethod CHANGE name name VARCHAR(64) NOT NULL COLLATE `utf8_unicode_ci`');
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
        $this->addSql('ALTER TABLE VSUS_PayedServices CHANGE title title VARCHAR(64) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE description description LONGTEXT NOT NULL COLLATE `utf8_unicode_ci`');
    }
}
