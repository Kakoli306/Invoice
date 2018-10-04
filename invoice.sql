-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2018 at 07:22 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `cashes`
--

CREATE TABLE `cashes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cashes`
--

INSERT INTO `cashes` (`id`, `name`, `amount`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'Saha', 76, 2, '2018-10-02 10:24:34', '2018-10-02 10:24:34'),
(2, 'iu', 67, 4, '2018-10-02 10:54:36', '2018-10-02 10:54:36'),
(3, 'superman', 1000, 3, '2018-10-04 09:59:07', '2018-10-04 09:59:07'),
(4, 'superman', 1000, 3, '2018-10-04 09:59:07', '2018-10-04 09:59:07'),
(5, 'superwomen', 900, 5, '2018-10-04 10:35:16', '2018-10-04 10:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `position`, `created_at`, `updated_at`) VALUES
(1, 'saha', 'Developer', '2018-09-29 23:13:16', '2018-09-29 23:13:16'),
(5, 'hello', 'admin', '2018-09-30 00:04:40', '2018-09-30 00:04:40'),
(8, 'then', 'cashier', '2018-09-30 00:09:07', '2018-09-30 00:09:07'),
(11, 'new', 'cashier', '2018-09-30 00:30:44', '2018-09-30 00:30:44'),
(12, 'yello', 'Developer', '2018-09-30 00:32:40', '2018-09-30 00:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_09_30_050401_create_customers_table', 2),
(4, '2018_09_30_064616_create_products_table', 3),
(5, '2018_10_01_142941_create_products_table', 4),
(6, '2018_10_01_144308_create_sales_table', 5),
(7, '2018_10_01_161213_create_cashes_table', 6),
(8, '2018_10_01_163059_create_cashes_table', 7),
(9, '2018_10_02_160541_create_cashes_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_arrival` date NOT NULL,
  `expiry_date` date NOT NULL,
  `selling_price` double(8,2) NOT NULL,
  `original_price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `quantity_left` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_name`, `generic_name`, `description`, `date_arrival`, `expiry_date`, `selling_price`, `original_price`, `quantity`, `quantity_left`, `profit`, `created_at`, `updated_at`) VALUES
(2, 'laptop', 'Electronics', 'all', '2018-10-01', '2018-10-27', 5000.00, 2000.00, 45, 17, 12000, '2018-10-01 08:58:25', '2018-10-01 08:58:25'),
(3, 'eyeliner', 'cosmetics', 'needed', '2018-10-01', '2018-10-27', 200.00, 350.00, 7, 3, 250, '2018-10-01 09:39:48', '2018-10-01 09:39:48'),
(4, 'mobile', 'electronics', 'need', '2018-10-01', '2018-10-27', 22000.00, 18000.00, 75, 64, 9000, '2018-10-01 09:51:09', '2018-10-01 09:51:09'),
(5, 'books', 'algorithm', 'programme', '2018-10-04', '2018-10-31', 800.00, 650.00, 8, 6, 200, '2018-10-04 10:34:01', '2018-10-04 10:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-10-01 08:56:52', '2018-10-01 08:56:52'),
(2, 2, 2, '2018-10-01 08:58:51', '2018-10-01 08:58:51'),
(3, 1, 2, '2018-10-01 09:26:00', '2018-10-01 09:26:00'),
(4, 4, 3, '2018-10-01 09:51:34', '2018-10-01 09:51:34'),
(5, 3, 2, '2018-10-04 09:58:37', '2018-10-04 09:58:37'),
(6, 5, 2, '2018-10-04 10:34:43', '2018-10-04 10:34:43'),
(7, 5, 2, '2018-10-04 10:34:43', '2018-10-04 10:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Saha', 'admin', 'admin@yahoo.com', '$2y$10$vrPWPGlCh0MZJPB3ZAOyxuaXuEqLWhMAA8Fiy0a7SaJxjaY6/OiGq', 'Cwaino6BMphoC0AnMpiul4aOiqEhJoZ7YmjGQsbRUc5AvEIq41wGtgkEO6Ch', '2018-09-29 09:04:27', '2018-09-29 09:04:27'),
(2, 'superadmin', 'superadmin', 'superadmin@gmail.com', '$2y$10$m5QYAmD7aJ.V2HVlaVG1QOPPxUCSVr6lCM1uTmvfe4lShaK/KTCw.', NULL, '2018-09-29 12:08:20', '2018-09-29 12:08:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cashes`
--
ALTER TABLE `cashes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cashes`
--
ALTER TABLE `cashes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
