-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14 May 2015 la 16:22
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gtc`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID-ul clientului',
  `first_name` varchar(30) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Numele de familie al clientului',
  `last_name` varchar(30) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Prenumele clientului',
  `user_id` int(11) unsigned NOT NULL COMMENT 'ID-ul clientului din tabela users',
  `ID_card` varchar(10) COLLATE utf8_romanian_ci DEFAULT NULL COMMENT 'Cartea de identitate a clientului',
  `phone_number` varchar(20) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Numarul de telefon al clientului',
  `email_address` varchar(50) COLLATE utf8_romanian_ci DEFAULT NULL COMMENT 'Adresa de email a clientului',
  `postal_address` text COLLATE utf8_romanian_ci COMMENT 'Adresa postala a clientului',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `unique_customer` (`first_name`,`last_name`,`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Tabela cu clientii' AUTO_INCREMENT=11 ;

--
-- Salvarea datelor din tabel `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `user_id`, `ID_card`, `phone_number`, `email_address`, `postal_address`) VALUES
(1, 'Connor', 'John', 1, '', '+40-740-552255', 'john.connor@fakedomain.com', 'Iasi, Str. Berzelor, nr.5'),
(2, 'Connor', 'John', 2, '', '+40-740-552255', 'john.connor@fakedomain.com', 'Iasi, Str. Berzelor, nr.5'),
(9, 'Willis', 'Bruce', 3, '', '+40-740-563252', 'john.connor@fakedomain.com', 'Iasi, Str. Berzelor, nr.5');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `diagnosis_fixes`
--

CREATE TABLE IF NOT EXISTS `diagnosis_fixes` (
  `diag_fix_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID-ul masurii reparatorii',
  `description` varchar(200) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Descrierea masurii reparatorii',
  `status` enum('0','1') COLLATE utf8_romanian_ci NOT NULL DEFAULT '1' COMMENT 'activ/inactiv',
  PRIMARY KEY (`diag_fix_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Masuri reparatorii pt produsele din service' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `employeee_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID-ul angajatului',
  `first_name` varchar(30) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Numele de familie al angajatului',
  `last_name` varchar(30) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Prenume angajatului',
  `user_id` int(11) unsigned NOT NULL COMMENT 'ID-ul utilizatorului in tabela users',
  `ID_card` varchar(10) COLLATE utf8_romanian_ci DEFAULT NULL COMMENT 'Cartea de identitate a angajatului',
  `phone_number` varchar(20) COLLATE utf8_romanian_ci DEFAULT NULL COMMENT 'Numarul de telefon al angajatului',
  `email_address` int(50) NOT NULL COMMENT 'Adresa de email a angajatului',
  PRIMARY KEY (`employeee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Tabela cu toti angajatii' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `sale_document_types`
--

CREATE TABLE IF NOT EXISTS `sale_document_types` (
  `doc_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID-ul tipului de document',
  `description` varchar(50) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Denumirea (descrierea) tipului de document de vanzare',
  `status` enum('0','1') COLLATE utf8_romanian_ci NOT NULL DEFAULT '1' COMMENT 'Activ sau inactiv',
  PRIMARY KEY (`doc_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Tabel cu tipul documentelor de vanzare' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `service_diagnosis`
--

CREATE TABLE IF NOT EXISTS `service_diagnosis` (
  `note_id` int(11) unsigned NOT NULL COMMENT 'ID-ul notei de service',
  `position` smallint(5) unsigned NOT NULL COMMENT 'Pozitia pe nota de service',
  `service_diagnosis` text COLLATE utf8_romanian_ci NOT NULL COMMENT 'Diagnosticul dat de service',
  `diag_employee_id` tinyint(3) unsigned NOT NULL COMMENT 'ID-ul tehnicianului care a facut diagnoza',
  `diag_fix_id` tinyint(3) NOT NULL COMMENT 'Ce s-a hotarat in legatura cu produsul de catre tehnicianul care a efectuat diagnoza (defect neconstatat, se repara in service-ul tz, se trimite la furnizor, se inlocuieste, se returneaza banii) din tabela diagnosis_fixes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Tabel cu diagnozele produselor din service';

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `service_notes`
--

CREATE TABLE IF NOT EXISTS `service_notes` (
  `note_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID-ul notei de service',
  `employee_id` tinyint(3) NOT NULL COMMENT 'ID-ul angajatului',
  `customer_id` int(11) unsigned NOT NULL COMMENT 'ID-ul clientului',
  `date_added` datetime NOT NULL COMMENT 'Data si ora la care este creata nota de service',
  `note_status` int(3) NOT NULL COMMENT 'Starea produselor in service (nerezolvate, rezolvate partial, rezolvate in totalitate, etc)',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Note de instrare in service' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `service_note_content`
--

CREATE TABLE IF NOT EXISTS `service_note_content` (
  `note_id` int(10) unsigned NOT NULL COMMENT 'ID-ul notei de service',
  `position` int(11) NOT NULL COMMENT 'Pozitia pe nota de service',
  `product_name` int(11) NOT NULL COMMENT 'Denumirea produslui',
  `product_sn` int(11) NOT NULL COMMENT 'Seria de garantie a produsului',
  `warranty_status` tinyint(1) unsigned NOT NULL COMMENT '1 pt garantie, 0 fara garantie',
  `customer_complaint` text COLLATE utf8_romanian_ci NOT NULL COMMENT 'Defectul reclamat de client',
  `custom` text COLLATE utf8_romanian_ci NOT NULL COMMENT 'Camp in care sunt completate alte detalii despre produs (mod ambalare, accesorii, etc)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Tabela cu produsele de pe notele de service';

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `service_outputs`
--

CREATE TABLE IF NOT EXISTS `service_outputs` (
  `note_id` int(11) unsigned NOT NULL COMMENT 'ID-ul notei de service',
  `note_position` tinyint(3) unsigned NOT NULL COMMENT 'Pozitia de pe nota de service',
  `note_completion_date` date NOT NULL COMMENT 'Data la care s-a completat nota de iesire din service',
  `fix_description` text COLLATE utf8_romanian_ci NOT NULL COMMENT 'Descrierea reparatiei'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Iesiri din service';

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID-ul utilizatorului',
  `group_id` int(11) unsigned NOT NULL COMMENT 'Grupul utilizatorului (angajat sau client, etc)',
  `user_pass` varchar(100) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Parola utilizatorului',
  `login_count` int(11) unsigned NOT NULL COMMENT 'Numarul de logari pt utilizator',
  `first_login` datetime NOT NULL COMMENT 'Data si ora primei logari a utilizatorului',
  `last_logon_ip` varchar(30) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Ultima adresa IP de la care s-a logat utilizatorul',
  `status` enum('0','1') COLLATE utf8_romanian_ci NOT NULL DEFAULT '1' COMMENT 'Starea utilizatorului (activ/inactiv)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Tabela cu utilizatorii aplicatiei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID-ul grupului de utilizatori',
  `description` varchar(50) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Denumirea grupului de utilizatori',
  `admin_level` tinyint(1) unsigned NOT NULL COMMENT 'Are sau nu drept de admin',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci COMMENT='Grupuri de utilizatori' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `warranty_documents`
--

CREATE TABLE IF NOT EXISTS `warranty_documents` (
  `note_id` int(11) unsigned NOT NULL COMMENT 'ID-ul notei de service',
  `sale_doc_type_id` tinyint(3) unsigned NOT NULL COMMENT 'Tipul documentului de vanzare (factura, bon fiscal, etc)',
  `sale_doc_number` varchar(30) COLLATE utf8_romanian_ci NOT NULL COMMENT 'Seria si numarul documentului de vanzare',
  `sale_doc_date` date NOT NULL COMMENT 'Data documentului de vanzare',
  `warranty_doc_number` varchar(30) COLLATE utf8_romanian_ci DEFAULT NULL COMMENT 'Seria si numarul documentului de garantie'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_romanian_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
