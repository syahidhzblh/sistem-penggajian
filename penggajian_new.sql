-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2020_12_20_102435_create_table_roles',	1),
(2,	'2020_12_20_102506_create_table_users',	1),
(3,	'2020_12_23_114942_create_table_position',	1),
(4,	'2020_12_23_115044_create_table_departement',	1),
(5,	'2020_12_23_115444_create_table_staff',	1),
(6,	'2020_12_23_120038_create_table_absensi',	1),
(7,	'2020_12_23_121157_create_table_cuti',	1),
(8,	'2020_12_23_121505_create_table_overtime',	1),
(9,	'2020_12_23_121836_create_table_salary',	1),
(10,	'2020_12_23_122258_create_table_schedule',	1),
(11,	'2021_01_02_135908_create_table_attendance',	1),
(12,	'2021_01_02_141320_create_add_field',	1);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'Administrator',	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(2,	'karyawan',	'Karyawan',	'2024-01-29 19:19:23',	'2024-01-29 19:19:23');

DROP TABLE IF EXISTS `tb_absensi`;
CREATE TABLE `tb_absensi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` int(10) unsigned NOT NULL,
  `attendance_id` int(10) unsigned NOT NULL,
  `bulan_ke` int(11) NOT NULL,
  `jumlah_lembur` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Staff','Daily Worker') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_absen` date NOT NULL,
  `waktu_masuk` time NOT NULL,
  `waktu_keluar` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_absensi_attendance_id_foreign` (`attendance_id`),
  CONSTRAINT `tb_absensi_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `tb_attendance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_absensi` (`id`, `schedule_id`, `attendance_id`, `bulan_ke`, `jumlah_lembur`, `code`, `periode`, `status`, `tanggal_absen`, `waktu_masuk`, `waktu_keluar`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-30',	'00:00:00',	'00:00:00',	'2024-01-29 19:23:29',	'2024-01-29 19:23:29'),
(2,	1,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-31',	'00:00:00',	'00:00:00',	'2024-01-29 19:23:59',	'2024-01-29 19:23:59'),
(3,	1,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-01',	'00:00:00',	'00:00:00',	'2024-01-29 19:24:17',	'2024-01-29 19:24:17'),
(4,	1,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-02',	'00:00:00',	'00:00:00',	'2024-01-29 19:24:30',	'2024-01-29 19:24:30'),
(5,	1,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-03',	'00:00:00',	'00:00:00',	'2024-01-29 19:24:38',	'2024-01-29 19:24:38'),
(6,	1,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-04',	'00:00:00',	'00:00:00',	'2024-01-29 19:24:45',	'2024-01-29 19:24:45'),
(7,	1,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-17',	'00:00:00',	'00:00:00',	'2024-01-30 07:46:36',	'2024-01-30 07:46:36'),
(8,	2,	1,	0,	0,	'',	'januari-2024',	'Staff',	'2024-01-17',	'00:00:00',	'00:00:00',	'2024-01-30 07:46:36',	'2024-01-30 07:46:36');

DROP TABLE IF EXISTS `tb_attendance`;
CREATE TABLE `tb_attendance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `singkatan` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_attendance` (`id`, `name`, `label`, `singkatan`, `value`, `created_at`, `updated_at`) VALUES
(1,	'Present',	'badge badge-success',	'H',	1,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(2,	'Permision',	'badge badge-warning',	'I',	0,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(3,	'Sick',	'badge badge-info',	'S',	0,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(4,	'Alpha',	'badge badge-danger',	'A',	0,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23');

DROP TABLE IF EXISTS `tb_cuti`;
CREATE TABLE `tb_cuti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `jumlah_cuti` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_cuti_staff_id_foreign` (`staff_id`),
  CONSTRAINT `tb_cuti_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_cuti` (`id`, `staff_id`, `jumlah_cuti`, `tgl_mulai`, `tgl_selesai`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	'2024-01-30',	'2024-01-31',	'test',	'1',	'2024-01-29 19:30:29',	'2024-01-29 19:30:36');

DROP TABLE IF EXISTS `tb_departement`;
CREATE TABLE `tb_departement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_departement` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'House Keeping',	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(2,	'Front Office',	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(3,	'F&B Service',	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(4,	'F&B Production',	'2024-01-29 19:19:23',	'2024-01-29 19:19:23');

DROP TABLE IF EXISTS `tb_overtime`;
CREATE TABLE `tb_overtime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `jumlah_overtime` double NOT NULL DEFAULT '0',
  `tgl_overtime` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_overtime_staff_id_foreign` (`staff_id`),
  CONSTRAINT `tb_overtime_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tb_position`;
CREATE TABLE `tb_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Staff','Daily Worker') COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_position` (`id`, `name`, `status`, `salary`, `created_at`, `updated_at`) VALUES
(1,	'Cheif',	'Staff',	3000000,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(2,	'Manager',	'Staff',	5000000,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(3,	'Supervisor',	'Staff',	3500000,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(4,	'Head',	'Staff',	6000000,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23'),
(5,	'Helper',	'Staff',	3000000,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23');

DROP TABLE IF EXISTS `tb_salary`;
CREATE TABLE `tb_salary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `salary` double NOT NULL DEFAULT '0',
  `uang_overtime` double NOT NULL DEFAULT '0',
  `pot_bpjs` double NOT NULL DEFAULT '0',
  `tgl_salary` date NOT NULL,
  `periode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transportasi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` double DEFAULT '0',
  `status_gaji` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_overtime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_salary_staff_id_foreign` (`staff_id`),
  CONSTRAINT `tb_salary_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_salary` (`id`, `staff_id`, `salary`, `uang_overtime`, `pot_bpjs`, `tgl_salary`, `periode`, `transportasi`, `total`, `status_gaji`, `status`, `jumlah_overtime`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3,	1,	3000000,	25000,	150000,	'2024-01-30',	'Januari-2024',	'220000',	3745000,	NULL,	'Staff',	'15',	'2024-01-29 19:29:22',	'2024-01-29 19:29:22',	NULL);

DROP TABLE IF EXISTS `tb_schedule`;
CREATE TABLE `tb_schedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `tgl_masuk` date NOT NULL,
  `ket_schedule` enum('Morning(05:00-14:00)','Afternoon(13:00-22:00)','Middle Morning(10:00-19:00)','Middle Afternoon(12:00-21:00)','Evening (19:00-04:00)','Mignight (22:00-07:00)') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Staff','Daily Worker') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_schedule_staff_id_foreign` (`staff_id`),
  CONSTRAINT `tb_schedule_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_schedule` (`id`, `staff_id`, `tgl_masuk`, `ket_schedule`, `status`, `created_at`, `updated_at`) VALUES
(1,	1,	'2024-01-30',	'Morning(05:00-14:00)',	'Staff',	'2024-01-29 19:23:10',	'2024-01-29 19:23:10'),
(2,	3,	'2024-01-28',	'Morning(05:00-14:00)',	'Staff',	'2024-01-30 07:43:48',	'2024-01-30 07:43:48');

DROP TABLE IF EXISTS `tb_staff`;
CREATE TABLE `tb_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(10) unsigned NOT NULL,
  `departement_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `addres` text COLLATE utf8mb4_unicode_ci,
  `startdate` date NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_staff_position_id_foreign` (`position_id`),
  KEY `tb_staff_departement_id_foreign` (`departement_id`),
  KEY `tb_staff_users_id_foreign` (`users_id`),
  CONSTRAINT `tb_staff_departement_id_foreign` FOREIGN KEY (`departement_id`) REFERENCES `tb_departement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_staff_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `tb_position` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_staff_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tb_staff` (`id`, `position_id`, `departement_id`, `users_id`, `name`, `birth`, `addres`, `startdate`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	1,	1,	1,	'Tasrin Adiputra',	'2024-01-30',	NULL,	'2024-01-30',	'',	'2024-01-29 19:19:23',	'2024-01-29 19:19:23',	NULL),
(2,	3,	2,	2,	'TEST',	'2024-01-30',	'TEST',	'2024-01-30',	'123',	'2024-01-30 07:29:42',	'2024-01-30 07:29:42',	NULL),
(3,	4,	3,	3,	'test 2',	'2024-01-30',	'test',	'2024-01-31',	'123',	'2024-01-30 07:42:29',	'2024-01-30 07:42:29',	NULL);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `role_id`, `email`, `name`, `username`, `password`, `foto`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	1,	'admin@gmail.com',	'Administrator',	'admin',	'$2y$10$G2H7AOsci03.hMkFPse1.eme9TEbBryxCOh6YFKFHNwDQV1F9Jio.',	NULL,	NULL,	'2024-01-29 19:19:23',	'2024-01-29 19:19:23',	NULL),
(2,	2,	NULL,	'TEST',	'test123',	'$2y$10$8VyZM1f5qDLgOm5v39REy.fMw8jL4fl9s1KTzPCChLniM1hzlk79W',	NULL,	NULL,	'2024-01-30 07:29:42',	'2024-01-30 07:29:42',	NULL),
(3,	2,	NULL,	'test 2',	'test234',	'$2y$10$HzeYbC.ljn1zYwYIx2UaiOOeg6vvZQ9gu.uhZ7pQdxOFCtF615QD2',	NULL,	NULL,	'2024-01-30 07:42:29',	'2024-01-30 07:42:29',	NULL);

-- 2024-01-30 14:51:52
