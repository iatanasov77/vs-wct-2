<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190511154104 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        //$this->addSql('CREATE TABLE Users (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(180) NOT NULL, username_canonical VARCHAR(180) NOT NULL, email VARCHAR(180) NOT NULL, email_canonical VARCHAR(180) NOT NULL, enabled TINYINT(1) NOT NULL, salt VARCHAR(255) DEFAULT NULL, password VARCHAR(255) NOT NULL, last_login DATETIME DEFAULT NULL, confirmation_token VARCHAR(180) DEFAULT NULL, password_requested_at DATETIME DEFAULT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', api_token VARCHAR(255) NOT NULL, firstName VARCHAR(128) DEFAULT NULL, lastName VARCHAR(128) DEFAULT NULL, country VARCHAR(3) DEFAULT NULL, birthday DATETIME DEFAULT NULL, mobile INT DEFAULT NULL, website VARCHAR(64) DEFAULT NULL, occupation VARCHAR(64) DEFAULT NULL, subscriptionId INT DEFAULT NULL, UNIQUE INDEX UNIQ_D5428AED92FC23A8 (username_canonical), UNIQUE INDEX UNIQ_D5428AEDA0D96FBF (email_canonical), UNIQUE INDEX UNIQ_D5428AEDC05FB297 (confirmation_token), UNIQUE INDEX UNIQ_D5428AED7BA2F5EB (api_token), UNIQUE INDEX UNIQ_D5428AEDCA77D3A9 (subscriptionId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_group (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', UNIQUE INDEX UNIQ_8F02BF9D5E237E06 (name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAP_AgreementDetails (id INT AUTO_INCREMENT NOT NULL, details BLOB NOT NULL COMMENT \'(DC2Type:json_array)\', userId INT DEFAULT NULL, planId INT DEFAULT NULL, INDEX IDX_81074D2B64B64DCC (userId), INDEX IDX_81074D2B4C95116F (planId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAP_GatewayConfig (id INT AUTO_INCREMENT NOT NULL, gateway_name VARCHAR(255) NOT NULL, factory_name VARCHAR(255) NOT NULL, config BLOB NOT NULL COMMENT \'(DC2Type:json_array)\', useSandbox TINYINT(1) NOT NULL, sandboxConfig LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAP_PaymentDetails (id INT AUTO_INCREMENT NOT NULL, details BLOB NOT NULL COMMENT \'(DC2Type:json_array)\', paymentMethod VARCHAR(64) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        //$this->addSql('CREATE TABLE IAP_PaymentTokens (hash VARCHAR(255) NOT NULL, details LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:object)\', after_url LONGTEXT DEFAULT NULL, target_url LONGTEXT NOT NULL, gateway_name VARCHAR(255) NOT NULL, PRIMARY KEY(hash)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Fieldsets (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(64) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Fieldsets_Fields (id INT AUTO_INCREMENT NOT NULL, slug VARCHAR(128) NOT NULL, title VARCHAR(64) NOT NULL, typeId INT DEFAULT NULL, fieldsetId INT DEFAULT NULL, UNIQUE INDEX UNIQ_FAAA51A5989D9B62 (slug), UNIQUE INDEX UNIQ_FAAA51A59BF49490 (typeId), INDEX IDX_FAAA51A52DDE213 (fieldsetId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Field_Types (id INT NOT NULL, title VARCHAR(64) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ParcedItems (id INT AUTO_INCREMENT NOT NULL, runSession VARCHAR(64) NOT NULL, itemUrl VARCHAR(256) NOT NULL, fields LONGTEXT NOT NULL, created DATETIME NOT NULL, updated DATETIME DEFAULT NULL, projectId INT DEFAULT NULL, INDEX IDX_12F343446C9360F7 (projectId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Projects (id INT AUTO_INCREMENT NOT NULL, parseCountMax INT DEFAULT 100 NOT NULL, url VARCHAR(128) NOT NULL, categoryId INT DEFAULT NULL, userId INT DEFAULT NULL, title VARCHAR(128) NOT NULL, detailsLink VARCHAR(256) NOT NULL, pagerLink VARCHAR(256) NOT NULL, nopic VARCHAR(128) DEFAULT NULL, pictureCropTop TINYINT(1) DEFAULT NULL, pictureCropRight TINYINT(1) DEFAULT NULL, pictureCropBottom TINYINT(1) DEFAULT NULL, pictureCropLeft TINYINT(1) DEFAULT NULL, INDEX categoryId (categoryId), INDEX userId (userId), UNIQUE INDEX url_UNIQUE (url), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectDetailsFields (id INT AUTO_INCREMENT NOT NULL, slug VARCHAR(256) NOT NULL, title VARCHAR(256) NOT NULL, xquery VARCHAR(256) DEFAULT NULL, projectId INT DEFAULT NULL, typeId INT DEFAULT NULL, INDEX IDX_C17CD8136C9360F7 (projectId), UNIQUE INDEX UNIQ_C17CD8139BF49490 (typeId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_ProjectListingFields (id INT AUTO_INCREMENT NOT NULL, slug VARCHAR(256) NOT NULL, title VARCHAR(256) NOT NULL, xquery VARCHAR(256) DEFAULT NULL, projectId INT DEFAULT NULL, typeId INT DEFAULT NULL, INDEX IDX_A77DA6706C9360F7 (projectId), UNIQUE INDEX UNIQ_A77DA6709BF49490 (typeId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Projects_Processors (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(128) NOT NULL, class VARCHAR(128) NOT NULL, options VARCHAR(256) NOT NULL, projectId INT DEFAULT NULL, INDEX IDX_82E8FE4D6C9360F7 (projectId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE WCT_Projects_Processors_Mappings (id INT AUTO_INCREMENT NOT NULL, projectFieldAlias VARCHAR(64) NOT NULL, mapProcessorField VARCHAR(64) NOT NULL, projectProcessorId INT DEFAULT NULL, INDEX IDX_6797DBA4F2C8D75E (projectProcessorId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        //$this->addSql('CREATE TABLE IA_Cms_Pages (id INT AUTO_INCREMENT NOT NULL, slug VARCHAR(255) NOT NULL, title VARCHAR(255) NOT NULL, text LONGTEXT NOT NULL, UNIQUE INDEX UNIQ_22F897B4989D9B62 (slug), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAPM_Packages (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(64) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAPM_Packages_Plans (id INT AUTO_INCREMENT NOT NULL, price NUMERIC(6, 2) NOT NULL, description TEXT NOT NULL, packageId INT DEFAULT NULL, planId INT DEFAULT NULL, INDEX IDX_FF096BFCF55D173E (packageId), INDEX IDX_FF096BFC4C95116F (planId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAPM_Plans (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(64) DEFAULT NULL, subscription_period VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAPM_UsersSubscriptions (id INT AUTO_INCREMENT NOT NULL, date DATETIME NOT NULL, userId INT DEFAULT NULL, planId INT DEFAULT NULL, paymentDetailsId INT DEFAULT NULL, UNIQUE INDEX UNIQ_94F499E764B64DCC (userId), UNIQUE INDEX UNIQ_94F499E74C95116F (planId), UNIQUE INDEX UNIQ_94F499E790F41D36 (paymentDetailsId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IA_Taxonomy_Term (id INT AUTO_INCREMENT NOT NULL, vocabulary_id INT DEFAULT NULL, parent_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, description VARCHAR(255) DEFAULT NULL, slug VARCHAR(128) NOT NULL, created DATETIME NOT NULL, updated DATETIME NOT NULL, lft INT NOT NULL, lvl INT NOT NULL, rgt INT NOT NULL, root INT DEFAULT NULL, UNIQUE INDEX UNIQ_C6F4ABFC989D9B62 (slug), INDEX IDX_C6F4ABFC727ACA70 (parent_id), INDEX IDX_C6F4ABFCAD0E05F6 (vocabulary_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IA_Taxonomy_Vocabularies (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, description VARCHAR(255) DEFAULT NULL, slug VARCHAR(128) NOT NULL, created DATETIME NOT NULL, updated DATETIME NOT NULL, UNIQUE INDEX UNIQ_E09C2E1F989D9B62 (slug), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE Users ADD CONSTRAINT FK_D5428AEDCA77D3A9 FOREIGN KEY (subscriptionId) REFERENCES IAPM_UsersSubscriptions (id)');
        $this->addSql('ALTER TABLE IAP_AgreementDetails ADD CONSTRAINT FK_81074D2B64B64DCC FOREIGN KEY (userId) REFERENCES Users (id)');
        $this->addSql('ALTER TABLE IAP_AgreementDetails ADD CONSTRAINT FK_81074D2B4C95116F FOREIGN KEY (planId) REFERENCES IAPM_Packages_Plans (id)');
        $this->addSql('ALTER TABLE WCT_Fieldsets_Fields ADD CONSTRAINT FK_FAAA51A59BF49490 FOREIGN KEY (typeId) REFERENCES WCT_Field_Types (id)');
        $this->addSql('ALTER TABLE WCT_Fieldsets_Fields ADD CONSTRAINT FK_FAAA51A52DDE213 FOREIGN KEY (fieldsetId) REFERENCES WCT_Fieldsets (id)');
        $this->addSql('ALTER TABLE WCT_ParcedItems ADD CONSTRAINT FK_12F343446C9360F7 FOREIGN KEY (projectId) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectDetailsFields ADD CONSTRAINT FK_C17CD8136C9360F7 FOREIGN KEY (projectId) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectDetailsFields ADD CONSTRAINT FK_C17CD8139BF49490 FOREIGN KEY (typeId) REFERENCES WCT_Field_Types (id)');
        $this->addSql('ALTER TABLE WCT_ProjectListingFields ADD CONSTRAINT FK_A77DA6706C9360F7 FOREIGN KEY (projectId) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_ProjectListingFields ADD CONSTRAINT FK_A77DA6709BF49490 FOREIGN KEY (typeId) REFERENCES WCT_Field_Types (id)');
        $this->addSql('ALTER TABLE WCT_Projects_Processors ADD CONSTRAINT FK_82E8FE4D6C9360F7 FOREIGN KEY (projectId) REFERENCES WCT_Projects (id)');
        $this->addSql('ALTER TABLE WCT_Projects_Processors_Mappings ADD CONSTRAINT FK_6797DBA4F2C8D75E FOREIGN KEY (projectProcessorId) REFERENCES WCT_Projects_Processors (id)');
        $this->addSql('ALTER TABLE IAPM_Packages_Plans ADD CONSTRAINT FK_FF096BFCF55D173E FOREIGN KEY (packageId) REFERENCES IAPM_Packages (id)');
        $this->addSql('ALTER TABLE IAPM_Packages_Plans ADD CONSTRAINT FK_FF096BFC4C95116F FOREIGN KEY (planId) REFERENCES IAPM_Plans (id)');
        $this->addSql('ALTER TABLE IAPM_UsersSubscriptions ADD CONSTRAINT FK_94F499E764B64DCC FOREIGN KEY (userId) REFERENCES Users (id)');
        $this->addSql('ALTER TABLE IAPM_UsersSubscriptions ADD CONSTRAINT FK_94F499E74C95116F FOREIGN KEY (planId) REFERENCES IAPM_Packages_Plans (id)');
        $this->addSql('ALTER TABLE IAPM_UsersSubscriptions ADD CONSTRAINT FK_94F499E790F41D36 FOREIGN KEY (paymentDetailsId) REFERENCES IAP_PaymentDetails (id)');
        $this->addSql('ALTER TABLE IA_Taxonomy_Term ADD CONSTRAINT FK_C6F4ABFC727ACA70 FOREIGN KEY (parent_id) REFERENCES IA_Taxonomy_Term (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE IA_Taxonomy_Term ADD CONSTRAINT FK_C6F4ABFCAD0E05F6 FOREIGN KEY (vocabulary_id) REFERENCES IA_Taxonomy_Vocabularies (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE IAP_AgreementDetails DROP FOREIGN KEY FK_81074D2B64B64DCC');
        $this->addSql('ALTER TABLE IAPM_UsersSubscriptions DROP FOREIGN KEY FK_94F499E764B64DCC');
        $this->addSql('ALTER TABLE IAPM_UsersSubscriptions DROP FOREIGN KEY FK_94F499E790F41D36');
        $this->addSql('ALTER TABLE WCT_Fieldsets_Fields DROP FOREIGN KEY FK_FAAA51A52DDE213');
        $this->addSql('ALTER TABLE WCT_Fieldsets_Fields DROP FOREIGN KEY FK_FAAA51A59BF49490');
        $this->addSql('ALTER TABLE WCT_ProjectDetailsFields DROP FOREIGN KEY FK_C17CD8139BF49490');
        $this->addSql('ALTER TABLE WCT_ProjectListingFields DROP FOREIGN KEY FK_A77DA6709BF49490');
        $this->addSql('ALTER TABLE WCT_ParcedItems DROP FOREIGN KEY FK_12F343446C9360F7');
        $this->addSql('ALTER TABLE WCT_ProjectDetailsFields DROP FOREIGN KEY FK_C17CD8136C9360F7');
        $this->addSql('ALTER TABLE WCT_ProjectListingFields DROP FOREIGN KEY FK_A77DA6706C9360F7');
        $this->addSql('ALTER TABLE WCT_Projects_Processors DROP FOREIGN KEY FK_82E8FE4D6C9360F7');
        $this->addSql('ALTER TABLE WCT_Projects_Processors_Mappings DROP FOREIGN KEY FK_6797DBA4F2C8D75E');
        $this->addSql('ALTER TABLE IAPM_Packages_Plans DROP FOREIGN KEY FK_FF096BFCF55D173E');
        $this->addSql('ALTER TABLE IAP_AgreementDetails DROP FOREIGN KEY FK_81074D2B4C95116F');
        $this->addSql('ALTER TABLE IAPM_UsersSubscriptions DROP FOREIGN KEY FK_94F499E74C95116F');
        $this->addSql('ALTER TABLE IAPM_Packages_Plans DROP FOREIGN KEY FK_FF096BFC4C95116F');
        $this->addSql('ALTER TABLE Users DROP FOREIGN KEY FK_D5428AEDCA77D3A9');
        $this->addSql('ALTER TABLE IA_Taxonomy_Term DROP FOREIGN KEY FK_C6F4ABFC727ACA70');
        $this->addSql('ALTER TABLE IA_Taxonomy_Term DROP FOREIGN KEY FK_C6F4ABFCAD0E05F6');
        $this->addSql('DROP TABLE Users');
        $this->addSql('DROP TABLE user_group');
        $this->addSql('DROP TABLE IAP_AgreementDetails');
        $this->addSql('DROP TABLE IAP_GatewayConfig');
        $this->addSql('DROP TABLE IAP_PaymentDetails');
        $this->addSql('DROP TABLE IAP_PaymentTokens');
        $this->addSql('DROP TABLE WCT_Fieldsets');
        $this->addSql('DROP TABLE WCT_Fieldsets_Fields');
        $this->addSql('DROP TABLE WCT_Field_Types');
        $this->addSql('DROP TABLE WCT_ParcedItems');
        $this->addSql('DROP TABLE WCT_Projects');
        $this->addSql('DROP TABLE WCT_ProjectDetailsFields');
        $this->addSql('DROP TABLE WCT_ProjectListingFields');
        $this->addSql('DROP TABLE WCT_Projects_Processors');
        $this->addSql('DROP TABLE WCT_Projects_Processors_Mappings');
        $this->addSql('DROP TABLE IA_Cms_Pages');
        $this->addSql('DROP TABLE IAPM_Packages');
        $this->addSql('DROP TABLE IAPM_Packages_Plans');
        $this->addSql('DROP TABLE IAPM_Plans');
        $this->addSql('DROP TABLE IAPM_UsersSubscriptions');
        $this->addSql('DROP TABLE IA_Taxonomy_Term');
        $this->addSql('DROP TABLE IA_Taxonomy_Vocabularies');
    }
}
