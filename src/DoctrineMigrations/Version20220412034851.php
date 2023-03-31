<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220412034851 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE WCT_ProjectRepertoryItems (id INT AUTO_INCREMENT NOT NULL, project_repertory_id INT DEFAULT NULL, INDEX IDX_4A79187F5BE8D9AF (project_repertory_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryItems ADD CONSTRAINT FK_4A79187F5BE8D9AF FOREIGN KEY (project_repertory_id) REFERENCES WCT_ProjectRepertories (id)');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id maintenance_page_id  INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )');
        $this->addSql('ALTER TABLE WCT_ProjectFields CHANGE type type enum(\'text\', \'picture\', \'link\'), CHANGE collection_type collection_type enum(\'listing\', \'details\')');
        $this->addSql('ALTER TABLE WCT_ProjectRepertories ADD created_at DATETIME NOT NULL');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields DROP FOREIGN KEY FK_B699D5F95BE8D9AF');
        $this->addSql('DROP INDEX IDX_B699D5F95BE8D9AF ON WCT_ProjectRepertoryFields');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields CHANGE project_repertory_id project_repertory_item_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields ADD CONSTRAINT FK_B699D5F993FFC594 FOREIGN KEY (project_repertory_item_id) REFERENCES WCT_ProjectRepertoryItems (id)');
        $this->addSql('CREATE INDEX IDX_B699D5F993FFC594 ON WCT_ProjectRepertoryFields (project_repertory_item_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields DROP FOREIGN KEY FK_B699D5F993FFC594');
        $this->addSql('DROP TABLE WCT_ProjectRepertoryItems');
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
        $this->addSql('ALTER TABLE WCT_ProjectFields CHANGE collection_type collection_type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE type type VARCHAR(255) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE title title VARCHAR(256) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE xquery xquery VARCHAR(256) DEFAULT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields CHANGE map_field map_field VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE WCT_ProjectProcessors CHANGE service service VARCHAR(255) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('ALTER TABLE WCT_ProjectRepertories DROP created_at, CHANGE code code VARCHAR(128) NOT NULL COLLATE `utf8_unicode_ci`');
        $this->addSql('DROP INDEX IDX_B699D5F993FFC594 ON WCT_ProjectRepertoryFields');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields CHANGE content content LONGTEXT NOT NULL COLLATE `utf8_unicode_ci`, CHANGE project_repertory_item_id project_repertory_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields ADD CONSTRAINT FK_B699D5F95BE8D9AF FOREIGN KEY (project_repertory_id) REFERENCES WCT_ProjectRepertories (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_B699D5F95BE8D9AF ON WCT_ProjectRepertoryFields (project_repertory_id)');
        $this->addSql('ALTER TABLE WCT_Projects CHANGE title title VARCHAR(128) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE url url VARCHAR(128) NOT NULL COLLATE `utf8_unicode_ci`, CHANGE listing_container_element listing_container_element VARCHAR(128) DEFAULT NULL COLLATE `utf8_unicode_ci` COMMENT \'The XPath using as base container when we parse fields in listing pages. ( In details pages is using the first parent with id attribute as base container.) \', CHANGE details_link details_link VARCHAR(128) DEFAULT NULL COLLATE `utf8_unicode_ci`, CHANGE pager_link pager_link VARCHAR(128) DEFAULT NULL COLLATE `utf8_unicode_ci`');
    }
}
