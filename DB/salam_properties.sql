-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2026 at 07:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salam_properties`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `action` varchar(80) NOT NULL,
  `entity` varchar(60) DEFAULT NULL,
  `entity_id` int(10) UNSIGNED DEFAULT NULL,
  `detail` varchar(600) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `admin_id`, `action`, `entity`, `entity_id`, `detail`, `ip`, `user_agent`, `created_at`) VALUES
(1, 1, 'login', 'admin', 1, 'Successful login from the admin panel', '41.204.11.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-02 02:11:00'),
(2, 1, 'create', 'properties', 1, 'Created listing SP-1042 Marina Gate Residence 42', '41.204.11.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-03 03:12:00'),
(3, 3, 'update', 'properties', 5, 'Updated price on SP-1156 from AED 6,450,000 to AED 6,200,000', '92.118.44.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-04 04:13:00'),
(4, 2, 'create', 'posts', 3, 'Published post: Dubai Property Market Outlook 2026', '84.201.12.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-05 05:14:00'),
(5, 1, 'update', 'settings', 0, 'Enabled mortgage calculator sitewide', '41.204.11.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-06 06:15:00'),
(6, 3, 'delete', 'media', 17, 'Removed duplicate upload 17-hero.jpg', '92.118.44.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-07 07:16:00'),
(7, 2, 'login', 'admin', 2, 'Successful login from the admin panel', '188.65.9.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-08 08:17:00'),
(8, 1, 'export', 'inquiries', 0, 'Exported 10 inquiries to CSV', '41.204.11.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-09 09:18:00'),
(9, 3, 'update', 'investment_projects', 1, 'Progress on Marina Crest moved from 65% to 72%', '92.118.44.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-01 01:10:00'),
(10, 2, 'update', 'pages', 1, 'Rewrote the About page', '84.201.12.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/124', '2026-03-02 02:11:00'),
(11, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:11:22'),
(12, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:11:53'),
(13, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:13:42'),
(14, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:14:13'),
(15, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:15:08'),
(16, 1, 'create', 'properties', 26, 'Created listing #26', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:15:08'),
(17, 1, 'update', 'properties', 26, 'Updated listing #26', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:15:08'),
(18, 1, 'toggle', 'properties', 26, 'is_featured = 1', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:15:08'),
(19, 1, 'delete', 'properties', 26, 'Deleted listing #26', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:15:08'),
(20, NULL, 'inquiry_created', 'inquiries', 11, 'New inquiry from Jane Tester', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:15:40'),
(21, NULL, 'user_registered', 'users', 5, 'New account: Test Client', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:15:40'),
(22, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:22:43'),
(23, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', '2026-10-06 10:23:18'),
(24, 1, 'login', 'admins', 1, 'Signed in to the admin panel', '::1', 'curl/8.21.0', '2026-10-06 10:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('super','admin','editor','author') NOT NULL DEFAULT 'editor',
  `avatar` varchar(500) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `status` enum('active','suspended','invited') NOT NULL DEFAULT 'active',
  `two_factor` tinyint(1) NOT NULL DEFAULT 0,
  `login_attempts` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `password`, `role`, `avatar`, `phone`, `status`, `two_factor`, `login_attempts`, `locked_until`, `last_login_at`, `last_login_ip`, `last_seen_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Salam Admin', 'admin@salamproperties.com', 'admin', '$2y$10$d8ahLSbjTzQNILiq5iSfzOUhS0F0nRjdF70A2z.T/rXGrnf1kYITq', 'super', NULL, '+971 4 000 0000', 'active', 0, 0, NULL, '2026-10-06 16:23:39', '::1', '2026-10-06 16:23:39', NULL, '2026-01-01 00:00:00', '2026-10-06 10:23:39'),
(2, 'Nadia Rahman', 'nadia@salamproperties.com', 'nadia', '$2y$10$d8ahLSbjTzQNILiq5iSfzOUhS0F0nRjdF70A2z.T/rXGrnf1kYITq', 'editor', NULL, '+971 4 000 0001', 'active', 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-01-01 00:00:00', '2026-10-06 11:34:08'),
(3, 'Omar Al Falasi', 'omar@salamproperties.com', 'omar', '$2y$10$d8ahLSbjTzQNILiq5iSfzOUhS0F0nRjdF70A2z.T/rXGrnf1kYITq', 'admin', NULL, '+971 4 000 0002', 'active', 0, 0, NULL, NULL, NULL, NULL, NULL, '2026-01-01 00:00:00', '2026-10-06 11:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(140) NOT NULL,
  `type` enum('property','post','gallery','service','project') NOT NULL DEFAULT 'property',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `type`, `parent_id`, `description`, `image`, `icon`, `sort_order`, `is_active`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Apartments', 'apartments', 'property', NULL, 'High-rise and mid-rise apartments across the UAE.', NULL, 'bi building', 1, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(2, 'Villas', 'villas', 'property', NULL, 'Standalone villas, mansions and gated estates.', NULL, 'bi house-heart', 2, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(3, 'Townhouses', 'townhouses', 'property', NULL, 'Multi-storey townhouses in family communities.', NULL, 'bi brackets', 3, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(4, 'Penthouses', 'penthouses', 'property', NULL, 'Top-floor residences with private terraces.', NULL, 'bi building-up', 4, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(5, 'Studio Apartments', 'studio-apartments', 'property', 1, 'Compact furnished and unfurnished studios.', NULL, 'bi grid', 5, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(6, 'Duplex Apartments', 'duplex-apartments', 'property', 1, 'Two-level apartments with double-height living.', NULL, 'bi columns', 6, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(7, 'Office Spaces', 'office-spaces', 'property', NULL, 'Grade-A offices, whole floors and co-working suites.', NULL, 'bi briefcase', 7, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(8, 'Retail Units', 'retail-units', 'property', NULL, 'Shops, showrooms and F&B units.', NULL, 'bi storefront', 8, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(9, 'Warehouses', 'warehouses', 'property', NULL, 'Logistics units, labour camps and light industry.', NULL, 'bi box-seam', 9, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(10, 'Land & Plots', 'land-plots', 'property', NULL, 'Residential and commercial plots.', NULL, 'bi terrain', 10, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(11, 'Hotel Apartments', 'hotel-apartments', 'property', NULL, 'Serviced residences with hotel management.', NULL, 'bi bell', 11, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(12, 'Market Insights', 'market-insights', 'post', NULL, 'Data-led analysis of the regional property market.', NULL, 'bi graph-up', 1, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(13, 'Buying Guides', 'buying-guides', 'post', NULL, 'Step-by-step guidance for buyers.', NULL, 'bi cart', 2, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(14, 'Investment', 'investment', 'post', NULL, 'Yield, ROI and portfolio strategy.', NULL, 'bi coin', 3, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(15, 'Design & Interiors', 'design-interiors', 'post', NULL, 'Architecture, interiors and lifestyle.', NULL, 'bi palette', 4, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(16, 'Legal & Finance', 'legal-finance', 'post', NULL, 'Regulation, mortgages and transaction law.', NULL, 'bi file-earmark', 5, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(17, 'Community', 'community', 'post', NULL, 'Neighbourhoods, schools and amenities.', NULL, 'bi geo-alt', 6, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(18, 'Commercial Property', 'commercial-property', 'post', NULL, 'Office, retail and industrial market coverage.', NULL, 'bi briefcase', 7, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(19, 'Residential Projects', 'residential-projects', 'project', NULL, 'Apartment and villa developments.', NULL, 'bi house', 1, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(20, 'Commercial Projects', 'commercial-projects', 'project', NULL, 'Offices, retail and mixed-use schemes.', NULL, 'bi building', 2, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(21, 'Hospitality Projects', 'hospitality-projects', 'project', NULL, 'Resorts, hotels and serviced residences.', NULL, 'bi umbrella', 3, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(22, 'Interiors', 'gallery-interiors', 'gallery', NULL, 'Interior photography.', NULL, 'bi door-open', 1, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(23, 'Exteriors', 'gallery-exteriors', 'gallery', NULL, 'Building exteriors and skylines.', NULL, 'bi building', 2, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(24, 'Amenities', 'gallery-amenities', 'gallery', NULL, 'Pools, gyms, gardens and shared spaces.', NULL, 'bi droplet', 3, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(25, 'Neighbourhoods', 'gallery-neighbourhoods', 'gallery', NULL, 'Street life and community views.', NULL, 'bi signpost', 4, 1, NULL, NULL, '2026-10-06 11:34:09', '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to_email` varchar(190) NOT NULL,
  `to_name` varchar(120) DEFAULT NULL,
  `subject` varchar(250) NOT NULL,
  `body` mediumtext DEFAULT NULL,
  `template` varchar(80) DEFAULT NULL,
  `related_to` varchar(80) DEFAULT NULL,
  `related_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('queued','sent','failed') NOT NULL DEFAULT 'queued',
  `error` varchar(500) DEFAULT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sent_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_log`
--

INSERT INTO `email_log` (`id`, `to_email`, `to_name`, `subject`, `body`, `template`, `related_to`, `related_id`, `status`, `error`, `attempts`, `sent_at`, `created_at`) VALUES
(1, 'hana.yilmaz@example.com', 'Hana Yilmaz', '[Salam Properties] Your viewing is confirmed - SP-1042', '<p>Your viewing is confirmed - SP-1042</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 2, 'sent', NULL, 1, '2026-02-11 11:05:00', '2026-02-11 05:05:00'),
(2, 'm.duarte@example.com', 'Michael Duarte', '[Salam Properties] Re: Mortgage pre-approval question', '<p>Re: Mortgage pre-approval question</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 3, 'sent', NULL, 1, '2026-03-12 11:10:00', '2026-03-12 05:10:00'),
(3, 'layla.k@example.com', 'Layla Kassem', '[Salam Properties] Rent increase assessment for Town Square', '<p>Rent increase assessment for Town Square</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 4, 'sent', NULL, 1, '2026-04-13 11:15:00', '2026-04-13 05:15:00'),
(4, 'hello@salamproperties.com', 'Salam Properties', '[Salam Properties] New investment inquiry from Andrei Popescu', '<p>New investment inquiry from Andrei Popescu</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 5, 'sent', NULL, 1, '2026-05-14 11:20:00', '2026-05-14 05:20:00'),
(5, 'sana.iqbal@example.com', 'Sana Iqbal', '[Salam Properties] Bellevue Towers payment schedule', '<p>Bellevue Towers payment schedule</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 6, 'failed', 'SMTP connection timed out after 30s', 1, NULL, '2026-06-15 05:25:00'),
(6, 'robert.ng@example.com', 'Robert Ng', '[Salam Properties] DIFC office shortlist - 4 options', '<p>DIFC office shortlist - 4 options</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 7, 'sent', NULL, 1, '2026-07-16 11:30:00', '2026-07-16 05:30:00'),
(7, 'chen.wei@example.com', 'Chen Wei', '[Salam Properties] Bluewaters availability', '<p>Bluewaters availability</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 8, 'queued', NULL, 1, NULL, '2026-08-17 05:35:00'),
(8, 't.berger@example.com', 'Thomas Berger', '[Salam Properties] Relocation package overview', '<p>Relocation package overview</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 9, 'sent', NULL, 1, '2026-09-18 11:40:00', '2026-09-18 05:40:00'),
(9, 'noor.m@example.com', 'Noor Al Marri', '[Salam Properties] Deposit dispute - next steps', '<p>Deposit dispute - next steps</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 10, 'sent', NULL, 1, '2026-01-19 11:45:00', '2026-01-19 05:45:00'),
(10, 'omar@salamproperties.com', 'Omar Al Falasi', '[Salam Properties] Weekly pipeline summary', '<p>Weekly pipeline summary</p><p>Regards,<br>Salam Properties</p>', 'inquiry', 'inquiry', 1, 'sent', NULL, 1, '2026-02-20 11:50:00', '2026-02-20 05:50:00'),
(11, 'hello@salamproperties.com', 'Salam Properties', '[Salam Properties] New inquiry: Marina Gate Residence 42 —', 'Name: Jane Tester\nE-mail: jane@example.com\nPhone: -\nType: property\n\nI would like to schedule a viewing this weekend.\n\nIP: ::1', 'inquiry', 'inquiries', 11, 'failed', 'Transport rejected the message', 1, NULL, '2026-10-06 10:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `caption` varchar(400) DEFAULT NULL,
  `url` varchar(600) NOT NULL,
  `thumbnail` varchar(600) DEFAULT NULL,
  `alt` varchar(200) DEFAULT NULL,
  `credit` varchar(200) DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `caption`, `url`, `thumbnail`, `alt`, `credit`, `category_id`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'Double-height living volume with travertine floors', 'Double-height living volume with travertine floors', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg/1920px-Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg/1920px-Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg', 'Double-height living volume with travertine floors - Salam Properties', 'Basile Morin / CC BY-SA 4.0', 22, 1, 1, '2026-10-06 11:34:09'),
(2, 'Marina-facing corner residence at golden hour', 'Marina-facing corner residence at golden hour', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/70/Bonn%2C_Post-Tower_--_2017_--_2136.jpg/1920px-Bonn%2C_Post-Tower_--_2017_--_2136.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/70/Bonn%2C_Post-Tower_--_2017_--_2136.jpg/1920px-Bonn%2C_Post-Tower_--_2017_--_2136.jpg', 'Marina-facing corner residence at golden hour - Salam Properties', 'Dietmar Rabich / CC BY-SA 4.0', 23, 2, 1, '2026-10-06 11:34:09'),
(3, 'Private pool terrace with shaded dining pavilion', 'Private pool terrace with shaded dining pavilion', 'https://live.staticflickr.com/4083/5047591825_8738293dd5_b.jpg', 'https://live.staticflickr.com/4083/5047591825_8738293dd5_b.jpg', 'Private pool terrace with shaded dining pavilion - Salam Properties', 'Studio Sarah Lou / BY', 24, 3, 1, '2026-10-06 11:34:09'),
(4, 'Roof terrace overlooking the skyline', 'Roof terrace overlooking the skyline', 'https://live.staticflickr.com/7015/6574448269_80eddec043_b.jpg', 'https://live.staticflickr.com/7015/6574448269_80eddec043_b.jpg', 'Roof terrace overlooking the skyline - Salam Properties', 'thienzieyung / BY', 25, 4, 1, '2026-10-06 11:34:09'),
(5, 'Open-plan kitchen with stone worktops', 'Open-plan kitchen with stone worktops', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/43/Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg/1920px-Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/43/Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg/1920px-Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg', 'Open-plan kitchen with stone worktops - Salam Properties', 'slgckgc / CC BY 2.0', 22, 5, 1, '2026-10-06 11:34:09'),
(6, 'Principal suite with sea-facing glazing', 'Principal suite with sea-facing glazing', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/61/Brick_Tower_with_Geometric_Balconies%2C_Porto%2C_Portugal_%2854828599039%29.jpg/1920px-Brick_Tower_with_Geometric_Balconies%2C_Porto%2C_Portugal_%2854828599039%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/61/Brick_Tower_with_Geometric_Balconies%2C_Porto%2C_Portugal_%2854828599039%29.jpg/1920px-Brick_Tower_with_Geometric_Balconies%2C_Porto%2C_Portugal_%2854828599039%29.jpg', 'Principal suite with sea-facing glazing - Salam Properties', 'Dale Cruse - 10M views from San Francisco, CA, USA / CC BY 4.0', 23, 6, 1, '2026-10-06 11:34:09'),
(7, 'Landscaped courtyard shared by four buildings', 'Landscaped courtyard shared by four buildings', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b7/Villa_Miragalli_infinity_swimminh_pool.jpg/1920px-Villa_Miragalli_infinity_swimminh_pool.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b7/Villa_Miragalli_infinity_swimminh_pool.jpg/1920px-Villa_Miragalli_infinity_swimminh_pool.jpg', 'Landscaped courtyard shared by four buildings - Salam Properties', 'Bruno Acampora / CC BY-SA 3.0', 24, 7, 1, '2026-10-06 11:34:09'),
(8, 'Infinity pool on the fourteenth floor', 'Infinity pool on the fourteenth floor', 'https://live.staticflickr.com/8163/7447742734_97d3a8a965_b.jpg', 'https://live.staticflickr.com/8163/7447742734_97d3a8a965_b.jpg', 'Infinity pool on the fourteenth floor - Salam Properties', 'CarlosPacheco / BY', 25, 8, 1, '2026-10-06 11:34:09'),
(9, 'Sky lounge and residents library', 'Sky lounge and residents library', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg/1920px-Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg/1920px-Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg', 'Sky lounge and residents library - Salam Properties', 'Samuel Zeller samuelzeller / CC0', 22, 9, 1, '2026-10-06 11:34:09'),
(10, 'Landscaped community park at dusk', 'Landscaped community park at dusk', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/Jay_blacks_2017_%28Unsplash%29.jpg/1920px-Jay_blacks_2017_%28Unsplash%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/Jay_blacks_2017_%28Unsplash%29.jpg/1920px-Jay_blacks_2017_%28Unsplash%29.jpg', 'Landscaped community park at dusk - Salam Properties', 'jay blacks thejayblacks / CC0', 23, 10, 1, '2026-10-06 11:34:09'),
(11, 'Glass facade detail, Gate Village', 'Glass facade detail, Gate Village', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e3/Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg/1920px-Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e3/Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg/1920px-Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg', 'Glass facade detail, Gate Village - Salam Properties', 'Brandon Morgan littleppl85 / CC0', 24, 11, 1, '2026-10-06 11:34:09'),
(12, 'Street-level retail and dining promenade', 'Street-level retail and dining promenade', 'https://live.staticflickr.com/4117/4908983993_bbeb967e38_b.jpg', 'https://live.staticflickr.com/4117/4908983993_bbeb967e38_b.jpg', 'Street-level retail and dining promenade - Salam Properties', 'skys the limit2 / BY', 25, 12, 1, '2026-10-06 11:34:09'),
(13, 'Concierge lobby with travertine reception', 'Concierge lobby with travertine reception', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3c/Chatting_in_a_coffee_shop_%28Unsplash%29.jpg/1920px-Chatting_in_a_coffee_shop_%28Unsplash%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3c/Chatting_in_a_coffee_shop_%28Unsplash%29.jpg/1920px-Chatting_in_a_coffee_shop_%28Unsplash%29.jpg', 'Concierge lobby with travertine reception - Salam Properties', 'Nick Hillier nhillier / CC0', 22, 13, 1, '2026-10-06 11:34:09'),
(14, 'Shaded majlis opening onto the garden', 'Shaded majlis opening onto the garden', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1d/Red_apartment_building_%28Unsplash%29.jpg/1920px-Red_apartment_building_%28Unsplash%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1d/Red_apartment_building_%28Unsplash%29.jpg/1920px-Red_apartment_building_%28Unsplash%29.jpg', 'Shaded majlis opening onto the garden - Salam Properties', 'Echo Grid echogrid / CC0', 23, 14, 1, '2026-10-06 11:34:09'),
(15, 'Boardwalk along the creek at sunrise', 'Boardwalk along the creek at sunrise', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e1/Drone_pool_and_deck_chairs_%28Unsplash%29.jpg/1920px-Drone_pool_and_deck_chairs_%28Unsplash%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e1/Drone_pool_and_deck_chairs_%28Unsplash%29.jpg/1920px-Drone_pool_and_deck_chairs_%28Unsplash%29.jpg', 'Boardwalk along the creek at sunrise - Salam Properties', 'Tim Gouw punttim / CC0', 24, 15, 1, '2026-10-06 11:34:09'),
(16, 'Palm-lined approach to the villa entrance', 'Palm-lined approach to the villa entrance', 'https://live.staticflickr.com/58/191766759_af5f8173ec_b.jpg', 'https://live.staticflickr.com/58/191766759_af5f8173ec_b.jpg', 'Palm-lined approach to the villa entrance - Salam Properties', 'Jo@net / BY', 25, 16, 1, '2026-10-06 11:34:09'),
(17, 'Executive office floor with perimeter glazing', 'Executive office floor with perimeter glazing', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/78/Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg/1920px-Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/78/Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg/1920px-Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg', 'Executive office floor with perimeter glazing - Salam Properties', 'Steinar Engeland steinart / CC0', 22, 17, 1, '2026-10-06 11:34:09'),
(18, 'Children play area within the community', 'Children play area within the community', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d2/White_apartment_building_%28Unsplash%29.jpg/1920px-White_apartment_building_%28Unsplash%29.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d2/White_apartment_building_%28Unsplash%29.jpg/1920px-White_apartment_building_%28Unsplash%29.jpg', 'Children play area within the community - Salam Properties', 'Joel Filipe joelfilip / CC0', 23, 18, 1, '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `subject` varchar(220) DEFAULT NULL,
  `message` text NOT NULL,
  `type` enum('general','property','viewing','investment','callback','career') NOT NULL DEFAULT 'general',
  `status` enum('new','in_progress','replied','closed','spam') NOT NULL DEFAULT 'new',
  `property_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(300) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `replied_at` datetime DEFAULT NULL,
  `assigned_to` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `name`, `email`, `phone`, `subject`, `message`, `type`, `status`, `property_id`, `project_id`, `user_id`, `ip`, `user_agent`, `is_read`, `notes`, `replied_at`, `assigned_to`, `created_at`, `updated_at`) VALUES
(1, 'Hana Yilmaz', 'hana.yilmaz@example.com', '+971 55 100 2030', 'Viewing request - SP-1042', 'Could we see Marina Gate Residence 42 on Saturday morning? Ideally before 11am.', 'viewing', 'new', 1, NULL, NULL, '41.204.11.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 0, NULL, NULL, NULL, '2026-02-11 04:07:00', '2026-02-11 04:07:00'),
(2, 'Michael Duarte', 'm.duarte@example.com', '+971 50 771 4410', 'Mortgage pre-approval question', 'We are pre-approved at AED 3.2M and want to understand the fees on a 3.45M purchase.', 'property', 'in_progress', 1, NULL, NULL, '92.118.44.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 1, NULL, NULL, 1, '2026-03-12 05:14:00', '2026-03-12 07:26:00'),
(3, 'Layla Kassem', 'layla.k@example.com', '+971 52 909 7761', 'Rental renewal advice', 'Our landlord has proposed an 11% increase. What does the index say for Town Square?', 'general', 'replied', 20, NULL, NULL, '84.201.12.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 1, NULL, '2026-04-13 14:39:00', 1, '2026-04-13 06:21:00', '2026-04-13 08:39:00'),
(4, 'Andrei Popescu', 'andrei.p@example.com', '+971 56 443 1129', 'Investment brief - AED 5M', 'Looking for a yield-led acquisition in the 5-6M range, happy to consider commercial.', 'investment', 'new', NULL, 4, NULL, '188.65.9.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 0, NULL, NULL, NULL, '2026-05-14 07:28:00', '2026-05-14 07:28:00'),
(5, 'Sana Iqbal', 'sana.iqbal@example.com', '+971 54 660 8812', 'Off-plan payment plan query', 'Please send the 60/40 schedule for Bellevue Towers and the projected service charge.', 'property', 'new', 16, NULL, NULL, '31.44.190.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 0, NULL, NULL, NULL, '2026-06-15 08:35:00', '2026-06-15 08:35:00'),
(6, 'Robert Ng', 'robert.ng@example.com', '+971 58 224 6613', 'Commercial floor - DIFC', 'We need 4,000-6,000 sq ft for a fund. Gate Village or ICD? Budget up to 5M.', 'property', 'in_progress', 9, NULL, NULL, '103.28.55.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 1, NULL, NULL, 1, '2026-01-16 09:42:00', '2026-01-16 11:18:00'),
(7, 'Yasmin Farouk', 'yasmin.f@example.com', '', 'Call back request', 'Prefer a call after 4pm to discuss selling our villa in Al Barsha.', 'callback', 'new', NULL, NULL, NULL, '156.197.8.31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 0, NULL, NULL, NULL, '2026-02-17 10:49:00', '2026-02-17 10:49:00'),
(8, 'Thomas Berger', 't.berger@example.com', '+971 55 812 3345', 'Relocation package', 'Relocating from Frankfurt in September, family of four. Need schools and temporary housing.', 'general', 'replied', NULL, NULL, NULL, '77.91.66.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 1, NULL, '2026-03-18 19:44:00', 1, '2026-03-18 11:56:00', '2026-03-18 13:44:00'),
(9, 'Noor Al Marri', 'noor.m@example.com', '+971 50 331 7788', 'Tenancy dispute', 'Landlord kept the full deposit for normalised wear. What are my options?', 'general', 'in_progress', NULL, NULL, NULL, '5.32.144.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 1, NULL, NULL, 1, '2026-04-19 03:03:00', '2026-04-19 05:57:00'),
(10, 'Chen Wei', 'chen.wei@example.com', '+971 52 700 4412', 'Penthouse viewing', 'Is Bluewaters Residences 1 still available? Can view any weekday evening.', 'viewing', 'new', 15, NULL, NULL, '45.112.8.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 0, NULL, NULL, NULL, '2026-05-20 04:10:00', '2026-05-20 04:10:00'),
(11, 'Jane Tester', 'jane@example.com', NULL, NULL, 'I would like to schedule a viewing this weekend.', 'property', 'new', 1, NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444', 0, NULL, NULL, NULL, '2026-10-06 10:15:38', '2026-10-06 10:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `investment_documents`
--

CREATE TABLE `investment_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `file_type` enum('pdf','doc','xls','image','other') NOT NULL DEFAULT 'pdf',
  `url` varchar(600) NOT NULL,
  `file_size` int(10) UNSIGNED DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `downloads` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investment_documents`
--

INSERT INTO `investment_documents` (`id`, `project_id`, `title`, `file_type`, `url`, `file_size`, `is_public`, `downloads`, `sort_order`, `created_at`) VALUES
(1, 1, 'Construction update - Q3 2026', 'pdf', 'uploads/documents/marina-crest-residences-1.pdf', 2221056, 1, 72, 0, '2026-10-06 11:34:09'),
(2, 1, 'Payment plan schedule', 'xls', 'uploads/documents/marina-crest-residences-2.xls', 2616320, 1, 27, 1, '2026-10-06 11:34:09'),
(3, 2, 'Construction update - Q3 2026', 'pdf', 'uploads/documents/the-grove-villas-phase-2-1.pdf', 513024, 1, 44, 0, '2026-10-06 11:34:09'),
(4, 2, 'Payment plan schedule', 'xls', 'uploads/documents/the-grove-villas-phase-2-2.xls', 2502656, 1, 43, 1, '2026-10-06 11:34:09'),
(5, 3, 'Master plan brochure', 'pdf', 'uploads/documents/horizon-business-bay-tower-1.pdf', 4563968, 1, 11, 0, '2026-10-06 11:34:09'),
(6, 3, 'Indicative payment plan', 'xls', 'uploads/documents/horizon-business-bay-tower-2.xls', 1647616, 1, 7, 1, '2026-10-06 11:34:09'),
(7, 3, 'Floor plates', 'pdf', 'uploads/documents/horizon-business-bay-tower-3.pdf', 3909632, 1, 76, 2, '2026-10-06 11:34:09'),
(8, 4, 'As-built brochure', 'pdf', 'uploads/documents/al-barsha-terraces-1.pdf', 3675136, 1, 29, 0, '2026-10-06 11:34:09'),
(9, 4, 'Handover checklist', 'xls', 'uploads/documents/al-barsha-terraces-2.xls', 1964032, 1, 80, 1, '2026-10-06 11:34:09'),
(10, 4, 'Service charge budget', 'pdf', 'uploads/documents/al-barsha-terraces-3.pdf', 3140608, 1, 19, 2, '2026-10-06 11:34:09'),
(11, 5, 'Master plan brochure', 'pdf', 'uploads/documents/creek-harbour-waterfront-retail-1.pdf', 2664448, 1, 57, 0, '2026-10-06 11:34:09'),
(12, 5, 'Indicative payment plan', 'xls', 'uploads/documents/creek-harbour-waterfront-retail-2.xls', 3971072, 1, 5, 1, '2026-10-06 11:34:09'),
(13, 5, 'Floor plates', 'pdf', 'uploads/documents/creek-harbour-waterfront-retail-3.pdf', 2511872, 1, 83, 2, '2026-10-06 11:34:09'),
(14, 6, 'Construction update - Q3 2026', 'pdf', 'uploads/documents/al-hajar-resort-residences-1.pdf', 1547264, 1, 36, 0, '2026-10-06 11:34:09'),
(15, 6, 'Payment plan schedule', 'xls', 'uploads/documents/al-hajar-resort-residences-2.xls', 1796096, 1, 61, 1, '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `investment_images`
--

CREATE TABLE `investment_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(600) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `alt` varchar(200) DEFAULT NULL,
  `credit` varchar(200) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_cover` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investment_images`
--

INSERT INTO `investment_images` (`id`, `project_id`, `url`, `caption`, `alt`, `credit`, `sort_order`, `is_cover`, `created_at`) VALUES
(1, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a9/Construction_site_barricades_%28Unsplash%29.jpg/1920px-Construction_site_barricades_%28Unsplash%29.jpg', 'Marina Crest Residences - view 1', 'Marina Crest Residences by Matthew Hamilton thatsmrbio', 'Matthew Hamilton thatsmrbio / CC0', 0, 1, '2026-10-06 11:34:09'),
(2, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1d/Red_apartment_building_%28Unsplash%29.jpg/1920px-Red_apartment_building_%28Unsplash%29.jpg', 'Marina Crest Residences - view 2', 'Marina Crest Residences by Echo Grid echogrid', 'Echo Grid echogrid / CC0', 1, 0, '2026-10-06 11:34:09'),
(3, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/City_of_lights_%28Unsplash%29.jpg/1920px-City_of_lights_%28Unsplash%29.jpg', 'Marina Crest Residences - view 3', 'Marina Crest Residences by Luca Bravo lucabravo', 'Luca Bravo lucabravo / CC0', 2, 0, '2026-10-06 11:34:09'),
(4, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg/1920px-Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg', 'Marina Crest Residences - view 4', 'Marina Crest Residences by Samuel Zeller samuelzeller', 'Samuel Zeller samuelzeller / CC0', 3, 0, '2026-10-06 11:34:09'),
(5, 2, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/09/Geneva%2C_Switzerland_%28Unsplash%29.jpg/1920px-Geneva%2C_Switzerland_%28Unsplash%29.jpg', 'The Grove Villas Phase II - view 1', 'The Grove Villas Phase II by Samuel Zeller samuelzeller', 'Samuel Zeller samuelzeller / CC0', 0, 1, '2026-10-06 11:34:09'),
(6, 2, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d2/White_apartment_building_%28Unsplash%29.jpg/1920px-White_apartment_building_%28Unsplash%29.jpg', 'The Grove Villas Phase II - view 2', 'The Grove Villas Phase II by Joel Filipe joelfilip', 'Joel Filipe joelfilip / CC0', 1, 0, '2026-10-06 11:34:09'),
(7, 2, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/62/Cloudy_London_skyline_%28Unsplash%29.jpg/1920px-Cloudy_London_skyline_%28Unsplash%29.jpg', 'The Grove Villas Phase II - view 3', 'The Grove Villas Phase II by Rob Bye robertbye', 'Rob Bye robertbye / CC0', 2, 0, '2026-10-06 11:34:09'),
(8, 2, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3c/Chatting_in_a_coffee_shop_%28Unsplash%29.jpg/1920px-Chatting_in_a_coffee_shop_%28Unsplash%29.jpg', 'The Grove Villas Phase II - view 4', 'The Grove Villas Phase II by Nick Hillier nhillier', 'Nick Hillier nhillier / CC0', 3, 0, '2026-10-06 11:34:09'),
(9, 3, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ee/Geneva%2C_Switzerland_%28Unsplash_AMZu5YFHDHo%29.jpg/1920px-Geneva%2C_Switzerland_%28Unsplash_AMZu5YFHDHo%29.jpg', 'Horizon Business Bay Tower - view 1', 'Horizon Business Bay Tower by Samuel Zeller samuelzeller', 'Samuel Zeller samuelzeller / CC0', 0, 1, '2026-10-06 11:34:09'),
(10, 3, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c1/City_office_lights_%28Unsplash%29.jpg/1920px-City_office_lights_%28Unsplash%29.jpg', 'Horizon Business Bay Tower - view 2', 'Horizon Business Bay Tower by Vladimir Kudinov', 'Vladimir Kudinov / CC0', 1, 0, '2026-10-06 11:34:09'),
(11, 3, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/Qingdao_-_Drone_view_city_with_skyline_%28Unsplash%29.jpg/1920px-Qingdao_-_Drone_view_city_with_skyline_%28Unsplash%29.jpg', 'Horizon Business Bay Tower - view 3', 'Horizon Business Bay Tower by CHO EUNSEONG being_es', 'CHO EUNSEONG being_es / CC0', 2, 0, '2026-10-06 11:34:09'),
(12, 3, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/78/Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg/1920px-Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg', 'Horizon Business Bay Tower - view 4', 'Horizon Business Bay Tower by Steinar Engeland steinart', 'Steinar Engeland steinart / CC0', 3, 0, '2026-10-06 11:34:09'),
(13, 4, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/Flags_in_an_office_building_%28Unsplash%29.jpg/1920px-Flags_in_an_office_building_%28Unsplash%29.jpg', 'Al Barsha Terraces - view 1', 'Al Barsha Terraces by Erol Ahmed erol', 'Erol Ahmed erol / CC0', 0, 1, '2026-10-06 11:34:09'),
(14, 4, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f5/Geometric_office_%28Unsplash%29.jpg/1920px-Geometric_office_%28Unsplash%29.jpg', 'Al Barsha Terraces - view 2', 'Al Barsha Terraces by Patrick Tomasso impatrickt', 'Patrick Tomasso impatrickt / CC0', 1, 0, '2026-10-06 11:34:09'),
(15, 4, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0a/View_of_Paris_skyline_%28Unsplash%29.jpg/1920px-View_of_Paris_skyline_%28Unsplash%29.jpg', 'Al Barsha Terraces - view 3', 'Al Barsha Terraces by Drew Coffman drewcoffman', 'Drew Coffman drewcoffman / CC0', 2, 0, '2026-10-06 11:34:09'),
(16, 4, 'https://live.staticflickr.com/3797/10798143964_5fc2e95a00_b.jpg', 'Al Barsha Terraces - view 4', 'Al Barsha Terraces by Foto Miki Digital', 'Foto Miki Digital / PDM', 3, 0, '2026-10-06 11:34:09'),
(17, 5, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/93/Kepong%2C_Kuala_Lumpur%2C_Malaysia_%28Unsplash%29.jpg/1920px-Kepong%2C_Kuala_Lumpur%2C_Malaysia_%28Unsplash%29.jpg', 'Creek Harbour Waterfront Retail - view 1', 'Creek Harbour Waterfront Retail by EJ Yao hojipago', 'EJ Yao hojipago / CC0', 0, 1, '2026-10-06 11:34:09'),
(18, 5, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/db/Glass_building_corner_%28Unsplash%29.jpg/1920px-Glass_building_corner_%28Unsplash%29.jpg', 'Creek Harbour Waterfront Retail - view 2', 'Creek Harbour Waterfront Retail by Jonathan Simcoe jdsimcoe', 'Jonathan Simcoe jdsimcoe / CC0', 1, 0, '2026-10-06 11:34:09'),
(19, 5, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9f/Woman_in_front_of_skyline_%28Unsplash%29.jpg/1920px-Woman_in_front_of_skyline_%28Unsplash%29.jpg', 'Creek Harbour Waterfront Retail - view 3', 'Creek Harbour Waterfront Retail by Brooke Cagle brookecagle', 'Brooke Cagle brookecagle / CC0', 2, 0, '2026-10-06 11:34:09'),
(20, 5, 'https://live.staticflickr.com/65535/49862247091_907d665bb1_b.jpg', 'Creek Harbour Waterfront Retail - view 4', 'Creek Harbour Waterfront Retail by flooringclarity', 'flooringclarity / BY', 3, 0, '2026-10-06 11:34:09'),
(21, 6, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4b/View_Above_Construction_Site_%28Unsplash%29.jpg/1920px-View_Above_Construction_Site_%28Unsplash%29.jpg', 'Al Hajar Resort Residences - view 1', 'Al Hajar Resort Residences by chuttersnap chuttersnap', 'chuttersnap chuttersnap / CC0', 0, 1, '2026-10-06 11:34:09'),
(22, 6, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cb/Neglected_office_plants_%28Unsplash%29.jpg/1920px-Neglected_office_plants_%28Unsplash%29.jpg', 'Al Hajar Resort Residences - view 2', 'Al Hajar Resort Residences by Sam X samx', 'Sam X samx / CC0', 1, 0, '2026-10-06 11:34:09'),
(23, 6, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9a/City_view_of_Paris_%28Unsplash%29.jpg/1920px-City_view_of_Paris_%28Unsplash%29.jpg', 'Al Hajar Resort Residences - view 3', 'Al Hajar Resort Residences by Paul Dufour bill_bokeh', 'Paul Dufour bill_bokeh / CC0', 2, 0, '2026-10-06 11:34:09'),
(24, 6, 'https://live.staticflickr.com/2841/10560793463_59080ccf8e_b.jpg', 'Al Hajar Resort Residences - view 4', 'Al Hajar Resort Residences by Foto Miki Digital', 'Foto Miki Digital / PDM', 3, 0, '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `investment_projects`
--

CREATE TABLE `investment_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(180) NOT NULL,
  `title` varchar(220) NOT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('draft','planning','construction','completed','published','archived') NOT NULL DEFAULT 'draft',
  `location` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'United Arab Emirates',
  `lat` decimal(10,7) DEFAULT NULL,
  `lng` decimal(10,7) DEFAULT NULL,
  `total_units` int(10) UNSIGNED DEFAULT NULL,
  `units_available` int(10) UNSIGNED DEFAULT NULL,
  `price_from` decimal(16,2) DEFAULT NULL,
  `price_to` decimal(16,2) DEFAULT NULL,
  `currency` char(3) NOT NULL DEFAULT 'AED',
  `expected_roi` decimal(5,2) DEFAULT NULL,
  `progress_pct` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `handover_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `developer` varchar(180) DEFAULT NULL,
  `payment_plan` varchar(300) DEFAULT NULL,
  `cover_image` varchar(600) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `views_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investment_projects`
--

INSERT INTO `investment_projects` (`id`, `slug`, `title`, `summary`, `description`, `category_id`, `status`, `location`, `city`, `country`, `lat`, `lng`, `total_units`, `units_available`, `price_from`, `price_to`, `currency`, `expected_roi`, `progress_pct`, `handover_date`, `start_date`, `developer`, `payment_plan`, `cover_image`, `is_featured`, `views_count`, `created_by`, `meta_title`, `meta_description`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'marina-crest-residences', 'Marina Crest Residences', 'A 43-storey waterfront tower with 312 apartments, sky pool and direct marina promenade access.', 'Marina Crest rises from the northern end of Dubai Marina with 312 apartments across 43 floors and a single sub-floor of parking. Amenities are concentrated on the 14th and 42nd floors: an infinity pool, residents lounge, co-working floor and a gym that opens onto a terrace. The developer is offering a 60/40 plan with a 2027 handover, and the marina promenade gives immediate access to the tram and Marina Walk. We expect this to hold resale value strongly because there is no comparable new supply on the water for the next two years.', 19, 'construction', 'Dubai Marina, Dubai', 'Dubai', 'United Arab Emirates', 25.1860000, 55.2620000, 312, 118, 1650000.00, 4300000.00, 'AED', 7.40, 72, '2027-12-31', '2025-03-01', 'Crest Developer LLC', '60/40 - 20% down, 40% during construction, 40% on handover', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a9/Construction_site_barricades_%28Unsplash%29.jpg/1920px-Construction_site_barricades_%28Unsplash%29.jpg', 1, 356, 1, 'Marina Crest Residences | Salam Properties', 'A 43-storey waterfront tower with 312 apartments, sky pool and direct marina promenade access.', '2026-02-14 10:00:00', '2026-01-14 03:00:00', '2026-10-06 11:34:09'),
(2, 'the-grove-villas-phase-2', 'The Grove Villas Phase II', 'Eighty-four contemporary villas arranged around a linear park, with three and four bedroom plans.', 'Phase II of The Grove adds eighty-four villas to a master-planned community already occupied in Phase I. The plans are wider than the market standard, giving a double reception on the ground floor and a proper family lounge upstairs. Every villa has a landscaped rear garden, a covered two-car bay and a helper room. Construction is at forty-five percent with handover scheduled for mid-2027. Service charges are capped for the first three years at AED 9.5 per sq ft, which is unusual for a villa community at this standard.', 19, 'construction', 'Dubailand, Dubai', 'Dubai', 'United Arab Emirates', 25.1860000, 55.2620000, 84, 41, 2850000.00, 5900000.00, 'AED', 6.80, 45, '2027-06-30', '2025-01-15', 'Grove Communities', '30/70 - 10% booking, 20% during construction, 70% on handover', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/09/Geneva%2C_Switzerland_%28Unsplash%29.jpg/1920px-Geneva%2C_Switzerland_%28Unsplash%29.jpg', 1, 529, 1, 'The Grove Villas Phase II | Salam Properties', 'Eighty-four contemporary villas arranged around a linear park, with three and four bedroom plans.', '2026-02-14 10:00:00', '2026-01-14 03:00:00', '2026-10-06 11:34:09'),
(3, 'horizon-business-bay-tower', 'Horizon Business Bay Tower', 'A 28-storey grade-A office tower with retail podium and 420 parking bays.', 'Horizon is a grade-A office tower proposed for the canal edge of Business Bay, offering 28 floors of column-free floor plates of around 12,000 sq ft each. The podium holds 4,000 sq ft of retail and a conference centre; parking is 420 bays across three basements. Planning approval is in place and piling starts in Q2 2026. Pre-leasing has opened to financial and professional services tenants, with asking rents of AED 130 per sq ft. Ownership is freehold for non-GCC buyers through the DLD framework.', 20, 'planning', 'Business Bay, Dubai', 'Dubai', 'United Arab Emirates', 25.1860000, 55.2620000, 0, 0, 9800000.00, 24000000.00, 'AED', 8.10, 20, '2029-03-31', '2026-04-01', 'Horizon Capital', '40/60 - 15% deposit, 25% on structure, 60% on completion', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ee/Geneva%2C_Switzerland_%28Unsplash_AMZu5YFHDHo%29.jpg/1920px-Geneva%2C_Switzerland_%28Unsplash_AMZu5YFHDHo%29.jpg', 0, 341, 1, 'Horizon Business Bay Tower | Salam Properties', 'A 28-storey grade-A office tower with retail podium and 420 parking bays.', '2026-02-14 10:00:00', '2026-01-14 03:00:00', '2026-10-06 11:34:09'),
(4, 'al-barsha-terraces', 'Al Barsha Terraces', 'A completed low-rise community of 96 apartments with courtyard gardens and rooftop terraces.', 'Al Barsha Terraces is complete and occupied, which removes the delivery risk that comes with any off-plan purchase. The scheme is deliberately low-rise: four buildings of four floors around a planted courtyard, with rooftop terraces shared by residents. There are 96 apartments in total, ranging from one-bedroom units to a small number of two-bedroom garden apartments. Nine units remain with the developer, offered with a 50/50 payment plan over eighteen months and a guaranteed two-year maintenance package.', 19, 'completed', 'Al Barsha South, Dubai', 'Dubai', 'United Arab Emirates', 25.1860000, 55.2620000, 96, 9, 1350000.00, 2750000.00, 'AED', 6.20, 100, '2025-02-28', '2023-11-01', 'Terrace Developments', '50/50 over 18 months with 9 units remaining', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/Flags_in_an_office_building_%28Unsplash%29.jpg/1920px-Flags_in_an_office_building_%28Unsplash%29.jpg', 0, 917, 1, 'Al Barsha Terraces | Salam Properties', 'A completed low-rise community of 96 apartments with courtyard gardens and rooftop terraces.', '2026-02-14 10:00:00', '2026-01-14 03:00:00', '2026-10-06 11:34:09'),
(5, 'creek-harbour-waterfront-retail', 'Creek Harbour Waterfront Retail', 'A single-storey retail and F&B strip of 24 units along the new creek boardwalk.', 'Twenty-four freehold retail units arranged as a single-storey strip along the new creek boardwalk, sized from 900 to 3,400 sq ft. Each unit has a service corridor to the rear and shared washroom facilities. The draw is footfall: the boardwalk already connects two residential towers and a planned metro exit, and the developer is offering a three-year rent guarantee on units taken before the end of 2026. Units are being released in three tranches; tranche one is sixty percent sold.', 20, 'planning', 'Dubai Creek Harbour, Dubai', 'Dubai', 'United Arab Emirates', 25.1860000, 55.2620000, 24, 16, 2400000.00, 8900000.00, 'AED', 7.90, 15, '2027-09-30', '2026-01-10', 'Creek Harbour Estates', '50/50 with 3-year rent guarantee on early units', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/93/Kepong%2C_Kuala_Lumpur%2C_Malaysia_%28Unsplash%29.jpg/1920px-Kepong%2C_Kuala_Lumpur%2C_Malaysia_%28Unsplash%29.jpg', 0, 902, 1, 'Creek Harbour Waterfront Retail | Salam Properties', 'A single-storey retail and F&B strip of 24 units along the new creek boardwalk.', '2026-02-14 10:00:00', '2026-01-14 03:00:00', '2026-10-06 11:34:09'),
(6, 'al-hajar-resort-residences', 'Al Hajar Resort Residences', 'A branded resort residence in Ras Al Khaimah with a rental pool and mountain-backed beachfront.', 'A branded resort residence on the Ras Al Khaimah coastline, operated under a management agreement that gives owners a share of the rental pool while retaining personal use of up to sixty nights a year. There are 210 units across a low-rise cluster and a small number of pool villas, with a beach club, three restaurants and a spa. Construction is at thirty-eight percent. The wider emirate is seeing heavy investment in hospitality infrastructure, and entry pricing here sits well below comparable branded stock in Dubai.', 21, 'construction', 'Al Hajar Coast, Ras Al Khaimah', 'Ras Al Khaimah', 'United Arab Emirates', 25.7740000, 55.9710000, 210, 96, 1750000.00, 6800000.00, 'AED', 8.40, 38, '2028-04-30', '2025-06-01', 'Hajar Hospitality Group', '30/70 with optional 5-year rental pool participation', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4b/View_Above_Construction_Site_%28Unsplash%29.jpg/1920px-View_Above_Construction_Site_%28Unsplash%29.jpg', 1, 1024, 1, 'Al Hajar Resort Residences | Salam Properties', 'A branded resort residence in Ras Al Khaimah with a rental pool and mountain-backed beachfront.', '2026-02-14 10:00:00', '2026-01-14 03:00:00', '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) NOT NULL,
  `original_name` varchar(250) DEFAULT NULL,
  `path` varchar(400) NOT NULL,
  `url` varchar(600) NOT NULL,
  `mime` varchar(120) DEFAULT NULL,
  `size` int(10) UNSIGNED DEFAULT NULL,
  `width` smallint(5) UNSIGNED DEFAULT NULL,
  `height` smallint(5) UNSIGNED DEFAULT NULL,
  `alt` varchar(200) DEFAULT NULL,
  `caption` varchar(400) DEFAULT NULL,
  `folder` varchar(120) NOT NULL DEFAULT 'general',
  `uploaded_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `filename`, `original_name`, `path`, `url`, `mime`, `size`, `width`, `height`, `alt`, `caption`, `folder`, `uploaded_by`, `created_at`) VALUES
(1, 'jay-blacks-2017-unsplash-jpg.jpg', 'Jay blacks 2017 (Unsplash).jpg', 'uploads/gallery/1-jay-blacks-2017-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/Jay_blacks_2017_%28Unsplash%29.jpg/1920px-Jay_blacks_2017_%28Unsplash%29.jpg', 'image/jpeg', 572436, 5184, 3456, 'apartment building', 'jay blacks thejayblacks / CC0', 'gallery', 1, '2026-02-02 06:00:00'),
(2, 'red-apartment-building-unsplash-jpg.jpg', 'Red apartment building (Unsplash).jpg', 'uploads/blog/2-red-apartment-building-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1d/Red_apartment_building_%28Unsplash%29.jpg/1920px-Red_apartment_building_%28Unsplash%29.jpg', 'image/jpeg', 539800, 4109, 2739, 'apartment building', 'Echo Grid echogrid / CC0', 'blog', 1, '2026-02-03 06:00:00'),
(3, 'white-apartment-building-unsplash-jpg.jpg', 'White apartment building (Unsplash).jpg', 'uploads/documents/3-white-apartment-building-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d2/White_apartment_building_%28Unsplash%29.jpg/1920px-White_apartment_building_%28Unsplash%29.jpg', 'image/jpeg', 712246, 3346, 4736, 'apartment building', 'Joel Filipe joelfilip / CC0', 'documents', 1, '2026-02-04 06:00:00'),
(4, 'city-office-lights-unsplash-jpg.jpg', 'City office lights (Unsplash).jpg', 'uploads/brand/4-city-office-lights-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c1/City_office_lights_%28Unsplash%29.jpg/1920px-City_office_lights_%28Unsplash%29.jpg', 'image/jpeg', 782445, 3000, 2000, 'office building', 'Vladimir Kudinov / CC0', 'brand', 1, '2026-02-05 06:00:00'),
(5, 'flags-in-an-office-building-unsplash-jpg.jpg', 'Flags in an office building (Unsplash).jpg', 'uploads/properties/5-flags-in-an-office-building-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/Flags_in_an_office_building_%28Unsplash%29.jpg/1920px-Flags_in_an_office_building_%28Unsplash%29.jpg', 'image/jpeg', 687388, 5439, 3626, 'office building', 'Erol Ahmed erol / CC0', 'properties', 1, '2026-02-06 06:00:00'),
(6, 'geometric-office-unsplash-jpg.jpg', 'Geometric office (Unsplash).jpg', 'uploads/gallery/6-geometric-office-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f5/Geometric_office_%28Unsplash%29.jpg/1920px-Geometric_office_%28Unsplash%29.jpg', 'image/jpeg', 715114, 4592, 3448, 'office building', 'Patrick Tomasso impatrickt / CC0', 'gallery', 1, '2026-02-07 06:00:00'),
(7, 'glass-building-corner-unsplash-jpg.jpg', 'Glass building corner (Unsplash).jpg', 'uploads/blog/7-glass-building-corner-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/db/Glass_building_corner_%28Unsplash%29.jpg/1920px-Glass_building_corner_%28Unsplash%29.jpg', 'image/jpeg', 297532, 4896, 3264, 'office building', 'Jonathan Simcoe jdsimcoe / CC0', 'blog', 1, '2026-02-08 06:00:00'),
(8, 'neglected-office-plants-unsplash-jpg.jpg', 'Neglected office plants (Unsplash).jpg', 'uploads/documents/8-neglected-office-plants-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cb/Neglected_office_plants_%28Unsplash%29.jpg/1920px-Neglected_office_plants_%28Unsplash%29.jpg', 'image/jpeg', 558006, 6000, 3999, 'office building', 'Sam X samx / CC0', 'documents', 1, '2026-02-01 06:00:00'),
(9, 'office-building-in-mist-unsplash-jpg.jpg', 'Office building in mist (Unsplash).jpg', 'uploads/brand/9-office-building-in-mist-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f2/Office_building_in_mist_%28Unsplash%29.jpg/1920px-Office_building_in_mist_%28Unsplash%29.jpg', 'image/jpeg', 240606, 5389, 3593, 'office building', 'Fuse Brussels fusebrussels / CC0', 'brand', 1, '2026-02-02 06:00:00'),
(10, 'post-office-wedding-unsplash-jpg.jpg', 'Post office wedding (Unsplash).jpg', 'uploads/properties/10-post-office-wedding-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/Post_office_wedding_%28Unsplash%29.jpg/1920px-Post_office_wedding_%28Unsplash%29.jpg', 'image/jpeg', 556332, 5613, 3717, 'office building', 'Ben White benwhitephotography / CC0', 'properties', 1, '2026-02-03 06:00:00'),
(11, 'staring-out-building-windows-unsplash-jpg.jpg', 'Staring out building windows (Unsplash).jpg', 'uploads/gallery/11-staring-out-building-windows-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a3/Staring_out_building_windows_%28Unsplash%29.jpg/1920px-Staring_out_building_windows_%28Unsplash%29.jpg', 'image/jpeg', 216548, 4355, 2577, 'office building', 'Alex Knight agkdesign / CC0', 'gallery', 1, '2026-02-04 06:00:00'),
(12, 'women-walking-into-the-office-unsplash-jpg.jpg', 'Women walking into the office (Unsplash).jpg', 'uploads/blog/12-women-walking-into-the-office-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6c/Women_walking_into_the_office_%28Unsplash%29.jpg/1920px-Women_walking_into_the_office_%28Unsplash%29.jpg', 'image/jpeg', 522768, 4657, 3105, 'office building', 'Verne Ho verneho / CC0', 'blog', 1, '2026-02-05 06:00:00'),
(13, 'boston-city-skyline-unsplash-jpg.jpg', 'Boston city skyline (Unsplash).jpg', 'uploads/documents/13-boston-city-skyline-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/Boston_city_skyline_%28Unsplash%29.jpg/1920px-Boston_city_skyline_%28Unsplash%29.jpg', 'image/jpeg', 647535, 5763, 3847, 'city skyline', 'Alice Donovan Rouse alicekat / CC0', 'documents', 1, '2026-02-06 06:00:00'),
(14, 'bright-skyline-over-water-unsplash-jpg.jpg', 'Bright skyline over water (Unsplash).jpg', 'uploads/brand/14-bright-skyline-over-water-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/68/Bright_skyline_over_water_%28Unsplash%29.jpg/1920px-Bright_skyline_over_water_%28Unsplash%29.jpg', 'image/jpeg', 334637, 4547, 3031, 'city skyline', 'Osman Rana osmanrana / CC0', 'brand', 1, '2026-02-07 06:00:00'),
(15, 'city-lights-at-night-unsplash-uzgaa9lfnw-jpg.jpg', 'City Lights at Night (Unsplash -uzgaA9LfNw).jpg', 'uploads/properties/15-city-lights-at-night-unsplash-uzgaa9lfnw-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/City_Lights_at_Night_%28Unsplash_-uzgaA9LfNw%29.jpg/1920px-City_Lights_at_Night_%28Unsplash_-uzgaA9LfNw%29.jpg', 'image/jpeg', 445069, 5745, 3830, 'city skyline', 'Alex wong killerfvith / CC0', 'properties', 1, '2026-02-08 06:00:00'),
(16, 'city-of-lights-unsplash-jpg.jpg', 'City of lights (Unsplash).jpg', 'uploads/gallery/16-city-of-lights-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/City_of_lights_%28Unsplash%29.jpg/1920px-City_of_lights_%28Unsplash%29.jpg', 'image/jpeg', 632542, 5869, 3913, 'city skyline', 'Luca Bravo lucabravo / CC0', 'gallery', 1, '2026-02-01 06:00:00'),
(17, 'cloudy-london-skyline-unsplash-jpg.jpg', 'Cloudy London skyline (Unsplash).jpg', 'uploads/blog/17-cloudy-london-skyline-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/62/Cloudy_London_skyline_%28Unsplash%29.jpg/1920px-Cloudy_London_skyline_%28Unsplash%29.jpg', 'image/jpeg', 559131, 4032, 3024, 'city skyline', 'Rob Bye robertbye / CC0', 'blog', 1, '2026-02-02 06:00:00'),
(18, 'qingdao-drone-view-city-with-skyline-unsplash-jpg.jpg', 'Qingdao - Drone view city with skyline (Unsplash).jpg', 'uploads/documents/18-qingdao-drone-view-city-with-skyline-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/Qingdao_-_Drone_view_city_with_skyline_%28Unsplash%29.jpg/1920px-Qingdao_-_Drone_view_city_with_skyline_%28Unsplash%29.jpg', 'image/jpeg', 805348, 3776, 2520, 'city skyline', 'CHO EUNSEONG being_es / CC0', 'documents', 1, '2026-02-03 06:00:00'),
(19, 'view-of-paris-skyline-unsplash-jpg.jpg', 'View of Paris skyline (Unsplash).jpg', 'uploads/brand/19-view-of-paris-skyline-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0a/View_of_Paris_skyline_%28Unsplash%29.jpg/1920px-View_of_Paris_skyline_%28Unsplash%29.jpg', 'image/jpeg', 682450, 4096, 2730, 'city skyline', 'Drew Coffman drewcoffman / CC0', 'brand', 1, '2026-02-04 06:00:00'),
(20, 'woman-in-front-of-skyline-unsplash-jpg.jpg', 'Woman in front of skyline (Unsplash).jpg', 'uploads/properties/20-woman-in-front-of-skyline-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9f/Woman_in_front_of_skyline_%28Unsplash%29.jpg/1920px-Woman_in_front_of_skyline_%28Unsplash%29.jpg', 'image/jpeg', 466693, 4991, 3327, 'city skyline', 'Brooke Cagle brookecagle / CC0', 'properties', 1, '2026-02-05 06:00:00'),
(21, 'angles-in-architecture-unsplash-jpg.jpg', 'Angles in Architecture (Unsplash).jpg', 'uploads/gallery/21-angles-in-architecture-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/54/Angles_in_Architecture_%28Unsplash%29.jpg/1920px-Angles_in_Architecture_%28Unsplash%29.jpg', 'image/jpeg', 456394, 6000, 4000, 'architecture facade', 'Scott Webb scottwebb / CC0', 'gallery', 1, '2026-02-06 06:00:00'),
(22, 'children-backyard-swimming-unsplash-xtokveyhp2s-jpg.jpg', 'Children backyard swimming (Unsplash XtOKVEyHP2s).jpg', 'uploads/blog/22-children-backyard-swimming-unsplash-xtokveyhp2s-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e3/Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg/1920px-Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg', 'image/jpeg', 656771, 4288, 2848, 'swimming pool', 'Brandon Morgan littleppl85 / CC0', 'blog', 1, '2026-02-07 06:00:00'),
(23, 'drone-pool-and-deck-chairs-unsplash-jpg.jpg', 'Drone pool and deck chairs (Unsplash).jpg', 'uploads/documents/23-drone-pool-and-deck-chairs-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e1/Drone_pool_and_deck_chairs_%28Unsplash%29.jpg/1920px-Drone_pool_and_deck_chairs_%28Unsplash%29.jpg', 'image/jpeg', 901731, 2972, 1985, 'swimming pool', 'Tim Gouw punttim / CC0', 'documents', 1, '2026-02-08 06:00:00'),
(24, 'city-in-progress-unsplash-jpg.jpg', 'City in Progress (Unsplash).jpg', 'uploads/brand/24-city-in-progress-unsplash-jpg.jpg', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/City_in_Progress_%28Unsplash%29.jpg/1920px-City_in_Progress_%28Unsplash%29.jpg', 'image/jpeg', 1105742, 4093, 2728, 'construction site', 'Christy Ash izelle / CC0', 'brand', 1, '2026-02-01 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(160) NOT NULL,
  `title` varchar(200) NOT NULL,
  `template` varchar(60) NOT NULL DEFAULT 'default',
  `content` mediumtext DEFAULT NULL,
  `excerpt` varchar(500) DEFAULT NULL,
  `featured_image` varchar(600) DEFAULT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `show_in_menu` tinyint(1) NOT NULL DEFAULT 0,
  `menu_label` varchar(80) DEFAULT NULL,
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `views_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `template`, `content`, `excerpt`, `featured_image`, `status`, `show_in_menu`, `menu_label`, `menu_order`, `meta_title`, `meta_description`, `views_count`, `created_by`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'about-us', 'About Salam Properties', 'about', 'skyline', 'About Us', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6c/Women_walking_into_the_office_%28Unsplash%29.jpg/1920px-Women_walking_into_the_office_%28Unsplash%29.jpg', 'published', 1, 'We are an independent Dubai brokerage built around advice rather than inventory.', 1, 'About Salam Properties - Salam Properties', 'About Us', 2568, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09'),
(2, 'contact', 'Contact Us', 'contact', 'exterior', 'Contact', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/54/Angles_in_Architecture_%28Unsplash%29.jpg/1920px-Angles_in_Architecture_%28Unsplash%29.jpg', 'published', 1, 'Speak to an advisor in Dubai - phone, WhatsApp or the form below.', 2, 'Contact Salam Properties', 'Contact', 2804, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09'),
(3, 'faq', 'Frequently Asked Questions', 'default', 'signage', 'FAQ', 'https://live.staticflickr.com/5241/5330817446_e227a759ae_b.jpg', 'published', 0, 'Answers to the questions we are asked most often before a viewing.', 3, 'FAQ | Salam Properties', 'FAQ', 2080, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09'),
(4, 'privacy-policy', 'Privacy Policy', 'default', 'interior', 'Privacy', 'https://live.staticflickr.com/6092/6314795544_57101c768e_b.jpg', 'published', 0, 'How we collect, use and protect personal information.', 4, 'Privacy Policy | Salam Properties', 'Privacy', 438, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09'),
(5, 'terms-and-conditions', 'Terms & Conditions', 'default', 'blueprint', 'Terms', 'https://live.staticflickr.com/4037/4428355645_8f5fc0615e_b.jpg', 'published', 0, 'The terms governing use of this website and our services.', 5, 'Terms & Conditions | Salam Properties', 'Terms', 898, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09'),
(6, 'careers', 'Careers', 'default', 'people', 'Careers', 'https://live.staticflickr.com/228/483421253_efe2287f4d_b.jpg', 'published', 0, 'Open roles at Salam Properties in Dubai.', 6, 'Careers | Salam Properties', 'Careers', 1352, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09'),
(7, 'advisory-process', 'Our Advisory Process', 'default', 'blueprint', 'Process', 'https://live.staticflickr.com/4121/4937533944_b5d82db730_b.jpg', 'published', 0, 'The five stages we take every client through, from brief to handover.', 7, 'Our Advisory Process | Salam Properties', 'Process', 2274, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09'),
(8, 'not-found', 'Page Not Found', 'default', 'signage', '404', 'https://live.staticflickr.com/3013/2830785109_b508009d2b_b.jpg', 'published', 0, 'The page you were looking for is not here.', 8, 'Page Not Found | Salam Properties', '404', 314, 1, '2026-01-20 10:00:00', '2026-01-10 04:00:00', '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(180) NOT NULL,
  `title` varchar(220) NOT NULL,
  `excerpt` varchar(500) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `cover_image` varchar(600) DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `tags` varchar(300) DEFAULT NULL,
  `status` enum('draft','published','archived') NOT NULL DEFAULT 'draft',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `views_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reading_time` tinyint(3) UNSIGNED NOT NULL DEFAULT 4,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `slug`, `title`, `excerpt`, `content`, `cover_image`, `category_id`, `author_id`, `tags`, `status`, `is_featured`, `views_count`, `reading_time`, `meta_title`, `meta_description`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'dubai-property-market-outlook-2026', 'Dubai Property Market Outlook: What the 2026 Numbers Actually Say', 'Transaction volumes, days on market and the supply pipeline - separated from the headlines.', '## The headline numbers\\n\\nDubai recorded another year of elevated transaction volume, but the more useful signal is in the composition. Ready property accounted for a growing share of sales compared with the previous cycle, which usually means occupier demand rather than pure speculation. Average days on market tightened for apartments and lengthened slightly for villas above AED 10 million.\\n\\n## Where the supply is\\n\\nThe pipeline is concentrated in two corridors: Dubai Creek Harbour and Mohammed Bin Rashid City. Both are being delivered in tranches rather than en masse, which softens the usual impact on rents. Watch the handover calendar for Q3 - if several towers land together, expect a short-term dip in the rental comparables for that district.\\n\\n## What we are telling clients\\n\\n- For end users, the negotiating room is in the older stock, not the launches.\\n- For investors, service charge discipline separates a 6% net from a 4% net faster than purchase price does.\\n- For landlords, realistic pricing in the first two weeks beats chasing the market for two months.\\n\\n## The risk nobody prices\\n\\nExit liquidity varies enormously by building. Two towers with identical specifications can differ by six months on resale purely because one has an active secondary market and the other does not. Ask for the transaction history of the specific building, not the community average.', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/89/Rooftop_views_with_dad_%28Unsplash%29.jpg/1920px-Rooftop_views_with_dad_%28Unsplash%29.jpg', 12, 2, 'dubai,market,2026', 'published', 1, 4857, 3, 'Dubai Property Market Outlook: What the 2026 Numbers Actually Say | Salam Properties', 'Transaction volumes, days on market and the supply pipeline - separated from the headlines.', '2026-02-11 09:30:00', '2026-02-02 03:00:00', '2026-10-25 05:44:35'),
(2, 'off-plan-vs-ready', 'Off-Plan or Ready: A Framework, Not an Opinion', 'Four questions that decide which route fits your situation - and one that decides the risk.', '## Question one: when do you need it?\\n\\nIf you need to occupy within twelve months, the discussion is effectively over. Off-plan is a capital allocation decision with a multi-year horizon; treating it as housing is how people get into trouble.\\n\\n## Question two: what is your payment capacity?\\n\\nA 60/40 plan is only attractive if the final 40% is genuinely available at handover. Model the worst case: completion delayed six months, valuation flat, financing tighter than today.\\n\\n## Question three: who is behind it?\\n\\nDelivery track record matters more than the render. Look at what the developer completed in the last cycle and how close those handovers were to the promised date.\\n\\n## Question four: what is the exit?\\n\\nOff-plan resale requires developer NOC and often a minimum equity release. If you may need liquidity in year three, run that scenario before signing.\\n\\n## The risk question\\n\\nOff-plan carries construction and counterparty risk and usually compensates you for it. Ready carries immediate and transparent risk and usually does not. Neither is cheaper - they are simply priced differently.', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e8/Worker_at_the_old_Othon_palace_hotel_%28Unsplash%29.jpg/1920px-Worker_at_the_old_Othon_palace_hotel_%28Unsplash%29.jpg', 13, 3, 'guides,property', 'published', 0, 5159, 3, 'Off-Plan or Ready: A Framework, Not an Opinion | Salam Properties', 'Four questions that decide which route fits your situation - and one that decides the risk.', '2026-03-12 09:30:00', '2026-03-03 03:00:00', '2026-10-25 05:47:14'),
(3, 'golden-visa-property-investment', 'Golden Visa Through Property: What Actually Qualifies', 'Thresholds, expiry, dependants and the mistakes that cost people their status.', '## The threshold\\n\\nThe ten-year Golden Visa is available on qualifying property, and the required value has been adjusted over time. What matters is the value recorded on the title deed at the point of application, not the price you negotiated.\\n\\n## Mortgage and joint ownership\\n\\n mortgaged property can qualify under certain conditions with a bank letter. Joint ownership has its own rules around each applicant share - get this checked before you assume it works.\\n\\n## Dependants\\n\\nA holder can sponsor a spouse, children, and in most cases parents. Dependant visas are tied to the principal holder, so plan the renewal cycle as a family rather than individually.\\n\\n## The mistakes we see\\n\\n- Applying on an off-plan unit before the criteria for that stage are met.\\n- Letting the property status lapse without checking the renewal window.\\n- Assuming a status acquired once can never be withdrawn.\\n\\nTake advice specific to your file. Rules here move faster than most people expect.', 'https://live.staticflickr.com/1763/29521114658_c2864c1acf_b.jpg', 16, 1, 'legal,finance,uae', 'published', 1, 2821, 3, 'Golden Visa Through Property: What Actually Qualifies | Salam Properties', 'Thresholds, expiry, dependants and the mistakes that cost people their status.', '2026-04-13 09:30:00', '2026-04-04 03:00:00', '2026-10-25 06:36:34'),
(4, 'staging-a-villa-for-a-quick-sale', 'How to Stage a Villa So It Sells in Two Weeks', 'A room-by-room plan that costs less than one month of mortgage interest.', '## Start with the exterior\\n\\nBuyers form an opinion before they open the door. Pressure-wash the drive, cut the hedge back from the path, and put out two matching planters. It is the cheapest work you will do and it returns the most.\\n\\n## The entrance\\n\\nClear the console table. One lamp, one tray, nothing else. If the hallway is dark, change the bulbs to a warmer 2700K and increase the wattage within the fitting rating.\\n\\n## Living room\\n\\nArrange furniture so there is a clear path from the doorway to the window - people walk to light. Remove a third of what is on the shelves. Fold the throws.\\n\\n## Kitchen\\n\\nEmpty the counters except for a bowl of lemons and the coffee setup. Clean the extractor filter. Fix the drip under the sink; a buyer will notice it and read it as deferred maintenance everywhere else.\\n\\n## Bedrooms\\n\\nLinen in a neutral tone, curtains matching across windows, and nothing on the floor. If a room is used for storage, rent a unit for a month - it costs less than the price reduction you will otherwise accept.\\n\\n## The numbers\\n\\nStaging a villa typically runs a few thousand dirhams against a reduction that is usually tens of thousands.', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bd/Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg/1920px-Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg', 15, 2, 'guides,property', 'published', 0, 4422, 3, 'How to Stage a Villa So It Sells in Two Weeks | Salam Properties', 'A room-by-room plan that costs less than one month of mortgage interest.', '2026-05-14 09:30:00', '2026-05-05 03:00:00', '2026-10-25 06:06:19'),
(5, 'understanding-service-charges', 'Understanding Service Charges Before You Buy', 'Why two identical units can cost very different amounts to own, every single year.', '## What you are paying for\\n\\nService charges cover common area maintenance, building insurance, lift servicing, chiller contracts where applicable, and the reserve fund. In a villa community they cover landscaping, security and shared amenities.\\n\\n## The number that matters\\n\\nAsk for dirhams per square foot, then multiply by the unit size. AED 18 per sq ft on 1,400 sq ft is AED 25,200 a year. On a studio that looks cheap and on a penthouse that does not.\\n\\n## Why identical units differ\\n\\nDifferent buildings sit with different management companies, different chiller arrangements and different reserve fund policies. Two towers side by side can differ by five dirhams per square foot.\\n\\n## What to request\\n\\n- The approved budget for the current year, not last year.\\n- The reserve fund balance.\\n- Any outstanding service charge debt on the specific unit.\\n- Whether the chiller is district cooled or owner-operated.\\n\\nA large arrears balance follows the unit, not the seller.', 'https://live.staticflickr.com/3385/3338169165_a8cb9dd019_b.jpg', 16, 3, 'legal,finance,uae', 'published', 0, 1132, 3, 'Understanding Service Charges Before You Buy | Salam Properties', 'Why two identical units can cost very different amounts to own, every single year.', '2026-06-15 09:30:00', '2026-06-06 03:00:00', '2026-10-25 06:37:02'),
(6, 'renting-in-dubai-tenant-rights', 'Renting in Dubai: A Tenant Rights Checklist', 'Registration, notices, deposits and the four things landlords cannot do.', '## Register it\\n\\nEjari registration is required for most residential leases and is your evidence of the contract. Keep the certificate, not just the PDF someone emailed you.\\n\\n## Rent increases\\n\\nIncreases are governed by a published index, not by market anecdote. When your renewal notice arrives, check the index for your community before accepting or countering.\\n\\n## The notice window\\n\\nNotice periods run in both directions and are strict. A landlord who misses the window may lose the right to increase or not renew for that cycle.\\n\\n## Deposit and deductions\\n\\nThe deposit is refundable subject to fair wear and tear. Normalised use is not damage - a scratched tile in a five-year-old kitchen is not your liability.\\n\\n## What a landlord cannot do\\n\\n- Enter without proper notice except in a genuine emergency.\\n- Cut utilities to enforce payment.\\n- Change the locks during the tenancy.\\n- Add occupants who are not on the contract without agreement.\\n\\nIf something goes wrong, start with the written record. Almost every dispute turns on who kept the messages.', 'https://live.staticflickr.com/2940/14656366473_59b104d382_b.jpg', 16, 1, 'legal,finance,uae', 'published', 0, 513, 3, 'Renting in Dubai: A Tenant Rights Checklist | Salam Properties', 'Registration, notices, deposits and the four things landlords cannot do.', '2026-07-16 09:30:00', '2026-07-07 03:00:00', '2026-10-06 11:34:09'),
(7, 'strongest-yields-this-quarter', 'Where Yields Are Strongest This Quarter', 'Gross looks impressive; net is what pays for the asset. A district-by-district read.', '## The method\\n\\nWe look at achievable rent, not asking rent, subtract service charges and a realistic vacancy allowance, then divide by total acquisition cost including transfer fees. Anything quoted without that sequence is marketing.\\n\\n## Apartments\\n\\nStudios and one-bedroom units in established mid-market communities continue to post the strongest net figures, largely because the service charge burden per unit is modest and the tenant pool is deep. Expect net figures to land in the six to seven percent range for a well-bought unit.\\n\\n## Villas\\n\\nVilla yields are lower but the tenant profile is longer-lived, which reduces turnover cost. Family villas near schools remain the most resilient segment we track.\\n\\n## Commercial\\n\\nCommercial can screen higher, but the vacancy risk and fit-out assumptions are real. Treat any commercial yield that looks twenty percent better than residential with suspicion and ask what happens at lease break.\\n\\n## What we are avoiding\\n\\nOver-supplied towers with high service charges, buildings with thin secondary markets, and payment plans that require more capital at handover than the asset is worth on day one.', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1e/Skyscrapers_and_traffic_in_city_%28Unsplash%29.jpg/1920px-Skyscrapers_and_traffic_in_city_%28Unsplash%29.jpg', 14, 2, 'guides,property', 'published', 1, 1655, 3, 'Where Yields Are Strongest This Quarter | Salam Properties', 'Gross looks impressive; net is what pays for the asset. A district-by-district read.', '2026-08-17 09:30:00', '2026-08-08 03:00:00', '2026-10-25 06:37:19'),
(8, 'first-home-uae-guide', 'Buying Your First Home in the UAE: The Whole Sequence', 'From pre-approval to title deed, with the realistic timeline at each step.', '## Before you look\\n\\nGet a mortgage pre-approval first. It tells you your actual ceiling, and it means when you find the right property you can move. Budget an extra ten percent beyond the purchase price for fees and setup.\\n\\n## Costs people forget\\n\\nDLD transfer at four percent, agency commission, trustee office fee, mortgage registration if applicable, and then furnishing, DEWA deposits and moving costs. On a first purchase the total friction can reach nine or ten percent of price.\\n\\n## The sequence\\n\\n1. Pre-approval.\\n2. Offer and LOI.\\n3. Deposit with the seller or developer.\\n4. NOC from the landlord or developer.\\n5. Finance release.\\n6. Trustee appointment and transfer.\\n7. Title deed in your name.\\n\\n## Realistic timing\\n\\nWith finance: four to six weeks from accepted offer. Cash: as little as one week if the NOC is straightforward. Off-plan direct from a developer can complete in a day or two because there is no NOC stage.\\n\\n## One piece of advice\\n\\nVisit the specific building at different times of day. The most common regret we hear is about noise or parking, and neither shows up in a listing.', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Looking_NW_at_Chemistry_and_Biochemistry_Building_-_Montana_State_University_-_2013-07-09.jpg/1920px-Looking_NW_at_Chemistry_and_Biochemistry_Building_-_Montana_State_University_-_2013-07-09.jpg', 13, 3, 'guides,property', 'published', 0, 299, 3, 'Buying Your First Home in the UAE: The Whole Sequence | Salam Properties', 'From pre-approval to title deed, with the realistic timeline at each step.', '2026-01-18 09:30:00', '2026-01-01 03:00:00', '2026-10-25 05:44:59'),
(9, 'what-tenants-want-difc', 'What Tenants Actually Want in DIFC Right Now', 'Fit-out grade, floor efficiency and the amenities moving the needle with professional services firms.', '## Floor efficiency\\n\\nThe question every tenant asks first is the net-to-gross ratio. A floor plate with a deep core and a wide perimeter lease will out-let a more attractive space with a poor ratio, every time.\\n\\n## Fit-out grade\\n\\nGrade-A base build is now the minimum expectation for financial and legal tenants. What differentiates is the second-fix: ceiling height, acoustic separation between offices and the quality of the reception sequence.\\n\\n## Building amenities\\n\\nEnd-of-trip facilities, bookable meeting rooms and a managed conference centre have moved from nice-to-have to shortlist criteria. Tenants are using them to justify smaller own-floor footprints.\\n\\n## Parking\\n\\nRatio remains a deal point. Below one bay per 800 sq ft of office area, tenants start to push back, particularly where client meetings are frequent.\\n\\n## What we are telling landlords\\n\\nDo not compete on rent alone against newer stock you cannot beat on specification. Compete on ratio, amenity and parking, and hold the rent.', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Bonn%2C_Post-Tower_--_2017_--_2121.jpg/1920px-Bonn%2C_Post-Tower_--_2017_--_2121.jpg', 18, 1, 'guides,property', 'published', 0, 4249, 3, 'What Tenants Actually Want in DIFC Right Now | Salam Properties', 'Fit-out grade, floor efficiency and the amenities moving the needle with professional services firms.', '2026-02-19 09:30:00', '2026-02-02 03:00:00', '2026-10-06 11:34:09'),
(10, 'smart-home-features-buyers-pay-for', 'Smart-Home Features Buyers Actually Pay For', 'Which upgrades return value in this market, and which are money spent on your own convenience.', '## What returns money\\n\\nZoned air-conditioning control with scheduling pays back because it reduces a bill people notice. Motorised blackout in bedrooms reads as luxury in a viewing. Good lighting scenes in a living room change how the space photographs and how it feels at an evening viewing.\\n\\n## What does not\\n\\nFully integrated proprietary systems that lock the next owner into one manufacturer. Voice assistants wired permanently into the fabric. Novelty gadgets that will look dated in three years.\\n\\n## The photography effect\\n\\nThis is underrated. A property that photographs warmly sells faster than an identical property shot under flat ceiling light. Scenes and dimming cost a fraction of a price reduction.\\n\\n## Where to stop\\n\\nStop at the point where the technology stops being invisible. The best smart home is one the buyer never has to think about: correct temperature, correct light, no manual intervention.', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1f/Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg/1920px-Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg', 15, 2, 'guides,property', 'published', 0, 376, 3, 'Smart-Home Features Buyers Actually Pay For | Salam Properties', 'Which upgrades return value in this market, and which are money spent on your own convenience.', '2026-03-20 09:30:00', '2026-03-03 03:00:00', '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(180) NOT NULL,
  `ref_no` varchar(30) NOT NULL,
  `title` varchar(220) NOT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `listing_type` enum('sale','rent','off-plan','short-term') NOT NULL DEFAULT 'sale',
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `purpose` enum('residential','commercial','industrial','land') NOT NULL DEFAULT 'residential',
  `price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `price_from` decimal(16,2) DEFAULT NULL,
  `price_to` decimal(16,2) DEFAULT NULL,
  `price_per_sqm` decimal(12,2) DEFAULT NULL,
  `currency` char(3) NOT NULL DEFAULT 'AED',
  `price_on_request` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(120) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'United Arab Emirates',
  `lat` decimal(10,7) DEFAULT NULL,
  `lng` decimal(10,7) DEFAULT NULL,
  `bedrooms` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `bathrooms` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `area_indoor` decimal(12,2) DEFAULT NULL,
  `area_land` decimal(12,2) DEFAULT NULL,
  `area_unit` enum('sqft','sqm') NOT NULL DEFAULT 'sqft',
  `year_built` smallint(5) UNSIGNED DEFAULT NULL,
  `floors` tinyint(3) UNSIGNED DEFAULT NULL,
  `garages` tinyint(3) UNSIGNED DEFAULT NULL,
  `parking` tinyint(3) UNSIGNED DEFAULT NULL,
  `furnishing` enum('unfurnished','semi-furnished','furnished') DEFAULT 'unfurnished',
  `amenities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`amenities`)),
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `status` enum('draft','pending','published','archived') NOT NULL DEFAULT 'draft',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_exclusive` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `views_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inquiries_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `slug`, `ref_no`, `title`, `summary`, `description`, `listing_type`, `category_id`, `purpose`, `price`, `price_from`, `price_to`, `price_per_sqm`, `currency`, `price_on_request`, `address`, `city`, `area`, `country`, `lat`, `lng`, `bedrooms`, `bathrooms`, `area_indoor`, `area_land`, `area_unit`, `year_built`, `floors`, `garages`, `parking`, `furnishing`, `amenities`, `features`, `status`, `is_featured`, `is_exclusive`, `is_verified`, `views_count`, `inquiries_count`, `agent_id`, `created_by`, `meta_title`, `meta_description`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'marina-gate-residence-42', 'SP-1042', 'Marina Gate Residence 42', 'Two-bedroom corner residence with full marina and sea views, floor-to-ceiling glazing and a private balcony.', 'Perched on the 42nd floor of Marina Gate, this corner residence captures uninterrupted views of the marina, the Palm and the open sea. The layout opens from a marble foyer into an open-plan living space framed by floor-to-ceiling glass, with a Bulthaup kitchen, integrated Miele appliances and smart-home controls throughout. Both bedrooms are en-suite; the principal suite adds a walk-in dressing room and a private balcony positioned for sunset. Residents enjoy a 50-metre infinity pool, a sky gym, concierge, 24-hour security and direct access to Dubai Marina Walk.', 'sale', 1, 'residential', 3450000.00, NULL, NULL, 2323.23, 'AED', 0, 'Marina Gate, Dubai Marina', 'Dubai', 'Dubai Marina', 'United Arab Emirates', 25.0805000, 55.1403000, 2, 3, 1485.00, NULL, 'sqft', 2019, NULL, NULL, NULL, 'furnished', '[\"Swimming pool\",\"Gym\",\"Concierge\",\"Covered parking\",\"Balcony\",\"Smart home\",\"Sea view\",\"24/7 security\"]', '[\"Corner unit\",\"Floor-to-ceiling glass\",\"Miele appliances\",\"Marble flooring\",\"Walk-in closet\"]', 'published', 1, 1, 1, 73, 9, 1, 1, 'Marina Gate Residence 42 | Salam Properties', 'Two-bedroom corner residence with full marina and sea views, floor-to-ceiling glazing and a private balcony.', '2026-02-12 10:00:00', '2026-02-02 03:00:00', '2026-10-06 12:15:38'),
(2, 'palm-jumeirah-signature-villa', 'SP-1078', 'Palm Jumeirah Signature Villa', 'Beachfront frond villa with 90 feet of private shoreline, private pool and staff quarters.', 'One of the largest residences on Frond G, this villa was reimagined by a Milanese studio in 2023 and now runs the full length of its plot to a private beach. A double-height entrance gives way to travertine floors, a sunken lounge and a show kitchen paired with a concealed prep kitchen. Upstairs, six bedrooms each open to the water; the principal suite occupies the entire sea-facing wing. Outside: a 16-metre infinity pool, shaded dining pavilion, jet-ski garage and staff accommodation. Full beach access and a private mooring are included.', 'sale', 2, 'residential', 28500000.00, NULL, NULL, 2908.16, 'AED', 0, 'Frond G, Palm Jumeirah', 'Dubai', 'Palm Jumeirah', 'United Arab Emirates', 25.1124000, 55.1390000, 6, 7, 9800.00, 12400.00, 'sqft', 2016, NULL, NULL, NULL, 'semi-furnished', '[\"Private beach\",\"Private pool\",\"Maid room\",\"Driver room\",\"BBQ area\",\"Smart home\",\"Beach access\",\"Garden\"]', '[\"Private shoreline\",\"Travertine floors\",\"Two kitchens\",\"Home cinema\",\"Private mooring\"]', 'published', 1, 1, 1, 192, 4, 1, 1, 'Palm Jumeirah Signature Villa | Salam Properties', 'Beachfront frond villa with 90 feet of private shoreline, private pool and staff quarters.', '2026-03-13 10:00:00', '2026-03-03 03:00:00', '2026-10-06 11:34:09'),
(3, 'opera-district-sky-loft', 'SP-1103', 'Opera District Sky Loft', 'Double-height loft above the Dubai Opera with Burj Khalifa views from every room.', 'A rare double-height loft on the 18th floor of Boulevard Point, positioned directly above the Dubai Opera forecourt. The living volume rises a full six metres, with a floating steel-and-oak stair leading to a mezzanine study. Every opening frames either the Burj Khalifa or the opera house; in the evening the fountains play across the glass. Delivered fully furnished with bespoke joinery, a Smeg kitchen and blackout automation. The building offers a residents lounge, temperature-controlled pool and a five-minute walk to Dubai Mall.', 'sale', 6, 'residential', 2150000.00, NULL, NULL, 1919.64, 'AED', 0, 'Boulevard Point, Downtown Dubai', 'Dubai', 'Downtown Dubai', 'United Arab Emirates', 25.1960000, 55.2740000, 1, 2, 1120.00, NULL, 'sqft', 2020, NULL, NULL, NULL, 'furnished', '[\"Burj Khalifa view\",\"Fountain view\",\"Pool\",\"Gym\",\"Concierge\",\"Furnished\",\"Maids room\"]', '[\"Double-height ceiling\",\"Mezzanine study\",\"Bespoke joinery\",\"Blackout automation\"]', 'published', 0, 0, 1, 488, 0, 1, 1, 'Opera District Sky Loft | Salam Properties', 'Double-height loft above the Dubai Opera with Burj Khalifa views from every room.', '2026-04-14 10:00:00', '2026-04-04 03:00:00', '2026-10-06 11:34:09'),
(4, 'business-bay-executive-suite', 'SP-1119', 'Business Bay Executive Suite', 'Fully furnished two-bedroom suite on the canal with dedicated parking and weekly housekeeping.', 'A turnkey executive rental on the 27th floor, overlooking the Dubai Water Canal and the downtown skyline. The apartment is offered fully furnished to a hotel standard, with a fitted kitchen, study nook, en-suite principal bedroom and a covered bay for two cars. Building facilities include a rooftop infinity pool, gym, spa, kids play area and 24-hour concierge. Rent includes chilled DEWA, internet and weekly housekeeping; available on a 12-month contract with a single cheque discount.', 'rent', 1, 'residential', 165000.00, NULL, NULL, NULL, 'AED', 0, 'Peninsula Four, Business Bay', 'Dubai', 'Business Bay', 'United Arab Emirates', 25.1860000, 55.2620000, 2, 3, 1610.00, NULL, 'sqft', 2021, NULL, NULL, NULL, 'furnished', '[\"Canal view\",\"Furnished\",\"Rooftop pool\",\"Gym\",\"Spa\",\"Concierge\",\"Covered parking\",\"Weekly housekeeping\"]', '[\"Hotel-standard furnishing\",\"Dual parking\",\"Chilled DEWA included\"]', 'published', 0, 0, 1, 264, 1, 1, 1, 'Business Bay Executive Suite | Salam Properties', 'Fully furnished two-bedroom suite on the canal with dedicated parking and weekly housekeeping.', '2026-05-15 10:00:00', '2026-05-05 03:00:00', '2026-10-06 11:34:09'),
(5, 'jbr-sea-view-residence', 'SP-1156', 'JBR Sea View Residence', 'Three-bedroom apartment opening straight onto The Walk with an unbroken sea view.', 'Sadaf 4 sits on the beach edge of JBR, and this three-bedroom unit takes the whole sea-facing corner. The living room and all three bedrooms look west over the Gulf, with a wrap-around balcony long enough to dine on. Inside: a renovated kitchen, marble baths, integrated wardrobes and zoned air-conditioning. Step out of the lobby and you are on The Walk, with the tram, The Beach at JBR and Bluewaters a few minutes away. Strong short-term rental history if the buyer wants income rather than a primary home.', 'sale', 1, 'residential', 6200000.00, NULL, NULL, 2767.86, 'AED', 0, 'Sadaf 4, JBR', 'Dubai', 'Jumeirah Beach Residence', 'United Arab Emirates', 25.0760000, 55.1320000, 3, 4, 2240.00, NULL, 'sqft', 2007, NULL, NULL, NULL, 'furnished', '[\"Sea view\",\"Beach access\",\"Balcony\",\"Furnished\",\"Gym\",\"Pool\",\"Public transport\"]', '[\"Corner unit\",\"Wrap-around balcony\",\"Renovated kitchen\",\"Proven rental history\"]', 'published', 1, 1, 1, 551, 13, 1, 1, 'JBR Sea View Residence | Salam Properties', 'Three-bedroom apartment opening straight onto The Walk with an unbroken sea view.', '2026-06-16 10:00:00', '2026-06-06 03:00:00', '2026-10-06 11:34:09'),
(6, 'dubai-hills-grove-townhouse', 'SP-1177', 'Dubai Hills Grove Townhouse', 'Four-bedroom townhouse on a park-facing plot with a landscaped garden and family suite.', 'A park-facing townhouse in Grove Village, one of the quieter clusters in Dubai Hills Estate. The plot backs directly onto the community green so there is no rear neighbour; the garden has mature palms, a shaded deck and room for a pool. Inside, the ground floor is a single living-and-dining volume with a guest suite, while the upper floor holds three bedrooms and a family lounge. A fourth bedroom with its own entrance works well as a home office. Walking distance to Dubai Hills School and the mall.', 'sale', 3, 'residential', 6900000.00, NULL, NULL, 1890.41, 'AED', 0, 'Grove Village 3, Dubai Hills', 'Dubai', 'Dubai Hills Estate', 'United Arab Emirates', 25.0960000, 55.2130000, 4, 5, 3650.00, 4400.00, 'sqft', 2021, NULL, NULL, NULL, 'unfurnished', '[\"Park view\",\"Garden\",\"Maid room\",\"Covered parking\",\"Community park\",\"Gym\",\"Playground\"]', '[\"No rear neighbour\",\"Landscaped garden\",\"Home office suite\",\"Walking distance to school\"]', 'published', 0, 0, 1, 605, 7, 1, 1, 'Dubai Hills Grove Townhouse | Salam Properties', 'Four-bedroom townhouse on a park-facing plot with a landscaped garden and family suite.', '2026-07-17 10:00:00', '2026-07-07 03:00:00', '2026-10-06 11:34:09'),
(7, 'city-walk-atelier-studio', 'SP-1188', 'City Walk Atelier Studio', 'Furnished studio in the heart of City Walk with a private terrace and boutique retail downstairs.', 'A compact, light-filled studio in City Walk Building 11, delivered furnished and ready to occupy or let. The private terrace faces the inner boulevard, giving a green outlook without traffic noise. Steps from Patagonia, The Green Planet and a growing cluster of design studios, this is one of the most walkable addresses in Dubai. The building has a rooftop pool, gym and security, and the unit has consistently let within two weeks of listing.', 'sale', 5, 'residential', 1450000.00, NULL, NULL, 2101.45, 'AED', 0, 'Building 11, City Walk', 'Dubai', 'City Walk', 'United Arab Emirates', 25.2040000, 55.2620000, 0, 1, 690.00, NULL, 'sqft', 2018, NULL, NULL, NULL, 'furnished', '[\"Terrace\",\"Furnished\",\"Pool\",\"Gym\",\"Retail downstairs\",\"24/7 security\"]', '[\"Private terrace\",\"High letting demand\",\"Walkable location\"]', 'published', 0, 0, 1, 125, 9, 1, 1, 'City Walk Atelier Studio | Salam Properties', 'Furnished studio in the heart of City Walk with a private terrace and boutique retail downstairs.', '2026-08-18 10:00:00', '2026-08-08 03:00:00', '2026-10-06 11:34:09'),
(8, 'al-barsha-garden-villa', 'SP-1204', 'Al Barsha Garden Villa', 'Extended four-bedroom villa with a renovated kitchen, shaded majlis and mature garden.', 'A well-kept family villa that has been extended and renovated twice, most recently in 2023. The ground floor now runs as one connected living space with a new Italian kitchen, and a shaded majlis sits off the entrance for receiving guests separately from the family wing. Four bedrooms upstairs, all with fitted wardrobes, plus a driver room and maid room at the rear. The garden is mature and irrigated, with a 30-foot pool and a covered carport for four. Umm Suqeim 1 school and Al Barsha Souk are both under ten minutes.', 'sale', 2, 'residential', 5100000.00, NULL, NULL, 1186.05, 'AED', 0, 'Villa 27, Al Barsha South 2', 'Dubai', 'Al Barsha South', 'United Arab Emirates', 25.1480000, 55.2210000, 4, 5, 4300.00, 6100.00, 'sqft', 2012, NULL, NULL, NULL, 'unfurnished', '[\"Swimming pool\",\"Majlis\",\"Maid room\",\"Driver room\",\"Garden\",\"Covered parking\",\"Renovated kitchen\"]', '[\"2023 renovation\",\"Shaded majlis\",\"Irrigated garden\",\"Four-car carport\"]', 'published', 0, 0, 1, 504, 0, 1, 1, 'Al Barsha Garden Villa | Salam Properties', 'Extended four-bedroom villa with a renovated kitchen, shaded majlis and mature garden.', '2026-09-19 10:00:00', '2026-09-09 03:00:00', '2026-10-06 11:34:09'),
(9, 'difc-prestige-office-floor', 'SP-1233', 'DIFC Prestige Office Floor', 'Whole-floor office in Gate Village with DIFC registration support and skyline views.', 'A full floor of 5,200 sq ft in Gate Village 7, one of the DIFC addresses most requested by funds, family offices and legal practices. The floor plate is open with a glazed perimeter on all four sides, a fitted reception, four partner offices and a boardroom for sixteen. The building holds a Green Building certification and provides 24-hour access control. Sale is subject to DIFC authority approval, which we manage end to end. Optional furnished fit-out can be negotiated separately.', 'sale', 7, 'commercial', 4800000.00, NULL, NULL, 923.08, 'AED', 0, 'Gate Village 7, DIFC', 'Dubai', 'DIFC', 'United Arab Emirates', 25.2110000, 55.2790000, 0, 4, 5200.00, NULL, 'sqft', 2008, NULL, NULL, NULL, 'unfurnished', '[\"DIFC registered\",\"Boardroom\",\"Reception\",\"24/7 access\",\"Green building\",\"Fitted out\"]', '[\"Whole floor plate\",\"Four-sided glazing\",\"Managed authority approval\"]', 'published', 1, 1, 1, 134, 12, 1, 1, 'DIFC Prestige Office Floor | Salam Properties', 'Whole-floor office in Gate Village with DIFC registration support and skyline views.', '2026-01-11 10:00:00', '2026-01-01 03:00:00', '2026-10-06 11:34:09'),
(10, 'mirdif-courtyard-villa', 'SP-1247', 'Mirdif Courtyard Villa', 'Three-bedroom villa arranged around a private courtyard with a shaded family terrace.', 'Uptown Mirdif villas are known for their courtyards, and this one has been carefully maintained. The house wraps around a tiled central court that keeps the ground floor cool and gives every room a green outlook. Three bedrooms plus a study, a closed kitchen, laundry and store rooms, and a shaded terrace off the majlis. The community has a pool, playground and mosque, and Dubai International Airport is seven minutes away.', 'sale', 2, 'residential', 4350000.00, NULL, NULL, 1279.41, 'AED', 0, 'Villa 12, Mirdif Uptown', 'Dubai', 'Mirdif', 'United Arab Emirates', 25.1560000, 55.2470000, 3, 4, 3400.00, 4800.00, 'sqft', 2010, NULL, NULL, NULL, 'unfurnished', '[\"Courtyard\",\"Shaded terrace\",\"Study\",\"Pool\",\"Playground\",\"Mosque nearby\"]', '[\"Private courtyard\",\"Airport proximity\",\"Community pool\"]', 'published', 0, 0, 1, 211, 0, 1, 1, 'Mirdif Courtyard Villa | Salam Properties', 'Three-bedroom villa arranged around a private courtyard with a shaded family terrace.', '2026-02-12 10:00:00', '2026-02-02 03:00:00', '2026-10-06 11:34:09'),
(11, 'creek-harbour-sky-residence', 'SP-1261', 'Creek Harbour Sky Residence', 'Two-bedroom residence facing the creek with views of Ras Al Khor wildlife sanctuary.', 'Harbour Views sits on the water side of Dubai Creek Harbour, and this unit faces the creek and the Ras Al Khor sanctuary, where flamingos are visible from the balcony in winter mornings. The interior is delivered in a warm neutral palette with stone worktops, integrated appliances and floor-to-ceiling glazing in the living room. Building amenities include a 25-metre pool, gym, library lounge and children play area. The new metro link puts Downtown twenty minutes away.', 'sale', 1, 'residential', 2750000.00, NULL, NULL, 2107.28, 'AED', 0, 'Harbour Views, Creek Harbour', 'Dubai', 'Dubai Creek Harbour', 'United Arab Emirates', 25.2190000, 55.3330000, 2, 3, 1305.00, NULL, 'sqft', 2022, NULL, NULL, NULL, 'unfurnished', '[\"Creek view\",\"Wildlife view\",\"Pool\",\"Gym\",\"Library lounge\",\"Metro nearby\"]', '[\"Waterfront position\",\"Winter flamingo views\",\"New metro link\"]', 'published', 0, 0, 1, 156, 1, 1, 1, 'Creek Harbour Sky Residence | Salam Properties', 'Two-bedroom residence facing the creek with views of Ras Al Khor wildlife sanctuary.', '2026-03-13 10:00:00', '2026-03-03 03:00:00', '2026-10-06 11:34:09'),
(12, 'jvc-smart-studio', 'SP-1279', 'JVC Smart Studio', 'Furnished smart studio in JVC with a balcony, pool access and easy Al Khail Road links.', 'A practical furnished studio in Belgravia Heights 2, let on a single-cheque basis. The unit includes a fitted kitchen, built-in wardrobes, a balcony and a smart lock. The building offers a temperature-controlled pool, gym, sauna and 24-hour security. Al Khail Road and Sheikh Mohammed Bin Zayed Road are both five minutes away, making this a favourite with young professionals working in Dubai Media City or Barsha.', 'rent', 5, 'residential', 48000.00, NULL, NULL, NULL, 'AED', 0, 'Belgravia Heights 2, JVC', 'Dubai', 'Jumeirah Village Circle', 'United Arab Emirates', 25.0550000, 55.1720000, 0, 1, 545.00, NULL, 'sqft', 2019, NULL, NULL, NULL, 'furnished', '[\"Furnished\",\"Balcony\",\"Pool\",\"Gym\",\"Sauna\",\"Smart lock\",\"Covered parking\"]', '[\"Single cheque available\",\"Smart lock\",\"Excellent road links\"]', 'published', 0, 0, 1, 144, 1, 1, 1, 'JVC Smart Studio | Salam Properties', 'Furnished smart studio in JVC with a balcony, pool access and easy Al Khail Road links.', '2026-04-14 10:00:00', '2026-04-04 03:00:00', '2026-10-06 11:34:09'),
(13, 'emirates-hills-estate-mansion', 'SP-1301', 'Emirates Hills Estate Mansion', 'A 45,000 sq ft estate on the golf course with indoor pool, spa and staff wing.', 'A rare full-plot estate on the eighth hole of the Montgomerie course. The residence was built for entertaining: a triple-height entrance, formal and informal living rooms, a show kitchen and separate service kitchen, a temperature-controlled indoor pool and spa, cinema, gym, wine cellar and a twelve-car basement garage. Eight bedrooms upstairs including two principal suites. The west wing is self-contained staff accommodation for eight. The gardens were landscaped in 2021 with mature olive and palm specimens.', 'sale', 2, 'residential', 95000000.00, NULL, NULL, 2968.75, 'AED', 0, 'Sector E, Emirates Hills', 'Dubai', 'Emirates Hills', 'United Arab Emirates', 25.0650000, 55.1760000, 8, 11, 32000.00, 45000.00, 'sqft', 2014, NULL, NULL, NULL, 'furnished', '[\"Golf view\",\"Indoor pool\",\"Spa\",\"Cinema\",\"Wine cellar\",\"Basement garage\",\"Staff wing\",\"Garden\"]', '[\"Full plot\",\"Golf frontage\",\"Twelve-car garage\",\"Self-contained staff wing\"]', 'published', 1, 1, 1, 279, 13, 1, 1, 'Emirates Hills Estate Mansion | Salam Properties', 'A 45,000 sq ft estate on the golf course with indoor pool, spa and staff wing.', '2026-05-15 10:00:00', '2026-05-05 03:00:00', '2026-10-06 11:34:09'),
(14, 'al-aweer-logistics-warehouse', 'SP-1315', 'Al Aweer Logistics Warehouse', '48,000 sq ft warehouse with 12-metre clear height, dock levelers and staff accommodation.', 'A standalone logistics unit inside Dubai Industrial City with 48,000 sq ft of covered area on a 62,000 sq ft plot. The clear height is 12 metres, with six dock levelers, a 2,000 sq ft mezzanine office and three-phase power. Detached staff accommodation for twenty-four is included on the plot, along with a gated yard for container maneuvering. Zoned for light industrial use and available with a 12-month payment plan from the owner.', 'sale', 9, 'industrial', 12500000.00, NULL, NULL, 260.42, 'AED', 0, 'Warehouse 44, Dubai Industrial City', 'Dubai', 'Al Aweer', 'United Arab Emirates', 25.0460000, 55.2330000, 0, 2, 48000.00, 62000.00, 'sqft', 2017, NULL, NULL, NULL, 'unfurnished', '[\"Dock levelers\",\"Mezzanine office\",\"3-phase power\",\"Gated yard\",\"Staff accommodation\",\"12m clear height\"]', '[\"Standalone unit\",\"Container yard\",\"Owner financing available\"]', 'published', 0, 0, 1, 482, 9, 1, 1, 'Al Aweer Logistics Warehouse | Salam Properties', '48,000 sq ft warehouse with 12-metre clear height, dock levelers and staff accommodation.', '2026-06-16 10:00:00', '2026-06-06 03:00:00', '2026-10-06 11:34:09'),
(15, 'bluewaters-island-penthouse', 'SP-1330', 'Bluewaters Island Penthouse', 'Duplex penthouse with a private roof terrace facing Ain Dubai.', 'The largest duplex penthouse on Bluewaters, facing Ain Dubai across the channel. The lower level holds an open living and dining space with a Poggenpohl kitchen and a full-height wine wall; the upper level is given over to four bedrooms and a roof terrace of just over 2,000 sq ft with an outdoor kitchen and plunge pool. Furnished throughout by a Dubai-based interior house. Residents get private beach access, a 25-metre pool, gym, and direct pedestrian links to JBR.', 'sale', 4, 'residential', 42000000.00, NULL, NULL, 5675.68, 'AED', 0, 'Residences 1, Bluewaters Island', 'Dubai', 'Bluewaters Island', 'United Arab Emirates', 25.0900000, 55.1530000, 4, 6, 7400.00, NULL, 'sqft', 2019, NULL, NULL, NULL, 'furnished', '[\"Private roof terrace\",\"Plunge pool\",\"Private beach\",\"Wine wall\",\"Furnished\",\"Ain Dubai view\"]', '[\"Duplex layout\",\"2,000 sq ft terrace\",\"Direct JBR link\"]', 'published', 1, 1, 1, 473, 8, 1, 1, 'Bluewaters Island Penthouse | Salam Properties', 'Duplex penthouse with a private roof terrace facing Ain Dubai.', '2026-07-17 10:00:00', '2026-07-07 03:00:00', '2026-10-06 11:34:09'),
(16, 'mbr-city-off-plan-residence', 'SP-1344', 'Mohammed Bin Rashid Off-Plan Residence', 'Two-bedroom off-plan residence with a 60/40 payment plan and Q4 2027 handover.', 'Bellevue Towers sits beside Dubai Creek in MBR City, a short drive from Downtown and the airport. This two-bedroom plan is the most efficient in the tower, with no wasted corridor, a closed kitchen and a balcony running the length of the living room. The payment plan is 60/40: 20% down, 40% in instalments across construction and 40% on handover. Expected completion is Q4 2027. Service charges are projected at AED 14 per sq ft.', 'off-plan', 1, 'residential', 1950000.00, 1950000.00, NULL, 1560.00, 'AED', 0, 'Bellevue Towers, MBR City', 'Dubai', 'Mohammed Bin Rashid City', 'United Arab Emirates', 25.1050000, 55.2700000, 2, 3, 1250.00, NULL, 'sqft', 2027, NULL, NULL, NULL, 'unfurnished', '[\"Off-plan\",\"Payment plan\",\"Creek view\",\"Pool\",\"Gym\",\"Smart home\"]', '[\"60/40 payment plan\",\"Q4 2027 handover\",\"Projected AED 14/sq ft service charge\"]', 'published', 0, 0, 1, 121, 4, 1, 1, 'Mohammed Bin Rashid Off-Plan Residence | Salam Properties', 'Two-bedroom off-plan residence with a 60/40 payment plan and Q4 2027 handover.', '2026-08-18 10:00:00', '2026-08-08 03:00:00', '2026-10-06 11:34:09'),
(17, 'arabian-ranches-iii-villa', 'SP-1358', 'Arabian Ranches III Villa', 'Brand-new five-bedroom villa on a corner plot with a private garden and study.', 'A 2023 handover in Arabian Ranches III, so everything is still under warranty. The villa sits on a corner plot, which widens the garden and lets light into the study and the ground-floor guest suite. Five bedrooms, all en-suite, a helper room, laundry and a double garage with EV charging. The community has three pools, a gym, a cricket pitch and a clubhouse, and the school is inside the development itself.', 'sale', 2, 'residential', 7400000.00, NULL, NULL, 1450.98, 'AED', 0, 'Sunrise Villa 8, Arabian Ranches III', 'Dubai', 'Arabian Ranches III', 'United Arab Emirates', 25.1250000, 55.1830000, 5, 6, 5100.00, 7300.00, 'sqft', 2023, NULL, NULL, NULL, 'unfurnished', '[\"Corner plot\",\"EV charging\",\"Study\",\"Maid room\",\"Community pool\",\"Clubhouse\",\"Warranty remaining\"]', '[\"2023 handover\",\"EV charger installed\",\"In-community schooling\"]', 'published', 0, 0, 1, 570, 6, 1, 1, 'Arabian Ranches III Villa | Salam Properties', 'Brand-new five-bedroom villa on a corner plot with a private garden and study.', '2026-09-19 10:00:00', '2026-09-09 03:00:00', '2026-10-06 11:34:09'),
(18, 'd3-creative-office', 'SP-1372', 'Dubai Design District Creative Office', 'Fitted creative office in d3 with a showroom frontage and rooftop terrace access.', 'A fitted creative office in d3 Building 6, arranged as an open studio, four focus rooms and a client-facing showroom along the glazed frontage. Delivered furnished with acoustic panelling and a kitchenette. The building gives tenants shared access to the rooftop terrace and event space used during Dubai Design Week. Ideal for agencies, showrooms and design studios that want to be inside the district rather than near it.', 'sale', 7, 'commercial', 2900000.00, NULL, NULL, 852.94, 'AED', 0, 'Building 6, d3', 'Dubai', 'Dubai Design District', 'United Arab Emirates', 25.1840000, 55.2380000, 0, 3, 3400.00, NULL, 'sqft', 2016, NULL, NULL, NULL, 'furnished', '[\"Showroom frontage\",\"Fitted\",\"Rooftop terrace\",\"Kitchenette\",\"Event space access\"]', '[\"Creative district\",\"Client-facing showroom\",\"Furnished fit-out\"]', 'published', 0, 0, 1, 507, 9, 1, 1, 'Dubai Design District Creative Office | Salam Properties', 'Fitted creative office in d3 with a showroom frontage and rooftop terrace access.', '2026-01-11 10:00:00', '2026-01-01 03:00:00', '2026-10-06 11:34:09'),
(19, 'la-mer-beachside-apartment', 'SP-1386', 'La Mer Beachside Apartment', 'Three-bedroom apartment a two-minute walk from the beach, with a sea-facing balcony.', 'Porto La Mer is the residential quarter at the quiet end of La Mer, and this three-bedroom unit is a two-minute walk from the South Beach promenade. The balcony and living room face the sea; the bedrooms look over the landscaped internal courtyard, so the home is quiet at night. Delivered furnished in a coastal palette with a fitted kitchen. The development has two pools, a gym, direct beach access and a strip of restaurants that stays lively without being loud.', 'sale', 1, 'residential', 5600000.00, NULL, NULL, 2828.28, 'AED', 0, 'Porto La Mer, La Mer', 'Dubai', 'La Mer', 'United Arab Emirates', 25.0790000, 55.1310000, 3, 4, 1980.00, NULL, 'sqft', 2020, NULL, NULL, NULL, 'furnished', '[\"Beach access\",\"Sea view\",\"Furnished\",\"Two pools\",\"Gym\",\"Restaurant strip\"]', '[\"Two-minute beach walk\",\"Sea-facing balcony\",\"Quiet courtyard outlook\"]', 'published', 0, 0, 1, 155, 14, 1, 1, 'La Mer Beachside Apartment | Salam Properties', 'Three-bedroom apartment a two-minute walk from the beach, with a sea-facing balcony.', '2026-02-12 10:00:00', '2026-02-02 03:00:00', '2026-10-06 11:34:09'),
(20, 'town-square-park-view-apartment', 'SP-1400', 'Town Square Park View Apartment', 'Two-bedroom rental overlooking the central park, with two parking bays and a balcony.', 'A quiet two-bedroom rental on the fifth floor of Raseel, overlooking Town Square central park rather than the road. Semi-furnished with wardrobes, kitchen appliances and light fittings; tenants provide furniture. Two covered parking spaces, a balcony long enough for a table, and access to the community pool, gym and nursery. The Saturday market and the park are directly below, and Al Qudra Road is five minutes away.', 'rent', 1, 'residential', 95000.00, NULL, NULL, NULL, 'AED', 0, 'Raseel, Town Square', 'Dubai', 'Town Square', 'United Arab Emirates', 25.1870000, 55.2250000, 2, 3, 1340.00, NULL, 'sqft', 2019, NULL, NULL, NULL, 'semi-furnished', '[\"Park view\",\"Balcony\",\"Two parking bays\",\"Pool\",\"Gym\",\"Semi-furnished\"]', '[\"Park-facing\",\"Away from the road\",\"Near market and nursery\"]', 'published', 0, 0, 1, 263, 2, 1, 1, 'Town Square Park View Apartment | Salam Properties', 'Two-bedroom rental overlooking the central park, with two parking bays and a balcony.', '2026-03-13 10:00:00', '2026-03-03 03:00:00', '2026-10-06 11:34:09'),
(21, 'fujairah-beach-plot', 'SP-1414', 'Fujairah Beach Development Plot', '18,400 sq ft beachfront plot zoned for a villa or boutique hospitality project.', 'A level beachfront plot of 18,400 sq ft in Fujairah Beach Development, cleared and ready to build. Zoning permits a two-storey villa or a boutique hospitality project of up to 1,200 sq ft of built area per floor. Utilities are capped at the plot boundary; the road is paved. The east-facing frontage means sunrise over the Gulf of Oman and shelter from the prevailing afternoon wind. Survey and title deed are available on request.', 'sale', 10, 'land', 3200000.00, NULL, NULL, NULL, 'AED', 0, 'Plot 19, Fujairah Beach Development', 'Fujairah', 'Al Faseel', 'United Arab Emirates', 25.3020000, 56.3500000, 0, 0, NULL, 18400.00, 'sqft', NULL, NULL, NULL, NULL, 'unfurnished', '[\"Beachfront\",\"Build-ready\",\"Utilities at boundary\",\"Zoned for hospitality\"]', '[\"Title deed ready\",\"East-facing frontage\",\"Survey available\"]', 'published', 0, 0, 1, 632, 13, 1, 1, 'Fujairah Beach Development Plot | Salam Properties', '18,400 sq ft beachfront plot zoned for a villa or boutique hospitality project.', '2026-04-14 10:00:00', '2026-04-04 03:00:00', '2026-10-06 11:34:09'),
(22, 'corniche-hotel-apartment', 'SP-1428', 'Corniche Hotel Apartment', 'Serviced one-bedroom hotel apartment on the Corniche with housekeeping and beach club access.', 'A serviced one-bedroom on the fourteenth floor of Marina Pearl, looking straight down Corniche Road to the water. The apartment is fully furnished and managed: weekly housekeeping, linen change, maintenance and 24-hour reception are included in the rent. Residents also hold membership of the adjoining beach club, which includes a pool, gym and private beach strip. Ideal for a professional on a corporate lease or a pied-a-terre.', 'rent', 11, 'residential', 130000.00, NULL, NULL, NULL, 'AED', 0, 'Marina Pearl, Corniche Road', 'Abu Dhabi', 'Corniche Road', 'United Arab Emirates', 24.4760000, 54.3710000, 1, 2, 1020.00, NULL, 'sqft', 2015, NULL, NULL, NULL, 'furnished', '[\"Sea view\",\"Serviced\",\"Housekeeping\",\"Beach club\",\"Gym\",\"Pool\",\"24-hour reception\"]', '[\"Fully managed\",\"Beach club membership\",\"Corporate lease friendly\"]', 'published', 0, 0, 1, 467, 9, 1, 1, 'Corniche Hotel Apartment | Salam Properties', 'Serviced one-bedroom hotel apartment on the Corniche with housekeeping and beach club access.', '2026-05-15 10:00:00', '2026-05-05 03:00:00', '2026-10-06 11:34:09'),
(23, 'mina-al-arab-coastal-villa', 'SP-1442', 'Mina Al Arab Coastal Villa', 'Four-bedroom coastal villa with a sea-facing terrace and community beach access.', 'A 2021 villa in the waterfront district of Mina Al Arab, ten minutes from Al Hamra and twenty-five from the airport. The upper terrace looks over the lagoon towards the Hajar Mountains, and the community beach is a three-minute walk through a palm-lined path. Four bedrooms, a helper room, a closed kitchen and a double garage. The area is growing quickly on the back of the Wynn resort, which makes this both a family home and a plausible yield play.', 'sale', 2, 'residential', 3900000.00, NULL, NULL, 987.34, 'AED', 0, 'Villa 6, Mina Al Arab', 'Ras Al Khaimah', 'Mina Al Arab', 'United Arab Emirates', 25.6740000, 55.9910000, 4, 5, 3950.00, 5400.00, 'sqft', 2021, NULL, NULL, NULL, 'unfurnished', '[\"Sea view\",\"Community beach\",\"Maid room\",\"Garage\",\"Mountain view\"]', '[\"2021 build\",\"Lagoon outlook\",\"Wynn resort proximity\"]', 'published', 0, 0, 1, 130, 3, 1, 1, 'Mina Al Arab Coastal Villa | Salam Properties', 'Four-bedroom coastal villa with a sea-facing terrace and community beach access.', '2026-06-16 10:00:00', '2026-06-06 03:00:00', '2026-10-06 11:34:09'),
(24, 'al-khan-tower-residence', 'SP-1456', 'Al Khan Tower Residence', 'Three-bedroom apartment over the Al Khan lagoon with a large balcony and two parking bays.', 'A generous three-bedroom over the Al Khan lagoon, with a balcony that runs the full width of the living area. The layout includes a closed kitchen, a maid room, fitted wardrobes and two covered parking spaces. The building has a pool, gym and children play area, and the lagoon boardwalk is directly below. Dubai is fifteen minutes over Al Ittihad Road, which makes this one of the strongest value propositions on the northern end of the emirates.', 'sale', 1, 'residential', 1850000.00, NULL, NULL, 1075.58, 'AED', 0, 'Lagoon Views, Al Khan', 'Sharjah', 'Al Khan', 'United Arab Emirates', 25.3360000, 55.4210000, 3, 4, 1720.00, NULL, 'sqft', 2018, NULL, NULL, NULL, 'unfurnished', '[\"Lagoon view\",\"Large balcony\",\"Maid room\",\"Pool\",\"Gym\",\"Two parking bays\"]', '[\"Full-width balcony\",\"Fifteen minutes to Dubai\",\"Boardwalk access\"]', 'published', 0, 0, 1, 473, 8, 1, 1, 'Al Khan Tower Residence | Salam Properties', 'Three-bedroom apartment over the Al Khan lagoon with a large balcony and two parking bays.', '2026-07-17 10:00:00', '2026-07-07 03:00:00', '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(600) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `alt` varchar(200) DEFAULT NULL,
  `credit` varchar(200) DEFAULT NULL,
  `width` smallint(5) UNSIGNED DEFAULT NULL,
  `height` smallint(5) UNSIGNED DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_cover` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `url`, `caption`, `alt`, `credit`, `width`, `height`, `sort_order`, `is_cover`, `created_at`) VALUES
(1, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/Jay_blacks_2017_%28Unsplash%29.jpg/1920px-Jay_blacks_2017_%28Unsplash%29.jpg', 'Marina Gate Residence 42 - view 1', 'Marina Gate Residence 42 by jay blacks thejayblacks', 'jay blacks thejayblacks / CC0', 5184, NULL, 0, 1, '2026-10-06 11:34:09'),
(2, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg/1920px-Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg', 'Marina Gate Residence 42 - view 2', 'Marina Gate Residence 42 by Samuel Zeller samuelzeller', 'Samuel Zeller samuelzeller / CC0', 5877, NULL, 1, 0, '2026-10-06 11:34:09'),
(3, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3c/Chatting_in_a_coffee_shop_%28Unsplash%29.jpg/1920px-Chatting_in_a_coffee_shop_%28Unsplash%29.jpg', 'Marina Gate Residence 42 - view 3', 'Marina Gate Residence 42 by Nick Hillier nhillier', 'Nick Hillier nhillier / CC0', 5345, NULL, 2, 0, '2026-10-06 11:34:09'),
(4, 1, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/Boston_city_skyline_%28Unsplash%29.jpg/1920px-Boston_city_skyline_%28Unsplash%29.jpg', 'Marina Gate Residence 42 - view 4', 'Marina Gate Residence 42 by Alice Donovan Rouse alicekat', 'Alice Donovan Rouse alicekat / CC0', 5763, NULL, 3, 0, '2026-10-06 11:34:09'),
(5, 2, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1d/Red_apartment_building_%28Unsplash%29.jpg/1920px-Red_apartment_building_%28Unsplash%29.jpg', 'Palm Jumeirah Signature Villa - view 1', 'Palm Jumeirah Signature Villa by Echo Grid echogrid', 'Echo Grid echogrid / CC0', 4109, NULL, 0, 1, '2026-10-06 11:34:09'),
(6, 2, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/78/Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg/1920px-Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg', 'Palm Jumeirah Signature Villa - view 2', 'Palm Jumeirah Signature Villa by Steinar Engeland steinart', 'Steinar Engeland steinart / CC0', 4896, NULL, 1, 0, '2026-10-06 11:34:09'),
(7, 2, 'https://live.staticflickr.com/3797/10798143964_5fc2e95a00_b.jpg', 'Palm Jumeirah Signature Villa - view 3', 'Palm Jumeirah Signature Villa by Foto Miki Digital', 'Foto Miki Digital / PDM', 1024, NULL, 2, 0, '2026-10-06 11:34:09'),
(8, 2, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/68/Bright_skyline_over_water_%28Unsplash%29.jpg/1920px-Bright_skyline_over_water_%28Unsplash%29.jpg', 'Palm Jumeirah Signature Villa - view 4', 'Palm Jumeirah Signature Villa by Osman Rana osmanrana', 'Osman Rana osmanrana / CC0', 4547, NULL, 3, 0, '2026-10-06 11:34:09'),
(9, 3, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d2/White_apartment_building_%28Unsplash%29.jpg/1920px-White_apartment_building_%28Unsplash%29.jpg', 'Opera District Sky Loft - view 1', 'Opera District Sky Loft by Joel Filipe joelfilip', 'Joel Filipe joelfilip / CC0', 3346, NULL, 0, 1, '2026-10-06 11:34:09'),
(10, 3, 'https://live.staticflickr.com/65535/49862247091_907d665bb1_b.jpg', 'Opera District Sky Loft - view 2', 'Opera District Sky Loft by flooringclarity', 'flooringclarity / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(11, 3, 'https://live.staticflickr.com/2841/10560793463_59080ccf8e_b.jpg', 'Opera District Sky Loft - view 3', 'Opera District Sky Loft by Foto Miki Digital', 'Foto Miki Digital / PDM', 1024, NULL, 2, 0, '2026-10-06 11:34:09'),
(12, 3, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/City_Lights_at_Night_%28Unsplash_-uzgaA9LfNw%29.jpg/1920px-City_Lights_at_Night_%28Unsplash_-uzgaA9LfNw%29.jpg', 'Opera District Sky Loft - view 4', 'Opera District Sky Loft by Alex wong killerfvith', 'Alex wong killerfvith / CC0', 5745, NULL, 3, 0, '2026-10-06 11:34:09'),
(13, 4, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c1/City_office_lights_%28Unsplash%29.jpg/1920px-City_office_lights_%28Unsplash%29.jpg', 'Business Bay Executive Suite - view 1', 'Business Bay Executive Suite by Vladimir Kudinov', 'Vladimir Kudinov / CC0', 3000, NULL, 0, 1, '2026-10-06 11:34:09'),
(14, 4, 'https://live.staticflickr.com/65535/49862229961_9122ae674a_b.jpg', 'Business Bay Executive Suite - view 2', 'Business Bay Executive Suite by flooringclarity', 'flooringclarity / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(15, 4, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg/1920px-Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg', 'Business Bay Executive Suite - view 3', 'Business Bay Executive Suite by Shixart1985', 'Shixart1985 / CC BY 2.0', 4016, NULL, 2, 0, '2026-10-06 11:34:09'),
(16, 4, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/City_of_lights_%28Unsplash%29.jpg/1920px-City_of_lights_%28Unsplash%29.jpg', 'Business Bay Executive Suite - view 4', 'Business Bay Executive Suite by Luca Bravo lucabravo', 'Luca Bravo lucabravo / CC0', 5869, NULL, 3, 0, '2026-10-06 11:34:09'),
(17, 5, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/Flags_in_an_office_building_%28Unsplash%29.jpg/1920px-Flags_in_an_office_building_%28Unsplash%29.jpg', 'JBR Sea View Residence - view 1', 'JBR Sea View Residence by Erol Ahmed erol', 'Erol Ahmed erol / CC0', 5439, NULL, 0, 1, '2026-10-06 11:34:09'),
(18, 5, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bd/Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg/1920px-Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg', 'JBR Sea View Residence - view 2', 'JBR Sea View Residence by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 4123, NULL, 1, 0, '2026-10-06 11:34:09'),
(19, 5, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1f/Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg/1920px-Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg', 'JBR Sea View Residence - view 3', 'JBR Sea View Residence by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 6113, NULL, 2, 0, '2026-10-06 11:34:09'),
(20, 5, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/62/Cloudy_London_skyline_%28Unsplash%29.jpg/1920px-Cloudy_London_skyline_%28Unsplash%29.jpg', 'JBR Sea View Residence - view 4', 'JBR Sea View Residence by Rob Bye robertbye', 'Rob Bye robertbye / CC0', 4032, NULL, 3, 0, '2026-10-06 11:34:09'),
(21, 6, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f5/Geometric_office_%28Unsplash%29.jpg/1920px-Geometric_office_%28Unsplash%29.jpg', 'Dubai Hills Grove Townhouse - view 1', 'Dubai Hills Grove Townhouse by Patrick Tomasso impatrickt', 'Patrick Tomasso impatrickt / CC0', 4592, NULL, 0, 1, '2026-10-06 11:34:09'),
(22, 6, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg/1920px-Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg', 'Dubai Hills Grove Townhouse - view 2', 'Dubai Hills Grove Townhouse by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 5735, NULL, 1, 0, '2026-10-06 11:34:09'),
(23, 6, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/43/Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg/1920px-Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg', 'Dubai Hills Grove Townhouse - view 3', 'Dubai Hills Grove Townhouse by slgckgc', 'slgckgc / CC BY 2.0', 4590, NULL, 2, 0, '2026-10-06 11:34:09'),
(24, 6, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/Qingdao_-_Drone_view_city_with_skyline_%28Unsplash%29.jpg/1920px-Qingdao_-_Drone_view_city_with_skyline_%28Unsplash%29.jpg', 'Dubai Hills Grove Townhouse - view 4', 'Dubai Hills Grove Townhouse by CHO EUNSEONG being_es', 'CHO EUNSEONG being_es / CC0', 3776, NULL, 3, 0, '2026-10-06 11:34:09'),
(25, 7, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/db/Glass_building_corner_%28Unsplash%29.jpg/1920px-Glass_building_corner_%28Unsplash%29.jpg', 'City Walk Atelier Studio - view 1', 'City Walk Atelier Studio by Jonathan Simcoe jdsimcoe', 'Jonathan Simcoe jdsimcoe / CC0', 4896, NULL, 0, 1, '2026-10-06 11:34:09'),
(26, 7, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg/1920px-Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg', 'City Walk Atelier Studio - view 2', 'City Walk Atelier Studio by Samuel Zeller samuelzeller', 'Samuel Zeller samuelzeller / CC0', 5877, NULL, 1, 0, '2026-10-06 11:34:09'),
(27, 7, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3c/Chatting_in_a_coffee_shop_%28Unsplash%29.jpg/1920px-Chatting_in_a_coffee_shop_%28Unsplash%29.jpg', 'City Walk Atelier Studio - view 3', 'City Walk Atelier Studio by Nick Hillier nhillier', 'Nick Hillier nhillier / CC0', 5345, NULL, 2, 0, '2026-10-06 11:34:09'),
(28, 7, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0a/View_of_Paris_skyline_%28Unsplash%29.jpg/1920px-View_of_Paris_skyline_%28Unsplash%29.jpg', 'City Walk Atelier Studio - view 4', 'City Walk Atelier Studio by Drew Coffman drewcoffman', 'Drew Coffman drewcoffman / CC0', 4096, NULL, 3, 0, '2026-10-06 11:34:09'),
(29, 8, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cb/Neglected_office_plants_%28Unsplash%29.jpg/1920px-Neglected_office_plants_%28Unsplash%29.jpg', 'Al Barsha Garden Villa - view 1', 'Al Barsha Garden Villa by Sam X samx', 'Sam X samx / CC0', 6000, NULL, 0, 1, '2026-10-06 11:34:09'),
(30, 8, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/78/Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg/1920px-Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg', 'Al Barsha Garden Villa - view 2', 'Al Barsha Garden Villa by Steinar Engeland steinart', 'Steinar Engeland steinart / CC0', 4896, NULL, 1, 0, '2026-10-06 11:34:09'),
(31, 8, 'https://live.staticflickr.com/3797/10798143964_5fc2e95a00_b.jpg', 'Al Barsha Garden Villa - view 3', 'Al Barsha Garden Villa by Foto Miki Digital', 'Foto Miki Digital / PDM', 1024, NULL, 2, 0, '2026-10-06 11:34:09'),
(32, 8, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9f/Woman_in_front_of_skyline_%28Unsplash%29.jpg/1920px-Woman_in_front_of_skyline_%28Unsplash%29.jpg', 'Al Barsha Garden Villa - view 4', 'Al Barsha Garden Villa by Brooke Cagle brookecagle', 'Brooke Cagle brookecagle / CC0', 4991, NULL, 3, 0, '2026-10-06 11:34:09'),
(33, 9, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f2/Office_building_in_mist_%28Unsplash%29.jpg/1920px-Office_building_in_mist_%28Unsplash%29.jpg', 'DIFC Prestige Office Floor - view 1', 'DIFC Prestige Office Floor by Fuse Brussels fusebrussels', 'Fuse Brussels fusebrussels / CC0', 5389, NULL, 0, 1, '2026-10-06 11:34:09'),
(34, 9, 'https://live.staticflickr.com/65535/49862247091_907d665bb1_b.jpg', 'DIFC Prestige Office Floor - view 2', 'DIFC Prestige Office Floor by flooringclarity', 'flooringclarity / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(35, 9, 'https://live.staticflickr.com/2841/10560793463_59080ccf8e_b.jpg', 'DIFC Prestige Office Floor - view 3', 'DIFC Prestige Office Floor by Foto Miki Digital', 'Foto Miki Digital / PDM', 1024, NULL, 2, 0, '2026-10-06 11:34:09'),
(36, 9, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9a/City_view_of_Paris_%28Unsplash%29.jpg/1920px-City_view_of_Paris_%28Unsplash%29.jpg', 'DIFC Prestige Office Floor - view 4', 'DIFC Prestige Office Floor by Paul Dufour bill_bokeh', 'Paul Dufour bill_bokeh / CC0', 4147, NULL, 3, 0, '2026-10-06 11:34:09'),
(37, 10, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/Post_office_wedding_%28Unsplash%29.jpg/1920px-Post_office_wedding_%28Unsplash%29.jpg', 'Mirdif Courtyard Villa - view 1', 'Mirdif Courtyard Villa by Ben White benwhitephotography', 'Ben White benwhitephotography / CC0', 5613, NULL, 0, 1, '2026-10-06 11:34:09'),
(38, 10, 'https://live.staticflickr.com/65535/49862229961_9122ae674a_b.jpg', 'Mirdif Courtyard Villa - view 2', 'Mirdif Courtyard Villa by flooringclarity', 'flooringclarity / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(39, 10, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg/1920px-Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg', 'Mirdif Courtyard Villa - view 3', 'Mirdif Courtyard Villa by Shixart1985', 'Shixart1985 / CC BY 2.0', 4016, NULL, 2, 0, '2026-10-06 11:34:09'),
(40, 10, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/80/Empire_State_Building_Observatory_%28Unsplash%29.jpg/1920px-Empire_State_Building_Observatory_%28Unsplash%29.jpg', 'Mirdif Courtyard Villa - view 4', 'Mirdif Courtyard Villa by Cédric Dhaenens cedric', 'Cédric Dhaenens cedric / CC0', 4320, NULL, 3, 0, '2026-10-06 11:34:09'),
(41, 11, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a3/Staring_out_building_windows_%28Unsplash%29.jpg/1920px-Staring_out_building_windows_%28Unsplash%29.jpg', 'Creek Harbour Sky Residence - view 1', 'Creek Harbour Sky Residence by Alex Knight agkdesign', 'Alex Knight agkdesign / CC0', 4355, NULL, 0, 1, '2026-10-06 11:34:09'),
(42, 11, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bd/Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg/1920px-Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg', 'Creek Harbour Sky Residence - view 2', 'Creek Harbour Sky Residence by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 4123, NULL, 1, 0, '2026-10-06 11:34:09'),
(43, 11, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1f/Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg/1920px-Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg', 'Creek Harbour Sky Residence - view 3', 'Creek Harbour Sky Residence by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 6113, NULL, 2, 0, '2026-10-06 11:34:09'),
(44, 11, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/89/Rooftop_views_with_dad_%28Unsplash%29.jpg/1920px-Rooftop_views_with_dad_%28Unsplash%29.jpg', 'Creek Harbour Sky Residence - view 4', 'Creek Harbour Sky Residence by Duncan Bay djtbay', 'Duncan Bay djtbay / CC0', 3500, NULL, 3, 0, '2026-10-06 11:34:09'),
(45, 12, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6c/Women_walking_into_the_office_%28Unsplash%29.jpg/1920px-Women_walking_into_the_office_%28Unsplash%29.jpg', 'JVC Smart Studio - view 1', 'JVC Smart Studio by Verne Ho verneho', 'Verne Ho verneho / CC0', 4657, NULL, 0, 1, '2026-10-06 11:34:09'),
(46, 12, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg/1920px-Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg', 'JVC Smart Studio - view 2', 'JVC Smart Studio by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 5735, NULL, 1, 0, '2026-10-06 11:34:09'),
(47, 12, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/43/Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg/1920px-Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg', 'JVC Smart Studio - view 3', 'JVC Smart Studio by slgckgc', 'slgckgc / CC BY 2.0', 4590, NULL, 2, 0, '2026-10-06 11:34:09'),
(48, 12, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1e/Skyscrapers_and_traffic_in_city_%28Unsplash%29.jpg/1920px-Skyscrapers_and_traffic_in_city_%28Unsplash%29.jpg', 'JVC Smart Studio - view 4', 'JVC Smart Studio by Alexander Pidgeon is400o', 'Alexander Pidgeon is400o / CC0', 5472, NULL, 3, 0, '2026-10-06 11:34:09'),
(49, 13, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/54/Angles_in_Architecture_%28Unsplash%29.jpg/1920px-Angles_in_Architecture_%28Unsplash%29.jpg', 'Emirates Hills Estate Mansion - view 1', 'Emirates Hills Estate Mansion by Scott Webb scottwebb', 'Scott Webb scottwebb / CC0', 6000, NULL, 0, 1, '2026-10-06 11:34:09'),
(50, 13, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg/1920px-Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg', 'Emirates Hills Estate Mansion - view 2', 'Emirates Hills Estate Mansion by Samuel Zeller samuelzeller', 'Samuel Zeller samuelzeller / CC0', 5877, NULL, 1, 0, '2026-10-06 11:34:09'),
(51, 13, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3c/Chatting_in_a_coffee_shop_%28Unsplash%29.jpg/1920px-Chatting_in_a_coffee_shop_%28Unsplash%29.jpg', 'Emirates Hills Estate Mansion - view 3', 'Emirates Hills Estate Mansion by Nick Hillier nhillier', 'Nick Hillier nhillier / CC0', 5345, NULL, 2, 0, '2026-10-06 11:34:09'),
(52, 13, 'https://live.staticflickr.com/7015/6574448269_80eddec043_b.jpg', 'Emirates Hills Estate Mansion - view 4', 'Emirates Hills Estate Mansion by thienzieyung', 'thienzieyung / BY', 1024, NULL, 3, 0, '2026-10-06 11:34:09'),
(53, 14, 'https://live.staticflickr.com/5241/5330817446_e227a759ae_b.jpg', 'Al Aweer Logistics Warehouse - view 1', 'Al Aweer Logistics Warehouse by seier+seier', 'seier+seier / BY', 1024, NULL, 0, 1, '2026-10-06 11:34:09'),
(54, 14, 'https://live.staticflickr.com/6092/6314795544_57101c768e_b.jpg', 'Al Aweer Logistics Warehouse - view 2', 'Al Aweer Logistics Warehouse by seier+seier', 'seier+seier / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(55, 14, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2e/City_in_Progress_%28Unsplash%29.jpg/1920px-City_in_Progress_%28Unsplash%29.jpg', 'Al Aweer Logistics Warehouse - view 3', 'Al Aweer Logistics Warehouse by Christy Ash izelle', 'Christy Ash izelle / CC0', 4093, NULL, 2, 0, '2026-10-06 11:34:09'),
(56, 15, 'https://live.staticflickr.com/4037/4428355645_8f5fc0615e_b.jpg', 'Bluewaters Island Penthouse - view 1', 'Bluewaters Island Penthouse by kevinpoh', 'kevinpoh / BY', 1024, NULL, 0, 1, '2026-10-06 11:34:09'),
(57, 15, 'https://live.staticflickr.com/65535/49862247091_907d665bb1_b.jpg', 'Bluewaters Island Penthouse - view 2', 'Bluewaters Island Penthouse by flooringclarity', 'flooringclarity / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(58, 15, 'https://live.staticflickr.com/2841/10560793463_59080ccf8e_b.jpg', 'Bluewaters Island Penthouse - view 3', 'Bluewaters Island Penthouse by Foto Miki Digital', 'Foto Miki Digital / PDM', 1024, NULL, 2, 0, '2026-10-06 11:34:09'),
(59, 15, 'https://live.staticflickr.com/4117/4908983993_bbeb967e38_b.jpg', 'Bluewaters Island Penthouse - view 4', 'Bluewaters Island Penthouse by skys the limit2', 'skys the limit2 / BY', 1016, NULL, 3, 0, '2026-10-06 11:34:09'),
(60, 16, 'https://live.staticflickr.com/228/483421253_efe2287f4d_b.jpg', 'Mohammed Bin Rashid Off-Plan Residence - view 1', 'Mohammed Bin Rashid Off-Plan Residence by Payton Chung', 'Payton Chung / BY', 1024, NULL, 0, 1, '2026-10-06 11:34:09'),
(61, 16, 'https://live.staticflickr.com/65535/49862229961_9122ae674a_b.jpg', 'Mohammed Bin Rashid Off-Plan Residence - view 2', 'Mohammed Bin Rashid Off-Plan Residence by flooringclarity', 'flooringclarity / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(62, 16, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg/1920px-Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg', 'Mohammed Bin Rashid Off-Plan Residence - view 3', 'Mohammed Bin Rashid Off-Plan Residence by Shixart1985', 'Shixart1985 / CC BY 2.0', 4016, NULL, 2, 0, '2026-10-06 11:34:09'),
(63, 16, 'https://live.staticflickr.com/58/191766759_af5f8173ec_b.jpg', 'Mohammed Bin Rashid Off-Plan Residence - view 4', 'Mohammed Bin Rashid Off-Plan Residence by Jo@net', 'Jo@net / BY', 1024, NULL, 3, 0, '2026-10-06 11:34:09'),
(64, 17, 'https://live.staticflickr.com/4121/4937533944_b5d82db730_b.jpg', 'Arabian Ranches III Villa - view 1', 'Arabian Ranches III Villa by seier+seier', 'seier+seier / BY', 1024, NULL, 0, 1, '2026-10-06 11:34:09'),
(65, 17, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bd/Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg/1920px-Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg', 'Arabian Ranches III Villa - view 2', 'Arabian Ranches III Villa by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 4123, NULL, 1, 0, '2026-10-06 11:34:09'),
(66, 17, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1f/Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg/1920px-Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg', 'Arabian Ranches III Villa - view 3', 'Arabian Ranches III Villa by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 6113, NULL, 2, 0, '2026-10-06 11:34:09'),
(67, 17, 'https://live.staticflickr.com/8089/8592735904_7e994cb24b_b.jpg', 'Arabian Ranches III Villa - view 4', 'Arabian Ranches III Villa by thienzieyung', 'thienzieyung / BY', 1024, NULL, 3, 0, '2026-10-06 11:34:09'),
(68, 18, 'https://live.staticflickr.com/3013/2830785109_b508009d2b_b.jpg', 'Dubai Design District Creative Office - view 1', 'Dubai Design District Creative Office by NNECAPA', 'NNECAPA / BY', 1024, NULL, 0, 1, '2026-10-06 11:34:09'),
(69, 18, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg/1920px-Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg', 'Dubai Design District Creative Office - view 2', 'Dubai Design District Creative Office by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 5735, NULL, 1, 0, '2026-10-06 11:34:09'),
(70, 18, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/43/Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg/1920px-Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg', 'Dubai Design District Creative Office - view 3', 'Dubai Design District Creative Office by slgckgc', 'slgckgc / CC BY 2.0', 4590, NULL, 2, 0, '2026-10-06 11:34:09'),
(71, 18, 'https://live.staticflickr.com/5470/7221161958_1abacbb66c_b.jpg', 'Dubai Design District Creative Office - view 4', 'Dubai Design District Creative Office by thienzieyung', 'thienzieyung / BY', 1024, NULL, 3, 0, '2026-10-06 11:34:09'),
(72, 19, 'https://live.staticflickr.com/3385/3338169165_a8cb9dd019_b.jpg', 'La Mer Beachside Apartment - view 1', 'La Mer Beachside Apartment by seier+seier', 'seier+seier / BY', 1023, NULL, 0, 1, '2026-10-06 11:34:09'),
(73, 19, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8a/Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg/1920px-Berlin%2C_Germany_%28Unsplash_NyrKdOm4FJ4%29.jpg', 'La Mer Beachside Apartment - view 2', 'La Mer Beachside Apartment by Samuel Zeller samuelzeller', 'Samuel Zeller samuelzeller / CC0', 5877, NULL, 1, 0, '2026-10-06 11:34:09'),
(74, 19, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3c/Chatting_in_a_coffee_shop_%28Unsplash%29.jpg/1920px-Chatting_in_a_coffee_shop_%28Unsplash%29.jpg', 'La Mer Beachside Apartment - view 3', 'La Mer Beachside Apartment by Nick Hillier nhillier', 'Nick Hillier nhillier / CC0', 5345, NULL, 2, 0, '2026-10-06 11:34:09'),
(75, 19, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/19/1962_Aerial_View_of_Iowa_City-01.jpg/1920px-1962_Aerial_View_of_Iowa_City-01.jpg', 'La Mer Beachside Apartment - view 4', 'La Mer Beachside Apartment by David Wipf', 'David Wipf / CC BY 2.0', 5352, NULL, 3, 0, '2026-10-06 11:34:09'),
(76, 20, 'https://live.staticflickr.com/2940/14656366473_59b104d382_b.jpg', 'Town Square Park View Apartment - view 1', 'Town Square Park View Apartment by o palsson', 'o palsson / BY', 1024, NULL, 0, 1, '2026-10-06 11:34:09'),
(77, 20, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/78/Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg/1920px-Nordfjordeid%2C_Norway_%28Unsplash_hmIFzdQ6U5k%29.jpg', 'Town Square Park View Apartment - view 2', 'Town Square Park View Apartment by Steinar Engeland steinart', 'Steinar Engeland steinart / CC0', 4896, NULL, 1, 0, '2026-10-06 11:34:09'),
(78, 20, 'https://live.staticflickr.com/3797/10798143964_5fc2e95a00_b.jpg', 'Town Square Park View Apartment - view 3', 'Town Square Park View Apartment by Foto Miki Digital', 'Foto Miki Digital / PDM', 1024, NULL, 2, 0, '2026-10-06 11:34:09'),
(79, 20, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/57/Aerial_view_of_Durgam_cheruvu_and_Hitech_CIty.jpg/1920px-Aerial_view_of_Durgam_cheruvu_and_Hitech_CIty.jpg', 'Town Square Park View Apartment - view 4', 'Town Square Park View Apartment by iMahesh', 'iMahesh / CC BY-SA 4.0', 5816, NULL, 3, 0, '2026-10-06 11:34:09'),
(80, 20, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e3/Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg/1920px-Children_backyard_swimming_%28Unsplash_XtOKVEyHP2s%29.jpg', 'Town Square Park View Apartment - view 5', 'Town Square Park View Apartment by Brandon Morgan littleppl85', 'Brandon Morgan littleppl85 / CC0', 4288, NULL, 4, 0, '2026-10-06 11:34:09'),
(81, 21, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a5/Bonn%2C_Post-Tower_--_2017_--_2121.jpg/1920px-Bonn%2C_Post-Tower_--_2017_--_2121.jpg', 'Fujairah Beach Development Plot - view 1', 'Fujairah Beach Development Plot by Dietmar Rabich', 'Dietmar Rabich / CC BY-SA 4.0', 3285, NULL, 0, 1, '2026-10-06 11:34:09'),
(82, 21, 'https://live.staticflickr.com/8650/16538681939_06fd62fa30_b.jpg', 'Fujairah Beach Development Plot - view 2', 'Fujairah Beach Development Plot by D-Stanley', 'D-Stanley / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(83, 21, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/22/Jerusalem-2013%282%29-Aerial-Temple_Mount-%28south_exposure%29.jpg/1920px-Jerusalem-2013%282%29-Aerial-Temple_Mount-%28south_exposure%29.jpg', 'Fujairah Beach Development Plot - view 3', 'Fujairah Beach Development Plot by Godot13', 'Godot13 / CC BY-SA 4.0', 7500, NULL, 2, 0, '2026-10-06 11:34:09'),
(84, 22, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/70/Bonn%2C_Post-Tower_--_2017_--_2136.jpg/1920px-Bonn%2C_Post-Tower_--_2017_--_2136.jpg', 'Corniche Hotel Apartment - view 1', 'Corniche Hotel Apartment by Dietmar Rabich', 'Dietmar Rabich / CC BY-SA 4.0', 3648, NULL, 0, 1, '2026-10-06 11:34:09'),
(85, 22, 'https://live.staticflickr.com/65535/49862229961_9122ae674a_b.jpg', 'Corniche Hotel Apartment - view 2', 'Corniche Hotel Apartment by flooringclarity', 'flooringclarity / BY', 1024, NULL, 1, 0, '2026-10-06 11:34:09'),
(86, 22, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg/1920px-Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg', 'Corniche Hotel Apartment - view 3', 'Corniche Hotel Apartment by Shixart1985', 'Shixart1985 / CC BY 2.0', 4016, NULL, 2, 0, '2026-10-06 11:34:09'),
(87, 22, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5a/Boston_city_skyline_%28Unsplash%29.jpg/1920px-Boston_city_skyline_%28Unsplash%29.jpg', 'Corniche Hotel Apartment - view 4', 'Corniche Hotel Apartment by Alice Donovan Rouse alicekat', 'Alice Donovan Rouse alicekat / CC0', 5763, NULL, 3, 0, '2026-10-06 11:34:09'),
(88, 22, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e1/Drone_pool_and_deck_chairs_%28Unsplash%29.jpg/1920px-Drone_pool_and_deck_chairs_%28Unsplash%29.jpg', 'Corniche Hotel Apartment - view 5', 'Corniche Hotel Apartment by Tim Gouw punttim', 'Tim Gouw punttim / CC0', 2972, NULL, 4, 0, '2026-10-06 11:34:09'),
(89, 23, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/61/Brick_Tower_with_Geometric_Balconies%2C_Porto%2C_Portugal_%2854828599039%29.jpg/1920px-Brick_Tower_with_Geometric_Balconies%2C_Porto%2C_Portugal_%2854828599039%29.jpg', 'Mina Al Arab Coastal Villa - view 1', 'Mina Al Arab Coastal Villa by Dale Cruse - 10M views from San Francisco, CA, USA', 'Dale Cruse - 10M views from San Francisco, CA, USA / CC BY 4.0', 2268, NULL, 0, 1, '2026-10-06 11:34:09'),
(90, 23, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bd/Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg/1920px-Elevators_vestibule_with_flower_bouquets_at_InterContinental_Hotel_Singapore.jpg', 'Mina Al Arab Coastal Villa - view 2', 'Mina Al Arab Coastal Villa by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 4123, NULL, 1, 0, '2026-10-06 11:34:09'),
(91, 23, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1f/Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg/1920px-Entrance_lobby_of_Amantaka_luxury_Resort_%26_Hotel_at_blue_hour_in_Luang_Prabang_Laos.jpg', 'Mina Al Arab Coastal Villa - view 3', 'Mina Al Arab Coastal Villa by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 6113, NULL, 2, 0, '2026-10-06 11:34:09'),
(92, 23, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/68/Bright_skyline_over_water_%28Unsplash%29.jpg/1920px-Bright_skyline_over_water_%28Unsplash%29.jpg', 'Mina Al Arab Coastal Villa - view 4', 'Mina Al Arab Coastal Villa by Osman Rana osmanrana', 'Osman Rana osmanrana / CC0', 4547, NULL, 3, 0, '2026-10-06 11:34:09'),
(93, 24, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/Jay_blacks_2017_%28Unsplash%29.jpg/1920px-Jay_blacks_2017_%28Unsplash%29.jpg', 'Al Khan Tower Residence - view 1', 'Al Khan Tower Residence by jay blacks thejayblacks', 'jay blacks thejayblacks / CC0', 5184, NULL, 0, 1, '2026-10-06 11:34:09'),
(94, 24, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b9/Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg/1920px-Interior_of_the_lobby_coffee_and_drinks_at_The_Fullerton_Bay_Hotel_Singapore.jpg', 'Al Khan Tower Residence - view 2', 'Al Khan Tower Residence by Basile Morin', 'Basile Morin / CC BY-SA 4.0', 5735, NULL, 1, 0, '2026-10-06 11:34:09'),
(95, 24, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/43/Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg/1920px-Lobby_of_the_Roosevelt_Hotel%2C_New_Orleans_2022.jpg', 'Al Khan Tower Residence - view 3', 'Al Khan Tower Residence by slgckgc', 'slgckgc / CC BY 2.0', 4590, NULL, 2, 0, '2026-10-06 11:34:09'),
(96, 24, 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/City_Lights_at_Night_%28Unsplash_-uzgaA9LfNw%29.jpg/1920px-City_Lights_at_Night_%28Unsplash_-uzgaA9LfNw%29.jpg', 'Al Khan Tower Residence - view 4', 'Al Khan Tower Residence by Alex wong killerfvith', 'Alex wong killerfvith / CC0', 5745, NULL, 3, 0, '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(160) NOT NULL,
  `title` varchar(200) NOT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `excerpt` varchar(500) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL,
  `image` varchar(600) DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `slug`, `title`, `subtitle`, `excerpt`, `description`, `icon`, `image`, `features`, `sort_order`, `is_active`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'buy-a-property', 'Buy a Property', 'End-to-end acquisition support', 'Search, shortlist, negotiate and close - with an advisor who knows the building, not just the listing.', NULL, 'bi house-door', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f2/Office_building_in_mist_%28Unsplash%29.jpg/1920px-Office_building_in_mist_%28Unsplash%29.jpg', '[\"Requirements workshop\",\"Curated shortlist\",\"Viewing coordination\",\"Negotiation & LOI\",\"DLD transfer support\"]', 1, 1, 'Buy a Property | Salam Properties', 'Search, shortlist, negotiate and close - with an advisor who knows the building, not just the listing.', '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(2, 'sell-a-property', 'Sell Your Property', 'Positioning that earns the price', 'Professional valuation, photography, launch strategy and buyer qualification until the transfer is signed.', NULL, 'bi tag', 'https://live.staticflickr.com/3784/11705392445_86c98890bc_b.jpg', '[\"Comparative valuation\",\"Photography & staging\",\"Targeted launch\",\"Offer management\",\"Transfer appointment\"]', 2, 1, 'Sell Your Property | Salam Properties', 'Professional valuation, photography, launch strategy and buyer qualification until the transfer is signed.', '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(3, 'rent-and-lease', 'Rent & Lease', 'Tenants and landlords, matched properly', 'From single units to full portfolios, including Ejari registration, cheques and renewal strategy.', NULL, 'bi key', 'https://live.staticflickr.com/65535/49862229961_9122ae674a_b.jpg', '[\"Tenant screening\",\"Market rent analysis\",\"Ejari registration\",\"Cheque structuring\",\"Renewal management\"]', 3, 1, 'Rent & Lease | Salam Properties', 'From single units to full portfolios, including Ejari registration, cheques and renewal strategy.', '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(4, 'property-management', 'Property Management', 'Your asset, actively managed', 'Rent collection, maintenance dispatch, inspections and owner reporting on a monthly cycle.', NULL, 'bi gear', 'https://live.staticflickr.com/8207/8189925965_70a7b32960_b.jpg', '[\"Rent collection\",\"Preventive maintenance\",\"Quarterly inspections\",\"Owner portal reports\",\"Vacancy marketing\"]', 4, 1, 'Property Management | Salam Properties', 'Rent collection, maintenance dispatch, inspections and owner reporting on a monthly cycle.', '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(5, 'investment-advisory', 'Investment Advisory', 'Yield before emotion', 'Screened opportunities modelled for net yield, service charges, exit liquidity and payment-plan risk.', NULL, 'bi graph-up-arrow', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/80/Empire_State_Building_Observatory_%28Unsplash%29.jpg/1920px-Empire_State_Building_Observatory_%28Unsplash%29.jpg', '[\"Yield modelling\",\"Risk screening\",\"Payment-plan analysis\",\"Exit liquidity review\",\"Portfolio rebalancing\"]', 5, 1, 'Investment Advisory | Salam Properties', 'Screened opportunities modelled for net yield, service charges, exit liquidity and payment-plan risk.', '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(6, 'mortgage-consultation', 'Mortgage Consultation', 'Pre-approval without the guesswork', 'Independent comparison across UAE lenders, with LTV, rate and fee analysis in one place.', NULL, 'bi bank', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f6/Post_office_wedding_%28Unsplash%29.jpg/1920px-Post_office_wedding_%28Unsplash%29.jpg', '[\"Lender comparison\",\"Pre-approval handling\",\"LTV & fee analysis\",\"Fixed vs variable guidance\",\"Refinancing review\"]', 6, 1, 'Mortgage Consultation | Salam Properties', 'Independent comparison across UAE lenders, with LTV, rate and fee analysis in one place.', '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(7, 'commercial-real-estate', 'Commercial Real Estate', 'Offices, retail and industrial', 'Tenant representation, owner advisory and investment sales across the commercial spectrum.', NULL, 'bi briefcase', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a3/Staring_out_building_windows_%28Unsplash%29.jpg/1920px-Staring_out_building_windows_%28Unsplash%29.jpg', '[\"Tenant representation\",\"Lease negotiation\",\"Fit-out coordination\",\"Owner advisory\",\"Investment sales\"]', 7, 1, 'Commercial Real Estate | Salam Properties', 'Tenant representation, owner advisory and investment sales across the commercial spectrum.', '2026-10-06 11:34:09', '2026-10-06 11:34:09'),
(8, 'relocation-concierge', 'Relocation & Concierge', 'Arrive to a working home', 'Temporary accommodation, school search, DEWA and connectivity setup, and furniture packages.', NULL, 'bi suitcase', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e9/Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg/1920px-Elegant_dining_setup_in_modern_kitchen_for_an_intimate_gathering_at_dusk.jpg', '[\"Temporary accommodation\",\"School search\",\"Utilities setup\",\"Furniture packages\",\"Visa coordination\"]', 8, 1, 'Relocation & Concierge | Salam Properties', 'Temporary accommodation, school search, DEWA and connectivity setup, and furniture packages.', '2026-10-06 11:34:09', '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_key` varchar(120) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `type` enum('text','textarea','number','boolean','image','json','color','select','email','url','phone') NOT NULL DEFAULT 'text',
  `group_name` varchar(60) NOT NULL DEFAULT 'general',
  `label` varchar(160) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `options` varchar(500) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `type`, `group_name`, `label`, `description`, `options`, `sort_order`, `is_public`, `updated_at`) VALUES
(1, 'site_name', 'Salam Properties', 'text', 'brand', 'Site name', 'Displayed in the header, browser tab and structured data.', NULL, 1, 1, '2026-10-06 11:34:09'),
(2, 'site_tagline', 'Distinctive homes. Considered investments.', 'text', 'brand', 'Tagline', 'Short strapline under the logo.', NULL, 2, 1, '2026-10-06 11:34:09'),
(3, 'logo', 'frontend/assets/img/logo.svg', 'image', 'brand', 'Logo', 'SVG or transparent PNG, recommended height 40px.', NULL, 3, 1, '2026-10-06 11:34:09'),
(4, 'logo_light', 'frontend/assets/img/logo-light.svg', 'image', 'brand', 'Light logo', 'Used on dark header / footer backgrounds.', NULL, 4, 1, '2026-10-06 11:34:09'),
(5, 'favicon', 'frontend/assets/img/favicon.png', 'image', 'brand', 'Favicon', '32x32 or 48x48 PNG.', NULL, 5, 1, '2026-10-06 11:34:09'),
(6, 'brand_color', '#C9A96A', 'color', 'brand', 'Brand colour', 'Primary champagne gold accent.', NULL, 6, 1, '2026-10-06 11:34:09'),
(7, 'dark_color', '#0E0F12', 'color', 'brand', 'Base dark colour', 'Charcoal base used across the site.', NULL, 7, 1, '2026-10-06 11:34:09'),
(8, 'ivory_color', '#F7F4EF', 'color', 'brand', 'Ivory surface', 'Light surface colour.', NULL, 8, 1, '2026-10-06 11:34:09'),
(9, 'contact_email', 'hello@salamproperties.com', 'email', 'contact', 'General email', 'Shown on the contact page and used for mailto links.', NULL, 1, 1, '2026-10-06 11:34:09'),
(10, 'contact_phone', '+971 4 555 0180', 'phone', 'contact', 'Primary phone', 'Displayed in the header and footer.', NULL, 2, 1, '2026-10-06 11:34:09'),
(11, 'contact_phone_alt', '+971 50 555 0180', 'phone', 'contact', 'Alternate phone', 'Mobile / WhatsApp number.', NULL, 3, 1, '2026-10-06 11:34:09'),
(12, 'contact_whatsapp', '+971505550180', 'phone', 'contact', 'WhatsApp number', 'Digits only, used to build the wa.me link.', NULL, 4, 1, '2026-10-06 11:34:09'),
(13, 'office_address', 'Office 2408, Boulevard Plaza Tower 2, Downtown Dubai, United Arab Emirates', 'textarea', 'contact', 'Office address', 'Full postal address.', NULL, 5, 1, '2026-10-06 11:34:09'),
(14, 'office_hours', 'Mon - Fri 09:00 - 18:00  |  Sat 10:00 - 16:00', 'text', 'contact', 'Opening hours', 'Shown on the contact page.', NULL, 6, 1, '2026-10-06 11:34:09'),
(15, 'map_lat', '25.1972', 'text', 'contact', 'Map latitude', 'Default map centre.', NULL, 7, 1, '2026-10-06 11:34:09'),
(16, 'map_lng', '55.2744', 'text', 'contact', 'Map longitude', 'Default map centre.', NULL, 8, 1, '2026-10-06 11:34:09'),
(17, 'map_zoom', '12', 'number', 'contact', 'Map zoom', 'Default zoom level 1-19.', NULL, 9, 1, '2026-10-06 11:34:09'),
(18, 'map_provider', 'leaflet', 'select', 'contact', 'Map provider', 'Leaflet (OpenStreetMap) is bundled locally.', 'leaflet,google', 10, 1, '2026-10-06 11:34:09'),
(19, 'meta_title', 'Salam Properties | Luxury Real Estate in the UAE', 'text', 'seo', 'Default meta title', 'Fallback title when a page sets none.', NULL, 1, 1, '2026-10-06 11:34:09'),
(20, 'meta_description', 'Salam Properties is a Dubai-based real estate consultancy specialising in luxury homes, off-plan releases and yield-led investments across the UAE.', 'textarea', 'seo', 'Default meta description', 'Fallback description.', NULL, 2, 1, '2026-10-06 11:34:09'),
(21, 'og_image', 'frontend/assets/img/og-default.jpg', 'image', 'seo', 'Default social image', '1200x630 recommended.', NULL, 3, 1, '2026-10-06 11:34:09'),
(22, 'robots', 'index, follow, max-image-preview:large', 'text', 'seo', 'Robots meta', 'Value for the robots meta tag.', NULL, 4, 1, '2026-10-06 11:34:09'),
(23, 'google_analytics_id', '', 'text', 'seo', 'Google Analytics ID', 'Leave blank to disable tracking.', NULL, 5, 0, '2026-10-06 11:34:09'),
(24, 'google_tag_manager', '', 'text', 'seo', 'Tag Manager ID', 'Leave blank to disable.', NULL, 6, 0, '2026-10-06 11:34:09'),
(25, 'sitemap_enabled', '1', 'boolean', 'seo', 'XML sitemap', 'Expose /sitemap.xml.', NULL, 7, 1, '2026-10-06 11:34:09'),
(26, 'canonical_enabled', '1', 'boolean', 'seo', 'Canonical URLs', 'Emit <link rel=\"canonical\"> on every page.', NULL, 8, 1, '2026-10-06 11:34:09'),
(27, 'facebook', 'https://facebook.com/salamproperties', 'url', 'social', 'Facebook', NULL, NULL, 1, 1, '2026-10-06 11:34:09'),
(28, 'instagram', 'https://instagram.com/salamproperties', 'url', 'social', 'Instagram', NULL, NULL, 2, 1, '2026-10-06 11:34:09'),
(29, 'linkedin', 'https://linkedin.com/company/salamproperties', 'url', 'social', 'LinkedIn', NULL, NULL, 3, 1, '2026-10-06 11:34:09'),
(30, 'x_twitter', 'https://x.com/salamproperties', 'url', 'social', 'X (Twitter)', NULL, NULL, 4, 1, '2026-10-06 11:34:09'),
(31, 'youtube', 'https://youtube.com/@salamproperties', 'url', 'social', 'YouTube', NULL, NULL, 5, 1, '2026-10-06 11:34:09'),
(32, 'tiktok', 'https://tiktok.com/@salamproperties', 'url', 'social', 'TikTok', NULL, NULL, 6, 1, '2026-10-06 11:34:09'),
(33, 'currency', 'AED', 'select', 'listing', 'Display currency', 'Currency used for all prices.', 'AED,USD,EUR,GBP,SAR,QAR', 1, 1, '2026-10-06 11:34:09'),
(34, 'currency_symbol_position', 'before', 'select', 'listing', 'Symbol position', 'Where the currency symbol is rendered.', 'before,after', 2, 1, '2026-10-06 11:34:09'),
(35, 'price_unit_year', 'per year', 'text', 'listing', 'Rent suffix', 'Text appended to annual rental prices.', NULL, 3, 1, '2026-10-06 11:34:09'),
(36, 'properties_per_page', '9', 'number', 'listing', 'Listings per page', 'Grid size on listing pages.', NULL, 4, 1, '2026-10-06 11:34:09'),
(37, 'related_properties_count', '3', 'number', 'listing', 'Related listings', 'How many related cards to show on a listing page.', NULL, 5, 1, '2026-10-06 11:34:09'),
(38, 'enable_ref_no', '1', 'boolean', 'listing', 'Show reference numbers', 'Display the R-#### reference on cards.', NULL, 6, 1, '2026-10-06 11:34:09'),
(39, 'enable_views_counter', '1', 'boolean', 'listing', 'Track listing views', 'Increment views_count on each detail view.', NULL, 7, 1, '2026-10-06 11:34:09'),
(40, 'enable_favorites', '1', 'boolean', 'listing', 'Allow favourites', 'Registered users can save listings.', NULL, 8, 1, '2026-10-06 11:34:09'),
(41, 'enable_mortgage_calculator', '1', 'boolean', 'listing', 'Mortgage calculator', 'Show the calculator on listing detail pages.', NULL, 9, 1, '2026-10-06 11:34:09'),
(42, 'default_listing_type', 'sale', 'select', 'listing', 'Default listing tab', 'Tab pre-selected on /properties.', 'sale,rent,off-plan', 10, 1, '2026-10-06 11:34:09'),
(43, 'inquiry_email_recipient', 'hello@salamproperties.com', 'email', 'listing', 'Inquiry recipient', 'Where listing inquiries are delivered.', NULL, 11, 1, '2026-10-06 11:34:09'),
(44, 'auto_publish_listings', '0', 'boolean', 'listing', 'Auto-publish listings', 'New listings from the API go straight to published.', NULL, 12, 1, '2026-10-06 11:34:09'),
(45, 'enable_blog', '1', 'boolean', 'features', 'Insights / blog module', 'Unlocks /insights and /insights/{slug}.', NULL, 1, 1, '2026-10-06 11:34:09'),
(46, 'enable_gallery', '1', 'boolean', 'features', 'Gallery module', 'Unlocks /gallery.', NULL, 2, 1, '2026-10-06 11:34:09'),
(47, 'enable_testimonials', '1', 'boolean', 'features', 'Testimonials', 'Render social proof on the home page.', NULL, 3, 1, '2026-10-06 11:34:09'),
(48, 'enable_investment', '1', 'boolean', 'features', 'Investment projects', 'Unlocks /investments.', NULL, 4, 1, '2026-10-06 11:34:09'),
(49, 'enable_live_chat', '0', 'boolean', 'features', 'Live chat widget', 'Reserved for a third-party chat integration.', NULL, 5, 1, '2026-10-06 11:34:09'),
(50, 'enable_cookie_banner', '1', 'boolean', 'features', 'Cookie banner', 'GDPR-style consent bar.', NULL, 6, 1, '2026-10-06 11:34:09'),
(51, 'maintenance_mode', '0', 'boolean', 'features', 'Maintenance mode', 'Shows a holding page to non-admin visitors.', NULL, 7, 1, '2026-10-06 11:34:09'),
(52, 'registration_enabled', '1', 'boolean', 'features', 'Public registration', 'Allow visitors to create an account.', NULL, 8, 1, '2026-10-06 11:34:09'),
(53, 'mail_from_name', 'Salam Properties', 'text', 'mail', 'From name', NULL, NULL, 1, 1, '2026-10-06 11:34:09'),
(54, 'mail_from_address', 'no-reply@salamproperties.com', 'email', 'mail', 'From address', NULL, NULL, 2, 1, '2026-10-06 11:34:09'),
(55, 'mail_subject_prefix', '[Salam Properties]', 'text', 'mail', 'Subject prefix', 'Prepended to every outgoing subject.', NULL, 3, 1, '2026-10-06 11:34:09'),
(56, 'mail_driver', 'smtp', 'select', 'mail', 'Mail driver', 'SMTP is recommended on XAMPP.', 'smtp,mail,sendmail', 4, 1, '2026-10-06 11:34:09'),
(57, 'smtp_host', 'smtp.mailgun.org', 'text', 'mail', 'SMTP host', NULL, NULL, 5, 1, '2026-10-06 11:34:09'),
(58, 'smtp_port', '587', 'number', 'mail', 'SMTP port', NULL, NULL, 6, 1, '2026-10-06 11:34:09'),
(59, 'smtp_encryption', 'tls', 'select', 'mail', 'SMTP encryption', NULL, 'none,tls,ssl', 7, 1, '2026-10-06 11:34:09'),
(60, 'smtp_username', '', 'text', 'mail', 'SMTP username', NULL, NULL, 8, 0, '2026-10-06 11:34:09'),
(61, 'smtp_password', '', 'text', 'mail', 'SMTP password', NULL, NULL, 9, 0, '2026-10-06 11:34:09'),
(62, 'hero_headline', 'Find the address that changes everything.', 'text', 'appearance', 'Hero headline', 'Home page hero H1.', NULL, 1, 1, '2026-10-06 11:34:09'),
(63, 'hero_subline', 'Curated residences, off-plan releases and investment-grade assets across the Emirates.', 'textarea', 'appearance', 'Hero sub-line', 'Supporting copy under the headline.', NULL, 2, 1, '2026-10-06 11:34:09'),
(64, 'hero_image', '', 'image', 'appearance', 'Hero image', 'Leave empty to use the rotating skyline set.', NULL, 3, 1, '2026-10-06 11:34:09'),
(65, 'hero_video', '', 'text', 'appearance', 'Hero video URL', 'Optional MP4/WebM loop.', NULL, 4, 1, '2026-10-06 11:34:09'),
(66, 'footer_about', 'Salam Properties is an independent brokerage founded in Dubai, advising buyers, tenants and institutions on residential and commercial real estate across the UAE.', 'textarea', 'appearance', 'Footer blurb', NULL, NULL, 5, 1, '2026-10-06 11:34:09'),
(67, 'footer_copyright', '© {year} Salam Properties. All rights reserved.', 'text', 'appearance', 'Copyright line', 'The token {year} is replaced at render time.', NULL, 6, 1, '2026-10-06 11:34:09'),
(68, 'stats_listings', '480+', 'text', 'appearance', 'Stat: listings', 'Counter on the home page.', NULL, 7, 1, '2026-10-06 11:34:09'),
(69, 'stats_clients', '1,250+', 'text', 'appearance', 'Stat: clients', NULL, NULL, 8, 1, '2026-10-06 11:34:09'),
(70, 'stats_value', 'AED 2.1B', 'text', 'appearance', 'Stat: transaction value', NULL, NULL, 9, 1, '2026-10-06 11:34:09'),
(71, 'stats_experience', '14 yrs', 'text', 'appearance', 'Stat: experience', NULL, NULL, 10, 1, '2026-10-06 11:34:09'),
(72, 'animated_reveal', '1', 'boolean', 'appearance', 'Scroll reveal animations', 'Disable on low-powered devices.', NULL, 11, 1, '2026-10-06 11:34:09'),
(73, 'sticky_header', '1', 'boolean', 'appearance', 'Sticky header', 'Header condenses on scroll.', NULL, 12, 1, '2026-10-06 11:34:09'),
(74, 'rtl_mode', '0', 'boolean', 'appearance', 'Right-to-left layout', 'Switches the stylesheet direction.', NULL, 13, 1, '2026-10-06 11:34:09'),
(75, 'csrf_enabled', '1', 'boolean', 'security', 'CSRF protection', 'Every mutating request must carry a token.', NULL, 1, 1, '2026-10-06 11:34:09'),
(76, 'rate_limit_window', '60', 'number', 'security', 'Rate limit window (s)', 'Sliding window length.', NULL, 2, 1, '2026-10-06 11:34:09'),
(77, 'rate_limit_max', '30', 'number', 'security', 'Rate limit max hits', 'Max requests per window per IP.', NULL, 3, 1, '2026-10-06 11:34:09'),
(78, 'login_max_attempts', '5', 'number', 'security', 'Login attempts', 'Locked out for lockout_minutes after this many failures.', NULL, 4, 1, '2026-10-06 11:34:09'),
(79, 'lockout_minutes', '15', 'number', 'security', 'Lockout duration (min)', NULL, NULL, 5, 1, '2026-10-06 11:34:09'),
(80, 'session_lifetime', '120', 'number', 'security', 'Session lifetime (min)', NULL, NULL, 6, 1, '2026-10-06 11:34:09'),
(81, 'force_https', '0', 'boolean', 'security', 'Force HTTPS', 'Enable behind a TLS terminator.', NULL, 7, 1, '2026-10-06 11:34:09'),
(82, 'x_frame_options', 'SAMEORIGIN', 'select', 'security', 'X-Frame-Options', 'Clickjacking protection.', 'SAMEORIGIN,DENY,ALLOWALL', 8, 1, '2026-10-06 11:34:09'),
(83, 'password_min_length', '8', 'number', 'security', 'Minimum password length', NULL, NULL, 9, 1, '2026-10-06 11:34:09'),
(84, 'installer_locked', '1', 'boolean', 'system', 'Installer locked', 'Prevents re-running the database installer.', NULL, 1, 1, '2026-10-06 11:34:09'),
(85, 'api_enabled', '1', 'boolean', 'system', 'JSON API enabled', 'Master switch for /backend/api.', NULL, 2, 1, '2026-10-06 11:34:09'),
(86, 'api_rate_limit', '120', 'number', 'system', 'API rate limit', 'Requests per minute per IP.', NULL, 3, 1, '2026-10-06 11:34:09'),
(87, 'cache_ttl', '600', 'number', 'system', 'Cache TTL (s)', 'Fragment cache lifetime for list queries.', NULL, 4, 1, '2026-10-06 11:34:09'),
(88, 'date_format', 'd M Y', 'text', 'system', 'Date format', 'PHP date() format used across the site.', NULL, 5, 1, '2026-10-06 11:34:09'),
(89, 'timezone', 'Asia/Dubai', 'select', 'system', 'Timezone', NULL, 'Asia/Dubai,Asia/Riyadh,UTC,Europe/London', 6, 1, '2026-10-06 11:34:09'),
(90, 'items_per_admin_page', '20', 'number', 'system', 'Admin rows per page', NULL, NULL, 7, 1, '2026-10-06 11:34:09'),
(91, 'log_retention_days', '90', 'number', 'system', 'Log retention (days)', NULL, NULL, 8, 1, '2026-10-06 11:34:09'),
(92, 'backup_reminder', '1', 'boolean', 'system', 'Backup reminder', 'Remind admins about weekly backups.', NULL, 9, 1, '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `role` varchar(120) DEFAULT NULL,
  `company` varchar(160) DEFAULT NULL,
  `location` varchar(120) DEFAULT NULL,
  `avatar` varchar(600) DEFAULT NULL,
  `content` text NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `role`, `company`, `location`, `avatar`, `content`, `rating`, `is_featured`, `is_active`, `sort_order`, `created_at`) VALUES
(1, 'Amira Haddad', 'Private Client', 'Interior Designer', 'Dubai Marina', 'https://live.staticflickr.com/1907/45739276192_2d0186083a_b.jpg', 'We came to Salam with a very specific brief and a limited timeline. What we got was a shortlist of five, not fifty, and every one of them was defensible. We closed on the second viewing and the negotiation went exactly as they said it would.', 5, 1, 1, 1, '2026-10-06 11:34:09'),
(2, 'James Okonkwo', 'Portfolio Investor', 'Independent', 'Business Bay', 'https://live.staticflickr.com/1907/45739276192_2d0186083a_b.jpg', 'I have bought in four markets and this is the first time an advisor sent me the service charge budget before I asked for it. That single detail told me how the rest of the process would go. Two years on, the numbers still hold.', 5, 1, 1, 2, '2026-10-06 11:34:09'),
(3, 'Fatima Al Suwaidi', 'First-time Buyer', 'Engineer', 'Dubai Hills', 'https://live.staticflickr.com/1907/45739276192_2d0186083a_b.jpg', 'As a first buyer I expected to be managed. Instead I was educated - the mortgage process, the fee stack, the Ejari step, all of it explained once and clearly. No chasing, no surprises at the trustee office.', 5, 0, 1, 3, '2026-10-06 11:34:09'),
(4, 'Daniel Weiss', 'Corporate Tenant', 'Regional Director', 'DIFC', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c1/City_office_lights_%28Unsplash%29.jpg/1920px-City_office_lights_%28Unsplash%29.jpg', 'Our office relocation had a hard date attached to it. Salam handled the search, the fit-out coordination and the lease negotiation in parallel and we opened on schedule. The landlord tried to move the handover; they did not let it happen.', 5, 0, 1, 4, '2026-10-06 11:34:09'),
(5, 'Sara Malik', 'Landstone Owner', 'Entrepreneur', 'Jumeirah', 'https://live.staticflickr.com/3797/10798143964_5fc2e95a00_b.jpg', 'My flat sat empty for eleven weeks with another agency. Salam re-priced it against the actual index, refreshed the photography and let it in nine days. The rent they achieved was higher than the figure I had been chasing.', 4, 0, 1, 5, '2026-10-06 11:34:09'),
(6, 'Rashid Al Nuaimi', 'Institutional Buyer', 'Investment Manager', 'Abu Dhabi', 'https://live.staticflickr.com/8089/8592735904_7e994cb24b_b.jpg', 'We needed someone who could model a commercial acquisition properly rather than translate a brochure. The yield analysis included vacancy sensitivity and exit liquidity, which is where most advisors stop. We completed the deal.', 5, 1, 1, 6, '2026-10-06 11:34:09'),
(7, 'Elena Petrova', 'Relocating Family', 'Physician', 'Arabian Ranches', 'https://live.staticflickr.com/529/31914122281_fa522f82cb_b.jpg', 'We moved from Europe with two children and six weeks to find a home. The school search, the temporary apartment and the villa viewings were all arranged around our arrival date. It was the least stressful part of the move.', 5, 0, 1, 7, '2026-10-06 11:34:09'),
(8, 'Karim Benali', 'Landlord', 'Retired', 'Al Barsha', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bc/Flags_in_an_office_building_%28Unsplash%29.jpg/1920px-Flags_in_an_office_building_%28Unsplash%29.jpg', 'Three units, one point of contact, monthly reporting that actually reconciles. Maintenance gets dispatched before I hear about it. I have moved the rest of my portfolio across.', 5, 0, 1, 8, '2026-10-06 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `status` enum('active','blocked','pending') NOT NULL DEFAULT 'active',
  `email_verified_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `avatar`, `status`, `email_verified_at`, `last_login_at`, `last_login_ip`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Layla Kassem', 'layla.k@example.com', '+971 52 909 7761', '$2y$10$hsCRoMEu9AmzAW2ZtciiterFRtWXKJ4od9stqxMPiPRcHK944gQ8a', NULL, 'active', '2026-01-05 10:00:00', '2026-10-06 16:23:17', '::1', NULL, '2026-01-05 04:00:00', '2026-10-06 10:23:17'),
(2, 'Michael Duarte', 'm.duarte@example.com', '+971 50 771 4410', '$2y$10$hsCRoMEu9AmzAW2ZtciiterFRtWXKJ4od9stqxMPiPRcHK944gQ8a', NULL, 'active', '2026-01-05 10:00:00', '2026-02-04 09:11:00', '92.118.44.10', NULL, '2026-01-05 04:00:00', '2026-02-04 03:11:00'),
(3, 'Sana Iqbal', 'sana.iqbal@example.com', '+971 54 660 8812', '$2y$10$hsCRoMEu9AmzAW2ZtciiterFRtWXKJ4od9stqxMPiPRcHK944gQ8a', NULL, 'active', '2026-01-05 10:00:00', '2026-02-27 18:47:00', '31.44.190.2', NULL, '2026-01-05 04:00:00', '2026-02-27 12:47:00'),
(4, 'Thomas Berger', 't.berger@example.com', '+971 55 812 3345', '$2y$10$hsCRoMEu9AmzAW2ZtciiterFRtWXKJ4od9stqxMPiPRcHK944gQ8a', NULL, 'active', NULL, NULL, NULL, NULL, '2026-01-05 04:00:00', '2026-01-05 04:00:00'),
(5, 'Test Client', 'client.smoke@example.com', NULL, '$2y$10$iQpRe.QwKkmJNNBG4WRyD.A4Iid3T6ACj6wjyK87BfyFmJ49D0Ke.', NULL, 'active', '2026-10-06 16:15:40', NULL, NULL, NULL, '2026-10-06 10:15:40', '2026-10-06 10:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_favorites`
--

INSERT INTO `user_favorites` (`id`, `user_id`, `property_id`, `created_at`) VALUES
(1, 1, 1, '2026-10-06 11:34:09'),
(2, 1, 15, '2026-10-06 11:34:09'),
(3, 2, 9, '2026-10-06 11:34:09'),
(4, 3, 16, '2026-10-06 11:34:09'),
(5, 4, 5, '2026-10-06 11:34:09'),
(6, 1, 2, '2026-10-06 12:23:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_act_admin` (`admin_id`,`created_at`),
  ADD KEY `idx_act_entity` (`entity`,`entity_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_admins_email` (`email`),
  ADD UNIQUE KEY `uq_admins_username` (`username`),
  ADD KEY `idx_admins_status` (`status`),
  ADD KEY `idx_admins_role` (`role`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cat_slug` (`slug`,`type`),
  ADD KEY `idx_cat_type_active` (`type`,`is_active`),
  ADD KEY `fk_cat_parent` (`parent_id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mail_status` (`status`,`created_at`),
  ADD KEY `idx_mail_to` (`to_email`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gal_active` (`is_active`,`sort_order`),
  ADD KEY `fk_gal_category` (`category_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inq_status` (`status`,`created_at`),
  ADD KEY `idx_inq_type` (`type`),
  ADD KEY `fk_inq_property` (`property_id`),
  ADD KEY `fk_inq_project` (`project_id`),
  ADD KEY `fk_inq_user` (`user_id`),
  ADD KEY `fk_inq_admin` (`assigned_to`);

--
-- Indexes for table `investment_documents`
--
ALTER TABLE `investment_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_idoc_project` (`project_id`,`sort_order`),
  ADD KEY `fk_idoc_proj` (`project_id`);

--
-- Indexes for table `investment_images`
--
ALTER TABLE `investment_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iimg_project` (`project_id`,`sort_order`),
  ADD KEY `fk_iimg_proj` (`project_id`);

--
-- Indexes for table `investment_projects`
--
ALTER TABLE `investment_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ip_slug` (`slug`),
  ADD KEY `idx_ip_status` (`status`),
  ADD KEY `idx_ip_featured` (`is_featured`,`status`),
  ADD KEY `idx_ip_city` (`city`),
  ADD KEY `fk_ip_category` (`category_id`),
  ADD KEY `fk_ip_creator` (`created_by`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_media_path` (`path`),
  ADD KEY `idx_media_folder` (`folder`,`created_at`),
  ADD KEY `fk_media_user` (`uploaded_by`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_page_slug` (`slug`),
  ADD KEY `idx_page_status` (`status`),
  ADD KEY `fk_page_creator` (`created_by`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_post_slug` (`slug`),
  ADD KEY `idx_post_status` (`status`,`published_at`),
  ADD KEY `idx_post_featured` (`is_featured`),
  ADD KEY `fk_post_category` (`category_id`),
  ADD KEY `fk_post_author` (`author_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_prop_slug` (`slug`),
  ADD UNIQUE KEY `uq_prop_ref` (`ref_no`),
  ADD KEY `idx_prop_status` (`status`),
  ADD KEY `idx_prop_listing` (`listing_type`,`status`),
  ADD KEY `idx_prop_purpose` (`purpose`,`status`),
  ADD KEY `idx_prop_featured` (`is_featured`,`status`),
  ADD KEY `idx_prop_city` (`city`),
  ADD KEY `idx_prop_price` (`price`),
  ADD KEY `idx_prop_bed` (`bedrooms`),
  ADD KEY `idx_prop_created` (`created_at`),
  ADD KEY `idx_prop_agent` (`agent_id`),
  ADD KEY `fk_prop_category` (`category_id`),
  ADD KEY `fk_prop_creator` (`created_by`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pimg_property` (`property_id`,`sort_order`),
  ADD KEY `fk_pimg_prop` (`property_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_svc_slug` (`slug`),
  ADD KEY `idx_svc_active` (`is_active`,`sort_order`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_setting_key` (`setting_key`),
  ADD KEY `idx_setting_group` (`group_name`,`sort_order`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_test_active` (`is_active`,`sort_order`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`),
  ADD KEY `idx_users_status` (`status`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_fav` (`user_id`,`property_id`),
  ADD KEY `idx_fav_property` (`property_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `investment_documents`
--
ALTER TABLE `investment_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `investment_images`
--
ALTER TABLE `investment_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `investment_projects`
--
ALTER TABLE `investment_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_favorites`
--
ALTER TABLE `user_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `fk_act_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_cat_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `fk_gal_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `fk_inq_admin` FOREIGN KEY (`assigned_to`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_inq_project` FOREIGN KEY (`project_id`) REFERENCES `investment_projects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_inq_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_inq_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `investment_documents`
--
ALTER TABLE `investment_documents`
  ADD CONSTRAINT `fk_idoc_proj` FOREIGN KEY (`project_id`) REFERENCES `investment_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `investment_images`
--
ALTER TABLE `investment_images`
  ADD CONSTRAINT `fk_iimg_proj` FOREIGN KEY (`project_id`) REFERENCES `investment_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `investment_projects`
--
ALTER TABLE `investment_projects`
  ADD CONSTRAINT `fk_ip_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ip_creator` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_user` FOREIGN KEY (`uploaded_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_page_creator` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_post_author` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_post_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `fk_prop_agent` FOREIGN KEY (`agent_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prop_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prop_creator` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `fk_pimg_prop` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
