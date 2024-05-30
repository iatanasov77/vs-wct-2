<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240528071858 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE WCT_ApiHosts (id INT AUTO_INCREMENT NOT NULL, base_url VARCHAR(255) NOT NULL, credentials LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_PictureCroppers (id INT AUTO_INCREMENT NOT NULL, crop_top TINYINT(1) DEFAULT NULL, crop_right TINYINT(1) DEFAULT NULL, crop_bottom TINYINT(1) DEFAULT NULL, crop_left TINYINT(1) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectCategories (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, parent_id INT DEFAULT NULL, taxon_id INT DEFAULT NULL, INDEX IDX_1686C1F7A76ED395 (user_id), INDEX IDX_1686C1F7727ACA70 (parent_id), UNIQUE INDEX UNIQ_1686C1F7DE13F470 (taxon_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectFields (id INT AUTO_INCREMENT NOT NULL, project_id INT DEFAULT NULL, collection_type ENUM(\'listing\', \'details\'), type ENUM(\'text\', \'picture\', \'link\'), title VARCHAR(255) NOT NULL, xquery VARCHAR(255) DEFAULT NULL, slug VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_8D88C386989D9B62 (slug), INDEX IDX_8D88C386166D1F9C (project_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectMapperFields (id INT AUTO_INCREMENT NOT NULL, project_mapper_id INT DEFAULT NULL, project_field_id INT DEFAULT NULL, map_field VARCHAR(255) NOT NULL, INDEX IDX_F4EA20DFA8F6C64D (project_mapper_id), INDEX IDX_F4EA20DF79798C6B (project_field_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectMappers (id INT AUTO_INCREMENT NOT NULL, project_id INT DEFAULT NULL, title VARCHAR(128) NOT NULL, deployer ENUM(\'sylius\', \'magento\', \'prestashop\'), INDEX IDX_5B1A1CE9166D1F9C (project_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectRepertories (id INT AUTO_INCREMENT NOT NULL, project_id INT DEFAULT NULL, code VARCHAR(128) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, UNIQUE INDEX UNIQ_55A34A2777153098 (code), INDEX IDX_55A34A27166D1F9C (project_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectRepertoryFields (id INT AUTO_INCREMENT NOT NULL, project_repertory_item_id INT DEFAULT NULL, project_field_id INT DEFAULT NULL, content LONGTEXT NOT NULL, INDEX IDX_B699D5F993FFC594 (project_repertory_item_id), INDEX IDX_B699D5F979798C6B (project_field_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectRepertoryItems (id INT AUTO_INCREMENT NOT NULL, project_repertory_id INT DEFAULT NULL, INDEX IDX_4A79187F5BE8D9AF (project_repertory_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Projects (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, user_id INT DEFAULT NULL, picture_cropper_id INT DEFAULT NULL, title VARCHAR(128) NOT NULL, url VARCHAR(128) NOT NULL, listing_container_element VARCHAR(128) DEFAULT NULL COMMENT \'The XPath using as base container when we parse fields in listing pages. ( In details pages is using the first parent with id attribute as base container.) \', details_link VARCHAR(128) DEFAULT NULL, pager_link VARCHAR(128) DEFAULT NULL, INDEX IDX_A14FAC0C12469DE2 (category_id), INDEX IDX_A14FAC0CA76ED395 (user_id), INDEX IDX_A14FAC0CCCBA9FA4 (picture_cropper_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE WCT_ProjectCategories ADD CONSTRAINT FK_1686C1F7A76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('ALTER TABLE WCT_ProjectCategories ADD CONSTRAINT FK_1686C1F7727ACA70 FOREIGN KEY (parent_id) REFERENCES WCT_ProjectCategories (id)');
        $this->addSql('ALTER TABLE WCT_ProjectCategories ADD CONSTRAINT FK_1686C1F7DE13F470 FOREIGN KEY (taxon_id) REFERENCES VSAPP_Taxons (id)');
        $this->addSql('ALTER TABLE WCT_ProjectFields ADD CONSTRAINT FK_8D88C386166D1F9C FOREIGN KEY (project_id) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields ADD CONSTRAINT FK_F4EA20DFA8F6C64D FOREIGN KEY (project_mapper_id) REFERENCES WCT_ProjectMappers (id)');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields ADD CONSTRAINT FK_F4EA20DF79798C6B FOREIGN KEY (project_field_id) REFERENCES WCT_ProjectFields (id)');
        $this->addSql('ALTER TABLE WCT_ProjectMappers ADD CONSTRAINT FK_5B1A1CE9166D1F9C FOREIGN KEY (project_id) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectRepertories ADD CONSTRAINT FK_55A34A27166D1F9C FOREIGN KEY (project_id) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields ADD CONSTRAINT FK_B699D5F993FFC594 FOREIGN KEY (project_repertory_item_id) REFERENCES WCT_ProjectRepertoryItems (id)');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields ADD CONSTRAINT FK_B699D5F979798C6B FOREIGN KEY (project_field_id) REFERENCES WCT_ProjectFields (id)');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryItems ADD CONSTRAINT FK_4A79187F5BE8D9AF FOREIGN KEY (project_repertory_id) REFERENCES WCT_ProjectRepertories (id)');
        $this->addSql('ALTER TABLE WCT_Projects ADD CONSTRAINT FK_A14FAC0C12469DE2 FOREIGN KEY (category_id) REFERENCES WCT_ProjectCategories (id)');
        $this->addSql('ALTER TABLE WCT_Projects ADD CONSTRAINT FK_A14FAC0CA76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('ALTER TABLE WCT_Projects ADD CONSTRAINT FK_A14FAC0CCCBA9FA4 FOREIGN KEY (picture_cropper_id) REFERENCES WCT_PictureCroppers (id)');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id maintenance_page_id  INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )');
        $this->addSql('ALTER TABLE VSCAT_PricingPlanSubscriptions CHANGE gateway_attributes gateway_attributes JSON DEFAULT NULL');
        $this->addSql('ALTER TABLE VSCAT_PricingPlans CHANGE gateway_attributes gateway_attributes JSON DEFAULT NULL');
        $this->addSql('ALTER TABLE VSCAT_Products DROP average_rating');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE WCT_ProjectCategories DROP FOREIGN KEY FK_1686C1F7A76ED395');
        $this->addSql('ALTER TABLE WCT_ProjectCategories DROP FOREIGN KEY FK_1686C1F7727ACA70');
        $this->addSql('ALTER TABLE WCT_ProjectCategories DROP FOREIGN KEY FK_1686C1F7DE13F470');
        $this->addSql('ALTER TABLE WCT_ProjectFields DROP FOREIGN KEY FK_8D88C386166D1F9C');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields DROP FOREIGN KEY FK_F4EA20DFA8F6C64D');
        $this->addSql('ALTER TABLE WCT_ProjectMapperFields DROP FOREIGN KEY FK_F4EA20DF79798C6B');
        $this->addSql('ALTER TABLE WCT_ProjectMappers DROP FOREIGN KEY FK_5B1A1CE9166D1F9C');
        $this->addSql('ALTER TABLE WCT_ProjectRepertories DROP FOREIGN KEY FK_55A34A27166D1F9C');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields DROP FOREIGN KEY FK_B699D5F993FFC594');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryFields DROP FOREIGN KEY FK_B699D5F979798C6B');
        $this->addSql('ALTER TABLE WCT_ProjectRepertoryItems DROP FOREIGN KEY FK_4A79187F5BE8D9AF');
        $this->addSql('ALTER TABLE WCT_Projects DROP FOREIGN KEY FK_A14FAC0C12469DE2');
        $this->addSql('ALTER TABLE WCT_Projects DROP FOREIGN KEY FK_A14FAC0CA76ED395');
        $this->addSql('ALTER TABLE WCT_Projects DROP FOREIGN KEY FK_A14FAC0CCCBA9FA4');
        $this->addSql('DROP TABLE WCT_ApiHosts');
        $this->addSql('DROP TABLE WCT_PictureCroppers');
        $this->addSql('DROP TABLE WCT_ProjectCategories');
        $this->addSql('DROP TABLE WCT_ProjectFields');
        $this->addSql('DROP TABLE WCT_ProjectMapperFields');
        $this->addSql('DROP TABLE WCT_ProjectMappers');
        $this->addSql('DROP TABLE WCT_ProjectRepertories');
        $this->addSql('DROP TABLE WCT_ProjectRepertoryFields');
        $this->addSql('DROP TABLE WCT_ProjectRepertoryItems');
        $this->addSql('DROP TABLE WCT_Projects');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id  maintenance_page_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id) REFERENCES VSCMS_Pages (id) ON UPDATE NO ACTION ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id)');
        $this->addSql('ALTER TABLE VSCAT_PricingPlanSubscriptions CHANGE gateway_attributes gateway_attributes JSON DEFAULT NULL');
        $this->addSql('ALTER TABLE VSCAT_PricingPlans CHANGE gateway_attributes gateway_attributes JSON DEFAULT NULL');
        $this->addSql('ALTER TABLE VSCAT_Products ADD average_rating DOUBLE PRECISION DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE VSUM_UsersInfo CHANGE title title VARCHAR(255) DEFAULT NULL');
    }
}
