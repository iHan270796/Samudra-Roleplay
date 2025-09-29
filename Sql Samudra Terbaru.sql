-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for samudra-roleplay
CREATE DATABASE IF NOT EXISTS `samudra-roleplay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `samudra-roleplay`;

-- Dumping structure for table samudra-roleplay.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','Buisness','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `buisness` (`buisness`),
  KEY `buisnessid` (`buisnessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.bank_accounts_new: ~27 rows (approximately)
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('bahamas', 0, '[]', '[]', 0, NULL),
	('bfw', 0, '[]', '[]', 0, NULL),
	('blackfang', 0, '[]', '[]', 0, NULL),
	('burgershot', 0, '[]', '[]', 0, NULL),
	('bus', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('garbage', 0, '[]', '[]', 0, NULL),
	('judge', 0, '[]', '[]', 0, NULL),
	('lawyer', 0, '[]', '[]', 0, NULL),
	('lonewm', 0, '[]', '[]', 0, NULL),
	('mafia', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('none', 0, '[]', '[]', 0, NULL),
	('pemerintah', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('reporter', 0, '[]', '[]', 0, NULL),
	('sasp', 0, '[]', '[]', 0, NULL),
	('taxi', 0, '[]', '[]', 0, NULL),
	('tow', 0, '[]', '[]', 0, NULL),
	('trucker', 0, '[]', '[]', 0, NULL),
	('unemployed', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL),
	('vineyard', 0, '[]', '[]', 0, NULL),
	('whiteblood', 0, '[]', '[]', 0, NULL),
	('yakuza', 0, '[]', '[]', 0, NULL);

-- Dumping structure for table samudra-roleplay.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.bank_statements: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.bans: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.billing_bills
CREATE TABLE IF NOT EXISTS `billing_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(60) NOT NULL,
  `receiver_name` varchar(120) NOT NULL,
  `issuer_cid` varchar(60) NOT NULL,
  `issuer_name` varchar(100) NOT NULL,
  `job` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `account` enum('cash','bank') NOT NULL DEFAULT 'bank',
  `status` enum('unpaid','paid','refunded','cancelled') NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_at` timestamp NULL DEFAULT NULL,
  `refunded_by_cid` varchar(60) DEFAULT NULL,
  `refunded_by_name` varchar(120) DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bills_cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.billing_bills: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.billing_job_perms
CREATE TABLE IF NOT EXISTS `billing_job_perms` (
  `job` varchar(60) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.billing_job_perms: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.billing_wallpapers
CREATE TABLE IF NOT EXISTS `billing_wallpapers` (
  `cid` varchar(60) NOT NULL,
  `wallpaper` varchar(1024) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.billing_wallpapers: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.boombox_songs
CREATE TABLE IF NOT EXISTS `boombox_songs` (
  `citizenid` varchar(64) NOT NULL,
  `label` varchar(30) NOT NULL,
  `link` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.boombox_songs: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.bossmenu
CREATE TABLE IF NOT EXISTS `bossmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7944 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.bossmenu: ~21 rows (approximately)
INSERT INTO `bossmenu` (`id`, `job_name`, `amount`) VALUES
	(1, 'police', 0),
	(2, 'ambulance', 0),
	(3, 'realestate', 0),
	(4, 'tuner', 0),
	(5, 'burgershot', 0),
	(6, 'mechanic', 0),
	(7, 'vanilla', 0),
	(8, 'whitewidow', 0),
	(9, 'pizzathis', 0),
	(10, 'catcafe', 0),
	(11, 'tequila', 0),
	(12, 'taco', 0),
	(13, 'drugdealer', 0),
	(41, 'pawn', 0),
	(377, 'casino', 0),
	(405, 'judge', 0),
	(608, 'beanmachine', 0),
	(1481, 'unemployed', 0),
	(1906, 'coolbeans', 0),
	(2931, 'redline', 0),
	(5095, 'yellowjack', 0);

-- Dumping structure for table samudra-roleplay.deanix_delivery_employees
CREATE TABLE IF NOT EXISTS `deanix_delivery_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) NOT NULL,
  `profile` varchar(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.deanix_delivery_employees: ~1 rows (approximately)
INSERT INTO `deanix_delivery_employees` (`id`, `user`, `profile`, `level`, `exp`, `created_at`, `updated_at`) VALUES
	(740, 'S27P7Z53', 'profile_1', 1, 0, '2025-09-28 19:02:12', '2025-09-28 19:02:12');

-- Dumping structure for table samudra-roleplay.job_applications
CREATE TABLE IF NOT EXISTS `job_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `answers` longtext NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `date_submitted` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_reviewed` timestamp NULL DEFAULT NULL,
  `reviewer_id` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job` (`job`),
  KEY `citizenid` (`citizenid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.job_applications: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.job_employee_permissions
CREATE TABLE IF NOT EXISTS `job_employee_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `permissions` text NOT NULL,
  `granted_by` varchar(50) NOT NULL,
  `granted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_job` (`citizenid`,`job`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.job_employee_permissions: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.job_manager_settings
CREATE TABLE IF NOT EXISTS `job_manager_settings` (
  `citizenid` varchar(50) NOT NULL,
  `settings` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.job_manager_settings: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.job_playtime
CREATE TABLE IF NOT EXISTS `job_playtime` (
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `total_minutes` int(10) unsigned NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`,`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.job_playtime: ~9 rows (approximately)
INSERT INTO `job_playtime` (`citizenid`, `job`, `total_minutes`, `last_updated`) VALUES
	('NM07QU9Q', 'ambulance', 115, '2025-09-26 15:12:33'),
	('NM07QU9Q', 'bahamas', 339, '2025-09-28 16:24:04'),
	('NM07QU9Q', 'mechanic', 4, '2025-09-28 16:49:19'),
	('NM07QU9Q', 'police', 68, '2025-09-28 16:44:27'),
	('NM07QU9Q', 'realestate', 64, '2025-09-28 18:54:04'),
	('NM07QU9Q', 'unemployed', 189, '2025-09-27 20:53:03'),
	('S27P7Z53', 'bahamas', 60, '2025-09-29 14:15:13'),
	('S27P7Z53', 'police', 17, '2025-09-28 19:25:27'),
	('S27P7Z53', 'unemployed', 5, '2025-09-28 19:07:58');

-- Dumping structure for table samudra-roleplay.k5_documents
CREATE TABLE IF NOT EXISTS `k5_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  `ownerId` varchar(50) DEFAULT NULL,
  `isCopy` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.k5_documents: ~0 rows (approximately)
INSERT INTO `k5_documents` (`id`, `data`, `ownerId`, `isCopy`) VALUES
	(2, '{"infoValue":"DENGAN INI KAMI MENYATAKAN BAHWASANYA SURAT INI BERLAKU UNTUK PENGOBATAN YANG BERLAKU DI KOTA DEANIX ROLPLAY","job":"ambulance","customName":"BPJS","isCopy":0,"createdAt":"Mon Sep 08 2025 17:54:12 GMT+0700 (Western Indonesia Time)","issuer":{"jobName":"EMS","birthDate":"2003.04.18.","lastname":"Takashima","firstname":"Hatsu P"},"id":1,"infoName":"SURAT KESEHATAN BPJS","fields":[{"value":"IHAN","name":"NAMA DEPAN"},{"value":"GANTENG","name":"NAMA BELAKANG "},{"value":"BOGOR, 18 SEPTEMBER 2002","name":"TEMPAT & TANGGAL LAHIR"},{"value":"8 SEPTEMBER 2025","name":"TANGGAL PEMBUATAN"},{"value":"8 OKTOBER 2025","name":"MASA BERLAKU"}],"name":"kesehatan","description":"BPJS"}', 'SPM4B343', 1);

-- Dumping structure for table samudra-roleplay.k5_document_templates
CREATE TABLE IF NOT EXISTS `k5_document_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.k5_document_templates: ~0 rows (approximately)
INSERT INTO `k5_document_templates` (`id`, `data`, `job`) VALUES
	(1, '{"documentDescription":"BPJS","documentName":"KESEHATAN DEANIX","fields":[{"name":"NAMA DEPAN","value":""},{"name":"NAMA BELAKANG ","value":""},{"name":"TEMPAT & TANGGAL LAHIR","value":""},{"name":"TANGGAL PEMBUATAN","value":""},{"name":"MASA BERLAKU","value":""}],"id":1,"infoName":"SURAT KESEHATAN BPJS","infoTemplate":"DENGAN INI KAMI MENYATAKAN BAHWASANYA SURAT INI BERLAKU UNTUK PENGOBATAN YANG BERLAKU DI KOTA DEANIX ROLPLAY","minGrade":"3"}', 'ambulance');

-- Dumping structure for table samudra-roleplay.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.management_outfits: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_bolos: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_bulletin: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_clocking: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_convictions: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_data: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_impound: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_incidents: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_logs: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_reports: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_vehicleinfo: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.mdt_weaponinfo: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mechanic_data
CREATE TABLE IF NOT EXISTS `mechanic_data` (
  `name` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `owner_id` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.mechanic_data: ~2 rows (approximately)
INSERT INTO `mechanic_data` (`name`, `label`, `balance`, `owner_id`, `owner_name`) VALUES
	('bennys', '', 0, NULL, NULL),
	('lscustoms', 'bengkel kota', 0, 'WYA70629', 'I Han');

-- Dumping structure for table samudra-roleplay.mechanic_employees
CREATE TABLE IF NOT EXISTS `mechanic_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `mechanic` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `joined` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.mechanic_employees: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mechanic_invoices
CREATE TABLE IF NOT EXISTS `mechanic_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `mechanic` varchar(255) NOT NULL,
  `total` float NOT NULL,
  `data` text NOT NULL,
  `paid` tinyint(1) DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.mechanic_invoices: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mechanic_orders
CREATE TABLE IF NOT EXISTS `mechanic_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `mechanic` varchar(255) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `amount_paid` float NOT NULL DEFAULT 0,
  `cart` text NOT NULL,
  `props_to_apply` text NOT NULL,
  `installation_progress` text DEFAULT NULL,
  `fulfilled` tinyint(1) DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1790 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.mechanic_orders: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mechanic_servicing_history
CREATE TABLE IF NOT EXISTS `mechanic_servicing_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `mechanic` varchar(255) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `serviced_part` varchar(10) NOT NULL,
  `mileage_km` float NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2398 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.mechanic_servicing_history: ~397 rows (approximately)
INSERT INTO `mechanic_servicing_history` (`id`, `identifier`, `mechanic`, `plate`, `serviced_part`, `mileage_km`, `date`) VALUES
	(2001, 'KT7038C4', 'bennys', 'HTS', 'suspension', 181.725, '2025-09-19 16:49:27'),
	(2002, 'KT7038C4', 'bennys', 'HTS', 'brakePads', 181.725, '2025-09-19 16:49:51'),
	(2003, 'KT7038C4', 'bennys', 'HTS', 'sparkPlugs', 181.725, '2025-09-19 16:50:11'),
	(2004, 'KT7038C4', 'bennys', 'HTS', 'clutch', 181.725, '2025-09-19 16:51:22'),
	(2005, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 166.642, '2025-09-19 17:19:18'),
	(2006, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 166.642, '2025-09-19 17:19:31'),
	(2007, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 166.642, '2025-09-19 17:19:44'),
	(2008, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 166.642, '2025-09-19 17:20:00'),
	(2009, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 166.642, '2025-09-19 17:20:51'),
	(2010, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 166.642, '2025-09-19 17:21:04'),
	(2011, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 166.642, '2025-09-19 17:21:17'),
	(2012, 'KT7038C4', 'bennys', '132342', 'engineOil', 497.555, '2025-09-19 17:23:17'),
	(2013, 'KT7038C4', 'bennys', '132342', 'clutch', 497.555, '2025-09-19 17:23:32'),
	(2014, 'HQR18O66', 'bennys', '3FI677FK', 'engineOil', 127.559, '2025-09-19 17:23:38'),
	(2015, 'HQR18O66', 'bennys', '3FI677FK', 'clutch', 127.559, '2025-09-19 17:23:50'),
	(2016, 'KT7038C4', 'bennys', '132342', 'airFilter', 497.555, '2025-09-19 17:23:52'),
	(2017, 'HQR18O66', 'bennys', '3FI677FK', 'airFilter', 127.559, '2025-09-19 17:24:03'),
	(2018, 'HQR18O66', 'bennys', '3FI677FK', 'sparkPlugs', 127.559, '2025-09-19 17:24:16'),
	(2019, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 497.555, '2025-09-19 17:24:22'),
	(2020, 'HQR18O66', 'bennys', '3FI677FK', 'brakePads', 127.559, '2025-09-19 17:24:29'),
	(2021, 'HQR18O66', 'bennys', '3FI677FK', 'tyres', 127.559, '2025-09-19 17:24:42'),
	(2022, 'KT7038C4', 'bennys', '132342', 'brakePads', 497.555, '2025-09-19 17:24:52'),
	(2023, 'HQR18O66', 'bennys', '3FI677FK', 'suspension', 127.559, '2025-09-19 17:24:55'),
	(2024, 'KT7038C4', 'bennys', '132342', 'suspension', 497.555, '2025-09-19 17:25:02'),
	(2025, 'KT7038C4', 'bennys', '132342', 'tyres', 497.555, '2025-09-19 17:25:22'),
	(2026, 'KT7038C4', 'bennys', '132342', 'suspension', 497.6, '2025-09-19 17:26:54'),
	(2027, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 195.828, '2025-09-19 18:46:51'),
	(2028, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 195.828, '2025-09-19 18:47:05'),
	(2029, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 195.828, '2025-09-19 18:47:18'),
	(2030, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 195.828, '2025-09-19 18:47:31'),
	(2031, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 195.828, '2025-09-19 18:47:44'),
	(2032, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 195.828, '2025-09-19 18:47:57'),
	(2033, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 195.828, '2025-09-19 18:48:11'),
	(2034, 'HQR18O66', 'bennys', '3FI677FK', 'engineOil', 155.055, '2025-09-19 18:49:14'),
	(2035, 'HQR18O66', 'bennys', '3FI677FK', 'clutch', 155.055, '2025-09-19 18:49:27'),
	(2036, 'KT7038C4', 'bennys', '132342', 'engineOil', 536.455, '2025-09-19 18:49:29'),
	(2037, 'HQR18O66', 'bennys', '3FI677FK', 'airFilter', 155.055, '2025-09-19 18:49:40'),
	(2038, 'KT7038C4', 'bennys', '132342', 'clutch', 536.455, '2025-09-19 18:49:44'),
	(2039, 'HQR18O66', 'bennys', '3FI677FK', 'sparkPlugs', 155.055, '2025-09-19 18:49:53'),
	(2040, 'KT7038C4', 'bennys', '132342', 'airFilter', 536.455, '2025-09-19 18:50:02'),
	(2041, 'HQR18O66', 'bennys', '3FI677FK', 'brakePads', 155.055, '2025-09-19 18:50:05'),
	(2042, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 536.455, '2025-09-19 18:50:16'),
	(2043, 'HQR18O66', 'bennys', '3FI677FK', 'suspension', 155.055, '2025-09-19 18:50:18'),
	(2044, 'KT7038C4', 'bennys', '132342', 'brakePads', 536.455, '2025-09-19 18:50:30'),
	(2045, 'HQR18O66', 'bennys', '3FI677FK', 'tyres', 155.055, '2025-09-19 18:50:31'),
	(2046, 'PGA7IEP0', 'bennys', '56312', 'engineOil', 511.91, '2025-09-19 18:50:40'),
	(2047, 'KT7038C4', 'bennys', '132342', 'tyres', 536.455, '2025-09-19 18:50:44'),
	(2048, 'PGA7IEP0', 'bennys', '56312', 'sparkPlugs', 511.91, '2025-09-19 18:50:55'),
	(2049, 'KT7038C4', 'bennys', '132342', 'suspension', 536.455, '2025-09-19 18:50:58'),
	(2050, 'PGA7IEP0', 'bennys', '56312', 'suspension', 511.91, '2025-09-19 18:51:10'),
	(2051, 'PGA7IEP0', 'bennys', '56312', 'clutch', 511.91, '2025-09-19 18:52:56'),
	(2052, 'PGA7IEP0', 'bennys', '56312', 'airFilter', 511.91, '2025-09-19 18:53:08'),
	(2053, 'PGA7IEP0', 'bennys', '56312', 'brakePads', 511.91, '2025-09-19 18:53:52'),
	(2054, 'PGA7IEP0', 'bennys', '56312', 'tyres', 511.91, '2025-09-19 18:54:05'),
	(2055, 'HQR18O66', 'bennys', '3FI677FK', 'engineOil', 185.913, '2025-09-19 19:38:09'),
	(2056, 'HQR18O66', 'bennys', '3FI677FK', 'clutch', 185.913, '2025-09-19 19:38:22'),
	(2057, 'HQR18O66', 'bennys', '3FI677FK', 'airFilter', 185.913, '2025-09-19 19:38:35'),
	(2058, 'HQR18O66', 'bennys', '3FI677FK', 'sparkPlugs', 185.913, '2025-09-19 19:38:48'),
	(2059, 'HQR18O66', 'bennys', '3FI677FK', 'brakePads', 185.913, '2025-09-19 19:39:01'),
	(2060, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 223.695, '2025-09-19 19:39:08'),
	(2061, 'HQR18O66', 'bennys', '3FI677FK', 'suspension', 185.913, '2025-09-19 19:39:13'),
	(2062, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 223.695, '2025-09-19 19:39:21'),
	(2063, 'HQR18O66', 'bennys', '3FI677FK', 'tyres', 185.913, '2025-09-19 19:39:26'),
	(2064, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 223.695, '2025-09-19 19:39:33'),
	(2065, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 223.695, '2025-09-19 19:39:46'),
	(2066, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 223.695, '2025-09-19 19:39:59'),
	(2067, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 223.695, '2025-09-19 19:40:12'),
	(2068, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 223.695, '2025-09-19 19:40:28'),
	(2069, 'PGA7IEP0', 'bennys', '56312', 'engineOil', 569.61, '2025-09-19 20:15:55'),
	(2070, 'PGA7IEP0', 'bennys', '56312', 'airFilter', 569.61, '2025-09-19 20:16:08'),
	(2071, 'PGA7IEP0', 'bennys', '56312', 'sparkPlugs', 569.61, '2025-09-19 20:16:22'),
	(2072, 'HQR18O66', 'bennys', '3FI677FK', 'engineOil', 256.798, '2025-09-19 20:24:16'),
	(2073, 'HQR18O66', 'bennys', '3FI677FK', 'clutch', 256.798, '2025-09-19 20:24:29'),
	(2074, 'HQR18O66', 'bennys', '3FI677FK', 'airFilter', 256.798, '2025-09-19 20:24:41'),
	(2075, 'HQR18O66', 'bennys', '3FI677FK', 'sparkPlugs', 256.798, '2025-09-19 20:24:55'),
	(2076, 'HQR18O66', 'bennys', '3FI677FK', 'brakePads', 256.798, '2025-09-19 20:25:08'),
	(2077, 'HQR18O66', 'bennys', '3FI677FK', 'suspension', 256.798, '2025-09-19 20:25:21'),
	(2078, 'HQR18O66', 'bennys', '3FI677FK', 'tyres', 256.798, '2025-09-19 20:25:33'),
	(2079, 'PGA7IEP0', 'bennys', '56312', 'clutch', 569.732, '2025-09-19 20:27:16'),
	(2080, 'PGA7IEP0', 'bennys', '56312', 'suspension', 569.732, '2025-09-19 20:27:34'),
	(2081, 'PGA7IEP0', 'bennys', '56312', 'brakePads', 569.732, '2025-09-19 20:28:17'),
	(2082, 'PGA7IEP0', 'bennys', '56312', 'tyres', 569.732, '2025-09-19 20:28:31'),
	(2083, 'KT7038C4', 'bennys', '132342', 'engineOil', 604.7, '2025-09-19 20:28:46'),
	(2084, 'KT7038C4', 'bennys', '132342', 'airFilter', 604.7, '2025-09-19 20:29:03'),
	(2085, 'KT7038C4', 'bennys', '132342', 'clutch', 604.7, '2025-09-19 20:29:18'),
	(2086, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 604.7, '2025-09-19 20:29:33'),
	(2087, 'KT7038C4', 'bennys', '132342', 'tyres', 604.7, '2025-09-19 20:29:50'),
	(2088, 'KT7038C4', 'bennys', '132342', 'suspension', 604.7, '2025-09-19 20:30:06'),
	(2089, 'KT7038C4', 'bennys', '132342', 'suspension', 604.7, '2025-09-19 20:30:16'),
	(2090, 'KT7038C4', 'bennys', '132342', 'brakePads', 604.7, '2025-09-19 20:30:26'),
	(2091, 'V0IF05Y7', 'bennys', '7EK907GW', 'engineOil', 149.997, '2025-09-20 03:52:23'),
	(2092, 'V0IF05Y7', 'bennys', '7EK907GW', 'clutch', 149.997, '2025-09-20 03:52:37'),
	(2093, 'V0IF05Y7', 'bennys', '7EK907GW', 'airFilter', 149.997, '2025-09-20 03:52:50'),
	(2094, 'V0IF05Y7', 'bennys', '7EK907GW', 'sparkPlugs', 149.997, '2025-09-20 03:53:03'),
	(2095, 'V0IF05Y7', 'bennys', '7EK907GW', 'brakePads', 149.997, '2025-09-20 03:53:18'),
	(2096, 'V0IF05Y7', 'bennys', '7EK907GW', 'tyres', 149.997, '2025-09-20 03:53:32'),
	(2097, 'V0IF05Y7', 'bennys', '7EK907GW', 'suspension', 149.997, '2025-09-20 03:53:45'),
	(2098, 'V0IF05Y7', 'bennys', '7EK907GW', 'engineOil', 163.207, '2025-09-20 04:11:28'),
	(2099, 'V0IF05Y7', 'bennys', '7EK907GW', 'airFilter', 163.207, '2025-09-20 04:11:41'),
	(2100, 'V0IF05Y7', 'bennys', '7EK907GW', 'clutch', 163.207, '2025-09-20 04:12:00'),
	(2101, 'V0IF05Y7', 'bennys', '7EK907GW', 'engineOil', 194.083, '2025-09-20 06:45:36'),
	(2102, 'V0IF05Y7', 'bennys', '7EK907GW', 'clutch', 194.083, '2025-09-20 06:45:50'),
	(2103, 'V0IF05Y7', 'bennys', '7EK907GW', 'airFilter', 194.083, '2025-09-20 06:46:03'),
	(2104, 'V0IF05Y7', 'bennys', '7EK907GW', 'sparkPlugs', 194.083, '2025-09-20 06:46:17'),
	(2105, 'V0IF05Y7', 'bennys', '7EK907GW', 'brakePads', 194.083, '2025-09-20 06:46:30'),
	(2106, 'V0IF05Y7', 'bennys', '7EK907GW', 'suspension', 194.083, '2025-09-20 06:46:43'),
	(2107, 'V0IF05Y7', 'bennys', '7EK907GW', 'tyres', 194.083, '2025-09-20 06:46:58'),
	(2108, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 257.406, '2025-09-20 06:56:22'),
	(2109, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 257.406, '2025-09-20 06:56:35'),
	(2110, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 257.406, '2025-09-20 06:56:50'),
	(2111, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 257.406, '2025-09-20 06:57:05'),
	(2112, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 257.406, '2025-09-20 06:57:20'),
	(2113, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 257.406, '2025-09-20 06:57:33'),
	(2114, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 257.406, '2025-09-20 06:57:47'),
	(2115, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 282.278, '2025-09-20 07:19:05'),
	(2116, 'A2R80LSL', 'bennys', '7EK907GW', 'engineOil', 220.171, '2025-09-20 07:23:54'),
	(2117, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 323.644, '2025-09-20 08:21:18'),
	(2118, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 323.644, '2025-09-20 08:21:31'),
	(2119, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 323.644, '2025-09-20 08:21:44'),
	(2120, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 323.644, '2025-09-20 08:22:01'),
	(2121, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 323.644, '2025-09-20 08:22:44'),
	(2122, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 323.644, '2025-09-20 08:22:58'),
	(2123, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 323.644, '2025-09-20 08:23:11'),
	(2124, 'V0IF05Y7', 'bennys', '7EK907GW', 'engineOil', 242.805, '2025-09-20 08:25:10'),
	(2125, 'V0IF05Y7', 'bennys', '7EK907GW', 'clutch', 242.805, '2025-09-20 08:25:23'),
	(2126, 'V0IF05Y7', 'bennys', '7EK907GW', 'airFilter', 242.805, '2025-09-20 08:25:36'),
	(2127, 'V0IF05Y7', 'bennys', '7EK907GW', 'sparkPlugs', 242.805, '2025-09-20 08:25:49'),
	(2128, 'V0IF05Y7', 'bennys', '7EK907GW', 'brakePads', 242.805, '2025-09-20 08:26:02'),
	(2129, 'V0IF05Y7', 'bennys', '7EK907GW', 'suspension', 242.805, '2025-09-20 08:26:17'),
	(2130, 'V0IF05Y7', 'bennys', '7EK907GW', 'tyres', 242.805, '2025-09-20 08:26:30'),
	(2131, 'A2R80LSL', 'bennys', '3FI677FK', 'engineOil', 323.705, '2025-09-20 08:42:27'),
	(2132, 'A2R80LSL', 'bennys', '3FI677FK', 'clutch', 323.705, '2025-09-20 08:42:40'),
	(2133, 'A2R80LSL', 'bennys', '3FI677FK', 'airFilter', 323.705, '2025-09-20 08:42:53'),
	(2134, 'A2R80LSL', 'bennys', '3FI677FK', 'sparkPlugs', 323.705, '2025-09-20 08:43:05'),
	(2135, 'A2R80LSL', 'bennys', '3FI677FK', 'brakePads', 323.705, '2025-09-20 08:43:18'),
	(2136, 'A2R80LSL', 'bennys', '3FI677FK', 'tyres', 323.705, '2025-09-20 08:43:32'),
	(2137, 'A2R80LSL', 'bennys', '3FI677FK', 'suspension', 323.705, '2025-09-20 08:43:45'),
	(2138, 'A2R80LSL', 'bennys', 'SGR', 'engineOil', 273.615, '2025-09-20 11:39:12'),
	(2139, 'A2R80LSL', 'bennys', 'SGR', 'clutch', 273.615, '2025-09-20 11:39:24'),
	(2140, 'A2R80LSL', 'bennys', 'SGR', 'airFilter', 273.615, '2025-09-20 11:39:36'),
	(2141, 'A2R80LSL', 'bennys', 'SGR', 'suspension', 273.615, '2025-09-20 11:39:51'),
	(2142, 'A2R80LSL', 'bennys', 'SGR', 'sparkPlugs', 273.615, '2025-09-20 11:40:53'),
	(2143, 'A2R80LSL', 'bennys', 'SGR', 'tyres', 273.615, '2025-09-20 11:41:06'),
	(2144, 'A2R80LSL', 'bennys', 'SGR', 'brakePads', 273.615, '2025-09-20 11:41:18'),
	(2145, 'A2R80LSL', 'bennys', '34212123', 'engineOil', 819.221, '2025-09-20 11:43:41'),
	(2146, 'A2R80LSL', 'bennys', '34212123', 'clutch', 819.221, '2025-09-20 11:44:04'),
	(2147, 'A2R80LSL', 'bennys', '34212123', 'airFilter', 819.221, '2025-09-20 11:44:16'),
	(2148, 'A2R80LSL', 'bennys', '34212123', 'sparkPlugs', 819.221, '2025-09-20 11:44:29'),
	(2149, 'A2R80LSL', 'bennys', '34212123', 'brakePads', 819.221, '2025-09-20 11:44:42'),
	(2150, 'A2R80LSL', 'bennys', '34212123', 'tyres', 819.221, '2025-09-20 11:44:54'),
	(2151, 'A2R80LSL', 'bennys', '34212123', 'suspension', 819.221, '2025-09-20 11:45:07'),
	(2152, 'KT7038C4', 'bennys', '132342', 'engineOil', 615.604, '2025-09-20 12:12:56'),
	(2153, 'KT7038C4', 'bennys', '132342', 'clutch', 615.604, '2025-09-20 12:13:09'),
	(2154, 'KT7038C4', 'bennys', '132342', 'airFilter', 615.604, '2025-09-20 12:13:24'),
	(2155, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 615.604, '2025-09-20 12:13:39'),
	(2156, 'KT7038C4', 'bennys', '132342', 'brakePads', 615.604, '2025-09-20 12:13:57'),
	(2157, 'KT7038C4', 'bennys', '132342', 'tyres', 615.604, '2025-09-20 12:14:19'),
	(2158, 'KT7038C4', 'bennys', '132342', 'suspension', 615.626, '2025-09-20 12:16:45'),
	(2159, 'Y0830IK3', 'bennys', 'JEE', 'engineOil', 45.1, '2025-09-20 13:50:57'),
	(2160, 'Y0830IK3', 'bennys', 'JEE', 'sparkPlugs', 45.1, '2025-09-20 13:51:11'),
	(2161, 'Y0830IK3', 'bennys', 'JEE', 'tyres', 58.2756, '2025-09-20 14:08:59'),
	(2162, 'Y0830IK3', 'bennys', 'JEE', 'airFilter', 71.3789, '2025-09-20 14:14:17'),
	(2163, 'Y0830IK3', 'bennys', 'JEE', 'engineOil', 71.3789, '2025-09-20 14:14:29'),
	(2164, 'Y0830IK3', 'bennys', 'JEE', 'clutch', 71.3789, '2025-09-20 14:14:42'),
	(2165, 'Y0830IK3', 'bennys', 'JEE', 'suspension', 71.3789, '2025-09-20 14:14:55'),
	(2166, 'Y0830IK3', 'bennys', 'JEE', 'brakePads', 71.3789, '2025-09-20 14:15:07'),
	(2167, 'Y0830IK3', 'bennys', 'JEE', 'sparkPlugs', 71.3789, '2025-09-20 14:15:20'),
	(2168, 'Y0830IK3', 'bennys', 'JEE', 'tyres', 71.3789, '2025-09-20 14:15:33'),
	(2169, 'Y0830IK3', 'bennys', '2YB593HK', 'engineOil', 145.417, '2025-09-20 14:31:45'),
	(2170, 'V0IF05Y7', 'bennys', '7EK907GW', 'engineOil', 333.804, '2025-09-20 15:00:47'),
	(2171, 'V0IF05Y7', 'bennys', '7EK907GW', 'clutch', 333.804, '2025-09-20 15:01:00'),
	(2172, 'V0IF05Y7', 'bennys', '7EK907GW', 'airFilter', 333.804, '2025-09-20 15:01:14'),
	(2173, 'V0IF05Y7', 'bennys', '7EK907GW', 'sparkPlugs', 333.804, '2025-09-20 15:01:27'),
	(2174, 'V0IF05Y7', 'bennys', '7EK907GW', 'brakePads', 333.804, '2025-09-20 15:01:41'),
	(2175, 'V0IF05Y7', 'bennys', '7EK907GW', 'tyres', 333.804, '2025-09-20 15:01:55'),
	(2176, 'V0IF05Y7', 'bennys', '7EK907GW', 'suspension', 333.804, '2025-09-20 15:02:08'),
	(2177, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 399.366, '2025-09-20 18:47:33'),
	(2178, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 399.366, '2025-09-20 18:47:48'),
	(2179, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 399.366, '2025-09-20 18:48:01'),
	(2180, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 399.366, '2025-09-20 18:48:15'),
	(2181, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 399.366, '2025-09-20 18:48:29'),
	(2182, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 399.366, '2025-09-20 18:48:42'),
	(2183, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 399.366, '2025-09-20 18:48:55'),
	(2184, 'PGA7IEP0', 'bennys', '8VL901YE', 'engineOil', 162.611, '2025-09-20 19:18:06'),
	(2185, 'PGA7IEP0', 'bennys', '8VL901YE', 'airFilter', 162.611, '2025-09-20 19:18:19'),
	(2186, 'PGA7IEP0', 'bennys', '8VL901YE', 'suspension', 162.611, '2025-09-20 19:18:36'),
	(2187, 'PGA7IEP0', 'bennys', '8VL901YE', 'sparkPlugs', 162.611, '2025-09-20 19:18:54'),
	(2188, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 417.873, '2025-09-20 19:18:55'),
	(2189, 'PGA7IEP0', 'bennys', '8VL901YE', 'tyres', 162.611, '2025-09-20 19:19:35'),
	(2190, 'PGA7IEP0', 'bennys', 'GEC 4606', 'engineOil', 7.59926, '2025-09-20 19:28:46'),
	(2191, 'PGA7IEP0', 'bennys', 'GEC 4606', 'clutch', 7.59926, '2025-09-20 19:29:00'),
	(2192, 'PGA7IEP0', 'bennys', 'GEC 4606', 'airFilter', 7.59926, '2025-09-20 19:29:13'),
	(2193, 'PGA7IEP0', 'bennys', 'GEC 4606', 'sparkPlugs', 7.59926, '2025-09-20 19:30:06'),
	(2194, 'PGA7IEP0', 'bennys', 'GEC 4606', 'suspension', 7.59926, '2025-09-20 19:30:48'),
	(2195, 'PGA7IEP0', 'bennys', 'GEC 4606', 'brakePads', 7.59926, '2025-09-20 19:31:25'),
	(2196, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 436.448, '2025-09-21 04:36:20'),
	(2197, 'V0IF05Y7', 'bennys', '7JO916LS', 'clutch', 448.211, '2025-09-21 04:47:57'),
	(2198, 'V0IF05Y7', 'bennys', '7JO916LS', 'airFilter', 448.211, '2025-09-21 04:48:11'),
	(2199, 'V0IF05Y7', 'bennys', '7JO916LS', 'sparkPlugs', 448.211, '2025-09-21 04:48:26'),
	(2200, 'V0IF05Y7', 'bennys', '7JO916LS', 'tyres', 448.211, '2025-09-21 04:50:09'),
	(2201, 'V0IF05Y7', 'bennys', '7JO916LS', 'suspension', 448.211, '2025-09-21 04:50:23'),
	(2202, 'V0IF05Y7', 'bennys', '7JO916LS', 'engineOil', 448.211, '2025-09-21 04:51:08'),
	(2203, 'V0IF05Y7', 'bennys', '7JO916LS', 'brakePads', 448.211, '2025-09-21 04:51:22'),
	(2204, 'KT7038C4', 'bennys', '132342', 'engineOil', 697.414, '2025-09-21 06:27:20'),
	(2205, 'KT7038C4', 'bennys', '132342', 'clutch', 697.414, '2025-09-21 06:27:39'),
	(2206, 'KT7038C4', 'bennys', '132342', 'airFilter', 697.414, '2025-09-21 06:27:55'),
	(2207, 'KT7038C4', 'bennys', '132342', 'airFilter', 697.414, '2025-09-21 06:28:05'),
	(2208, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 697.414, '2025-09-21 06:28:15'),
	(2209, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 697.414, '2025-09-21 06:28:25'),
	(2210, 'KT7038C4', 'bennys', '132342', 'tyres', 697.414, '2025-09-21 06:28:35'),
	(2211, 'KT7038C4', 'bennys', '132342', 'suspension', 697.414, '2025-09-21 06:28:50'),
	(2212, 'KT7038C4', 'bennys', '132342', 'suspension', 697.414, '2025-09-21 06:29:00'),
	(2213, 'KT7038C4', 'bennys', '132342', 'brakePads', 697.414, '2025-09-21 06:29:10'),
	(2214, 'KT7038C4', 'bennys', '132342', 'brakePads', 697.414, '2025-09-21 06:29:20'),
	(2215, 'V0IF05Y7', 'bennys', '7JO916LS', 'engineOil', 482.897, '2025-09-21 07:18:30'),
	(2216, 'V0IF05Y7', 'bennys', '7JO916LS', 'clutch', 482.897, '2025-09-21 07:18:50'),
	(2217, 'V0IF05Y7', 'bennys', '7JO916LS', 'sparkPlugs', 482.897, '2025-09-21 07:19:07'),
	(2218, 'V0IF05Y7', 'bennys', '7JO916LS', 'brakePads', 482.897, '2025-09-21 07:19:29'),
	(2219, 'V0IF05Y7', 'bennys', '7JO916LS', 'suspension', 482.897, '2025-09-21 07:19:52'),
	(2220, 'V0IF05Y7', 'bennys', '7JO916LS', 'airFilter', 482.897, '2025-09-21 07:20:56'),
	(2221, 'V0IF05Y7', 'bennys', '7JO916LS', 'tyres', 482.897, '2025-09-21 07:21:12'),
	(2222, 'A2R80LSL', 'bennys', '89AWN952', 'engineOil', 327.258, '2025-09-21 07:59:50'),
	(2223, 'A2R80LSL', 'bennys', '89AWN952', 'clutch', 327.258, '2025-09-21 08:00:03'),
	(2224, 'A2R80LSL', 'bennys', '89AWN952', 'airFilter', 327.258, '2025-09-21 08:00:16'),
	(2225, 'A2R80LSL', 'bennys', '89AWN952', 'sparkPlugs', 327.258, '2025-09-21 08:00:29'),
	(2226, 'A2R80LSL', 'bennys', '89AWN952', 'brakePads', 327.258, '2025-09-21 08:00:41'),
	(2227, 'A2R80LSL', 'bennys', '89AWN952', 'tyres', 327.258, '2025-09-21 08:00:54'),
	(2228, 'A2R80LSL', 'bennys', '89AWN952', 'suspension', 327.258, '2025-09-21 08:01:06'),
	(2229, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 498.14, '2025-09-21 08:03:40'),
	(2230, 'KT7038C4', 'bennys', '2YB593HK', 'engineOil', 166.035, '2025-09-21 08:28:46'),
	(2231, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 545.523, '2025-09-21 12:53:13'),
	(2232, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 545.523, '2025-09-21 12:53:42'),
	(2233, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 545.523, '2025-09-21 12:53:55'),
	(2234, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 545.523, '2025-09-21 12:55:00'),
	(2235, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 547.3, '2025-09-21 13:11:12'),
	(2236, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 547.3, '2025-09-21 13:11:26'),
	(2237, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 547.3, '2025-09-21 13:11:39'),
	(2238, 'W22H293Y', 'bennys', '7EK907GW', 'engineOil', 70.2196, '2025-09-21 13:55:19'),
	(2239, 'W22H293Y', 'bennys', '7EK907GW', 'clutch', 70.2196, '2025-09-21 13:55:32'),
	(2240, 'W22H293Y', 'bennys', '7EK907GW', 'airFilter', 70.2196, '2025-09-21 13:55:45'),
	(2241, 'HQR18O66', 'bennys', '3FI677FK', 'engineOil', 309.593, '2025-09-21 13:55:55'),
	(2242, 'W22H293Y', 'bennys', '7EK907GW', 'sparkPlugs', 70.2196, '2025-09-21 13:55:58'),
	(2243, 'HQR18O66', 'bennys', '3FI677FK', 'clutch', 309.593, '2025-09-21 13:56:10'),
	(2244, 'W22H293Y', 'bennys', '7EK907GW', 'tyres', 70.2196, '2025-09-21 13:56:12'),
	(2245, 'HQR18O66', 'bennys', '3FI677FK', 'airFilter', 309.593, '2025-09-21 13:56:26'),
	(2246, 'HQR18O66', 'bennys', '3FI677FK', 'sparkPlugs', 309.593, '2025-09-21 13:56:39'),
	(2247, 'HQR18O66', 'bennys', '3FI677FK', 'brakePads', 309.593, '2025-09-21 13:56:53'),
	(2248, 'HQR18O66', 'bennys', '3FI677FK', 'tyres', 309.593, '2025-09-21 13:57:06'),
	(2249, 'HQR18O66', 'bennys', '3FI677FK', 'suspension', 309.593, '2025-09-21 13:57:23'),
	(2250, 'KT7038C4', 'bennys', '132342', 'engineOil', 67.3258, '2025-09-21 14:19:14'),
	(2251, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 67.3258, '2025-09-21 14:19:30'),
	(2252, 'KT7038C4', 'bennys', '132342', 'sparkPlugs', 67.3258, '2025-09-21 14:19:40'),
	(2253, 'KT7038C4', 'bennys', '132342', 'airFilter', 67.3258, '2025-09-21 14:19:50'),
	(2254, 'KT7038C4', 'bennys', '132342', 'airFilter', 67.3258, '2025-09-21 14:20:00'),
	(2255, 'KT7038C4', 'bennys', '132342', 'clutch', 67.3258, '2025-09-21 14:20:20'),
	(2256, 'KT7038C4', 'bennys', '132342', 'tyres', 67.3258, '2025-09-21 14:20:30'),
	(2257, 'PGA7IEP0', 'bennys', '56312', 'engineOil', 660.319, '2025-09-21 15:24:22'),
	(2258, 'PGA7IEP0', 'bennys', '56312', 'airFilter', 660.319, '2025-09-21 15:24:35'),
	(2259, 'PGA7IEP0', 'bennys', '56312', 'sparkPlugs', 660.319, '2025-09-21 15:24:48'),
	(2260, 'PGA7IEP0', 'bennys', '56312', 'brakePads', 660.319, '2025-09-21 15:25:04'),
	(2261, 'PGA7IEP0', 'bennys', '56312', 'clutch', 660.319, '2025-09-21 15:25:19'),
	(2262, 'PGA7IEP0', 'bennys', '56312', 'tyres', 660.319, '2025-09-21 15:25:52'),
	(2263, 'PGA7IEP0', 'bennys', '56312', 'suspension', 660.319, '2025-09-21 15:26:07'),
	(2264, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 627.583, '2025-09-21 16:08:56'),
	(2265, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 627.583, '2025-09-21 16:09:11'),
	(2266, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 627.583, '2025-09-21 16:09:24'),
	(2267, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 627.583, '2025-09-21 16:09:43'),
	(2268, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 627.583, '2025-09-21 16:10:51'),
	(2269, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 627.583, '2025-09-21 16:11:04'),
	(2270, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 627.583, '2025-09-21 16:11:18'),
	(2271, 'HQR18O66', 'bennys', '564634', 'engineOil', 293.272, '2025-09-21 16:39:31'),
	(2272, 'HQR18O66', 'bennys', '564634', 'clutch', 293.272, '2025-09-21 16:39:44'),
	(2273, 'HQR18O66', 'bennys', '564634', 'sparkPlugs', 293.272, '2025-09-21 16:40:00'),
	(2274, 'HQR18O66', 'bennys', '564634', 'brakePads', 293.272, '2025-09-21 16:40:13'),
	(2275, 'HQR18O66', 'bennys', '564634', 'tyres', 293.272, '2025-09-21 16:40:25'),
	(2276, 'HQR18O66', 'bennys', '564634', 'suspension', 293.272, '2025-09-21 16:40:38'),
	(2277, 'PGA7IEP0', 'bennys', 'AIV 8139', 'engineOil', 90.9112, '2025-09-21 16:48:15'),
	(2278, 'PGA7IEP0', 'bennys', 'AIV 8139', 'sparkPlugs', 90.9112, '2025-09-21 16:48:28'),
	(2279, 'PGA7IEP0', 'bennys', '63RLX435', 'engineOil', 0, '2025-09-21 17:13:04'),
	(2280, 'PGA7IEP0', 'bennys', '63RLX435', 'airFilter', 0, '2025-09-21 17:13:38'),
	(2281, 'PGA7IEP0', 'bennys', '63RLX435', 'sparkPlugs', 0, '2025-09-21 17:14:50'),
	(2282, 'HQR18O66', 'bennys', 'HTS', 'engineOil', 249.9, '2025-09-21 18:34:11'),
	(2283, 'HQR18O66', 'bennys', 'HTS', 'clutch', 249.9, '2025-09-21 18:34:23'),
	(2284, 'HQR18O66', 'bennys', 'HTS', 'airFilter', 249.9, '2025-09-21 18:34:36'),
	(2285, 'HQR18O66', 'bennys', 'HTS', 'sparkPlugs', 249.9, '2025-09-21 18:34:49'),
	(2286, 'HQR18O66', 'bennys', 'HTS', 'brakePads', 249.9, '2025-09-21 18:35:02'),
	(2287, 'HQR18O66', 'bennys', 'HTS', 'tyres', 249.9, '2025-09-21 18:35:16'),
	(2288, 'HQR18O66', 'bennys', 'HTS', 'suspension', 249.9, '2025-09-21 18:35:29'),
	(2289, 'W22H293Y', 'bennys', '7EK907GW', 'engineOil', 142.798, '2025-09-22 03:42:59'),
	(2290, 'W22H293Y', 'bennys', '7EK907GW', 'clutch', 142.798, '2025-09-22 03:43:12'),
	(2291, 'W22H293Y', 'bennys', '7EK907GW', 'airFilter', 142.798, '2025-09-22 03:43:25'),
	(2292, 'W22H293Y', 'bennys', '7EK907GW', 'sparkPlugs', 142.798, '2025-09-22 03:43:38'),
	(2293, 'W22H293Y', 'bennys', '7EK907GW', 'brakePads', 142.798, '2025-09-22 03:43:57'),
	(2294, 'W22H293Y', 'bennys', '7EK907GW', 'suspension', 142.798, '2025-09-22 03:44:10'),
	(2295, 'W22H293Y', 'bennys', '7EK907GW', 'tyres', 142.798, '2025-09-22 03:44:24'),
	(2296, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 690.746, '2025-09-22 12:31:28'),
	(2297, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 690.746, '2025-09-22 12:31:40'),
	(2298, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 690.746, '2025-09-22 12:31:53'),
	(2299, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 690.746, '2025-09-22 12:32:12'),
	(2300, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 690.746, '2025-09-22 12:33:17'),
	(2301, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 690.746, '2025-09-22 12:33:31'),
	(2302, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 690.746, '2025-09-22 12:33:44'),
	(2303, 'W22H293Y', 'bennys', '7EK907GW', 'engineOil', 203.48, '2025-09-22 13:01:58'),
	(2304, 'W22H293Y', 'bennys', '7EK907GW', 'airFilter', 203.48, '2025-09-22 13:02:13'),
	(2305, 'W22H293Y', 'bennys', '7EK907GW', 'sparkPlugs', 203.48, '2025-09-22 13:02:26'),
	(2306, 'W22H293Y', 'bennys', '7EK907GW', 'brakePads', 203.48, '2025-09-22 13:02:40'),
	(2307, 'W22H293Y', 'bennys', '7EK907GW', 'suspension', 203.48, '2025-09-22 13:02:53'),
	(2308, 'W22H293Y', 'bennys', '7EK907GW', 'tyres', 203.48, '2025-09-22 13:03:06'),
	(2309, 'W22H293Y', 'bennys', '7EK907GW', 'clutch', 203.48, '2025-09-22 13:04:16'),
	(2310, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 13.5336, '2025-09-22 13:12:12'),
	(2311, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 58.3253, '2025-09-22 14:15:29'),
	(2312, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 58.3253, '2025-09-22 14:16:10'),
	(2313, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 58.3253, '2025-09-22 14:16:23'),
	(2314, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 58.3253, '2025-09-22 14:16:35'),
	(2315, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 58.3253, '2025-09-22 14:16:48'),
	(2316, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 58.3253, '2025-09-22 14:17:01'),
	(2317, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 58.3253, '2025-09-22 14:17:24'),
	(2318, 'W22H293Y', 'bennys', '2YB593HK', 'engineOil', 214.69, '2025-09-22 14:34:57'),
	(2319, 'W22H293Y', 'bennys', '2YB593HK', 'airFilter', 214.69, '2025-09-22 14:40:40'),
	(2320, 'W22H293Y', 'bennys', '2YB593HK', 'sparkPlugs', 214.69, '2025-09-22 14:42:20'),
	(2321, 'W22H293Y', 'bennys', '2YB593HK', 'tyres', 214.69, '2025-09-22 14:42:36'),
	(2322, 'W22H293Y', 'bennys', '2YB593HK', 'suspension', 214.69, '2025-09-22 14:42:50'),
	(2323, 'XLG10424', 'bennys', 'HTS', 'engineOil', 259.609, '2025-09-22 16:11:12'),
	(2324, 'XLG10424', 'bennys', '43LHP971', 'engineOil', 38.3065, '2025-09-22 16:31:07'),
	(2325, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 90.3935, '2025-09-23 12:49:47'),
	(2326, 'A2R80LSL', 'bennys', '7JO916LS', 'clutch', 90.3935, '2025-09-23 12:50:01'),
	(2327, 'A2R80LSL', 'bennys', '7JO916LS', 'airFilter', 90.3935, '2025-09-23 12:50:14'),
	(2328, 'A2R80LSL', 'bennys', '7JO916LS', 'sparkPlugs', 90.3935, '2025-09-23 12:50:33'),
	(2329, 'A2R80LSL', 'bennys', '7JO916LS', 'brakePads', 90.3935, '2025-09-23 12:50:50'),
	(2330, 'A2R80LSL', 'bennys', '7JO916LS', 'tyres', 90.3935, '2025-09-23 12:51:07'),
	(2331, 'A2R80LSL', 'bennys', '7JO916LS', 'suspension', 90.3935, '2025-09-23 12:51:21'),
	(2332, 'HQR18O66', 'bennys', '3FI677FK', 'engineOil', 339.605, '2025-09-23 16:07:51'),
	(2333, 'HQR18O66', 'bennys', '3FI677FK', 'clutch', 339.605, '2025-09-23 16:08:05'),
	(2334, 'HQR18O66', 'bennys', '3FI677FK', 'airFilter', 339.605, '2025-09-23 16:08:21'),
	(2335, 'HQR18O66', 'bennys', '3FI677FK', 'sparkPlugs', 339.605, '2025-09-23 16:08:34'),
	(2336, 'HQR18O66', 'bennys', '3FI677FK', 'brakePads', 339.605, '2025-09-23 16:08:47'),
	(2337, 'HQR18O66', 'bennys', '3FI677FK', 'suspension', 339.605, '2025-09-23 16:09:00'),
	(2338, 'HQR18O66', 'bennys', '3FI677FK', 'tyres', 339.605, '2025-09-23 16:09:13'),
	(2339, 'A2R80LSL', 'bennys', '34212123', 'engineOil', 908.939, '2025-09-23 16:10:45'),
	(2340, 'A2R80LSL', 'bennys', '34212123', 'clutch', 908.939, '2025-09-23 16:10:58'),
	(2341, 'A2R80LSL', 'bennys', '34212123', 'airFilter', 908.939, '2025-09-23 16:11:11'),
	(2342, 'A2R80LSL', 'bennys', '34212123', 'sparkPlugs', 908.939, '2025-09-23 16:11:23'),
	(2343, 'A2R80LSL', 'bennys', '34212123', 'brakePads', 908.939, '2025-09-23 16:11:36'),
	(2344, 'A2R80LSL', 'bennys', '34212123', 'tyres', 908.939, '2025-09-23 16:11:49'),
	(2345, 'A2R80LSL', 'bennys', '34212123', 'suspension', 908.939, '2025-09-23 16:12:02'),
	(2346, 'HQR18O66', 'bennys', '43LHP971', 'engineOil', 101.831, '2025-09-23 18:03:17'),
	(2347, 'HQR18O66', 'bennys', '43LHP971', 'clutch', 101.831, '2025-09-23 18:03:30'),
	(2348, 'HQR18O66', 'bennys', '43LHP971', 'airFilter', 101.831, '2025-09-23 18:03:44'),
	(2349, 'HQR18O66', 'bennys', '43LHP971', 'sparkPlugs', 101.831, '2025-09-23 18:03:57'),
	(2350, 'HQR18O66', 'bennys', '43LHP971', 'brakePads', 101.831, '2025-09-23 18:04:13'),
	(2351, 'HQR18O66', 'bennys', '43LHP971', 'suspension', 101.831, '2025-09-23 18:04:26'),
	(2352, 'HQR18O66', 'bennys', '43LHP971', 'tyres', 101.831, '2025-09-23 18:05:09'),
	(2353, 'W22H293Y', 'bennys', '7EK907GW', 'engineOil', 303.278, '2025-09-24 12:47:28'),
	(2354, 'W22H293Y', 'bennys', '7EK907GW', 'clutch', 303.278, '2025-09-24 12:47:42'),
	(2355, 'W22H293Y', 'bennys', '7EK907GW', 'airFilter', 303.278, '2025-09-24 12:47:55'),
	(2356, 'W22H293Y', 'bennys', '7EK907GW', 'sparkPlugs', 303.278, '2025-09-24 12:48:09'),
	(2357, 'W22H293Y', 'bennys', '7EK907GW', 'brakePads', 303.278, '2025-09-24 12:48:22'),
	(2358, 'W22H293Y', 'bennys', '7EK907GW', 'suspension', 303.278, '2025-09-24 12:48:36'),
	(2359, 'Y0830IK3', 'bennys', 'QRN 0073', 'engineOil', 91.9615, '2025-09-24 12:48:43'),
	(2360, 'W22H293Y', 'bennys', '7EK907GW', 'tyres', 303.278, '2025-09-24 12:48:49'),
	(2361, 'Y0830IK3', 'bennys', 'QRN 0073', 'tyres', 91.9615, '2025-09-24 12:48:59'),
	(2362, 'W22H293Y', 'bennys', '3OW654CA', 'engineOil', 9.12061, '2025-09-24 13:59:06'),
	(2363, 'W22H293Y', 'bennys', '3OW654CA', 'clutch', 9.12061, '2025-09-24 13:59:20'),
	(2364, 'W22H293Y', 'bennys', '3OW654CA', 'airFilter', 9.12061, '2025-09-24 13:59:33'),
	(2365, 'W22H293Y', 'bennys', '3OW654CA', 'sparkPlugs', 9.12061, '2025-09-24 13:59:48'),
	(2366, 'W22H293Y', 'bennys', '3OW654CA', 'brakePads', 9.12061, '2025-09-24 14:00:02'),
	(2367, 'W22H293Y', 'bennys', '3OW654CA', 'suspension', 9.12061, '2025-09-24 14:00:15'),
	(2368, 'W22H293Y', 'bennys', '3OW654CA', 'tyres', 9.12061, '2025-09-24 14:00:32'),
	(2369, 'A2R80LSL', 'bennys', '7JO916LS', 'engineOil', 137.8, '2025-09-24 14:14:47'),
	(2370, 'W22H293Y', 'bennys', '132342', 'engineOil', 108.61, '2025-09-24 14:36:58'),
	(2371, 'W22H293Y', 'bennys', '132342', 'clutch', 108.61, '2025-09-24 14:37:10'),
	(2372, 'W22H293Y', 'bennys', '132342', 'airFilter', 108.61, '2025-09-24 14:37:24'),
	(2373, 'W22H293Y', 'bennys', '132342', 'sparkPlugs', 108.61, '2025-09-24 14:37:37'),
	(2374, 'W22H293Y', 'bennys', '132342', 'brakePads', 108.61, '2025-09-24 14:37:50'),
	(2375, 'W22H293Y', 'bennys', '132342', 'suspension', 108.61, '2025-09-24 14:38:03'),
	(2376, 'W22H293Y', 'bennys', '132342', 'tyres', 108.61, '2025-09-24 14:38:16'),
	(2377, 'A2R80LSL', 'bennys', '564634', 'engineOil', 358.608, '2025-09-24 14:38:50'),
	(2378, 'A2R80LSL', 'bennys', '564634', 'clutch', 358.608, '2025-09-24 14:39:04'),
	(2379, 'A2R80LSL', 'bennys', '564634', 'airFilter', 358.608, '2025-09-24 14:39:17'),
	(2380, 'A2R80LSL', 'bennys', '564634', 'suspension', 358.608, '2025-09-24 14:39:37'),
	(2381, 'A2R80LSL', 'bennys', '564634', 'sparkPlugs', 358.608, '2025-09-24 14:40:11'),
	(2382, 'A2R80LSL', 'bennys', '564634', 'brakePads', 358.608, '2025-09-24 14:40:24'),
	(2383, 'A2R80LSL', 'bennys', '564634', 'tyres', 358.608, '2025-09-24 14:40:37'),
	(2384, 'HQR18O66', 'bennys', '1CP471CG', 'engineOil', 26.2926, '2025-09-24 15:14:54'),
	(2385, 'HQR18O66', 'bennys', '1CP471CG', 'clutch', 26.2926, '2025-09-24 15:15:07'),
	(2386, 'HQR18O66', 'bennys', '1CP471CG', 'airFilter', 26.2926, '2025-09-24 15:15:20'),
	(2387, 'HQR18O66', 'bennys', '1CP471CG', 'sparkPlugs', 26.2926, '2025-09-24 15:15:32'),
	(2388, 'HQR18O66', 'bennys', '1CP471CG', 'brakePads', 26.2926, '2025-09-24 15:15:45'),
	(2389, 'HQR18O66', 'bennys', '1CP471CG', 'suspension', 26.2926, '2025-09-24 15:15:58'),
	(2390, 'HQR18O66', 'bennys', '1CP471CG', 'tyres', 26.2926, '2025-09-24 15:16:11'),
	(2391, 'HQR18O66', 'bennys', '2YB593HK', 'engineOil', 79.0451, '2025-09-24 15:36:43'),
	(2392, 'HQR18O66', 'bennys', '2YB593HK', 'clutch', 79.0451, '2025-09-24 15:36:56'),
	(2393, 'HQR18O66', 'bennys', '2YB593HK', 'airFilter', 79.0451, '2025-09-24 15:37:09'),
	(2394, 'HQR18O66', 'bennys', '2YB593HK', 'sparkPlugs', 79.0451, '2025-09-24 15:37:21'),
	(2395, 'HQR18O66', 'bennys', '2YB593HK', 'brakePads', 79.0451, '2025-09-24 15:37:34'),
	(2396, 'HQR18O66', 'bennys', '2YB593HK', 'suspension', 79.0451, '2025-09-24 15:37:47'),
	(2397, 'HQR18O66', 'bennys', '2YB593HK', 'tyres', 79.0451, '2025-09-24 15:38:00');

-- Dumping structure for table samudra-roleplay.mechanic_settings
CREATE TABLE IF NOT EXISTS `mechanic_settings` (
  `identifier` varchar(255) NOT NULL,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.mechanic_settings: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.mechanic_vehicledata
CREATE TABLE IF NOT EXISTS `mechanic_vehicledata` (
  `plate` varchar(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.mechanic_vehicledata: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.new_player_data
CREATE TABLE IF NOT EXISTS `new_player_data` (
  `license` varchar(100) NOT NULL,
  `played_seconds` int(11) NOT NULL DEFAULT 0,
  `finished` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.new_player_data: ~0 rows (approximately)
INSERT INTO `new_player_data` (`license`, `played_seconds`, `finished`) VALUES
	('license:be183086dadbb160f816c8b89a918d9add1ab3ae', 7291, 1);

-- Dumping structure for table samudra-roleplay.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.ox_doorlock: ~68 rows (approximately)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(54, 'mechanic 3', '{"doors":[{"coords":{"x":99.69891357421875,"y":6549.0078125,"z":31.91753005981445},"heading":135,"model":634417522},{"coords":{"x":97.87153625488281,"y":6550.8349609375,"z":31.91753005981445},"heading":315,"model":634417522}],"maxDistance":1.5,"doorRate":1.5,"state":1,"autolock":35,"coords":{"x":98.78522491455078,"y":6549.92138671875,"z":31.91753005981445},"groups":{"mechanic":0}}'),
	(72, 'prison', '{"doors":false,"coords":{"x":1786.8316650390626,"y":2560.268798828125,"z":45.69551086425781},"model":2024969025,"autolock":35,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"doorRate":2}'),
	(73, 'prison 2 ', '{"doors":false,"coords":{"x":1845.3358154296876,"y":2585.34765625,"z":46.08550262451172},"model":705715602,"autolock":35,"groups":{"police":0},"heading":90,"maxDistance":2,"state":1,"doorRate":2}'),
	(74, 'prison 3', '{"doors":false,"coords":{"x":1844.998046875,"y":2604.81201171875,"z":44.63977813720703},"model":741314661,"autolock":35,"groups":{"police":0},"heading":90,"maxDistance":7,"state":1,"doorRate":7}'),
	(75, 'prison 4', '{"doors":false,"coords":{"x":1818.54296875,"y":2604.81201171875,"z":44.61100006103515},"model":741314661,"autolock":35,"groups":{"police":0},"heading":90,"maxDistance":8,"state":1,"doorRate":8}'),
	(76, 'bank kecil 1', '{"state":1,"model":-1591004109,"doors":false,"autolock":60,"maxDistance":2,"doorRate":2,"heading":160,"groups":{"police":0},"coords":{"x":313.8657531738281,"y":-285.716552734375,"z":54.46300888061523}}'),
	(80, 'police prison', '{"doors":false,"maxDistance":2,"doorRate":2,"coords":{"x":1837.6337890625,"y":2576.99169921875,"z":46.03859710693359},"state":1,"groups":{"police":0},"heading":0,"autolock":35,"model":2024969025}'),
	(81, 'police prison 2', '{"doors":false,"maxDistance":2,"doorRate":2,"coords":{"x":1844.40380859375,"y":2576.9970703125,"z":46.03560256958008},"state":1,"groups":{"police":0},"heading":0,"autolock":35,"model":2024969025}'),
	(82, 'lscustom', '{"state":1,"doors":[{"coords":{"x":-334.8790283203125,"y":-156.7007598876953,"z":43.59878540039062},"model":1142444161,"heading":83},{"coords":{"x":-334.61260986328127,"y":-154.36585998535157,"z":43.59727096557617},"model":1142444161,"heading":264}],"autolock":35,"groups":{"mechanic":0},"maxDistance":2,"doorRate":2,"coords":{"x":-334.7458190917969,"y":-155.53330993652345,"z":43.59803009033203}}'),
	(83, 'bank kecil 2', '{"coords":{"x":150.29132080078126,"y":-1047.6290283203126,"z":29.66629791259765},"maxDistance":2.5,"model":-1591004109,"autolock":35,"groups":{"police":0},"doors":false,"state":1,"heading":160,"doorRate":2.5}'),
	(84, 'bank kecil 3', '{"coords":{"x":-350.41436767578127,"y":-56.79705047607422,"z":49.33479690551758},"maxDistance":2.5,"model":-1591004109,"autolock":35,"groups":{"police":0},"doors":false,"state":1,"heading":161,"doorRate":2.5}'),
	(85, 'bank kecil 4', '{"coords":{"x":-1208.0487060546876,"y":-335.4938049316406,"z":38.07925415039062},"maxDistance":2.5,"model":-1591004109,"autolock":35,"groups":{"police":0},"doors":false,"state":1,"heading":207,"doorRate":2.5}'),
	(86, 'bank kecil 5', '{"groups":{"police":0},"doors":false,"autolock":35,"doorRate":2,"heading":268,"maxDistance":2,"state":1,"coords":{"x":-2956.115966796875,"y":485.4203796386719,"z":15.99530982971191},"model":-1591004109}'),
	(87, 'bank kecil 6', '{"groups":{"police":0},"doors":false,"autolock":35,"doorRate":2,"heading":0,"maxDistance":2,"state":1,"coords":{"x":1172.2911376953126,"y":2713.146240234375,"z":38.38625335693359},"model":-1591004109}'),
	(92, 'ambulance rof', '{"groups":{"ambulance":0},"state":1,"heading":90,"coords":{"x":-466.1907653808594,"y":-979.3723754882813,"z":39.9494400024414},"maxDistance":2,"doorRate":2,"doors":false,"model":-205019430}'),
	(93, 'ambulance locker', '{"groups":{"ambulance":0},"state":1,"heading":270,"coords":{"x":-463.9435119628906,"y":-1002.9402465820313,"z":23.86883354187011},"maxDistance":2,"doorRate":2,"doors":false,"model":-499842123}'),
	(94, 'ambulance security', '{"groups":{"ambulance":0},"state":1,"heading":90,"coords":{"x":-463.9945373535156,"y":-997.7874755859375,"z":23.86346244812011},"maxDistance":2,"doorRate":2,"doors":false,"model":-205019430}'),
	(95, 'ambulance exam11', '{"groups":{"ambulance":0},"state":1,"heading":180,"coords":{"x":-447.2237243652344,"y":-983.4964599609375,"z":23.94402885437011},"maxDistance":2,"doorRate":2,"doors":false,"model":-205019430}'),
	(96, 'ambulance pharmacy', '{"groups":{"ambulance":0},"state":1,"coords":{"x":-468.396728515625,"y":-1019.487060546875,"z":22.70045471191406},"maxDistance":2,"doorRate":2,"doors":[{"coords":{"x":-468.4028625488281,"y":-1021.0087890625,"z":22.70045471191406},"model":-526567475,"heading":89},{"coords":{"x":-468.39056396484377,"y":-1017.96533203125,"z":22.70045471191406},"model":-526567475,"heading":270}]}'),
	(97, 'ambulance direktur', '{"groups":{"ambulance":0},"heading":90,"coords":{"x":-477.2900390625,"y":-989.6735229492188,"z":34.49362182617187},"maxDistance":2,"model":-499842123,"doors":false,"doorRate":2,"state":1}'),
	(98, 'ambulance staff7', '{"groups":{"ambulance":0},"heading":90,"coords":{"x":-477.2646789550781,"y":-1001.4634399414063,"z":34.49388122558594},"maxDistance":2,"model":-205019430,"doors":false,"doorRate":2,"state":1}'),
	(99, 'ambulance stafff7', '{"groups":{"ambulance":0},"coords":{"x":-475.126220703125,"y":-1008.8970947265625,"z":34.50331878662109},"maxDistance":2,"doors":[{"coords":{"x":-473.82537841796877,"y":-1008.8970947265625,"z":34.50331878662109},"model":-205019430,"heading":180},{"coords":{"x":-476.4270935058594,"y":-1008.8970947265625,"z":34.50331878662109},"model":-205019430,"heading":0}],"doorRate":2,"state":1}'),
	(100, 'ambulance x-ray16', '{"maxDistance":2,"model":-499842123,"coords":{"x":-454.0761413574219,"y":-912.2510375976563,"z":23.91902351379394},"doorRate":2,"heading":90,"doors":false,"groups":{"ambulance":0},"state":1}'),
	(101, 'ambulance mri 15', '{"maxDistance":2,"model":-499842123,"coords":{"x":-454.0584716796875,"y":-921.620361328125,"z":23.91983222961425},"doorRate":2,"heading":90,"doors":false,"groups":{"ambulance":0},"state":1}'),
	(102, 'ambulamce angiography 14', '{"maxDistance":2,"model":-499842123,"coords":{"x":-448.2298278808594,"y":-921.6608276367188,"z":23.9464111328125},"doorRate":2,"heading":90,"doors":false,"groups":{"ambulance":0},"state":1}'),
	(103, 'ambulance exam 12', '{"maxDistance":2,"doors":false,"groups":{"ambulance":0},"coords":{"x":-451.728759765625,"y":-1000.5823974609375,"z":23.92790985107422},"doorRate":2,"state":1,"heading":180,"model":-499842123}'),
	(104, 'ambulance dentist 13', '{"maxDistance":2,"doors":false,"groups":{"ambulance":0},"coords":{"x":-449.74517822265627,"y":-1012.8353271484375,"z":23.9391918182373},"doorRate":2,"state":1,"heading":90,"model":-205019430}'),
	(105, 'ambulance eye 13', '{"maxDistance":2,"doors":false,"groups":{"ambulance":0},"coords":{"x":-449.7501525878906,"y":-1022.0120849609375,"z":23.94230651855468},"doorRate":2,"state":1,"heading":90,"model":-499842123}'),
	(106, 'ambulance kantin 1', '{"maxDistance":2,"doors":false,"groups":{"ambulance":0},"coords":{"x":-477.5299987792969,"y":-1039.36083984375,"z":22.65591239929199},"doorRate":2,"state":1,"heading":90,"model":-526567475}'),
	(107, 'ambulance kantin 2', '{"maxDistance":2,"doors":[{"coords":{"x":-482.57452392578127,"y":-1025.49169921875,"z":22.6182861328125},"heading":179,"model":-526567475},{"coords":{"x":-485.6171569824219,"y":-1025.4261474609376,"z":22.6182861328125},"heading":358,"model":-526567475}],"groups":{"ambulance":0},"coords":{"x":-484.0958251953125,"y":-1025.458984375,"z":22.6182861328125},"doorRate":2,"state":1}'),
	(108, 'ambulance loby 1', '{"maxDistance":2,"doors":[{"coords":{"x":-463.13995361328127,"y":-977.55029296875,"z":22.71764373779297},"heading":180,"model":-526567475},{"coords":{"x":-466.14208984375,"y":-977.55029296875,"z":22.71764373779297},"heading":0,"model":-526567475}],"groups":{"ambulance":0},"coords":{"x":-464.6410217285156,"y":-977.55029296875,"z":22.71764373779297},"doorRate":2,"state":1}'),
	(109, 'ambulance loby 2', '{"maxDistance":2,"doors":[{"coords":{"x":-463.1284484863281,"y":-957.661376953125,"z":22.72096633911132},"heading":180,"model":-526567475},{"coords":{"x":-466.12872314453127,"y":-957.661376953125,"z":22.72096633911132},"heading":0,"model":-526567475}],"groups":{"ambulance":0},"coords":{"x":-464.62860107421877,"y":-957.661376953125,"z":22.72096633911132},"doorRate":2,"state":1}'),
	(110, 'ambulance emergency 1', '{"maxDistance":2,"doors":false,"groups":{"ambulance":0},"coords":{"x":-475.65997314453127,"y":-952.6996459960938,"z":23.81242752075195},"doorRate":2,"state":1,"heading":0,"model":-205019430}'),
	(111, 'ambulance emergency 2', '{"maxDistance":2,"doors":[{"coords":{"x":-484.49853515625,"y":-953.072509765625,"z":23.76695251464843},"heading":270,"model":-499842123},{"coords":{"x":-484.49853515625,"y":-955.6715087890625,"z":23.76695251464843},"heading":90,"model":-499842123}],"groups":{"ambulance":0},"coords":{"x":-484.49853515625,"y":-954.3720092773438,"z":23.76695251464843},"doorRate":2,"state":1}'),
	(112, 'ambulance emergency 3', '{"maxDistance":2,"doors":[{"coords":{"x":-478.9884033203125,"y":-952.6082763671875,"z":23.78471183776855},"heading":180,"model":-499842123},{"coords":{"x":-481.5932312011719,"y":-952.6082763671875,"z":23.78471183776855},"heading":0,"model":-499842123}],"groups":{"ambulance":0},"coords":{"x":-480.29083251953127,"y":-952.6082763671875,"z":23.78471183776855},"doorRate":2,"state":1}'),
	(123, 'burgershot ', '{"maxDistance":2,"groups":{"burgershot":0},"coords":{"x":-1203.337646484375,"y":-897.226806640625,"z":14.12363243103027},"state":1,"doors":[{"coords":{"x":-1202.4874267578126,"y":-896.64892578125,"z":14.12363243103027},"model":1980817304,"heading":34},{"coords":{"x":-1204.18798828125,"y":-897.8046264648438,"z":14.12363243103027},"model":1980817304,"heading":214}],"doorRate":2}'),
	(124, 'burgershot 1', '{"maxDistance":2,"groups":{"burgershot":0},"coords":{"x":-1194.79052734375,"y":-902.0584716796875,"z":14.1236343383789},"heading":214,"model":1462909834,"state":1,"doors":false,"doorRate":2}'),
	(125, 'burgershot 2', '{"maxDistance":2,"groups":{"burgershot":0},"coords":{"x":-1185.3323974609376,"y":-897.8140869140625,"z":14.1236343383789},"heading":34,"model":1289778077,"state":1,"doors":false,"doorRate":2}'),
	(126, 'burgershot 3', '{"maxDistance":2,"groups":{"burgershot":0},"coords":{"x":-1179.3148193359376,"y":-891.4776611328125,"z":13.86515808105468},"heading":124,"model":-1635579193,"state":1,"doors":false,"doorRate":2}'),
	(127, 'burgershot boss', '{"maxDistance":1.5,"groups":{"burgershot":0},"doors":false,"coords":{"x":-1182.5263671875,"y":-895.906982421875,"z":14.1236343383789},"model":-626684119,"heading":34,"doorRate":1.5,"state":1}'),
	(152, 'mekanik paleto1', '{"groups":{"mechanic":0},"heading":315,"state":1,"coords":{"x":32.54734420776367,"y":6529.14794921875,"z":31.88228416442871},"doors":false,"model":964838196,"maxDistance":1.5,"autolock":1.5}'),
	(153, 'mekanik paleto2', '{"maxDistance":1.5,"groups":{"mechanic":0},"doors":false,"autolock":1.5,"model":964838196,"coords":{"x":30.41746139526367,"y":6531.26123046875,"z":31.88228416442871},"state":1,"heading":315}'),
	(154, 'mekanik gerbang', '{"groups":{"mechanic":0},"heading":45,"state":0,"coords":{"x":112.1166000366211,"y":6509.39013671875,"z":30.57164001464843},"doors":false,"model":-648633308,"maxDistance":10}'),
	(156, 'mekanik gerbang2', '{"groups":{"mechanic":0},"heading":45,"state":0,"coords":{"x":49.14952850341797,"y":6572.39990234375,"z":30.50366973876953},"doors":false,"model":-648633308,"maxDistance":10}'),
	(157, 'polisi heli', '{"heading":270,"coords":{"x":440.24273681640627,"y":-976.4896850585938,"z":43.82694244384765},"model":456034598,"groups":{"police":0},"maxDistance":1.5,"state":0,"doors":false}'),
	(158, 'mekanik atas', '{"coords":{"x":36.8642349243164,"y":6552.990234375,"z":37.847900390625},"state":0,"doors":false,"heading":135,"model":964838196,"maxDistance":1.5,"groups":{"mechanic":0}}'),
	(159, 'penjaraa 1', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":0,"coords":{"x":477.91259765625,"y":-1012.1886596679688,"z":26.48005485534668},"model":-53345114}'),
	(160, 'penjaraa 2', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":0,"coords":{"x":480.9128112792969,"y":-1012.1886596679688,"z":26.48005485534668},"model":-53345114}'),
	(161, 'penjaraa 3', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":0,"coords":{"x":483.9127197265625,"y":-1012.1886596679688,"z":26.48005485534668},"model":-53345114}'),
	(162, 'penjaraa 4', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":0,"coords":{"x":486.9131164550781,"y":-1012.1886596679688,"z":26.48005485534668},"model":-53345114}'),
	(163, 'penjaraa 5', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":180,"coords":{"x":484.1764221191406,"y":-1007.734375,"z":26.48005485534668},"model":-53345114}'),
	(164, 'penjaraa 6', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":180,"coords":{"x":481.00836181640627,"y":-1004.1179809570313,"z":26.48005485534668},"model":-53345114}'),
	(165, 'penjaraa 7', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":270,"coords":{"x":476.6156921386719,"y":-1008.8754272460938,"z":26.48005485534668},"model":-53345114}'),
	(166, 'kantor polisi 1', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":[{"model":149284793,"heading":270,"coords":{"x":471.36785888671877,"y":-1007.7933959960938,"z":26.40548324584961}},{"model":149284793,"heading":90,"coords":{"x":471.3758239746094,"y":-1010.1978759765625,"z":26.40548324584961}}],"coords":{"x":471.371826171875,"y":-1008.99560546875,"z":26.40548324584961}}'),
	(167, 'kantor polisi 2', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":[{"model":-288803980,"heading":0,"coords":{"x":467.522216796875,"y":-1000.543701171875,"z":26.40548324584961}},{"model":-288803980,"heading":180,"coords":{"x":469.9273681640625,"y":-1000.543701171875,"z":26.40548324584961}}],"coords":{"x":468.72479248046877,"y":-1000.543701171875,"z":26.40548324584961}}'),
	(168, 'kantor polisi 3', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":[{"model":-692649124,"heading":0,"coords":{"x":467.3686218261719,"y":-1014.406005859375,"z":26.48381614685058}},{"model":-692649124,"heading":180,"coords":{"x":469.7742614746094,"y":-1014.406005859375,"z":26.48381614685058}}],"coords":{"x":468.5714416503906,"y":-1014.406005859375,"z":26.48381614685058}}'),
	(169, 'kantor polisi 4', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":[{"model":-1547307588,"heading":180,"coords":{"x":443.061767578125,"y":-998.7462158203125,"z":30.81530380249023}},{"model":-1547307588,"heading":0,"coords":{"x":440.73919677734377,"y":-998.7462158203125,"z":30.81530380249023}}],"coords":{"x":441.9004821777344,"y":-998.7462158203125,"z":30.81530380249023}}'),
	(170, 'kantor polisi 5', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":180,"coords":{"x":440.52008056640627,"y":-986.2334594726563,"z":30.82319259643554},"model":-96679321}'),
	(171, 'kantor polisi 6', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":0,"coords":{"x":440.52008056640627,"y":-977.60107421875,"z":30.82319259643554},"model":-1406685646}'),
	(172, 'kantor polisi 7', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":[{"model":-1547307588,"heading":180,"coords":{"x":458.208740234375,"y":-972.2542724609375,"z":30.8153076171875}},{"model":-1547307588,"heading":0,"coords":{"x":455.88616943359377,"y":-972.2542724609375,"z":30.8153076171875}}],"coords":{"x":457.0474548339844,"y":-972.2542724609375,"z":30.8153076171875}}'),
	(173, 'polisi boss', '{"state":1,"maxDistance":1.5,"groups":{"police":0},"doors":false,"heading":270,"coords":{"x":458.6543273925781,"y":-990.6497802734375,"z":30.82319259643554},"model":-96679321}'),
	(174, 'kantor polisi 8', '{"doors":[{"heading":270,"model":-288803980,"coords":{"x":438.19708251953127,"y":-993.9112548828125,"z":30.82319259643554}},{"heading":90,"model":-288803980,"coords":{"x":438.19708251953127,"y":-996.316650390625,"z":30.82319259643554}}],"coords":{"x":438.19708251953127,"y":-995.1139526367188,"z":30.82319259643554},"maxDistance":1.5,"state":1,"groups":{"police":0}}'),
	(175, 'kantor polisi 9', '{"doors":false,"coords":{"x":445.4067077636719,"y":-984.201416015625,"z":30.82319259643554},"heading":90,"maxDistance":1.5,"state":1,"groups":{"police":0},"model":-1406685646}'),
	(176, 'polisi armory', '{"doors":false,"coords":{"x":479.750732421875,"y":-999.6290283203125,"z":30.7891674041748},"heading":90,"maxDistance":1.5,"state":1,"groups":{"police":0},"model":-692649124}'),
	(177, 'polisi armory 2', '{"doors":false,"coords":{"x":487.4378356933594,"y":-1000.1892700195313,"z":30.78697204589843},"heading":181,"maxDistance":1,"state":1,"groups":{"police":0},"model":-692649124}'),
	(178, 'kantor polisi 10', '{"doors":[{"heading":90,"model":-288803980,"coords":{"x":469.44061279296877,"y":-987.4376831054688,"z":30.82319259643554}},{"heading":270,"model":-288803980,"coords":{"x":469.44061279296877,"y":-985.0313110351563,"z":30.82319259643554}}],"coords":{"x":469.44061279296877,"y":-986.2344970703125,"z":30.82319259643554},"maxDistance":1.5,"state":1,"groups":{"police":0}}'),
	(179, 'polisi bodycam', '{"doors":false,"coords":{"x":448.98455810546877,"y":-995.5263671875,"z":35.10376358032226},"heading":135,"maxDistance":1.5,"state":1,"groups":{"police":0},"model":-96679321}'),
	(180, 'polisi heli', '{"heading":90,"model":-692649124,"coords":{"x":464.3085632324219,"y":-984.5284423828125,"z":43.771240234375},"groups":{"police":0},"maxDistance":1.5,"doors":false,"state":1}');

-- Dumping structure for table samudra-roleplay.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.ox_inventory: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned DEFAULT NULL,
  `citizenid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `steam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `money` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paycheck` int(11) NOT NULL DEFAULT 0,
  `charinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gang` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_logged_out` timestamp NULL DEFAULT NULL,
  `skin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `luckywheel_spins` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `credits` int(11) NOT NULL DEFAULT 0,
  `tasks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tasks_completed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `winnings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` int(11) DEFAULT 0,
  `pp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `policemdtinfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `gallery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `crafting_level` int(11) NOT NULL,
  `phonePos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spotify` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ringtone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `electrocourses` int(11) DEFAULT 0,
  `inside` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasvoted` tinyint(4) DEFAULT 0,
  `disabled` tinyint(1) DEFAULT 0,
  `tattoos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loadout` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pedmodel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `playtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=137776 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.players: ~1 rows (approximately)
INSERT INTO `players` (`id`, `userId`, `citizenid`, `cid`, `active`, `steam`, `license`, `name`, `money`, `paycheck`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `last_logged_out`, `skin`, `luckywheel_spins`, `credits`, `tasks`, `tasks_completed`, `winnings`, `deleted`, `pp`, `policemdtinfo`, `tags`, `gallery`, `crafting_level`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `electrocourses`, `inside`, `hasvoted`, `disabled`, `tattoos`, `loadout`, `pedmodel`, `playtime`) VALUES
	(137725, 226, 'S27P7Z53', 1, NULL, '', 'license2:be183086dadbb160f816c8b89a918d9add1ab3ae', 'i han96', '{"crypto":0,"cash":200000,"bank":298850}', 0, '{"lastname":"Han","birthdate":"1996-07-27","nationality":"Indonesia","account":"US05QBX4788537853","firstname":"I","phone":"2337720145","cid":"1","backstory":"placeholder backstory","gender":0}', '{"onduty":true,"grade":{"name":"Boss","level":5},"label":"Bahamas","payment":10000,"bankAuth":true,"name":"bahamas","isboss":true}', '{"grade":{"name":"Unaffiliated","level":0},"label":"No Gang","bankAuth":false,"name":"none","isboss":false}', '{"x":1752.11865234375,"y":3621.60009765625,"z":34.924560546875,"w":289.13385009765627}', '{"craftingrep":0,"licences":{"driver":true,"id":true,"weapon":false},"criminalrecord":{"hasRecord":false},"thirst":47.00000000000006,"fingerprint":"34P3421VYL9G0K9","inside":{"apartment":[]},"walletid":"QB-96166552","starterpack":true,"jailitems":[],"callsign":"NO CALLSIGN","hunger":15.9999999999999,"starterpack2":true,"injail":0,"status":[],"tracker":false,"phonedata":{"SerialNumber":83308984,"InstalledApps":[]},"stress":0,"ishandcuffed":false,"dealerrep":0,"isdead":false,"armor":0,"attachmentcraftingrep":0,"jobrep":{"tow":0,"trucker":0,"taxi":0,"hotdog":0},"phone":[],"bloodtype":"A-","health":197,"inlaststand":false}', '[{"count":1,"name":"guidebook","slot":14},{"count":1,"name":"tiket_oplas","slot":15},{"count":1,"name":"rental_papers","metadata":{"owner":"I Han","expires":"2025-09-29 03:03:23","name":"Faggio","plate":"89ISM647"},"slot":16},{"count":200000,"name":"money","slot":17},{"count":5,"name":"water_bottle","slot":11},{"count":5,"name":"sandwich","slot":12},{"count":1,"name":"yflip_lavender","metadata":{"imei":"SNLoVp5H6EwHOn2"},"slot":13}]', '2025-09-29 14:15:13', '2025-09-29 14:15:13', NULL, '1', 0, '', '', '', 0, '', '', '', '', 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 89);

-- Dumping structure for table samudra-roleplay.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=8422 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table samudra-roleplay.playerskins: ~1 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(8421, 'S27P7Z53', 'mp_m_freemode_01', '{"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"faceFeatures":{"jawBoneWidth":0,"neckThickness":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"lipsThickness":0,"eyeBrownHigh":0,"jawBoneBackSize":0,"chinHole":0,"cheeksWidth":0,"eyeBrownForward":0,"noseWidth":0,"nosePeakHigh":0,"noseBoneTwist":0,"nosePeakSize":0,"nosePeakLowering":0,"chinBoneSize":0,"chinBoneLenght":0,"eyesOpening":0},"tattoos":[],"headOverlays":{"ageing":{"color":0,"style":0,"opacity":0,"secondColor":0},"sunDamage":{"color":0,"style":0,"opacity":0,"secondColor":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0,"secondColor":0},"beard":{"color":0,"style":0,"opacity":0,"secondColor":0},"complexion":{"color":0,"style":0,"opacity":0,"secondColor":0},"blemishes":{"color":0,"style":0,"opacity":0,"secondColor":0},"eyebrows":{"color":0,"style":0,"opacity":0,"secondColor":0},"chestHair":{"color":0,"style":0,"opacity":0,"secondColor":0},"makeUp":{"color":0,"style":0,"opacity":0,"secondColor":0},"blush":{"color":0,"style":0,"opacity":0,"secondColor":0},"lipstick":{"color":0,"style":0,"opacity":0,"secondColor":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0,"secondColor":0}},"model":"mp_m_freemode_01","hair":{"highlight":0,"style":0,"texture":0,"color":0},"headBlend":{"shapeSecond":0,"skinSecond":0,"shapeFirst":0,"skinThird":0,"skinFirst":0,"shapeMix":0,"thirdMix":0,"skinMix":0,"shapeThird":0},"eyeColor":-1}', 1);

-- Dumping structure for table samudra-roleplay.player_emotes
CREATE TABLE IF NOT EXISTS `player_emotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(50) DEFAULT NULL,
  `emote_category` varchar(255) NOT NULL,
  `emote_index` int(11) NOT NULL,
  `emote_type` varchar(255) NOT NULL,
  `emote_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.player_emotes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_groups
CREATE TABLE IF NOT EXISTS `player_groups` (
  `citizenid` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`citizenid`,`type`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.player_groups: ~1 rows (approximately)
INSERT INTO `player_groups` (`citizenid`, `group`, `type`, `grade`) VALUES
	('S27P7Z53', 'bahamas', 'job', 5);

-- Dumping structure for table samudra-roleplay.player_jobs_activity
CREATE TABLE IF NOT EXISTS `player_jobs_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) NOT NULL,
  `last_checkin` int(11) NOT NULL,
  `last_checkout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `last_checkout` (`last_checkout`) USING BTREE,
  KEY `citizenid_job` (`citizenid`,`job`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.player_jobs_activity: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=734 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.player_outfits: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_priv_garages
CREATE TABLE IF NOT EXISTS `player_priv_garages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owners` longtext DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `distance` int(11) DEFAULT 10,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.player_priv_garages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_quick_emotes
CREATE TABLE IF NOT EXISTS `player_quick_emotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(255) NOT NULL,
  `keybinds` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `emote_index` int(11) NOT NULL,
  `pQuickEmote` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.player_quick_emotes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.player_transactions: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `vinnumber` varchar(50) DEFAULT NULL,
  `vinscratch` int(2) DEFAULT 0,
  `datefinish` date NOT NULL DEFAULT '2999-06-01',
  `logs` longtext DEFAULT '[]',
  `isFavorite` tinyint(1) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `deformation` longtext DEFAULT NULL,
  `tuning` longtext DEFAULT NULL,
  `fitment` varchar(500) DEFAULT NULL,
  `damage` longtext DEFAULT '',
  `in_garage` tinyint(1) DEFAULT 1,
  `garage_id` varchar(255) DEFAULT 'Legion Square',
  `job_vehicle` tinyint(1) DEFAULT 0,
  `job_vehicle_rank` int(10) DEFAULT 0,
  `gang_vehicle` tinyint(1) DEFAULT 0,
  `gang_vehicle_rank` int(10) DEFAULT 0,
  `impound` int(10) DEFAULT 0,
  `impound_retrievable` int(10) DEFAULT 0,
  `impound_data` longtext DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `mileage` float NOT NULL DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.player_vehicles: ~3 rows (approximately)
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `nosColour`, `traveldistance`, `noslevel`, `hasnitro`, `vinnumber`, `vinscratch`, `datefinish`, `logs`, `isFavorite`, `parking`, `deformation`, `tuning`, `fitment`, `damage`, `in_garage`, `garage_id`, `job_vehicle`, `job_vehicle_rank`, `gang_vehicle`, `gang_vehicle_rank`, `impound`, `impound_retrievable`, `impound_data`, `nickname`, `mileage`, `glovebox`, `trunk`) VALUES
	(1607, 'license2:be183086dadbb160f816c8b89a918d9add1ab3ae', 'S27P7Z53', 'tundra2020sfh', '-1438325757', '{}', '5DY405UD', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, '2999-06-01', '[]', 0, NULL, NULL, NULL, NULL, '', 1, 'international airport', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, NULL),
	(1608, 'license2:be183086dadbb160f816c8b89a918d9add1ab3ae', 'S27P7Z53', 'dc_jokernsx', '-495033476', '{}', '9EW584CM', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, '2999-06-01', '[]', 0, NULL, NULL, NULL, NULL, '', 1, 'international airport', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, NULL),
	(1609, 'license2:be183086dadbb160f816c8b89a918d9add1ab3ae', 'S27P7Z53', 'sultanrs', '-295689028', '{"modShifterLeavers":-1,"modGrille":-1,"modKit47":-1,"modLivery":-1,"xenonCustomColorEnabled":false,"modAPlate":-1,"modArchCover":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTank":-1,"modRightFender":-1,"modSpoilers":-1,"modEngine":-1,"modCustomBackWheels":false,"modSteeringWheel":-1,"modSpeakers":-1,"color1":64,"modAirFilter":-1,"wheelColor":158,"modOrnaments":-1,"modPlateHolder":-1,"paintType2":7,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"fuelLevel":44.0,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modHood":-1,"modCustomFrontWheels":false,"modCustomTiresR":false,"modSideSkirt":-1,"modLightbar":-1,"bulletProofTyres":false,"modDashboard":-1,"modRearBumper":-1,"modFrame":-1,"wheels":0,"bodyHealth":1000.0,"wheelWidth":1.0,"modAerials":-1,"model":-295689028,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"dirtLevel":7.0,"modTransmission":-1,"tyreSmokeColor":[255,255,255],"windowsBroken":{"5":true,"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true},"modHydraulics":false,"modSeats":-1,"modExhaust":-1,"modVanityPlate":-1,"extras":[],"modBackWheels":-1,"interiorColor":31,"tyreBurst":{"5":false,"1":false,"0":false,"4":false},"modEngineBlock":-1,"plate":"40GBZ206","modFrontWheels":-1,"wheelSize":1.0,"modDoorSpeaker":-1,"modKit21":-1,"driftTyres":false,"modSubwoofer":-1,"tyresCanBurst":1,"engineHealth":1000.0,"liveryRoof":-1,"modTrunk":-1,"modWindows":-1,"paintType1":7,"modArmor":-1,"modSuspension":-1,"pearlescentColor":70,"modDoorR":-1,"tankHealth":1000.0,"modStruts":-1,"modTurbo":false,"modRoofLivery":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"modNitrous":-1,"modRoof":-1,"modTrimB":-1,"modHorns":-1,"modKit17":-1,"plateIndex":0,"modXenon":false,"modTrimA":-1,"dashboardColor":134,"modKit49":-1,"modHydrolic":-1,"xenonCustomColor":[],"modCustomTiresF":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"color2":64,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontBumper":-1,"modBrakes":-1,"modDial":-1,"xenonColor":255,"windowTint":-1,"modFender":-1,"modKit19":-1,"oilLevel":5.0,"neonColor":[255,0,255]}', '40GBZ206', NULL, NULL, 44, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, '2999-06-01', '[]', 0, NULL, NULL, NULL, NULL, '{"dirt":7.0126953125,"deformation":[]}', 1, 'Kantor Pemerintah', 0, 0, 0, 0, 0, 0, '', '', 0.0497328, NULL, NULL);

-- Dumping structure for table samudra-roleplay.player_vehicles_fuel_type
CREATE TABLE IF NOT EXISTS `player_vehicles_fuel_type` (
  `plate` varchar(20) NOT NULL,
  `fuelType` varchar(20) NOT NULL,
  PRIMARY KEY (`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.player_vehicles_fuel_type: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.player_warns: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  `zone_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`zone_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.properties: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.punchmachine
CREATE TABLE IF NOT EXISTS `punchmachine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `score` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.punchmachine: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(50) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `reported_id` varchar(50) DEFAULT NULL,
  `reported_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('open','in_progress','closed') DEFAULT 'open',
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.reports: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.report_messages
CREATE TABLE IF NOT EXISTS `report_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `messages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`messages`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `report_messages_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.report_messages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.report_user_preferences
CREATE TABLE IF NOT EXISTS `report_user_preferences` (
  `player_id` varchar(255) NOT NULL,
  `theme` enum('light','dark') DEFAULT 'light',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.report_user_preferences: ~0 rows (approximately)
INSERT INTO `report_user_preferences` (`player_id`, `theme`, `created_at`, `updated_at`) VALUES
	('license:be183086dadbb160f816c8b89a918d9add1ab3ae', 'light', '2025-09-24 22:14:54', '2025-09-24 22:14:54');

-- Dumping structure for table samudra-roleplay.savana_busjob
CREATE TABLE IF NOT EXISTS `savana_busjob` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.savana_busjob: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.savana_truckerjob
CREATE TABLE IF NOT EXISTS `savana_truckerjob` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.savana_truckerjob: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.shared_vehicles
CREATE TABLE IF NOT EXISTS `shared_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) NOT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT 'None',
  `hash` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` varchar(50) DEFAULT 'Stored',
  `faction` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `category` (`category`),
  KEY `garage` (`garage`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.shared_vehicles: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.society
CREATE TABLE IF NOT EXISTS `society` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.society: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.society_transactions
CREATE TABLE IF NOT EXISTS `society_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `employee` varchar(255) DEFAULT NULL,
  `executor` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `society_index` (`society`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.society_transactions: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.spy_bodycam
CREATE TABLE IF NOT EXISTS `spy_bodycam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `videolink` longtext NOT NULL,
  `street` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `playername` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table samudra-roleplay.spy_bodycam: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.users
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `license2` varchar(50) DEFAULT NULL,
  `fivem` varchar(20) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.users: ~1 rows (approximately)
INSERT INTO `users` (`userId`, `username`, `license`, `license2`, `fivem`, `discord`) VALUES
	(226, 'i han96', 'license:be183086dadbb160f816c8b89a918d9add1ab3ae', 'license2:be183086dadbb160f816c8b89a918d9add1ab3ae', 'fivem:1376490', 'discord:1369745206362112093');

-- Dumping structure for table samudra-roleplay.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `bail` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.user_mdt: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.vehicle_mdt
CREATE TABLE IF NOT EXISTS `vehicle_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.vehicle_mdt: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.xt_prison
CREATE TABLE IF NOT EXISTS `xt_prison` (
  `identifier` varchar(100) NOT NULL,
  `jailtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.xt_prison: ~1 rows (approximately)
INSERT INTO `xt_prison` (`identifier`, `jailtime`) VALUES
	('S27P7Z53', 0);

-- Dumping structure for table samudra-roleplay.xt_prison_items
CREATE TABLE IF NOT EXISTS `xt_prison_items` (
  `owner` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  UNIQUE KEY `owner` (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table samudra-roleplay.xt_prison_items: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_audix_ringtones
CREATE TABLE IF NOT EXISTS `yphone_audix_ringtones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `phone_imei` varchar(255) NOT NULL,
  `category` enum('ringtone','notification') NOT NULL DEFAULT 'ringtone',
  `upvote` int(11) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  KEY `idx_category` (`category`),
  KEY `idx_author` (`author`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_private` (`is_private`),
  CONSTRAINT `yphone_audix_ringtones_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_audix_ringtones: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_audix_votes
CREATE TABLE IF NOT EXISTS `yphone_audix_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ringtone_id` int(11) NOT NULL,
  `phone_imei` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_vote` (`ringtone_id`,`phone_imei`),
  KEY `idx_ringtone_id` (`ringtone_id`),
  KEY `idx_phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_audix_votes_ibfk_1` FOREIGN KEY (`ringtone_id`) REFERENCES `yphone_audix_ringtones` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yphone_audix_votes_ibfk_2` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_audix_votes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_banking_transactions
CREATE TABLE IF NOT EXISTS `yphone_banking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_number` varchar(15) NOT NULL,
  `recipient_number` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_banking_transactions: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_blocked_numbers
CREATE TABLE IF NOT EXISTS `yphone_blocked_numbers` (
  `phone_imei` varchar(255) NOT NULL,
  `blocked_number` varchar(15) NOT NULL,
  PRIMARY KEY (`phone_imei`,`blocked_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_blocked_numbers: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_clock_alarms
CREATE TABLE IF NOT EXISTS `yphone_clock_alarms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `hours` int(2) NOT NULL DEFAULT 0,
  `minutes` int(2) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `repeat` text DEFAULT NULL,
  `local` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) DEFAULT 1,
  `created_on` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`,`phone_imei`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_clock_alarms_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_clock_alarms: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_companies_channels
CREATE TABLE IF NOT EXISTS `yphone_companies_channels` (
  `id` varchar(50) NOT NULL,
  `phone_imei` varchar(255) NOT NULL,
  `company` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_companies_channels: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_companies_messages
CREATE TABLE IF NOT EXISTS `yphone_companies_messages` (
  `id` varchar(50) NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `x_pos` int(11) DEFAULT NULL,
  `y_pos` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `yphone_companies_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `yphone_companies_channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_companies_messages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_contacts
CREATE TABLE IF NOT EXISTS `yphone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(20) NOT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_contacts_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=822 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_contacts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_darkchat_accounts
CREATE TABLE IF NOT EXISTS `yphone_darkchat_accounts` (
  `username` varchar(20) NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile_image` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_darkchat_accounts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_darkchat_channels
CREATE TABLE IF NOT EXISTS `yphone_darkchat_channels` (
  `name` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `profile_picture` varchar(4096) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT 0,
  `ch_owner` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`name`),
  KEY `ch_owner` (`ch_owner`),
  CONSTRAINT `yphone_darkchat_channels_ibfk_1` FOREIGN KEY (`ch_owner`) REFERENCES `yphone_darkchat_accounts` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_darkchat_channels: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_darkchat_loggedin
CREATE TABLE IF NOT EXISTS `yphone_darkchat_loggedin` (
  `phone_imei` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_imei`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_darkchat_loggedin_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE,
  CONSTRAINT `yphone_darkchat_loggedin_ibfk_2` FOREIGN KEY (`username`) REFERENCES `yphone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_darkchat_loggedin: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_darkchat_members
CREATE TABLE IF NOT EXISTS `yphone_darkchat_members` (
  `channel_name` varchar(50) NOT NULL,
  `muted` tinyint(1) DEFAULT 0,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`channel_name`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_darkchat_members_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_darkchat_accounts` (`username`) ON DELETE CASCADE,
  CONSTRAINT `yphone_darkchat_members_ibfk_2` FOREIGN KEY (`channel_name`) REFERENCES `yphone_darkchat_channels` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_darkchat_members: ~1 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_darkchat_messages
CREATE TABLE IF NOT EXISTS `yphone_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `channel` (`channel`),
  CONSTRAINT `yphone_darkchat_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `yphone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_darkchat_messages_ibfk_2` FOREIGN KEY (`channel`) REFERENCES `yphone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_darkchat_messages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_devices
CREATE TABLE IF NOT EXISTS `yphone_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(255) NOT NULL,
  `lock` tinyint(1) DEFAULT 0,
  `settings_id` int(11) DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT 0,
  `os` varchar(255) NOT NULL,
  `battery_level` int(3) DEFAULT 100,
  `battery_charging` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imei` (`imei`),
  KEY `settings_id` (`settings_id`),
  CONSTRAINT `yphone_devices_ibfk_1` FOREIGN KEY (`settings_id`) REFERENCES `yphone_settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_devices: ~0 rows (approximately)
INSERT INTO `yphone_devices` (`id`, `imei`, `lock`, `settings_id`, `is_setup`, `os`, `battery_level`, `battery_charging`) VALUES
	(490, 'SNLoVp5H6EwHOn2', 1, 490, 1, 'humanoid', 100, 0);

-- Dumping structure for table samudra-roleplay.yphone_gallery
CREATE TABLE IF NOT EXISTS `yphone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `image` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `is_favorite` tinyint(1) NOT NULL DEFAULT 0,
  `source` enum('camera','download','screenshot','other') NOT NULL DEFAULT 'other',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  KEY `fk_gallery_album` (`album_id`),
  CONSTRAINT `fk_gallery_album` FOREIGN KEY (`album_id`) REFERENCES `yphone_gallery_albums` (`id`) ON DELETE SET NULL,
  CONSTRAINT `yphone_gallery_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_gallery: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_gallery_albums
CREATE TABLE IF NOT EXISTS `yphone_gallery_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('system','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_album_per_phone` (`phone_imei`,`name`),
  CONSTRAINT `yphone_gallery_albums_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_gallery_albums: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_holders
CREATE TABLE IF NOT EXISTS `yphone_holders` (
  `holder_identifier` varchar(100) NOT NULL,
  `phone_imei` varchar(255) NOT NULL,
  PRIMARY KEY (`holder_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_holders: ~0 rows (approximately)
INSERT INTO `yphone_holders` (`holder_identifier`, `phone_imei`) VALUES
	('S27P7Z53', 'SNLoVp5H6EwHOn2');

-- Dumping structure for table samudra-roleplay.yphone_instashots_accounts
CREATE TABLE IF NOT EXISTS `yphone_instashots_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `profile_image` varchar(4096) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `private` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `story_count` int(11) NOT NULL DEFAULT 0,
  `posts_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_accounts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_comments
CREATE TABLE IF NOT EXISTS `yphone_instashots_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_instashots_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `yphone_instashots_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yphone_instashots_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_comments: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_follows
CREATE TABLE IF NOT EXISTS `yphone_instashots_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `yphone_instashots_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_instashots_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_follows: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_hashtags
CREATE TABLE IF NOT EXISTS `yphone_instashots_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_hashtags: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_likes
CREATE TABLE IF NOT EXISTS `yphone_instashots_likes` (
  `post_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`post_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_instashots_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_likes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_loggedin
CREATE TABLE IF NOT EXISTS `yphone_instashots_loggedin` (
  `phone_imei` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_imei`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_instashots_loggedin_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE,
  CONSTRAINT `yphone_instashots_loggedin_ibfk_2` FOREIGN KEY (`username`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_loggedin: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_messages
CREATE TABLE IF NOT EXISTS `yphone_instashots_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `yphone_instashots_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_instashots_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_messages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_notifications
CREATE TABLE IF NOT EXISTS `yphone_instashots_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `yphone_instashots_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_instashots_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_notifications: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_posts
CREATE TABLE IF NOT EXISTS `yphone_instashots_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `caption` varchar(280) DEFAULT NULL,
  `attachments` longtext DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `comment_count` int(11) DEFAULT 0,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_instashots_posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_posts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_stories
CREATE TABLE IF NOT EXISTS `yphone_instashots_stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_instashots_stories_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_stories: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_instashots_stories_views
CREATE TABLE IF NOT EXISTS `yphone_instashots_stories_views` (
  `story_id` int(11) NOT NULL,
  `viewer` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`story_id`,`viewer`),
  KEY `viewer` (`viewer`),
  CONSTRAINT `yphone_instashots_stories_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `yphone_instashots_stories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yphone_instashots_stories_views_ibfk_2` FOREIGN KEY (`viewer`) REFERENCES `yphone_instashots_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_instashots_stories_views: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_lovr_accounts
CREATE TABLE IF NOT EXISTS `yphone_lovr_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `profile_images` longtext DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `interested_in` varchar(20) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_lovr_accounts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_lovr_likes
CREATE TABLE IF NOT EXISTS `yphone_lovr_likes` (
  `liker_username` varchar(20) NOT NULL,
  `liked_username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`liker_username`,`liked_username`),
  KEY `liked_username` (`liked_username`),
  CONSTRAINT `yphone_lovr_likes_ibfk_1` FOREIGN KEY (`liker_username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_lovr_likes_ibfk_2` FOREIGN KEY (`liked_username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_lovr_likes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_lovr_loggedin
CREATE TABLE IF NOT EXISTS `yphone_lovr_loggedin` (
  `phone_imei` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_imei`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_lovr_loggedin_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE,
  CONSTRAINT `yphone_lovr_loggedin_ibfk_2` FOREIGN KEY (`username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_lovr_loggedin: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_lovr_matches
CREATE TABLE IF NOT EXISTS `yphone_lovr_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1_username` varchar(20) NOT NULL,
  `user2_username` varchar(20) NOT NULL,
  `matched_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_match` (`user1_username`,`user2_username`),
  KEY `user2_username` (`user2_username`),
  CONSTRAINT `yphone_lovr_matches_ibfk_1` FOREIGN KEY (`user1_username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_lovr_matches_ibfk_2` FOREIGN KEY (`user2_username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_lovr_matches: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_lovr_messages
CREATE TABLE IF NOT EXISTS `yphone_lovr_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `sender_username` varchar(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`),
  KEY `sender_username` (`sender_username`),
  CONSTRAINT `yphone_lovr_messages_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `yphone_lovr_matches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yphone_lovr_messages_ibfk_2` FOREIGN KEY (`sender_username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_lovr_messages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_lovr_passes
CREATE TABLE IF NOT EXISTS `yphone_lovr_passes` (
  `passer_username` varchar(20) NOT NULL,
  `passed_username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`passer_username`,`passed_username`),
  KEY `passed_username` (`passed_username`),
  CONSTRAINT `yphone_lovr_passes_ibfk_1` FOREIGN KEY (`passer_username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_lovr_passes_ibfk_2` FOREIGN KEY (`passed_username`) REFERENCES `yphone_lovr_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_lovr_passes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_mails
CREATE TABLE IF NOT EXISTS `yphone_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `phone_imei` varchar(255) NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `sender` varchar(255) NOT NULL,
  `sender_display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_mails_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_mails: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_maps_locations
CREATE TABLE IF NOT EXISTS `yphone_maps_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_maps_locations_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_maps_locations: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_messages_channels
CREATE TABLE IF NOT EXISTS `yphone_messages_channels` (
  `channel_id` varchar(50) NOT NULL,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `last_message` varchar(255) NOT NULL DEFAULT '',
  `last_message_timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_messages_channels: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_messages_members
CREATE TABLE IF NOT EXISTS `yphone_messages_members` (
  `channel_id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `unread` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`channel_id`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_messages_members: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_messages_messages
CREATE TABLE IF NOT EXISTS `yphone_messages_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` varchar(50) NOT NULL,
  `sender_imei` varchar(255) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_messages_messages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_metadata
CREATE TABLE IF NOT EXISTS `yphone_metadata` (
  `dbVersion` varchar(10) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `dbVersion` (`dbVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_metadata: ~0 rows (approximately)
INSERT INTO `yphone_metadata` (`dbVersion`, `lastUpdate`, `createdAt`) VALUES
	('1.1.3', '2025-09-29 12:03:14', '2025-06-06 20:27:34');

-- Dumping structure for table samudra-roleplay.yphone_news_accounts
CREATE TABLE IF NOT EXISTS `yphone_news_accounts` (
  `username` varchar(20) NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `idx_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_news_accounts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_news_articles
CREATE TABLE IF NOT EXISTS `yphone_news_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` longtext NOT NULL,
  `image_urls` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image_urls`)),
  `category_id` varchar(50) NOT NULL,
  `author_id` varchar(20) NOT NULL,
  `views_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_author` (`author_id`),
  KEY `idx_created` (`created_at`),
  KEY `idx_views` (`views_count`),
  FULLTEXT KEY `idx_search` (`title`,`summary`,`content`),
  CONSTRAINT `yphone_news_articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `yphone_news_accounts` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_news_articles: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_news_loggedin
CREATE TABLE IF NOT EXISTS `yphone_news_loggedin` (
  `phone_imei` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `logged_in_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`phone_imei`),
  UNIQUE KEY `username_unique` (`username`),
  KEY `idx_username` (`username`),
  CONSTRAINT `yphone_news_loggedin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_news_accounts` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_news_loggedin: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_notes
CREATE TABLE IF NOT EXISTS `yphone_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_notes_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_notes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_notifications
CREATE TABLE IF NOT EXISTS `yphone_notifications` (
  `id` varchar(255) NOT NULL,
  `app` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone_imei` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_notifications_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_notifications: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_promo_hub_posts
CREATE TABLE IF NOT EXISTS `yphone_promo_hub_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_promo_hub_posts_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_promo_hub_posts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_recents
CREATE TABLE IF NOT EXISTS `yphone_recents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_number` varchar(255) DEFAULT NULL,
  `phone_imei` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `call_type` varchar(255) NOT NULL,
  `call_duration` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_recents_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2845 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_recents: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_settings
CREATE TABLE IF NOT EXISTS `yphone_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `citizen_id` varchar(255) DEFAULT NULL,
  `fingerprint` tinyint(1) NOT NULL DEFAULT 0,
  `face_recognition` tinyint(1) NOT NULL DEFAULT 0,
  `auto_lock_timeout` int(11) NOT NULL DEFAULT 0,
  `scale` varchar(255) NOT NULL DEFAULT '1',
  `homescreen_wallpaper` varchar(255) DEFAULT NULL,
  `lockscreen_wallpaper` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL DEFAULT 'light',
  `language` varchar(255) NOT NULL DEFAULT 'en',
  `volume` int(11) NOT NULL DEFAULT 50,
  `brightness` int(11) NOT NULL DEFAULT 100,
  `sound` varchar(255) NOT NULL DEFAULT 'sound',
  `ringtone` varchar(255) DEFAULT NULL,
  `notification` varchar(255) DEFAULT NULL,
  `streamer_mode` tinyint(1) NOT NULL DEFAULT 0,
  `do_not_disturb` tinyint(1) NOT NULL DEFAULT 0,
  `airplane` tinyint(1) NOT NULL DEFAULT 0,
  `quickshare` tinyint(1) NOT NULL DEFAULT 1,
  `hide_caller_id` tinyint(1) NOT NULL DEFAULT 0,
  `notifications` longtext DEFAULT NULL,
  `apps` longtext DEFAULT NULL,
  `metadata` varchar(4069) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_settings: ~0 rows (approximately)
INSERT INTO `yphone_settings` (`id`, `phone_imei`, `pin`, `citizen_id`, `fingerprint`, `face_recognition`, `auto_lock_timeout`, `scale`, `homescreen_wallpaper`, `lockscreen_wallpaper`, `type`, `theme`, `language`, `volume`, `brightness`, `sound`, `ringtone`, `notification`, `streamer_mode`, `do_not_disturb`, `airplane`, `quickshare`, `hide_caller_id`, `notifications`, `apps`, `metadata`) VALUES
	(490, 'SNLoVp5H6EwHOn2', '1996', NULL, 0, 0, 0, '0.95', 'backgrounds-front/Lavender.png', 'backgrounds-front/Lavender.png', 'Lavender', 'light', 'en', 50, 100, 'sound', 'GalaxyBells', 'Spaceline', 0, 0, 0, 1, 0, '{"disabled":false,"twitter":true,"messages":true,"email":true,"garage":true,"banking":true,"companies":true,"homes":true,"system":true,"companyCalls":true,"companyMessages":true,"instashots":true,"groups":true,"ybuy":true,"darkchat":true,"promoHub":true,"lovr":true}', '{"apps":[["phone","messages","settings","camera"],["playstore","maps","ypay","calculator","companies","homes","clock","garage","notes","contacts","email","gallery"]]}\n', '{"notifications_version":4,"defaultApps_version":2}');

-- Dumping structure for table samudra-roleplay.yphone_sim_cards
CREATE TABLE IF NOT EXISTS `yphone_sim_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) DEFAULT NULL,
  `sim_number` varchar(20) NOT NULL,
  `slot` int(11) NOT NULL DEFAULT 1,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_sim_cards_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_sim_cards: ~1 rows (approximately)
INSERT INTO `yphone_sim_cards` (`id`, `phone_imei`, `sim_number`, `slot`, `primary`) VALUES
	(401, NULL, '0876929', 1, 0),
	(489, 'SNLoVp5H6EwHOn2', '0890019', 1, 0);

-- Dumping structure for table samudra-roleplay.yphone_twitter_accounts
CREATE TABLE IF NOT EXISTS `yphone_twitter_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_imei` varchar(255) NOT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `profile_image` varchar(4096) DEFAULT NULL,
  `profile_header` varchar(4096) DEFAULT NULL,
  `pinned_tweet` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_accounts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_twitter_follows
CREATE TABLE IF NOT EXISTS `yphone_twitter_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `yphone_twitter_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_twitter_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_follows: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_twitter_hashtags
CREATE TABLE IF NOT EXISTS `yphone_twitter_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_hashtags: ~0 rows (approximately)
INSERT INTO `yphone_twitter_hashtags` (`hashtag`, `amount`, `last_used`) VALUES
	('#ODAG', 1, '2025-07-07 23:05:03');

-- Dumping structure for table samudra-roleplay.yphone_twitter_likes
CREATE TABLE IF NOT EXISTS `yphone_twitter_likes` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_twitter_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_likes: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_twitter_loggedin
CREATE TABLE IF NOT EXISTS `yphone_twitter_loggedin` (
  `phone_imei` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_imei`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_twitter_loggedin_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE,
  CONSTRAINT `yphone_twitter_loggedin_ibfk_2` FOREIGN KEY (`username`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_loggedin: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_twitter_messages
CREATE TABLE IF NOT EXISTS `yphone_twitter_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `yphone_twitter_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_twitter_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_messages: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_twitter_notifications
CREATE TABLE IF NOT EXISTS `yphone_twitter_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `yphone_twitter_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yphone_twitter_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_notifications: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_twitter_retweets
CREATE TABLE IF NOT EXISTS `yphone_twitter_retweets` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_twitter_retweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_retweets: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_twitter_tweets
CREATE TABLE IF NOT EXISTS `yphone_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `content` varchar(280) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `reply_to` varchar(50) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `reply_count` int(11) DEFAULT 0,
  `retweet_count` int(11) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_twitter_tweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `yphone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_twitter_tweets: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_ybuy_ads
CREATE TABLE IF NOT EXISTS `yphone_ybuy_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `allow_messages` tinyint(1) DEFAULT 0,
  `allow_calls` tinyint(1) DEFAULT 0,
  `attachments` longtext DEFAULT NULL,
  `phone_imei` varchar(255) NOT NULL,
  `archived` tinyint(1) DEFAULT 0,
  `last_renew` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_ybuy_ads_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_ybuy_ads: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_ybuy_favorites
CREATE TABLE IF NOT EXISTS `yphone_ybuy_favorites` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_imei` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ad_id`,`phone_imei`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_ybuy_favorites_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_ybuy_favorites: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_ycloud_accounts
CREATE TABLE IF NOT EXISTS `yphone_ycloud_accounts` (
  `phone_imei` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `phone_name` varchar(255) NOT NULL,
  `avatar` varchar(4096) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `synced_imei` varchar(255) DEFAULT NULL,
  `last_sync` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_imei` (`phone_imei`),
  CONSTRAINT `yphone_ycloud_accounts_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_ycloud_accounts: ~0 rows (approximately)

-- Dumping structure for table samudra-roleplay.yphone_ycloud_loggedin
CREATE TABLE IF NOT EXISTS `yphone_ycloud_loggedin` (
  `phone_imei` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_imei`),
  KEY `username` (`username`),
  CONSTRAINT `yphone_ycloud_loggedin_ibfk_1` FOREIGN KEY (`phone_imei`) REFERENCES `yphone_devices` (`imei`) ON DELETE CASCADE,
  CONSTRAINT `yphone_ycloud_loggedin_ibfk_2` FOREIGN KEY (`username`) REFERENCES `yphone_ycloud_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table samudra-roleplay.yphone_ycloud_loggedin: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
