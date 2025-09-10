-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 29, 2025 at 05:00 AM
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
(8, 'test brand', '2025-08-22 14:03:17', '2025-08-22 14:03:17'),
(9, 'test brand 2', '2025-08-22 14:08:05', '2025-08-22 14:08:05'),
(10, 'test brand 3', '2025-08-23 05:18:58', '2025-08-23 05:18:58'),
(11, 'test brand 4', '2025-08-23 05:19:45', '2025-08-23 05:19:45'),
(12, 'test brand 5', '2025-08-23 05:20:19', '2025-08-23 05:20:19'),
(13, 'test brand 6', '2025-08-23 05:20:37', '2025-08-23 05:20:37'),
(14, 'Brand-2', '2025-08-24 05:48:42', '2025-08-24 05:48:42'),
(15, 'haris', '2025-08-25 04:27:29', '2025-08-25 04:27:29'),
(16, '111122', '2025-08-26 15:06:54', '2025-08-26 15:06:54'),
(17, 'jk', '2025-08-26 15:19:12', '2025-08-26 15:19:12'),
(18, 'jk', '2025-08-26 15:19:20', '2025-08-26 15:19:20'),
(19, 'Brand-3', '2025-08-27 04:05:17', '2025-08-27 04:05:17'),
(20, 'At', '2025-08-27 13:52:51', '2025-08-27 13:52:51');

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
(4, 'Tiles', 'category/811755410903.jpg', 1, 1, '2025-08-17 06:08:23', '2025-08-17 06:08:23'),
(5, 'Sanitary', 'category/801755411038.jpg', 1, 1, '2025-08-17 06:10:38', '2025-08-17 06:10:38'),
(6, 'Wash basins', 'category/261755411065.jpg', 1, 1, '2025-08-17 06:11:05', '2025-08-17 06:11:05'),
(7, 'Kitchen Sinks', 'category/591755411144.jpg', 1, 1, '2025-08-17 06:12:24', '2025-08-17 06:12:24'),
(8, 'Gum', 'category/341756218301.jpg', 1, 1, '2025-08-26 14:25:01', '2025-08-26 14:25:01');

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
(1, 4, '800x800', '2025-08-17 18:12:50', '2025-08-17 18:12:50'),
(2, 4, '600x600', '2025-08-26 14:14:51', '2025-08-26 14:14:51'),
(3, 4, '123124', '2025-08-26 15:04:08', '2025-08-26 15:04:08'),
(4, 4, '242', '2025-08-26 15:04:13', '2025-08-26 15:04:13'),
(5, 5, '23R', '2025-08-26 15:04:19', '2025-08-26 15:04:19'),
(6, 6, '124', '2025-08-26 15:04:24', '2025-08-26 15:04:24'),
(7, 7, '123', '2025-08-26 15:04:30', '2025-08-26 15:04:30');

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
(6, 4, '1200x1200', '2025-08-26 15:00:06', '2025-08-26 15:00:06'),
(7, 4, '32642x2552', '2025-08-26 15:00:17', '2025-08-26 15:00:17'),
(8, 7, '21x425626', '2025-08-26 15:00:30', '2025-08-26 15:08:02');

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
(4, 4, 'dsv', '2025-08-26 14:58:35', '2025-08-26 14:58:35'),
(5, 4, 'vdsvvx', '2025-08-26 14:58:41', '2025-08-26 14:58:41'),
(6, 4, 'sxvdsb', '2025-08-26 14:58:45', '2025-08-26 14:58:45'),
(7, 7, 'qwfassV', '2025-08-26 15:01:52', '2025-08-26 15:07:43');

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
(199, 'App\\Models\\User', 6, 'aktisada', '6950ab6e7bb362bfc0b9067e3143e71d089de63378f7ca99588c8c48785708e9', '[\"*\"]', '2025-08-26 06:54:11', NULL, '2025-08-26 02:48:48', '2025-08-26 06:54:11'),
(200, 'App\\Models\\User', 8, 'aktisada', '9681eb427ebf2bc7309ab232b4932df79db98cd4992fdab60e999d36eaf8d5ab', '[\"*\"]', '2025-08-26 14:21:46', NULL, '2025-08-26 14:21:45', '2025-08-26 14:21:46'),
(201, 'App\\Models\\User', 8, 'aktisada', '0abc0809c322baf7b17df262233de2892a91146fa641e9d770bb0377239b0d10', '[\"*\"]', '2025-08-27 13:56:19', NULL, '2025-08-26 14:23:31', '2025-08-27 13:56:19'),
(202, 'App\\Models\\User', 6, 'aktisada', 'aac77498419864766cd3207d7556305da9e08261173617218def547cb24895ec', '[\"*\"]', '2025-08-27 13:55:54', NULL, '2025-08-26 14:36:06', '2025-08-27 13:55:54'),
(203, 'App\\Models\\User', 1, 'aktisada', '1b8e650305cb67146b493c61fc52d2b3cb0fbd240ba169eb344d77c0b7dd2480', '[\"*\"]', '2025-08-27 04:05:17', NULL, '2025-08-27 04:04:33', '2025-08-27 04:05:17'),
(204, 'App\\Models\\User', 6, 'aktisada', '346519d98f658b5499445e61b5c8ca88bbcd83b3f8fd750704af4a42965ed36c', '[\"*\"]', '2025-08-28 09:10:07', NULL, '2025-08-27 14:03:29', '2025-08-28 09:10:07'),
(205, 'App\\Models\\User', 6, 'aktisada', 'cf64782261dd1986cfcbbd4f2b3798b666647d95a500502273b19734c05a02a8', '[\"*\"]', '2025-08-27 14:03:40', NULL, '2025-08-27 14:03:40', '2025-08-27 14:03:40'),
(206, 'App\\Models\\User', 8, 'aktisada', 'd92753fcc2dee8aef03a313a2883471b5424468ca2520fc50e05f8c57bc72e0e', '[\"*\"]', '2025-08-27 14:05:46', NULL, '2025-08-27 14:04:14', '2025-08-27 14:05:46'),
(207, 'App\\Models\\User', 6, 'aktisada', 'ba2dc7a0c85b4590f7a0e188265f06731a403ba0007317e7923cecb9505ff6f0', '[\"*\"]', '2025-08-29 04:00:00', NULL, '2025-08-28 09:11:04', '2025-08-29 04:00:00'),
(208, 'App\\Models\\User', 6, 'aktisada', '94a7703f23d73101820dacfd1fc6d5d6d3c2ae4d0d7b6d623f0029ca35a5aad5', '[\"*\"]', '2025-08-29 04:00:03', NULL, '2025-08-29 04:00:03', '2025-08-29 04:00:03');

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
(11, 'test product 2', 4, 6, 8, 4, 2, '1', 20, 'this is a test product 2', 'products/951756063587.jpg', 1, '2025-08-24 19:26:27', '2025-08-24 19:26:27'),
(12, 'paper', 4, 6, 5, 4, 3, '1', 245, 'hshhe', 'products/831756095409.jpg', 1, '2025-08-25 04:16:49', '2025-08-25 04:16:49'),
(13, 'hff', 4, 6, 5, 4, 3, '1', 67, 'tsy', 'products/211756096203.jpg', 1, '2025-08-25 04:30:03', '2025-08-25 04:30:03'),
(14, 'teasing', 4, 6, 11, 5, 3, '1', 500, 'fiff', 'products/451756114513.jpg', 1, '2025-08-25 09:35:13', '2025-08-25 09:35:13'),
(15, 'gfbbj', 4, 7, 8, 4, 2, '1', 50, 'dhvh', 'products/741756115224.jpg', 1, '2025-08-25 09:47:04', '2025-08-25 09:47:04'),
(16, 'g5vuv', 7, 6, 16, 8, 7, '7', 258, 'dfgg', 'products/441756220922.jpg', 1, '2025-08-26 15:08:42', '2025-08-26 15:08:42'),
(17, 'ttttt', 4, 8, 20, 6, 3, '2', 250, 'fbvgjnas', 'products/631756302885.jpg', 1, '2025-08-27 13:54:45', '2025-08-27 13:54:45');

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
('02AxMXj4gw6Sf5uvSfMQ9hLecT7ZOEKjAY3z9Qaj', NULL, '47.245.117.221', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUVFOVRROUEyNUt1ZDd3TlBKZHJLem5wMkRuTEd3MVc0V1lWbTUwQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP2Rucz1Ub3NCQUFBQkFBQUFBQUFBQjJWNFlXMXdiR1VEWTI5dEFBQUJBQUUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756305866),
('064Ypfn7LocaC9tJkuRi8UCcymhem9HQO1iSygYI', NULL, '54.226.232.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3lvQjlGbDJiQUdJTDUzMGFMblo0MlRudVppN1Vxc2liRHhBN2RkbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756420205),
('0SINZbudWOe4Mcyai5xjUzRbH2T9X7fmDy2zqADb', NULL, '188.166.160.238', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjM1VWZtTmRPREtpb2gyY29GcndlR1VTZ29yRUQyZFNJR3BVMDVSSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756355656),
('1bzXuMQWLYZCNDAoB3cDpLJqBYrTL1FwSojr6oB2', NULL, '93.123.109.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YToyOntzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly8xMjguMTk5LjE4LjIyMy9sb2dvdXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756230093),
('2LMy1SfUViaTzDniDLoPGGJQa7WG3z75gpU2W2gL', NULL, '157.230.28.146', 'Mozilla/5.0 (compatible; Odin; https://docs.getodin.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjByZzhMV2s4MTN6YW1WWWJlNFd3anpkMWtyb2xDQlluOEM2dGxheiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756346527),
('2zmlLb3SA0NHGfIbIwWbk5qTm7xcn6oDE4R1dLb5', NULL, '54.175.243.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWVwZTYwWUp2WHMwaVRsSzlvZnd3SjJNa1VJbnpKdG5heVlBaHZPTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756331819),
('31T8mQVHMltxzeqxh7xIQn3IUXLKNLL4v7lA2IvY', NULL, '45.156.128.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3RKemwwYnIzaUdUSThIdnBXSkhtRjBkRURYV2o1d1JkVHpQYnJJayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756230095),
('3g7vcrqzWmEZ3QRpSZy5o5eero4shw1nPEXJ0iCS', NULL, '162.142.125.114', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickxzVTNST0JjaW05YVR2QUFQZkcxcUdLZlRTblVRNERNWnB2OGRVVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756394789),
('3im1Qabsla8XjIu1rsTbBE4lDOLAm4vVCKmGBVSI', NULL, '64.62.197.137', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/115.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFRBMHlsQ0ZGUFpOUlVBVUFuU2tBVUl0bTJlOFZBeDBHbng5cko2QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756277451),
('3K7BVl2iB15GGsgmCYPMHxzV8t8cYhrnuWngZKzY', NULL, '206.168.34.33', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGptZkpkcGQ2c3hRQ2l3NlZYa2xUdXZwZlB5VUlVSWtQZjVkRHVGUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756418260),
('3Vv1li8YR4Dk1skixM6tAwve0QWqhmEOkWpk7Yeb', NULL, '167.94.145.98', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0hLT1VadlhtdjFHYVJUanl6NzRCRnpIR2xkaTZtc1FFTTJpME9JbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756424471),
('4KzVrGypgvKYMssYGogC89nf7YkHqGGwenaF8NvW', NULL, '159.223.124.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1NFck1NN0dNeUdMbGN5NEl6ZmJjMlljRlYzTUJrUDBoVWlCcGRWWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756351866),
('5m8goaBYp419QGYlwFz4uxSiZnmNEwQM8hsB8OI9', NULL, '51.68.236.64', 'Mozilla/5.0 (compatible; MJ12bot/v2.0.4; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidE1DUnQ1dEV5cjJvSDQwS09oR1hhVlRwNHlRYllkNURRbXlSaE5wNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756427260),
('67sf6kuPpUYhQfsURRLD1sf2ezH8bkpDvBZMGk43', NULL, '199.45.155.67', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQndQNzJoT0g0dlpOaXlaNjZVOUJJaVpUcnZjaTRrZ09tRmtiRFY2WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756417727),
('6BLM7fZlWtZm22ZiBR0IDYkB3hnvlVVODBtn1o73', NULL, '188.166.145.128', 'Mozilla/5.0 (X11; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRm42R1dKSG9rWUh3bm81V1dFRlQ1ZjNKUDJpVVZaVE5hWFpUT0FBUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756324725),
('6JZDbdUBajOhHnmI0rk6eGxTDxOQs9N2xlW2qWvh', NULL, '87.4.97.170', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEduRnVGUmVuRUdaMnNRUVF4RHZYdlVBSmVRdzZoY0ZOdjMwUWFpVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756398907),
('6kr8qvX9FeEDSBEPhJ67eTIgCvDmD7PYg2VrIc2K', NULL, '71.6.134.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWFwcTdMU0lNZ2VpaVJNYWdReG5hM1ZEMkNwTUx6RWFwQ3MyN2lHbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756383119),
('6wn2Xs7oRnT2eBuGoOawyPi0eMJsVnyujiYdt44j', NULL, '15.235.227.163', 'Mozilla/5.0 (compatible; ModatScanner/1.1; +https://modat.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjQxSkpDU3kxRWw5NHBFSFM0R1FEam1OQTZQYktUTmh2ZzYzQ0tuayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756222883),
('7mMZ67pGATtpDguAmqfxw4Z33nZiJh1ZXhjtUGcI', NULL, '185.242.226.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0FuQ0hxRGRuSXRNT24zR2lGaGVoalJOZzR2SW43YnR2R2hFdmRINyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756228610),
('8BbUkAQirI70PzyH1WAQz2yZH4rxMXCd67OqfzvK', NULL, '54.37.118.79', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlhQdVl2ZkcyMm5aR0hUellvQVZ6T1NGejdYSHBCQk5udXdJcDNmMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756255728),
('9GsisiP6UIowN3PHgPI3IblgJPO0n7xR4KhDe9pP', NULL, '66.240.236.116', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmVJNVlScjU0WEtHUnByVWJkQ3FNZnV6SEdqR1BiZWxmNUQxckNueCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756213515),
('9Tyu8cJJGgVu8RuBrFZscH5wX5J1syXqV6JWhjI8', NULL, '199.45.155.87', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieG0yaEttbFc5cDEzVWZFejNrMXBITUEzQTdjT0ZtVk54OTFkZnh1dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756422542),
('AgFgvDdK7WQq60kV9xqgb8VJ2mwAGI1gnWZhK7TF', NULL, '66.240.223.202', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUxxdVlDUjViMnNHbVVsaEk2dWRnSmg5aVNkQlR0UWE0eEJsSHVUcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756349219),
('ANALWZvIIpiiJmyRe4qmf9uLQ1WM9OBAnZ3voQR7', NULL, '165.154.202.146', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlBKSjVtMXVXcWxQbXM4aUpYR0dGNHFrUmRLQmJzbTdGMVNIWml0aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756210168),
('aOk8CNR4Rm2ClRZzuVO1mqAgKjsSl3z6C2UEldwG', NULL, '71.6.134.230', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTndtNXlIYm04aXpJNThUajN1Q3JBNG0xb1RlT3dCYW1LenlhVWVkeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnBsYXkyOWJldC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756230372),
('ceI5s1WZ6Boq2Hy9jqAMfQGGBqWz4NVCpn7yCg3v', NULL, '47.245.117.221', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU9jdEY2QUZ5YzVBRFBNYWpXRXBaU3F4TGtGVWJ5WUUxVmpqQU40MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP25hbWU9ZXhhbXBsZS5jb20mdHlwZT1BIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756305870),
('CgvG0bvDEC6B4RyKJ9xqRPi9axd00bUnqWk2XDJR', NULL, '161.35.197.11', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWVCZjN3NU1BSzh1d2FNOEcwdGlxSmNNdHhPekxUVVl2VUlGRlJ1VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756346523),
('CkNrSwQP5vZrF7EiQcASJPKJS09nyWnyeumQZfd8', 1, '223.181.15.163', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieVkwRlFaZHk2ODVTZ0hCOFZ4dFltNXBYRDhxUWpiT0FhYW5QSngyayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbS9hZG1pbi9pdGVtLXR5cGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1756222534),
('cpCqE8QcxPqrE3XH76p5TARdVecufQwsf6jziYa0', NULL, '167.94.138.179', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlpRRkIxOEk4UHllZHBvenJtRFo3ek5YcWpSZEtPcXgwQmRmS3hnSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756291666),
('CyIteQq2gycz2HFtWFPDSTCP6CSvwKIDfygQoWOW', NULL, '172.234.231.111', 'Mozilla/5.0 (compatible; Nmap Scripting Engine; https://nmap.org/book/nse.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkxQZFBIZXhGNm1NWGNYRWdNWEVMbWFEYVBVUEp3NjRrdEZWT3RZUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756327353),
('d5C4ktKRYWZ9jixJmTp82s24TQQ3FcfeLDBgZi56', NULL, '172.234.231.111', 'AnyConnect Darwin_i386 3.1.05160', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmFzVmVhUjExYWkyQThCcWtuMXFBc0dvZkRJcWlSY2hOeGdyM1dpZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756327302),
('dJhwkpn326G1kMPUqFpH5voD4JUElEapw8ty11yJ', NULL, '206.168.34.33', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3FPS0dnU2F2N0tKbHQwYjVXMFBVeFhvdDdUNHQ1Z2VINWtMTXpaMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756418224),
('eAPvaJPXW9yVsmfgv0UMABgbQYQaRR3nTQlVIngn', NULL, '185.247.137.124', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHBmc0d0V2NYc1hta1d3cEc5RFRMZk1Kc09VSURQemh5MDhzc1VUQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756280922),
('eHXdebWojjPTrMU3TY06WLZNuZJFd3CsueTIhFup', NULL, '51.68.107.141', 'Mozilla/5.0 (compatible; MJ12bot/v2.0.4; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3A4TzhaNkFpdHJxMWUwNzVCdmg3OTFYSEpxbWpOckNXakpDSm5FUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756336476),
('eiqkZTmE9leCCXAcYYmVsVo19AwUBPTsrdkmFiCB', NULL, '54.219.177.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGlqUzVuNm5STVFsNnJlcFlaSkV1b0xQcUwycHVMVExZektENlZ3NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756259704),
('F8jUnXcutfz7dcQNz1KjPAwFBiUYmWYHQni16TmF', NULL, '79.124.58.198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTZ4WGFnd29NZ1B0QTl2UndyM2treDdYcTduSDVlTXNBWUEwUnBOSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP1hERUJVR19TRVNTSU9OX1NUQVJUPXBocHN0b3JtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756266615),
('fBqbMv14zwqNyfI7Ynpz11MQfg2y5qGC6YhLZ62j', NULL, '51.68.111.238', 'Mozilla/5.0 (compatible; MJ12bot/v2.0.4; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOG8xVnMwRzIwQU9TaXFFR1R1SVhVTVFtTFgxQVN4dWRrYVRwTG1KTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnBsYXkyOWJldC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756377664),
('Ftq6X83y5UeZGJvH2X4zXxcd0KonIPJtzlvxX6QS', 1, '223.181.9.121', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYXhsWHhRS0xkN1pwM3J0WnZlNEFySUZ3ejR2UmhxZUxxNnk0S3FSQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbS9hZG1pbi9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1756302686),
('gBlUalZYuZHLtyKR4NvAghk6fCRJ77hWUcY01kqv', NULL, '3.140.182.19', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam1qblUxRFlPZFRLalVVeENKdjBraGFSVGRTMEN2cWQ4bTdvY2tOTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756255859),
('GgW3wBjVg1uir7qTN2Xy4wSfqQxThkISyHPIMdxf', NULL, '167.94.145.98', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU5wVXdvSHlqTVUxRWVhb3RQbWZEd2E2ZnpRbU9PVlQ5VzVtbmlrNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756424499),
('gRNkqfvbdpY0cBKNQrEW0rkr82CGIKdkBgUxniu7', NULL, '3.83.13.157', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXdHeEZ2ZXNOVTBpRzlZRDJBVUZGUnZjUFdXaTNiN0xpdzdSNHFQcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756245411),
('gVFi5ss0MECZgg7wmAUFa2MEliqjb9NcMGkq9jHd', NULL, '161.35.197.11', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWhzYzYyVUE2QlJmWnUxZWNhaDJvV3c3NkpZbWlzSklLTUYxOFhONiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756346525),
('h8FqJpHdPEar2Y7mHblWP9xkrJdO0O1mDayWemtf', NULL, '50.116.13.71', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlBPZWE3VTJWOEpOQ0k1VHp2ejRZRkkyU2hHeWRtTWs3YXBoYWFudCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756351579),
('HAISyIiZAmvNDxtbgMa1QYHIk3chtjxTGYMyLaPi', NULL, '46.105.39.49', 'Mozilla/5.0 (compatible; MJ12bot/v2.0.4; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWhqRUNMMmVjZDZJWXZsZ3JvdmpialR2a2ZrY0NMRkVhOVJCVGdJaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756246494),
('hhYBOee7xQWs10RgdrniM5LUxnxpVwmiS9IMydnH', NULL, '5.189.130.33', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzY2TUtmNEhPUFo3UWxuSUtPZWZsRU1qSWpCSHM2M1dMMEdXWFZERyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756213560),
('HrpHlFBlihPVlwz1Szs6ct6a9POzS53QpjfYQzAT', NULL, '162.142.125.114', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU5heDBrNW5pbEExU0JpRkZ3NlFrY0ZIRGx6ckJmNzhIOWVhTkVpQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756394811),
('HyaPOvpAZ1bAH7FXuGC7FVzwalJ5rASozGCecHCp', NULL, '125.201.201.192', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjBUQm9EMFJZQkFPTHhPQVhpTzVXVjJmNzdsWEpXVWFzSFFYTjdkcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756309530),
('hZDCWBYG4Wg7AX0VrbYZF3M8cZByrfS8h3DWAYbk', NULL, '199.45.155.67', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVNxbkZMOFRWOFF2NFZuSjMwckNGVWhHelphSTFXT3BjUzkzYmJJZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756417705),
('I3898a5YWpToljvKnKzgQMua1eSJcT5YiIIJ4vgr', NULL, '159.223.124.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGtncHFqWWhxc2hHV1QzeENCRERaNTF6MjBtRlNta255ZnRqY1lxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756351576),
('I5a1AbIPUXHuJoz3ybO0ev2MCPylHLG8Ba9kMR5w', NULL, '34.77.74.157', 'python-requests/2.32.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2hPTW9BbGFTaTRDUlFIR2h0dGQydUswV2V1NjJsdnljeHdRSkptbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756262129),
('iAyoQ2ZWJtXohpsTIGHAoVKAd6dkzn6WItewRvrQ', NULL, '8.219.153.58', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWNhYmtHbVFGODl5M1VWbDk3UUhHdzM1b0dLS3NWVFVrZmdpYWt5MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756328883),
('Ibf2dsyQgCp5Q4vdu9j0sv679rvJuTeE6OOaqyyl', NULL, '3.132.23.201', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmFTWGNXVERqYnh1U200bzFodDBvUHpLbzRnSnFsQWVkakg4bnp1bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756388208),
('IbfO8fep3nR4Vh90pJqmzvpZ527U2LVncQxcUzJH', NULL, '20.163.39.86', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUm1pekJjMTdjZDJNNTlXWHdEd1liRzNKR0JYSTFzd3FRSmVsR2ZmdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756315890),
('IdZcJJ2HrDVGvu7LGj7XA4cxtkf4T8g6VzL3UjzD', NULL, '162.243.90.163', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3ZubGVtdmZyMWljY0FibzFkUnRzN2FVaTdDMk9oNUd6bXlGZnc4RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756395485),
('IFwJH1065OwQyko6HNs984NaGsUYRDOejCiP1DND', NULL, '185.242.226.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWxRZkxqUkNGYUlqZVVrazZIN0FTNHcxMXBZanBnM0drY3hYdXNZdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756328157),
('IHyBzw1u3GAGcjQstWXiOm4prnjvVdIhFQVqj5lY', NULL, '206.168.34.67', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmpsdzNUQlFxQzZLOEExbHRnYmdHR0hOWVFZaG81MGdvemJRb3lNWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756381872),
('InAktdJ5d0bSbIRvNb21C5FC447EmNOf6xTGNlju', NULL, '91.196.152.89', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHNUc1RvNHNaam10SDlPbnYyRzFwZHN6V2JmUlNsaUR3MVprVEFWTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756410411),
('j2UZL2Yqf1K2NajffgZYQzIeYzWw7ossl8pOMC8s', NULL, '3.137.73.221', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ05FZFpkdXV6aExTNHF6TGRMTlZPUnlUZnNRbEtFUmY3bW9LR3pFTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756214391),
('jRYhtTrfJES1mtWTMRtr9w5c2b52xwASB2HKRzLw', NULL, '79.124.58.198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVRPdERiZzNPQ09OOFh6M1lzaWF1d0toMG1xeDNSZllOQml6OGM4TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP1hERUJVR19TRVNTSU9OX1NUQVJUPXBocHN0b3JtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756354130),
('jxQgNAcEsm3i4usXp7dZCPUAd1OnDmsQvJgA3bNB', NULL, '161.35.197.11', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUxsRmxwczBMVTdMNmpQTGhaTG5jajBMNlU5ZWF0Z3JOMzhtWjRxWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756346525),
('KlzxrB1OWLFXSxIAXLKtVPZuPHmzAFi97NgIlcz0', NULL, '199.45.155.108', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHNMVkZrTkU2N1JpdjA3aGtBQWo4MENLMWtzQjN2dXZGdzBLdmR2VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756213660),
('LB9pUqOd89i2HrTchz9wzLe5x2LmsQAS3AbAitQr', NULL, '165.22.41.53', 'Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVdKSDNRSFp2QXRJaXhoMXM5THZpYUozWlRKaVpqcGMwYWM1MHNFcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756374522),
('lO1ktgm1ExEfwcZtb4Fsp9kedeOIMXKL4PhbVt1J', NULL, '205.169.39.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2NmRUhrOVJGUnlMVHhrc2VRcFhDVHh0UjZBUTBqeHc1dVd2M3hzQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756389798),
('lvt3Z7G3ihVK7yQ96zTLGE4gacj1peQ87rDiN5nT', NULL, '188.166.160.238', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWk9RenY1MGFkS2JFMkhFbldsbGJBUXlzODZnOU9GSk1mS3V4VkN2biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756355657),
('M9AnluKlcCBSHllp7wX9JCDHb5StDmz04qDCkZnT', NULL, '185.242.226.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnc1eWVkV0g0ZWZrUUh1Y05ZampxZ3BMWVVMcThvczFxelhiVDRjVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756395403),
('MRRzYSwIfA1E9tIcRS8K2K8J4wXY78DmbDYlCbEM', NULL, '34.79.180.31', 'python-requests/2.32.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzhOdVFrbWpzSktOTTVyMEtDWm1MWWlEVWx0bFhxWTJyclZyRE9vSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756390872),
('nlOkeHQKgiopmjyCJPuC9fL7lCRAOZh3n3YWRowi', NULL, '185.242.226.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXZiNlkyWmpBMzJDZlpRZVVYME1rZ2hjWjdEVVVGNGFlV3lSeHlUMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756294186),
('NP8aFpezKot8MizJl9CfSI02G2KdQWBcBPalIIzQ', NULL, '185.242.226.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTBXVnJtWlpCMElic1ltUTM1b2ZuR3VHWWl5WnlNajBiMUFaR1RoZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756261108),
('nSH5c5ENcp6cpMc4QBWE9xeJ4Vhzmqodz5HEXoA8', NULL, '172.234.231.111', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0tEMVR0blkzNkZPOXBxd1lPMFo4a1RuZnc5bXR1clJ1RmpsQmpYSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756326504),
('O2gMFzHiwaXzCQNalZrSQpWQ6wC9YQsfcp3rls75', NULL, '35.81.82.178', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVVEM21zOE9JVTdwVThySk5PWGw5a2h2eDZQeXFDSm1uMkozckFqdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756233358),
('ocfKhWOaiFXaRGvI3xUcoLDtdj2o6Mgen1y6eivc', NULL, '192.81.131.228', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW40ZExQdFJMQmRGU1RVME9RMlNIYU9JUWJtN1J6TFZpbzNiZW5layI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756351574),
('ojWMGlJNiYhWdLQFOLMRmqw9R1k2SbIbSjrDWeoE', NULL, '188.166.160.238', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0VzVU42bmpqTzV1bGp2MGU0ektoUjk4MmRvNEdqVVYzS21TaDlpNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756355654),
('OQBCzVgNW2fS6XgRzePgdmn1FlDyuxwkSfIlBK6Q', NULL, '185.208.158.212', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Safari/110.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVk0UEEzb1g0anl1aWgwbFFIVVNJcGhzNTNoS0tkOHNha3hvQ3pRTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756257130),
('OYh1hORwcOut6HxG4O7lUcLVukmbacu3HLnXv7im', NULL, '106.222.237.246', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiREZBVWdzOElscWJkRUdvOEo1U1I0UnpIamlGSlM0cU1wTzZ5M3hTUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756355892),
('OYK8wwjJG3giilaKhp5uIQ7nKeqXFPnpTNGYyYbg', NULL, '64.62.156.142', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG10OUlWU1RJUTFKV051Z3Z6cUpRMTh0bW9GTWs1QWxZUjYwU3lLdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756389659),
('PfBSwCSLw5RduUuiuIcLnjnEtqHsHlTX9gHNAWDy', NULL, '3.140.182.19', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0R5MU50cVpWS2szdkozdExKZ0NxS1dDajVUYkdNYjRSY0RrWWpWdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756223694),
('pmFvI05LbgVAwBcapj7R4hENZqqodAs5h5wX8LEw', NULL, '3.137.73.221', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick1yQ09TV1E5cDJMbTNQUFZiRFNzdTdoY2IyVzFOYzNlUWpWVVZaNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756293679),
('PUarPBfYyAcjJNzOh90Y1wZxSgLVjOTuqs5L6JKJ', NULL, '3.137.73.221', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGx4SE95WDVQMWJHck16eXJtSFJmSWxINWpUVktDbEFJSDVRS3JPTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756212498),
('pxeC0W6NR0cN6xUmdXiM9aMMm4FFUDhTt1Q8S2q0', NULL, '45.148.10.80', 'Mozilla/5.0 (Linux; Android 9; ONEPLUS A5010) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.143 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVVIbExjcDFzd1hsaGNobEpIOFg1eVo3SUw2aThjRDhQWWJIUFRScCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756230112),
('qyqKOIdV8mwQu5w09MnFaLX9a2C40xBrJbfY5Nx0', NULL, '64.62.197.137', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/115.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1FxejZ0empOdVdEVEhzdk9aZHh6WlFYSk5IREwwVjBQSXdCdWd0ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756276951),
('r7Go62LRM5UTQmgVdS709QBWbx3dyk27XEoCCLfq', NULL, '195.184.76.238', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlpCYmw2V09XN3dqSzR4U1BBTzhCa29CUE81SlN2dVJZckFZbVBDNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756381042),
('RbnPul0s9LdKCVns197phH5culNDL4JDxcaXeQdG', NULL, '143.198.228.152', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaW9XNTBlcFB4NnRBZVpKdDFUSFhNSGdVbDlpRlN1OVhuRHpQZ09LOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756394575),
('rEhGBy4Sbazmxq7lkYtnyudBQBP4xDNwbSmk0Sqk', NULL, '8.219.153.58', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTVIeVRpejVubWcyd2FtZWk3NVdBbUdtdFVKZ3E2MlJVTks4NHBPZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756328952),
('rqwW1YMEdmE64VpHxIpIFkOEjQAtkQCBCY9NYZja', NULL, '45.79.134.112', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTE0xblNvaGVPQWwzVVRDRG1JNDRneUlIdkRNZGxTWmpKU1RIVE5LdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756351579),
('s8UZvllgNyWNuX1GqeQzBexT6hcQrn83Dbzcwk0h', NULL, '3.134.148.59', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmdxSkFhOTZIYUFXb0tMYUpOZjlPUWhUcjVFT2FWVEZ3SGVvNWR1dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756390386),
('s9MnBsLUtn4QlBH52mjpCedHek0PJMfHDGPo1eKQ', NULL, '162.243.200.238', 'Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzFoQjE4ZmFmd25GWllzaUdDSXlkMHExUHhWV05hTlk3U2dXZjIwMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756273006),
('saawG5FeUKAffec3G31QLmYhGjjvh0I5gKh5O5sb', NULL, '3.130.96.91', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHZtY0o2TjRzNTdFSjNyNk8wbURINWJsRkMxNkRiTjdCbVhhN1RTVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756386419),
('sBOAEkNZZhduWuyWxOW2kxzH59O4ZuwTXBwPvG5M', NULL, '79.124.58.198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjJCSURzSUtLd3RORVliUHowSHVWcEpPZDFiOThUWDBOWDRvckQ4NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP1hERUJVR19TRVNTSU9OX1NUQVJUPXBocHN0b3JtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756443535),
('SIYjgwvkWgsIxmcAvXU9f033al7TfxTbRWeEUBc0', NULL, '124.236.100.56', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGMzRVpzUjB2MU9ra0JNWXl4Q0pDemRkbjg4TkdMOVpnaWlZNTl6dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756350215),
('sN1DqmrxpfWBVi2sGCMrH8On4BfimQykVy4f4PL4', NULL, '194.187.176.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmZSYU05ZVRwUVlwcTJZTVlvUEFEMWpFMXZZd0tHZlBlNkZ6SkpTTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756265647),
('UJe02qkPNNnXfya2xZrOq8M4hu71gHVxQHARAKsG', NULL, '34.52.176.247', 'python-requests/2.32.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVcyTDBxS0prVXZoNUIxWmZHaTFyQVFxT2tsbkcxM1RtWlNGQVA0SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756336596),
('UPA6TiEGcM5E3JI62i2vrIYpUQS5OPav3hQu7Ydo', NULL, '185.242.226.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnNyYWE2b2VkYnRIZ0txbXlVY29XQlV5Z21sSG1OTmhPekV0ZDBhMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756362185),
('UxxSJHb7jpgoMgyRPtoEukuifRh46VstlO54rYUN', NULL, '93.123.109.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2tVQ0MybU5nY0VEZU8yaFZSb3JLVlI1OG5nZHFuZGpTa0ZnMnI0SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756230093),
('uyFj8QpJdbH1NHMP4dgV7JriCU04UQPyLOQvYjUX', NULL, '167.99.150.115', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTk9hck05NTdBbXpUendMT1kyQU5ib0I1QnJ5WE50Q2tUdmRrVXhiMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756351574),
('VCsRCWtx36IuVNPq5vDRzdJaZK4OSx6SfoZlz1VG', NULL, '47.245.117.221', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXQ0anV1Y3JoSDBFMkxBQzhkVGpla1A4WW01Y3ZlVkJyRDFZOFV5dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP2Rucz1xQlFCQUFBQkFBQUFBQUFBQjJWNFlXMXdiR1VEWTI5dEFBQUJBQUUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756305869),
('vOrSCGIQUgfoFtK8iVoj0oceKadp0IdfvrD78Ab1', NULL, '185.208.158.212', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVl1V2F5UERKTHcwOTB6dTNMTXRnRGE2aU9VeVBpME1ySjlLVHlpNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756273191),
('VzJpNK1PWGE82ylzgdeLlffjvOTRKMXEYJQd4OZe', NULL, '93.123.109.245', 'l9tcpid/v1.1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1c1OUZkUGxNNmVEa0tnUDJoUkQ1NHp1bTkybEl1aDRxYzV6SmtSQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756265620),
('w6gJCJkqZTUeArNyMqvNRHR8V8XPtffe5SRo8iWr', NULL, '172.234.231.111', 'Mozilla/5.0 (compatible; Nmap Scripting Engine; https://nmap.org/book/nse.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVhYQ09DWFhVOFgxZFNYTUF3djBjR0VGbUk5Zm9vWUJ0SFVsZUdOeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756327299),
('WNdLvgiTZTsydni5d1lt9A5hK26hs3NE2sP4QrTo', NULL, '3.143.33.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0hwR3VlN0h2eDhWU3FvcEtaUmg0NVhhVFlkZ1RNQlR3UkZvY1FmNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756392561),
('wOYQCcn0ib4QVYFbOLIO4RAZwmPxFbzxSqLaqgQB', NULL, '104.234.115.57', '\'Mozilla/5.0 (compatible; GenomeCrawlerd/1.0; +https://www.nokia.com/genomecrawler)\'', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTZ0SE8xOEh3Z2xaTkpFeWlLV1hNN2lpYk4xYXR5UW91R040ZkJsZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756280209),
('WyLZplV0epY5IAFlGuAlRr8Wgzpn5G49QE2E2wid', NULL, '5.133.192.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEl1MVlZUk5WZjJLdjhoV21WR0k3ZDM0Nk9xVXRtZjRXN05iblpYSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756318887),
('XDfNbTXaRsjH3an1UuL118pv5jle58DrQFqCYhkt', NULL, '64.62.156.148', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib29kZjdxN0lHMUJHZGZwRzRUejFnV1pWWTYzdEY3andtcEhVekNiNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756390221),
('XFDX1gW9GHQWOyNkkBAA7EhDhLD1t0z0t90b6GpO', NULL, '3.134.148.59', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienp5ZnBIMkpOQVBPUlRYRmJ4Y05HYk1BYktWNE93WW9kR0N6VkRUcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756396042),
('xmDeKbjt67jZj8h8pXHnnLgb2cM2zaF1ARzh1dGY', NULL, '47.245.117.221', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHhrTUVhRGtmeTZ2akV6OG9ZaVRMdHp6WUk2MFA5ckJFanY4TFV1aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMvP25hbWU9ZXhhbXBsZS5jb20mdHlwZT1BIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756305869),
('XsD7Y3JjCzR6D5C4c3um2PYHBAVLhal1MPphcrkj', NULL, '196.251.81.7', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; Touch; LCJB; rv:11.0) like Gecko', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlJqaTR2RGZBU1M3WVFjTTBBRjVvS3c5RVJQeHI3cDJjRG1KSEtCTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756383390),
('xZP5VfeJYDhuOyaTOMkfcGwiRaquFFgoxB7QVHUl', NULL, '185.180.140.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2MwZ0R0dlBMU1VIem5rWTMzdUhiUDhhaUdZQU9nbldkakRmV0pBUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756433063),
('y5QtirxoDdz18eLJonMGq8WkhhWGY2udRICCkrMa', NULL, '66.249.69.14', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.7204.183 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1ZCb1JXYVpaZHhZejc2RjlIYnRHanlMUU1TbzBIUW5ySXBGeFZqbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnBsYXkyOWJldC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756397804),
('yI37fevPaSPjf5TgSzomVpB9e7wHGVPAW2TXuXXn', NULL, '199.45.155.87', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW44bkF2aHFLMVVGblNqZTYwNTEyOXZiSWQ3enZDSmVUNVVoZXZPSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vcGxheTI5YmV0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756422517),
('yNVhVVdhrvnmGzCPUzPiBEy1glX9HkEruH9YvqzB', NULL, '47.237.115.100', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmh5aXBmRDFCOERrQXZnTTJHakozMlJlS1JjeEhTSWpjVHhpYllPMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756221346),
('YOLUPlmj9wi8MPT0umZGYbRX0veWB6Zqjk9Yyd4Y', NULL, '74.235.100.142', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWZpamFIOUFGUXM0TEJ0bWFQbjMwbTlBNE1kbjQ2UXZyanZLdnVJWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756441040),
('yTIcSwBerUHoEgg9JiYpA39xFVnt1h7hg3yUIrpq', NULL, '3.140.182.19', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQThDdGtnZTVveXk5azlVcFEyemZSd2VHV2tURGJPZ3F5bDBhZ3hpZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYXBwLmFrdGlzYWRhLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756223693),
('yVOIc5UNIWQer42PuhcrKZ8rVVKJcKhgYVCCsN2D', NULL, '165.232.78.158', 'Mozilla/5.0 (compatible; Odin; https://docs.getodin.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2xFQzRlSm1UaTJsTDAweUFwY0ZYQ2ljVmI2UnpadzJzNEdYcjhCUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756355658),
('yzL3HymYyqI48r3PVKiSH2RYH1EhbdSBQo4OEbit', NULL, '206.168.34.67', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXVvc0hPQnpGVG5ReHRudVdnbUJpZVgxaU02cnoweW5pWWVUaUJsVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756381833),
('Z5YVksOFHRoCD4qquXZYFPVJ4KSxeKZj90gEdtQ5', NULL, '68.183.25.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEttdDUxNVpGdGoyc2ZHZ0NCaG1Nb1JGenM0Y2thOFEyaG43ZzVGWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vMTI4LjE5OS4xOC4yMjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756360914);

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
(9, 'slides/qyTsv-083341-hfr.jpg', 1, 1, '2025-08-17 08:33:41', '2025-08-17 08:33:41'),
(10, 'slides/y61qY-083442-Byg.jpg', 1, 1, '2025-08-17 08:34:42', '2025-08-17 08:34:42'),
(11, 'slides/PVh5n-021541-4ke.jpg', 1, 1, '2025-08-26 14:15:41', '2025-08-26 14:15:41');

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
(3, 'test2', 'shaji', 91, '1234567897', '911234567897', '1234567897', 'shaji@gmail.com', 2, 'testing', 'karanthur', 'kunnamangalam', 'kozhikode', 'kerala', NULL, 1, '$2y$12$6IcW0Oj14wPJAZM77dyKdel90N0vusfTJDZLXAExwaQQVGQMgeh7W', NULL, 2, '2025-08-02 09:23:59', '2025-08-02 09:23:59'),
(4, 'test3', 'shaji', 91, '1234567896', '911234567896', '1234567896', 'shaji@gmail.com', 2, 'testing  sdfsdfsdfsd', 'karanthur', 'kunnamangalam', 'kozhikode', 'kerala', NULL, 1, '$2y$12$1JIrjK3Sn1KGE6RAszTUzeQJR6xrLhZCYdAxniiwJzJ25bl6U.E9a', NULL, 2, '2025-08-02 09:23:59', '2025-08-04 16:41:13'),
(5, 'ABC', 'ASD', 91, '1234567888', '911234567888', '1234567888', 'abc@gmail.com', 2, 'aaa', 'bbb', 'nnnn', 'www', 'kkkk', NULL, 1, '123456', NULL, 1, '2025-08-06 17:10:13', '2025-08-06 17:10:13'),
(6, 'Haris', 'testing', 91, '9995051050', '919995051050', '91999501050', 'harispendrive1@gmail.com', 2, NULL, 'Manipuram', 'koduvally', 'calicut', 'kerala', NULL, 1, '$2y$12$atvMYRDpP0fvP.HVqBLF..nIrsAY7HLGWMNyPgWY26KhhLe5hF172', NULL, NULL, '2025-08-16 09:46:06', '2025-08-17 09:52:21'),
(7, 'SF', 'testingRE', 91, '9995051051', '919995051051', '9995051051', 'haris@getlead.co.uk', 2, NULL, 'DHR', 'D', 'calicut', 'kerala', NULL, 1, '$2y$12$r9Or05JrBa0uvD7COVp1KOR/8pK2euOcjyywzB/pPlcQYv98Vhxae', NULL, NULL, '2025-08-25 09:44:41', '2025-08-25 09:44:41'),
(8, 'jithin', 'core', 91, '9633578798', '919633578798', '9633578798', 'koodathil.jithin@gmail.com', 2, NULL, 'kakkodi', 'calicut', 'calicut', 'kerala', NULL, 1, '$2y$12$gNv2FoogrkkkKkipi/WeG.VKkTdqMguHrP8BhHw1pM8diSONSy6Oy', NULL, NULL, '2025-08-26 14:17:13', '2025-08-26 14:17:13');

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
-- AUTO_INCREMENT for table `billing_subscriptions`
--
ALTER TABLE `billing_subscriptions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `pk_brand_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `pk_category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `pk_size_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item_types`
--
ALTER TABLE `item_types`
  MODIFY `pk_type_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `pk_material_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pk_product_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `pk_role_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slide_images`
--
ALTER TABLE `slide_images`
  MODIFY `pk_slide_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `pk_user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
