-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Şub 2024, 11:35:15
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `subscription_management_api`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `apps`
--

CREATE TABLE `apps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `endpoint` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `apps`
--

INSERT INTO `apps` (`id`, `name`, `endpoint`, `created_at`, `updated_at`) VALUES
(1, 'Instagram', 'https://api-insta-test.com/', '2024-02-22 08:30:49', '2024-02-22 08:30:49'),
(2, 'Facebook', 'https://api-face-test.com/', '2024-02-22 08:30:49', '2024-02-22 08:30:49'),
(3, 'Tinder', 'https://api-tinder-test.com/', '2024-02-22 08:30:49', '2024-02-22 08:30:49'),
(4, 'Sence', 'https://api-sence-test.com/', '2024-02-22 08:30:49', '2024-02-22 08:30:49'),
(5, 'FindFind', 'https://api-find-test.com/', '2024-02-22 08:30:49', '2024-02-22 08:30:49'),
(6, 'Tech', 'https://api-tech-test.com/', '2024-02-22 08:30:49', '2024-02-22 08:30:49');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(255) NOT NULL,
  `language` varchar(50) NOT NULL,
  `os` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `devices`
--

INSERT INTO `devices` (`id`, `uid`, `language`, `os`, `created_at`, `updated_at`) VALUES
(1, '123', 'tr', 'ios', '2024-02-22 08:31:01', '2024-02-22 08:31:01'),
(2, '1234', 'tr', 'android', '2024-02-22 08:31:19', '2024-02-22 08:31:19'),
(3, '12332', 'tr', 'ios', '2024-02-22 08:44:37', '2024-02-22 08:44:37'),
(4, '123322', 'tr', 'ios', '2024-02-22 11:15:06', '2024-02-22 11:15:06');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `device_apps`
--

CREATE TABLE `device_apps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `app_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `device_apps`
--

INSERT INTO `device_apps` (`id`, `device_id`, `app_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-02-22 08:31:01', '2024-02-22 08:31:01'),
(2, 1, 2, '2024-02-22 08:31:06', '2024-02-22 08:31:06'),
(3, 1, 3, '2024-02-22 08:31:07', '2024-02-22 08:31:07'),
(4, 2, 1, '2024-02-22 08:31:19', '2024-02-22 08:31:19'),
(5, 2, 2, '2024-02-22 08:31:34', '2024-02-22 08:31:34'),
(6, 2, 3, '2024-02-22 08:31:40', '2024-02-22 08:31:40'),
(7, 1, 4, '2024-02-22 08:32:02', '2024-02-22 08:32:02'),
(8, 3, 1, '2024-02-22 08:44:37', '2024-02-22 08:44:37'),
(9, 4, 1, '2024-02-22 11:15:06', '2024-02-22 11:15:06');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `err_code` varchar(255) DEFAULT NULL,
  `retry_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `subscription_id`, `err_code`, `retry_count`, `failed_at`, `created_at`, `updated_at`) VALUES
(20, 4, 'rate-limit', 7, '2024-02-22 10:19:22', '2024-02-22 10:19:22', '2024-02-22 10:28:00'),
(21, 5, 'rate-limit', 28, '2024-02-22 10:19:22', '2024-02-22 10:19:22', '2024-02-22 11:07:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_02_21_075522_create_apps_table', 1),
(2, '2018_02_13_000001_create_devices_table', 1),
(3, '2019_02_21_134522_create_device_apps_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_19_083634_create_purchases_tables', 1),
(6, '2024_02_20_181454_create_subscriptions_table', 1),
(8, '2016_02_22_120327_create_failed_jobs_table', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Device', 1, 'client_token', '19255329c3f83b4dae23175e074bb38472fdce2f59dd640a8db2e8dfbac51c8a', '[\"*\"]', NULL, NULL, '2024-02-22 08:31:01', '2024-02-22 08:31:01'),
(2, 'App\\Models\\Device', 1, 'client_token', '4f8b0b4e3667e87b23aa9637e71ddd53bfc1557e9e26316f3e264970e8f087a0', '[\"*\"]', NULL, NULL, '2024-02-22 08:31:06', '2024-02-22 08:31:06'),
(3, 'App\\Models\\Device', 1, 'client_token', '87bc94e64d9d54470a1230674141cbd73e0559b11ce17ac4f76cafafbae57850', '[\"*\"]', NULL, NULL, '2024-02-22 08:31:07', '2024-02-22 08:31:07'),
(4, 'App\\Models\\Device', 2, 'client_token', 'bb23fa20f2ac5664a995bb5f98dc595233ad5fab20b45f9ef67d8ac96fdcf221', '[\"*\"]', NULL, NULL, '2024-02-22 08:31:19', '2024-02-22 08:31:19'),
(5, 'App\\Models\\Device', 2, 'client_token', 'c9e98472a37aba7c58e2619c366d2081649e1bafcf3e51ec269297978618eb0f', '[\"*\"]', NULL, NULL, '2024-02-22 08:31:34', '2024-02-22 08:31:34'),
(6, 'App\\Models\\Device', 2, 'client_token', 'ba951111064933c4dc670b90af3197882cbe71562d8135fe1a682def96d5c352', '[\"*\"]', '2024-02-22 08:31:56', NULL, '2024-02-22 08:31:40', '2024-02-22 08:31:56'),
(7, 'App\\Models\\Device', 1, 'client_token', '3a87226f921649b5a5c1056e5d2e7a609e12f18a19edaf058bea8cfdd5f51db6', '[\"*\"]', '2024-02-22 11:16:12', NULL, '2024-02-22 08:32:02', '2024-02-22 11:16:12'),
(8, 'App\\Models\\Device', 3, 'client_token', '99192a37a8cacbc5770d3e4a648cf80bfb433f3a7a9e89a9096c449030da49e3', '[\"*\"]', '2024-02-22 11:14:58', NULL, '2024-02-22 08:44:37', '2024-02-22 11:14:58'),
(9, 'App\\Models\\Device', 4, 'client_token', 'e3a2863e5790fc5e5f4d6a3a372934881862bdb1a3e96a52bb5c14a5a89e6f8d', '[\"*\"]', '2024-02-22 11:15:18', NULL, '2024-02-22 11:15:06', '2024-02-22 11:15:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `receipt` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `purchases`
--

INSERT INTO `purchases` (`id`, `device_id`, `receipt`, `created_at`, `updated_at`) VALUES
(1, 2, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:32:04', '2024-02-22 09:32:04'),
(2, 2, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:32:04', '2024-02-22 09:32:04'),
(3, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69215', '2024-02-22 09:32:04', '2024-02-22 09:32:04'),
(4, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:32:04', '2024-02-22 09:32:04'),
(5, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:32:04', '2024-02-22 09:32:04'),
(6, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:32:04', '2024-02-22 09:32:04'),
(7, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:32:04', '2024-02-22 09:32:04'),
(8, 2, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:35:06', '2024-02-22 09:35:06'),
(9, 2, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:35:06', '2024-02-22 09:35:06'),
(10, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 09:35:06', '2024-02-22 09:35:06'),
(11, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 09:38:12', '2024-02-22 09:38:12'),
(12, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 09:38:12', '2024-02-22 09:38:12'),
(13, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:38:12', '2024-02-22 09:38:12'),
(14, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:38:12', '2024-02-22 09:38:12'),
(15, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 09:38:12', '2024-02-22 09:38:12'),
(16, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:13:07', '2024-02-22 10:13:07'),
(17, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:13:28', '2024-02-22 10:13:28'),
(18, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:13:39', '2024-02-22 10:13:39'),
(19, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:14:21', '2024-02-22 10:14:21'),
(20, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:14:21', '2024-02-22 10:14:21'),
(21, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:14:28', '2024-02-22 10:14:28'),
(22, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:14:28', '2024-02-22 10:14:28'),
(23, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:14:53', '2024-02-22 10:14:53'),
(24, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:14:53', '2024-02-22 10:14:53'),
(25, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:16:10', '2024-02-22 10:16:10'),
(26, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:16:10', '2024-02-22 10:16:10'),
(27, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:17:06', '2024-02-22 10:17:06'),
(28, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:17:06', '2024-02-22 10:17:06'),
(29, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:17:56', '2024-02-22 10:17:56'),
(30, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:17:56', '2024-02-22 10:17:56'),
(31, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:18:18', '2024-02-22 10:18:18'),
(32, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:18:18', '2024-02-22 10:18:18'),
(33, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:19:22', '2024-02-22 10:19:22'),
(34, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:19:22', '2024-02-22 10:19:22'),
(35, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:22:15', '2024-02-22 10:22:15'),
(36, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:22:41', '2024-02-22 10:22:41'),
(37, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:23:06', '2024-02-22 10:23:06'),
(38, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:23:12', '2024-02-22 10:23:12'),
(39, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:24:10', '2024-02-22 10:24:10'),
(40, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:26:06', '2024-02-22 10:26:06'),
(41, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:26:06', '2024-02-22 10:26:06'),
(42, 2, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 10:27:00', '2024-02-22 10:27:00'),
(43, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:27:00', '2024-02-22 10:27:00'),
(44, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:27:00', '2024-02-22 10:27:00'),
(45, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 10:27:00', '2024-02-22 10:27:00'),
(46, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69224', '2024-02-22 10:28:00', '2024-02-22 10:28:00'),
(47, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:28:00', '2024-02-22 10:28:00'),
(48, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:29:00', '2024-02-22 10:29:00'),
(49, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:29:00', '2024-02-22 10:29:00'),
(50, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:30:00', '2024-02-22 10:30:00'),
(51, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:30:00', '2024-02-22 10:30:00'),
(52, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:35:00', '2024-02-22 10:35:00'),
(53, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:35:00', '2024-02-22 10:35:00'),
(54, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:36:00', '2024-02-22 10:36:00'),
(55, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:36:00', '2024-02-22 10:36:00'),
(56, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:37:00', '2024-02-22 10:37:00'),
(57, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:37:00', '2024-02-22 10:37:00'),
(58, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:38:00', '2024-02-22 10:38:00'),
(59, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:38:00', '2024-02-22 10:38:00'),
(60, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 10:38:39', '2024-02-22 10:38:39'),
(61, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:39:00', '2024-02-22 10:39:00'),
(62, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:39:00', '2024-02-22 10:39:00'),
(63, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:40:00', '2024-02-22 10:40:00'),
(64, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:40:00', '2024-02-22 10:40:00'),
(65, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:41:00', '2024-02-22 10:41:00'),
(66, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:41:00', '2024-02-22 10:41:00'),
(67, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:42:00', '2024-02-22 10:42:00'),
(68, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:42:00', '2024-02-22 10:42:00'),
(69, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:43:00', '2024-02-22 10:43:00'),
(70, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:43:00', '2024-02-22 10:43:00'),
(71, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:44:00', '2024-02-22 10:44:00'),
(72, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:44:00', '2024-02-22 10:44:00'),
(73, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:45:00', '2024-02-22 10:45:00'),
(74, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:45:00', '2024-02-22 10:45:00'),
(75, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:46:00', '2024-02-22 10:46:00'),
(76, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:46:00', '2024-02-22 10:46:00'),
(77, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:47:00', '2024-02-22 10:47:00'),
(78, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:47:00', '2024-02-22 10:47:00'),
(79, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:48:00', '2024-02-22 10:48:00'),
(80, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:48:00', '2024-02-22 10:48:00'),
(81, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:49:00', '2024-02-22 10:49:00'),
(82, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:49:00', '2024-02-22 10:49:00'),
(83, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:50:00', '2024-02-22 10:50:00'),
(84, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:50:00', '2024-02-22 10:50:00'),
(85, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:51:00', '2024-02-22 10:51:00'),
(86, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:51:00', '2024-02-22 10:51:00'),
(87, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:52:00', '2024-02-22 10:52:00'),
(88, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:52:00', '2024-02-22 10:52:00'),
(89, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:53:00', '2024-02-22 10:53:00'),
(90, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:53:00', '2024-02-22 10:53:00'),
(91, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 10:54:00', '2024-02-22 10:54:00'),
(92, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 10:54:00', '2024-02-22 10:54:00'),
(93, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 11:05:00', '2024-02-22 11:05:00'),
(94, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 11:05:00', '2024-02-22 11:05:00'),
(95, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 11:06:00', '2024-02-22 11:06:00'),
(96, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 11:06:00', '2024-02-22 11:06:00'),
(97, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', '2024-02-22 11:07:00', '2024-02-22 11:07:00'),
(98, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', '2024-02-22 11:07:00', '2024-02-22 11:07:00'),
(99, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 11:12:24', '2024-02-22 11:12:24'),
(100, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 11:14:08', '2024-02-22 11:14:08'),
(101, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 11:14:58', '2024-02-22 11:14:58'),
(102, 4, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 11:15:16', '2024-02-22 11:15:16'),
(103, 4, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', '2024-02-22 11:15:18', '2024-02-22 11:15:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `app_id` bigint(20) UNSIGNED NOT NULL,
  `receipt` varchar(255) NOT NULL,
  `status` enum('started','renewed','expired','cancelled') NOT NULL DEFAULT 'started',
  `expire_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `device_id`, `app_id`, `receipt`, `status`, `expire_date`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'cancelled', '2024-02-22 14:16:12', '2024-02-22 08:31:52', '2024-02-22 11:16:12'),
(2, 2, 2, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'renewed', '2024-03-22 12:35:06', '2024-02-22 08:31:54', '2024-02-22 09:35:06'),
(3, 2, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'renewed', '2024-03-22 13:27:00', '2024-02-22 08:31:56', '2024-02-22 10:27:00'),
(4, 1, 3, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a69226', 'expired', '2024-02-20 11:56:08', '2024-02-22 08:32:41', '2024-02-22 10:29:00'),
(5, 1, 2, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6924', 'expired', '2024-02-20 11:56:08', '2024-02-22 08:32:47', '2024-02-22 10:39:00'),
(6, 1, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'renewed', '2024-03-22 13:27:00', '2024-02-22 08:33:07', '2024-02-22 10:27:00'),
(7, 1, 4, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'renewed', '2024-03-22 12:38:12', '2024-02-22 08:33:10', '2024-02-22 09:38:12'),
(8, 3, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'renewed', '2024-03-22 12:38:12', '2024-02-22 08:44:51', '2024-02-22 09:38:12'),
(9, 3, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'started', '2024-02-22 16:38:39', '2024-02-22 10:38:39', '2024-02-22 10:38:39'),
(10, 4, 1, '6146ccf6a66d994f7c363db875e31ca35581450a4bf6d3be6cc9ac79233a6921', 'started', '2024-02-22 17:15:16', '2024-02-22 11:15:16', '2024-02-22 11:15:16');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apps_name_index` (`name`);

--
-- Tablo için indeksler `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `devices_uid_unique` (`uid`),
  ADD KEY `devices_os_index` (`os`),
  ADD KEY `devices_uid_index` (`uid`);

--
-- Tablo için indeksler `device_apps`
--
ALTER TABLE `device_apps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_apps_device_id_foreign` (`device_id`),
  ADD KEY `device_apps_app_id_foreign` (`app_id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_jobs_subscription_id_index` (`subscription_id`),
  ADD KEY `failed_jobs_failed_at_index` (`failed_at`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_device_id_foreign` (`device_id`);

--
-- Tablo için indeksler `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_device_id_foreign` (`device_id`),
  ADD KEY `subscriptions_app_id_foreign` (`app_id`),
  ADD KEY `subscriptions_status_index` (`status`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `apps`
--
ALTER TABLE `apps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `device_apps`
--
ALTER TABLE `device_apps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Tablo için AUTO_INCREMENT değeri `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `device_apps`
--
ALTER TABLE `device_apps`
  ADD CONSTRAINT `device_apps_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`),
  ADD CONSTRAINT `device_apps_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`);

--
-- Tablo kısıtlamaları `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD CONSTRAINT `failed_jobs_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`);

--
-- Tablo kısıtlamaları `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`),
  ADD CONSTRAINT `subscriptions_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
