-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 12 ное 2019 в 07:58
-- Версия на сървъра: 5.7.28
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
-- Структура на таблица `IAP_Agreements`
--

CREATE TABLE `IAP_Agreements` (
  `id` int(11) NOT NULL,
  `details` json NOT NULL,
  `paymentMethod` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packagePlanId` int(11) NOT NULL,
  `type` enum('agreement','payment') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAP_Agreements`
--

INSERT INTO `IAP_Agreements` (`id`, `details`, `paymentMethod`, `packagePlanId`, `type`) VALUES
(5, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-0BU87886MA3107322\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"100.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/1D5FRU0ZV9aVa0TKm2dRMJTx4xIeL6OGSxt3BWGBBHU?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/GFXSftVstJFKBsWBTDBKI4fBJMj6Bbh9sCsf4-A0-JU\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/1D5FRU0ZV9aVa0TKm2dRMJTx4xIeL6OGSxt3BWGBBHU\", \"SHIPTOZIP\": \"95131\", \"TIMESTAMP\": \"2019-10-31T08:37:54Z\", \"SHIPTOCITY\": \"San Jose\", \"SHIPTONAME\": \"John Doe\", \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"SHIPTOSTATE\": \"CA\", \"CURRENCYCODE\": \"EUR\", \"INSURANCEAMT\": \"0.00\", \"SHIPTOSTREET\": \"1 Main St\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"1295d92c8248d\", \"TRANSACTIONID\": \"6HG055283P4771742\", \"CHECKOUTSTATUS\": \"PaymentActionCompleted\", \"PAYMENTINFO_0_ACK\": \"Success\", \"PAYMENTINFO_0_AMT\": \"100.00\", \"SHIPTOCOUNTRYCODE\": \"US\", \"SHIPTOCOUNTRYNAME\": \"United States\", \"PAYMENTINFO_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_AMT\": \"100.00\", \"PAYMENTREQUEST_0_DESC\": \"Test Package with Monthly Plan\", \"INSURANCEOPTIONOFFERED\": \"false\", \"INSURANCEOPTIONSELECTED\": \"false\", \"PAYMENTINFO_0_ERRORCODE\": \"0\", \"PAYMENTINFO_0_ORDERTIME\": \"2019-10-31T08:37:52Z\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"SHIPPINGOPTIONISDEFAULT\": \"false\", \"PAYMENTINFO_0_REASONCODE\": \"None\", \"PAYMENTREQUEST_0_ITEMAMT\": \"100.00\", \"PAYMENTINFO_0_PAYMENTTYPE\": \"instant\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTINFO_0_CURRENCYCODE\": \"EUR\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/GFXSftVstJFKBsWBTDBKI4fBJMj6Bbh9sCsf4-A0-JU\", \"PAYMENTREQUEST_0_ORDERTIME\": \"2019-10-31T08:37:52Z\", \"PAYMENTREQUEST_0_SHIPTOZIP\": \"95131\", \"PAYMENTINFO_0_PAYMENTSTATUS\": \"Pending\", \"PAYMENTINFO_0_PENDINGREASON\": \"multicurrency\", \"PAYMENTINFO_0_TRANSACTIONID\": \"6HG055283P4771742\", \"PAYMENTREQUEST_0_REASONCODE\": \"None\", \"PAYMENTREQUEST_0_SHIPTOCITY\": \"San Jose\", \"PAYMENTREQUEST_0_SHIPTONAME\": \"John Doe\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_PAYMENTTYPE\": \"instant\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPTOSTATE\": \"CA\", \"SUCCESSPAGEREDIRECTREQUESTED\": \"false\", \"PAYMENTINFO_0_TRANSACTIONTYPE\": \"expresscheckout\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"EUR\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPTOSTREET\": \"1 Main St\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"0\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_ADDRESSSTATUS\": \"Confirmed\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_PAYMENTSTATUS\": \"Pending\", \"PAYMENTREQUEST_0_PENDINGREASON\": \"multicurrency\", \"PAYMENTREQUEST_0_TRANSACTIONID\": \"6HG055283P4771742\", \"PAYMENTREQUEST_0_TRANSACTIONTYPE\": \"expresscheckout\", \"PAYMENTREQUESTINFO_0_TRANSACTIONID\": \"6HG055283P4771742\", \"PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE\": \"US\", \"PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME\": \"United States\", \"PAYMENTINFO_0_PROTECTIONELIGIBILITY\": \"Eligible\", \"PAYMENTINFO_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE\": \"ItemNotReceivedEligible,UnauthorizedPaymentEligible\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout', 1, 'agreement'),
(6, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-73304280G8228302A\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"100.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/1CsIf4sWxe3p6zf9Rxq71ZN5mSUm-W3M18qGc1FgKE8?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/KB73JywMlDG-AlwHNC7SWpX3RwlIaz7LqPcCiA_CWGc\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/1CsIf4sWxe3p6zf9Rxq71ZN5mSUm-W3M18qGc1FgKE8\", \"SHIPTOZIP\": \"95131\", \"TIMESTAMP\": \"2019-10-31T08:41:32Z\", \"SHIPTOCITY\": \"San Jose\", \"SHIPTONAME\": \"John Doe\", \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"SHIPTOSTATE\": \"CA\", \"CURRENCYCODE\": \"EUR\", \"INSURANCEAMT\": \"0.00\", \"SHIPTOSTREET\": \"1 Main St\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"696a2b00b7a8f\", \"TRANSACTIONID\": \"0FF26218LK151613V\", \"CHECKOUTSTATUS\": \"PaymentActionCompleted\", \"PAYMENTINFO_0_ACK\": \"Success\", \"PAYMENTINFO_0_AMT\": \"100.00\", \"SHIPTOCOUNTRYCODE\": \"US\", \"SHIPTOCOUNTRYNAME\": \"United States\", \"PAYMENTINFO_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_AMT\": \"100.00\", \"PAYMENTREQUEST_0_DESC\": \"Test Package with Monthly Plan\", \"INSURANCEOPTIONOFFERED\": \"false\", \"INSURANCEOPTIONSELECTED\": \"false\", \"PAYMENTINFO_0_ERRORCODE\": \"0\", \"PAYMENTINFO_0_ORDERTIME\": \"2019-10-31T08:41:30Z\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"SHIPPINGOPTIONISDEFAULT\": \"false\", \"PAYMENTINFO_0_REASONCODE\": \"None\", \"PAYMENTREQUEST_0_ITEMAMT\": \"100.00\", \"PAYMENTINFO_0_PAYMENTTYPE\": \"instant\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTINFO_0_CURRENCYCODE\": \"EUR\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/KB73JywMlDG-AlwHNC7SWpX3RwlIaz7LqPcCiA_CWGc\", \"PAYMENTREQUEST_0_ORDERTIME\": \"2019-10-31T08:41:30Z\", \"PAYMENTREQUEST_0_SHIPTOZIP\": \"95131\", \"PAYMENTINFO_0_PAYMENTSTATUS\": \"Pending\", \"PAYMENTINFO_0_PENDINGREASON\": \"multicurrency\", \"PAYMENTINFO_0_TRANSACTIONID\": \"0FF26218LK151613V\", \"PAYMENTREQUEST_0_REASONCODE\": \"None\", \"PAYMENTREQUEST_0_SHIPTOCITY\": \"San Jose\", \"PAYMENTREQUEST_0_SHIPTONAME\": \"John Doe\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_PAYMENTTYPE\": \"instant\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPTOSTATE\": \"CA\", \"SUCCESSPAGEREDIRECTREQUESTED\": \"false\", \"PAYMENTINFO_0_TRANSACTIONTYPE\": \"expresscheckout\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"EUR\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPTOSTREET\": \"1 Main St\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"0\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_ADDRESSSTATUS\": \"Confirmed\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_PAYMENTSTATUS\": \"Pending\", \"PAYMENTREQUEST_0_PENDINGREASON\": \"multicurrency\", \"PAYMENTREQUEST_0_TRANSACTIONID\": \"0FF26218LK151613V\", \"PAYMENTREQUEST_0_TRANSACTIONTYPE\": \"expresscheckout\", \"PAYMENTREQUESTINFO_0_TRANSACTIONID\": \"0FF26218LK151613V\", \"PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE\": \"US\", \"PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME\": \"United States\", \"PAYMENTINFO_0_PROTECTIONELIGIBILITY\": \"Eligible\", \"PAYMENTINFO_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE\": \"ItemNotReceivedEligible,UnauthorizedPaymentEligible\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout', 1, 'agreement'),
(7, '[]', 'stripe', 1, 'agreement'),
(8, '[]', 'stripe', 1, 'agreement'),
(9, '[]', 'stripe', 1, 'agreement'),
(10, '[]', 'stripe', 1, 'agreement'),
(11, '[]', 'stripe', 1, 'agreement'),
(12, '[]', 'stripe', 1, 'agreement'),
(13, '[]', 'stripe', 1, 'agreement'),
(14, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"TOKEN\": \"EC-5X475718NF530373Y\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/aEx2O0Mg5NJw7wwkv3VgKwNZHgEU9lT-jo1LOxxTe_M?cancelled=1\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Q1cT91KL-bzfkKd3zXNvIwweuH-Tus6WSnfkRQLzGdA\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/aEx2O0Mg5NJw7wwkv3VgKwNZHgEU9lT-jo1LOxxTe_M\", \"TIMESTAMP\": \"2019-11-01T10:16:09Z\", \"NOSHIPPING\": 1, \"HANDLINGAMT\": \"0.00\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"CORRELATIONID\": \"7f3a3e8473178\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Q1cT91KL-bzfkKd3zXNvIwweuH-Tus6WSnfkRQLzGdA\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"0\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(15, '{\"NOSHIPPING\": 1, \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": 0, \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(16, '{\"NOSHIPPING\": 1, \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": 0, \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(17, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-2Y348987G7868803U\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/xIyds00euVRJsuy4U4HN6tOCB2V4r0BVQEQjSgkjKsY?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/dqmethoLWIIQibX3zdMR1EnOWX1i8-ukSsT7FL6Z9dw\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/xIyds00euVRJsuy4U4HN6tOCB2V4r0BVQEQjSgkjKsY\", \"TIMESTAMP\": \"2019-11-01T10:46:02Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"976dd904f079f\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/dqmethoLWIIQibX3zdMR1EnOWX1i8-ukSsT7FL6Z9dw\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(18, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7VP09635PW226171U\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/-7D1dOD9CjdZR1WnqgjbrxGLDV4OvBXmcbpbFU9hljU?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/l9g_ighSDsTSHIKOxPYptdVmAvrLmfT2aEtZR5CG-Vo\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/-7D1dOD9CjdZR1WnqgjbrxGLDV4OvBXmcbpbFU9hljU\", \"TIMESTAMP\": \"2019-11-01T10:58:13Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"8c285e2f72082\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/l9g_ighSDsTSHIKOxPYptdVmAvrLmfT2aEtZR5CG-Vo\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(19, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-36J86097GL9034727\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/5sEx-lqnXP9XXfy2i7np0d3O3D2sQukzejZqS-VfG_c?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Pi_ALrKsBnfgo6XNiXzsmG5M62rR6QucCMJSnDNsP74\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/5sEx-lqnXP9XXfy2i7np0d3O3D2sQukzejZqS-VfG_c\", \"TIMESTAMP\": \"2019-11-01T11:03:06Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"ef8157f282196\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Pi_ALrKsBnfgo6XNiXzsmG5M62rR6QucCMJSnDNsP74\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(20, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-36J86097GL9034727\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-PUGYXW3YLY2H\", \"TIMESTAMP\": \"2019-11-01T11:03:10Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"b8ae552863a05\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(21, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-391311781E1557638\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/wVn5h1l8GhjULC9YYhKpAxrjdeEPClv0hYysXlGi0nQ?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/3_nnO5LwKDB8y5Ac1TD7txM7p93UL5maNtDfSHiWH5c\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/wVn5h1l8GhjULC9YYhKpAxrjdeEPClv0hYysXlGi0nQ\", \"TIMESTAMP\": \"2019-11-01T11:06:28Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"b34946b249aeb\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/3_nnO5LwKDB8y5Ac1TD7txM7p93UL5maNtDfSHiWH5c\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(22, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-391311781E1557638\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-E4SFU2RUW3XN\", \"TIMESTAMP\": \"2019-11-01T11:06:32Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"c81c60ed3ebd2\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(23, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"TOKEN\": \"EC-7UK251236J8502045\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/T7Wvr6wrvIQJIYIi_5g0AnfWNYuvPGeN19wVMbsyRFI?cancelled=1\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/a6L6SadEKWTlgH99FQ0WBZHa6aQUEkIgD4XAdEaLvhc\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/T7Wvr6wrvIQJIYIi_5g0AnfWNYuvPGeN19wVMbsyRFI\", \"TIMESTAMP\": \"2019-11-01T12:01:45Z\", \"NOSHIPPING\": 1, \"HANDLINGAMT\": \"0.00\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"CORRELATIONID\": \"7c45eca7ca081\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/a6L6SadEKWTlgH99FQ0WBZHa6aQUEkIgD4XAdEaLvhc\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"0\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(24, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-9SL67778TX136501D\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/OKnSD8K8hZBMDHsdYARW__RCr-0or2T8otaCdsf9DQ0?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Z37fqULGu6jFnzq3kPGgqp74CZzMg1cKCiz5ePQBKlI\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/OKnSD8K8hZBMDHsdYARW__RCr-0or2T8otaCdsf9DQ0\", \"TIMESTAMP\": \"2019-11-01T12:04:19Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"877abb28925c8\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Z37fqULGu6jFnzq3kPGgqp74CZzMg1cKCiz5ePQBKlI\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(25, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-9SL67778TX136501D\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-XDTLY8W12P7U\", \"TIMESTAMP\": \"2019-11-01T12:04:24Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"1af9de00d6c05\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(26, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-9FN46134R7733903V\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/qiTeV_lFAZAObyLQJfX7_cMXU_SWOalZo0gfjPHKwTg?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/wEgurgOpGC0s4KxCa6xsHEeo_fKPCQyDleef0xIU_7M\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/qiTeV_lFAZAObyLQJfX7_cMXU_SWOalZo0gfjPHKwTg\", \"TIMESTAMP\": \"2019-11-01T15:07:41Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"ebb704fcabccf\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/wEgurgOpGC0s4KxCa6xsHEeo_fKPCQyDleef0xIU_7M\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(27, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-9FN46134R7733903V\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-F84LPUAT7H1S\", \"TIMESTAMP\": \"2019-11-01T15:07:45Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"30acca8b9c597\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(28, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-998997522Y5562241\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/OWpqXqbm6KvTOT5S2kGosIG3YdcP6NwfpmGV_vNPV5s?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/0dVGtW-_z3RHXPu9ykJutOO5fUhORZohfDa3u1ColBc\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/OWpqXqbm6KvTOT5S2kGosIG3YdcP6NwfpmGV_vNPV5s\", \"TIMESTAMP\": \"2019-11-01T15:11:16Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"8dbfc0c8302ef\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/0dVGtW-_z3RHXPu9ykJutOO5fUhORZohfDa3u1ColBc\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(29, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-998997522Y5562241\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-1BAA6B9G4WBS\", \"TIMESTAMP\": \"2019-11-01T15:11:20Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"ffc8c2466105a\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(30, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-4FY50849E44514947\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/JzrBjqUaPsY8BS_wrkYSnIoX8we2uFMES4KMCCs2kUU?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/GxGruIyNzol93PHIp4taKcOohDcvu1IsXTkoKy2eAOA\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/JzrBjqUaPsY8BS_wrkYSnIoX8we2uFMES4KMCCs2kUU\", \"TIMESTAMP\": \"2019-11-01T15:15:20Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"528a6bf570027\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/GxGruIyNzol93PHIp4taKcOohDcvu1IsXTkoKy2eAOA\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(31, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-4FY50849E44514947\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-H603298YN7R8\", \"TIMESTAMP\": \"2019-11-01T15:15:24Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"50a088bb40f91\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(32, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-3TY54512EP819923S\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/_6CESGTxVc6gtnjI67McZe6yOZqK2z8Cf9bZXF30bq4?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/-gtvrsY2QwXWknlP4TxcwTJWXuBLefrOMHJH4UERzLY\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/_6CESGTxVc6gtnjI67McZe6yOZqK2z8Cf9bZXF30bq4\", \"TIMESTAMP\": \"2019-11-01T15:18:45Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"2f18ae3c6a7d5\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/-gtvrsY2QwXWknlP4TxcwTJWXuBLefrOMHJH4UERzLY\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(33, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-3TY54512EP819923S\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-687T20JVW2JT\", \"TIMESTAMP\": \"2019-11-01T15:18:50Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"95fc837ac55e3\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(34, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-8H252736DH481424H\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/yLW-90oQBACiNb4hKBDlSblSBNwcCwQ03nuyNWBA_aQ?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/OmSEyPeV8bsOgCiUfvQl76wYjFzky1ByiyhBt93UIvY\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/yLW-90oQBACiNb4hKBDlSblSBNwcCwQ03nuyNWBA_aQ\", \"TIMESTAMP\": \"2019-11-01T15:20:39Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"ee9a10772bcf3\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/OmSEyPeV8bsOgCiUfvQl76wYjFzky1ByiyhBt93UIvY\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(35, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-8H252736DH481424H\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-JCER5R6022YP\", \"TIMESTAMP\": \"2019-11-01T15:20:42Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"67a3c9a723ba3\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(36, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7WK77597JB712543E\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/1Lfnu-ZC8gai8qeh5uoeph9GOpdfcW5_eeeao7JEtvo?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/IQ2UbFvFeycR1SEa5KQgvvteiWnGeOmECKKiyWzd7aQ\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/1Lfnu-ZC8gai8qeh5uoeph9GOpdfcW5_eeeao7JEtvo\", \"TIMESTAMP\": \"2019-11-01T15:29:43Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"814e38b52837b\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/IQ2UbFvFeycR1SEa5KQgvvteiWnGeOmECKKiyWzd7aQ\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(37, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7WK77597JB712543E\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-EMAVPE4JR1S6\", \"TIMESTAMP\": \"2019-11-01T15:29:47Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"26085e621b13d\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(38, '{\"AMT\": \"1.00\", \"ACCT\": null, \"CVV2\": null, \"EXPDATE\": null, \"CURRENCY\": \"USD\"}', 'paypal_pro_checkout_credit_card', 1, 'agreement'),
(39, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7SN24972ES9367849\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/1VzeeD7vqbwrioJuHDIZcYPriAjppcFMhhSyLI8qS6E?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/h5qpLRm_-REbDa46kGFCAgtosi7W0ld0A8UVlOh69as\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/1VzeeD7vqbwrioJuHDIZcYPriAjppcFMhhSyLI8qS6E\", \"TIMESTAMP\": \"2019-11-01T15:52:54Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"ccfb26d83c78\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/h5qpLRm_-REbDa46kGFCAgtosi7W0ld0A8UVlOh69as\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Insert some description here\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(40, '{\"ACK\": \"Success\", \"AMT\": \"0.05\", \"DESC\": \"Insert some description here\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7SN24972ES9367849\", \"STATUS\": \"Cancelled\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-MWRL4JXYXBLU\", \"TIMESTAMP\": \"2019-11-02T04:18:16Z\", \"REGULARAMT\": \"0.05\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.05\", \"CURRENCYCODE\": \"USD\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Day\", \"CORRELATIONID\": \"802a109fb3307\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"LASTPAYMENTAMT\": \"0.05\", \"REGULARAMTPAID\": \"0.05\", \"SUBSCRIBERNAME\": \"John Doe\", \"LASTPAYMENTDATE\": \"2019-11-01T15:55:19Z\", \"NEXTBILLINGDATE\": \"2019-11-01T10:00:00Z\", \"BILLINGFREQUENCY\": \"7\", \"PROFILESTARTDATE\": \"2019-11-01T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"1\", \"NUMCYCLESREMAINING\": \"18446744073709551615\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"USD\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Day\", \"REGULARBILLINGFREQUENCY\": \"7\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment');
INSERT INTO `IAP_Agreements` (`id`, `details`, `paymentMethod`, `packagePlanId`, `type`) VALUES
(41, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-0M469597B8730520L\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/g-UsartFhxCvKqCsnMg-lku34o0IACUIcG_rwCnRKAc?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/yfMM5j8gQ_59UolxlCPfeUQ4JVIbgpepdllb_3tHbDM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/g-UsartFhxCvKqCsnMg-lku34o0IACUIcG_rwCnRKAc\", \"TIMESTAMP\": \"2019-11-03T07:53:44Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"f78499f74e913\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/yfMM5j8gQ_59UolxlCPfeUQ4JVIbgpepdllb_3tHbDM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(42, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-0DE70912VY248871D\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/6AchgiYV_iWG4jcCqzWYAdowJJMNUpumiHz2iGHJMD8?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/6YvXxIouv6Md4mhvwI9qyVNELIg3agWT_fQutFjv8iM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/6AchgiYV_iWG4jcCqzWYAdowJJMNUpumiHz2iGHJMD8\", \"TIMESTAMP\": \"2019-11-03T07:56:06Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"63731e05d863f\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/6YvXxIouv6Md4mhvwI9qyVNELIg3agWT_fQutFjv8iM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(43, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-0DE70912VY248871D\", \"STATUS\": \"Cancelled\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-VDTN21NYBR43\", \"TIMESTAMP\": \"2019-11-03T07:56:20Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"da6e0fc9b5ef8\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-03T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-03T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(44, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"000000\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-50S91827DX5275457\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/YsPgF83Z8JsrNZFsyc281ykcKiLIRgqg1kIEiwpphWE?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/hXCZc1WR1d3Qfcl7fcRMB5lkPuPwZDi8L6PFPSlL-aI\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/YsPgF83Z8JsrNZFsyc281ykcKiLIRgqg1kIEiwpphWE\", \"TIMESTAMP\": \"2019-11-03T07:57:17Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"cab1c17b6766d\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/hXCZc1WR1d3Qfcl7fcRMB5lkPuPwZDi8L6PFPSlL-aI\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(45, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-50S91827DX5275457\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-547ETEBNWVKH\", \"TIMESTAMP\": \"2019-11-03T07:57:21Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"3be33a24bafc5\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-03T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-03T07:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}', 'paypal_express_checkout_recurring_payment', 1, 'payment'),
(46, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7N538406UB146104D\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/R1urE9ciwqVDTmXZ-kpu3Ae8R-b3Pw-nydvEMvxrePo?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Se_2wuESkYLNXJgxiR_GybKctVwo-UIblhg2PaP6-8k\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/R1urE9ciwqVDTmXZ-kpu3Ae8R-b3Pw-nydvEMvxrePo\", \"TIMESTAMP\": \"2019-11-05T18:13:13Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"2ee55db436cfa\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Se_2wuESkYLNXJgxiR_GybKctVwo-UIblhg2PaP6-8k\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(47, '{\"CANCELURL\": \"http://wct2.lh/payment/payment/capture/5k0TIKuczlN7hWX__L5U4BqPdKtPWS2ncZf-x0emQjM?cancelled=1\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/5k0TIKuczlN7hWX__L5U4BqPdKtPWS2ncZf-x0emQjM\", \"NOSHIPPING\": 1, \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": 0, \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/p6nahsbCHg3gIRtuhVOi_4Iz2qWXMdtT0VlY9gvT_co\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(48, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-58554992TF8698422\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/z-M_aywIUyqRRtOnoEdjElW8XPz8C21XtsGTY7u09ao?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/RaWKl46utPe5v4SoqzEbOewYlVZYuzWUfvZgs_GMzKM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/z-M_aywIUyqRRtOnoEdjElW8XPz8C21XtsGTY7u09ao\", \"TIMESTAMP\": \"2019-11-06T02:26:03Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"c1e3fe379f78\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/RaWKl46utPe5v4SoqzEbOewYlVZYuzWUfvZgs_GMzKM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(49, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-83216536D4038773K\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/xF4fcR9uNR0D790br4xlOMEGjpeNPgnDRgsoGncxpx8?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/jeH4ImSZiL2rhXdQ-URAVt3ujHWyMsPm1JRx151UlkM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/xF4fcR9uNR0D790br4xlOMEGjpeNPgnDRgsoGncxpx8\", \"TIMESTAMP\": \"2019-11-06T03:31:02Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"59e912b4b9122\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/jeH4ImSZiL2rhXdQ-URAVt3ujHWyMsPm1JRx151UlkM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(50, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7C9113453Y936732B\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/YbmRZdGUz6Ex56D0QgG_Ti6I5QW_ULE5-Pwy5RUmhE0?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/zZEx9ZdDUxRq72B5YBv-11zq5cwqXahN4gK2XucguWE\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/YbmRZdGUz6Ex56D0QgG_Ti6I5QW_ULE5-Pwy5RUmhE0\", \"TIMESTAMP\": \"2019-11-06T03:42:30Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"2f0d9bdc55f38\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/zZEx9ZdDUxRq72B5YBv-11zq5cwqXahN4gK2XucguWE\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(51, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-4G9228698T699234U\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/KvXOF_y9zh5JN51inc9Sj-2hy8z9J0p9nMKW1qXkjok?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/hCIvVqsFDefV4A6OZrYRyfiTu7-uUwZoMZgv5gPpqvw\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/KvXOF_y9zh5JN51inc9Sj-2hy8z9J0p9nMKW1qXkjok\", \"TIMESTAMP\": \"2019-11-06T04:18:28Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"b8f70b938bc1f\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/hCIvVqsFDefV4A6OZrYRyfiTu7-uUwZoMZgv5gPpqvw\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(52, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-2DT268505L032442E\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/tMThraLzxwynhRaQ5G2L-1FKPg4Y-G18hF0JUdO7UxQ?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/5WFBDOB4Rddxiy_-uxUygdYFTHJ-qPQGpL7e6CkEY5A\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/tMThraLzxwynhRaQ5G2L-1FKPg4Y-G18hF0JUdO7UxQ\", \"TIMESTAMP\": \"2019-11-06T04:36:39Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"d33fc72ab9997\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/5WFBDOB4Rddxiy_-uxUygdYFTHJ-qPQGpL7e6CkEY5A\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(53, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-9F189253LK996333T\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/Mw_1agZ1qQh6fN07rsG3X-cHNSwxqZQXCuCzxfgrFXk?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/uAk1N_cLs7hlIUH0dr45T2DTOPI96C4EjeWLOFoc2CI\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/Mw_1agZ1qQh6fN07rsG3X-cHNSwxqZQXCuCzxfgrFXk\", \"TIMESTAMP\": \"2019-11-06T04:47:32Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"33d07bee8791c\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/uAk1N_cLs7hlIUH0dr45T2DTOPI96C4EjeWLOFoc2CI\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(54, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-5KP7054387616553B\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/Zo08uPEYfJzQdlKNEmHUtMkyZocUq_Nl5gzub_Mbkrw?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/3vkbwh3OThyotIb0QSEzq-kTJQGebvwRk1oVFK3f_KQ\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/Zo08uPEYfJzQdlKNEmHUtMkyZocUq_Nl5gzub_Mbkrw\", \"TIMESTAMP\": \"2019-11-06T04:49:59Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"f181e2a08fe17\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/3vkbwh3OThyotIb0QSEzq-kTJQGebvwRk1oVFK3f_KQ\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(55, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-6JT75901F9029872R\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/Tz3rkgwnTbcYFrFqudj4FXIGc9tM363PB2hNHYxP0kI?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/R6ilOlxHPnkNi7xwC-x1fAdLec4k64zCSYz3E8QzuyM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/Tz3rkgwnTbcYFrFqudj4FXIGc9tM363PB2hNHYxP0kI\", \"TIMESTAMP\": \"2019-11-06T04:59:42Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"7e1b66728f895\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/R6ilOlxHPnkNi7xwC-x1fAdLec4k64zCSYz3E8QzuyM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(56, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-11J37200WF650073E\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/xbSunLr6UDJgS7N67XCV9_Yf3Ml4hQq-WaD09FZCplM?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/fJNncdsX8tAfQAtEqq-FAQSCrWEgw4zZdLOwFlBGpBM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/xbSunLr6UDJgS7N67XCV9_Yf3Ml4hQq-WaD09FZCplM\", \"TIMESTAMP\": \"2019-11-06T05:21:43Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"8f2be76b18672\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/fJNncdsX8tAfQAtEqq-FAQSCrWEgw4zZdLOwFlBGpBM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(57, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-4DU649895U502010H\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/6L7HnBaZlwNXZB9PH4oy4EzgIEUCy62UuuRlflNSQ-Y?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/96UHq0bglt9L-P691CCQmVmAv3CzUB7LnPmOS6ziNcM\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/6L7HnBaZlwNXZB9PH4oy4EzgIEUCy62UuuRlflNSQ-Y\", \"TIMESTAMP\": \"2019-11-06T05:25:28Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"3d6b52add8354\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/96UHq0bglt9L-P691CCQmVmAv3CzUB7LnPmOS6ziNcM\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(58, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-6VE84653U1248143P\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/ipHik8c2vU-BSRsQ8PRtSGC_7cRIX1e5M0ZIQ7e8l3k?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/spBAFDaQnhlU3KlcGxXX-GE2jgErnD-BJQ_CtAGXzGE\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/ipHik8c2vU-BSRsQ8PRtSGC_7cRIX1e5M0ZIQ7e8l3k\", \"TIMESTAMP\": \"2019-11-06T05:36:25Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"678a0f44d153\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/spBAFDaQnhlU3KlcGxXX-GE2jgErnD-BJQ_CtAGXzGE\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(59, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-0JR39635YL6671513\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/LbnPoJ4LQCo2lrSCdqXVuxZiqGlRSdA2PlvJziybo8E?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Mfwjszv4U3SSA-w43wcoBSbtAflfdwWjLPWdPG7Y_GY\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/LbnPoJ4LQCo2lrSCdqXVuxZiqGlRSdA2PlvJziybo8E\", \"TIMESTAMP\": \"2019-11-06T05:48:58Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"6d89cabc25d2f\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/Mfwjszv4U3SSA-w43wcoBSbtAflfdwWjLPWdPG7Y_GY\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement'),
(60, '{\"ACK\": \"Success\", \"AMT\": \"0.00\", \"BUILD\": \"53803583\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7BN24346H98176639\", \"TAXAMT\": \"0.00\", \"ITEMAMT\": \"0.00\", \"PAYERID\": \"24BPW2EFHA7W2\", \"VERSION\": \"65.1\", \"LASTNAME\": \"Doe\", \"CANCELURL\": \"http://wct2.lh/payment/payment/capture/06SeMw71sjV435Z3g1wpdyF_H7H1mQicKGtQbhqUNrs?cancelled=1\", \"FIRSTNAME\": \"John\", \"NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/AAVJhP7U775uXogXKczPQEfY05tk9X3WdRNXGxglyB4\", \"RETURNURL\": \"http://wct2.lh/payment/payment/capture/06SeMw71sjV435Z3g1wpdyF_H7H1mQicKGtQbhqUNrs\", \"TIMESTAMP\": \"2019-11-06T05:49:41Z\", \"NOSHIPPING\": 1, \"COUNTRYCODE\": \"US\", \"HANDLINGAMT\": \"0.00\", \"PAYERSTATUS\": \"verified\", \"SHIPDISCAMT\": \"0.00\", \"SHIPPINGAMT\": \"0.00\", \"CURRENCYCODE\": \"USD\", \"INSURANCEAMT\": \"0.00\", \"ADDRESSSTATUS\": \"Confirmed\", \"CORRELATIONID\": \"5ba6be33eb34c\", \"CHECKOUTSTATUS\": \"PaymentActionNotInitiated\", \"L_BILLINGTYPE0\": \"RecurringPayments\", \"PAYMENTREQUEST_0_AMT\": \"0.00\", \"INSURANCEOPTIONOFFERED\": \"false\", \"PAYMENTREQUEST_0_TAXAMT\": \"0.00\", \"PAYMENTREQUEST_0_ITEMAMT\": \"0.00\", \"AUTHORIZE_TOKEN_USERACTION\": \"commit\", \"PAYMENTREQUEST_0_NOTIFYURL\": \"http://wct2.lh/payment/payment/notify/AAVJhP7U775uXogXKczPQEfY05tk9X3WdRNXGxglyB4\", \"PAYMENTREQUEST_0_HANDLINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPDISCAMT\": \"0.00\", \"PAYMENTREQUEST_0_SHIPPINGAMT\": \"0.00\", \"PAYMENTREQUEST_0_CURRENCYCODE\": \"USD\", \"PAYMENTREQUEST_0_INSURANCEAMT\": \"0.00\", \"BILLINGAGREEMENTACCEPTEDSTATUS\": \"1\", \"L_BILLINGAGREEMENTDESCRIPTION0\": \"Test Package with Monthly Plan\", \"PAYMENTREQUESTINFO_0_ERRORCODE\": \"0\", \"PAYMENTREQUEST_0_PAYMENTACTION\": \"Sale\", \"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\": \"sb-ks1wh402232@business.example.com\", \"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\": \"false\"}', 'paypal_express_checkout_recurring_payment', 1, 'agreement');

-- --------------------------------------------------------

--
-- Структура на таблица `IAP_GatewayConfig`
--

CREATE TABLE `IAP_GatewayConfig` (
  `id` int(11) NOT NULL,
  `gateway_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `useSandbox` tinyint(1) NOT NULL,
  `sandboxConfig` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `currency` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `IAP_GatewayConfig`
--

INSERT INTO `IAP_GatewayConfig` (`id`, `gateway_name`, `factory_name`, `config`, `useSandbox`, `sandboxConfig`, `currency`) VALUES
(6, 'stripe_checkout_gateway', 'stripe_checkout', '{\"publishable_key\":\"aasfsadf\",\"secret_key\":\"fdasfasfa\"}', 1, 'a:1:{s:7:\"factory\";N;}', 'USD'),
(7, 'stripe_checkout_gateway', 'stripe_checkout', '{\"publishable_key\":\"asdasda\",\"secret_key\":\"fdasfasfa\"}', 0, 'a:1:{s:7:\"factory\";N;}', 'USD'),
(8, 'stripe_checkout_gateway', 'stripe_checkout', '{\"publishable_key\":\"asdasda\",\"secret_key\":\"fdasfasfa\"}', 0, 'a:1:{s:7:\"factory\";N;}', 'USD'),
(9, 'paypal_express_checkout_gateway', 'paypal_express_checkout', '{\"sandbox\":\"0\",\"username\":\"sb-ks1wh402232_api1.business.example.com\",\"password\":\"8PRXKLWZFPYBZDKB\",\"signature\":\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\"}', 0, 'a:4:{s:7:\"sandbox\";s:1:\"1\";s:8:\"username\";s:40:\"sb-ks1wh402232_api1.business.example.com\";s:8:\"password\";s:16:\"8PRXKLWZFPYBZDKB\";s:9:\"signature\";s:56:\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\";}', 'EUR'),
(10, 'paypal_express_checkout_gateway', 'paypal_express_checkout', '{\"sandbox\":\"0\",\"username\":\"sb-ks1wh402232_api1.business.example.com\",\"password\":\"8PRXKLWZFPYBZDKB\",\"signature\":\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\"}', 1, 'a:4:{s:7:\"sandbox\";s:1:\"1\";s:8:\"username\";s:40:\"sb-ks1wh402232_api1.business.example.com\";s:8:\"password\";s:16:\"8PRXKLWZFPYBZDKB\";s:9:\"signature\";s:56:\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\";}', 'EUR'),
(11, 'paypal_express_checkout_gateway', 'paypal_express_checkout', '{\"sandbox\":\"0\",\"username\":\"sb-ks1wh402232_api1.business.example.com\",\"password\":\"8PRXKLWZFPYBZDKB\",\"signature\":\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\"}', 1, 'a:4:{s:7:\"sandbox\";s:1:\"1\";s:8:\"username\";s:40:\"sb-ks1wh402232_api1.business.example.com\";s:8:\"password\";s:16:\"8PRXKLWZFPYBZDKB\";s:9:\"signature\";s:56:\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\";}', 'EUR'),
(12, 'paypal_express_checkout_gateway', 'paypal_express_checkout', '{\"sandbox\":\"0\",\"username\":\"sb-ks1wh402232_api1.business.example.com\",\"password\":\"8PRXKLWZFPYBZDKB\",\"signature\":\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\"}', 1, 'a:4:{s:7:\"sandbox\";s:1:\"1\";s:8:\"username\";s:40:\"sb-ks1wh402232_api1.business.example.com\";s:8:\"password\";s:16:\"8PRXKLWZFPYBZDKB\";s:9:\"signature\";s:56:\"Ajqso8A-uDUaXxl-CdVBwnXhzMsTAEdVwItx7t0TyVJeh7oICslAmTot\";}', 'EUR');

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
  `route` varchar(64) NOT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `IAP_PaymentMethods`
--

INSERT INTO `IAP_PaymentMethods` (`id`, `gatewayId`, `name`, `route`, `active`) VALUES
(1, 6, 'paypal_pro_checkout', 'ia_payment_paypal_prepare', 0);

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

--
-- Схема на данните от таблица `IAP_Payments`
--

INSERT INTO `IAP_Payments` (`id`, `paymentMethod`, `packagePlanId`, `number`, `description`, `client_email`, `client_id`, `total_amount`, `currency_code`, `bankAccount`, `creditCard`, `details`) VALUES
(1, 'stripe', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"amount\": null, \"currency\": null, \"description\": null}'),
(2, 'stripe', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"amount\": null, \"currency\": null, \"description\": null}'),
(3, 'stripe', 1, '5dbc41fd16d08', 'Test Package with Monthly Plan', 'foo@example.com', 'anId', 100, 'EUR', NULL, NULL, '{\"id\": \"ch_1Fa1CMCozROjz2jXdrGakA4E\", \"card\": \"tok_1Fa1CICozROjz2jXkKFYqDea\", \"paid\": true, \"order\": null, \"amount\": 100, \"object\": \"charge\", \"review\": null, \"source\": {\"id\": \"card_1Fa1CICozROjz2jX70jdCN11\", \"name\": \"asdsad@abv.bg\", \"brand\": \"Visa\", \"last4\": \"4242\", \"object\": \"card\", \"country\": \"US\", \"funding\": \"credit\", \"customer\": null, \"exp_year\": 2023, \"metadata\": [], \"cvc_check\": \"pass\", \"exp_month\": 2, \"address_zip\": null, \"fingerprint\": \"G632Ve9Xp0rWfIwZ\", \"address_city\": null, \"address_line1\": null, \"address_line2\": null, \"address_state\": null, \"dynamic_last4\": null, \"address_country\": null, \"address_zip_check\": null, \"address_line1_check\": null, \"tokenization_method\": null}, \"status\": \"succeeded\", \"created\": 1572618838, \"dispute\": null, \"invoice\": null, \"outcome\": {\"type\": \"authorized\", \"reason\": null, \"risk_level\": \"normal\", \"risk_score\": 20, \"network_status\": \"approved_by_network\", \"seller_message\": \"Payment complete.\"}, \"refunds\": {\"url\": \"/v1/charges/ch_1Fa1CMCozROjz2jXdrGakA4E/refunds\", \"data\": [], \"object\": \"list\", \"has_more\": false, \"total_count\": 0}, \"captured\": true, \"currency\": \"eur\", \"customer\": null, \"livemode\": false, \"metadata\": [], \"refunded\": false, \"shipping\": null, \"application\": null, \"description\": \"Test Package with Monthly Plan\", \"destination\": null, \"receipt_url\": \"https://pay.stripe.com/receipts/acct_1FWDlECozROjz2jX/ch_1Fa1CMCozROjz2jXdrGakA4E/rcpt_G6DdwnZiU6eKpd3T6KdFGUJ63x6z0xq\", \"failure_code\": null, \"on_behalf_of\": null, \"fraud_details\": [], \"receipt_email\": null, \"transfer_data\": null, \"payment_intent\": null, \"payment_method\": \"card_1Fa1CICozROjz2jX70jdCN11\", \"receipt_number\": null, \"transfer_group\": null, \"amount_refunded\": 0, \"application_fee\": null, \"billing_details\": {\"name\": \"asdsad@abv.bg\", \"email\": null, \"phone\": null, \"address\": {\"city\": null, \"line1\": null, \"line2\": null, \"state\": null, \"country\": null, \"postal_code\": null}}, \"failure_message\": null, \"source_transfer\": null, \"balance_transaction\": \"txn_1Fa1CMCozROjz2jXnbrb2nZt\", \"statement_descriptor\": null, \"application_fee_amount\": null, \"payment_method_details\": {\"card\": {\"brand\": \"visa\", \"last4\": \"4242\", \"checks\": {\"cvc_check\": \"pass\", \"address_line1_check\": null, \"address_postal_code_check\": null}, \"wallet\": null, \"country\": \"US\", \"funding\": \"credit\", \"network\": \"visa\", \"exp_year\": 2023, \"exp_month\": 2, \"fingerprint\": \"G632Ve9Xp0rWfIwZ\", \"installments\": null, \"three_d_secure\": null}, \"type\": \"card\"}, \"statement_descriptor_suffix\": null}'),
(4, 'stripe', 1, '5dbc43e5ee851', 'Test Package with Monthly Plan', 'foo@example.com', 'anId', 100, 'EUR', NULL, NULL, '{\"id\": \"ch_1Fa1JNCozROjz2jX5DWfoA7M\", \"card\": \"tok_1Fa1JJCozROjz2jXdPHcXfWV\", \"paid\": true, \"order\": null, \"amount\": 100, \"object\": \"charge\", \"review\": null, \"source\": {\"id\": \"card_1Fa1JJCozROjz2jXE5ZkEDIz\", \"name\": \"dsdcfbg@abv.bg\", \"brand\": \"Visa\", \"last4\": \"4242\", \"object\": \"card\", \"country\": \"US\", \"funding\": \"credit\", \"customer\": null, \"exp_year\": 2023, \"metadata\": [], \"cvc_check\": \"pass\", \"exp_month\": 2, \"address_zip\": null, \"fingerprint\": \"G632Ve9Xp0rWfIwZ\", \"address_city\": null, \"address_line1\": null, \"address_line2\": null, \"address_state\": null, \"dynamic_last4\": null, \"address_country\": null, \"address_zip_check\": null, \"address_line1_check\": null, \"tokenization_method\": null}, \"status\": \"succeeded\", \"created\": 1572619273, \"dispute\": null, \"invoice\": null, \"outcome\": {\"type\": \"authorized\", \"reason\": null, \"risk_level\": \"normal\", \"risk_score\": 29, \"network_status\": \"approved_by_network\", \"seller_message\": \"Payment complete.\"}, \"refunds\": {\"url\": \"/v1/charges/ch_1Fa1JNCozROjz2jX5DWfoA7M/refunds\", \"data\": [], \"object\": \"list\", \"has_more\": false, \"total_count\": 0}, \"captured\": true, \"currency\": \"eur\", \"customer\": null, \"livemode\": false, \"metadata\": [], \"refunded\": false, \"shipping\": null, \"application\": null, \"description\": \"Test Package with Monthly Plan\", \"destination\": null, \"receipt_url\": \"https://pay.stripe.com/receipts/acct_1FWDlECozROjz2jX/ch_1Fa1JNCozROjz2jX5DWfoA7M/rcpt_G6DkaOdu4519pYlIfw4J2bmwVuGLugi\", \"failure_code\": null, \"on_behalf_of\": null, \"fraud_details\": [], \"receipt_email\": null, \"transfer_data\": null, \"payment_intent\": null, \"payment_method\": \"card_1Fa1JJCozROjz2jXE5ZkEDIz\", \"receipt_number\": null, \"transfer_group\": null, \"amount_refunded\": 0, \"application_fee\": null, \"billing_details\": {\"name\": \"dsdcfbg@abv.bg\", \"email\": null, \"phone\": null, \"address\": {\"city\": null, \"line1\": null, \"line2\": null, \"state\": null, \"country\": null, \"postal_code\": null}}, \"failure_message\": null, \"source_transfer\": null, \"balance_transaction\": \"txn_1Fa1JNCozROjz2jXM0QXQZKW\", \"statement_descriptor\": null, \"application_fee_amount\": null, \"payment_method_details\": {\"card\": {\"brand\": \"visa\", \"last4\": \"4242\", \"checks\": {\"cvc_check\": \"pass\", \"address_line1_check\": null, \"address_postal_code_check\": null}, \"wallet\": null, \"country\": \"US\", \"funding\": \"credit\", \"network\": \"visa\", \"exp_year\": 2023, \"exp_month\": 2, \"fingerprint\": \"G632Ve9Xp0rWfIwZ\", \"installments\": null, \"three_d_secure\": null}, \"type\": \"card\"}, \"statement_descriptor_suffix\": null}'),
(5, 'stripe', 1, '5dbe870eeed3a', 'Test Package with Monthly Plan', 'foo@example.com', 'anId', 100, 'EUR', NULL, NULL, '{\"amount\": 100, \"currency\": \"EUR\", \"description\": \"Test Package with Monthly Plan\"}'),
(6, 'paypal_express_checkout_recurring_payment', 1, '5dc1bbb9aec6f', 'EUR', 'admin', '1', 100, 'EUR', NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7N538406UB146104D\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-GRYH5U87K3UX\", \"TIMESTAMP\": \"2019-11-05T18:13:15Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"7eea58c479438\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-05T20:13:13+02:00\"}'),
(7, 'paypal_express_checkout_recurring_payment', 1, '5dc22f7cc7108', 'EUR', 'admin', '1', 100, 'EUR', NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-58554992TF8698422\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-7DSYH16ALDHM\", \"TIMESTAMP\": \"2019-11-06T02:27:10Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"c834b4cc5a8fa\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T04:27:08+02:00\"}'),
(8, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7C9113453Y936732B\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-7EPM0UUHDX4L\", \"TIMESTAMP\": \"2019-11-06T03:42:50Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"d1e8b7c26034\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T05:42:35+02:00\"}'),
(9, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-4G9228698T699234U\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-5BH772X0CBRB\", \"TIMESTAMP\": \"2019-11-06T04:18:56Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"f18de163e90a4\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T06:18:35+02:00\"}'),
(10, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-2DT268505L032442E\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-L8SCJ175HHBM\", \"TIMESTAMP\": \"2019-11-06T04:36:51Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"3b46b2aa3abfb\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T06:36:42+02:00\"}'),
(11, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-9F189253LK996333T\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-BFBHEDTG9UF1\", \"TIMESTAMP\": \"2019-11-06T04:47:43Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"121636331048a\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T06:47:36+02:00\"}'),
(12, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-5KP7054387616553B\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-C0XYBDSTH8DG\", \"TIMESTAMP\": \"2019-11-06T04:50:21Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"7ea2435a67225\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T06:50:05+02:00\"}'),
(13, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-6JT75901F9029872R\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-RC2WCD1M9W69\", \"TIMESTAMP\": \"2019-11-06T04:59:52Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"a9edb187ceefb\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T06:59:45+02:00\"}'),
(14, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-11J37200WF650073E\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-5G4RK565RUK1\", \"TIMESTAMP\": \"2019-11-06T05:21:51Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"f5ac352719690\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T07:21:46+02:00\"}'),
(15, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-4DU649895U502010H\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-YJXDCR42660G\", \"TIMESTAMP\": \"2019-11-06T05:25:36Z\", \"CURRENCYCODE\": \"EUR\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"ebd7db43ef2bc\", \"PROFILESTATUS\": \"ActiveProfile\", \"BILLINGFREQUENCY\": 1, \"PROFILESTARTDATE\": \"2019-11-06T07:25:31+02:00\"}'),
(16, 'paypal_express_checkout_recurring_payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-6VE84653U1248143P\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-PTWR1WC4P06S\", \"TIMESTAMP\": \"2019-11-06T05:36:36Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"733812cd3f3\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}'),
(17, 'paypal_express_checkout_recurring_payment', 1, '5dc25ecabbf5e', 'EUR', 'admin', '1', 100, 'EUR', NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-0JR39635YL6671513\", \"STATUS\": \"Active\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-YLD81YLKGUTT\", \"TIMESTAMP\": \"2019-11-06T05:49:01Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"958c48f975ea0\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}'),
(18, 'paypal_express_checkout_recurring_payment', 1, '5dc25ef5c0ac0', 'EUR', 'admin', '1', 100, 'EUR', NULL, NULL, '{\"ACK\": \"Success\", \"AMT\": \"100.00\", \"DESC\": \"Test Package with Monthly Plan\", \"BUILD\": \"53779744\", \"EMAIL\": \"sb-wsp2g401218@personal.example.com\", \"TOKEN\": \"EC-7BN24346H98176639\", \"STATUS\": \"Cancelled\", \"TAXAMT\": \"0.00\", \"VERSION\": \"65.1\", \"PROFILEID\": \"I-H4TFBKKPXXSA\", \"TIMESTAMP\": \"2019-11-06T17:27:30Z\", \"REGULARAMT\": \"100.00\", \"SHIPPINGAMT\": \"0.00\", \"AGGREGATEAMT\": \"0.00\", \"CURRENCYCODE\": \"EUR\", \"TRIALAMTPAID\": \"0.00\", \"BILLINGPERIOD\": \"Month\", \"CORRELATIONID\": \"bf14eb54ba324\", \"PROFILESTATUS\": \"ActiveProfile\", \"REGULARTAXAMT\": \"0.00\", \"AUTOBILLOUTAMT\": \"NoAutoBill\", \"REGULARAMTPAID\": \"0.00\", \"SUBSCRIBERNAME\": \"John Doe\", \"NEXTBILLINGDATE\": \"2019-11-06T10:00:00Z\", \"BILLINGFREQUENCY\": \"1\", \"PROFILESTARTDATE\": \"2019-11-06T08:00:00Z\", \"MAXFAILEDPAYMENTS\": \"0\", \"FAILEDPAYMENTCOUNT\": \"0\", \"NUMCYCLESCOMPLETED\": \"0\", \"NUMCYCLESREMAINING\": \"0\", \"OUTSTANDINGBALANCE\": \"0.00\", \"REGULARSHIPPINGAMT\": \"0.00\", \"TOTALBILLINGCYCLES\": \"0\", \"FINALPAYMENTDUEDATE\": \"1970-01-01T00:00:00Z\", \"REGULARCURRENCYCODE\": \"EUR\", \"AGGREGATEOPTIONALAMT\": \"0.00\", \"REGULARBILLINGPERIOD\": \"Month\", \"REGULARBILLINGFREQUENCY\": \"1\", \"REGULARTOTALBILLINGCYCLES\": \"0\"}');

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
(1, 'admin', 'admin', 'admin', 'admin', 1, 'ZEAYhdMkJnNRZ0t5JO0Ol5AecbXAwj3ennB0CrmBIBY', '$argon2i$v=19$m=65536,t=4,p=1$MWFNejhXMzFwVFdpVElGMg$qq6lIt3kFlHxPq6plag34jEwsfMvglffqYH9UkKL26Q', '2019-11-12 06:42:29', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', 18, 4),
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
(10, '2019-11-06 19:27:31', 1, 'User cancel recurring payment for \"paypal_express_checkout_recurring_payment\".');

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

--
-- Схема на данните от таблица `IAUM_UsersSubscriptions`
--

INSERT INTO `IAUM_UsersSubscriptions` (`id`, `date`, `userId`, `planId`, `paymentDetailsId`) VALUES
(1, '2019-10-29 13:00:27', 1, 1, 1),
(2, '2019-10-31 10:25:26', 1, NULL, 4),
(3, '2019-10-31 10:37:58', 1, NULL, 5),
(4, '2019-10-31 10:41:35', 1, NULL, 6),
(5, '2019-11-01 17:18:51', 1, NULL, 33),
(6, '2019-11-01 17:20:44', 1, NULL, 35),
(7, '2019-11-01 17:29:48', 1, NULL, 37),
(8, '2019-11-01 17:52:59', 1, NULL, 40),
(9, '2019-11-03 09:56:10', 1, NULL, 43),
(10, '2019-11-03 09:57:21', 1, NULL, 45),
(11, '2019-11-05 20:13:17', 1, NULL, 6),
(12, '2019-11-06 04:30:04', 1, NULL, 7),
(13, '2019-11-06 05:04:54', 1, NULL, 2),
(14, '2019-11-06 05:13:26', 1, NULL, 4),
(15, '2019-11-06 05:17:53', 1, NULL, 6),
(16, '2019-11-06 06:00:12', 1, NULL, 8),
(17, '2019-11-06 07:49:02', 1, NULL, 17),
(18, '2019-11-06 07:49:45', 1, NULL, 18);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `IAP_GatewayConfig`
--
ALTER TABLE `IAP_GatewayConfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `IAP_PaymentDetails`
--
ALTER TABLE `IAP_PaymentDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `IAP_PaymentMethods`
--
ALTER TABLE `IAP_PaymentMethods`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IAP_Payments`
--
ALTER TABLE `IAP_Payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
