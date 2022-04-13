-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2022 at 06:53 PM
-- Server version: 8.0.26
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `VsWct_Upgrade`
--

--
-- Dumping data for table `VSAPP_Applications`
--

INSERT INTO `VSAPP_Applications` (`id`, `title`, `hostname`, `code`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'Admin Panel', 'admin.wct-upgrade.lh', 'admin-panel', 1, '2022-02-28 11:08:14', '2022-02-28 11:08:14'),
(2, 'Web Content Thief', 'wct-upgrade.lh', 'web-content-thief', 1, '2022-02-28 11:09:05', '2022-02-28 11:09:05');


--
-- Dumping data for table `VSAPP_Settings`
--

INSERT INTO `VSAPP_Settings` (`id`, `maintenanceMode`, `theme`, `application_id`, `maintenance_page_id`) VALUES
(1, 0, NULL, NULL, NULL),
(2, 0, 'vankosoft/web-content-thief', 2, NULL);

--
-- Dumping data for table `VSAPP_Taxonomy`
--

INSERT INTO `VSAPP_Taxonomy` (`id`, `code`, `root_taxon_id`, `name`, `description`) VALUES
(1, 'page-categories', 1, 'Page Categories', 'Page Categories'),
(2, 'user-roles', 2, 'User Roles', 'User Roles Taxonomy'),
(3, 'file-managers', 3, 'File Managers', 'FileManagers Taxonomy'),
(4, 'document-categories', 33, 'Document Categories', 'Categories for TOC Documents');

--
-- Dumping data for table `VSAPP_Taxons`
--

INSERT INTO `VSAPP_Taxons` (`id`, `tree_root`, `parent_id`, `code`, `tree_left`, `tree_right`, `tree_level`, `position`, `enabled`) VALUES
(1, 1, NULL, 'page-categories', 1, 8, 0, NULL, 1),
(2, 2, NULL, 'user-roles', 1, 10, 0, NULL, 1),
(3, 3, NULL, 'file-managers', 1, 2, 0, NULL, 1),
(4, 1, 1, 'maintenance-pages', 2, 3, 1, NULL, 1),
(5, 2, 2, 'role-super-admin', 2, 3, 1, NULL, 1),
(6, 2, 2, 'role-application-admin', 4, 9, 1, NULL, 1),
(7, 2, 6, 'role-web-content-thief-admin', 5, 6, 2, NULL, 1),
(33, 33, NULL, 'document-categories', 1, 4, 0, NULL, 1);

--
-- Dumping data for table `VSAPP_TaxonTranslations`
--

INSERT INTO `VSAPP_TaxonTranslations` (`id`, `translatable_id`, `locale`, `name`, `slug`, `description`) VALUES
(1, 1, 'en_US', 'Root taxon of Taxonomy: \"Page Categories\"', 'page-categories', 'Root taxon of Taxonomy: \"Page Categories\"'),
(2, 2, 'en_US', 'Root taxon of Taxonomy: \"User Roles\"', 'user-roles', 'Root taxon of Taxonomy: \"User Roles\"'),
(3, 3, 'en_US', 'Root taxon of Taxonomy: \"File Managers\"', 'file-managers', 'Root taxon of Taxonomy: \"File Managers\"'),
(4, 4, 'en_US', 'Maintenance Pages', 'maintenance-pages', 'Maintenance Pages Description'),
(5, 5, 'en_US', 'Role Super Admin', 'role-super-admin', 'Role Super Admin Description'),
(6, 6, 'en_US', 'Role Application Admin', 'role-application-admin', 'Role Application Admin Description'),
(7, 7, 'en_US', 'Role Web Content Thief', 'role-web-content-thief-admin', 'Website'),
(32, 33, 'en_US', 'Root taxon of Taxonomy: \"Document Categories\"', 'document-categories', 'Root taxon of Taxonomy: \"Document Categories\"');

--
-- Dumping data for table `VSCMS_PageCategories`
--

INSERT INTO `VSCMS_PageCategories` (`id`, `parent_id`, `taxon_id`) VALUES
(1, NULL, 4);

--
-- Dumping data for table `VSUM_AvatarImage`
--

INSERT INTO `VSUM_AvatarImage` (`id`, `owner_id`, `type`, `path`) VALUES
(1, 1, NULL, '99/ee/bf8d772a89cdbf3a0a5e825255d3.png'),
(2, 2, NULL, '4a/d9/48f60633788af08fabe065e8f6ff.png');

--
-- Dumping data for table `VSUM_UserRoles`
--

INSERT INTO `VSUM_UserRoles` (`id`, `parent_id`, `taxon_id`, `role`) VALUES
(1, NULL, 5, 'ROLE_SUPER_ADMIN'),
(2, NULL, 6, 'ROLE_APPLICATION_ADMIN'),
(3, 2, 7, 'ROLE_WEB_CONTENT_THIEF_ADMIN');

--
-- Dumping data for table `VSUM_Users`
--

INSERT INTO `VSUM_Users` (`id`, `info_id`, `api_token`, `salt`, `password`, `roles_array`, `username`, `email`, `prefered_locale`, `last_login`, `confirmation_token`, `password_requested_at`, `verified`, `enabled`) VALUES
(1, 1, 'NOT_IMPLEMETED', '11f2090031f81b5906ab4695ad4cfb86', '$2y$13$4n/OJIpaLlBZyR8j8UL64OnYvax/omMxmSgaXnkBIgjIyjvwkKTjG', 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', 'admin', 'admin@vankosoft-upgrade.lh', 'en_US', '2022-03-05 11:46:34', NULL, NULL, 1, 1),
(2, 2, 'NOT_IMPLEMETED', 'ed370f39301398f735fc07ad08214347', '$2y$13$XAKUzlVSl7vZUE8iZTgtE.i28ks3JyAslk8i5.i6tsSrxS6gaoLti', 'a:1:{i:0;s:22:\"ROLE_APPLICATION_ADMIN\";}', 'appadmin', 'appadmin@vankosoft-upgrade.lh', 'en_US', NULL, NULL, NULL, 1, 1);

--
-- Dumping data for table `VSUM_UsersInfo`
--

INSERT INTO `VSUM_UsersInfo` (`id`, `country`, `birthday`, `mobile`, `website`, `occupation`, `first_name`, `last_name`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'Super', 'Admin'),
(2, NULL, NULL, NULL, NULL, NULL, 'Applications', 'Admin');

--
-- Dumping data for table `VSUM_Users_Roles`
--

INSERT INTO `VSUM_Users_Roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
