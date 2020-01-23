-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 23 яну 2020 в 16:31
-- Версия на сървъра: 5.7.29
-- PHP Version: 7.2.26

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
-- Структура на таблица `IAP_Agreements`
--

CREATE TABLE `IAP_Agreements` (
  `id` int(11) NOT NULL,
  `details` json NOT NULL,
  `paymentMethod` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packagePlanId` int(11) NOT NULL,
  `type` enum('agreement','payment') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_GatewayConfig`
--

CREATE TABLE `IAP_GatewayConfig` (
  `id` int(11) NOT NULL,
  `gateway_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` json NOT NULL COMMENT '(DC2Type:json_array)',
  `useSandbox` tinyint(1) NOT NULL,
  `sandboxConfig` json NOT NULL COMMENT '(DC2Type:json_array)',
  `currency` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAP_GatewayConfig`
--

INSERT INTO `IAP_GatewayConfig` (`id`, `gateway_name`, `factory_name`, `config`, `useSandbox`, `sandboxConfig`, `currency`) VALUES
(13, 'paypal_express_checkout_gateway', 'paypal_express_checkout', '{\"sandbox\": false, \"password\": \"TR5QB2XTSX6WLQU2\", \"username\": \"sb-5omhg442982_api1.business.example.com\", \"signature\": \"AQbpL6L3kklGXOsBTDOVNveW4eb0A5Vl4cT2ufCBKvenYrkodSTAF2Fi\"}', 1, '{\"sandbox\": true, \"password\": \"TR5QB2XTSX6WLQU2\", \"username\": \"sb-5omhg442982_api1.business.example.com\", \"signature\": \"AQbpL6L3kklGXOsBTDOVNveW4eb0A5Vl4cT2ufCBKvenYrkodSTAF2Fi\"}', 'EUR'),
(14, 'paypal_pro_checkout_gateway', 'paypal_pro_checkout', '{\"tender\": \"C\", \"vendor\": \"EDIT ME\", \"partner\": \"EDIT ME\", \"sandbox\": false, \"password\": \"8PRXKLWZFPYBZDKB\", \"username\": \"sb-ks1wh402232_api1.business.example.com\"}', 1, '{\"tender\": \"C\", \"vendor\": \"EDIT ME\", \"partner\": \"EDIT ME\", \"sandbox\": true, \"password\": \"8PRXKLWZFPYBZDKB\", \"username\": \"sb-ks1wh402232_api1.business.example.com\"}', 'USD'),
(15, 'stripe_checkout_gateway', 'stripe_checkout', '{\"secret_key\": \"sk_test_QHNIIAE1D7L5oqy54cxM4pXD00GO1NH64K\", \"publishable_key\": \"pk_test_4usJseX4BL8ZuSa9efnggWj800U21erI5Y\"}', 1, '{\"factory\": null}', 'USD');

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_PaymentDetails`
--

CREATE TABLE `IAP_PaymentDetails` (
  `id` int(11) NOT NULL,
  `details` json NOT NULL,
  `paymentMethod` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packagePlanId` int(11) NOT NULL,
  `type` enum('agreement','payment') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAP_PaymentDetails`
--

INSERT INTO `IAP_PaymentDetails` (`id`, `details`, `paymentMethod`, `packagePlanId`, `type`) VALUES
(1, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-6MB39394VA9607442\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/_Ol_DdAUOKjaSmf6kxGjdtbw-_AR417xk_7IaHP4YM4?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/bxj4F0iJQ_4923gIl4kDsraN0aKOT3KRxzb1SIGvero\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/_Ol_DdAUOKjaSmf6kxGjdtbw-_AR417xk_7IaHP4YM4\", \"TIMESTAMP\": \"2019-11-06T03:04:50Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"a8397a6759145\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/bxj4F0iJQ_4923gIl4kDsraN0aKOT3KRxzb1SIGvero\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(2, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-6MB39394VA9607442\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-1DP6R7UY5X1P\", \"TIMESTAMP\": \"2019-11-06T03:04:54Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"f4f93a26cc304\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(3, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-01S58118AE493953H\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/oD5us0ASn6qZLjTPAW_2Cz2-qiDcKbLiZMMg9MN6VLw?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/SZSld0fUmXlKeTbX1Mdox2RzxSYr0KCiwYgIS0Io9d4\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/oD5us0ASn6qZLjTPAW_2Cz2-qiDcKbLiZMMg9MN6VLw\", \"TIMESTAMP\": \"2019-11-06T03:13:22Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"c145bdc174889\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/SZSld0fUmXlKeTbX1Mdox2RzxSYr0KCiwYgIS0Io9d4\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(4, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-01S58118AE493953H\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-D3EVW34AC8BH\", \"TIMESTAMP\": \"2019-11-06T03:13:25Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"c306010a5fc1a\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(5, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-98S30320XK2334317\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/zti3UqI66df23AiJIX8BNskZispDFCzjhXLIbw4onj4?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/h10eRl9z7WmPbjHZEeWY0K9gPgG0QDr4HDrIkLsTTmw\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/zti3UqI66df23AiJIX8BNskZispDFCzjhXLIbw4onj4\", \"TIMESTAMP\": \"2019-11-06T03:14:51Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"6c88570daaa4b\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/h10eRl9z7WmPbjHZEeWY0K9gPgG0QDr4HDrIkLsTTmw\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(6, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-98S30320XK2334317\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-774WHUSM1H4D\", \"TIMESTAMP\": \"2019-11-06T03:17:02Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"6611eb377f76\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(7, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7T3388725D276784D\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/aNv2okmvnftH8MHy3pSLV9rT0eTp0KqHtj08eWv8gxc?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/C8EPRQ7QU7hOE5yxS4YqGPDP-lE2ISZol7rdY-YMbfQ\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/aNv2okmvnftH8MHy3pSLV9rT0eTp0KqHtj08eWv8gxc\", \"TIMESTAMP\": \"2019-11-06T03:51:16Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"78deff28d365f\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/C8EPRQ7QU7hOE5yxS4YqGPDP-lE2ISZol7rdY-YMbfQ\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(8, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7T3388725D276784D\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-KTA9CNTM98H4\", \"TIMESTAMP\": \"2019-11-06T03:51:45Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"98a31cc3d9f42\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(9, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-08074207U9812483K\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/Bmj9SynlHq3MB6LguAC1g6UbVIviWdiRBY-QiAmZsUM?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/NzEqwAys4_YKej9mztWcQI-XVRxMRm_nSIWjrNx0BEM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/Bmj9SynlHq3MB6LguAC1g6UbVIviWdiRBY-QiAmZsUM\", \"TIMESTAMP\": \"2019-11-06T04:09:04Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"26eaad52851d8\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/NzEqwAys4_YKej9mztWcQI-XVRxMRm_nSIWjrNx0BEM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(10, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-08074207U9812483K\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-FE6E81BYD08E\", \"TIMESTAMP\": \"2019-11-06T04:09:08Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"c2213b063798b\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(11, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7RW79394M4374140T\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/IW28Pp6eylT-CPw33Asu-Otn-kI5YDuwWF6HUdnAltM?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/jeINkKJCk7aVJAxI_wdOmgZlvova5txUwNPkD_wsCEs\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/IW28Pp6eylT-CPw33Asu-Otn-kI5YDuwWF6HUdnAltM\", \"TIMESTAMP\": \"2019-11-06T04:10:59Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"b33ff748a4bbf\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/jeINkKJCk7aVJAxI_wdOmgZlvova5txUwNPkD_wsCEs\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(12, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7RW79394M4374140T\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-SS0CD60FY9MC\", \"TIMESTAMP\": \"2019-11-06T04:13:47Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"9caabd957d38e\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment');

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_PaymentMethods`
--

CREATE TABLE `IAP_PaymentMethods` (
  `id` int(4) NOT NULL,
  `gatewayId` int(4) NOT NULL,
  `name` varchar(64) NOT NULL,
  `route` varchar(128) NOT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `IAP_PaymentMethods`
--

INSERT INTO `IAP_PaymentMethods` (`id`, `gatewayId`, `name`, `route`, `active`) VALUES
(2, 13, 'paypal_express_checkout_recurring_payment', 'ia_payment_paypal_express_checkout_prepare_recurring_payment_agreement', 1),
(3, 13, 'paypal_express_checkout_NOT_recurring_payment', 'ia_payment_paypal_express_checkout_prepare', 1),
(4, 14, 'paypal_pro_checkout', 'ia_payment_paypal_prepare', 1),
(5, 15, 'stripe_checkout', 'ia_payment_stripe_checkout_prepare', 1);

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_Payments`
--

CREATE TABLE `IAP_Payments` (
  `id` int(11) NOT NULL,
  `paymentMethod` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packagePlanId` int(11) NOT NULL,
  `number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_email` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `currency_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bankAccount` int(10) DEFAULT NULL,
  `creditCard` int(10) DEFAULT NULL,
  `details` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_Tokens`
--

CREATE TABLE `IAP_Tokens` (
  `hash` varchar(255) NOT NULL,
  `details` longtext COMMENT '(DC2Type:object)',
  `after_url` longtext,
  `target_url` longtext NOT NULL,
  `gateway_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `IAP_Tokens`
--

INSERT INTO `IAP_Tokens` (`hash`, `details`, `after_url`, `target_url`, `gateway_name`) VALUES
('-dpfAKajITvOEZpIm68gwwN4biRiCbTjkahJEwcXwjA', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:27;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/done?payum_token=-dpfAKajITvOEZpIm68gwwN4biRiCbTjkahJEwcXwjA', 'paypal_express_checkout_recurring_payment'),
('-gtvrsY2QwXWknlP4TxcwTJWXuBLefrOMHJH4UERzLY', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:32;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/-gtvrsY2QwXWknlP4TxcwTJWXuBLefrOMHJH4UERzLY', 'paypal_express_checkout_recurring_payment'),
('-jhv2t297T0PYRfwWrrdBulh2T2U9sQCcClLYrnFWLs', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:8;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=6UHiTfne3DBRzQpYsxwpmQKDo3boy2IiRMSLdrqmASA', 'http://wct2.lh/payment/payment/capture/-jhv2t297T0PYRfwWrrdBulh2T2U9sQCcClLYrnFWLs', 'paypal_express_checkout_recurring_payment'),
('-y1kZUDS2XQ-iEW-YSgYY5Q2laYi_utiYcvDOjf7puo', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:11;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=pOng0x_NEL6tS9GmAg0rh4Uu1FbBWhmq37VAoBXYvqo', 'http://wct2.lh/payment/payment/capture/-y1kZUDS2XQ-iEW-YSgYY5Q2laYi_utiYcvDOjf7puo', 'stripe_checkout_gateway'),
('0dVGtW-_z3RHXPu9ykJutOO5fUhORZohfDa3u1ColBc', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:28;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/0dVGtW-_z3RHXPu9ykJutOO5fUhORZohfDa3u1ColBc', 'paypal_express_checkout_recurring_payment'),
('1HwckEIeemev4XZRgQkar0GOVbL_CJ47naGam4DzYDA', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:3;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/1HwckEIeemev4XZRgQkar0GOVbL_CJ47naGam4DzYDA', 'paypal_express_checkout_recurring_payment'),
('1Mjnc9P9_qNUqjfXaM3ypsc3_b2f5CxYXrhF7x0LmEk', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:2;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=1Mjnc9P9_qNUqjfXaM3ypsc3_b2f5CxYXrhF7x0LmEk', 'stripe_checkout_gateway'),
('27tsdB3mi-bYWJ6cnjM0MT6xVuRndo_ShxsBpQrNiM4', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=27tsdB3mi-bYWJ6cnjM0MT6xVuRndo_ShxsBpQrNiM4', 'paypal_express_checkout_recurring_payment'),
('37mqJDoCtwOtmBVvkiU9uVuvSp-K2ZG03vvkd9UNaP8', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:13;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=37mqJDoCtwOtmBVvkiU9uVuvSp-K2ZG03vvkd9UNaP8', 'paypal_express_checkout_recurring_payment'),
('3vkbwh3OThyotIb0QSEzq-kTJQGebvwRk1oVFK3f_KQ', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:54;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/3vkbwh3OThyotIb0QSEzq-kTJQGebvwRk1oVFK3f_KQ', 'paypal_express_checkout_recurring_payment'),
('3_nnO5LwKDB8y5Ac1TD7txM7p93UL5maNtDfSHiWH5c', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:21;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/3_nnO5LwKDB8y5Ac1TD7txM7p93UL5maNtDfSHiWH5c', 'paypal_express_checkout_recurring_payment'),
('4DErNzHlX2BYa5xNRbjYrui9EUdicpM6B7svHgfmIsw', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:7;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=WEJvPdLI4ToDoktFiNxR3rhQPy5EtRRnbVEyykreHe8', 'http://wct2.lh/payment/payment/capture/4DErNzHlX2BYa5xNRbjYrui9EUdicpM6B7svHgfmIsw', 'stripe_checkout_gateway'),
('4IAd5zfWVnVNVH4JNsQypLmsdFHZnGr5DiRLaRHJ7NI', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:13;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=37mqJDoCtwOtmBVvkiU9uVuvSp-K2ZG03vvkd9UNaP8', 'http://wct2.lh/payment/payment/capture/4IAd5zfWVnVNVH4JNsQypLmsdFHZnGr5DiRLaRHJ7NI', 'paypal_express_checkout_recurring_payment'),
('5k0TIKuczlN7hWX__L5U4BqPdKtPWS2ncZf-x0emQjM', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:47;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create/1?payum_token=8BHnOTbDh_DbAN5sDq5W-JDY5q01NfcZQHijrPn2wgc', 'http://wct2.lh/payment/payment/capture/5k0TIKuczlN7hWX__L5U4BqPdKtPWS2ncZf-x0emQjM', 'paypal_express_checkout_gateway'),
('5WFBDOB4Rddxiy_-uxUygdYFTHJ-qPQGpL7e6CkEY5A', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:52;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/5WFBDOB4Rddxiy_-uxUygdYFTHJ-qPQGpL7e6CkEY5A', 'paypal_express_checkout_recurring_payment'),
('6UHiTfne3DBRzQpYsxwpmQKDo3boy2IiRMSLdrqmASA', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:8;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=6UHiTfne3DBRzQpYsxwpmQKDo3boy2IiRMSLdrqmASA', 'paypal_express_checkout_recurring_payment'),
('6YvXxIouv6Md4mhvwI9qyVNELIg3agWT_fQutFjv8iM', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:42;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/6YvXxIouv6Md4mhvwI9qyVNELIg3agWT_fQutFjv8iM', 'paypal_express_checkout_recurring_payment'),
('8BHnOTbDh_DbAN5sDq5W-JDY5q01NfcZQHijrPn2wgc', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:47;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create/1?payum_token=8BHnOTbDh_DbAN5sDq5W-JDY5q01NfcZQHijrPn2wgc', 'paypal_express_checkout_gateway'),
('8y0GDMP1RRN5jkKn4fVTbof_DFbcIRf4F6TunaY_mGc', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:10;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/8y0GDMP1RRN5jkKn4fVTbof_DFbcIRf4F6TunaY_mGc', 'paypal_express_checkout_recurring_payment'),
('94to9Jbom7cQ2cDFigXso5NL-cAOq0l4E00hVj3x9-g', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:12;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=HNybyddLHp1bQWD_yyYETv23hw8d6iqhayRRKn_8NmM', 'http://wct2.lh/payment/payment/capture/94to9Jbom7cQ2cDFigXso5NL-cAOq0l4E00hVj3x9-g', 'paypal_express_checkout_recurring_payment'),
('96UHq0bglt9L-P691CCQmVmAv3CzUB7LnPmOS6ziNcM', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:57;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/96UHq0bglt9L-P691CCQmVmAv3CzUB7LnPmOS6ziNcM', 'paypal_express_checkout_recurring_payment'),
('9SOrGu0xaSoGEKLdRyOujQ0jMrvsV_xB77B9jklu0CE', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:12;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=SUpjK7LG_HY6R9dyJZFEMqLWNf3nYKgZR095h1den4Q', 'http://wct2.lh/payment/payment/capture/9SOrGu0xaSoGEKLdRyOujQ0jMrvsV_xB77B9jklu0CE', 'stripe_checkout_gateway'),
('A41RXDtpMvki_Spjb19IR5Er8Uk_HAcNoePIXoNv0aE', 'C:25:\"Payum\\Core\\Model\\Identity\":73:{a:2:{i:0;i:5;i:1;s:47:\"IA\\PaymentBundle\\Entity\\RecurringPaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/done?payum_token=A41RXDtpMvki_Spjb19IR5Er8Uk_HAcNoePIXoNv0aE', 'paypal_express_checkout_recurring_payment'),
('a6L6SadEKWTlgH99FQ0WBZHa6aQUEkIgD4XAdEaLvhc', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:23;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/a6L6SadEKWTlgH99FQ0WBZHa6aQUEkIgD4XAdEaLvhc', 'paypal_express_checkout_recurring_payment'),
('AAVJhP7U775uXogXKczPQEfY05tk9X3WdRNXGxglyB4', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:60;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/AAVJhP7U775uXogXKczPQEfY05tk9X3WdRNXGxglyB4', 'paypal_express_checkout_gateway'),
('AcB-CpgWLNTKDQRGqq3rNeUajM3TmuUDPhw-8sTqCUA', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:8;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=AcB-CpgWLNTKDQRGqq3rNeUajM3TmuUDPhw-8sTqCUA', 'stripe_checkout_gateway'),
('aEx2O0Mg5NJw7wwkv3VgKwNZHgEU9lT-jo1LOxxTe_M', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:14;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=K8xIUyAlmECqcP3KcJDcHUoFXRgnPqrC1OwRlcmQtko', 'http://wct2.lh/payment/payment/capture/aEx2O0Mg5NJw7wwkv3VgKwNZHgEU9lT-jo1LOxxTe_M', 'paypal_express_checkout_recurring_payment'),
('AJQUGjG9FagrO7GCwPye5hFBbhd7V5VNEcs2ZtNaapA', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:8;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=AcB-CpgWLNTKDQRGqq3rNeUajM3TmuUDPhw-8sTqCUA', 'http://wct2.lh/payment/payment/capture/AJQUGjG9FagrO7GCwPye5hFBbhd7V5VNEcs2ZtNaapA', 'stripe_checkout_gateway'),
('bTJaMLYuMc3x5PkBh9kABjF5a9IQJEKNfGdoPhhx1f0', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:25;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/done?payum_token=bTJaMLYuMc3x5PkBh9kABjF5a9IQJEKNfGdoPhhx1f0', 'paypal_express_checkout_recurring_payment'),
('bu41s1jQkF3_ZuhRI4Z3i08s_2CZJrayPlWQ5nPMqT0', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:61;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/bu41s1jQkF3_ZuhRI4Z3i08s_2CZJrayPlWQ5nPMqT0', 'paypal_express_checkout_gateway'),
('bxj4F0iJQ_4923gIl4kDsraN0aKOT3KRxzb1SIGvero', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:1;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/bxj4F0iJQ_4923gIl4kDsraN0aKOT3KRxzb1SIGvero', 'paypal_express_checkout_recurring_payment'),
('C8EPRQ7QU7hOE5yxS4YqGPDP-lE2ISZol7rdY-YMbfQ', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:7;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/C8EPRQ7QU7hOE5yxS4YqGPDP-lE2ISZol7rdY-YMbfQ', 'paypal_express_checkout_recurring_payment'),
('cPzKyUvKhIN3yRh_tbtJjUi0k1QlFxc7zQuOVHtbLgE', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:6;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/cPzKyUvKhIN3yRh_tbtJjUi0k1QlFxc7zQuOVHtbLgE', 'paypal_express_checkout_recurring_payment'),
('cv_0oiBYynZM2hon_f5Vign2mf1-qJ6G8n-i4s4SmuU', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:8;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/cv_0oiBYynZM2hon_f5Vign2mf1-qJ6G8n-i4s4SmuU', 'paypal_express_checkout_recurring_payment'),
('DkGJnWhsMiYG8onb9ChV8YxjIPRDSYR0OuQ_u2Bjxaw', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:1;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=mWlxWGvLZVyCU4en4VlCnY6b-iXvkcv36Gyy2olD-jw', 'http://wct2.lh/payment/payment/capture/DkGJnWhsMiYG8onb9ChV8YxjIPRDSYR0OuQ_u2Bjxaw', 'stripe_checkout_gateway'),
('dqmethoLWIIQibX3zdMR1EnOWX1i8-ukSsT7FL6Z9dw', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:17;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/dqmethoLWIIQibX3zdMR1EnOWX1i8-ukSsT7FL6Z9dw', 'paypal_express_checkout_recurring_payment'),
('Dqq4f767HOOA_zFqLLCesZVBZ7EbzIB7s8M3UQlvOxk', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:2;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/Dqq4f767HOOA_zFqLLCesZVBZ7EbzIB7s8M3UQlvOxk', 'paypal_express_checkout_recurring_payment'),
('e4cgxV4N7K8NQThtrqMgaIocTJ1r_nB-mQTd5ecFZXA', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:1;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/e4cgxV4N7K8NQThtrqMgaIocTJ1r_nB-mQTd5ecFZXA', 'paypal_express_checkout_recurring_payment'),
('ED45QBqxU8V4roUYpktcGgFwakrWskWkrfdIFGzRyUw', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:9;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=St5KrX03bgp0R7WxuyoH4KPEBtEMZIoArly1i1aEUYg', 'http://wct2.lh/payment/payment/capture/ED45QBqxU8V4roUYpktcGgFwakrWskWkrfdIFGzRyUw', 'stripe_checkout_gateway'),
('fbdpFTS1-hCNxumubqCI4N3Ll28JeQHfUA--qZbqjek', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:10;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=odtliUr7KFobXN248Piaxqouq7hf4kOEK7qcUO5PyBI', 'http://wct2.lh/payment/payment/capture/fbdpFTS1-hCNxumubqCI4N3Ll28JeQHfUA--qZbqjek', 'stripe_checkout_gateway'),
('fISmL0wXxaUTItu9cFU8h2GOa3ncbPw5ODZzKHevBJ4', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:38;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal/done?payum_token=fISmL0wXxaUTItu9cFU8h2GOa3ncbPw5ODZzKHevBJ4', 'paypal_pro_checkout_credit_card'),
('fJNncdsX8tAfQAtEqq-FAQSCrWEgw4zZdLOwFlBGpBM', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:56;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/fJNncdsX8tAfQAtEqq-FAQSCrWEgw4zZdLOwFlBGpBM', 'paypal_express_checkout_recurring_payment'),
('GVHmMSy83hbHv9LhgMSgNUO6C4e6O-0zURazYRid0TM', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:11;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=GVHmMSy83hbHv9LhgMSgNUO6C4e6O-0zURazYRid0TM', 'paypal_express_checkout_recurring_payment'),
('GxGruIyNzol93PHIp4taKcOohDcvu1IsXTkoKy2eAOA', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:30;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/GxGruIyNzol93PHIp4taKcOohDcvu1IsXTkoKy2eAOA', 'paypal_express_checkout_recurring_payment'),
('h10eRl9z7WmPbjHZEeWY0K9gPgG0QDr4HDrIkLsTTmw', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:5;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/h10eRl9z7WmPbjHZEeWY0K9gPgG0QDr4HDrIkLsTTmw', 'paypal_express_checkout_recurring_payment'),
('h5qpLRm_-REbDa46kGFCAgtosi7W0ld0A8UVlOh69as', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:39;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/h5qpLRm_-REbDa46kGFCAgtosi7W0ld0A8UVlOh69as', 'paypal_express_checkout_recurring_payment'),
('hCIvVqsFDefV4A6OZrYRyfiTu7-uUwZoMZgv5gPpqvw', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:51;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/hCIvVqsFDefV4A6OZrYRyfiTu7-uUwZoMZgv5gPpqvw', 'paypal_express_checkout_recurring_payment'),
('HigjLnrXY9MbAmZHMDCnU5t0y3xVkfaaTcY5EAZE26o', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:13;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=LQhg7nWaurlvoV8I9LHSEVEOgVtvVh-XWg9IbuSINEQ', 'http://wct2.lh/payment/payment/capture/HigjLnrXY9MbAmZHMDCnU5t0y3xVkfaaTcY5EAZE26o', 'stripe_checkout_gateway'),
('HNybyddLHp1bQWD_yyYETv23hw8d6iqhayRRKn_8NmM', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:12;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=HNybyddLHp1bQWD_yyYETv23hw8d6iqhayRRKn_8NmM', 'paypal_express_checkout_recurring_payment'),
('hXCZc1WR1d3Qfcl7fcRMB5lkPuPwZDi8L6PFPSlL-aI', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:44;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/hXCZc1WR1d3Qfcl7fcRMB5lkPuPwZDi8L6PFPSlL-aI', 'paypal_express_checkout_recurring_payment'),
('HZELubraPzy0pw-g6tmsYTAK310AmGUYC8aAp0aYwGs', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:5;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=uh6I3-GcrL_SFhQiviaqKvnNo4L7zfT2ptPKd9C4krE', 'http://wct2.lh/payment/payment/capture/HZELubraPzy0pw-g6tmsYTAK310AmGUYC8aAp0aYwGs', 'stripe_checkout_gateway'),
('i6s0c-i3rnSuGcylKoSqYtU5cs5sTsj_CiR19u9JjbE', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:9;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=i6s0c-i3rnSuGcylKoSqYtU5cs5sTsj_CiR19u9JjbE', 'paypal_express_checkout_recurring_payment'),
('imSwXMdogr7Oc6jQ16SxAgYoiKCa7_3CcL2PTCs_ZMQ', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:2;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=1Mjnc9P9_qNUqjfXaM3ypsc3_b2f5CxYXrhF7x0LmEk', 'http://wct2.lh/payment/payment/capture/imSwXMdogr7Oc6jQ16SxAgYoiKCa7_3CcL2PTCs_ZMQ', 'stripe_checkout_gateway'),
('IQ2UbFvFeycR1SEa5KQgvvteiWnGeOmECKKiyWzd7aQ', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:36;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/IQ2UbFvFeycR1SEa5KQgvvteiWnGeOmECKKiyWzd7aQ', 'paypal_express_checkout_recurring_payment'),
('iycWDS_e0kxN2Izz197o258S4mVjc-u1hRl_vAFp3zQ', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:9;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=i6s0c-i3rnSuGcylKoSqYtU5cs5sTsj_CiR19u9JjbE', 'http://wct2.lh/payment/payment/capture/iycWDS_e0kxN2Izz197o258S4mVjc-u1hRl_vAFp3zQ', 'paypal_express_checkout_recurring_payment'),
('jeH4ImSZiL2rhXdQ-URAVt3ujHWyMsPm1JRx151UlkM', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:49;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/jeH4ImSZiL2rhXdQ-URAVt3ujHWyMsPm1JRx151UlkM', 'paypal_express_checkout_recurring_payment'),
('jeINkKJCk7aVJAxI_wdOmgZlvova5txUwNPkD_wsCEs', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:11;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/jeINkKJCk7aVJAxI_wdOmgZlvova5txUwNPkD_wsCEs', 'paypal_express_checkout_recurring_payment'),
('jWlqXgRWxVXjl_FVi4PXyE3ApNFqvyXqybPNOWVLrm8', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:13;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/jWlqXgRWxVXjl_FVi4PXyE3ApNFqvyXqybPNOWVLrm8', 'paypal_express_checkout_recurring_payment'),
('K8xIUyAlmECqcP3KcJDcHUoFXRgnPqrC1OwRlcmQtko', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:14;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=K8xIUyAlmECqcP3KcJDcHUoFXRgnPqrC1OwRlcmQtko', 'paypal_express_checkout_recurring_payment'),
('l9g_ighSDsTSHIKOxPYptdVmAvrLmfT2aEtZR5CG-Vo', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:18;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/l9g_ighSDsTSHIKOxPYptdVmAvrLmfT2aEtZR5CG-Vo', 'paypal_express_checkout_recurring_payment'),
('LctZag0XgFkvEDeiRcA0ysQ_2YNp0RhW1psjnI4sTZI', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:20;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/done?payum_token=LctZag0XgFkvEDeiRcA0ysQ_2YNp0RhW1psjnI4sTZI', 'paypal_express_checkout_recurring_payment'),
('LQhg7nWaurlvoV8I9LHSEVEOgVtvVh-XWg9IbuSINEQ', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:13;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=LQhg7nWaurlvoV8I9LHSEVEOgVtvVh-XWg9IbuSINEQ', 'stripe_checkout_gateway'),
('Mfwjszv4U3SSA-w43wcoBSbtAflfdwWjLPWdPG7Y_GY', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:59;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/Mfwjszv4U3SSA-w43wcoBSbtAflfdwWjLPWdPG7Y_GY', 'paypal_express_checkout_gateway'),
('mWlxWGvLZVyCU4en4VlCnY6b-iXvkcv36Gyy2olD-jw', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:1;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=mWlxWGvLZVyCU4en4VlCnY6b-iXvkcv36Gyy2olD-jw', 'stripe_checkout_gateway'),
('n5Vd4VDbpdCCOQiVQr0uS2LThiRdtJdMACzrdUBdq3o', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:5;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/n5Vd4VDbpdCCOQiVQr0uS2LThiRdtJdMACzrdUBdq3o', 'paypal_express_checkout_recurring_payment'),
('N9TOW2jh3aEjDcPsiMlDk5nNo9giETA0qxaRwNBVaW0', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:22;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/done?payum_token=N9TOW2jh3aEjDcPsiMlDk5nNo9giETA0qxaRwNBVaW0', 'paypal_express_checkout_recurring_payment'),
('nKRdopAL0p-jPkJ6FpijWDUZp119mtqjRDwVg2EYPnc', 'C:25:\"Payum\\Core\\Model\\Identity\":58:{a:2:{i:0;i:19;i:1;s:31:\"IA\\PaymentBundle\\Entity\\Payment\";}}', 'http://wct2.lh/payment/stripe/checkout/done?payum_token=S2V3ZS2bvI2mMlzDws4luoy2hvTkCQ_Kkfi2JpTR5Bg', 'http://wct2.lh/payment/payment/capture/nKRdopAL0p-jPkJ6FpijWDUZp119mtqjRDwVg2EYPnc', 'stripe_checkout_gateway'),
('NzEqwAys4_YKej9mztWcQI-XVRxMRm_nSIWjrNx0BEM', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:9;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/NzEqwAys4_YKej9mztWcQI-XVRxMRm_nSIWjrNx0BEM', 'paypal_express_checkout_recurring_payment'),
('odtliUr7KFobXN248Piaxqouq7hf4kOEK7qcUO5PyBI', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:10;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=odtliUr7KFobXN248Piaxqouq7hf4kOEK7qcUO5PyBI', 'stripe_checkout_gateway'),
('OEhpsaJGFimwv9vqUf8RMRtazPX4DLUoml9Fy5TJ6Kg', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:9;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/OEhpsaJGFimwv9vqUf8RMRtazPX4DLUoml9Fy5TJ6Kg', 'paypal_express_checkout_recurring_payment'),
('OmSEyPeV8bsOgCiUfvQl76wYjFzky1ByiyhBt93UIvY', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:34;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/OmSEyPeV8bsOgCiUfvQl76wYjFzky1ByiyhBt93UIvY', 'paypal_express_checkout_recurring_payment'),
('p6nahsbCHg3gIRtuhVOi_4Iz2qWXMdtT0VlY9gvT_co', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:47;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/p6nahsbCHg3gIRtuhVOi_4Iz2qWXMdtT0VlY9gvT_co', 'paypal_express_checkout_gateway'),
('pE6O_KoCMUo2j7WlYaPs2koDVRY5Q2dJNDHSACZO4yI', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:4;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/pE6O_KoCMUo2j7WlYaPs2koDVRY5Q2dJNDHSACZO4yI', 'paypal_express_checkout_recurring_payment'),
('Pi_ALrKsBnfgo6XNiXzsmG5M62rR6QucCMJSnDNsP74', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:19;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/Pi_ALrKsBnfgo6XNiXzsmG5M62rR6QucCMJSnDNsP74', 'paypal_express_checkout_recurring_payment'),
('pOng0x_NEL6tS9GmAg0rh4Uu1FbBWhmq37VAoBXYvqo', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:11;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=pOng0x_NEL6tS9GmAg0rh4Uu1FbBWhmq37VAoBXYvqo', 'stripe_checkout_gateway'),
('Q1cT91KL-bzfkKd3zXNvIwweuH-Tus6WSnfkRQLzGdA', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:14;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/Q1cT91KL-bzfkKd3zXNvIwweuH-Tus6WSnfkRQLzGdA', 'paypal_express_checkout_recurring_payment'),
('QORvRoUDpmD87KslJCH_j30i5CtSy7P950OWsgNp6TM', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:23;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create/1?payum_token=QORvRoUDpmD87KslJCH_j30i5CtSy7P950OWsgNp6TM', 'paypal_express_checkout_recurring_payment'),
('R6ilOlxHPnkNi7xwC-x1fAdLec4k64zCSYz3E8QzuyM', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:55;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/R6ilOlxHPnkNi7xwC-x1fAdLec4k64zCSYz3E8QzuyM', 'paypal_express_checkout_recurring_payment'),
('RaWKl46utPe5v4SoqzEbOewYlVZYuzWUfvZgs_GMzKM', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:48;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/RaWKl46utPe5v4SoqzEbOewYlVZYuzWUfvZgs_GMzKM', 'paypal_express_checkout_gateway'),
('rNZEmie3kDOD5pmc7JSAWkE6Jlj03mpNDJdvGHZmt3A', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:10;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=wLv1WbJv8E4Qw8ahrVOHF7nB3M39fAEPIEM_VN4mMHA', 'http://wct2.lh/payment/payment/capture/rNZEmie3kDOD5pmc7JSAWkE6Jlj03mpNDJdvGHZmt3A', 'paypal_express_checkout_recurring_payment'),
('RXcjgwfD7pLMyw-WTbtHfk5P34o7kzqDDRU6F2eGnOQ', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=27tsdB3mi-bYWJ6cnjM0MT6xVuRndo_ShxsBpQrNiM4', 'http://wct2.lh/payment/payment/capture/RXcjgwfD7pLMyw-WTbtHfk5P34o7kzqDDRU6F2eGnOQ', 'paypal_express_checkout_recurring_payment'),
('S2V3ZS2bvI2mMlzDws4luoy2hvTkCQ_Kkfi2JpTR5Bg', 'C:25:\"Payum\\Core\\Model\\Identity\":58:{a:2:{i:0;i:19;i:1;s:31:\"IA\\PaymentBundle\\Entity\\Payment\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=S2V3ZS2bvI2mMlzDws4luoy2hvTkCQ_Kkfi2JpTR5Bg', 'stripe_checkout_gateway'),
('Se_2wuESkYLNXJgxiR_GybKctVwo-UIblhg2PaP6-8k', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:46;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/Se_2wuESkYLNXJgxiR_GybKctVwo-UIblhg2PaP6-8k', 'paypal_express_checkout_gateway'),
('spBAFDaQnhlU3KlcGxXX-GE2jgErnD-BJQ_CtAGXzGE', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:58;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/spBAFDaQnhlU3KlcGxXX-GE2jgErnD-BJQ_CtAGXzGE', 'paypal_express_checkout_recurring_payment'),
('St5KrX03bgp0R7WxuyoH4KPEBtEMZIoArly1i1aEUYg', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:9;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=St5KrX03bgp0R7WxuyoH4KPEBtEMZIoArly1i1aEUYg', 'stripe_checkout_gateway'),
('SUpjK7LG_HY6R9dyJZFEMqLWNf3nYKgZR095h1den4Q', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:12;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=SUpjK7LG_HY6R9dyJZFEMqLWNf3nYKgZR095h1den4Q', 'stripe_checkout_gateway'),
('SZSld0fUmXlKeTbX1Mdox2RzxSYr0KCiwYgIS0Io9d4', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:3;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/SZSld0fUmXlKeTbX1Mdox2RzxSYr0KCiwYgIS0Io9d4', 'paypal_express_checkout_recurring_payment'),
('T7Wvr6wrvIQJIYIi_5g0AnfWNYuvPGeN19wVMbsyRFI', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:23;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create/1?payum_token=QORvRoUDpmD87KslJCH_j30i5CtSy7P950OWsgNp6TM', 'http://wct2.lh/payment/payment/capture/T7Wvr6wrvIQJIYIi_5g0AnfWNYuvPGeN19wVMbsyRFI', 'paypal_express_checkout_recurring_payment'),
('tq9Q8PHidB43McWPkp4Mdq1J0fQzquB0Ob-mYd1l53Q', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:38;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', 'http://wct2.lh/payment/paypal/done?payum_token=fISmL0wXxaUTItu9cFU8h2GOa3ncbPw5ODZzKHevBJ4', 'http://wct2.lh/payment/payment/capture/tq9Q8PHidB43McWPkp4Mdq1J0fQzquB0Ob-mYd1l53Q', 'paypal_pro_checkout_credit_card'),
('uAk1N_cLs7hlIUH0dr45T2DTOPI96C4EjeWLOFoc2CI', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:53;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/uAk1N_cLs7hlIUH0dr45T2DTOPI96C4EjeWLOFoc2CI', 'paypal_express_checkout_recurring_payment'),
('uh6I3-GcrL_SFhQiviaqKvnNo4L7zfT2ptPKd9C4krE', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:5;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=uh6I3-GcrL_SFhQiviaqKvnNo4L7zfT2ptPKd9C4krE', 'stripe_checkout_gateway'),
('uwMvMXJ4NoENR-tc18ESrjjOeFvoRxyiSod0qtmxX3o', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:4;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=uwMvMXJ4NoENR-tc18ESrjjOeFvoRxyiSod0qtmxX3o', 'stripe_checkout_gateway'),
('v4c5trlZXKVw3-3hMWaj9aIaFIPd_nydIw4LOAI9oRs', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:11;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=GVHmMSy83hbHv9LhgMSgNUO6C4e6O-0zURazYRid0TM', 'http://wct2.lh/payment/payment/capture/v4c5trlZXKVw3-3hMWaj9aIaFIPd_nydIw4LOAI9oRs', 'paypal_express_checkout_recurring_payment'),
('wEgurgOpGC0s4KxCa6xsHEeo_fKPCQyDleef0xIU_7M', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:26;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/wEgurgOpGC0s4KxCa6xsHEeo_fKPCQyDleef0xIU_7M', 'paypal_express_checkout_recurring_payment'),
('WEJvPdLI4ToDoktFiNxR3rhQPy5EtRRnbVEyykreHe8', 'C:25:\"Payum\\Core\\Model\\Identity\":64:{a:2:{i:0;i:7;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=WEJvPdLI4ToDoktFiNxR3rhQPy5EtRRnbVEyykreHe8', 'stripe_checkout_gateway'),
('wLv1WbJv8E4Qw8ahrVOHF7nB3M39fAEPIEM_VN4mMHA', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:10;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/paypal_express_checkout/recurring_payment/create?payum_token=wLv1WbJv8E4Qw8ahrVOHF7nB3M39fAEPIEM_VN4mMHA', 'paypal_express_checkout_recurring_payment'),
('yfMM5j8gQ_59UolxlCPfeUQ4JVIbgpepdllb_3tHbDM', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:41;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/yfMM5j8gQ_59UolxlCPfeUQ4JVIbgpepdllb_3tHbDM', 'paypal_express_checkout_recurring_payment'),
('yj5POeIj-qBECHM4CqPP0YqzmMY0e3h1PB91SAHA3kk', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:11;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/yj5POeIj-qBECHM4CqPP0YqzmMY0e3h1PB91SAHA3kk', 'paypal_express_checkout_recurring_payment'),
('Z37fqULGu6jFnzq3kPGgqp74CZzMg1cKCiz5ePQBKlI', 'C:25:\"Payum\\Core\\Model\\Identity\":65:{a:2:{i:0;i:24;i:1;s:38:\"IA\\PaymentBundle\\Entity\\PaymentDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/Z37fqULGu6jFnzq3kPGgqp74CZzMg1cKCiz5ePQBKlI', 'paypal_express_checkout_recurring_payment'),
('Z55kmnrqv3sBdYLXZP4vs8nWsR28C-rMFF6HoH5fBwE', 'C:25:\"Payum\\Core\\Model\\Identity\":66:{a:2:{i:0;i:7;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/Z55kmnrqv3sBdYLXZP4vs8nWsR28C-rMFF6HoH5fBwE', 'paypal_express_checkout_recurring_payment'),
('ZcWRIRj2X43p5k04KG3p85z4StW2xvbC82HFc6PWWNc', 'C:25:\"Payum\\Core\\Model\\Identity\":62:{a:2:{i:0;i:3;i:1;s:36:\"IA\\PaymentBundle\\Entity\\PaymentModel\";}}', NULL, 'http://wct2.lh/payment/stripe/checkout/done?payum_token=ZcWRIRj2X43p5k04KG3p85z4StW2xvbC82HFc6PWWNc', 'stripe_checkout_gateway'),
('zZEx9ZdDUxRq72B5YBv-11zq5cwqXahN4gK2XucguWE', 'C:25:\"Payum\\Core\\Model\\Identity\":60:{a:2:{i:0;i:50;i:1;s:33:\"IA\\PaymentBundle\\Entity\\Agreement\";}}', NULL, 'http://wct2.lh/payment/payment/notify/zZEx9ZdDUxRq72B5YBv-11zq5cwqXahN4gK2XucguWE', 'paypal_express_checkout_recurring_payment'),
('_aEL7jKlZNn9XYoR0eW7yi1gvmvPXwsfukVlo27T6AM', 'C:25:\"Payum\\Core\\Model\\Identity\":67:{a:2:{i:0;i:12;i:1;s:40:\"IA\\PaymentBundle\\Entity\\AgreementDetails\";}}', NULL, 'http://wct2.lh/payment/payment/notify/_aEL7jKlZNn9XYoR0eW7yi1gvmvPXwsfukVlo27T6AM', 'paypal_express_checkout_recurring_payment');

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_Packages`
--

CREATE TABLE `IAUM_Packages` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAUM_Packages`
--

INSERT INTO `IAUM_Packages` (`id`, `title`) VALUES
(1, 'Test Package with Monthly Plan');

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_Packages_Plans`
--

CREATE TABLE `IAUM_Packages_Plans` (
  `id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `currency` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EUR',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAUM_Packages_Plans`
--

INSERT INTO `IAUM_Packages_Plans` (`id`, `price`, `currency`, `description`, `packageId`, `planId`) VALUES
(1, '100.00', 'EUR', 'Test Package with Monthly Plan', 1, 1),
(2, '115.99', 'USD', 'Test Package with Monthly Plan', 1, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_Plans`
--

CREATE TABLE `IAUM_Plans` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAUM_Plans`
--

INSERT INTO `IAUM_Plans` (`id`, `title`, `subscription_period`) VALUES
(1, 'Monthly recuring plan', 'Month');

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
  `subscriptionId` int(11) DEFAULT NULL,
  `user_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `IAUM_Users`
--

INSERT INTO `IAUM_Users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `subscriptionId`, `user_info_id`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 1, 'ZEAYhdMkJnNRZ0t5JO0Ol5AecbXAwj3ennB0CrmBIBY', '$argon2i$v=19$m=65536,t=4,p=1$MWFNejhXMzFwVFdpVElGMg$qq6lIt3kFlHxPq6plag34jEwsfMvglffqYH9UkKL26Q', '2020-01-23 10:49:17', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', NULL, 4),
(2, 'admin2', 'admin2', 'admin2', 'admin2', 1, '.oHKGUigY1G7Z0zMWuYTGC4DZ2Mc9fQNZ2jBLvkTTn0', '$argon2i$v=19$m=65536,t=4,p=1$MWFNejhXMzFwVFdpVElGMg$qq6lIt3kFlHxPq6plag34jEwsfMvglffqYH9UkKL26Q', NULL, NULL, NULL, 'a:0:{}', NULL, NULL),
(3, 'admin', 'admin', 'admin', 'admin', 1, 'rID/Lqp8tiUKWL9s7pAPzal3y00yLvBzx0UC88V8.Zk', '$argon2i$v=19$m=65536,t=4,p=1$NkdQVUMuNXYzZGNxL2U1Nw$lMSM2JxwjZNuo53LCGeuEVh0izOxrwUGIb2D5h9a/64', NULL, NULL, NULL, 'a:0:{}', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_UsersActivities`
--

CREATE TABLE `IAUM_UsersActivities` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAUM_UsersActivities`
--

INSERT INTO `IAUM_UsersActivities` (`id`, `date`, `userId`, `activity`) VALUES
(1, '2019-11-04 00:00:00', 1, 'Test Activity'),
(2, '2019-11-05 20:13:17', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(3, '2019-11-06 04:30:04', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(4, '2019-11-06 05:04:54', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(5, '2019-11-06 05:13:26', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(6, '2019-11-06 05:17:53', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(7, '2019-11-06 06:00:12', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(8, '2019-11-06 07:49:02', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(9, '2019-11-06 07:49:45', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(10, '2019-11-06 19:27:31', 1, 'User cancel recurring payment for \"paypal_express_checkout_recurring_payment\".'),
(11, '2019-11-13 11:13:37', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"');

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_UsersInfo`
--

CREATE TABLE `IAUM_UsersInfo` (
  `id` int(11) NOT NULL,
  `apiToken` varchar(255) DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `occupation` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `IAUM_UsersInfo`
--

INSERT INTO `IAUM_UsersInfo` (`id`, `apiToken`, `firstName`, `lastName`, `country`, `birthday`, `mobile`, `website`, `occupation`) VALUES
(4, NULL, 'Ivan', 'Atanasov', 'BG', '1977-08-09 00:00:00', '449999999999', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_UsersNotifications`
--

CREATE TABLE `IAUM_UsersNotifications` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `notification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAUM_UsersNotifications`
--

INSERT INTO `IAUM_UsersNotifications` (`id`, `date`, `userId`, `notification`) VALUES
(1, '2019-11-04 00:00:00', 1, 'Test Notification');

-- --------------------------------------------------------

--
-- Структура на таблица `IAUM_UsersSubscriptions`
--

CREATE TABLE `IAUM_UsersSubscriptions` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `paymentDetailsId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `IA_Cms_Pages`
--

CREATE TABLE `IA_Cms_Pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('20190511152715', '2019-10-19 03:48:11'),
('20190511154104', '2019-10-19 03:48:12'),
('20191014085910', '2019-10-19 03:48:12');

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
(1, 'Simple'),
(2, 'Simple');

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Fieldsets_Fields`
--

CREATE TABLE `WCT_Fieldsets_Fields` (
  `id` int(11) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `fieldsetId` int(11) DEFAULT NULL,
  `type` enum('text','picture','link') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_Fieldsets_Fields`
--

INSERT INTO `WCT_Fieldsets_Fields` (`id`, `slug`, `title`, `typeId`, `fieldsetId`, `type`) VALUES
(1, 'title', 'Title', NULL, 1, 'text'),
(2, 'price', 'Price', NULL, 1, 'text'),
(3, 'title-1', 'Title', NULL, 2, 'text'),
(4, 'price-1', 'Price', NULL, 2, 'text');

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Field_Types`
--

CREATE TABLE `WCT_Field_Types` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_ProjectFields`
--

CREATE TABLE `WCT_ProjectFields` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xquery` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `type` enum('text','picture','link') COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` enum('listing','details') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `WCT_ProjectFields`
--

INSERT INTO `WCT_ProjectFields` (`id`, `title`, `xquery`, `projectId`, `type`, `page`) VALUES
(3, 'Price', '//*[@id=\"price-including-tax-13\"]', 1, 'text', 'listing'),
(6, 'Title', '//*[@id=\"root-wrapper\"]/div/div/div[2]/div[2]/div[3]/div/div[2]/ul/li/h2/a', 1, 'text', 'listing');

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

-- --------------------------------------------------------

--
-- Структура на таблица `WCT_Projects`
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

--
-- Схема на данните от таблица `WCT_Projects`
--

INSERT INTO `WCT_Projects` (`id`, `parseMode`, `parseCountMax`, `url`, `detailsPage`, `categoryId`, `userId`, `title`, `detailsLink`, `pagerLink`, `nopic`, `pictureCropTop`, `pictureCropRight`, `pictureCropBottom`, `pictureCropLeft`) VALUES
(1, 'xpath', 100, 'https://most.bg/aksesoari/mishki.html', NULL, NULL, NULL, 'Test Project', '//*[@id=\"root-wrapper\"]/div/div/div[2]/div[2]/div[3]/div/div[2]/ul/li/h2/a', '//*[@id=\"root-wrapper\"]/div/div/div[2]/div[2]/div[3]/div/div[2]/div/div[2]/div/ol/li', NULL, NULL, NULL, NULL, NULL);

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
-- Indexes for table `IAP_Agreements`
--
ALTER TABLE `IAP_Agreements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packagePlanId` (`packagePlanId`);

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
-- Indexes for table `IAP_PaymentMethods`
--
ALTER TABLE `IAP_PaymentMethods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gatewayId` (`gatewayId`);

--
-- Indexes for table `IAP_Payments`
--
ALTER TABLE `IAP_Payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packagePlanId` (`packagePlanId`);

--
-- Indexes for table `IAP_Tokens`
--
ALTER TABLE `IAP_Tokens`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `IAUM_Packages`
--
ALTER TABLE `IAUM_Packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAUM_Packages_Plans`
--
ALTER TABLE `IAUM_Packages_Plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FF096BFCF55D173E` (`packageId`),
  ADD KEY `IDX_FF096BFC4C95116F` (`planId`);

--
-- Indexes for table `IAUM_Plans`
--
ALTER TABLE `IAUM_Plans`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAUM_UsersActivities`
--
ALTER TABLE `IAUM_UsersActivities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAUM_UsersInfo`
--
ALTER TABLE `IAUM_UsersInfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9E6E7D917BA2F5EB` (`apiToken`);

--
-- Indexes for table `IAUM_UsersNotifications`
--
ALTER TABLE `IAUM_UsersNotifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IAUM_UsersSubscriptions`
--
ALTER TABLE `IAUM_UsersSubscriptions`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `WCT_ProjectFields`
--
ALTER TABLE `WCT_ProjectFields`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `IAP_Agreements`
--
ALTER TABLE `IAP_Agreements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAP_GatewayConfig`
--
ALTER TABLE `IAP_GatewayConfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `IAP_PaymentDetails`
--
ALTER TABLE `IAP_PaymentDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `IAP_PaymentMethods`
--
ALTER TABLE `IAP_PaymentMethods`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `IAP_Payments`
--
ALTER TABLE `IAP_Payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAUM_Packages`
--
ALTER TABLE `IAUM_Packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAUM_Packages_Plans`
--
ALTER TABLE `IAUM_Packages_Plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `IAUM_Plans`
--
ALTER TABLE `IAUM_Plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAUM_UserGroups`
--
ALTER TABLE `IAUM_UserGroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IAUM_Users`
--
ALTER TABLE `IAUM_Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `IAUM_UsersActivities`
--
ALTER TABLE `IAUM_UsersActivities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `IAUM_UsersInfo`
--
ALTER TABLE `IAUM_UsersInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `IAUM_UsersNotifications`
--
ALTER TABLE `IAUM_UsersNotifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAUM_UsersSubscriptions`
--
ALTER TABLE `IAUM_UsersSubscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WCT_Fieldsets_Fields`
--
ALTER TABLE `WCT_Fieldsets_Fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `WCT_ProjectFields`
--
ALTER TABLE `WCT_ProjectFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `WCT_ProjectListingFields`
--
ALTER TABLE `WCT_ProjectListingFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WCT_Projects`
--
ALTER TABLE `WCT_Projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Ограничения за таблица `WCT_ProjectListingFields`
--
ALTER TABLE `WCT_ProjectListingFields`
  ADD CONSTRAINT `FK_A77DA6706C9360F7` FOREIGN KEY (`projectId`) REFERENCES `WCT_Projects` (`id`),
  ADD CONSTRAINT `FK_A77DA6709BF49490` FOREIGN KEY (`typeId`) REFERENCES `WCT_Field_Types` (`id`);

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
