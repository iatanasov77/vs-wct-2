<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20191014090240 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE IAUM_Users (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(180) NOT NULL, username_canonical VARCHAR(180) NOT NULL, email VARCHAR(180) NOT NULL, email_canonical VARCHAR(180) NOT NULL, enabled TINYINT(1) NOT NULL, salt VARCHAR(255) DEFAULT NULL, password VARCHAR(255) NOT NULL, last_login DATETIME DEFAULT NULL, confirmation_token VARCHAR(180) DEFAULT NULL, password_requested_at DATETIME DEFAULT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', api_token VARCHAR(255) DEFAULT NULL, firstName VARCHAR(128) NOT NULL, lastName VARCHAR(128) NOT NULL, country VARCHAR(3) NOT NULL, birthday DATETIME DEFAULT NULL, mobile INT DEFAULT NULL, website VARCHAR(64) DEFAULT NULL, occupation VARCHAR(64) DEFAULT NULL, subscriptionId INT DEFAULT NULL, UNIQUE INDEX UNIQ_9E6E7D9192FC23A8 (username_canonical), UNIQUE INDEX UNIQ_9E6E7D91A0D96FBF (email_canonical), UNIQUE INDEX UNIQ_9E6E7D91C05FB297 (confirmation_token), UNIQUE INDEX UNIQ_9E6E7D917BA2F5EB (api_token), UNIQUE INDEX UNIQ_9E6E7D91CA77D3A9 (subscriptionId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE IAUM_UserGroups (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', UNIQUE INDEX UNIQ_D52F22C85E237E06 (name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE IAUM_Users ADD CONSTRAINT FK_9E6E7D91CA77D3A9 FOREIGN KEY (subscriptionId) REFERENCES IAPM_UsersSubscriptions (id)');
        $this->addSql('ALTER TABLE WCT_Projects CHANGE parseMode parseMode enum(\'css\', \'xpath\')');
        $this->addSql('ALTER TABLE Users DROP FOREIGN KEY FK_D5428AEDCA77D3A9');
        $this->addSql('DROP INDEX FK_D5428AEDCA77D3A9 ON Users');
        $this->addSql('ALTER TABLE Users DROP subscriptionId, CHANGE firstName firstName VARCHAR(128) NOT NULL, CHANGE lastName lastName VARCHAR(128) NOT NULL, CHANGE country country VARCHAR(3) NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D5428AED92FC23A8 ON Users (username_canonical)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D5428AEDA0D96FBF ON Users (email_canonical)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D5428AEDC05FB297 ON Users (confirmation_token)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D5428AED7BA2F5EB ON Users (api_token)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE IAUM_Users');
        $this->addSql('DROP TABLE IAUM_UserGroups');
        $this->addSql('DROP INDEX UNIQ_D5428AED92FC23A8 ON Users');
        $this->addSql('DROP INDEX UNIQ_D5428AEDA0D96FBF ON Users');
        $this->addSql('DROP INDEX UNIQ_D5428AEDC05FB297 ON Users');
        $this->addSql('DROP INDEX UNIQ_D5428AED7BA2F5EB ON Users');
        $this->addSql('ALTER TABLE Users ADD subscriptionId INT DEFAULT NULL, CHANGE firstName firstName VARCHAR(128) DEFAULT NULL COLLATE utf8_general_ci, CHANGE lastName lastName VARCHAR(128) DEFAULT NULL COLLATE utf8_general_ci, CHANGE country country VARCHAR(3) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE Users ADD CONSTRAINT FK_D5428AEDCA77D3A9 FOREIGN KEY (subscriptionId) REFERENCES IAPM_UsersSubscriptions (id)');
        $this->addSql('CREATE INDEX FK_D5428AEDCA77D3A9 ON Users (subscriptionId)');
        $this->addSql('ALTER TABLE WCT_Projects CHANGE parseMode parseMode VARCHAR(255) DEFAULT \'xpath\' NOT NULL COLLATE utf8mb4_unicode_ci');
    }
}
