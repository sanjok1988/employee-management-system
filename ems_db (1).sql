-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 01, 2019 at 03:56 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `time_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_out` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_diff` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `time_in`, `time_out`, `note`, `ip`, `status`, `time_diff`, `created_at`, `updated_at`) VALUES
(1, 3, '2019-03-26 13:25:25', '2019-03-26 13:25:48', NULL, '127.0.0.1', 'late', '00:09:10', '2019-03-26 13:25:25', '2019-03-26 13:25:48'),
(2, 3, '2019-03-27 02:40:57', '2019-03-27 02:40:57', NULL, '127.0.0.1', 'late', '00:01:34', '2019-03-27 02:40:57', '2019-03-27 02:40:57'),
(3, 5, '2019-03-28 11:23:16', '2019-03-28 11:23:16', NULL, '127.0.0.1', 'late', '00:07:08', '2019-03-28 11:23:16', '2019-03-28 11:23:16'),
(4, 6, '2019-04-01 01:05:39', '2019-04-01 01:05:39', NULL, '127.0.0.1', 'late', '00:03:09', '2019-04-01 01:05:39', '2019-04-01 01:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_list`
--

CREATE TABLE `candidate_list` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `form_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `form_id` int(11) DEFAULT NULL,
  `reviewer_id` int(50) DEFAULT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate_list`
--

INSERT INTO `candidate_list` (`id`, `employee_id`, `form_name`, `form_id`, `reviewer_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 'sample_review_form', 1, 1, 'completed', '2019-04-01 01:29:27', '2019-04-01 01:45:09'),
(2, 5, 'sample_review_form', 1, 2, 'completed', '2019-04-01 01:29:27', '2019-04-01 01:45:18'),
(3, 6, 'sample_review_form', 1, 1, 'completed', '2019-04-01 01:29:27', '2019-04-01 01:50:23'),
(4, 4, 'sample_review_form', 4, 1, NULL, '2019-04-01 01:29:53', '2019-04-01 01:29:53'),
(5, 5, 'sample_review_form', 4, 1, NULL, '2019-04-01 01:29:53', '2019-04-01 01:29:53'),
(7, 4, 'sample_review_form', 2, 1, NULL, '2019-04-01 01:30:10', '2019-04-01 01:30:10'),
(8, 5, 'sample_review_form', 2, 1, NULL, '2019-04-01 01:30:10', '2019-04-01 01:30:10'),
(10, 4, 'sample_review_form', 9, 1, NULL, '2019-04-01 01:34:23', '2019-04-01 01:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `details`, `address`, `type`, `country`, `time_zone`, `parent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IGC', 'test', NULL, NULL, NULL, NULL, NULL, '2019-03-10 04:01:10', '2019-03-31 02:49:34', '2019-03-31 02:49:34'),
(2, 'IGC', 'test', NULL, NULL, NULL, NULL, NULL, '2019-03-10 04:02:25', '2019-03-28 15:25:55', '2019-03-28 15:25:55'),
(3, 'IGC', 'test', NULL, NULL, NULL, NULL, NULL, '2019-03-10 04:02:49', '2019-03-28 15:25:53', '2019-03-28 15:25:53'),
(4, 'Dbros', 'test', NULL, NULL, NULL, NULL, NULL, '2019-03-10 04:03:18', '2019-03-28 15:25:52', '2019-03-28 15:25:52'),
(5, 'IIMS', 'college', NULL, NULL, NULL, NULL, NULL, '2019-03-31 02:49:13', '2019-03-31 02:49:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `martial_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `immigration_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driving_licence_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_grade` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supervisor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indirect_supervisor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_level_approver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_level_approver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_level_approver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `middle_name`, `last_name`, `nationality`, `dob`, `martial_status`, `immigration_status`, `other_id`, `driving_licence_no`, `employee_status`, `job_title`, `pay_grade`, `temp_address`, `per_address`, `city`, `country`, `province`, `postal_code`, `home_phone`, `mobile`, `work_phone`, `work_email`, `private_email`, `joined_date`, `termination_date`, `department`, `gender`, `supervisor`, `indirect_supervisor`, `first_level_approver`, `second_level_approver`, `third_level_approver`, `notes`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'sanjok', 'kumar', 'dangol', 'nepali', '1998-12-25', 'single', '', '123456', '123456', 'active', 'QA', '', 'test', 'ktm', 'Kathmandu', 'Nepal', NULL, NULL, '01-4352658', '9846526895', '9843405102', 'test@gmail.com', 'sanjog.dangol@gmail.com', '2019-03-01', '2019-03-31', 'JAVA', 'male', 'kalu', NULL, NULL, NULL, NULL, '', NULL, '2019-03-28 11:02:31', '2019-03-28 11:02:31'),
(5, 'sahan', 'kumar', 'dangol', 'nepali', '2019-03-02', NULL, NULL, NULL, NULL, NULL, 'QA', NULL, 'test', 'ktm', NULL, NULL, NULL, NULL, '01-1256325', '9846526895', NULL, 'sahan@gmail.com', 'sahan@gmail.com', '2019-03-05', NULL, 'JAVA', '', 'sanjok', NULL, NULL, NULL, NULL, '', NULL, '2019-03-28 11:10:40', '2019-03-28 11:10:40'),
(6, 'sanju', '', 'dangol', 'nepali', '2019-03-01', NULL, NULL, NULL, NULL, NULL, 'QA1', NULL, 'kathmandu', '', NULL, NULL, NULL, NULL, '12334555', '', NULL, 'sanju@gmail.com', 'nischal@gmail.com', '2019-03-01', NULL, '', '', '', NULL, NULL, NULL, NULL, '', NULL, '2019-03-31 02:50:57', '2019-04-01 01:07:01');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `name`, `start_date`, `end_date`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Self-Assessment Appr', '0000-00-00', '0000-00-00', 'Self-Assessment Appraisal', '2019-03-13 01:10:30', '0000-00-00 00:00:00'),
(2, 'Management by Object', '0000-00-00', '0000-00-00', 'Management by Objectives', '2019-03-13 01:10:30', '0000-00-00 00:00:00'),
(3, 'The Standard Rating ', '0000-00-00', '0000-00-00', 'The Standard Rating Scale', '2019-03-13 01:10:35', '0000-00-00 00:00:00'),
(4, 'Numerical Rating Sca', '0000-00-00', '0000-00-00', 'Numerical Rating Scale\r\n', '2019-03-13 01:10:35', '0000-00-00 00:00:00'),
(5, 'yrdy', '2019-03-02', '2019-03-30', 'test', '2019-03-28 08:11:03', '2019-03-28 08:11:03'),
(6, 'yrdy', '2019-03-02', '2019-03-30', 'test', '2019-03-28 08:11:39', '2019-03-28 08:11:39'),
(7, 'employee', '2019-03-01', '2019-03-31', '', '2019-03-31 02:58:22', '2019-03-31 02:58:22'),
(8, 'employee', '2019-03-01', '2019-03-31', '', '2019-03-31 02:58:35', '2019-03-31 02:58:35'),
(9, 'Self-Assessment Appr', '2019-04-01', '2019-04-30', 'Self-Assessment Appraisal', '2019-04-01 01:33:18', '2019-04-01 01:33:18'),
(10, 'yrdy', '2019-03-02', '2019-03-30', 'test', '2019-04-01 01:35:46', '2019-04-01 01:35:46'),
(11, 'Self-Assessment Appr', '2019-04-01', '2019-04-30', 'Self-Assessment Appraisal', '2019-04-01 01:36:32', '2019-04-01 01:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `generated_forms`
--

CREATE TABLE `generated_forms` (
  `question_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `generated_forms`
--

INSERT INTO `generated_forms` (`question_id`, `form_id`, `created_at`, `updated_at`) VALUES
(6, 9, '2019-04-01 01:33:18', '2019-04-01 01:33:18'),
(7, 9, '2019-04-01 01:33:18', '2019-04-01 01:33:18'),
(8, 9, '2019-04-01 01:33:18', '2019-04-01 01:33:18'),
(9, 9, '2019-04-01 01:33:18', '2019-04-01 01:33:18'),
(11, 9, '2019-04-01 01:33:18', '2019-04-01 01:33:18'),
(1, 10, '2019-04-01 01:35:46', '2019-04-01 01:35:46'),
(2, 10, '2019-04-01 01:35:46', '2019-04-01 01:35:46'),
(3, 10, '2019-04-01 01:35:46', '2019-04-01 01:35:46'),
(4, 10, '2019-04-01 01:35:46', '2019-04-01 01:35:46'),
(5, 10, '2019-04-01 01:35:46', '2019-04-01 01:35:46'),
(6, 11, '2019-04-01 01:36:32', '2019-04-01 01:36:32'),
(7, 11, '2019-04-01 01:36:32', '2019-04-01 01:36:32'),
(8, 11, '2019-04-01 01:36:32', '2019-04-01 01:36:32'),
(9, 11, '2019-04-01 01:36:32', '2019-04-01 01:36:32'),
(11, 11, '2019-04-01 01:36:32', '2019-04-01 01:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_03_09_021011_create_forms_table', 1),
(4, '2019_03_09_021738_entrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`, `created_at`) VALUES
(1, 'sign_in_time', '10:00:00', '2019-03-11 02:00:15'),
(2, 'sign_out_time', '17:00:00', '2019-03-11 02:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'user-list', 'Display user Listing', 'See only Listing Of user', NULL, NULL),
(2, 'user-create', 'Create user', 'Create New user', NULL, NULL),
(3, 'user-edit', 'Edit user', 'Edit user', NULL, NULL),
(4, 'user-delete', 'Delete user', 'Delete user', NULL, NULL),
(5, 'role-list', 'Display Role Listing', 'See only Listing Of Role', NULL, NULL),
(6, 'role-create', 'Create Role', 'Create New Role', NULL, NULL),
(7, 'role-edit', 'Edit Role', 'Edit Role', NULL, NULL),
(8, 'role-delete', 'Delete Role', 'Delete Role', NULL, NULL),
(9, 'employee-list', 'Display employee Listing', 'See only Listing Of employee', NULL, NULL),
(10, 'employee-create', 'Create employee', 'Create New employee', NULL, NULL),
(11, 'employee-edit', 'Edit employee', 'Edit employee', NULL, NULL),
(12, 'employee-delete', 'Delete employee', 'Delete employee', NULL, NULL),
(13, 'company-list', 'Display Company List', 'See only Listing Of companies', NULL, NULL),
(14, 'company-create', 'Create Company', 'Create New post', NULL, NULL),
(15, 'company-edit', 'Edit Company', 'Edit Copmpany', NULL, NULL),
(16, 'company-delete', 'Delete Company', 'Delete post', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 3),
(12, 1),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ques_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `ques_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Understands job requirements and responsibilities', 'Planning and Problem Solving', NULL, '2019-03-12 02:25:09', '2019-03-12 02:25:09'),
(2, 'Possesses required skills and knowledge for the job', 'job knowledge', NULL, '2019-03-12 02:25:32', '2019-03-13 03:04:33'),
(3, 'Keeps abreast of current developments pertaining to the job', 'planning and problem solving', NULL, '2019-03-12 02:31:56', '2019-03-13 03:04:01'),
(4, 'Works in an organized manner', 'job knowledge', NULL, '2019-03-12 02:38:28', '2019-03-13 03:04:39'),
(5, 'Requires minimal supervision', 'job knowledge', NULL, '2019-03-12 02:39:03', '2019-03-13 03:04:41'),
(6, 'Can identify problems', 'planning and problem solving', NULL, '2019-03-12 02:39:14', '2019-03-28 07:48:27'),
(7, 'Reacts to problems in appropriate time', 'job knowledge', NULL, '2019-03-12 02:39:26', '2019-03-28 07:48:32'),
(8, 'Keeps abreast of current developments pertaining to the job', 'job knowledge', NULL, '2019-03-12 02:41:49', '2019-03-12 02:41:49'),
(9, 'Understands job requirements and responsibilities', 'job knowledge', NULL, '2019-03-12 02:51:24', '2019-03-12 02:51:24'),
(11, 'Keeps abreast of current developments pertaining to the job', 'job knowledge', NULL, '2019-03-31 02:57:33', '2019-03-31 02:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `review_result`
--

CREATE TABLE `review_result` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `form_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `point` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `review_result`
--

INSERT INTO `review_result` (`id`, `employee_id`, `form_name`, `field_name`, `value`, `point`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'qid_6', NULL, 1, '2019-04-01 01:36:53', '2019-04-01 01:36:53'),
(2, 1, NULL, 'qid_7', NULL, 2, '2019-04-01 01:36:53', '2019-04-01 01:36:53'),
(3, 1, NULL, 'qid_8', NULL, 3, '2019-04-01 01:36:53', '2019-04-01 01:36:53'),
(4, 1, NULL, 'qid_9', NULL, 4, '2019-04-01 01:36:53', '2019-04-01 01:36:53'),
(5, 1, NULL, 'qid_11', NULL, 5, '2019-04-01 01:36:53', '2019-04-01 01:36:53'),
(6, 1, NULL, 'qid_6', NULL, 0, '2019-04-01 01:38:35', '2019-04-01 01:38:35'),
(7, 1, NULL, 'qid_7', NULL, 1, '2019-04-01 01:38:35', '2019-04-01 01:38:35'),
(8, 1, NULL, 'qid_8', NULL, 2, '2019-04-01 01:38:35', '2019-04-01 01:38:35'),
(9, 1, NULL, 'qid_9', NULL, 3, '2019-04-01 01:38:35', '2019-04-01 01:38:35'),
(10, 1, NULL, 'qid_11', NULL, 4, '2019-04-01 01:38:35', '2019-04-01 01:38:35'),
(11, 1, NULL, 'qid_6', NULL, 0, '2019-04-01 01:39:47', '2019-04-01 01:39:47'),
(12, 1, NULL, 'qid_7', NULL, 1, '2019-04-01 01:39:47', '2019-04-01 01:39:47'),
(13, 1, NULL, 'qid_8', NULL, 2, '2019-04-01 01:39:47', '2019-04-01 01:39:47'),
(14, 1, NULL, 'qid_9', NULL, 3, '2019-04-01 01:39:47', '2019-04-01 01:39:47'),
(15, 1, NULL, 'qid_11', NULL, 4, '2019-04-01 01:39:47', '2019-04-01 01:39:47'),
(16, 1, NULL, 'qid_6', NULL, 0, '2019-04-01 01:40:46', '2019-04-01 01:40:46'),
(17, 1, NULL, 'qid_7', NULL, 1, '2019-04-01 01:40:46', '2019-04-01 01:40:46'),
(18, 1, NULL, 'qid_8', NULL, 2, '2019-04-01 01:40:46', '2019-04-01 01:40:46'),
(19, 1, NULL, 'qid_9', NULL, 3, '2019-04-01 01:40:46', '2019-04-01 01:40:46'),
(20, 1, NULL, 'qid_11', NULL, 4, '2019-04-01 01:40:46', '2019-04-01 01:40:46'),
(21, 4, NULL, 'form_id', NULL, 9, '2019-04-01 01:45:09', '2019-04-01 01:45:09'),
(22, 4, NULL, 'qid_6', NULL, 0, '2019-04-01 01:45:09', '2019-04-01 01:45:09'),
(23, 4, NULL, 'qid_7', NULL, 1, '2019-04-01 01:45:09', '2019-04-01 01:45:09'),
(24, 4, NULL, 'qid_8', NULL, 2, '2019-04-01 01:45:09', '2019-04-01 01:45:09'),
(25, 4, NULL, 'qid_9', NULL, 3, '2019-04-01 01:45:09', '2019-04-01 01:45:09'),
(26, 4, NULL, 'qid_11', NULL, 4, '2019-04-01 01:45:09', '2019-04-01 01:45:09'),
(27, 5, NULL, 'form_id', NULL, 9, '2019-04-01 01:45:18', '2019-04-01 01:45:18'),
(28, 5, NULL, 'qid_6', NULL, 0, '2019-04-01 01:45:18', '2019-04-01 01:45:18'),
(29, 5, NULL, 'qid_7', NULL, 1, '2019-04-01 01:45:18', '2019-04-01 01:45:18'),
(30, 5, NULL, 'qid_8', NULL, 2, '2019-04-01 01:45:18', '2019-04-01 01:45:18'),
(31, 5, NULL, 'qid_9', NULL, 3, '2019-04-01 01:45:18', '2019-04-01 01:45:18'),
(32, 5, NULL, 'qid_11', NULL, 4, '2019-04-01 01:45:18', '2019-04-01 01:45:18'),
(33, 5, NULL, 'form_id', NULL, 9, '2019-04-01 01:45:40', '2019-04-01 01:45:40'),
(34, 5, NULL, 'qid_6', NULL, 0, '2019-04-01 01:45:40', '2019-04-01 01:45:40'),
(35, 5, NULL, 'qid_7', NULL, 1, '2019-04-01 01:45:40', '2019-04-01 01:45:40'),
(36, 5, NULL, 'qid_8', NULL, 2, '2019-04-01 01:45:40', '2019-04-01 01:45:40'),
(37, 5, NULL, 'qid_9', NULL, 3, '2019-04-01 01:45:40', '2019-04-01 01:45:40'),
(38, 5, NULL, 'qid_11', NULL, 4, '2019-04-01 01:45:40', '2019-04-01 01:45:40'),
(39, 5, NULL, 'form_id', NULL, 9, '2019-04-01 01:46:25', '2019-04-01 01:46:25'),
(40, 5, NULL, 'qid_6', NULL, 0, '2019-04-01 01:46:25', '2019-04-01 01:46:25'),
(41, 5, NULL, 'qid_7', NULL, 1, '2019-04-01 01:46:25', '2019-04-01 01:46:25'),
(42, 5, NULL, 'qid_8', NULL, 2, '2019-04-01 01:46:25', '2019-04-01 01:46:25'),
(43, 5, NULL, 'qid_9', NULL, 3, '2019-04-01 01:46:25', '2019-04-01 01:46:25'),
(44, 5, NULL, 'qid_11', NULL, 4, '2019-04-01 01:46:25', '2019-04-01 01:46:25'),
(45, 6, NULL, 'form_id', NULL, 9, '2019-04-01 01:50:23', '2019-04-01 01:50:23'),
(46, 6, NULL, 'qid_6', NULL, 0, '2019-04-01 01:50:23', '2019-04-01 01:50:23'),
(47, 6, NULL, 'qid_7', NULL, 1, '2019-04-01 01:50:23', '2019-04-01 01:50:23'),
(48, 6, NULL, 'qid_8', NULL, 2, '2019-04-01 01:50:23', '2019-04-01 01:50:23'),
(49, 6, NULL, 'qid_9', NULL, 3, '2019-04-01 01:50:23', '2019-04-01 01:50:23'),
(50, 6, NULL, 'qid_11', NULL, 0, '2019-04-01 01:50:23', '2019-04-01 01:50:23'),
(51, 6, NULL, 'form_id', NULL, 9, '2019-04-01 01:50:30', '2019-04-01 01:50:30'),
(52, 6, NULL, 'qid_6', NULL, 0, '2019-04-01 01:50:30', '2019-04-01 01:50:30'),
(53, 6, NULL, 'qid_7', NULL, 1, '2019-04-01 01:50:30', '2019-04-01 01:50:30'),
(54, 6, NULL, 'qid_8', NULL, 2, '2019-04-01 01:50:30', '2019-04-01 01:50:30'),
(55, 6, NULL, 'qid_9', NULL, 3, '2019-04-01 01:50:30', '2019-04-01 01:50:30'),
(56, 6, NULL, 'qid_11', NULL, 4, '2019-04-01 01:50:30', '2019-04-01 01:50:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'admin authority', NULL, NULL),
(2, 'hr', 'HR', 'HR authority', NULL, NULL),
(3, 'employee', 'Employee', 'Employee authority', NULL, NULL),
(4, 'test', 'test', '', '2019-03-11 00:57:36', '2019-03-11 00:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(3, 3),
(11, 3),
(18, 3),
(19, 3),
(20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$OR/AnQzF.zgHq6ySjppIQuz9xfezFGm/cOxOeKpOCmV8anLjx7Yfi', 'B602qGyNUlYMlDIvAL5yPz1Z9eB6pebv1gEUS3cLrh65viaHuqVZX18XXs2o', NULL, '2019-04-01 01:02:42'),
(2, 'HR', 'hr@gmail.com', '$2y$10$vfXWaKc48eYYQAi09TputepCP3eK6EdlYBl8iLLqh/F0ZuzeJALW6', NULL, NULL, NULL),
(3, 'Employee', 'employee@gmail.com', '$2y$10$hwL7aMcnQrXaf3qTsAcAZ.titwW9ZeQLS4CJrwlybHrZeIF5tHPX6', '4mJ5ukY8LAtqoB0GF8vpoIrgrmXhQfR8vUJarY50psTTs3vZ1PPVrourr7Ad', NULL, '2019-04-01 01:04:26'),
(11, 'sanjok', 'sanjog.dangol@gmail.com', '$2y$10$bBUwfmyDjQBN41ajA8/73uptvb6cHx6Pl6ReK0chGSTcKmiKRfP4.', NULL, NULL, NULL),
(18, 'sanjok', 'test@gmail.com', '$2y$10$mUrijuWfSFiQjjyt/Gv7K.5ry3fV4XXSiJ/l8Vi47/DDwE4sS3c0a', NULL, '2019-03-28 11:02:31', '2019-03-28 11:02:31'),
(19, 'sahan', 'sahan@gmail.com', '$2y$10$FbjZkxM52Efmkqmm6kvV7..vGdm86y1NeGx/ykZdaiWA/..J8F/Au', 'eFy9mFagaxriZiE1yUlAzJxwdDUFxKDeaSZLsjPnhEFdDkie4LDxSTp2OUFV', '2019-03-28 11:10:40', '2019-03-28 11:36:09'),
(20, 'sanju', 'sanju@gmail.com', '$2y$10$uF3xtS1MLXGz2HNvWCjIVOYsBSkw.wTRsKZVd3dCU/Gaek.BI3ufK', 'xDYXGQT5ks19DgpbUfrXO0C75NQCgECCMLA7O8zBsu5ok6glmGHiV7B4qmHu', '2019-03-31 02:50:57', '2019-04-01 01:05:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_list`
--
ALTER TABLE `candidate_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_result`
--
ALTER TABLE `review_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `candidate_list`
--
ALTER TABLE `candidate_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `review_result`
--
ALTER TABLE `review_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
