-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 15 окт 2019 в 08:25
-- Версия на сървъра: 5.5.64-MariaDB
-- PHP Version: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WCT_22`
--

-- --------------------------------------------------------

--
-- Структура на таблица `IAPM_Packages`
--

CREATE TABLE `IAPM_Packages` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAPM_Packages`
--

INSERT INTO `IAPM_Packages` (`id`, `title`) VALUES
(1, 'Test Package with Monthly Plan');

-- --------------------------------------------------------

--
-- Структура на таблица `IAPM_Packages_Plans`
--

CREATE TABLE `IAPM_Packages_Plans` (
  `id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAPM_Packages_Plans`
--

INSERT INTO `IAPM_Packages_Plans` (`id`, `price`, `description`, `packageId`, `planId`) VALUES
(1, '100.00', 'Test Package with Monthly Plan', 1, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `IAPM_Plans`
--

CREATE TABLE `IAPM_Plans` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAPM_Plans`
--

INSERT INTO `IAPM_Plans` (`id`, `title`, `subscription_period`) VALUES
(1, 'Monthly recuring plan', 'Month');

-- --------------------------------------------------------

--
-- Структура на таблица `IAPM_UsersSubscriptions`
--

CREATE TABLE `IAPM_UsersSubscriptions` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `paymentDetailsId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_AgreementDetails`
--

CREATE TABLE `IAP_AgreementDetails` (
  `id` int(11) NOT NULL,
  `details` blob NOT NULL COMMENT '(DC2Type:json_array)',
  `userId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAP_AgreementDetails`
--

INSERT INTO `IAP_AgreementDetails` (`id`, `details`, `userId`, `planId`) VALUES
(2, 0x7b225041594d454e54524551554553545f305f414d54223a302c224c5f42494c4c494e475459504530223a22526563757272696e675061796d656e7473222c224c5f42494c4c494e4741475245454d454e544445534352495054494f4e30223a2254657374205061636b6167652077697468204d6f6e74686c7920506c616e222c224e4f5348495050494e47223a317d, 1, 1),
(3, 0x7b225041594d454e54524551554553545f305f414d54223a302c224c5f42494c4c494e475459504530223a22526563757272696e675061796d656e7473222c224c5f42494c4c494e4741475245454d454e544445534352495054494f4e30223a2254657374205061636b6167652077697468204d6f6e74686c7920506c616e222c224e4f5348495050494e47223a317d, 1, 1),
(4, 0x7b225041594d454e54524551554553545f305f414d54223a302c224c5f42494c4c494e475459504530223a22526563757272696e675061796d656e7473222c224c5f42494c4c494e4741475245454d454e544445534352495054494f4e30223a2254657374205061636b6167652077697468204d6f6e74686c7920506c616e222c224e4f5348495050494e47223a312c2252455455524e55524c223a22687474703a5c2f5c2f776374322e6c685c2f7061796d656e745c2f7061796d656e745c2f636170747572655c2f59377a6375655f4757623265732d746b522d5a38333168473632395242784554556152506b50735a505167222c2243414e43454c55524c223a22687474703a5c2f5c2f776374322e6c685c2f7061796d656e745c2f7061796d656e745c2f636170747572655c2f59377a6375655f4757623265732d746b522d5a38333168473632395242784554556152506b50735a505167222c22494e564e554d223a347d, 1, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_GatewayConfig`
--

CREATE TABLE `IAP_GatewayConfig` (
  `id` int(11) NOT NULL,
  `gateway_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` blob NOT NULL COMMENT '(DC2Type:json_array)',
  `useSandbox` tinyint(1) NOT NULL,
  `sandboxConfig` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_PaymentDetails`
--

CREATE TABLE `IAP_PaymentDetails` (
  `id` int(11) NOT NULL,
  `details` blob NOT NULL COMMENT '(DC2Type:json_array)',
  `paymentMethod` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_PaymentTokens`
--

CREATE TABLE `IAP_PaymentTokens` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `details` text,
  `after_url` varchar(255) DEFAULT NULL,
  `target_url` varchar(255) DEFAULT NULL,
  `gateway_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `IAP_PaymentTokens`
--

INSERT INTO `IAP_PaymentTokens` (`id`, `hash`, `details`, `after_url`, `target_url`, `gateway_name`) VALUES
(1, 'MfT_F7UyL-FVdrmUjF5L7FEY6ZHADxBOkXvVpOTeI5E', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:4;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=MfT_F7UyL-FVdrmUjF5L7FEY6ZHADxBOkXvVpOTeI5E', 'paypal_express_checkout_recurring_payment'),
(2, 'Y7zcue_GWb2es-tkR-Z831hG629RBxETUaRPkPsZPQg', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:4;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=MfT_F7UyL-FVdrmUjF5L7FEY6ZHADxBOkXvVpOTeI5E', 'http://wct2.lh/payment/payment/capture/Y7zcue_GWb2es-tkR-Z831hG629RBxETUaRPkPsZPQg', 'paypal_express_checkout_recurring_payment');

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_UserGroups`
--

CREATE TABLE `IAUM_UserGroups` (
  `id` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_Users`
--

CREATE TABLE `IAUM_Users` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `username_canonical` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `api_token` varchar(255) DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `occupation` varchar(64) DEFAULT NULL,
  `subscriptionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `IAUM_Users`
--

INSERT INTO `IAUM_Users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `api_token`, `firstName`, `lastName`, `country`, `birthday`, `mobile`, `website`, `occupation`, `subscriptionId`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 1, '8dIoiB0Au4a63yQmz5c6rbd9/mLjmcczt6D7LSfWuRs', '$argon2i$v=19$m=65536,t=4,p=1$OGJWbzdZNFI4UmxQT2plVA$Fzy3257Ih4SLRx1+7uVEkKXVFKNuy4mm2utgvogI+eg', '2019-10-15 07:08:32', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `IA_Taxonomy_Term`
--

CREATE TABLE `IA_Taxonomy_Term` (
  `id` int(11) NOT NULL,
  `vocabulary_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `IA_Taxonomy_Vocabularies`
--

CREATE TABLE `IA_Taxonomy_Vocabularies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190511152715', '2019-09-28 12:22:29'),
('20190511154104', '2019-09-28 14:39:58'),
('20191014085910', '2019-10-15 03:56:07');

-- --------------------------------------------------------

--
-- Структура на таблица `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `website` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `Users`
--

INSERT INTO `Users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `api_token`, `firstName`, `lastName`, `country`, `birthday`, `mobile`, `website`, `occupation`) VALUES
(2, 'admin', 'admin', 'admin@wct2.lh', 'admin@wct2.lh', 1, 'Tt1KZf3BCRcrvqcyG.l1hpfN9c0WxfuZEudJBkj9CM8', '$argon2i$v=19$m=65536,t=4,p=1$YkhQSEdXb3JpaDB6a2JoLg$TXGTx1ww6dQO97yuB+2O+1eJlyb9YpKXtno+f481Oq4', '2019-10-14 07:49:22', NULL, NULL, 'a:2:{i:0;s:16:\"ROLE_SUPER_ADMIN\";i:1;s:10:\"ROLE_ADMIN\";}', NULL, 'Ivan', 'Atanasov', 'Ukr', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Fieldsets`
--

CREATE TABLE `WCT_Fieldsets` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_Fieldsets`
--

INSERT INTO `WCT_Fieldsets` (`id`, `title`) VALUES
(1, 'Test Fieldset');

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Fieldsets_Fields`
--

CREATE TABLE `WCT_Fieldsets_Fields` (
  `id` int(11) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `fieldsetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_Fieldsets_Fields`
--

INSERT INTO `WCT_Fieldsets_Fields` (`id`, `slug`, `title`, `typeId`, `fieldsetId`) VALUES
(1, 'title', 'title', 1, 1),
(2, 'price', 'price', 2, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Field_Types`
--

CREATE TABLE `WCT_Field_Types` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_Field_Types`
--

INSERT INTO `WCT_Field_Types` (`id`, `title`) VALUES
(1, 'Text'),
(2, 'Picture'),
(3, 'Link');

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_ParcedItems`
--

CREATE TABLE `WCT_ParcedItems` (
  `id` int(11) NOT NULL,
  `runSession` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUrl` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_ParcedItems`
--

INSERT INTO `WCT_ParcedItems` (`id`, `runSession`, `itemUrl`, `fields`, `created`, `updated`, `projectId`) VALUES
(1, 'af51f795091b5dd77b476cb1ad14a6e2', 'https://most.bg/aksesoari/mishki/where/p/5.html', 'a:5:{i:1;a:4:{s:5:\"title\";a:20:{i:0;s:36:\"Мишка GENIUS TRAVELER 600 LASER\";i:1;s:25:\"Мишка A4 Tech K3-23E\";i:2;s:37:\"Мишка Logitech Corded Mouse M500\";i:3;s:31:\"Мишка GENIUS Traveler P330\";i:4;s:32:\"Мишка GENIUS Navigator 900X\";i:5;s:48:\"Мишка A4 Tech MOP-59D 2X Mini Optical Mouse\";i:6;s:66:\"Мишка Disney High School Musical mini optical mouse DSY-MM220\";i:7;s:18:\"Мишка A4 BW-9\";i:8;s:18:\"Мишка A4 BW-9\";i:9;s:46:\"Мишка Disney Cars optical mouse DSY-MO112\";i:10;s:60:\"Мишка Disney Mickey Mouse Retro optical mouse DSY-MO150\";i:11;s:68:\"Подложка за мишка Disney Mouse Pad Princess DSY-MP010\";i:12;s:52:\"Мишка A4 Tech X-705K Oscar Optical Gaming Mouse\";i:13;s:41:\"Мишка SWEEX MI350 NB LASER MOUSE USB\";i:14;s:39:\"Мишка SWEEX MI301 NB OPTICAL MOUSE\";i:15;s:41:\"Мишка SWEEX MI600 WL OPTMOUSE USB RC\";i:16;s:35:\"Мишка SWEEX MI012 WL OPT MOUSE\";i:17;s:38:\"Мишка SWEEX MI401 NB WL OPT MOUSE\";i:18;s:40:\"Мишка SWEEX MI031 NB OPT MOUSE SLVR\";i:19;s:34:\"Мишка HP X3000 Wireless Mouse\";}s:7:\"price-1\";a:1:{i:0;s:109:\"\n                                                    17,50 лв.                                            \";}s:6:\"test-1\";a:1:{i:0;s:35:\"Категории продукти\";}s:5:\"price\";a:20:{i:0;s:57:\"\n                        21,00 лв.                    \";i:1;s:57:\"\n                        15,72 лв.                    \";i:2;s:57:\"\n                        60,00 лв.                    \";i:3;s:57:\"\n                        17,64 лв.                    \";i:4;s:57:\"\n                        20,64 лв.                    \";i:5;s:56:\"\n                        7,20 лв.                    \";i:6;s:56:\"\n                        6,36 лв.                    \";i:7;s:56:\"\n                        6,72 лв.                    \";i:8;s:56:\"\n                        8,64 лв.                    \";i:9;s:57:\"\n                        10,68 лв.                    \";i:10;s:56:\"\n                        7,56 лв.                    \";i:11;s:56:\"\n                        2,28 лв.                    \";i:12;s:57:\"\n                        28,32 лв.                    \";i:13;s:57:\"\n                        12,00 лв.                    \";i:14;s:57:\"\n                        21,60 лв.                    \";i:15;s:57:\"\n                        22,80 лв.                    \";i:16;s:57:\"\n                        29,40 лв.                    \";i:17;s:57:\"\n                        22,32 лв.                    \";i:18;s:57:\"\n                        11,28 лв.                    \";i:19;s:57:\"\n                        21,00 лв.                    \";}}i:2;a:3:{s:5:\"title\";a:20:{i:0;s:36:\"Мишка HP X4000b Bluetooth Mouse\";i:1;s:44:\"Мишка Logitech Wireless Mini Mouse M187\";i:2;s:43:\"Мишка Logitech Wireless Trackball M570\";i:3;s:39:\"Мишка A4 Tech N-708X PADLESS MOUSE\";i:4;s:20:\"Мишка A4 NB-50D\";i:5;s:26:\"Мишка A4 Tech G3-280N\";i:6;s:20:\"Мишка A4 NB-30D\";i:7;s:39:\"Мишка Logitech Wireless Mouse M185\";i:8;s:29:\"Мишка Logitech Mouse M90\";i:9;s:40:\"Мишка GENIUS TRAVELER 525 USB BLACK\";i:10;s:31:\"Мишка GENIUS NAVIGATOR 805\";i:11;s:25:\"Мишка A4 Tech G9-100\";i:12;s:45:\"Мишка A4 Tech NB-70 BatteryFree Wireless\";i:13;s:45:\"Мишка A4 Tech NB-40 BatteryFree Wireless\";i:14;s:51:\"Мишка Disney Toy Story optical mouse DSY-MO195\";i:15;s:51:\"Мишка Disney Cars mini optical mouse DSY-MM230\";i:16;s:78:\"Мишка Disney Twin Pack Mickey Retro: Optical Mouse + Mouse Pad DSY-TP3002\";i:17;s:74:\"Мишка Disney Twin Pack Princess: Optical Mouse + Mouse Pad DSY-TP2002\";i:18;s:80:\"Мишка Disney Twin Pack Hannah Montana: Optical Mouse + Mouse Pad DSY-TP5001\";i:19;s:74:\"Подложка за мишка Disney Mouse Pad Hannah Montana DSY-MP087\";}s:6:\"test-1\";a:1:{i:0;s:35:\"Категории продукти\";}s:5:\"price\";a:20:{i:0;s:57:\"\n                        31,56 лв.                    \";i:1;s:57:\"\n                        40,80 лв.                    \";i:2;s:58:\"\n                        153,60 лв.                    \";i:3;s:57:\"\n                        12,84 лв.                    \";i:4;s:57:\"\n                        15,72 лв.                    \";i:5;s:57:\"\n                        15,36 лв.                    \";i:6;s:57:\"\n                        15,72 лв.                    \";i:7;s:57:\"\n                        27,72 лв.                    \";i:8;s:57:\"\n                        14,40 лв.                    \";i:9;s:57:\"\n                        15,60 лв.                    \";i:10;s:57:\"\n                        20,16 лв.                    \";i:11;s:57:\"\n                        22,68 лв.                    \";i:12;s:57:\"\n                        14,52 лв.                    \";i:13;s:56:\"\n                        9,84 лв.                    \";i:14;s:56:\"\n                        6,12 лв.                    \";i:15;s:56:\"\n                        7,56 лв.                    \";i:16;s:57:\"\n                        10,56 лв.                    \";i:17;s:57:\"\n                        11,40 лв.                    \";i:18;s:56:\"\n                        7,56 лв.                    \";i:19;s:56:\"\n                        2,04 лв.                    \";}}i:3;a:3:{s:5:\"title\";a:20:{i:0;s:58:\"Подложка за мишка DISNEY MOUSEPAD TOY STORY\";i:1;s:68:\"Подложка за мишка Disney Mouse Pad Princess DSY-MP013\";i:2;s:67:\"Подложка за мишка Disney Mouse Pad Fairies DSY-MP081\";i:3;s:75:\"Подложка за мишка Disney Mouse Pad Winnie the Pooh DSY-MP006\";i:4;s:72:\"Подложка за мишка Disney Mouse Pad Mickey retro DSY-MP061\";i:5;s:46:\"Мишка A4 Tech NB-90D BatteryFree Wireless\";i:6;s:55:\"Мишка Disney Hanna Montana optical mouse DSY-MO140\";i:7;s:82:\"Мишка Disney Twin Pack High school Musical: Mini Mouse + Mouse Pad DSY-TP6001\";i:8;s:47:\" Мишка LOGITECH G602 Wireless Gaming Mouse\";i:9;s:42:\"Мишка LOGITECH B100 Optical USB Mouse\";i:10;s:25:\"Мишка CM STORM Recon\";i:11;s:25:\"Мишка CM STORM Recon\";i:12;s:15:\"Мишка MS2K\";i:13;s:39:\"Мишка OMEGA P11 27PB43BK USB BLACK\";i:14;s:53:\"Мишка MOUSE OMEGA 3GB OPTICAL USB BLACK 27PC43BK\";i:15;s:52:\"Мишка OMEGA OPTICAL MOUSE 3D USB BLACK 279743BK\";i:16;s:49:\"Мишка OMEGA 6D OPTICAL GAMING MOUSE 27G223BK\";i:17;s:35:\"Мишка A4 Tech OP-720 black USB\";i:18;s:42:\"Мишка Asus Echelon Laser Gaming Mouse\";i:19;s:29:\"ASUS ECHELON Gaming Mouse Pad\";}s:6:\"test-1\";a:1:{i:0;s:35:\"Категории продукти\";}s:5:\"price\";a:20:{i:0;s:56:\"\n                        1,92 лв.                    \";i:1;s:56:\"\n                        2,28 лв.                    \";i:2;s:56:\"\n                        2,28 лв.                    \";i:3;s:56:\"\n                        2,28 лв.                    \";i:4;s:56:\"\n                        2,52 лв.                    \";i:5;s:57:\"\n                        21,00 лв.                    \";i:6;s:56:\"\n                        4,80 лв.                    \";i:7;s:56:\"\n                        7,44 лв.                    \";i:8;s:58:\"\n                        183,60 лв.                    \";i:9;s:57:\"\n                        12,12 лв.                    \";i:10;s:57:\"\n                        78,00 лв.                    \";i:11;s:57:\"\n                        78,00 лв.                    \";i:12;s:57:\"\n                        23,76 лв.                    \";i:13;s:56:\"\n                        5,64 лв.                    \";i:14;s:56:\"\n                        4,68 лв.                    \";i:15;s:56:\"\n                        5,76 лв.                    \";i:16;s:57:\"\n                        15,84 лв.                    \";i:17;s:56:\"\n                        6,96 лв.                    \";i:18;s:57:\"\n                        74,40 лв.                    \";i:19;s:57:\"\n                        27,12 лв.                    \";}}i:4;a:3:{s:5:\"title\";a:20:{i:0;s:78:\"Мишка Lenovo N700 Wireless and Bluetooth Mouse and Laser Pointer (Orange)\";i:1;s:38:\"Мишка ASUS STRIX CLAW /BLK GAMING\";i:2;s:55:\"Мишка Logitech Hyperion Fury G402 FPS Gaming Mouse\";i:3;s:49:\"Мишка Logitech Wireless Mouse M185 Black+Red\";i:4;s:50:\"Мишка Logitech Wireless Mouse M185 Black+Blue\";i:5;s:50:\"Мишка Logitech M280 Wireless Mouse, NB, Black\";i:6;s:39:\"Мишка Logitech MX Master Bluetooth\";i:7;s:39:\"Мишка ASUS STRIX CLAW DARK EDITION\";i:8;s:60:\"Мишка Logitech Marathon Mouse M705 wireless Laser Black\";i:9;s:38:\"Мишка A4 V3MA BLOODY Gaming Black\";i:10;s:38:\"Мишка A4 V5MA BLOODY Gaming Black\";i:11;s:37:\"Мишка A4 N-300 V-TRACK USB Black\";i:12;s:42:\"Мишка Lenovo Y Gaming Precision Mouse\";i:13;s:50:\"Мишка Logitech M170 Wireless Mouse Black/Grey\";i:14;s:41:\"Мишка OMEGA 6D OPT GAMING USB Orange\";i:15;s:41:\"Мишка OMEGA 6D OPT GAMING USB Yellow\";i:16;s:44:\"Мишка OMEGA 7D 292 GAMING USB Black-Red\";i:17;s:44:\"Мишка OMEGA 7D 293 GAMING USB Black-Red\";i:18;s:44:\"Мишка Logitech M171 Wireless Black/Blue\";i:19;s:44:\"Мишка FNATIC Flick Optical Gaming Mouse\";}s:6:\"test-1\";a:1:{i:0;s:35:\"Категории продукти\";}s:5:\"price\";a:20:{i:0;s:57:\"\n                        75,60 лв.                    \";i:1;s:57:\"\n                        96,00 лв.                    \";i:2;s:58:\"\n                        115,20 лв.                    \";i:3;s:57:\"\n                        27,72 лв.                    \";i:4;s:57:\"\n                        27,72 лв.                    \";i:5;s:57:\"\n                        44,40 лв.                    \";i:6;s:58:\"\n                        158,40 лв.                    \";i:7;s:57:\"\n                        94,80 лв.                    \";i:8;s:57:\"\n                        81,60 лв.                    \";i:9;s:57:\"\n                        35,52 лв.                    \";i:10;s:57:\"\n                        33,84 лв.                    \";i:11;s:56:\"\n                        7,80 лв.                    \";i:12;s:57:\"\n                        98,40 лв.                    \";i:13;s:57:\"\n                        21,60 лв.                    \";i:14;s:57:\"\n                        12,36 лв.                    \";i:15;s:57:\"\n                        12,24 лв.                    \";i:16;s:57:\"\n                        21,12 лв.                    \";i:17;s:57:\"\n                        27,36 лв.                    \";i:18;s:57:\"\n                        27,48 лв.                    \";i:19;s:58:\"\n                        111,60 лв.                    \";}}i:5;a:3:{s:5:\"title\";a:20:{i:0;s:39:\"FNATIC Boost Control XL Gaming Mousepad\";i:1;s:36:\"FNATIC Focus Desktop Gaming Mousepad\";i:2;s:17:\"ASUS Cerberus Pad\";i:3;s:39:\"Мишка ASUS ROG Sica P301-1B GAMING\";i:4;s:37:\"Мишка ACER PREDATOR GAMING MOUSE\";i:5;s:38:\"Мишка LOGITECH G502 PROTEUS Black\";i:6;s:39:\"Мишка LOGITECH G900 CHAOS SPECTRUM\";i:7;s:47:\"Мишка LOGITECH Wireless G403 PRODIGY MOUSE\";i:8;s:29:\"FNATIC FOCUS XXL JW MOUSE PAD\";i:9;s:23:\"LENOVO GAMING MOUSE PAD\";i:10;s:53:\"Мишка LOGITECH Wireless B170 Optical Mouse Black\";i:11;s:45:\"Мишка FNATIC Clutch Optical Gaming Mouse\";i:12;s:31:\"Мишка LENOVO 300 USB MOUSE\";i:13;s:35:\"Мишка Lenovo Y Gaming Mouse WW\";i:14;s:23:\"LOGITECH WL M220 SILENT\";i:15;s:28:\"LOGITECH WL M330 SILENT PLUS\";i:16;s:27:\"LOGITECH WL MX MASTER STONE\";i:17;s:28:\"MSI INTERCEPTOR DS B1 GAMING\";i:18;s:28:\"A4 ZL50 BLOODY LASER SVR/BLK\";i:19;s:27:\"ASUS CERBERUS ARCTIC GAMING\";}s:6:\"test-1\";a:1:{i:0;s:35:\"Категории продукти\";}s:5:\"price\";a:20:{i:0;s:57:\"\n                        38,40 лв.                    \";i:1;s:57:\"\n                        84,00 лв.                    \";i:2;s:57:\"\n                        16,92 лв.                    \";i:3;s:57:\"\n                        81,60 лв.                    \";i:4;s:58:\"\n                        142,80 лв.                    \";i:5;s:58:\"\n                        153,60 лв.                    \";i:6;s:58:\"\n                        238,80 лв.                    \";i:7;s:58:\"\n                        199,20 лв.                    \";i:8;s:57:\"\n                        45,60 лв.                    \";i:9;s:57:\"\n                        19,68 лв.                    \";i:10;s:57:\"\n                        22,32 лв.                    \";i:11;s:58:\"\n                        104,40 лв.                    \";i:12;s:57:\"\n                        14,40 лв.                    \";i:13;s:57:\"\n                        61,20 лв.                    \";i:14;s:57:\"\n                        40,80 лв.                    \";i:15;s:57:\"\n                        81,60 лв.                    \";i:16;s:58:\"\n                        195,60 лв.                    \";i:17;s:57:\"\n                        31,44 лв.                    \";i:18;s:57:\"\n                        61,20 лв.                    \";i:19;s:57:\"\n                        39,60 лв.                    \";}}}', '2019-10-06 21:37:42', NULL, 2),
(2, 'd648f4bf627f147595fc356152bb8a07', 'https://most.bg/aksesoari/mishki/where/p/5.html', 'a:5:{i:1;a:20:{i:0;a:2:{s:5:\"title\";s:36:\"Мишка GENIUS TRAVELER 600 LASER\";s:5:\"price\";s:57:\"\n                        21,00 лв.                    \";}i:1;a:2:{s:5:\"title\";s:25:\"Мишка A4 Tech K3-23E\";s:5:\"price\";s:57:\"\n                        15,72 лв.                    \";}i:2;a:2:{s:5:\"title\";s:37:\"Мишка Logitech Corded Mouse M500\";s:5:\"price\";s:57:\"\n                        60,00 лв.                    \";}i:3;a:2:{s:5:\"title\";s:31:\"Мишка GENIUS Traveler P330\";s:5:\"price\";s:57:\"\n                        17,64 лв.                    \";}i:4;a:2:{s:5:\"title\";s:32:\"Мишка GENIUS Navigator 900X\";s:5:\"price\";s:57:\"\n                        20,64 лв.                    \";}i:5;a:2:{s:5:\"title\";s:48:\"Мишка A4 Tech MOP-59D 2X Mini Optical Mouse\";s:5:\"price\";s:56:\"\n                        7,20 лв.                    \";}i:6;a:2:{s:5:\"title\";s:66:\"Мишка Disney High School Musical mini optical mouse DSY-MM220\";s:5:\"price\";s:56:\"\n                        6,36 лв.                    \";}i:7;a:2:{s:5:\"title\";s:18:\"Мишка A4 BW-9\";s:5:\"price\";s:56:\"\n                        6,72 лв.                    \";}i:8;a:2:{s:5:\"title\";s:18:\"Мишка A4 BW-9\";s:5:\"price\";s:56:\"\n                        8,64 лв.                    \";}i:9;a:2:{s:5:\"title\";s:46:\"Мишка Disney Cars optical mouse DSY-MO112\";s:5:\"price\";s:57:\"\n                        10,68 лв.                    \";}i:10;a:2:{s:5:\"title\";s:60:\"Мишка Disney Mickey Mouse Retro optical mouse DSY-MO150\";s:5:\"price\";s:56:\"\n                        7,56 лв.                    \";}i:11;a:2:{s:5:\"title\";s:68:\"Подложка за мишка Disney Mouse Pad Princess DSY-MP010\";s:5:\"price\";s:56:\"\n                        2,28 лв.                    \";}i:12;a:2:{s:5:\"title\";s:52:\"Мишка A4 Tech X-705K Oscar Optical Gaming Mouse\";s:5:\"price\";s:57:\"\n                        28,32 лв.                    \";}i:13;a:2:{s:5:\"title\";s:41:\"Мишка SWEEX MI350 NB LASER MOUSE USB\";s:5:\"price\";s:57:\"\n                        12,00 лв.                    \";}i:14;a:2:{s:5:\"title\";s:39:\"Мишка SWEEX MI301 NB OPTICAL MOUSE\";s:5:\"price\";s:57:\"\n                        21,60 лв.                    \";}i:15;a:2:{s:5:\"title\";s:41:\"Мишка SWEEX MI600 WL OPTMOUSE USB RC\";s:5:\"price\";s:57:\"\n                        22,80 лв.                    \";}i:16;a:2:{s:5:\"title\";s:35:\"Мишка SWEEX MI012 WL OPT MOUSE\";s:5:\"price\";s:57:\"\n                        29,40 лв.                    \";}i:17;a:2:{s:5:\"title\";s:38:\"Мишка SWEEX MI401 NB WL OPT MOUSE\";s:5:\"price\";s:57:\"\n                        22,32 лв.                    \";}i:18;a:2:{s:5:\"title\";s:40:\"Мишка SWEEX MI031 NB OPT MOUSE SLVR\";s:5:\"price\";s:57:\"\n                        11,28 лв.                    \";}i:19;a:2:{s:5:\"title\";s:34:\"Мишка HP X3000 Wireless Mouse\";s:5:\"price\";s:57:\"\n                        21,00 лв.                    \";}}i:2;a:20:{i:0;a:2:{s:5:\"title\";s:36:\"Мишка HP X4000b Bluetooth Mouse\";s:5:\"price\";s:57:\"\n                        31,56 лв.                    \";}i:1;a:2:{s:5:\"title\";s:44:\"Мишка Logitech Wireless Mini Mouse M187\";s:5:\"price\";s:57:\"\n                        40,80 лв.                    \";}i:2;a:2:{s:5:\"title\";s:43:\"Мишка Logitech Wireless Trackball M570\";s:5:\"price\";s:58:\"\n                        153,60 лв.                    \";}i:3;a:2:{s:5:\"title\";s:39:\"Мишка A4 Tech N-708X PADLESS MOUSE\";s:5:\"price\";s:57:\"\n                        12,84 лв.                    \";}i:4;a:2:{s:5:\"title\";s:20:\"Мишка A4 NB-50D\";s:5:\"price\";s:57:\"\n                        15,72 лв.                    \";}i:5;a:2:{s:5:\"title\";s:26:\"Мишка A4 Tech G3-280N\";s:5:\"price\";s:57:\"\n                        15,36 лв.                    \";}i:6;a:2:{s:5:\"title\";s:20:\"Мишка A4 NB-30D\";s:5:\"price\";s:57:\"\n                        15,72 лв.                    \";}i:7;a:2:{s:5:\"title\";s:39:\"Мишка Logitech Wireless Mouse M185\";s:5:\"price\";s:57:\"\n                        27,72 лв.                    \";}i:8;a:2:{s:5:\"title\";s:29:\"Мишка Logitech Mouse M90\";s:5:\"price\";s:57:\"\n                        14,40 лв.                    \";}i:9;a:2:{s:5:\"title\";s:40:\"Мишка GENIUS TRAVELER 525 USB BLACK\";s:5:\"price\";s:57:\"\n                        15,60 лв.                    \";}i:10;a:2:{s:5:\"title\";s:31:\"Мишка GENIUS NAVIGATOR 805\";s:5:\"price\";s:57:\"\n                        20,16 лв.                    \";}i:11;a:2:{s:5:\"title\";s:25:\"Мишка A4 Tech G9-100\";s:5:\"price\";s:57:\"\n                        22,68 лв.                    \";}i:12;a:2:{s:5:\"title\";s:45:\"Мишка A4 Tech NB-70 BatteryFree Wireless\";s:5:\"price\";s:57:\"\n                        14,52 лв.                    \";}i:13;a:2:{s:5:\"title\";s:45:\"Мишка A4 Tech NB-40 BatteryFree Wireless\";s:5:\"price\";s:56:\"\n                        9,84 лв.                    \";}i:14;a:2:{s:5:\"title\";s:51:\"Мишка Disney Toy Story optical mouse DSY-MO195\";s:5:\"price\";s:56:\"\n                        6,12 лв.                    \";}i:15;a:2:{s:5:\"title\";s:51:\"Мишка Disney Cars mini optical mouse DSY-MM230\";s:5:\"price\";s:56:\"\n                        7,56 лв.                    \";}i:16;a:2:{s:5:\"title\";s:78:\"Мишка Disney Twin Pack Mickey Retro: Optical Mouse + Mouse Pad DSY-TP3002\";s:5:\"price\";s:57:\"\n                        10,56 лв.                    \";}i:17;a:2:{s:5:\"title\";s:74:\"Мишка Disney Twin Pack Princess: Optical Mouse + Mouse Pad DSY-TP2002\";s:5:\"price\";s:57:\"\n                        11,40 лв.                    \";}i:18;a:2:{s:5:\"title\";s:80:\"Мишка Disney Twin Pack Hannah Montana: Optical Mouse + Mouse Pad DSY-TP5001\";s:5:\"price\";s:56:\"\n                        7,56 лв.                    \";}i:19;a:2:{s:5:\"title\";s:74:\"Подложка за мишка Disney Mouse Pad Hannah Montana DSY-MP087\";s:5:\"price\";s:56:\"\n                        2,04 лв.                    \";}}i:3;a:20:{i:0;a:2:{s:5:\"title\";s:58:\"Подложка за мишка DISNEY MOUSEPAD TOY STORY\";s:5:\"price\";s:56:\"\n                        1,92 лв.                    \";}i:1;a:2:{s:5:\"title\";s:68:\"Подложка за мишка Disney Mouse Pad Princess DSY-MP013\";s:5:\"price\";s:56:\"\n                        2,28 лв.                    \";}i:2;a:2:{s:5:\"title\";s:67:\"Подложка за мишка Disney Mouse Pad Fairies DSY-MP081\";s:5:\"price\";s:56:\"\n                        2,28 лв.                    \";}i:3;a:2:{s:5:\"title\";s:75:\"Подложка за мишка Disney Mouse Pad Winnie the Pooh DSY-MP006\";s:5:\"price\";s:56:\"\n                        2,28 лв.                    \";}i:4;a:2:{s:5:\"title\";s:72:\"Подложка за мишка Disney Mouse Pad Mickey retro DSY-MP061\";s:5:\"price\";s:56:\"\n                        2,52 лв.                    \";}i:5;a:2:{s:5:\"title\";s:46:\"Мишка A4 Tech NB-90D BatteryFree Wireless\";s:5:\"price\";s:57:\"\n                        21,00 лв.                    \";}i:6;a:2:{s:5:\"title\";s:55:\"Мишка Disney Hanna Montana optical mouse DSY-MO140\";s:5:\"price\";s:56:\"\n                        4,80 лв.                    \";}i:7;a:2:{s:5:\"title\";s:82:\"Мишка Disney Twin Pack High school Musical: Mini Mouse + Mouse Pad DSY-TP6001\";s:5:\"price\";s:56:\"\n                        7,44 лв.                    \";}i:8;a:2:{s:5:\"title\";s:47:\" Мишка LOGITECH G602 Wireless Gaming Mouse\";s:5:\"price\";s:58:\"\n                        183,60 лв.                    \";}i:9;a:2:{s:5:\"title\";s:42:\"Мишка LOGITECH B100 Optical USB Mouse\";s:5:\"price\";s:57:\"\n                        12,12 лв.                    \";}i:10;a:2:{s:5:\"title\";s:25:\"Мишка CM STORM Recon\";s:5:\"price\";s:57:\"\n                        78,00 лв.                    \";}i:11;a:2:{s:5:\"title\";s:25:\"Мишка CM STORM Recon\";s:5:\"price\";s:57:\"\n                        78,00 лв.                    \";}i:12;a:2:{s:5:\"title\";s:15:\"Мишка MS2K\";s:5:\"price\";s:57:\"\n                        23,76 лв.                    \";}i:13;a:2:{s:5:\"title\";s:39:\"Мишка OMEGA P11 27PB43BK USB BLACK\";s:5:\"price\";s:56:\"\n                        5,64 лв.                    \";}i:14;a:2:{s:5:\"title\";s:53:\"Мишка MOUSE OMEGA 3GB OPTICAL USB BLACK 27PC43BK\";s:5:\"price\";s:56:\"\n                        4,68 лв.                    \";}i:15;a:2:{s:5:\"title\";s:52:\"Мишка OMEGA OPTICAL MOUSE 3D USB BLACK 279743BK\";s:5:\"price\";s:56:\"\n                        5,76 лв.                    \";}i:16;a:2:{s:5:\"title\";s:49:\"Мишка OMEGA 6D OPTICAL GAMING MOUSE 27G223BK\";s:5:\"price\";s:57:\"\n                        15,84 лв.                    \";}i:17;a:2:{s:5:\"title\";s:35:\"Мишка A4 Tech OP-720 black USB\";s:5:\"price\";s:56:\"\n                        6,96 лв.                    \";}i:18;a:2:{s:5:\"title\";s:42:\"Мишка Asus Echelon Laser Gaming Mouse\";s:5:\"price\";s:57:\"\n                        74,40 лв.                    \";}i:19;a:2:{s:5:\"title\";s:29:\"ASUS ECHELON Gaming Mouse Pad\";s:5:\"price\";s:57:\"\n                        27,12 лв.                    \";}}i:4;a:20:{i:0;a:2:{s:5:\"title\";s:78:\"Мишка Lenovo N700 Wireless and Bluetooth Mouse and Laser Pointer (Orange)\";s:5:\"price\";s:57:\"\n                        75,60 лв.                    \";}i:1;a:2:{s:5:\"title\";s:38:\"Мишка ASUS STRIX CLAW /BLK GAMING\";s:5:\"price\";s:57:\"\n                        96,00 лв.                    \";}i:2;a:2:{s:5:\"title\";s:55:\"Мишка Logitech Hyperion Fury G402 FPS Gaming Mouse\";s:5:\"price\";s:58:\"\n                        115,20 лв.                    \";}i:3;a:2:{s:5:\"title\";s:49:\"Мишка Logitech Wireless Mouse M185 Black+Red\";s:5:\"price\";s:57:\"\n                        27,72 лв.                    \";}i:4;a:2:{s:5:\"title\";s:50:\"Мишка Logitech Wireless Mouse M185 Black+Blue\";s:5:\"price\";s:57:\"\n                        27,72 лв.                    \";}i:5;a:2:{s:5:\"title\";s:50:\"Мишка Logitech M280 Wireless Mouse, NB, Black\";s:5:\"price\";s:57:\"\n                        44,40 лв.                    \";}i:6;a:2:{s:5:\"title\";s:39:\"Мишка Logitech MX Master Bluetooth\";s:5:\"price\";s:58:\"\n                        158,40 лв.                    \";}i:7;a:2:{s:5:\"title\";s:39:\"Мишка ASUS STRIX CLAW DARK EDITION\";s:5:\"price\";s:57:\"\n                        94,80 лв.                    \";}i:8;a:2:{s:5:\"title\";s:60:\"Мишка Logitech Marathon Mouse M705 wireless Laser Black\";s:5:\"price\";s:57:\"\n                        81,60 лв.                    \";}i:9;a:2:{s:5:\"title\";s:38:\"Мишка A4 V3MA BLOODY Gaming Black\";s:5:\"price\";s:57:\"\n                        35,52 лв.                    \";}i:10;a:2:{s:5:\"title\";s:38:\"Мишка A4 V5MA BLOODY Gaming Black\";s:5:\"price\";s:57:\"\n                        33,84 лв.                    \";}i:11;a:2:{s:5:\"title\";s:37:\"Мишка A4 N-300 V-TRACK USB Black\";s:5:\"price\";s:56:\"\n                        7,80 лв.                    \";}i:12;a:2:{s:5:\"title\";s:42:\"Мишка Lenovo Y Gaming Precision Mouse\";s:5:\"price\";s:57:\"\n                        98,40 лв.                    \";}i:13;a:2:{s:5:\"title\";s:50:\"Мишка Logitech M170 Wireless Mouse Black/Grey\";s:5:\"price\";s:57:\"\n                        21,60 лв.                    \";}i:14;a:2:{s:5:\"title\";s:41:\"Мишка OMEGA 6D OPT GAMING USB Orange\";s:5:\"price\";s:57:\"\n                        12,36 лв.                    \";}i:15;a:2:{s:5:\"title\";s:41:\"Мишка OMEGA 6D OPT GAMING USB Yellow\";s:5:\"price\";s:57:\"\n                        12,24 лв.                    \";}i:16;a:2:{s:5:\"title\";s:44:\"Мишка OMEGA 7D 292 GAMING USB Black-Red\";s:5:\"price\";s:57:\"\n                        21,12 лв.                    \";}i:17;a:2:{s:5:\"title\";s:44:\"Мишка OMEGA 7D 293 GAMING USB Black-Red\";s:5:\"price\";s:57:\"\n                        27,36 лв.                    \";}i:18;a:2:{s:5:\"title\";s:44:\"Мишка Logitech M171 Wireless Black/Blue\";s:5:\"price\";s:57:\"\n                        27,48 лв.                    \";}i:19;a:2:{s:5:\"title\";s:44:\"Мишка FNATIC Flick Optical Gaming Mouse\";s:5:\"price\";s:58:\"\n                        111,60 лв.                    \";}}i:5;a:20:{i:0;a:2:{s:5:\"title\";s:39:\"FNATIC Boost Control XL Gaming Mousepad\";s:5:\"price\";s:57:\"\n                        38,40 лв.                    \";}i:1;a:2:{s:5:\"title\";s:36:\"FNATIC Focus Desktop Gaming Mousepad\";s:5:\"price\";s:57:\"\n                        84,00 лв.                    \";}i:2;a:2:{s:5:\"title\";s:17:\"ASUS Cerberus Pad\";s:5:\"price\";s:57:\"\n                        16,92 лв.                    \";}i:3;a:2:{s:5:\"title\";s:39:\"Мишка ASUS ROG Sica P301-1B GAMING\";s:5:\"price\";s:57:\"\n                        81,60 лв.                    \";}i:4;a:2:{s:5:\"title\";s:37:\"Мишка ACER PREDATOR GAMING MOUSE\";s:5:\"price\";s:58:\"\n                        142,80 лв.                    \";}i:5;a:2:{s:5:\"title\";s:38:\"Мишка LOGITECH G502 PROTEUS Black\";s:5:\"price\";s:58:\"\n                        153,60 лв.                    \";}i:6;a:2:{s:5:\"title\";s:39:\"Мишка LOGITECH G900 CHAOS SPECTRUM\";s:5:\"price\";s:58:\"\n                        238,80 лв.                    \";}i:7;a:2:{s:5:\"title\";s:47:\"Мишка LOGITECH Wireless G403 PRODIGY MOUSE\";s:5:\"price\";s:58:\"\n                        199,20 лв.                    \";}i:8;a:2:{s:5:\"title\";s:29:\"FNATIC FOCUS XXL JW MOUSE PAD\";s:5:\"price\";s:57:\"\n                        45,60 лв.                    \";}i:9;a:2:{s:5:\"title\";s:23:\"LENOVO GAMING MOUSE PAD\";s:5:\"price\";s:57:\"\n                        19,68 лв.                    \";}i:10;a:2:{s:5:\"title\";s:53:\"Мишка LOGITECH Wireless B170 Optical Mouse Black\";s:5:\"price\";s:57:\"\n                        22,32 лв.                    \";}i:11;a:2:{s:5:\"title\";s:45:\"Мишка FNATIC Clutch Optical Gaming Mouse\";s:5:\"price\";s:58:\"\n                        104,40 лв.                    \";}i:12;a:2:{s:5:\"title\";s:31:\"Мишка LENOVO 300 USB MOUSE\";s:5:\"price\";s:57:\"\n                        14,40 лв.                    \";}i:13;a:2:{s:5:\"title\";s:35:\"Мишка Lenovo Y Gaming Mouse WW\";s:5:\"price\";s:57:\"\n                        61,20 лв.                    \";}i:14;a:2:{s:5:\"title\";s:23:\"LOGITECH WL M220 SILENT\";s:5:\"price\";s:57:\"\n                        40,80 лв.                    \";}i:15;a:2:{s:5:\"title\";s:28:\"LOGITECH WL M330 SILENT PLUS\";s:5:\"price\";s:57:\"\n                        81,60 лв.                    \";}i:16;a:2:{s:5:\"title\";s:27:\"LOGITECH WL MX MASTER STONE\";s:5:\"price\";s:58:\"\n                        195,60 лв.                    \";}i:17;a:2:{s:5:\"title\";s:28:\"MSI INTERCEPTOR DS B1 GAMING\";s:5:\"price\";s:57:\"\n                        31,44 лв.                    \";}i:18;a:2:{s:5:\"title\";s:28:\"A4 ZL50 BLOODY LASER SVR/BLK\";s:5:\"price\";s:57:\"\n                        61,20 лв.                    \";}i:19;a:2:{s:5:\"title\";s:27:\"ASUS CERBERUS ARCTIC GAMING\";s:5:\"price\";s:57:\"\n                        39,60 лв.                    \";}}}', '2019-10-07 19:52:33', NULL, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_ProjectDetailsFields`
--

CREATE TABLE `WCT_ProjectDetailsFields` (
  `id` int(11) NOT NULL,
  `slug` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xquery` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_ProjectDetailsFields`
--

INSERT INTO `WCT_ProjectDetailsFields` (`id`, `slug`, `title`, `xquery`, `projectId`, `typeId`) VALUES
(1, 'title', 'title', NULL, 1, 1),
(2, 'price', 'price', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_ProjectListingFields`
--

CREATE TABLE `WCT_ProjectListingFields` (
  `id` int(11) NOT NULL,
  `slug` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xquery` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_ProjectListingFields`
--

INSERT INTO `WCT_ProjectListingFields` (`id`, `slug`, `title`, `xquery`, `projectId`, `typeId`) VALUES
(1, 'title', 'title', '//*[@id=\"root-wrapper\"]/div/div/div[2]/div[2]/div[3]/div/div[2]/ul/li/h2/a', 2, 1),
(2, 'price', 'price', '//*[@id=\"root-wrapper\"]/div/div/div[2]/div[2]/div[3]/div/div[2]/ul/li/div[2]/span[2]/span[2]', 2, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Projects`
--

CREATE TABLE `WCT_Projects` (
  `id` int(11) NOT NULL,
  `parseCountMax` int(11) NOT NULL DEFAULT '100',
  `parseMode` enum('css','xpath') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsPage` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsLink` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagerLink` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nopic` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pictureCropTop` tinyint(1) DEFAULT NULL,
  `pictureCropRight` tinyint(1) DEFAULT NULL,
  `pictureCropBottom` tinyint(1) DEFAULT NULL,
  `pictureCropLeft` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_Projects`
--

INSERT INTO `WCT_Projects` (`id`, `parseCountMax`, `parseMode`, `url`, `detailsPage`, `categoryId`, `userId`, `title`, `detailsLink`, `pagerLink`, `nopic`, `pictureCropTop`, `pictureCropRight`, `pictureCropBottom`, `pictureCropLeft`) VALUES
(1, 100, 'css', 'https://www.technopolis.bg/bg//Mobilni-telefoni-i-Tableti/Mobilni-telefoni/c/P11040101', NULL, NULL, NULL, 'Test Project', '/html/body/main/div[3]/div/div/div/div[2]/ul/li/figure/figcaption/h3/a', '/html/body/main/div[3]/div/div/div/div[3]/ul/li/a', NULL, NULL, NULL, NULL, NULL),
(2, 100, 'xpath', 'https://most.bg/aksesoari/mishki.html', 'https://most.bg/aksesoari/mishki/genius-traveler-600.html', NULL, NULL, 'Test Project 2', '//*[@id=\"root-wrapper\"]/div/div/div[2]/div[2]/div[3]/div/div[2]/ul/li/h2/a', '//*[@id=\"root-wrapper\"]/div/div/div[2]/div[2]/div[3]/div/div[2]/div/div[2]/div/ol/li', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Projects_Processors`
--

CREATE TABLE `WCT_Projects_Processors` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Projects_Processors_Mappings`
--

CREATE TABLE `WCT_Projects_Processors_Mappings` (
  `id` int(11) NOT NULL,
  `projectFieldAlias` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapProcessorField` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectProcessorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `IAPM_Packages`
--
ALTER TABLE `IAPM_Packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAPM_Packages_Plans`
--
ALTER TABLE `IAPM_Packages_Plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FF096BFCF55D173E` (`packageId`),
  ADD KEY `IDX_FF096BFC4C95116F` (`planId`);

--
-- Indexes for table `IAPM_Plans`
--
ALTER TABLE `IAPM_Plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAPM_UsersSubscriptions`
--
ALTER TABLE `IAPM_UsersSubscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_94F499E764B64DCC` (`userId`),
  ADD UNIQUE KEY `UNIQ_94F499E74C95116F` (`planId`),
  ADD UNIQUE KEY `UNIQ_94F499E790F41D36` (`paymentDetailsId`);

--
-- Indexes for table `IAP_AgreementDetails`
--
ALTER TABLE `IAP_AgreementDetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_81074D2B4C95116F` (`planId`);

--
-- Indexes for table `IAP_GatewayConfig`
--
ALTER TABLE `IAP_GatewayConfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAP_PaymentDetails`
--
ALTER TABLE `IAP_PaymentDetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAP_PaymentTokens`
--
ALTER TABLE `IAP_PaymentTokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAUM_UserGroups`
--
ALTER TABLE `IAUM_UserGroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D52F22C85E237E06` (`name`);

--
-- Indexes for table `IAUM_Users`
--
ALTER TABLE `IAUM_Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9E6E7D9192FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_9E6E7D91A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_9E6E7D91C05FB297` (`confirmation_token`),
  ADD UNIQUE KEY `UNIQ_9E6E7D917BA2F5EB` (`api_token`),
  ADD UNIQUE KEY `UNIQ_9E6E7D91CA77D3A9` (`subscriptionId`);

--
-- Indexes for table `IA_Taxonomy_Term`
--
ALTER TABLE `IA_Taxonomy_Term`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F4ABFC989D9B62` (`slug`),
  ADD KEY `IDX_C6F4ABFC727ACA70` (`parent_id`),
  ADD KEY `IDX_C6F4ABFCAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `IA_Taxonomy_Vocabularies`
--
ALTER TABLE `IA_Taxonomy_Vocabularies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E09C2E1F989D9B62` (`slug`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D5428AED92FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_D5428AEDA0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_D5428AEDC05FB297` (`confirmation_token`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8F02BF9D5E237E06` (`name`);

--
-- Indexes for table `WCT_Fieldsets`
--
ALTER TABLE `WCT_Fieldsets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `WCT_Fieldsets_Fields`
--
ALTER TABLE `WCT_Fieldsets_Fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FAAA51A5989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_FAAA51A59BF49490` (`typeId`),
  ADD KEY `IDX_FAAA51A52DDE213` (`fieldsetId`);

--
-- Indexes for table `WCT_Field_Types`
--
ALTER TABLE `WCT_Field_Types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `WCT_ParcedItems`
--
ALTER TABLE `WCT_ParcedItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_12F343446C9360F7` (`projectId`);

--
-- Indexes for table `WCT_ProjectDetailsFields`
--
ALTER TABLE `WCT_ProjectDetailsFields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C17CD8139BF49490` (`typeId`),
  ADD KEY `IDX_C17CD8136C9360F7` (`projectId`);

--
-- Indexes for table `WCT_ProjectListingFields`
--
ALTER TABLE `WCT_ProjectListingFields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C17CD8136C9360F7` (`projectId`);

--
-- Indexes for table `WCT_Projects`
--
ALTER TABLE `WCT_Projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_UNIQUE` (`url`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `WCT_Projects_Processors`
--
ALTER TABLE `WCT_Projects_Processors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_82E8FE4D6C9360F7` (`projectId`);

--
-- Indexes for table `WCT_Projects_Processors_Mappings`
--
ALTER TABLE `WCT_Projects_Processors_Mappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6797DBA4F2C8D75E` (`projectProcessorId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `IAPM_Packages`
--
ALTER TABLE `IAPM_Packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAPM_Packages_Plans`
--
ALTER TABLE `IAPM_Packages_Plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAPM_Plans`
--
ALTER TABLE `IAPM_Plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAPM_UsersSubscriptions`
--
ALTER TABLE `IAPM_UsersSubscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAP_AgreementDetails`
--
ALTER TABLE `IAP_AgreementDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `IAP_GatewayConfig`
--
ALTER TABLE `IAP_GatewayConfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAP_PaymentDetails`
--
ALTER TABLE `IAP_PaymentDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAP_PaymentTokens`
--
ALTER TABLE `IAP_PaymentTokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `IAUM_UserGroups`
--
ALTER TABLE `IAUM_UserGroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAUM_Users`
--
ALTER TABLE `IAUM_Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IA_Taxonomy_Term`
--
ALTER TABLE `IA_Taxonomy_Term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IA_Taxonomy_Vocabularies`
--
ALTER TABLE `IA_Taxonomy_Vocabularies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_Fieldsets`
--
ALTER TABLE `WCT_Fieldsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `WCT_Fieldsets_Fields`
--
ALTER TABLE `WCT_Fieldsets_Fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WCT_ParcedItems`
--
ALTER TABLE `WCT_ParcedItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WCT_ProjectDetailsFields`
--
ALTER TABLE `WCT_ProjectDetailsFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WCT_ProjectListingFields`
--
ALTER TABLE `WCT_ProjectListingFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WCT_Projects`
--
ALTER TABLE `WCT_Projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WCT_Projects_Processors`
--
ALTER TABLE `WCT_Projects_Processors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_Projects_Processors_Mappings`
--
ALTER TABLE `WCT_Projects_Processors_Mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `IAPM_Packages_Plans`
--
ALTER TABLE `IAPM_Packages_Plans`
  ADD CONSTRAINT `FK_FF096BFC4C95116F` FOREIGN KEY (`planId`) REFERENCES `IAPM_Plans` (`id`),
  ADD CONSTRAINT `FK_FF096BFCF55D173E` FOREIGN KEY (`packageId`) REFERENCES `IAPM_Packages` (`id`);

--
-- Ограничения за таблица `IAPM_UsersSubscriptions`
--
ALTER TABLE `IAPM_UsersSubscriptions`
  ADD CONSTRAINT `FK_94F499E74C95116F` FOREIGN KEY (`planId`) REFERENCES `IAPM_Packages_Plans` (`id`),
  ADD CONSTRAINT `FK_94F499E764B64DCC` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `FK_94F499E790F41D36` FOREIGN KEY (`paymentDetailsId`) REFERENCES `IAP_PaymentDetails` (`id`);

--
-- Ограничения за таблица `IAP_AgreementDetails`
--
ALTER TABLE `IAP_AgreementDetails`
  ADD CONSTRAINT `FK_81074D2B4C95116F` FOREIGN KEY (`planId`) REFERENCES `IAPM_Packages_Plans` (`id`),
  ADD CONSTRAINT `FK_81074D2B64B64DCC` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`);

--
-- Ограничения за таблица `IAUM_Users`
--
ALTER TABLE `IAUM_Users`
  ADD CONSTRAINT `FK_9E6E7D91CA77D3A9` FOREIGN KEY (`subscriptionId`) REFERENCES `IAPM_UsersSubscriptions` (`id`);

--
-- Ограничения за таблица `IA_Taxonomy_Term`
--
ALTER TABLE `IA_Taxonomy_Term`
  ADD CONSTRAINT `FK_C6F4ABFC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `IA_Taxonomy_Term` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C6F4ABFCAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `IA_Taxonomy_Vocabularies` (`id`);

--
-- Ограничения за таблица `WCT_Fieldsets_Fields`
--
ALTER TABLE `WCT_Fieldsets_Fields`
  ADD CONSTRAINT `FK_FAAA51A52DDE213` FOREIGN KEY (`fieldsetId`) REFERENCES `WCT_Fieldsets` (`id`),
  ADD CONSTRAINT `FK_FAAA51A59BF49490` FOREIGN KEY (`typeId`) REFERENCES `WCT_Field_Types` (`id`);

--
-- Ограничения за таблица `WCT_ParcedItems`
--
ALTER TABLE `WCT_ParcedItems`
  ADD CONSTRAINT `FK_12F343446C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`);

--
-- Ограничения за таблица `WCT_ProjectDetailsFields`
--
ALTER TABLE `WCT_ProjectDetailsFields`
  ADD CONSTRAINT `FK_C17CD8136C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`),
  ADD CONSTRAINT `FK_C17CD8139BF49490` FOREIGN KEY (`typeId`) REFERENCES `WCT_Field_Types` (`id`);

--
-- Ограничения за таблица `WCT_Projects_Processors`
--
ALTER TABLE `WCT_Projects_Processors`
  ADD CONSTRAINT `FK_82E8FE4D6C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`);

--
-- Ограничения за таблица `WCT_Projects_Processors_Mappings`
--
ALTER TABLE `WCT_Projects_Processors_Mappings`
  ADD CONSTRAINT `FK_6797DBA4F2C8D75E` FOREIGN KEY (`projectProcessorId`) REFERENCES `WCT_Projects_Processors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
