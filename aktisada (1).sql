-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 26, 2026 at 03:19 PM
-- Server version: 8.0.42-0ubuntu0.24.10.1
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aktisada`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_version`
--

CREATE TABLE `app_version` (
  `id` int NOT NULL,
  `app_version` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_version`
--

INSERT INTO `app_version` (`id`, `app_version`, `created_at`, `updated_at`) VALUES
(1, '1.0.1', '2025-09-11 04:02:09', '2025-09-11 04:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `billing_subscriptions`
--

CREATE TABLE `billing_subscriptions` (
  `id` int UNSIGNED NOT NULL,
  `fk_int_user_id` bigint NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `no_of_licenses` int DEFAULT NULL,
  `plan_type` int DEFAULT NULL,
  `services` text COLLATE utf8mb4_unicode_ci,
  `billing_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `promo_code_id` int DEFAULT NULL,
  `promo_code_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_subscriptions`
--

INSERT INTO `billing_subscriptions` (`id`, `fk_int_user_id`, `vendor_id`, `no_of_licenses`, `plan_type`, `services`, `billing_id`, `amount`, `promo_code_id`, `promo_code_value`, `additional_discount`, `currency`, `start_date`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 8, 0, 1, '[\"SCRATCH\"]', 1, 0, NULL, NULL, NULL, NULL, '2024-12-01', '2025-01-02', 1, '2023-07-25 04:29:02', '2023-07-25 04:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `pk_brand_id` bigint NOT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`pk_brand_id`, `brand_name`, `created_at`, `updated_at`) VALUES
(5, 'Somany', '2025-08-02 19:57:20', '2025-08-17 08:36:18'),
(21, 'Veritaas', '2025-09-08 12:15:02', '2025-09-08 12:15:02'),
(22, 'Perth', '2025-09-12 04:19:06', '2025-09-12 04:19:06'),
(23, 'GALIBS', '2025-09-12 04:22:34', '2025-09-12 04:22:34'),
(24, 'Simpolo', '2025-09-12 04:45:03', '2025-09-12 04:45:03'),
(25, 'LV', '2025-09-12 09:52:53', '2025-09-12 09:52:53'),
(26, 'RAK', '2025-09-12 09:53:14', '2025-09-12 09:53:14'),
(27, 'Vetican', '2025-09-12 10:38:46', '2025-09-12 10:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `pk_category_id` int NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `image_file` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`pk_category_id`, `category`, `image_file`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Tiles', 'category/721756563402.jpg', 1, 1, '2025-08-17 06:08:23', '2025-08-30 14:16:42'),
(5, 'Sanitary', 'category/551756563717.jpg', 1, 1, '2025-08-17 06:10:38', '2025-08-30 14:21:57'),
(6, 'Wash basins', 'category/121756563768.jpg', 1, 1, '2025-08-17 06:11:05', '2025-08-30 14:22:48'),
(7, 'Kitchen Sinks', 'category/191756563784.jpg', 1, 1, '2025-08-17 06:12:24', '2025-08-30 14:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` int DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `country_code`, `tax`, `code`, `currency`, `currency_code`, `flags`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'UNITED ARAB EMIRATES', 'AE', NULL, '971', 'United Arab Emirates Dirham', 'AED', '/backend/images/flag-icons/ae.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(2, 'AFGHANISTAN', 'AF', NULL, '93', 'Afghanistan Afghani', 'AFN', '/backend/images/flag-icons/af.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(3, 'NETHERLANDS ANTILLES', 'AN', NULL, '599', 'Netherlands Antillean guilder', 'ANG', '/backend/images/flag-icons/am.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(4, 'ARGENTINA', 'AR', NULL, '54', 'Argentine peso', 'ARS', '/backend/images/flag-icons/ar.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(5, 'AUSTRIA', 'AT', NULL, '43', 'Euro', 'EUR', '/backend/images/flag-icons/at.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(6, 'AUSTRALIA', 'AU', NULL, '61', 'Australian dollar', 'AUD', '/backend/images/flag-icons/au.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(7, 'BANGLADESH', 'BD', NULL, '880', 'Bangladeshi taka', 'BDT', '/backend/images/flag-icons/bd.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(8, 'BELGIUM', 'BE', NULL, '32', 'Euro', 'EUR', '/backend/images/flag-icons/be.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(9, 'BAHRAIN', 'BH', NULL, '973', 'Bahraini dinar', 'BHD', '/backend/images/flag-icons/bh.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(10, 'BRAZIL', 'BR', NULL, '55', 'Brazilian real', 'BRL', '/backend/images/flag-icons/br.png', NULL, '2019-04-01 05:34:05', '2019-04-01 05:34:05'),
(11, 'BHUTAN', 'BT', NULL, '975', 'Bhutanese ngultrum', 'BTN', '/backend/images/flag-icons/bt.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(12, 'CANADA', 'CA', NULL, '1', 'Canadian dollar', 'CAD', '/backend/images/flag-icons/ca.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(13, 'CONGO', 'CG', NULL, '242', 'Central African CFA franc', 'XAF', '/backend/images/flag-icons/cg.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(14, 'SWITZERLAND', 'CH', NULL, '41', 'wiss franc', 'CHF', '/backend/images/flag-icons/ch.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(15, 'CHILE', 'CL', NULL, '56', 'Chilean peso', 'CLP', '/backend/images/flag-icons/cl.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(16, 'CHINA', 'CN', NULL, '86', 'Renminbi|Chinese yuan', 'CNY', '/backend/images/flag-icons/cn.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(17, 'COLOMBIA', 'CO', NULL, '57', 'Colombian peso', 'COP', '/backend/images/flag-icons/co.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(18, 'COSTA RICA', 'CR', NULL, '506', 'Costa Rican colon', 'CRC', '/backend/images/flag-icons/cr.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(19, 'CUBA', 'CU', NULL, '53', 'Cuban peso', 'CUP', '/backend/images/flag-icons/cu.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(20, 'CZECH REPUBLIC', 'CZ', NULL, '420', 'Czech koruna', 'CZK', '/backend/images/flag-icons/cz.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(21, 'GERMANY', 'DE', NULL, '49', 'Euro', 'EUR', '/backend/images/flag-icons/de.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(22, 'DENMARK', 'DK', NULL, '45', 'Danish krone', 'DKK', '/backend/images/flag-icons/dk.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(23, 'ECUADOR', 'EC', NULL, '593', 'Ecuadorian sucre', 'ECS', '/backend/images/flag-icons/ec.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(24, 'SPAIN', 'ES', NULL, '34', 'Euro', 'EUR', '/backend/images/flag-icons/es.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(25, 'FINLAND', 'FI', NULL, '358', 'Euro', 'EUR', '/backend/images/flag-icons/fi.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(26, 'FRANCE', 'FR', NULL, '33', 'Euro', 'EUR', '/backend/images/flag-icons/fr.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(27, 'UNITED KINGDOM', 'GB', NULL, '44', 'Pound sterling', 'GBP', '/backend/images/flag-icons/gb.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(28, 'HONG KONG', 'HK', NULL, '852', 'Hong Kong dollar', 'HKD', '/backend/images/flag-icons/hn.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(29, 'INDIA', 'IN', NULL, '91', 'Indian rupee', 'INR', '/backend/images/flag-icons/in.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(30, 'IRAQ', 'IQ', NULL, '964', 'Iraqi dinar', 'IQD', '/backend/images/flag-icons/iq.png', NULL, '2019-04-01 05:34:06', '2019-04-01 05:34:06'),
(31, 'JAPAN', 'JP', NULL, '81', 'Japan Yen', 'JPY', '/backend/images/flag-icons/jp.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(32, 'KUWAIT', 'KW', NULL, '965', 'Kuwaiti dinar', 'KWD', '/backend/images/flag-icons/kw.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(33, 'SRI LANKA', 'LK', NULL, '94', 'Sri Lanka Rupee', 'LKR', '/backend/images/flag-icons/lk.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(34, 'MALAYSIA', 'MY', NULL, '60', 'Malaysia Ringgit', 'MYR', '/backend/images/flag-icons/my.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(35, 'NETHERLANDS', 'NL', NULL, '31', 'Euro', 'EUR', '/backend/images/flag-icons/nl.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(36, 'NEPAL', 'NP', NULL, '977', 'Nepal Rupee', 'NPR', '/backend/images/flag-icons/np.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(37, 'NEW ZEALAND', 'NZ', NULL, '64', 'New Zealand dollar', 'NZD', '/backend/images/flag-icons/nz.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(38, 'OMAN', 'OM', NULL, '968', 'Omani rial', 'OMR', '/backend/images/flag-icons/om.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(39, 'PHILIPPINES', 'PH', NULL, '63', 'Philippines Peso', 'PHP', '/backend/images/flag-icons/ph.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(40, 'PAKISTAN', 'PK', NULL, '92', 'Pakistani rupee', 'PKR', '/backend/images/flag-icons/pk.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(41, 'POLAND', 'PL', NULL, '48', 'Polish złoty', 'PLN', '/backend/images/flag-icons/pl.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(42, 'PORTUGAL', 'PT', NULL, '351', 'Euro', 'EUR', '/backend/images/flag-icons/pt.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(43, 'QATAR', 'QA', NULL, '974', 'Qatar Riyal', 'QAR', '/backend/images/flag-icons/qa.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(44, 'RUSSIAN FEDERATION', 'RU', NULL, '7', 'Russia Ruble', 'RUB', '/backend/images/flag-icons/ru.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(45, 'SAUDI ARABIA', 'SA', NULL, '966', 'Saudi Arabia Riyal', 'SAR', '/backend/images/flag-icons/sa.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(46, 'SINGAPORE', 'SG', NULL, '65', 'Singapore Dollar', 'SGD', '/backend/images/flag-icons/sg.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(47, 'TURKEY', 'TR', NULL, '90', 'Turkey Lira', 'TRL', '/backend/images/flag-icons/tr.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(48, 'UNITED STATES', 'US', NULL, '1', 'United States dollar', 'USD', '/backend/images/flag-icons/us.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(49, 'YEMEN', 'YE', NULL, '967', 'Yemeni rial', 'YER', '/backend/images/flag-icons/ye.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(50, 'SOUTH AFRICA', 'ZA', NULL, '27', 'South African rand', 'ZAR', '/backend/images/flag-icons/za.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07'),
(51, 'Ghana', 'GH', NULL, '233', 'Ghanaian Cedi', 'GHS', '/backend/images/flag-icons/za.png', NULL, '2019-04-01 05:34:07', '2019-04-01 05:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_sizes`
--

CREATE TABLE `item_sizes` (
  `pk_size_id` bigint NOT NULL,
  `category_id` int NOT NULL,
  `item_size` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_sizes`
--

INSERT INTO `item_sizes` (`pk_size_id`, `category_id`, `item_size`, `created_at`, `updated_at`) VALUES
(1, 4, '300x450 mm', '2025-08-17 18:12:50', '2025-08-30 17:58:09'),
(2, 4, '300x300 mm', '2025-08-26 14:14:51', '2025-08-30 17:58:31'),
(8, 4, '300x600 mm', '2025-08-30 17:59:40', '2025-08-30 17:59:40'),
(9, 4, '400x400 mm', '2025-09-08 06:53:31', '2025-09-08 06:53:31'),
(10, 4, '500x500 mm', '2025-09-08 06:55:57', '2025-09-08 06:55:57'),
(11, 4, '600x600 mm', '2025-09-08 06:57:47', '2025-09-08 06:57:47'),
(12, 4, '1200x600 mm', '2025-09-08 06:59:19', '2025-09-08 06:59:19'),
(13, 4, '800x800 mm', '2025-09-08 06:59:32', '2025-09-08 06:59:32'),
(14, 4, '1000x1000 mm', '2025-09-08 07:00:11', '2025-09-08 07:00:11'),
(15, 4, '1600x800 mm', '2025-09-08 07:00:34', '2025-09-08 07:00:34'),
(16, 4, '1800x1200 mm', '2025-09-08 07:00:51', '2025-09-08 07:00:51'),
(17, 4, '2400x1200 mm', '2025-09-08 07:01:48', '2025-09-08 07:01:48'),
(18, 4, '2400x800 mm', '2025-09-08 13:31:33', '2025-09-08 13:31:33'),
(19, 4, '3000x800 mm', '2025-09-08 13:31:41', '2025-09-08 13:31:41'),
(20, 4, '2800x1200 mm', '2025-09-08 13:31:52', '2025-09-08 13:31:52'),
(21, 4, '900x300 mm', '2025-09-08 13:32:26', '2025-09-08 13:32:26'),
(22, 4, '1000x300 mm', '2025-09-08 13:33:11', '2025-09-08 13:33:11'),
(23, 4, '1200x300 mm', '2025-09-08 13:33:27', '2025-09-08 13:33:27'),
(24, 5, 'NIL SIZE', '2025-09-12 06:09:58', '2025-09-12 06:09:58'),
(25, 6, 'NIL SIZE', '2025-09-12 06:10:05', '2025-09-12 06:10:05'),
(26, 7, 'NIL SIZE', '2025-09-12 06:10:09', '2025-09-12 06:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE `item_types` (
  `pk_type_id` bigint NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `type_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_types`
--

INSERT INTO `item_types` (`pk_type_id`, `category_id`, `type_name`, `created_at`, `updated_at`) VALUES
(4, 4, 'Soluble salt', '2025-08-17 08:26:31', '2025-08-17 08:26:31'),
(5, 4, 'Full body Vitrified', '2025-08-17 08:26:50', '2025-08-17 08:26:50'),
(9, 5, 'Orissa pan', '2025-08-30 14:28:21', '2025-08-30 14:28:21'),
(10, 5, 'EWC', '2025-08-30 14:28:28', '2025-08-30 14:28:28'),
(11, 5, 'Anglo Indian', '2025-08-30 14:28:39', '2025-08-30 14:28:39'),
(12, 5, 'One Piece Closet', '2025-08-30 14:28:58', '2025-08-30 14:28:58'),
(13, 5, 'Wall Mounted Closet', '2025-08-30 14:29:11', '2025-08-30 14:29:11'),
(14, 5, 'Extended Wall Mounted', '2025-08-30 14:29:28', '2025-08-30 14:29:28'),
(15, 5, 'Automatic One Piece', '2025-08-30 14:29:46', '2025-08-30 14:29:46'),
(16, 6, 'Table top', '2025-08-30 17:01:05', '2025-08-30 17:01:05'),
(17, 6, 'Counter top', '2025-08-30 17:01:16', '2025-08-30 17:01:16'),
(18, 6, 'Below counter', '2025-08-30 17:01:38', '2025-08-30 17:01:38'),
(19, 6, 'One piece wall hanging', '2025-08-30 17:01:53', '2025-08-30 17:01:53'),
(20, 6, '⁠Two piece wall hanging', '2025-08-30 17:02:17', '2025-08-30 17:02:17'),
(21, 6, 'Art basin', '2025-08-30 17:02:26', '2025-08-30 17:02:26'),
(22, 6, '⁠Full Pedestal', '2025-08-30 17:02:38', '2025-08-30 17:02:38'),
(23, 6, '⁠Cabinet', '2025-08-30 17:02:45', '2025-08-30 17:02:45'),
(24, 4, 'Ceramic Tile', '2025-08-30 17:52:41', '2025-08-30 17:52:41'),
(25, 4, 'Porcelain Tile', '2025-08-30 17:53:00', '2025-08-30 17:53:00'),
(26, 4, 'GVT', '2025-08-30 17:53:41', '2025-08-30 17:53:41'),
(27, 4, '15mm Slab', '2025-08-30 17:54:16', '2025-08-30 17:54:16'),
(28, 4, 'Step Tile', '2025-08-30 17:54:33', '2025-08-30 17:54:33'),
(29, 4, 'Terracotta Tile', '2025-08-30 17:55:03', '2025-08-30 17:55:03'),
(30, 4, 'Cladding Tiles (ceramic)', '2025-08-30 17:55:17', '2025-08-30 17:55:17'),
(31, 4, 'Cladding Tiles (Vitrified)', '2025-08-30 17:55:35', '2025-08-30 17:55:35'),
(32, 4, 'Natural Stones', '2025-08-30 17:56:00', '2025-08-30 17:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `pk_material_id` bigint NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `material_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`pk_material_id`, `category_id`, `material_name`, `created_at`, `updated_at`) VALUES
(2, 4, 'High glossy', '2025-08-17 08:29:18', '2025-08-17 08:29:18'),
(3, 4, 'Glossy', '2025-08-17 08:35:40', '2025-08-17 08:35:40'),
(8, 4, 'Matt', '2025-08-30 17:03:44', '2025-08-30 17:03:44'),
(9, 4, 'Posh', '2025-08-30 17:03:55', '2025-08-30 17:03:55'),
(10, 4, 'Feather touch', '2025-08-30 17:04:09', '2025-08-30 17:04:09'),
(11, 4, 'Carving', '2025-08-30 17:04:17', '2025-08-30 17:04:17'),
(12, 4, 'Paper Mat', '2025-08-30 17:04:33', '2025-09-12 06:07:13'),
(13, 4, 'Rustic', '2025-08-30 17:04:41', '2025-08-30 17:04:41'),
(14, 4, 'Sugar', '2025-08-30 17:04:48', '2025-08-30 17:04:48'),
(15, 5, 'No Material Types', '2025-09-12 06:12:12', '2025-09-12 06:12:12'),
(16, 6, 'No Material Types', '2025-09-12 06:12:45', '2025-09-12 06:12:45'),
(17, 7, 'No Material Types', '2025-09-12 06:12:50', '2025-09-12 06:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1631, 'scratch', '0f713238c211fdc95a80338c046d89d89050f72e34476e47d2051a222f9e430b', '[\"*\"]', NULL, NULL, '2025-01-20 04:19:45', '2025-01-20 04:19:45'),
(2, 'App\\Models\\User', 1631, 'scratch', '6780139b3ab5ff6745e7a14b41343e9b715bb5d861f1ea055b357e0b9b57614e', '[\"*\"]', NULL, NULL, '2025-01-20 04:22:43', '2025-01-20 04:22:43'),
(3, 'App\\Models\\User', 1631, 'scratch', '1e6344655372f047358d89c152a90b28c9bc94aef0895ddcf5ef70f63fed302d', '[\"*\"]', NULL, NULL, '2025-01-20 04:29:15', '2025-01-20 04:29:15'),
(4, 'App\\Models\\User', 1631, 'scratch', '1f5e8fac754a08cecb7e9706e6153bce8b66e098b826dd777f317761ae15434a', '[\"*\"]', NULL, NULL, '2025-01-20 04:29:51', '2025-01-20 04:29:51'),
(5, 'App\\Models\\User', 1631, 'scratchMyApp', '949cc39dde9c41bf2eab381fccf193a9872e27ac32661776a9991f9d1405bd4d', '[\"*\"]', NULL, NULL, '2025-01-20 04:51:20', '2025-01-20 04:51:20'),
(6, 'App\\Models\\User', 1631, 'scratchMyApp', '7ae3eb347f7fb18892628de1f823870a11d72feb975cd68a7b17519c3e0ae4c1', '[\"*\"]', NULL, NULL, '2025-01-20 04:51:52', '2025-01-20 04:51:52'),
(7, 'App\\Models\\User', 1631, 'scratchMyApp', 'e205ac4acaf34ade26c2d88e932f4bb09884554ca2f01f2a97516bdaea9ceb4f', '[\"*\"]', '2025-01-20 06:55:09', NULL, '2025-01-20 04:52:29', '2025-01-20 06:55:09'),
(8, 'App\\Models\\User', 1631, 'scratchMyApp', 'b6af471bd54f823a063a04009fcb54a8233011a5d4ee0eff79cff844d1f5a6a8', '[\"*\"]', '2025-01-20 23:31:52', NULL, '2025-01-20 22:30:23', '2025-01-20 23:31:52'),
(9, 'App\\Models\\User', 8, 'scratchMyApp', '28af0e9087be2ecb4d1df9714af2e11f7422a6a5f31866e089b9871a5a87eb22', '[\"*\"]', NULL, NULL, '2025-01-21 05:55:38', '2025-01-21 05:55:38'),
(10, 'App\\Models\\User', 1631, 'scratchMyApp', '12b5f612dd19861eeedbbf5d913cd40427b5a772f838aa1cc5b7eb4fcb361645', '[\"*\"]', '2025-06-19 10:54:46', NULL, '2025-06-19 09:46:14', '2025-06-19 10:54:46'),
(11, 'App\\Models\\User', 1631, 'scratchMyApp', '2709c7c232d52ecff478be8f3c84c04537e4ed6e49b0104afc602268529ea2a3', '[\"*\"]', '2025-06-19 11:13:43', NULL, '2025-06-19 10:55:03', '2025-06-19 11:13:43'),
(12, 'App\\Models\\User', 1631, 'scratchMyApp', 'd86acf121482469e7fdb4062085f5523c7d5aa08e2fe6417409265bc9fd58214', '[\"*\"]', '2025-07-25 07:03:44', NULL, '2025-06-19 11:16:15', '2025-07-25 07:03:44'),
(13, 'App\\Models\\User', 1631, 'scratchMyApp', '71bf7fef75f417a235dae3125c8bc21440387220480bbd841ba7c9b5fba2cd23', '[\"*\"]', NULL, NULL, '2025-07-19 18:03:13', '2025-07-19 18:03:13'),
(14, 'App\\Models\\User', 1631, 'scratchMyApp', '9e6f94254ed1fb6e8a7435be4e877af314998cd1245cfedc760110242041a87f', '[\"*\"]', NULL, NULL, '2025-07-19 18:03:18', '2025-07-19 18:03:18'),
(15, 'App\\Models\\User', 1631, 'scratchMyApp', '4ef835a11bb2e1a00ed2d08055fd203635808457a2d69603cdede99832e89803', '[\"*\"]', NULL, NULL, '2025-07-19 18:03:30', '2025-07-19 18:03:30'),
(16, 'App\\Models\\User', 1631, 'scratchMyApp', 'd55b4ff18317a828d93612100054eb386a4c2da48faf5f7e5e47923800f2479a', '[\"*\"]', NULL, NULL, '2025-07-19 18:10:10', '2025-07-19 18:10:10'),
(17, 'App\\Models\\User', 1631, 'scratchMyApp', '49123b79d2e8a12c0c4855833f18e7a25d2fbe0d2ba2a6efd0ac4657c171538d', '[\"*\"]', NULL, NULL, '2025-07-19 18:10:45', '2025-07-19 18:10:45'),
(18, 'App\\Models\\User', 1631, 'scratchMyApp', '455204f8795e04f8353ffb6b25381406e6bd73000c3a4e63816036feafd3146f', '[\"*\"]', '2025-07-19 18:14:21', NULL, '2025-07-19 18:12:45', '2025-07-19 18:14:21'),
(19, 'App\\Models\\User', 1631, 'scratchMyApp', 'e14c5653092c8a5aee5cb79b07a79a9b44127e896b81e7bb1d83544b5cb62ead', '[\"*\"]', '2025-07-19 20:37:36', NULL, '2025-07-19 20:27:53', '2025-07-19 20:37:36'),
(20, 'App\\Models\\User', 1631, 'scratchMyApp', '45ff5c69219df5313c98dbb0822d8f426d07a993610cfbeff36b269af406908c', '[\"*\"]', '2025-07-19 20:41:18', NULL, '2025-07-19 20:41:03', '2025-07-19 20:41:18'),
(21, 'App\\Models\\User', 1631, 'scratchMyApp', '7989131fda51160d84725fd1a749341035b9f2b293ff821bb39ea3aecaec7a46', '[\"*\"]', '2025-07-19 20:45:11', NULL, '2025-07-19 20:44:59', '2025-07-19 20:45:11'),
(22, 'App\\Models\\User', 1631, 'scratchMyApp', 'dd504e973d9c533ec0c27f2ebde945caea9105d20466b7b5ab60cefdd3db20f0', '[\"*\"]', '2025-07-19 20:48:56', NULL, '2025-07-19 20:48:38', '2025-07-19 20:48:56'),
(23, 'App\\Models\\User', 1631, 'scratchMyApp', '6ef1b779fcb70e11a567ccdb11738d4f5e65a98c525d65986c0378d14e83b3ce', '[\"*\"]', '2025-07-19 20:53:47', NULL, '2025-07-19 20:53:22', '2025-07-19 20:53:47'),
(24, 'App\\Models\\User', 1631, 'scratchMyApp', '88d6e84efaa1970298b993ea49ab4aac4e97b956c4c1a0bf7eb3eb98c871506a', '[\"*\"]', '2025-07-19 20:55:41', NULL, '2025-07-19 20:55:30', '2025-07-19 20:55:41'),
(25, 'App\\Models\\User', 1631, 'scratchMyApp', 'd7f7219251334ad99708da14205fc243ebd5721e09fcdd2f9844db2393e23a92', '[\"*\"]', '2025-07-20 07:14:08', NULL, '2025-07-20 07:05:15', '2025-07-20 07:14:08'),
(26, 'App\\Models\\User', 1631, 'scratchMyApp', 'd2bb5564c1c85608d777b36faca925e1ae8078ba29a86f8744da3f20639f4e9b', '[\"*\"]', '2025-07-20 08:52:35', NULL, '2025-07-20 07:19:45', '2025-07-20 08:52:35'),
(27, 'App\\Models\\User', 1631, 'scratchMyApp', '62bf6afdbfe54dbdf5a2dcf500b6f3aab4f0bc39d1aa898693ce5ed40e9cf92e', '[\"*\"]', '2025-07-20 07:50:50', NULL, '2025-07-20 07:49:52', '2025-07-20 07:50:50'),
(28, 'App\\Models\\User', 1631, 'scratchMyApp', '4604f6e5bee7348530512521571d442feedd501b963a5edd6461b991b27702cf', '[\"*\"]', '2025-07-20 08:42:58', NULL, '2025-07-20 08:07:49', '2025-07-20 08:42:58'),
(29, 'App\\Models\\User', 1631, 'scratchMyApp', '9a51025e5ec3f2c913e67c850510180097efdb8e46cc27bd79ea9e251ce61430', '[\"*\"]', '2025-07-20 08:22:25', NULL, '2025-07-20 08:22:06', '2025-07-20 08:22:25'),
(30, 'App\\Models\\User', 1631, 'scratchMyApp', 'ade4f94bf0de3b823f9a7d6e0dc9264cd3c6a5c5cb4808588cd2918b051e86fb', '[\"*\"]', '2025-07-20 08:50:17', NULL, '2025-07-20 08:50:16', '2025-07-20 08:50:17'),
(31, 'App\\Models\\User', 1631, 'scratchMyApp', '2d1859a03bb2eb833bc12e687579fdb66143e4f39a975383971ac620a0f7b271', '[\"*\"]', '2025-07-20 08:53:23', NULL, '2025-07-20 08:50:17', '2025-07-20 08:53:23'),
(32, 'App\\Models\\User', 1631, 'scratchMyApp', '5cb6b350770648301f98ae1bb6ea08de55b0feaea83db89dc4cea7a169c1af39', '[\"*\"]', '2025-07-20 09:14:16', NULL, '2025-07-20 08:59:28', '2025-07-20 09:14:16'),
(33, 'App\\Models\\User', 1631, 'scratchMyApp', '60297779646693fb9c8cde22ffceb16823f0379e703968a709ce46e828552f1a', '[\"*\"]', '2025-07-25 05:48:20', NULL, '2025-07-21 04:44:05', '2025-07-25 05:48:20'),
(34, 'App\\Models\\User', 1631, 'scratchMyApp', 'c3e6234c9873f2707b9d491bdc407a689e2808f04f9739e7469f9b8756d07c22', '[\"*\"]', '2025-07-21 05:27:45', NULL, '2025-07-21 04:50:41', '2025-07-21 05:27:45'),
(35, 'App\\Models\\User', 1631, 'scratchMyApp', '23755ce179dbfff4d9f56d08ef391d1ac559fa500098132835876bdace881e21', '[\"*\"]', '2025-07-21 07:31:39', NULL, '2025-07-21 07:29:46', '2025-07-21 07:31:39'),
(36, 'App\\Models\\User', 1631, 'scratchMyApp', 'ac72cd082aabd938df8d82ae215b251c1b9123296b0d2904b06b8f1b2562cacc', '[\"*\"]', '2025-07-21 09:11:40', NULL, '2025-07-21 08:18:42', '2025-07-21 09:11:40'),
(37, 'App\\Models\\User', 1631, 'scratchMyApp', '0b075c9fdb6584f8e4132d182d63af9319454a23ef6512ed18b3546eb9b22b7b', '[\"*\"]', '2025-07-21 08:29:43', NULL, '2025-07-21 08:28:56', '2025-07-21 08:29:43'),
(38, 'App\\Models\\User', 1631, 'scratchMyApp', '32e3a258c677b0d62fefde853a864102cd98794382c46e6782ed764aac2be485', '[\"*\"]', '2025-07-21 08:30:17', NULL, '2025-07-21 08:30:15', '2025-07-21 08:30:17'),
(39, 'App\\Models\\User', 1631, 'scratchMyApp', '0aa5dd6db995d5dac86dfd2cc6412399cc49a983f23c4262446a48844f09e3ab', '[\"*\"]', '2025-07-21 08:42:52', NULL, '2025-07-21 08:42:21', '2025-07-21 08:42:52'),
(40, 'App\\Models\\User', 1631, 'scratchMyApp', '88c5bf2222119eb757e195c986be6418e153f9c99f26051aa3cd5b46f4e4e002', '[\"*\"]', '2025-07-21 08:51:06', NULL, '2025-07-21 08:48:02', '2025-07-21 08:51:06'),
(41, 'App\\Models\\User', 1631, 'scratchMyApp', 'bf719ec0b24527a63fb81f9a3076677525659d66e8281b0f029c1b65fbcf9f81', '[\"*\"]', '2025-07-21 08:53:59', NULL, '2025-07-21 08:53:26', '2025-07-21 08:53:59'),
(42, 'App\\Models\\User', 1631, 'scratchMyApp', 'f0ac9c033d17b12bd4f364182d9a45332812b1e1585970f31c58e08b0fdc45cc', '[\"*\"]', '2025-07-21 08:57:49', NULL, '2025-07-21 08:57:17', '2025-07-21 08:57:49'),
(43, 'App\\Models\\User', 1631, 'scratchMyApp', '4c23ac10366d65cca0e7143c909e5b0c8f8468dd33b41cf7eb842a623d9f6cbb', '[\"*\"]', '2025-07-21 09:30:48', NULL, '2025-07-21 09:30:25', '2025-07-21 09:30:48'),
(44, 'App\\Models\\User', 1631, 'scratchMyApp', '87484c1e9fba680daa20f412386fc502ac2172cbf338d19627ed198779629d16', '[\"*\"]', '2025-07-21 09:32:44', NULL, '2025-07-21 09:31:57', '2025-07-21 09:32:44'),
(45, 'App\\Models\\User', 1631, 'scratchMyApp', '3691205a6513ed3ba094d670ac20489617bd94cf50ef945955c85209a77c15ae', '[\"*\"]', '2025-07-21 09:43:45', NULL, '2025-07-21 09:43:14', '2025-07-21 09:43:45'),
(46, 'App\\Models\\User', 1631, 'scratchMyApp', '8f0f9a26c17f8330358471712d0f39d010b6d5904cbb22adc8348e13c072c262', '[\"*\"]', '2025-07-21 09:51:42', NULL, '2025-07-21 09:50:58', '2025-07-21 09:51:42'),
(47, 'App\\Models\\User', 1631, 'scratchMyApp', '69f430a689241f3c628f89ac60e1bada875a31ddb1d4773189a5941f44830cfb', '[\"*\"]', '2025-07-21 12:14:19', NULL, '2025-07-21 10:06:36', '2025-07-21 12:14:19'),
(48, 'App\\Models\\User', 1631, 'scratchMyApp', 'c1c49bc20f7a6fbb9ab4b6b7b249aa801d14feb3d8d31946bf5e9966944f8423', '[\"*\"]', '2025-07-21 10:22:00', NULL, '2025-07-21 10:21:59', '2025-07-21 10:22:00'),
(49, 'App\\Models\\User', 1631, 'scratchMyApp', 'dcc44854b81adce4098e72bcaefa90e2d793592b32f8fde39e78a75af0310068', '[\"*\"]', '2025-07-21 10:23:45', NULL, '2025-07-21 10:23:44', '2025-07-21 10:23:45'),
(50, 'App\\Models\\User', 1631, 'scratchMyApp', 'c3374e39a65985f7125fc05269d5e942e378a3b9bd754dc7b86b59453a5287e2', '[\"*\"]', '2025-07-21 10:26:14', NULL, '2025-07-21 10:26:14', '2025-07-21 10:26:14'),
(51, 'App\\Models\\User', 1631, 'scratchMyApp', '76e541532773ffdc875ce165e6e9572cfe794eb2f0bc839c9d2023065a7f56f6', '[\"*\"]', '2025-07-21 10:29:56', NULL, '2025-07-21 10:29:55', '2025-07-21 10:29:56'),
(52, 'App\\Models\\User', 1631, 'scratchMyApp', '053eb55f8c373010e783d2a4b397ad76f2fa1621618b30078a4fdb190c38123e', '[\"*\"]', '2025-07-21 10:34:33', NULL, '2025-07-21 10:34:33', '2025-07-21 10:34:33'),
(53, 'App\\Models\\User', 1631, 'scratchMyApp', '386cddfbaadcb70166b0975f6607c736e32c86fa02cddf13b42907f577e3734b', '[\"*\"]', '2025-07-21 10:47:10', NULL, '2025-07-21 10:37:26', '2025-07-21 10:47:10'),
(54, 'App\\Models\\User', 1631, 'scratchMyApp', '8a711f6eb4125e2d02186688180dc8eec3084e5247f5bbca50df222544e65000', '[\"*\"]', '2025-07-21 10:47:37', NULL, '2025-07-21 10:47:37', '2025-07-21 10:47:37'),
(55, 'App\\Models\\User', 1631, 'scratchMyApp', 'c712a91c0165d9208c8474850ba5131f7689c455df67a3dbe8e7c3220a26d61b', '[\"*\"]', '2025-07-21 10:50:25', NULL, '2025-07-21 10:50:15', '2025-07-21 10:50:25'),
(56, 'App\\Models\\User', 1631, 'scratchMyApp', '11a541c9ff1fda384c9f2f19c9802096e433a82cb62c695605f72c7181ac7c00', '[\"*\"]', '2025-07-21 11:02:57', NULL, '2025-07-21 10:59:38', '2025-07-21 11:02:57'),
(57, 'App\\Models\\User', 1631, 'scratchMyApp', '6b2f84a952b65adaa23bb24cb4ad40ae1ce86c80d44997d7799ddd743e6b5e8b', '[\"*\"]', '2025-07-21 11:12:00', NULL, '2025-07-21 11:11:59', '2025-07-21 11:12:00'),
(58, 'App\\Models\\User', 1631, 'scratchMyApp', 'b92ca6835c4e0482c6c6086937d2679a32149383d854dde1556bcb32374473a9', '[\"*\"]', '2025-07-21 11:14:54', NULL, '2025-07-21 11:13:34', '2025-07-21 11:14:54'),
(59, 'App\\Models\\User', 1631, 'scratchMyApp', 'a374c08e615eae78c8d00c2e890a7f892cc08db20098d8454c92e43a157594b7', '[\"*\"]', '2025-07-21 11:20:01', NULL, '2025-07-21 11:19:05', '2025-07-21 11:20:01'),
(60, 'App\\Models\\User', 1631, 'scratchMyApp', 'f393054fe46f72bd7acd98bafff990c2114a466b27c1260aa7475a8968eefdbf', '[\"*\"]', '2025-07-21 11:21:37', NULL, '2025-07-21 11:21:26', '2025-07-21 11:21:37'),
(61, 'App\\Models\\User', 1631, 'scratchMyApp', '03e30940783332475d9d9536172fb0bae1fae41c8ec28622905292a1bc53aebe', '[\"*\"]', '2025-07-21 11:40:20', NULL, '2025-07-21 11:39:57', '2025-07-21 11:40:20'),
(62, 'App\\Models\\User', 1631, 'scratchMyApp', '2843e16eb2edf1cbf04644800e191f55d74a6da4472acdd3bea3752c7f08ecc0', '[\"*\"]', '2025-07-21 12:15:21', NULL, '2025-07-21 12:15:20', '2025-07-21 12:15:21'),
(63, 'App\\Models\\User', 1631, 'scratchMyApp', 'd058f8466a776b5e8337f7403457bcd73da4ce4626fb1841a045b787850a6742', '[\"*\"]', NULL, NULL, '2025-07-21 12:17:16', '2025-07-21 12:17:16'),
(64, 'App\\Models\\User', 1631, 'scratchMyApp', '746c2577e38bc155ab3040a8c2cb61c3918b8e73e72ab3a8542b88c9d31d1bf7', '[\"*\"]', '2025-07-21 15:05:51', NULL, '2025-07-21 15:05:48', '2025-07-21 15:05:51'),
(65, 'App\\Models\\User', 1631, 'scratchMyApp', 'a31d45053bc651cc719f80b68e04462b505e9f928a576dae11b1676cfe405fbd', '[\"*\"]', '2025-07-22 11:48:49', NULL, '2025-07-22 11:48:12', '2025-07-22 11:48:49'),
(66, 'App\\Models\\User', 1631, 'scratchMyApp', 'f2b01ccd582a987277159441924540c7a58887d1cbf740dc787206f3001a03d4', '[\"*\"]', '2025-07-22 12:41:04', NULL, '2025-07-22 12:39:31', '2025-07-22 12:41:04'),
(67, 'App\\Models\\User', 1642, 'scratchMyApp', '9f414411a120158d4a56ba52cd3783d829bbf20276e4fa480a2aa0e3be214ae0', '[\"*\"]', '2025-07-23 06:10:27', NULL, '2025-07-23 05:53:32', '2025-07-23 06:10:27'),
(68, 'App\\Models\\User', 1642, 'scratchMyApp', '1a4b1ee5e10240e576f49cf1a7e0e755580ed9bec85cad821f0f4ea9cee1f405', '[\"*\"]', '2025-07-23 06:13:07', NULL, '2025-07-23 06:12:53', '2025-07-23 06:13:07'),
(69, 'App\\Models\\User', 1642, 'scratchMyApp', '8fd403f2d43484f846a9309eb5fca68ecbf59937b77c034fe3ee713938b4066d', '[\"*\"]', '2025-07-23 06:22:55', NULL, '2025-07-23 06:22:50', '2025-07-23 06:22:55'),
(70, 'App\\Models\\User', 1642, 'scratchMyApp', 'ec1a109bbe9e83430a4dd6c0d6b27c8550f2d4a976de847c0afe629098190f43', '[\"*\"]', '2025-07-23 06:26:46', NULL, '2025-07-23 06:26:41', '2025-07-23 06:26:46'),
(71, 'App\\Models\\User', 1642, 'scratchMyApp', 'b57e70b889ae23718f76c4db642c2a22254ce7f653556200ec0d806b1d4da749', '[\"*\"]', '2025-07-23 06:29:19', NULL, '2025-07-23 06:29:18', '2025-07-23 06:29:19'),
(72, 'App\\Models\\User', 1631, 'scratchMyApp', '2bde61d42f4793a1dffdaa3fa28195605cf439b2471e86e27c3bf1326cf49e1b', '[\"*\"]', '2025-07-23 06:30:53', NULL, '2025-07-23 06:30:36', '2025-07-23 06:30:53'),
(73, 'App\\Models\\User', 1631, 'scratchMyApp', 'd8c8bdf8865188addb751b24a2f6baccb2df619679e1b7f87521c600e6e16158', '[\"*\"]', '2025-07-23 06:31:29', NULL, '2025-07-23 06:31:28', '2025-07-23 06:31:29'),
(74, 'App\\Models\\User', 1631, 'scratchMyApp', '0da94d6bcf0161ed3dfb99da15733e5a9ffbe84b19d0380007674ff76302c8b7', '[\"*\"]', '2025-07-23 06:39:27', NULL, '2025-07-23 06:34:33', '2025-07-23 06:39:27'),
(75, 'App\\Models\\User', 1631, 'scratchMyApp', 'd0ad606eb3a9bb2be8acb5d2b91eed7e332b985c0c700a90cc3471aab9792c9f', '[\"*\"]', '2025-07-23 06:40:00', NULL, '2025-07-23 06:39:59', '2025-07-23 06:40:00'),
(76, 'App\\Models\\User', 1642, 'scratchMyApp', '37cac23b6300bfea177d7f771a853c19c007d6cb4fe9d46d1d99757ee61459f3', '[\"*\"]', '2025-07-23 06:46:52', NULL, '2025-07-23 06:40:35', '2025-07-23 06:46:52'),
(77, 'App\\Models\\User', 1642, 'scratchMyApp', '60cb3e9a74094106bb0c32ac1e86537a6160099fac778738229c4590655b43a9', '[\"*\"]', '2025-07-23 07:04:44', NULL, '2025-07-23 07:03:18', '2025-07-23 07:04:44'),
(78, 'App\\Models\\User', 1642, 'scratchMyApp', '2b6bf67aeee6963d65bfbab80e1d9dfe3350deb90f17e6a56a84ab75c7d8dd81', '[\"*\"]', '2025-07-23 07:09:01', NULL, '2025-07-23 07:08:00', '2025-07-23 07:09:01'),
(79, 'App\\Models\\User', 1642, 'scratchMyApp', '4b03de431cf643b0976d5705d2674c93463458272ae2bd720b35a02238a4f324', '[\"*\"]', '2025-07-23 07:23:32', NULL, '2025-07-23 07:20:41', '2025-07-23 07:23:32'),
(80, 'App\\Models\\User', 1642, 'scratchMyApp', '802716a255708d5bd6e794ed1343642c7493ac20bb1759d630cc26adb17d72ac', '[\"*\"]', '2025-07-23 07:24:53', NULL, '2025-07-23 07:24:44', '2025-07-23 07:24:53'),
(81, 'App\\Models\\User', 1642, 'scratchMyApp', '3a9ecdb699a91841881e2b4fd93465f343f740b382238218616254a9f59510e2', '[\"*\"]', '2025-07-23 07:28:27', NULL, '2025-07-23 07:26:22', '2025-07-23 07:28:27'),
(82, 'App\\Models\\User', 1642, 'scratchMyApp', 'ea86881d3ae14857a823302bb9196b2bfbecb65ac6862be8da996f35737412f2', '[\"*\"]', '2025-07-23 07:47:16', NULL, '2025-07-23 07:46:47', '2025-07-23 07:47:16'),
(83, 'App\\Models\\User', 1631, 'scratchMyApp', 'a7d257649ffbacca715f57a62993b9dabd9d4208532af625f4de3ad71691dce8', '[\"*\"]', '2025-07-24 09:05:34', NULL, '2025-07-24 09:04:57', '2025-07-24 09:05:34'),
(84, 'App\\Models\\User', 1631, 'scratchMyApp', 'd86e55f5bdf4f321e47a89f8e0ef6378f5a48dbc4a45e9346ad953b450bbe869', '[\"*\"]', '2025-07-24 09:12:22', NULL, '2025-07-24 09:06:54', '2025-07-24 09:12:22'),
(85, 'App\\Models\\User', 1631, 'scratchMyApp', '9d2e624fd60080c7627a12b070d8085568fc2cb505ee062121656148caf0b422', '[\"*\"]', '2025-07-24 09:18:37', NULL, '2025-07-24 09:14:19', '2025-07-24 09:18:37'),
(86, 'App\\Models\\User', 1631, 'scratchMyApp', 'ee661839fc84c77134e30b5c7d8d2d1f48b00045e39520db1da69b97bcf494ed', '[\"*\"]', '2025-07-24 09:59:36', NULL, '2025-07-24 09:59:36', '2025-07-24 09:59:36'),
(87, 'App\\Models\\User', 1631, 'scratchMyApp', '4146b5fed98413d6dfe2e4778a4395f542d8ef223013b55a9467e76286bb6461', '[\"*\"]', '2025-07-24 10:02:59', NULL, '2025-07-24 10:02:59', '2025-07-24 10:02:59'),
(88, 'App\\Models\\User', 1642, 'scratchMyApp', '005a828442b9c7eebe9a80516d53bc972c7f87b26db8d958f7273dda3f549d87', '[\"*\"]', '2025-07-24 10:16:23', NULL, '2025-07-24 10:16:23', '2025-07-24 10:16:23'),
(89, 'App\\Models\\User', 1631, 'scratchMyApp', '0edb5247082a82468366bc6a10976fcbd3aad0ccded4b89148b05a1d8d8eec37', '[\"*\"]', '2025-07-24 10:28:10', NULL, '2025-07-24 10:26:52', '2025-07-24 10:28:10'),
(90, 'App\\Models\\User', 1631, 'scratchMyApp', '4933b25058fda2605409207d76daf36f121a068e68a0adf76588f03f17765b68', '[\"*\"]', '2025-07-24 10:33:51', NULL, '2025-07-24 10:31:03', '2025-07-24 10:33:51'),
(91, 'App\\Models\\User', 1631, 'scratchMyApp', '754480c78bf55483a0701ee45ed62d59dbb5242b18f76520f031607c337d46f7', '[\"*\"]', '2025-07-24 10:32:20', NULL, '2025-07-24 10:31:36', '2025-07-24 10:32:20'),
(92, 'App\\Models\\User', 1631, 'scratchMyApp', '1755bc8d7bb1b09997e37c9da4eb8aca9641162780ef9575af4849a8aa07e3cb', '[\"*\"]', '2025-07-24 11:33:33', NULL, '2025-07-24 11:33:30', '2025-07-24 11:33:33'),
(93, 'App\\Models\\User', 1631, 'scratchMyApp', 'f4596e31d3d8df09924593a367f99ac2a9653feb03968ae63fe674c6b3cb01f5', '[\"*\"]', '2025-07-24 11:37:56', NULL, '2025-07-24 11:35:44', '2025-07-24 11:37:56'),
(94, 'App\\Models\\User', 1631, 'scratchMyApp', 'e54dd9e65f60bb877830375e1313885132813c55c0f45fc34b5aa2b24d8dec4d', '[\"*\"]', '2025-07-24 11:51:49', NULL, '2025-07-24 11:51:47', '2025-07-24 11:51:49'),
(95, 'App\\Models\\User', 1631, 'scratchMyApp', '57bcb145a87b1284680d47b89c359684ca7e3e2bf03c18f23093219991fac256', '[\"*\"]', '2025-07-24 11:58:11', NULL, '2025-07-24 11:57:18', '2025-07-24 11:58:11'),
(96, 'App\\Models\\User', 1631, 'scratchMyApp', '77bf29b3939efd8ba0e5ab7844f8118653ab345b4aeba3f53eca146cbacafaac', '[\"*\"]', '2025-07-24 12:21:44', NULL, '2025-07-24 11:57:58', '2025-07-24 12:21:44'),
(97, 'App\\Models\\User', 1631, 'scratchMyApp', '46f9a452971b55955ecf1c0b0709f4377926cfe82e4ec92bfac0fafa121b7424', '[\"*\"]', '2025-07-24 12:01:17', NULL, '2025-07-24 11:58:01', '2025-07-24 12:01:17'),
(98, 'App\\Models\\User', 1642, 'scratchMyApp', '1548fb00c9f15db099149f3834312d42b0435e1e68684a3a98b82847a22108f2', '[\"*\"]', '2025-07-24 12:01:28', NULL, '2025-07-24 12:01:14', '2025-07-24 12:01:28'),
(99, 'App\\Models\\User', 1631, 'scratchMyApp', 'd66d859ce85af15eae94ac612088a9ad6a5f63ee831177f0fc1be2f7bdc469ca', '[\"*\"]', NULL, NULL, '2025-07-24 12:13:01', '2025-07-24 12:13:01'),
(100, 'App\\Models\\User', 1631, 'scratchMyApp', 'a8537b41955fcfb40575a65813d2b04e0cb431c54bcd7153c5a5ad4e8bfd5d67', '[\"*\"]', '2025-07-24 12:14:33', NULL, '2025-07-24 12:14:30', '2025-07-24 12:14:33'),
(101, 'App\\Models\\User', 1631, 'scratchMyApp', '7b4fa7dda61306335b18bca8d021130480f3409e0a906291c4fccd36fa4046ac', '[\"*\"]', '2025-07-24 12:32:21', NULL, '2025-07-24 12:32:18', '2025-07-24 12:32:21'),
(102, 'App\\Models\\User', 1631, 'scratchMyApp', '783235e728020dfe812d11d7af18eb2f2d9a23b7d3bbdd3d96137d4a4f243dbd', '[\"*\"]', '2025-07-25 07:03:21', NULL, '2025-07-24 12:54:43', '2025-07-25 07:03:21'),
(103, 'App\\Models\\User', 1642, 'scratchMyApp', '88ca907adf9a24ececbd58d9777e9e96a2c107c5b8b154adc08d1aff2ab82c52', '[\"*\"]', '2025-07-24 14:21:46', NULL, '2025-07-24 14:19:04', '2025-07-24 14:21:46'),
(104, 'App\\Models\\User', 1631, 'scratchMyApp', 'dc40c75d2611b1e55e67ca35ead4544db605a40ece0afc4fc6a14777a9fb4edd', '[\"*\"]', '2025-07-25 05:49:49', NULL, '2025-07-24 14:48:33', '2025-07-25 05:49:49'),
(105, 'App\\Models\\User', 1631, 'scratchMyApp', '2849c8b320d156cb856b0aeffbbc2f7c5fefc29afd8400a2dcb9808f11a3ee8d', '[\"*\"]', NULL, NULL, '2025-07-24 14:50:01', '2025-07-24 14:50:01'),
(106, 'App\\Models\\User', 1642, 'scratchMyApp', '6a00495b1e6d86d013a30fdff0b067f0e24621183498b829b6dbab98b1953a92', '[\"*\"]', '2025-07-24 15:28:15', NULL, '2025-07-24 15:26:20', '2025-07-24 15:28:15'),
(107, 'App\\Models\\User', 1631, 'scratchMyApp', '3535c69b2c0b7f68495db7bf0634058df0c6acc3c16a57322086e06bf666fffe', '[\"*\"]', '2025-07-25 04:05:34', NULL, '2025-07-25 03:05:44', '2025-07-25 04:05:34'),
(108, 'App\\Models\\User', 1631, 'scratchMyApp', '561579993f5d150775dd16fc371d8fa6df6b455f6711333a283ec2346030821d', '[\"*\"]', '2025-07-25 03:14:02', NULL, '2025-07-25 03:12:49', '2025-07-25 03:14:02'),
(109, 'App\\Models\\User', 1643, 'scratchMyApp', '208f1a53a54f8e67b8b7afde4fc4774b79fb2e69fe058e5fe8ec45b28a56caf7', '[\"*\"]', '2025-07-25 04:07:25', NULL, '2025-07-25 04:06:27', '2025-07-25 04:07:25'),
(110, 'App\\Models\\User', 1671, 'scratchMyApp', '8d1a805545bec82ca2780bde12eba5a5e7c5b6dfd69b2855dfac3846993c1d99', '[\"*\"]', '2025-07-25 04:38:39', NULL, '2025-07-25 04:34:00', '2025-07-25 04:38:39'),
(111, 'App\\Models\\User', 1660, 'scratchMyApp', '7ec013aba928d34c4c0071905a6cc1d2b9bd52460c5c1bd9d1e1faacc97c0ab1', '[\"*\"]', '2025-07-25 04:50:48', NULL, '2025-07-25 04:42:24', '2025-07-25 04:50:48'),
(112, 'App\\Models\\User', 1643, 'scratchMyApp', '0c94554937447e4254bf6c8baf52f3959f9e242f2c17e2de186b0d86a55c2be0', '[\"*\"]', '2025-07-25 04:53:20', NULL, '2025-07-25 04:51:57', '2025-07-25 04:53:20'),
(113, 'App\\Models\\User', 1642, 'scratchMyApp', '0091df9447ea5c9ad8d4561074fbc1a431f80f875a7969d8dcf080eae675e47e', '[\"*\"]', '2025-07-25 06:21:23', NULL, '2025-07-25 04:53:41', '2025-07-25 06:21:23'),
(114, 'App\\Models\\User', 1642, 'scratchMyApp', '232eca3fcd6905d0ea067a993018409a0ef7eeee3f7da36d4ff179bf84b0680a', '[\"*\"]', '2025-07-25 05:45:55', NULL, '2025-07-25 05:44:40', '2025-07-25 05:45:55'),
(115, 'App\\Models\\User', 1642, 'scratchMyApp', '30a66a42a409c204142018c1088188f0cfdd2a1e46e3c3d0d4f7b151a4936726', '[\"*\"]', '2025-07-25 07:00:39', NULL, '2025-07-25 05:50:33', '2025-07-25 07:00:39'),
(116, 'App\\Models\\User', 1642, 'scratchMyApp', '5757b87a095c1e15797de04a75a5c02c02419cebd2f1ebe5f2fdbb9c2ec7d319', '[\"*\"]', '2025-07-25 06:59:42', NULL, '2025-07-25 06:58:39', '2025-07-25 06:59:42'),
(117, 'App\\Models\\User', 1642, 'scratchMyApp', '710327fbc10b6d5e0944b988f55fe1b69ea522176872c6e0be8aaca05fd57e1f', '[\"*\"]', '2025-07-25 15:21:10', NULL, '2025-07-25 07:01:44', '2025-07-25 15:21:10'),
(118, 'App\\Models\\User', 1631, 'scratchMyApp', 'f18c773134ee9b4c6bce5c309406786c3953328f515f1878913893b045c2ab07', '[\"*\"]', '2025-07-25 15:29:11', NULL, '2025-07-25 07:07:28', '2025-07-25 15:29:11'),
(119, 'App\\Models\\User', 1642, 'scratchMyApp', '803a219ca22cdd8be9941ee4657e2a0e619ac5a72db3cce97ba85de52914f40c', '[\"*\"]', '2025-07-25 07:18:50', NULL, '2025-07-25 07:18:13', '2025-07-25 07:18:50'),
(120, 'App\\Models\\User', 1642, 'scratchMyApp', '29eb2bfdc16033baf1c3e9fee5b6f9e7cbb148eeb258c4ff71b4834412a1bf9d', '[\"*\"]', '2025-07-25 07:24:12', NULL, '2025-07-25 07:21:29', '2025-07-25 07:24:12'),
(121, 'App\\Models\\User', 1642, 'scratchMyApp', '8f1d87fe166471ced54c2eccf0fd5b667a5b5b208371d81b684a01f7e5cd2c10', '[\"*\"]', '2025-07-25 07:55:58', NULL, '2025-07-25 07:45:38', '2025-07-25 07:55:58'),
(122, 'App\\Models\\User', 1642, 'scratchMyApp', 'baef0135cbec4dee2f3e2c3b49a9555df1682bb274d8298d0e556f317c3e08ef', '[\"*\"]', '2025-07-25 08:11:29', NULL, '2025-07-25 07:52:46', '2025-07-25 08:11:29'),
(123, 'App\\Models\\User', 1642, 'scratchMyApp', '59ccb025bb1e5180c41ee2b4eaf45756c2f43870ad7b14454cd6ccbe98fa8576', '[\"*\"]', '2025-07-25 07:57:10', NULL, '2025-07-25 07:56:19', '2025-07-25 07:57:10'),
(124, 'App\\Models\\User', 1642, 'scratchMyApp', 'f297d326852f50e49e64e78ed23aa08b41bbeb7f9138073749597ad68748c93e', '[\"*\"]', '2025-07-25 08:18:21', NULL, '2025-07-25 08:17:27', '2025-07-25 08:18:21'),
(125, 'App\\Models\\User', 1642, 'scratchMyApp', '9942a66f7ff09a43a8062c36c05ed8e4d2cff70ce9c5c1af8801cc5d4dd9f06a', '[\"*\"]', '2025-07-25 14:04:01', NULL, '2025-07-25 13:59:16', '2025-07-25 14:04:01'),
(126, 'App\\Models\\User', 1642, 'scratchMyApp', 'b020e9b6bfaf37da2ef7d2e84e5247771317cd3c536d16d998524cc41adb5615', '[\"*\"]', '2025-07-25 14:21:48', NULL, '2025-07-25 14:09:41', '2025-07-25 14:21:48'),
(127, 'App\\Models\\User', 1642, 'scratchMyApp', '1883112b355cb2320433c30164a7c6a8077c359b3d6a34e397104723e8f6292a', '[\"*\"]', '2025-07-25 14:33:47', NULL, '2025-07-25 14:32:07', '2025-07-25 14:33:47'),
(128, 'App\\Models\\User', 1642, 'scratchMyApp', 'c5e5d0fb7189ba578bcb0040d2a438ab2f14fd1194630737a23eaba0eac8a3fb', '[\"*\"]', '2025-07-25 14:41:55', NULL, '2025-07-25 14:36:30', '2025-07-25 14:41:55'),
(129, 'App\\Models\\User', 1642, 'scratchMyApp', '20603cd06373303ce13c530675d52839151597216074bd995a165d5116c066ee', '[\"*\"]', '2025-07-25 15:09:28', NULL, '2025-07-25 15:05:42', '2025-07-25 15:09:28'),
(130, 'App\\Models\\User', 1642, 'scratchMyApp', '8c196208709a393cde06baea6c1ac8daf61342e7c5d97408eae3bd3eed4a6f2e', '[\"*\"]', '2025-07-25 15:56:26', NULL, '2025-07-25 15:30:17', '2025-07-25 15:56:26'),
(131, 'App\\Models\\User', 1642, 'scratchMyApp', '1e5b0d251f626d73a362ae455a5e899b2112f41195f14d29835d0a3d72e76828', '[\"*\"]', '2025-07-25 16:15:36', NULL, '2025-07-25 15:59:18', '2025-07-25 16:15:36'),
(132, 'App\\Models\\User', 1642, 'scratchMyApp', '387ebcd05e9c1a63d1b6a139dd31ef1b6936d1b8f25708d314592aeede1b1d5b', '[\"*\"]', '2025-07-26 05:27:56', NULL, '2025-07-25 16:29:09', '2025-07-26 05:27:56'),
(133, 'App\\Models\\User', 1642, 'scratchMyApp', '00a3411eb74072e26b5028be5d69cf1d2a250d14ee6e5df3570cc24cc5d8dc5e', '[\"*\"]', '2025-07-25 16:53:45', NULL, '2025-07-25 16:40:56', '2025-07-25 16:53:45'),
(134, 'App\\Models\\User', 1671, 'scratchMyApp', '268efe3be36544ca027916c994af3371ed7eb743478fa813502ebb8910d78d70', '[\"*\"]', '2025-07-28 03:51:07', NULL, '2025-07-26 04:22:23', '2025-07-28 03:51:07'),
(135, 'App\\Models\\User', 1631, 'scratchMyApp', '725f5b68c32a4a2ee05fee70b82ac7ec2eab31468366d4c29920b24f0a3f85ea', '[\"*\"]', '2025-07-26 04:49:37', NULL, '2025-07-26 04:47:23', '2025-07-26 04:49:37'),
(136, 'App\\Models\\User', 1631, 'scratchMyApp', '0cb0b0258b8667e9719211532bfee0bc13eeda91ec1b83a85c80e74afce1ebe3', '[\"*\"]', '2025-07-26 04:56:09', NULL, '2025-07-26 04:53:37', '2025-07-26 04:56:09'),
(137, 'App\\Models\\User', 1642, 'scratchMyApp', '4ef83b8bd17e925690b16a7a0b3146c9e16f76a22bee519c4396ed82a2e2e91a', '[\"*\"]', '2025-07-26 05:28:20', NULL, '2025-07-26 05:28:14', '2025-07-26 05:28:20'),
(138, 'App\\Models\\User', 1668, 'scratchMyApp', '73aa586734ba476674e415d2e1531ea404acf6ae3dad7eafd0859b3b0f5c7614', '[\"*\"]', '2025-07-26 09:26:24', NULL, '2025-07-26 09:24:39', '2025-07-26 09:26:24'),
(139, 'App\\Models\\User', 1642, 'scratchMyApp', '3d76f0d6a55cddb4d4722b12e9c1605eb989fb40a9734b233c7e7e4490e2c53e', '[\"*\"]', '2025-07-26 12:28:03', NULL, '2025-07-26 12:25:10', '2025-07-26 12:28:03'),
(140, 'App\\Models\\User', 1670, 'scratchMyApp', '8af689908c2ceffdc4c7b389ae1ce8fcfcb27169514b5cec61ed93d9408ad9e8', '[\"*\"]', '2025-07-26 13:08:57', NULL, '2025-07-26 13:07:30', '2025-07-26 13:08:57'),
(141, 'App\\Models\\User', 1671, 'scratchMyApp', '122957e3ba6734bb63101f6b91f8d6d9e008dd1dab70258a4aef47b22a6ae4a1', '[\"*\"]', '2025-07-28 03:51:46', NULL, '2025-07-28 03:51:46', '2025-07-28 03:51:46'),
(142, 'App\\Models\\User', 1671, 'scratchMyApp', 'fc537760ef00e39685fafab85b72b7160a4274d9d9965a9f0f0c206e75c37b9c', '[\"*\"]', '2025-07-28 04:00:49', NULL, '2025-07-28 03:52:21', '2025-07-28 04:00:49'),
(143, 'App\\Models\\User', 1661, 'scratchMyApp', 'f6b32ac94de3f13119259594f89078a82329e0653d47d8f13d33b5cbea02a466', '[\"*\"]', '2025-07-28 04:04:24', NULL, '2025-07-28 03:59:28', '2025-07-28 04:04:24'),
(144, 'App\\Models\\User', 1646, 'scratchMyApp', 'cbf905d3099df9c6ad5099a5d355b8e877ea0d84e178d976f252499a537827fb', '[\"*\"]', '2025-07-28 04:05:20', NULL, '2025-07-28 04:05:19', '2025-07-28 04:05:20'),
(145, 'App\\Models\\User', 1646, 'scratchMyApp', '12dd2c67e73cf8c23184fb5d137513ce6b157b1913c61080017734e1362e0544', '[\"*\"]', '2025-07-28 04:05:39', NULL, '2025-07-28 04:05:36', '2025-07-28 04:05:39'),
(146, 'App\\Models\\User', 1648, 'scratchMyApp', 'f34a41806af76d774bc1aebbb18e97cb551aacb69a8c943922456770f7827857', '[\"*\"]', '2025-07-28 04:21:16', NULL, '2025-07-28 04:08:22', '2025-07-28 04:21:16'),
(147, 'App\\Models\\User', 1646, 'scratchMyApp', '437b18524fa89ed2cb877d6f931e775c27f02cad9d50cc1a669a38759603660a', '[\"*\"]', '2025-07-28 04:16:33', NULL, '2025-07-28 04:10:49', '2025-07-28 04:16:33'),
(148, 'App\\Models\\User', 1671, 'scratchMyApp', 'feb78bc5e28b8db7579fddd8a6d4ec7d20c9764da7246064e29df43b82adeea5', '[\"*\"]', '2025-07-28 04:19:34', NULL, '2025-07-28 04:16:40', '2025-07-28 04:19:34'),
(149, 'App\\Models\\User', 1662, 'scratchMyApp', 'd6dfa3ef7caeaffbee755875f3f0a0309e317dfbf7de403b95724d1e1d078c0d', '[\"*\"]', '2025-07-28 04:21:37', NULL, '2025-07-28 04:21:34', '2025-07-28 04:21:37'),
(150, 'App\\Models\\User', 1649, 'scratchMyApp', '1a96db0a4be1c34db88962a7afe866f234029836c7f37a7bdbd9c462ebb3c7f9', '[\"*\"]', '2025-07-28 04:21:42', NULL, '2025-07-28 04:21:36', '2025-07-28 04:21:42'),
(151, 'App\\Models\\User', 1646, 'scratchMyApp', '6dcfe47f3794d8e38543df59cb77185178590ae436c2c2b2b03452eaa528d572', '[\"*\"]', '2025-07-28 04:23:00', NULL, '2025-07-28 04:22:56', '2025-07-28 04:23:00'),
(152, 'App\\Models\\User', 1649, 'scratchMyApp', '5f13a7aed1a5813011e7a6b892d3062390571a927e9570b1e6e0fd358f3f1d88', '[\"*\"]', '2025-07-28 04:30:49', NULL, '2025-07-28 04:23:17', '2025-07-28 04:30:49'),
(153, 'App\\Models\\User', 1646, 'scratchMyApp', 'c7a2b2eb1bcb41fe5f1810c336ae3477e7df3100419da1fcf462921542faa6e7', '[\"*\"]', '2025-07-28 04:26:03', NULL, '2025-07-28 04:25:12', '2025-07-28 04:26:03'),
(154, 'App\\Models\\User', 1650, 'scratchMyApp', 'dd10889ae9e3e2d48c2b9d2145c4cc18b4842b2d58ce90915592d5d103b5f61f', '[\"*\"]', '2025-07-28 04:28:33', NULL, '2025-07-28 04:27:47', '2025-07-28 04:28:33'),
(155, 'App\\Models\\User', 1662, 'scratchMyApp', '383ed8c8d010fbb4afbdeab7da8fb54e581cfe6395f0b15d19789e52788e0c7d', '[\"*\"]', '2025-07-28 04:28:44', NULL, '2025-07-28 04:28:29', '2025-07-28 04:28:44'),
(156, 'App\\Models\\User', 1650, 'scratchMyApp', '2658abefd7093dbd47d02315debe7043451be907f22d1962e578907bbf171349', '[\"*\"]', '2025-07-28 04:36:55', NULL, '2025-07-28 04:29:26', '2025-07-28 04:36:55'),
(157, 'App\\Models\\User', 1674, 'scratchMyApp', '8f89d2d0c214a6ac7555a044fe9616082cfa872d6633f5e79fd1d98fa48906d3', '[\"*\"]', '2025-07-28 04:53:59', NULL, '2025-07-28 04:33:19', '2025-07-28 04:53:59'),
(158, 'App\\Models\\User', 1643, 'scratchMyApp', '50c71eaf0214fc0736b5a48d63261f21272be3294f4d6da37abde51d7b1d7ca5', '[\"*\"]', '2025-07-28 04:37:22', NULL, '2025-07-28 04:37:18', '2025-07-28 04:37:22'),
(159, 'App\\Models\\User', 1651, 'scratchMyApp', 'df2680eb544d868d500614a08235cdc2bbcd55000df9ab81119bcea5c9999ec2', '[\"*\"]', '2025-07-28 04:42:53', NULL, '2025-07-28 04:42:52', '2025-07-28 04:42:53'),
(160, 'App\\Models\\User', 1650, 'scratchMyApp', 'fa090121350afbf2fbed6f467da3644a6cb029e4ddb9a8f0c94c47c20b102816', '[\"*\"]', '2025-07-28 04:43:31', NULL, '2025-07-28 04:43:18', '2025-07-28 04:43:31'),
(161, 'App\\Models\\User', 1663, 'scratchMyApp', 'da0391d6f010060d0d10c85450aa619b2b5ae9ecb68f94a738581029e542ebb1', '[\"*\"]', '2025-07-28 04:47:31', NULL, '2025-07-28 04:44:21', '2025-07-28 04:47:31'),
(162, 'App\\Models\\User', 1663, 'scratchMyApp', 'ce2896532a025d8221b3765d3f631e1658b87fb2f28d5d401e6f9670c075a52d', '[\"*\"]', '2025-07-28 05:16:34', NULL, '2025-07-28 04:49:28', '2025-07-28 05:16:34'),
(163, 'App\\Models\\User', 1674, 'scratchMyApp', '780003c5f28aadb38b9524eb7ff6cc7791b4ee175e34431f7eeeb55c741354e2', '[\"*\"]', '2025-07-28 05:06:00', NULL, '2025-07-28 05:03:28', '2025-07-28 05:06:00'),
(164, 'App\\Models\\User', 1646, 'scratchMyApp', 'be48a56f0ab19be087e22f265f538f67b8b1c74405476d4821ff53cc6de33cfa', '[\"*\"]', '2025-07-28 05:05:49', NULL, '2025-07-28 05:05:49', '2025-07-28 05:05:49'),
(165, 'App\\Models\\User', 1646, 'scratchMyApp', 'd45f7c1de82edd94774f3a53121ba53faa817092537eaa39fcc41fe3d1d04b73', '[\"*\"]', '2025-07-28 05:06:40', NULL, '2025-07-28 05:06:35', '2025-07-28 05:06:40'),
(166, 'App\\Models\\User', 1643, 'scratchMyApp', 'c4ee4c4337a66c6a586e764e4b12d5249e170638a0b405f8ef01ea059166b26c', '[\"*\"]', '2025-07-28 05:07:24', NULL, '2025-07-28 05:07:23', '2025-07-28 05:07:24'),
(167, 'App\\Models\\User', 1648, 'scratchMyApp', '77d1f9c3a0d11f3ec39b475182e36431461e0d109549d0cb20a9fcf6e56a8fb4', '[\"*\"]', '2025-07-28 05:11:59', NULL, '2025-07-28 05:11:59', '2025-07-28 05:11:59'),
(168, 'App\\Models\\User', 1648, 'scratchMyApp', 'ff87be34146d0e8a7c79681d2cf6505849288e7d7818fd1792eba3b0435d4472', '[\"*\"]', '2025-07-28 05:13:04', NULL, '2025-07-28 05:12:57', '2025-07-28 05:13:04'),
(169, 'App\\Models\\User', 1646, 'scratchMyApp', '1d0f699862b838fa0d8032557cd13e68a7786b18bdbc8eafff2bb8cdc5fb2bda', '[\"*\"]', '2025-07-28 05:20:47', NULL, '2025-07-28 05:20:47', '2025-07-28 05:20:47'),
(170, 'App\\Models\\User', 1645, 'scratchMyApp', '9545fd74a2d75c20d39a53dae0adf1a91263a53495a0196d90e6493b031eeed7', '[\"*\"]', NULL, NULL, '2025-07-28 05:22:27', '2025-07-28 05:22:27'),
(171, 'App\\Models\\User', 1648, 'scratchMyApp', '20543bf9f7fb42f9c6a4e4c8d3e10f29a99f699871eaeb07d502940c294e7d7d', '[\"*\"]', '2025-07-28 05:29:57', NULL, '2025-07-28 05:29:39', '2025-07-28 05:29:57'),
(172, 'App\\Models\\User', 1648, 'scratchMyApp', 'a047444769fa2fbfe65474175a7d1441500ac723f20aee041cdeb596acbaee96', '[\"*\"]', '2025-07-28 05:30:23', NULL, '2025-07-28 05:30:19', '2025-07-28 05:30:23'),
(173, 'App\\Models\\User', 1645, 'scratchMyApp', 'dea7cbbf1451b640718b607ac1e7f5c86612f6cc364ff2cd0f73c129e6e4fd2d', '[\"*\"]', NULL, NULL, '2025-07-28 05:31:41', '2025-07-28 05:31:41'),
(174, 'App\\Models\\User', 1646, 'scratchMyApp', 'f8a17670b3e75a28c694cf07a57ba441d6dfb15faa13302bcbb229ac2d514f8a', '[\"*\"]', '2025-07-28 05:32:16', NULL, '2025-07-28 05:32:15', '2025-07-28 05:32:16'),
(175, 'App\\Models\\User', 1646, 'scratchMyApp', 'a159d177b0d27d1b90822db79a5553cf3600848862e0ad7ad621d2a8b0b95ece', '[\"*\"]', '2025-07-28 05:36:26', NULL, '2025-07-28 05:34:31', '2025-07-28 05:36:26'),
(176, 'App\\Models\\User', 1645, 'scratchMyApp', 'e1071ebc92ff79dcb42c0a4f6b977b81cdae7142c54d212e3a145d87ff760960', '[\"*\"]', '2025-07-28 05:43:36', NULL, '2025-07-28 05:35:08', '2025-07-28 05:43:36'),
(177, 'App\\Models\\User', 1646, 'scratchMyApp', 'a67012b5c8781b65b4d6d3110919185a6b0a4a9f41173be7b737e96c5de09f7b', '[\"*\"]', '2025-07-28 05:39:48', NULL, '2025-07-28 05:39:48', '2025-07-28 05:39:48'),
(178, 'App\\Models\\User', 1, 'aktisada', '249d26e40c62f211cb3f6d86e7a1117ee1b0992d422d47bd6b13cb7301529fa7', '[\"*\"]', '2025-08-02 16:20:14', NULL, '2025-08-01 20:51:24', '2025-08-02 16:20:14'),
(179, 'App\\Models\\User', 1, 'aktisada', '93e929ff559e483154a2a88c701e8902d61f252406c7935ba792761616f96a86', '[\"*\"]', NULL, NULL, '2025-08-09 13:50:18', '2025-08-09 13:50:18'),
(180, 'App\\Models\\User', 1, 'aktisada', 'e597e8185295ff7b7490d9aa234638a762c5d59c2f1bc986ea49e228909fad78', '[\"*\"]', NULL, NULL, '2025-08-09 13:50:51', '2025-08-09 13:50:51'),
(181, 'App\\Models\\User', 1, 'aktisada', '241a3ac5df1c7d4c210b276a0ff59f28c48b5380332e7ad50f3f1636eeb7fae0', '[\"*\"]', NULL, NULL, '2025-08-09 14:00:03', '2025-08-09 14:00:03'),
(182, 'App\\Models\\User', 1, 'aktisada', 'f311c9456efd1c4e95c414e3eaabfea79dba8bc58303d3a8100210f8b3ec3372', '[\"*\"]', '2025-08-16 14:58:58', NULL, '2025-08-16 14:48:50', '2025-08-16 14:58:58'),
(183, 'App\\Models\\User', 1, 'aktisada', 'bc9ae45a62946756ce70bfc8847c8238c0ef497e9c484ad4586a7670eb3deed2', '[\"*\"]', '2025-08-19 04:21:17', NULL, '2025-08-17 06:44:13', '2025-08-19 04:21:17'),
(184, 'App\\Models\\User', 6, 'aktisada', '621b0c7cacc33ddda5aab790613e30597ee6b7f6bf176177a1d693ff49d08ae5', '[\"*\"]', '2025-08-18 10:02:10', NULL, '2025-08-18 10:02:10', '2025-08-18 10:02:10'),
(185, 'App\\Models\\User', 6, 'aktisada', 'c8f90b822e5faf607de9ecafbe0745c6dc8b7434cd19a5732810258830a29085', '[\"*\"]', '2025-08-18 17:19:32', NULL, '2025-08-18 10:05:45', '2025-08-18 17:19:32'),
(186, 'App\\Models\\User', 1, 'aktisada', '9a1a91ecf4938727dc5d10eef06a7067413bb73e86c0116938f14228341ee7a2', '[\"*\"]', '2025-08-19 04:08:24', NULL, '2025-08-19 04:01:52', '2025-08-19 04:08:24'),
(187, 'App\\Models\\User', 6, 'aktisada', 'e44c500b827a236239c537d4c325fb4d65d97da43d91bb5901fb7b510716d569', '[\"*\"]', '2025-08-24 19:00:12', NULL, '2025-08-22 08:14:09', '2025-08-24 19:00:12'),
(188, 'App\\Models\\User', 1, 'aktisada', '8a157c36bf5d2137517f11a5401de29e1aa27e3751c2fb7fb2d9927ce4e2f0f6', '[\"*\"]', '2025-08-22 16:10:51', NULL, '2025-08-22 16:09:56', '2025-08-22 16:10:51'),
(189, 'App\\Models\\User', 1, 'aktisada', 'be829255811e4cff5d2418c87c3bed48f765b50bb0601155040594ac3140762f', '[\"*\"]', '2025-08-24 06:13:44', NULL, '2025-08-24 05:44:49', '2025-08-24 06:13:44'),
(190, 'App\\Models\\User', 6, 'aktisada', '71a2e110d2600e08200ab3d8a5d3a6658db616241bd50c6e204b512a46730443', '[\"*\"]', '2025-08-24 19:10:28', NULL, '2025-08-24 19:03:48', '2025-08-24 19:10:28'),
(191, 'App\\Models\\User', 6, 'aktisada', '918972416696b97aa7df60e2c14cbfdc9c2717040648d930cc34994553b31c80', '[\"*\"]', '2025-08-24 19:14:12', NULL, '2025-08-24 19:10:39', '2025-08-24 19:14:12'),
(192, 'App\\Models\\User', 6, 'aktisada', 'ae6654ec94540053875fddfbaf90ec605a603229cff0a9865376f6399093b892', '[\"*\"]', '2025-08-24 19:16:00', NULL, '2025-08-24 19:15:59', '2025-08-24 19:16:00'),
(193, 'App\\Models\\User', 6, 'aktisada', '4cedc04cf7d578636c4457365895954c7940e4f007df7f4df4fa11794606a3ca', '[\"*\"]', '2025-08-24 19:17:21', NULL, '2025-08-24 19:17:21', '2025-08-24 19:17:21'),
(194, 'App\\Models\\User', 6, 'aktisada', '83421791ba50eb9b9a8c4e68b8db29ecf91c406a5a8960a43b145b19d57d6572', '[\"*\"]', '2025-08-24 19:27:02', NULL, '2025-08-24 19:20:40', '2025-08-24 19:27:02'),
(195, 'App\\Models\\User', 6, 'aktisada', 'dc53817e6da66b0ed69a69d2bf5edd49357a1278f78381890dc11587f78a7e7d', '[\"*\"]', '2025-08-25 05:28:15', NULL, '2025-08-25 04:15:00', '2025-08-25 05:28:15'),
(196, 'App\\Models\\User', 6, 'aktisada', 'e53794b038e4b5055f2eb6288a410473e948520ad553b4ca2eb9b9bfb5f8a1bf', '[\"*\"]', '2025-08-25 09:42:32', NULL, '2025-08-25 09:34:39', '2025-08-25 09:42:32'),
(197, 'App\\Models\\User', 1, 'aktisada', 'bc5bf7641aa1b52a6ed5b75563d459d9cceff02d769deba320d03e81e3ed8a0b', '[\"*\"]', '2025-08-25 09:45:03', NULL, '2025-08-25 09:36:56', '2025-08-25 09:45:03'),
(198, 'App\\Models\\User', 7, 'aktisada', 'd41de886b9e696f3fc6627c76b10a4b36979083b1bb0e7f4099c8742fd6c66c8', '[\"*\"]', '2025-08-26 14:32:30', NULL, '2025-08-25 09:45:04', '2025-08-26 14:32:30'),
(199, 'App\\Models\\User', 6, 'aktisada', '6950ab6e7bb362bfc0b9067e3143e71d089de63378f7ca99588c8c48785708e9', '[\"*\"]', '2025-09-02 11:29:51', NULL, '2025-08-26 02:48:48', '2025-09-02 11:29:51'),
(200, 'App\\Models\\User', 8, 'aktisada', '9681eb427ebf2bc7309ab232b4932df79db98cd4992fdab60e999d36eaf8d5ab', '[\"*\"]', '2025-08-26 14:21:46', NULL, '2025-08-26 14:21:45', '2025-08-26 14:21:46'),
(201, 'App\\Models\\User', 8, 'aktisada', '0abc0809c322baf7b17df262233de2892a91146fa641e9d770bb0377239b0d10', '[\"*\"]', '2025-08-27 13:56:19', NULL, '2025-08-26 14:23:31', '2025-08-27 13:56:19'),
(202, 'App\\Models\\User', 6, 'aktisada', 'aac77498419864766cd3207d7556305da9e08261173617218def547cb24895ec', '[\"*\"]', '2025-08-27 13:55:54', NULL, '2025-08-26 14:36:06', '2025-08-27 13:55:54'),
(203, 'App\\Models\\User', 1, 'aktisada', '1b8e650305cb67146b493c61fc52d2b3cb0fbd240ba169eb344d77c0b7dd2480', '[\"*\"]', '2025-08-27 04:05:17', NULL, '2025-08-27 04:04:33', '2025-08-27 04:05:17'),
(204, 'App\\Models\\User', 6, 'aktisada', '346519d98f658b5499445e61b5c8ca88bbcd83b3f8fd750704af4a42965ed36c', '[\"*\"]', '2025-08-28 09:10:07', NULL, '2025-08-27 14:03:29', '2025-08-28 09:10:07'),
(205, 'App\\Models\\User', 6, 'aktisada', 'cf64782261dd1986cfcbbd4f2b3798b666647d95a500502273b19734c05a02a8', '[\"*\"]', '2025-08-27 14:03:40', NULL, '2025-08-27 14:03:40', '2025-08-27 14:03:40'),
(206, 'App\\Models\\User', 8, 'aktisada', 'd92753fcc2dee8aef03a313a2883471b5424468ca2520fc50e05f8c57bc72e0e', '[\"*\"]', '2025-08-27 14:05:46', NULL, '2025-08-27 14:04:14', '2025-08-27 14:05:46'),
(207, 'App\\Models\\User', 6, 'aktisada', 'ba2dc7a0c85b4590f7a0e188265f06731a403ba0007317e7923cecb9505ff6f0', '[\"*\"]', '2025-08-29 04:00:00', NULL, '2025-08-28 09:11:04', '2025-08-29 04:00:00'),
(208, 'App\\Models\\User', 6, 'aktisada', '94a7703f23d73101820dacfd1fc6d5d6d3c2ae4d0d7b6d623f0029ca35a5aad5', '[\"*\"]', '2025-08-29 16:19:20', NULL, '2025-08-29 04:00:03', '2025-08-29 16:19:20'),
(209, 'App\\Models\\User', 1, 'aktisada', '85b4ce613c4d34b99d48a0fea426ce24ad997f92b3334d33017797394db461df', '[\"*\"]', '2025-08-29 06:41:27', NULL, '2025-08-29 06:33:16', '2025-08-29 06:41:27'),
(210, 'App\\Models\\User', 6, 'aktisada', 'b06120e05385f6f398dd3fac3b82da16af5e8fda8a81f96c1962cc88a2ea0800', '[\"*\"]', '2025-08-29 16:19:42', NULL, '2025-08-29 16:19:25', '2025-08-29 16:19:42'),
(211, 'App\\Models\\User', 1, 'aktisada', '3f4f773568edeb67b6ef941d01556af2d0920890bdd88dc38a372786853c70cc', '[\"*\"]', '2025-08-29 17:26:03', NULL, '2025-08-29 17:20:06', '2025-08-29 17:26:03'),
(212, 'App\\Models\\User', 6, 'aktisada', '357be6c3d3bbaff4ed112959e600048fab311f82fdb52493117f82bf0821014d', '[\"*\"]', '2025-09-01 15:28:38', NULL, '2025-08-30 04:51:59', '2025-09-01 15:28:38'),
(213, 'App\\Models\\User', 6, 'aktisada', '0b2ef29b7dd416564b13bb4921ea292b1d2bdc92a15197d82dbe4b24a13aee03', '[\"*\"]', '2025-08-30 07:38:21', NULL, '2025-08-30 06:14:39', '2025-08-30 07:38:21'),
(214, 'App\\Models\\User', 6, 'aktisada', '77cab8880e3206f254dea479287d0d686a4fc1ea8c36cdd7eb735027f3542828', '[\"*\"]', '2025-08-30 14:30:02', NULL, '2025-08-30 07:39:19', '2025-08-30 14:30:02'),
(215, 'App\\Models\\User', 6, 'aktisada', 'ed857510e0d001dbc1fc8fc49834bdc9eca268aea1c512343885cfcff2621005', '[\"*\"]', '2025-08-30 17:09:44', NULL, '2025-08-30 14:30:15', '2025-08-30 17:09:44'),
(216, 'App\\Models\\User', 6, 'aktisada', '87498d77e73e987d1f0a01f91f6ee83146712f7d44050893c829863f9e2c56b6', '[\"*\"]', '2025-09-01 08:19:12', NULL, '2025-08-30 17:14:49', '2025-09-01 08:19:12'),
(217, 'App\\Models\\User', 6, 'aktisada', '732d71fc1e053aab934a8c8f4a9dd08c6a0c19a6df9ac9ed13a5938f3967b80b', '[\"*\"]', '2025-09-01 08:20:24', NULL, '2025-09-01 08:20:18', '2025-09-01 08:20:24'),
(218, 'App\\Models\\User', 6, 'aktisada', '63c913093c0b661dd198af6c87694d899d58bf8ff41c017276c52e5de3acfe03', '[\"*\"]', '2025-09-02 04:32:03', NULL, '2025-09-01 08:26:25', '2025-09-02 04:32:03'),
(219, 'App\\Models\\User', 6, 'aktisada', '77b89d8dc4e67d5178763c478ab8e0c334c8a77717bb9d7991dd780db03b07f6', '[\"*\"]', '2025-09-02 04:36:33', NULL, '2025-09-02 04:32:21', '2025-09-02 04:36:33'),
(220, 'App\\Models\\User', 6, 'aktisada', '252f045be4eb1c16d9bf8fff4c525ce625ce5f3368ebe5bf273e1d3179eacd57', '[\"*\"]', '2025-09-12 04:58:36', NULL, '2025-09-02 04:38:40', '2025-09-12 04:58:36'),
(221, 'App\\Models\\User', 6, 'aktisada', 'd2b2249b4236741de8c98c429b77531aa629bd0c77a5ab688ff5507818c1948e', '[\"*\"]', '2025-09-18 14:01:45', NULL, '2025-09-03 06:20:51', '2025-09-18 14:01:45'),
(222, 'App\\Models\\User', 8, 'aktisada', 'a09dd8a6bf54a7d09c48ced8fae0aaaa85a7b1335ff17a4828dcad882d43efd6', '[\"*\"]', '2025-09-08 09:21:13', NULL, '2025-09-08 09:19:25', '2025-09-08 09:21:13'),
(223, 'App\\Models\\User', 10, 'aktisada', '2611a75989d803f7968eef89f13e57c1f683feae8206000fe7520ac4ee6082af', '[\"*\"]', '2025-10-21 01:10:15', NULL, '2025-09-08 12:11:49', '2025-10-21 01:10:15'),
(224, 'App\\Models\\User', 11, 'aktisada', '901a19cfd58a4bc45c40a3a8f2d897d03ff8979c23368d4988ad921ad529b5ec', '[\"*\"]', '2026-01-04 04:00:37', NULL, '2025-09-08 12:43:30', '2026-01-04 04:00:37'),
(225, 'App\\Models\\User', 15, 'aktisada', '70ff928ffa766c1bdf089791f55f529cd9fc50e8f0fbc6827a6ade3c41801b15', '[\"*\"]', '2026-01-06 16:03:31', NULL, '2025-09-09 11:39:34', '2026-01-06 16:03:31'),
(226, 'App\\Models\\User', 1, 'aktisada', '64d2ad15415d7376d0f2e029607d8335e5d481b9138f8942840fadcbe442e75c', '[\"*\"]', NULL, NULL, '2025-09-11 04:02:21', '2025-09-11 04:02:21'),
(227, 'App\\Models\\User', 12, 'aktisada', 'c22d724f7a78ef84463021f28c55926aff89a82a24412eb6c996f3e9071070a2', '[\"*\"]', '2025-09-12 04:49:28', NULL, '2025-09-12 04:13:36', '2025-09-12 04:49:28'),
(228, 'App\\Models\\User', 13, 'aktisada', '9c66b6cd8face7d83d78200f27c232a9d69cac2f89095f48e2efbf146818b5db', '[\"*\"]', '2025-11-19 06:25:27', NULL, '2025-09-12 04:38:51', '2025-11-19 06:25:27'),
(229, 'App\\Models\\User', 12, 'aktisada', 'b857268c7bc771553c902d5271b45af6a78822ec21aebff8e55d883f353ff599', '[\"*\"]', '2025-09-12 04:52:01', NULL, '2025-09-12 04:50:18', '2025-09-12 04:52:01'),
(230, 'App\\Models\\User', 6, 'aktisada', 'cdaef48508e612fc4f248cf278d16aede2c517076279c61d0c8795f9ae19a15e', '[\"*\"]', '2025-09-23 17:45:17', NULL, '2025-09-12 04:59:24', '2025-09-23 17:45:17'),
(231, 'App\\Models\\User', 12, 'aktisada', 'f023257c1462805d0945f2bdaf066b1118c2e9bdfe0a1309e851ea05796fa56b', '[\"*\"]', '2025-09-12 05:07:12', NULL, '2025-09-12 05:07:12', '2025-09-12 05:07:12'),
(232, 'App\\Models\\User', 21, 'aktisada', '1e44ca0f489ccc33d108ce371691ea7c1cfeaf98c042de3188a48e7633d57eeb', '[\"*\"]', '2025-09-12 05:15:54', NULL, '2025-09-12 05:15:01', '2025-09-12 05:15:54'),
(233, 'App\\Models\\User', 16, 'aktisada', '7f1cce2a7803ef91cfc84f8445dac979a7f8573dce56af00bed14a22db2aa60d', '[\"*\"]', '2026-01-01 11:46:03', NULL, '2025-09-12 05:47:05', '2026-01-01 11:46:03'),
(234, 'App\\Models\\User', 6, 'aktisada', '6df5a3d43492b55a21a2776521a86674dee7e7d6ed834ac84436644e95c3e7bc', '[\"*\"]', '2025-10-03 08:31:24', NULL, '2025-09-23 17:57:58', '2025-10-03 08:31:24'),
(235, 'App\\Models\\User', 6, 'aktisada', 'f9774e5c4affc14299a7639f3634b97040f07351eec714da406da42985ceb120', '[\"*\"]', '2025-09-26 08:02:50', NULL, '2025-09-26 07:24:32', '2025-09-26 08:02:50'),
(236, 'App\\Models\\User', 6, 'aktisada', '76a032797fb5293530986d78291a38c2a8ceb578d5b635edca98a9fc9cbafac3', '[\"*\"]', '2025-10-03 08:04:32', NULL, '2025-10-03 08:03:33', '2025-10-03 08:04:32'),
(237, 'App\\Models\\User', 6, 'aktisada', 'cf13b73f17cf014bc7fc12626c8ff0271ac52378d7f526351be0d84726fb1895', '[\"*\"]', '2025-10-06 12:47:17', NULL, '2025-10-03 08:31:57', '2025-10-06 12:47:17'),
(238, 'App\\Models\\User', 6, 'aktisada', '616280e8d54dc215becb690620ff8e614512a4a18cba94c89e08fcd72cc8e307', '[\"*\"]', '2025-10-06 01:50:14', NULL, '2025-10-06 01:49:17', '2025-10-06 01:50:14'),
(239, 'App\\Models\\User', 6, 'aktisada', '3b81a39e7aa837005526151ea8066f0dca84f8c85d7f12d02cadffb5549d616e', '[\"*\"]', '2025-10-06 01:53:20', NULL, '2025-10-06 01:50:29', '2025-10-06 01:53:20'),
(240, 'App\\Models\\User', 6, 'aktisada', 'f1a00cddc1e35c3b528efe27c53ae997a34f55105c45049a969476459bca1ad4', '[\"*\"]', '2025-10-06 12:30:21', NULL, '2025-10-06 12:30:20', '2025-10-06 12:30:21'),
(241, 'App\\Models\\User', 6, 'aktisada', 'e030e99aa24ae5fdf088525a0c34054eeed8104fc5519ba82e1a7992b632c3f0', '[\"*\"]', '2025-10-06 12:31:54', NULL, '2025-10-06 12:31:32', '2025-10-06 12:31:54'),
(242, 'App\\Models\\User', 6, 'aktisada', '69134f1b2de95b93dc1f75fee55ac7dd752aa2f7e8dff75518a1ab1cf2e50c8d', '[\"*\"]', '2025-10-07 11:16:15', NULL, '2025-10-07 11:14:08', '2025-10-07 11:16:15'),
(243, 'App\\Models\\User', 8, 'aktisada', 'f4807e9530563df8bef64a6f65ab08e5a91b5b6abc7e23e769745d0ec43c69aa', '[\"*\"]', '2025-10-07 12:09:01', NULL, '2025-10-07 12:09:00', '2025-10-07 12:09:01'),
(244, 'App\\Models\\User', 8, 'aktisada', 'de2e2e7ece118da830d0da53444d420e46fff865ec4801e79fa65462ae1190c2', '[\"*\"]', '2025-10-07 12:26:50', NULL, '2025-10-07 12:26:13', '2025-10-07 12:26:50'),
(245, 'App\\Models\\User', 6, 'aktisada', '0fedb323c0b46c6831dea64ea77c9d662be45f737ae9a7773b1cd7d1419e9a32', '[\"*\"]', '2025-10-08 07:32:33', NULL, '2025-10-08 07:27:02', '2025-10-08 07:32:33'),
(246, 'App\\Models\\User', 6, 'aktisada', '7b78f3db31c78f6bff1585a76907ffcbdba2806ccc46e59400f40a6718505c5c', '[\"*\"]', '2025-12-11 06:29:49', NULL, '2025-10-08 15:59:41', '2025-12-11 06:29:49'),
(247, 'App\\Models\\User', 6, 'aktisada', 'fb2b33d7a7ce0da8f0f23cb64522010bfede011d0979a1d7821b4f492f41592a', '[\"*\"]', '2025-12-04 05:59:32', NULL, '2025-10-09 10:56:40', '2025-12-04 05:59:32'),
(248, 'App\\Models\\User', 6, 'aktisada', '8277e53465946c96b9f9b92b5c2ec96d3fb80a8aa5b9080cd6511b9c1b97c1c1', '[\"*\"]', '2025-10-09 11:03:03', NULL, '2025-10-09 11:01:46', '2025-10-09 11:03:03'),
(249, 'App\\Models\\User', 6, 'aktisada', '1b63843c47938b7998b9e48bc7f2fbd84433859a3c243efa57a713d65968ed0d', '[\"*\"]', '2025-10-10 05:16:12', NULL, '2025-10-10 05:15:51', '2025-10-10 05:16:12'),
(250, 'App\\Models\\User', 6, 'aktisada', '3628a19c94b4d6854332fa7edab353056237f9fc869937ef4d5cc855fe6f53eb', '[\"*\"]', '2025-10-13 10:32:45', NULL, '2025-10-13 10:28:36', '2025-10-13 10:32:45'),
(251, 'App\\Models\\User', 6, 'aktisada', '2f03c82a13b7979320c3cad5f2071c0a7e055282bcb389e1a6b8f0bb7d4aa442', '[\"*\"]', '2025-11-04 14:59:52', NULL, '2025-11-04 14:52:03', '2025-11-04 14:59:52');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(252, 'App\\Models\\User', 6, 'aktisada', '136087914a82c5562b22deefe406fa338487494672f034c7bcb0cedb97cc3375', '[\"*\"]', '2025-11-04 15:17:43', NULL, '2025-11-04 15:17:09', '2025-11-04 15:17:43'),
(253, 'App\\Models\\User', 6, 'aktisada', 'd511b83422e35e5305ff2628640225d8d03e0536a7e5698c3eb49fa25609129b', '[\"*\"]', '2025-11-04 15:46:03', NULL, '2025-11-04 15:19:08', '2025-11-04 15:46:03'),
(254, 'App\\Models\\User', 6, 'aktisada', 'bc6d968a109103e75b1a94599558f0fa484776685d2496e61c998ecbd7fba76e', '[\"*\"]', '2025-11-05 04:19:33', NULL, '2025-11-05 04:06:02', '2025-11-05 04:19:33'),
(255, 'App\\Models\\User', 6, 'aktisada', '6c9c93fde2653dcf8674dfe30f2e309b5df81dd943d537a5336a0252af299586', '[\"*\"]', '2025-11-05 04:21:41', NULL, '2025-11-05 04:15:58', '2025-11-05 04:21:41'),
(256, 'App\\Models\\User', 6, 'aktisada', '513092c8f93c519510ba33bfbdd2fc67420905e8028f3ab94df7273dab51fc92', '[\"*\"]', '2025-11-05 05:33:24', NULL, '2025-11-05 05:23:45', '2025-11-05 05:33:24'),
(257, 'App\\Models\\User', 6, 'aktisada', '8966136922514db303a1e9f6dd3429e8e1e7e2041207a9d2da2f5e7e972e5cd9', '[\"*\"]', '2025-11-05 05:35:42', NULL, '2025-11-05 05:35:42', '2025-11-05 05:35:42'),
(258, 'App\\Models\\User', 6, 'aktisada', 'e2ae39dbba4c286b3b1c4d4d96b8bbbfc5c65c9eff2bd70fdfd4c6600f608e2d', '[\"*\"]', '2025-11-05 05:37:19', NULL, '2025-11-05 05:36:50', '2025-11-05 05:37:19'),
(259, 'App\\Models\\User', 6, 'aktisada', '592018944d70a815331902655bb197dc378287345dcc0a4c4e7285fba4c5fb30', '[\"*\"]', '2025-11-12 18:52:18', NULL, '2025-11-12 18:51:46', '2025-11-12 18:52:18'),
(260, 'App\\Models\\User', 6, 'aktisada', '2633ddc7558fa661842824c61907ded8d448c914cf1078b50089293bcd83e906', '[\"*\"]', '2025-11-19 03:23:18', NULL, '2025-11-18 16:05:48', '2025-11-19 03:23:18'),
(261, 'App\\Models\\User', 6, 'aktisada', '6f6667a5ae2b0670d557e37d5b2cc58cdd7ef7d8c2fb3cee1460738c48f5b01a', '[\"*\"]', '2025-11-19 03:31:46', NULL, '2025-11-19 03:31:40', '2025-11-19 03:31:46'),
(262, 'App\\Models\\User', 6, 'aktisada', 'fefb3af3995bcc45d94c4068232dbae475538dd01881968027ef252e2fb46817', '[\"*\"]', '2025-11-19 03:39:44', NULL, '2025-11-19 03:37:10', '2025-11-19 03:39:44'),
(263, 'App\\Models\\User', 6, 'aktisada', '9c86c51d91959c5b75c896e23f10d7c6867d1fee4ba82cedc288ff7173182b84', '[\"*\"]', '2025-11-19 17:02:02', NULL, '2025-11-19 17:01:31', '2025-11-19 17:02:02'),
(264, 'App\\Models\\User', 6, 'aktisada', '61fad85818ab4bcb5c8cd737eb6b1a5d90edd05c4617295a82b3eae762556e99', '[\"*\"]', '2025-11-21 01:35:35', NULL, '2025-11-20 06:54:01', '2025-11-21 01:35:35'),
(265, 'App\\Models\\User', 6, 'aktisada', '4c20d8c8321fa799bd41d68dbe3ebb59bef09d298dff0843f75530f2cc9644c6', '[\"*\"]', '2025-11-20 22:43:41', NULL, '2025-11-20 22:43:34', '2025-11-20 22:43:41'),
(266, 'App\\Models\\User', 10, 'aktisada', 'df34d7b7f7458c73c3233efc99d738d8e90cb1c5ede5bf5f8304a1c8352cb0b4', '[\"*\"]', '2025-11-21 09:27:46', NULL, '2025-11-21 09:27:38', '2025-11-21 09:27:46'),
(267, 'App\\Models\\User', 6, 'aktisada', '5543276d3cc65bf22246b39301ae5a698f10044a775dc51fa1ca44e20335e97e', '[\"*\"]', '2025-12-01 01:39:26', NULL, '2025-12-01 01:35:16', '2025-12-01 01:39:26'),
(268, 'App\\Models\\User', 6, 'aktisada', 'bdb8ac100c921a49ad36188cbb6968c7a2a9edc3ad8be7e9178eff46f0734b68', '[\"*\"]', '2025-12-01 03:00:42', NULL, '2025-12-01 03:00:28', '2025-12-01 03:00:42'),
(269, 'App\\Models\\User', 6, 'aktisada', 'd2b40752be382013ba92faf2692a9e589d14395fbde10fc1889959f51e07e61d', '[\"*\"]', '2025-12-01 16:55:22', NULL, '2025-12-01 03:00:47', '2025-12-01 16:55:22'),
(270, 'App\\Models\\User', 6, 'aktisada', '015720bf4c089b19cf97dc65790fc9373d239854a3a76ab2683ee5289e5538d1', '[\"*\"]', '2025-12-01 18:33:12', NULL, '2025-12-01 18:33:12', '2025-12-01 18:33:12'),
(271, 'App\\Models\\User', 6, 'aktisada', 'b8646b4037a49d6bd45762c5dc44a15356d8edaf05cd416b69381ec48a1e200c', '[\"*\"]', '2025-12-01 18:33:28', NULL, '2025-12-01 18:33:28', '2025-12-01 18:33:28'),
(272, 'App\\Models\\User', 6, 'aktisada', 'afa7df8317d018578a87bb46053c277c7d6d98a31bda7deead0aa0c6722efe9c', '[\"*\"]', '2025-12-06 08:02:18', NULL, '2025-12-06 08:02:16', '2025-12-06 08:02:18'),
(273, 'App\\Models\\User', 22, 'aktisada', '27125f522f869836782c54cb3927d24f119096ec3bbb1a1c04f2a5e201c78203', '[\"*\"]', '2025-12-26 14:01:50', NULL, '2025-12-06 18:04:18', '2025-12-26 14:01:50'),
(274, 'App\\Models\\User', 1, 'aktisada', '23eb1b7d86c5bf34443cc687cb15ec64745e31511635db3a4f7ef26d76ba4f28', '[\"*\"]', NULL, NULL, '2025-12-11 06:26:52', '2025-12-11 06:26:52'),
(275, 'App\\Models\\User', 1, 'aktisada', '0052247cd1791a816585bf122b0cae11d42becc3beea42fd25461be3462b2211', '[\"*\"]', NULL, NULL, '2025-12-11 06:28:26', '2025-12-11 06:28:26'),
(276, 'App\\Models\\User', 6, 'aktisada', '68babafad657e50b86edbfbb316c70fcf56c57088973b19d453467e9abcf90a2', '[\"*\"]', '2025-12-14 04:43:01', NULL, '2025-12-14 04:42:55', '2025-12-14 04:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pk_product_id` bigint NOT NULL,
  `product_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `brand_id` bigint NOT NULL,
  `type_id` bigint NOT NULL,
  `material_id` bigint NOT NULL,
  `item_size_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `image_file` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pk_product_id`, `product_title`, `category_id`, `user_id`, `brand_id`, `type_id`, `material_id`, `item_size_id`, `quantity`, `description`, `image_file`, `status`, `created_at`, `updated_at`) VALUES
(20, '1200*1800 9mm', 4, 10, 21, 26, 3, '16', 580, 'Standard Quality 27/- including GST', 'products/971757333839.jpg', 1, '2025-09-08 12:17:19', '2025-09-08 12:17:19'),
(21, 'Royal Black', 4, 12, 22, 24, 3, '11', 80, NULL, 'products/551757650884.jpg', 1, '2025-09-12 04:21:24', '2025-09-12 04:21:24'),
(22, '12x12 floor tile', 4, 11, 23, 5, 13, '2', 150, '514 L', 'products/1001757651057.jpg', 1, '2025-09-12 04:24:17', '2025-09-12 04:24:17'),
(23, 'virtified tiles', 4, 13, 24, 24, 3, '14', 120, NULL, 'products/711757652571.jpg', 1, '2025-09-12 04:49:31', '2025-09-12 04:49:31'),
(24, 'TUSCAN WHITE', 4, 16, 25, 26, 8, '12', 111, NULL, 'products/181757670874.jpg', 1, '2025-09-12 09:54:34', '2025-09-12 09:54:34'),
(25, 'HECTOR DECOR ENDLESS', 4, 16, 25, 26, 8, '12', 64, NULL, 'products/371757671265.jpg', 1, '2025-09-12 10:01:05', '2025-09-12 10:01:05'),
(26, 'TUSCAN WHITE DECOR', 4, 16, 25, 26, 8, '12', 80, NULL, 'products/721757671473.jpg', 1, '2025-09-12 10:04:33', '2025-09-12 10:04:33'),
(27, 'ASPEN DEKOR BROWN', 4, 16, 26, 26, 8, '1200x600 mm', 15, NULL, 'products/401757671881.jpg', 1, '2025-09-12 10:11:21', '2025-11-19 12:31:12'),
(29, 'Armani Gris', 4, 15, 27, 26, 3, '16', 84, NULL, 'products/841757673588.jpg', 1, '2025-09-12 10:39:48', '2025-09-12 10:39:48'),
(30, 'Brecia Aurora', 4, 15, 27, 26, 3, '16', 152, NULL, 'products/301757673684.jpg', 1, '2025-09-12 10:41:24', '2025-09-12 10:41:24'),
(31, 'This is testing product -4566', 4, 6, 5, 5, 3, '300x300 mm', 100, 'this is testing product', 'products/481762316373.png', 1, '2025-09-23 17:59:37', '2025-11-05 05:24:27'),
(32, '2x 4556', 4, 6, 24, 5, 2, '1', 100, NULL, 'products/131762321030.jpg', 1, '2025-10-03 08:30:05', '2025-11-05 05:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `pk_role_id` bigint NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`pk_role_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2025-08-03 07:30:49', '2025-08-03 07:30:49'),
(2, 'User', '2025-08-03 07:30:49', '2025-08-03 07:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2fR8oi6kXxjCug9g6TeL4R41XGIqHc6qYYUMQ7hJ', NULL, '100.52.3.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkNCb2pjYjBjMUszeVVYbk1MVXVFdkdRN0RxcU03Wnc3YmlOSHVPMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnBsYXkyOWJldC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768463086),
('5L5Z3Zr3nRJkBBFdODqhlyow0S9yzuyxxShU8dSw', NULL, '79.124.40.174', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXhQc3FKQU1SZ1A0OW90czA5cXFEa3c2Nk5GQTR5ZEthYU1UODZNRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP1hERUJVR19TRVNTSU9OX1NUQVJUPXBocHN0b3JtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768432254),
('64YPbUTyA4Un8t5VqujFcqc528pUt1MKLTuu6gJ6', NULL, '46.105.40.140', 'Mozilla/5.0 (compatible; MJ12bot/v2.0.4; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzlMdlNFWXlMWHFrNU5xRmg3aTUxeEIyUHNjY2c3c085M3J0SWltZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnBsYXkyOWJldC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768467710),
('9cgBzMNwGKLcseGsASWzoNJyELEDZ4ASk903GGfS', NULL, '185.196.11.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVRYcUd4UEhPT1pRb1c4bHZxenJmQ21sT3FVSU1xeU9YYlRFTEZLbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768436592),
('bZFteKrrbHfOVdN7jPYPnrMTKOlvD8pqbksHnWCy', NULL, '89.248.171.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3JReFczTkNaYmpBQm1CajlFdWZ0WWlLRFI4VThhRzlYbFVZR3hTbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768450543),
('cdRKL4jtzMg7hFPg53kYg38FK0Tj27krKQiXgGQE', NULL, '85.217.149.14', 'Mozilla/5.0 (compatible; ModatScanner/1.2; +https://modat.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmlGaVhLUFJuSjF2THFYYXNwRHNVMHhwdjJuSTlPQlh3SkZvSWRhNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768427293),
('Ci3LkRtIsyI2BBk90yMWb1K4XJ98ot29sIqcpCvF', NULL, '195.178.110.192', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2NBbDFIQ3RvUU5BMHB3T1NIWU1BMnVwdlBtVHZuQTZqb3JXc2ROeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnBsYXkyOWJldC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768478623),
('Cu0OzSv591aWwoDc1kTRhX1JHRjpkEHt3KUdxpoM', NULL, '167.94.138.114', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1BONkJpRGpuMnVZUzBLUlpSOFQ1Q0hhZHU2c3ptTHhVb2FKSzZvcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768430749),
('eOdE2zYFFYL09jfS1XYXUgB6pv07oabuk73kuiMW', NULL, '74.125.217.109', 'PlayStore-Google', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmY2d1VvQkQ5YkpYQ3pyS21VZTY0bVpYZUlldk1ZeXdGTU9Ed0U2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbS9wcml2YWN5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768465191),
('fbinXbp4432S7w8qkiiwVzCsG88ogfLxUikLnGKY', NULL, '112.124.47.57', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXppdmxScE16dXdvWlBMRmlWYXI5eEVVbE9WN2dTcXowaWdxYTRybCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768471301),
('FStfULyY8d89wMI6wujgp5c6D2K2LfTKGd9JaZ6b', NULL, '74.125.217.109', 'PlayStore-Google', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnE1T0dyTUZVR3JIcndaT3ludzBITE15VEYycmV3Z1FPZlFObE9HbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbS9wcml2YWN5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768465190),
('gTCJnxwfiWGO0cAwkcM010PUJXNoIS1fTMjNpwKx', NULL, '40.124.175.5', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXlac1AxeHU5VEJlbERYRndmR29ESzJKWkR4aWtnTHR1eDJ4MlZKUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768429922),
('i3R7T5LHIn0FnQr0fyl6a1cFTDw1ZhNKSesiwqDg', NULL, '112.124.47.57', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHRoY0QxTHRNOE5yeU1uUlpGYlJ5UGtIa04wRTByUzVHV2ZhRzUwUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768471276),
('IFQxDPIon1oXSB7wrIzeSVZlyI7YLekOZaQRAu9q', NULL, '162.142.125.118', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0Y3bzc1cWdYVXZzRVVlZmw5WDNjaVc2QWlnbG4zR1Q3MEpLcVhFZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768454454),
('jKqhfTJw9c1IgyJBegFzrPDp3KY7rpnKGzERZd7B', NULL, '64.62.156.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1Z5V2QwSWNhbmpXZ0lkNkpoZTZzV3ZaNGd2N1VwS3F2VzVGUHI4YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768468713),
('jVYQYw2fja8fvzR2k7g1sUnuWHvbM1tObLYledKm', NULL, '150.255.51.213', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3lwZVZESnJoNVZpVXFld0pwMHJ2UWxjME05TXBESUpaQ2ozejlmNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnBsYXkyOWJldC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768471155),
('k0QkJTdDrHUc5xoLvYKMOpmqsdHGZjnsfkrIMNxd', NULL, '66.249.74.109', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3NCZUVYZ3ladzFZeHF1Z1NnZVNwRDZ6Nml5OHIyNElibFZoSXdWUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbS9wcml2YWN5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768474228),
('k7ytleoyuGtbE6BBwPOpIShIZaI7cJWZiI1iOoPh', NULL, '51.68.111.245', 'Mozilla/5.0 (compatible; MJ12bot/v2.0.4; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0VWeEY1MU9IY0U2S3JzZFFlbWx4UjhEQWVrYlM5RjZZVTQwOXRoeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768439651),
('KX5V44NUDV3OIvJwnIw59VQItRwdxE5QpNJrbmIu', NULL, '34.91.129.93', 'Scrapy/2.13.4 (+https://scrapy.org)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1ZIckFtY3BnTmV6emVtZzJLRzFkejVjNWhJVTFhdElpeFhPWXNZVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768462758),
('lSvyzt1YMbWlIIjtZTOxTYMPDbssFvGfL8gfANHY', NULL, '64.62.156.227', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzJtampOSWxMQ01obGp0cnhrOGdiMWZLS0VVRXFpQmlyUDdIVzZqNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768469200),
('MJ9Vhg198oB0Nnwzl5HBWxu4a9uVop1xEIwEsXDx', NULL, '195.178.110.192', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjUzWUpwbms2QnRRWU1vNXA5eXpUMFdGMVY2U2NuNE5zUkdMU1dQbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768478596),
('N8kMyGQcca4luZYp3XWqBjF3DmR7O9d86BVH26Zg', NULL, '3.137.73.221', 'cypex.ai/scanning Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXViV2ZMUHJaUlpZR2xXc25GVEhYaEM0WUt3OEFhd0xyRnYyMEl3dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768448411),
('QaksqMy0rK5RKo4jSWLxrL3UR4p5b0UJtYxi0YjP', NULL, '167.94.138.204', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjlwbHEzSTZNUlJDVTNhSWdYS0dhUkpsWGFWZUhGeVBBSWkwM0psayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768472654),
('tFvOcPjsqgPfpYJJPKBjhgfG3vYdu93ZL5t5XM71', NULL, '195.178.110.192', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnN5MW51RGR1QnlSWlBEV2paYk1XN212UmxhZTBJZ2x1WVdyMDE4OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768478597),
('whLMoRXRZvXw9tfNOH81BkE5gBFZyrkV2O7LNpRX', NULL, '118.26.39.231', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 9_2_2) AppleWebKit/559.46 (KHTML, like Gecko) Chrome/98.0.1379 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmdyQW45V1plT3padnZkd2t1VHJicXNMT3cyNENnU0Y3b0ppRm5QdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768436767),
('XI6h9MEDAF1gULTMhDryF1tRN1x9j3GmDHTVepDp', NULL, '112.124.47.57', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3l3ZTJDMFhkUHh2VTZycjJnSzJ1QVRJRm9kNnFUUzEzVmVDUFJUdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768471303),
('zJlQIqqXU6ruo7dVwMA35PUHNE9Tl8zUZQIEYD0a', NULL, '118.193.58.120', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGZvbXJPQ1huQVhJS0RLRDQyZTI0OVEwUlBoNVRPaUw4U09rVU41diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768436709),
('ZyQFKCCHyPaR3W8oQ9pjVh4iDQTlIIEdYWAlaoVz', NULL, '195.178.110.192', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnBQNVZudmRqTTc5MnM1T2s3UGpxc1lzUjJzcjc3bUV4Z2JaOGIwZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGxheTI5YmV0LmNvbS9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768478598);

-- --------------------------------------------------------

--
-- Table structure for table `slide_images`
--

CREATE TABLE `slide_images` (
  `pk_slide_id` int NOT NULL,
  `image_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slide_images`
--

INSERT INTO `slide_images` (`pk_slide_id`, `image_file`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(12, 'slides/vPKXG-022331-iTu.jpg', 1, 1, '2025-08-30 14:23:31', '2025-08-30 14:23:31'),
(13, 'slides/D1Bii-022351-Jyu.jpg', 1, 1, '2025-08-30 14:23:51', '2025-08-30 14:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `pk_user_id` int NOT NULL,
  `shop_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_person` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `country_code` int NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_mobile` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `whatsapp_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `location` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remember_token` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`pk_user_id`, `shop_name`, `contact_person`, `country_code`, `mobile`, `user_mobile`, `whatsapp_no`, `email`, `role_id`, `address`, `location`, `city`, `district`, `state`, `pincode`, `status`, `password`, `remember_token`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Shaji Enter prices', 'shaji', 91, '1234567899', '911234567899', '1234567899', 'shaji@gmail.com', 0, 'testing', 'karanthur', 'kunnamangalam', 'kozhikode', 'kerala', NULL, 1, '$2y$12$0pYifPDxjrD9HK42vnSmke/tZeNDgSmwU03khdGEB1oGaeEhfqvEq', NULL, 0, '2025-08-02 09:23:59', '2025-08-04 16:29:53'),
(2, 'All kerala tiles and sanitarywares', 'shaji', 91, '1234567898', '911234567898', '1234567898', 'shaji@gmail.com', 2, 'testing', 'karanthur', 'kunnamangalam', 'kozhikode', 'kerala', NULL, 1, '$2y$12$6IcW0Oj14wPJAZM77dyKdel90N0vusfTJDZLXAExwaQQVGQMgeh7W', NULL, 2, '2025-08-02 09:23:59', '2025-08-02 09:23:59'),
(5, 'ABC', 'ASD', 91, '1234567888', '911234567888', '1234567888', 'abc@gmail.com', 2, 'aaa', 'bbb', 'nnnn', 'www', 'kkkk', NULL, 1, '123456', NULL, 1, '2025-08-06 17:10:13', '2025-08-06 17:10:13'),
(6, 'Haris', 'testing', 91, '9995051050', '919995051050', '91999501050', 'harispendrive1@gmail.com', 2, NULL, 'Manipuram', 'koduvally', 'calicut', 'kerala', NULL, 1, '$2y$12$atvMYRDpP0fvP.HVqBLF..nIrsAY7HLGWMNyPgWY26KhhLe5hF172', NULL, NULL, '2025-08-16 09:46:06', '2025-08-17 09:52:21'),
(7, 'SF', 'testingRE', 91, '9995051051', '919995051051', '9995051051', 'haris@getlead.co.uk', 2, NULL, 'DHR', 'D', 'calicut', 'kerala', NULL, 1, '$2y$12$QLDaoFn1gU.aS4je94eZQ.JCFCPnt4z0SdlN6aTXpm4hBRtWUahKm', NULL, NULL, '2025-08-25 09:44:41', '2025-08-30 17:18:25'),
(8, 'jithin', 'core', 91, '9633578798', '919633578798', '9633578798', 'koodathil.jithin@gmail.com', 2, NULL, 'kakkodi', 'calicut', 'calicut', 'kerala', NULL, 1, '$2y$12$gNv2FoogrkkkKkipi/WeG.VKkTdqMguHrP8BhHw1pM8diSONSy6Oy', NULL, NULL, '2025-08-26 14:17:13', '2025-08-26 14:17:13'),
(10, 'IMPERIAL MARKETING', 'Sajir Purayil', 91, '9847013100', '919847013100', '919847013100', 'sajirpurayil@gmail.com', 2, NULL, 'South Koduvally', 'Koduvally', 'calicut', 'kerala', NULL, 1, '$2y$12$Vp6ay/VVaonhS0oWa4OnMujwj4PZpD23CNU6GzfDq1pXU/msfhwQq', NULL, NULL, '2025-09-08 06:46:30', '2025-09-11 10:13:28'),
(11, 'Pee Yam Tiles', 'Shoukath Ali . PM', 91, '9847522255', '919847522255', '9847522255', 'peeyamtiles@gmail.com', 2, NULL, 'Velliparamba', 'Velliparamba', 'calicut', 'kerala', NULL, 1, '$2y$12$LhfWyAU.jhyDuau0/m1qVOutPwOlbPLNhLRrqq3AhbRJ0wXdATNm.', NULL, NULL, '2025-09-08 07:37:13', '2025-09-11 10:35:11'),
(12, 'Ceramic plaza', 'Faisal', 91, '9847096948', '919847096948', '9847096948', 'Ceramicplaza123@gmail.com', 2, NULL, 'Arappedika Balussery', 'Balussery', 'calicut', 'kerala', NULL, 1, '$2y$12$nE/zykHvUobBP4azQjCwjO1oSeRQY/FyLHJXDXHAcr4eJvaQVmF9m', NULL, NULL, '2025-09-08 07:46:06', '2025-09-08 07:46:06'),
(13, 'New Home centre', 'Ajmal p', 91, '9048771711', '919048771711', '9048771711', 'homecentre333@gmail.com', 2, NULL, 'Cheriya kumbalam -Kuttiady', 'Kuttiady', 'calicut', 'kerala', NULL, 1, '$2y$12$g1ZwoEsmT2OYUdshRZxAPuldBk1uvwtlO/pS4pRUwXzZoYyV/O5e.', NULL, NULL, '2025-09-08 07:47:54', '2025-09-08 07:47:54'),
(14, 'D GALLERY TILES AND STONES', 'DILSHAD TK', 91, '9846822844', '919846822844', '9846822844', 'dilshad@dgallery.in', 2, NULL, 'VK ROAD,THALAKKULATHUR', 'THALAKKULATHUR', 'Calicut', 'kerala', NULL, 1, '$2y$12$TT99sSnCl.kdHOoAfLMdoeMdRGj1xY2BA9W/L2PNtEQyLuGRqJkOS', NULL, NULL, '2025-09-08 07:52:13', '2025-09-08 07:52:13'),
(15, 'Malanad material mart', 'Roshith', 91, '8848480862', '918848480862', '8848480862', 'Malanadmaterialmart@gmail.com', 2, NULL, 'Balussery', 'Balussery', 'calicut', 'kerala', NULL, 1, '$2y$12$owd1Q9IZfSHG529u4qXxwOiD6jd5dgR6uJ8tcla1r96pjbcvugxr2', NULL, NULL, '2025-09-08 07:54:25', '2025-09-08 07:54:25'),
(16, 'Kottur Ceramic', 'Shakeer', 91, '9656228181', '919656228181', '919656228181', 'kotturceramic@gmail.com', 2, NULL, 'KOOTTALIDA', 'BALUSSERY', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$plfNJpznOvAqpMDsra1yD.lPe33.WPg9JkSH297NhMhibCGsOCGxG', NULL, NULL, '2025-09-08 15:08:02', '2025-09-08 15:08:02'),
(17, 'Koro Tiles', 'Susmith', 91, '9446077823', '919446077823', '919446077823', 'susmithkoroth@gmail.com', 2, NULL, 'Nanminda', 'Nanminda', 'Kozhikode', 'Kerala', NULL, 1, '$2y$12$IBVaztyS40P4krNw8ZFWsOM103rzJ6m6NMXFWs4mA7Zee1n47ClXu', NULL, NULL, '2025-09-08 15:14:25', '2025-09-08 15:14:25'),
(18, 'Punathil Tiles', 'MUnavar Sadath', 91, '9645909099', '919645909099', '919645909099', 'munavarsadath81@gmail.com', 2, NULL, 'Chunkam', 'Thamarasseri', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$/RFqqvpa9CA.QJE5h67IAOxLLrLSWUD0U.URLUL2q1qiD9arnI/wi', NULL, NULL, '2025-09-08 15:18:13', '2025-09-08 15:18:13'),
(20, 'CENTRAL SANIWARE', 'FRAIJER K', 91, '9895333502', '919895333502', '919895333502', 'fraijer551@gmail.Com', 2, NULL, 'M. A. ROAD', 'Calicut', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$I.MwNzKjRTwgIcv3L3IS6u62R8TgqE4Kab3UnmY4wawLG4K.wZMti', NULL, NULL, '2025-09-08 15:28:07', '2025-09-08 15:28:07'),
(21, 'SPICE CERAMICS', 'ANZAR T K', 91, '9995489559', '919995489559', '919995489559', 'spiceceramics@gmail.com', 2, NULL, 'VARAKKAL TEMPLE ROAD', 'WESTHIL', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$neOWPkMlvirXujHHqgVRFupYGQ42GoBP89BxMw1R.JAh59yCAMXuS', NULL, NULL, '2025-09-08 15:33:16', '2025-09-08 15:33:16'),
(22, 'CAPITAL ASSOCIATES', 'SHANU', 91, '7510304008', '917510304008', '917510304008', 'capitalassociates6@gmail.com', 2, NULL, 'ENGHAPUZHA', 'ENGHAPUZHA', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$XlV8enuRXKmKFo06xID.4OY.XRe7fBwHxWlp6vDCair246FZcq8DO', NULL, NULL, '2025-09-08 15:36:16', '2025-09-08 15:36:16'),
(23, 'GUJARATH CERAMIC SALES AGENCIES', 'ABDUL NAZER C K', 91, '9947337705', '919947337705', '919947337705', 'gujarathceramic@gmail.com', 2, NULL, 'SOUTH BEACH ROAD', 'CALICUT', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$MQ5fC.cKXJp2Y7tygjIfve7ijSC/ttTDAfqpQ8AWJCbAh/GzDUU1q', NULL, NULL, '2025-09-08 15:42:12', '2025-09-08 15:42:12'),
(24, 'ISLAND CERAMICS', 'ABDUL SHUKOOR', 91, '9447982178', '919447982178', '919995079530', 'Islandceramicsbeypore@gmail.com', 2, NULL, 'POST NO BB951, NEAR MILMA FACTORY', 'NADAVTTUM', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$mSRuVoupONY.UO/2JqaMlOZRwBRFSPREDCVWi3lN6AW0bb8hWUys.', NULL, NULL, '2025-09-08 15:46:15', '2025-09-08 15:46:15'),
(25, 'KADATHANAD MARBLES', 'KUNHIMOOSA E', 91, '9846223366', '919846223366', '919846223366', 'kadathanadmarbles@gmail.com', 2, NULL, 'NH ROAD NUT STREET', 'VATAKARA', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$yR1lOCXVWm8d8Azm64BaAeR5fBaAKS8eDVW9gyciQiWfeT8Eu.bz6', NULL, NULL, '2025-09-08 15:49:49', '2025-09-08 15:49:49'),
(26, 'SONA MARBLES & GRANITES', 'UMMER M V', 91, '9447110429', '919447110429', '919447110429', 'sonamarbleskdy@yahoo.com', 2, NULL, 'MODERN BAZAR', 'KODUVALLY', 'KOZHIKODE', 'KERALA', NULL, 1, '$2y$12$prLY06wGrQ1IfaeQAP9BAuOmW6VdytD4GSYELtj3zPD/DT1atP5VS', NULL, NULL, '2025-09-08 15:52:32', '2025-12-11 07:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `id` int UNSIGNED NOT NULL,
  `user_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_type` enum('signup','login','scratch_web','scratch_api') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_version`
--
ALTER TABLE `app_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_subscriptions`
--
ALTER TABLE `billing_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `fk_int_user_id` (`fk_int_user_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`pk_brand_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`pk_category_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `item_sizes`
--
ALTER TABLE `item_sizes`
  ADD PRIMARY KEY (`pk_size_id`);

--
-- Indexes for table `item_types`
--
ALTER TABLE `item_types`
  ADD PRIMARY KEY (`pk_type_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`),
  ADD KEY `id` (`id`),
  ADD KEY `queue` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`pk_material_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pk_product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`pk_role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slide_images`
--
ALTER TABLE `slide_images`
  ADD PRIMARY KEY (`pk_slide_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`pk_user_id`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_version`
--
ALTER TABLE `app_version`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_subscriptions`
--
ALTER TABLE `billing_subscriptions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `pk_brand_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `pk_category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_sizes`
--
ALTER TABLE `item_sizes`
  MODIFY `pk_size_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `item_types`
--
ALTER TABLE `item_types`
  MODIFY `pk_type_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `pk_material_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pk_product_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `pk_role_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slide_images`
--
ALTER TABLE `slide_images`
  MODIFY `pk_slide_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `pk_user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
