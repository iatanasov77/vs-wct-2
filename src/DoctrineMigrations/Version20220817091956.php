<?php

declare(strict_types=1);

namespace App\DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220817091956 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE VSPAY_Payment DROP FOREIGN KEY FK_8936E3C08EEC86F7');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions DROP FOREIGN KEY FK_11A46ECA8EEC86F7');
        $this->addSql('ALTER TABLE WCT_ProjectMappers DROP FOREIGN KEY FK_5B1A1CE937BAC19A');
        $this->addSql('CREATE TABLE VSPAY_Order (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, payment_method_id INT DEFAULT NULL, payment_id INT DEFAULT NULL, total_amount DOUBLE PRECISION NOT NULL, currency_code VARCHAR(8) NOT NULL, description VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME DEFAULT NULL, status ENUM(\'shopping_cart\', \'paid_order\', \'failed_order\'), INDEX IDX_87954502A76ED395 (user_id), INDEX IDX_879545025AA1164F (payment_method_id), UNIQUE INDEX UNIQ_879545024C3A3BB (payment_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE VSPAY_OrderItem (id INT AUTO_INCREMENT NOT NULL, order_id INT DEFAULT NULL, object_id INT DEFAULT NULL, object_type VARCHAR(255) NOT NULL, price DOUBLE PRECISION NOT NULL, currency_code VARCHAR(8) NOT NULL, INDEX IDX_1C9B655C8D9F6D38 (order_id), INDEX IDX_1C9B655C232D562B (object_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE VSPAY_Order ADD CONSTRAINT FK_87954502A76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('ALTER TABLE VSPAY_Order ADD CONSTRAINT FK_879545025AA1164F FOREIGN KEY (payment_method_id) REFERENCES VSPAY_PaymentMethod (id)');
        $this->addSql('ALTER TABLE VSPAY_Order ADD CONSTRAINT FK_879545024C3A3BB FOREIGN KEY (payment_id) REFERENCES VSPAY_Payment (id)');
        $this->addSql('ALTER TABLE VSPAY_OrderItem ADD CONSTRAINT FK_1C9B655C8D9F6D38 FOREIGN KEY (order_id) REFERENCES VSPAY_Order (id)');
        $this->addSql('ALTER TABLE VSPAY_OrderItem ADD CONSTRAINT FK_1C9B655C232D562B FOREIGN KEY (object_id) REFERENCES VSUS_PayedServiceSubscriptionPeriods (id)');
        $this->addSql('ALTER TABLE VSPAY_PaymentDetails DROP FOREIGN KEY FK_5F667026A76ED395');
        $this->addSql('DROP TABLE VSPAY_PaymentDetails');
        $this->addSql('DROP TABLE WCT_ProjectProcessors');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id maintenance_page_id  INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )');
        $this->addSql('ALTER TABLE VSPAY_GatewayConfig DROP active');
        $this->addSql('ALTER TABLE VSPAY_Payment DROP FOREIGN KEY FK_8936E3C05AA1164F');
        $this->addSql('DROP INDEX IDX_8936E3C05AA1164F ON VSPAY_Payment');
        $this->addSql('DROP INDEX IDX_8936E3C08EEC86F7 ON VSPAY_Payment');
        $this->addSql('ALTER TABLE VSPAY_Payment ADD created_at DATETIME NOT NULL, DROP payment_method_id, DROP payment_details_id');
        $this->addSql('ALTER TABLE VSPAY_PaymentMethod ADD slug VARCHAR(255) NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_1CCD1B9F989D9B62 ON VSPAY_PaymentMethod (slug)');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptionPeriods CHANGE currency currency_code VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions DROP FOREIGN KEY FK_11A46ECA5139FC0A');
        $this->addSql('DROP INDEX IDX_11A46ECA8EEC86F7 ON VSUS_PayedServiceSubscriptions');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD subscription_code VARCHAR(64) NOT NULL COMMENT \'Subscription Code Group Payed Services for an identical parameter but with differents levels(priority).\', ADD subscription_priority INT NOT NULL COMMENT \'Subscription Priority is the level of a Subscription Code.\', DROP payment_details_id');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD CONSTRAINT FK_11A46ECA5139FC0A FOREIGN KEY (payed_service_id) REFERENCES VSUS_PayedServiceSubscriptionPeriods (id)');
        $this->addSql('ALTER TABLE VSUS_PayedServices ADD subscription_code VARCHAR(64) NOT NULL COMMENT \'Subscription Code Group Payed Services for an identical parameter but with differents levels(priority).\', ADD subscription_priority INT NOT NULL COMMENT \'Subscription Priority is the level of a Subscription Code.\'');
        $this->addSql('CREATE UNIQUE INDEX subscription_idx ON VSUS_PayedServices (subscription_code, subscription_priority)');
        $this->addSql('ALTER TABLE WCT_ProjectFields CHANGE type type enum(\'text\', \'picture\', \'link\'), CHANGE collection_type collection_type enum(\'listing\', \'details\')');
        $this->addSql('DROP INDEX IDX_5B1A1CE937BAC19A ON WCT_ProjectMappers');
        $this->addSql('ALTER TABLE WCT_ProjectMappers ADD title VARCHAR(128) NOT NULL, ADD deployer enum(\'sylius\', \'magento\', \'prestashop\'), DROP processor_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE VSPAY_PaymentDetails (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, payment_method INT NOT NULL, details LONGTEXT CHARACTER SET utf8 NOT NULL COLLATE `utf8_unicode_ci` COMMENT \'(DC2Type:json)\', type VARCHAR(255) CHARACTER SET utf8 DEFAULT NULL COLLATE `utf8_unicode_ci`, INDEX IDX_5F667026A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE WCT_ProjectProcessors (id INT AUTO_INCREMENT NOT NULL, service VARCHAR(255) CHARACTER SET utf8 NOT NULL COLLATE `utf8_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE VSPAY_PaymentDetails ADD CONSTRAINT FK_5F667026A76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE VSPAY_Order DROP FOREIGN KEY FK_87954502A76ED395');
        $this->addSql('ALTER TABLE VSPAY_Order DROP FOREIGN KEY FK_879545025AA1164F');
        $this->addSql('ALTER TABLE VSPAY_Order DROP FOREIGN KEY FK_879545024C3A3BB');
        $this->addSql('ALTER TABLE VSPAY_OrderItem DROP FOREIGN KEY FK_1C9B655C8D9F6D38');
        $this->addSql('ALTER TABLE VSPAY_OrderItem DROP FOREIGN KEY FK_1C9B655C232D562B');
        $this->addSql('DROP TABLE VSPAY_Order');
        $this->addSql('DROP TABLE VSPAY_OrderItem');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings CHANGE maintenance_page_id  maintenance_page_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id) REFERENCES VSCMS_Pages (id) ON UPDATE NO ACTION ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id)');
        $this->addSql('ALTER TABLE VSPAY_GatewayConfig ADD active TINYINT(1) NOT NULL');
        $this->addSql('ALTER TABLE VSPAY_Payment ADD payment_method_id INT DEFAULT NULL, ADD payment_details_id INT DEFAULT NULL, DROP created_at');
        $this->addSql('ALTER TABLE VSPAY_Payment ADD CONSTRAINT FK_8936E3C05AA1164F FOREIGN KEY (payment_method_id) REFERENCES VSPAY_PaymentMethod (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE VSPAY_Payment ADD CONSTRAINT FK_8936E3C08EEC86F7 FOREIGN KEY (payment_details_id) REFERENCES VSPAY_PaymentDetails (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_8936E3C05AA1164F ON VSPAY_Payment (payment_method_id)');
        $this->addSql('CREATE INDEX IDX_8936E3C08EEC86F7 ON VSPAY_Payment (payment_details_id)');
        $this->addSql('DROP INDEX UNIQ_1CCD1B9F989D9B62 ON VSPAY_PaymentMethod');
        $this->addSql('ALTER TABLE VSPAY_PaymentMethod DROP slug');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptionPeriods CHANGE currency_code currency VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions DROP FOREIGN KEY FK_11A46ECA5139FC0A');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD payment_details_id INT DEFAULT NULL, DROP subscription_code, DROP subscription_priority');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD CONSTRAINT FK_11A46ECA8EEC86F7 FOREIGN KEY (payment_details_id) REFERENCES VSPAY_PaymentDetails (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE VSUS_PayedServiceSubscriptions ADD CONSTRAINT FK_11A46ECA5139FC0A FOREIGN KEY (payed_service_id) REFERENCES VSUS_PayedServices (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_11A46ECA8EEC86F7 ON VSUS_PayedServiceSubscriptions (payment_details_id)');
        $this->addSql('DROP INDEX subscription_idx ON VSUS_PayedServices');
        $this->addSql('ALTER TABLE VSUS_PayedServices DROP subscription_code, DROP subscription_priority');
        $this->addSql('ALTER TABLE WCT_ProjectFields CHANGE collection_type collection_type VARCHAR(255) DEFAULT NULL, CHANGE type type VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE WCT_ProjectMappers ADD processor_id INT DEFAULT NULL, DROP title, DROP deployer');
        $this->addSql('ALTER TABLE WCT_ProjectMappers ADD CONSTRAINT FK_5B1A1CE937BAC19A FOREIGN KEY (processor_id) REFERENCES WCT_ProjectProcessors (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_5B1A1CE937BAC19A ON WCT_ProjectMappers (processor_id)');
    }
}
