-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 26 Ð¾ÐºÑ‚ 2019 Ð² 15:48
-- Ð’ÐµÑ€Ñ�Ð¸Ñ� Ð½Ð° Ñ�ÑŠÑ€Ð²ÑŠÑ€Ð°: 5.7.28
-- PHP Version: 7.2.24

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
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_Packages`
--

CREATE TABLE `IAPM_Packages` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_Packages`
--

INSERT INTO `IAPM_Packages` (`id`, `title`) VALUES
(1, 'Test Package with Monthly Plan');

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_Packages_Plans`
--

CREATE TABLE `IAPM_Packages_Plans` (
  `id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_Packages_Plans`
--

INSERT INTO `IAPM_Packages_Plans` (`id`, `price`, `description`, `packageId`, `planId`) VALUES
(1, '100.00', 'Test Package with Monthly Plan', 1, 1);

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_Plans`
--

CREATE TABLE `IAPM_Plans` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_Plans`
--

INSERT INTO `IAPM_Plans` (`id`, `title`, `subscription_period`) VALUES
(1, 'Monthly recuring plan', 'Month');

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_UsersSubscriptions`
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
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAP_AgreementDetails`
--

CREATE TABLE `IAP_AgreementDetails` (
  `id` int(11) NOT NULL,
  `details` json NOT NULL COMMENT '(DC2Type:json_array)',
  `number` varchar(64) NOT NULL,
  `currencyCode` varchar(64) NOT NULL,
  `totalAmount` varchar(64) NOT NULL,
  `description` varchar(64) NOT NULL,
  `clientId` varchar(64) NOT NULL,
  `clientEmail` varchar(64) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAP_AgreementDetails`
--

INSERT INTO `IAP_AgreementDetails` (`id`, `details`, `number`, `currencyCode`, `totalAmount`, `description`, `clientId`, `clientEmail`, `userId`, `planId`) VALUES
(1, '{\"ACK\": \"Success\", \"AMT\": \"123.00\", \"BUILD\": \"53734851\", \"TOKEN\": \"EC-31N103107G897064W\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/9PSCFoo1sivveY5WjkRDW1yvEN5h7lYY8LYb-FnNQ5M?cancelled=1\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/xXdNQNmAP9lHCajbl0zOgxlvLEdPoN6Ga_9iW8fcjxI\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/9PSCFoo1sivveY5WjkRDW1yvEN5h7lYY8LYb-FnNQ5M\", \"TIMESTAMP\": \"2019-10-26T12:47:42Z\", \"HANDLINGAMT\": \"0.00\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"CORRELATIONID\": \"ebbf6d2422e7b\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"PAYMENTREQUEST_0_AMT\": \"123.00\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/xXdNQNmAP9lHCajbl0zOgxlvLEdPoN6Ga_9iW8fcjxI\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"0\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', '5db440686137d', 'EUR', '123', 'A description', 'anId', 'sb-wsp2g401218@personal.example.com', 1, 1);

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAP_GatewayConfig`
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
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAP_PaymentDetails`
--

CREATE TABLE `IAP_PaymentDetails` (
  `id` int(11) NOT NULL,
  `details` blob NOT NULL COMMENT '(DC2Type:json_array)',
  `paymentMethod` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAP_PaymentDetails`
--

INSERT INTO `IAP_PaymentDetails` (`id`, `details`, `paymentMethod`) VALUES
(1, 0x7b22616d6f756e74223a3130302c2263757272656e6379223a22555344222c226465736372697074696f6e223a2261206465736372697074696f6e227d, 'stripe'),
(2, 0x7b22616d6f756e74223a3130302c2263757272656e6379223a22757364222c226465736372697074696f6e223a2261206465736372697074696f6e222c2263617264223a22746f6b5f314657523444436f7a524f6a7a326a58424a5242394e5444222c226964223a2263685f31465752344a436f7a524f6a7a326a5838544c776f4e6858222c226f626a656374223a22636861726765222c22616d6f756e745f726566756e646564223a302c226170706c69636174696f6e223a6e756c6c2c226170706c69636174696f6e5f666565223a6e756c6c2c226170706c69636174696f6e5f6665655f616d6f756e74223a6e756c6c2c2262616c616e63655f7472616e73616374696f6e223a2274786e5f31465752344a436f7a524f6a7a326a586148687072796177222c2262696c6c696e675f64657461696c73223a7b2261646472657373223a7b2263697479223a6e756c6c2c22636f756e747279223a6e756c6c2c226c696e6531223a6e756c6c2c226c696e6532223a6e756c6c2c22706f7374616c5f636f6465223a6e756c6c2c227374617465223a6e756c6c7d2c22656d61696c223a6e756c6c2c226e616d65223a22692e6174616e61736f76373740676d61696c2e636f6d222c2270686f6e65223a6e756c6c7d2c226361707475726564223a747275652c2263726561746564223a313537313736343937312c22637573746f6d6572223a6e756c6c2c2264657374696e6174696f6e223a6e756c6c2c2264697370757465223a6e756c6c2c226661696c7572655f636f6465223a6e756c6c2c226661696c7572655f6d657373616765223a6e756c6c2c2266726175645f64657461696c73223a5b5d2c22696e766f696365223a6e756c6c2c226c6976656d6f6465223a66616c73652c226d65746164617461223a5b5d2c226f6e5f626568616c665f6f66223a6e756c6c2c226f72646572223a6e756c6c2c226f7574636f6d65223a7b226e6574776f726b5f737461747573223a22617070726f7665645f62795f6e6574776f726b222c22726561736f6e223a6e756c6c2c227269736b5f6c6576656c223a226e6f726d616c222c227269736b5f73636f7265223a35372c2273656c6c65725f6d657373616765223a225061796d656e7420636f6d706c6574652e222c2274797065223a22617574686f72697a6564227d2c2270616964223a747275652c227061796d656e745f696e74656e74223a6e756c6c2c227061796d656e745f6d6574686f64223a22636172645f314657523443436f7a524f6a7a326a584249583337716858222c227061796d656e745f6d6574686f645f64657461696c73223a7b2263617264223a7b226272616e64223a2276697361222c22636865636b73223a7b22616464726573735f6c696e65315f636865636b223a6e756c6c2c22616464726573735f706f7374616c5f636f64655f636865636b223a6e756c6c2c226376635f636865636b223a2270617373227d2c22636f756e747279223a225553222c226578705f6d6f6e7468223a31322c226578705f79656172223a323031392c2266696e6765727072696e74223a224736333256653958703072576649775a222c2266756e64696e67223a22637265646974222c22696e7374616c6c6d656e7473223a6e756c6c2c226c61737434223a2234323432222c226e6574776f726b223a2276697361222c2274687265655f645f736563757265223a6e756c6c2c2277616c6c6574223a6e756c6c7d2c2274797065223a2263617264227d2c22726563656970745f656d61696c223a6e756c6c2c22726563656970745f6e756d626572223a6e756c6c2c22726563656970745f75726c223a2268747470733a5c2f5c2f7061792e7374726970652e636f6d5c2f72656365697074735c2f616363745f314657446c45436f7a524f6a7a326a585c2f63685f31465752344a436f7a524f6a7a326a5838544c776f4e68585c2f726370745f473257363275565a674f6e76435741776272524b4975654b74515749657868222c22726566756e646564223a66616c73652c22726566756e6473223a7b226f626a656374223a226c697374222c2264617461223a5b5d2c226861735f6d6f7265223a66616c73652c22746f74616c5f636f756e74223a302c2275726c223a225c2f76315c2f636861726765735c2f63685f31465752344a436f7a524f6a7a326a5838544c776f4e68585c2f726566756e6473227d2c22726576696577223a6e756c6c2c227368697070696e67223a6e756c6c2c22736f75726365223a7b226964223a22636172645f314657523443436f7a524f6a7a326a584249583337716858222c226f626a656374223a2263617264222c22616464726573735f63697479223a6e756c6c2c22616464726573735f636f756e747279223a6e756c6c2c22616464726573735f6c696e6531223a6e756c6c2c22616464726573735f6c696e65315f636865636b223a6e756c6c2c22616464726573735f6c696e6532223a6e756c6c2c22616464726573735f7374617465223a6e756c6c2c22616464726573735f7a6970223a6e756c6c2c22616464726573735f7a69705f636865636b223a6e756c6c2c226272616e64223a2256697361222c22636f756e747279223a225553222c22637573746f6d6572223a6e756c6c2c226376635f636865636b223a2270617373222c2264796e616d69635f6c61737434223a6e756c6c2c226578705f6d6f6e7468223a31322c226578705f79656172223a323031392c2266696e6765727072696e74223a224736333256653958703072576649775a222c2266756e64696e67223a22637265646974222c226c61737434223a2234323432222c226d65746164617461223a5b5d2c226e616d65223a22692e6174616e61736f76373740676d61696c2e636f6d222c22746f6b656e697a6174696f6e5f6d6574686f64223a6e756c6c7d2c22736f757263655f7472616e73666572223a6e756c6c2c2273746174656d656e745f64657363726970746f72223a6e756c6c2c2273746174656d656e745f64657363726970746f725f737566666978223a6e756c6c2c22737461747573223a22737563636565646564222c227472616e736665725f64617461223a6e756c6c2c227472616e736665725f67726f7570223a6e756c6c7d, 'stripe');

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAP_PaymentTokens`
--

CREATE TABLE `IAP_PaymentTokens` (
  `hash` varchar(255) NOT NULL,
  `details` longtext COMMENT '(DC2Type:object)',
  `after_url` longtext,
  `target_url` longtext NOT NULL,
  `gateway_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAP_PaymentTokens`
--

INSERT INTO `IAP_PaymentTokens` (`hash`, `details`, `after_url`, `target_url`, `gateway_name`) VALUES
('0CvM8Ca6BXM4mSu5mzzt3u_rYX9lTjcbwV1CxJVX_Oc', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=0CvM8Ca6BXM4mSu5mzzt3u_rYX9lTjcbwV1CxJVX_Oc', 'paypal_express_checkout_recurring_payment'),
('1uo1HHVLliS0aI92ZTtFtZAIlgjNs6TS5QuLkNpdk68', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:4;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=1uo1HHVLliS0aI92ZTtFtZAIlgjNs6TS5QuLkNpdk68', 'offline'),
('6ApvyFhSLJjt8L6zRbXYQj1cSkpCYTVh6wt8e2B12SI', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:2;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/6ApvyFhSLJjt8L6zRbXYQj1cSkpCYTVh6wt8e2B12SI', 'paypal_express_checkout_recurring_payment'),
('9g6I_cLuD1MqETuWz_7xp9_Ktk1aK1kJ3Ixhma5nKoM', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:2;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=9g6I_cLuD1MqETuWz_7xp9_Ktk1aK1kJ3Ixhma5nKoM', 'stripe_checkout_gateway'),
('9hSC2BmUj9kFOFCu1BfQ25oEmEs_A4qSd7JQK7L9fpg', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:8;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=9hSC2BmUj9kFOFCu1BfQ25oEmEs_A4qSd7JQK7L9fpg', 'paypal_express_checkout_recurring_payment'),
('9PSCFoo1sivveY5WjkRDW1yvEN5h7lYY8LYb-FnNQ5M', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:1;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=ki65n5cPEiKQ0krgAt98Zjkq99knevbbRocoHyf1A2g', 'http://wct2.lh/payment/payment/capture/9PSCFoo1sivveY5WjkRDW1yvEN5h7lYY8LYb-FnNQ5M', 'paypal_express_checkout_recurring_payment'),
('a2iyQke0EipEeOepT8aZkvekJhm8vWBrzMAenOpJjt4', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:1;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/a2iyQke0EipEeOepT8aZkvekJhm8vWBrzMAenOpJjt4', 'paypal_express_checkout_recurring_payment'),
('aDLR5ak9WJeKbBgIebmh4a454s3yQwV4d0cMEPUvmI4', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:5;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=aDLR5ak9WJeKbBgIebmh4a454s3yQwV4d0cMEPUvmI4', 'offline'),
('djXrgA72cBHnWT_zl24BSKW8Nta-OsipZsYQuuYe1h4', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:2;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/djXrgA72cBHnWT_zl24BSKW8Nta-OsipZsYQuuYe1h4', 'paypal_express_checkout_recurring_payment'),
('ESmEqwLNAKv0rH1lQFZ1gMse1LHRIXgQWTScj2k_II0', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:2;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=ESmEqwLNAKv0rH1lQFZ1gMse1LHRIXgQWTScj2k_II0', 'paypal_express_checkout_recurring_payment'),
('gJkxFVMoB-_cCC7bns5F8pN6Jq1LJdtLdPIJazvZpFQ', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:5;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=qkgKeAToGAP4aN3Z_FeKR1P-7YgIVsM4iIEpvCLuUxY', 'http://wct2.lh/payment/payment/capture/gJkxFVMoB-_cCC7bns5F8pN6Jq1LJdtLdPIJazvZpFQ', 'paypal_express_checkout_recurring_payment'),
('hcp1eFbv2cw2BBK261hk1jdgrSx1pTy5vBTtKraJ4b4', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:4;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=ktmO58Iy8tBT-2plgH3Q1oxJxZYfKzz7EK6_aPI8KWI', 'http://wct2.lh/payment/payment/capture/hcp1eFbv2cw2BBK261hk1jdgrSx1pTy5vBTtKraJ4b4', 'paypal_express_checkout_recurring_payment'),
('I9WjscARtpLft68YZkXBZAZoipAYy7TUWgLzqudbn2I', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:8;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/I9WjscARtpLft68YZkXBZAZoipAYy7TUWgLzqudbn2I', 'paypal_express_checkout_recurring_payment'),
('ILsnBJkiMukzDm0srn4nDPhtA8Irh-FAFDJWY_IikfA', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:6;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/ILsnBJkiMukzDm0srn4nDPhtA8Irh-FAFDJWY_IikfA', 'paypal_express_checkout_recurring_payment'),
('IZY6BZzjJKt6GgwuVokH_mMCq0sf7DgA2EAuxJXJxWY', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/IZY6BZzjJKt6GgwuVokH_mMCq0sf7DgA2EAuxJXJxWY', 'paypal_express_checkout_recurring_payment'),
('j0tMTCGAf1aC35sljA0adDyl45o-NPHZ1pyG9fOcBmE', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:3;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/j0tMTCGAf1aC35sljA0adDyl45o-NPHZ1pyG9fOcBmE', 'paypal_express_checkout_recurring_payment'),
('ki65n5cPEiKQ0krgAt98Zjkq99knevbbRocoHyf1A2g', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:1;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=ki65n5cPEiKQ0krgAt98Zjkq99knevbbRocoHyf1A2g', 'paypal_express_checkout_recurring_payment'),
('kSJA9TTED3D0soFu7xUj09PKf91It26he7nIkJna8NI', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:6;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=W1JlCgdjn2UEXBrIWOhfQvNtZYTbZVd-E789fX0lB5k', 'http://wct2.lh/payment/payment/capture/kSJA9TTED3D0soFu7xUj09PKf91It26he7nIkJna8NI', 'paypal_express_checkout_recurring_payment'),
('ktmO58Iy8tBT-2plgH3Q1oxJxZYfKzz7EK6_aPI8KWI', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:4;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=ktmO58Iy8tBT-2plgH3Q1oxJxZYfKzz7EK6_aPI8KWI', 'paypal_express_checkout_recurring_payment'),
('Ljv7OZpOIBX9y9REHQZhXDqiLCwsCo7wVyB_pqOrqvs', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:3;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=Ljv7OZpOIBX9y9REHQZhXDqiLCwsCo7wVyB_pqOrqvs', 'paypal_express_checkout_recurring_payment'),
('n0HdSRi43YlnugPrCY3TU6mJ5cXyxte9nBWwzgmRpVw', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:3;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=n0HdSRi43YlnugPrCY3TU6mJ5cXyxte9nBWwzgmRpVw', 'paypal_express_checkout_recurring_payment'),
('nm40Gn1dmA9Si12L15wNK9XO9uXgIEbOaPjQA-LsfbQ', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:9;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=nm40Gn1dmA9Si12L15wNK9XO9uXgIEbOaPjQA-LsfbQ', 'paypal_express_checkout_recurring_payment'),
('OdXVvIxCsUX0WwKcfAApZs_POdrfLTrP9lRPD-aTfpA', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:9;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/OdXVvIxCsUX0WwKcfAApZs_POdrfLTrP9lRPD-aTfpA', 'paypal_express_checkout_recurring_payment'),
('pi7WuqUgONnLHh3W-CJAXX1hy3KhTwMMr_kt5eHWaYM', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=pi7WuqUgONnLHh3W-CJAXX1hy3KhTwMMr_kt5eHWaYM', 'paypal_express_checkout_recurring_payment'),
('q6wWDW30sAebrJpFfdbRyX7B0LrDfREnG_F-31Eazgs', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:6;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=q6wWDW30sAebrJpFfdbRyX7B0LrDfREnG_F-31Eazgs', 'paypal_express_checkout_recurring_payment'),
('qkgKeAToGAP4aN3Z_FeKR1P-7YgIVsM4iIEpvCLuUxY', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:5;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=qkgKeAToGAP4aN3Z_FeKR1P-7YgIVsM4iIEpvCLuUxY', 'paypal_express_checkout_recurring_payment'),
('RWbAQH5S02Xj5rHJZ9SAN9oGbzH2Ft55hOGjWL60FCw', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=pi7WuqUgONnLHh3W-CJAXX1hy3KhTwMMr_kt5eHWaYM', 'http://wct2.lh/payment/payment/capture/RWbAQH5S02Xj5rHJZ9SAN9oGbzH2Ft55hOGjWL60FCw', 'paypal_express_checkout_recurring_payment'),
('SNHt6k12nNYSlHgkjU3EESqPtH0wC6Lq_-udgNFpEns', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:1;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=SNHt6k12nNYSlHgkjU3EESqPtH0wC6Lq_-udgNFpEns', 'stripe_checkout_gateway'),
('TadmyYNvDucBiWCBHfTnebpTdL9n667sS7g_wKYZMAY', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:2;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=TadmyYNvDucBiWCBHfTnebpTdL9n667sS7g_wKYZMAY', 'paypal_express_checkout_recurring_payment'),
('UpbMxHm9BInoSiEfa1HduLS3fhCM3KlKNsPUo1ZQh7Q', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:8;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/UpbMxHm9BInoSiEfa1HduLS3fhCM3KlKNsPUo1ZQh7Q', 'paypal_express_checkout_recurring_payment'),
('v1aafAebdQA9XhdVGShetynSDpMFf89zCnT30z_uziE', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:8;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=v1aafAebdQA9XhdVGShetynSDpMFf89zCnT30z_uziE', 'paypal_express_checkout_recurring_payment'),
('VlMH4ccZlPes9CQSFfimzvTVPA1mgrSrG5cnd9_IY-c', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:1;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=VlMH4ccZlPes9CQSFfimzvTVPA1mgrSrG5cnd9_IY-c', 'paypal_express_checkout_recurring_payment'),
('W1JlCgdjn2UEXBrIWOhfQvNtZYTbZVd-E789fX0lB5k', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:6;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=W1JlCgdjn2UEXBrIWOhfQvNtZYTbZVd-E789fX0lB5k', 'paypal_express_checkout_recurring_payment'),
('WBkFmfxtjeK7z-Za0DCchhLubojtgxVuLn5dOX9KiNA', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:11;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=WBkFmfxtjeK7z-Za0DCchhLubojtgxVuLn5dOX9KiNA', 'paypal_express_checkout_recurring_payment'),
('xex24r1D44XiUGrfq2-it3DYwczTQD-zE5J3LTGQlTI', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:11;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/xex24r1D44XiUGrfq2-it3DYwczTQD-zE5J3LTGQlTI', 'paypal_express_checkout_recurring_payment'),
('XsRjHmO9GdU1pRi6Hvc0gxl5zMML7hvYk0yFD6U5dK8', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:1;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=SNHt6k12nNYSlHgkjU3EESqPtH0wC6Lq_-udgNFpEns', 'http://wct2.lh/payment/payment/capture/XsRjHmO9GdU1pRi6Hvc0gxl5zMML7hvYk0yFD6U5dK8', 'stripe_checkout_gateway'),
('xXdNQNmAP9lHCajbl0zOgxlvLEdPoN6Ga_9iW8fcjxI', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:1;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/xXdNQNmAP9lHCajbl0zOgxlvLEdPoN6Ga_9iW8fcjxI', 'paypal_express_checkout_recurring_payment'),
('XyFIQ-FasNvrU73eJxAZDx6z9sKma6p60UEqrG3RxqQ', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=0CvM8Ca6BXM4mSu5mzzt3u_rYX9lTjcbwV1CxJVX_Oc', 'http://wct2.lh/payment/payment/capture/XyFIQ-FasNvrU73eJxAZDx6z9sKma6p60UEqrG3RxqQ', 'paypal_express_checkout_recurring_payment'),
('y1BywAGHv_PviO2aFO8zsjdaw3Qcdvy570JiUQ0LvPk', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:6;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=q6wWDW30sAebrJpFfdbRyX7B0LrDfREnG_F-31Eazgs', 'http://wct2.lh/payment/payment/capture/y1BywAGHv_PviO2aFO8zsjdaw3Qcdvy570JiUQ0LvPk', 'paypal_express_checkout_recurring_payment'),
('ymRZl0VsA2EEzK5d32MyNbqPIBXtaSgWr-uWNiT5-Gk', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:3;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create_recurring_payment?payum_token=Ljv7OZpOIBX9y9REHQZhXDqiLCwsCo7wVyB_pqOrqvs', 'http://wct2.lh/payment/payment/capture/ymRZl0VsA2EEzK5d32MyNbqPIBXtaSgWr-uWNiT5-Gk', 'paypal_express_checkout_recurring_payment');

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAUM_UserGroups`
--

CREATE TABLE `IAUM_UserGroups` (
  `id` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAUM_Users`
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
  `subscriptionId` int(11) DEFAULT NULL,
  `user_info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAUM_Users`
--

INSERT INTO `IAUM_Users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `subscriptionId`, `user_info_id`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 1, 'ZEAYhdMkJnNRZ0t5JO0Ol5AecbXAwj3ennB0CrmBIBY', '$argon2i$v=19$m=65536,t=4,p=1$dVF6WGgwMzRzYmJrSGp4Nw$mFlPQGSNh1tr4KjI+Eavt3da46vsQwfcRFaveHVplfM', '2019-10-26 15:46:55', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', NULL, 1);

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAUM_UsersInfo`
--

CREATE TABLE `IAUM_UsersInfo` (
  `id` int(11) NOT NULL,
  `apiToken` varchar(255) DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `occupation` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAUM_UsersInfo`
--

INSERT INTO `IAUM_UsersInfo` (`id`, `apiToken`, `firstName`, `lastName`, `country`, `birthday`, `mobile`, `website`, `occupation`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IA_Cms_Pages`
--

CREATE TABLE `IA_Cms_Pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IA_Taxonomy_Term`
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
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IA_Taxonomy_Vocabularies`
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
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Ð¡Ñ…ÐµÐ¼Ð° Ð½Ð° Ð´Ð°Ð½Ð½Ð¸Ñ‚Ðµ Ð¾Ñ‚ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190511152715', '2019-10-19 03:48:11'),
('20190511154104', '2019-10-19 03:48:12'),
('20191014085910', '2019-10-19 03:48:12');

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Fieldsets`
--

CREATE TABLE `WCT_Fieldsets` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Fieldsets_Fields`
--

CREATE TABLE `WCT_Fieldsets_Fields` (
  `id` int(11) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `fieldsetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Field_Types`
--

CREATE TABLE `WCT_Field_Types` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_ParcedItems`
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

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_ProjectDetailsFields`
--

CREATE TABLE `WCT_ProjectDetailsFields` (
  `id` int(11) NOT NULL,
  `slug` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xquery` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_ProjectListingFields`
--

CREATE TABLE `WCT_ProjectListingFields` (
  `id` int(11) NOT NULL,
  `slug` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xquery` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Projects`
--

CREATE TABLE `WCT_Projects` (
  `id` int(11) NOT NULL,
  `parseMode` enum('css','xpath') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xpath',
  `parseCountMax` int(11) NOT NULL DEFAULT '100',
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

-- --------------------------------------------------------

--
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Projects_Processors`
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
-- Ð¡Ñ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€Ð° Ð½Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Projects_Processors_Mappings`
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
-- Indexes for table `IAP_AgreementDetails`
--
ALTER TABLE `IAP_AgreementDetails`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `IAUM_UserGroups`
--
ALTER TABLE `IAUM_UserGroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D52F22C85E237E06` (`name`); 

--
-- Indexes for table `IAUM_UsersInfo`
--
ALTER TABLE `IAUM_UsersInfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9E6E7D917BA2F5EB` (`apiToken`);

--
-- Indexes for table `IA_Cms_Pages`
--
ALTER TABLE `IA_Cms_Pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_22F897B4989D9B62` (`slug`);

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
  ADD UNIQUE KEY `UNIQ_A77DA6709BF49490` (`typeId`),
  ADD KEY `IDX_A77DA6706C9360F7` (`projectId`);

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
-- AUTO_INCREMENT for table `IAP_AgreementDetails`
--
ALTER TABLE `IAP_AgreementDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAP_GatewayConfig`
--
ALTER TABLE `IAP_GatewayConfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAP_PaymentDetails`
--
ALTER TABLE `IAP_PaymentDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `IAUM_UserGroups`
--
ALTER TABLE `IAUM_UserGroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAUM_UsersInfo`
--
ALTER TABLE `IAUM_UsersInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IA_Cms_Pages`
--
ALTER TABLE `IA_Cms_Pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `WCT_Fieldsets`
--
ALTER TABLE `WCT_Fieldsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_Fieldsets_Fields`
--
ALTER TABLE `WCT_Fieldsets_Fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_ParcedItems`
--
ALTER TABLE `WCT_ParcedItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_ProjectDetailsFields`
--
ALTER TABLE `WCT_ProjectDetailsFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_ProjectListingFields`
--
ALTER TABLE `WCT_ProjectListingFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_Projects`
--
ALTER TABLE `WCT_Projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ð´ÑŠÐ¼Ð¿Ð½Ð°Ñ‚Ð¸ Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð¸
--

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IAPM_Packages_Plans`
--
ALTER TABLE `IAPM_Packages_Plans`
  ADD CONSTRAINT `FK_FF096BFC4C95116F` FOREIGN KEY (`planId`) REFERENCES `IAPM_Plans` (`id`),
  ADD CONSTRAINT `FK_FF096BFCF55D173E` FOREIGN KEY (`packageId`) REFERENCES `IAPM_Packages` (`id`);

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `IA_Taxonomy_Term`
--
ALTER TABLE `IA_Taxonomy_Term`
  ADD CONSTRAINT `FK_C6F4ABFC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `IA_Taxonomy_Term` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C6F4ABFCAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `IA_Taxonomy_Vocabularies` (`id`);

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Fieldsets_Fields`
--
ALTER TABLE `WCT_Fieldsets_Fields`
  ADD CONSTRAINT `FK_FAAA51A52DDE213` FOREIGN KEY (`fieldsetId`) REFERENCES `WCT_Fieldsets` (`id`),
  ADD CONSTRAINT `FK_FAAA51A59BF49490` FOREIGN KEY (`typeId`) REFERENCES `WCT_Field_Types` (`id`);

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_ParcedItems`
--
ALTER TABLE `WCT_ParcedItems`
  ADD CONSTRAINT `FK_12F343446C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`);

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_ProjectDetailsFields`
--
ALTER TABLE `WCT_ProjectDetailsFields`
  ADD CONSTRAINT `FK_C17CD8136C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`),
  ADD CONSTRAINT `FK_C17CD8139BF49490` FOREIGN KEY (`typeId`) REFERENCES `WCT_Field_Types` (`id`);

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_ProjectListingFields`
--
ALTER TABLE `WCT_ProjectListingFields`
  ADD CONSTRAINT `FK_A77DA6706C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`),
  ADD CONSTRAINT `FK_A77DA6709BF49490` FOREIGN KEY (`typeId`) REFERENCES `WCT_Field_Types` (`id`);

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Projects_Processors`
--
ALTER TABLE `WCT_Projects_Processors`
  ADD CONSTRAINT `FK_82E8FE4D6C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`);

--
-- ÐžÐ³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ñ� Ð·Ð° Ñ‚Ð°Ð±Ð»Ð¸Ñ†Ð° `WCT_Projects_Processors_Mappings`
--
ALTER TABLE `WCT_Projects_Processors_Mappings`
  ADD CONSTRAINT `FK_6797DBA4F2C8D75E` FOREIGN KEY (`projectProcessorId`) REFERENCES `WCT_Projects_Processors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
