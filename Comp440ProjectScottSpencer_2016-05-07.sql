# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: Comp440ProjectScottSpencer
# Generation Time: 2016-05-08 04:53:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Company`;

CREATE TABLE `Company` (
  `pk_companyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `fk_addressId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`pk_companyId`),
  KEY `CompanyAddressRelation` (`fk_addressId`),
  CONSTRAINT `CompanyAddressRelation` FOREIGN KEY (`fk_addressId`) REFERENCES `CompanyAddress` (`pk_AddressId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ascii;

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;

INSERT INTO `Company` (`pk_companyId`, `description`, `fk_addressId`)
VALUES
	(1,'ABC Records',1),
	(2,'ZYX Corp',2),
	(3,'99 Store',3);

/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CompanyAddress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CompanyAddress`;

CREATE TABLE `CompanyAddress` (
  `pk_addressId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `streetName` varchar(20) DEFAULT NULL,
  `streetNumber` int(5) DEFAULT NULL,
  PRIMARY KEY (`pk_addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

LOCK TABLES `CompanyAddress` WRITE;
/*!40000 ALTER TABLE `CompanyAddress` DISABLE KEYS */;

INSERT INTO `CompanyAddress` (`pk_addressId`, `city`, `state`, `streetName`, `streetNumber`)
VALUES
	(1,'Los Angeles','CA','Privet street',123),
	(2,'Seattle','WA','Jinx road',348),
	(3,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `CompanyAddress` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `pk_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL DEFAULT '',
  `lastName` varchar(20) NOT NULL DEFAULT '',
  `emailAddress` varchar(30) DEFAULT NULL,
  `fk_phoneNumber` int(12) unsigned DEFAULT NULL,
  `fk_companyId` int(10) unsigned NOT NULL,
  `fk_downloadId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pk_customer`),
  KEY `PhoneNumber` (`fk_phoneNumber`),
  KEY `downloadsRequest` (`fk_downloadId`),
  KEY `companyRelation` (`fk_companyId`),
  CONSTRAINT `companyRelation` FOREIGN KEY (`fk_companyId`) REFERENCES `Company` (`pk_companyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `downloadsRequest` FOREIGN KEY (`fk_downloadId`) REFERENCES `Downloads` (`pk_downloadId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=ascii;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;

INSERT INTO `Customer` (`pk_customer`, `firstName`, `lastName`, `emailAddress`, `fk_phoneNumber`, `fk_companyId`, `fk_downloadId`)
VALUES
	(1,'Peter','Smith','p.smith@abc.com',1234858973,1,1),
	(2,'Maria','Bounte','maria@zyx.com',1283978870,2,2),
	(3,'David','Sommerset','david.sommerset@99cents.store',1793978796,3,3),
	(4,'Maria','Bounte','maria.bounte@99cents.store',1234567899,3,4);

/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Downloads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Downloads`;

CREATE TABLE `Downloads` (
  `pk_downloadId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_versionId` float unsigned NOT NULL,
  `date` date NOT NULL,
  `fk_platformId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pk_downloadId`),
  KEY `PlatformRelation` (`fk_platformId`),
  CONSTRAINT `PlatformRelation` FOREIGN KEY (`fk_platformId`) REFERENCES `Platform` (`pk_platformId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=ascii;

LOCK TABLES `Downloads` WRITE;
/*!40000 ALTER TABLE `Downloads` DISABLE KEYS */;

INSERT INTO `Downloads` (`pk_downloadId`, `fk_versionId`, `date`, `fk_platformId`)
VALUES
	(1,2.1,'2000-06-01',1),
	(2,2.1,'2000-03-01',2),
	(3,2.2,'2000-07-01',1),
	(4,2.2,'2000-09-01',3);

/*!40000 ALTER TABLE `Downloads` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Features
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Features`;

CREATE TABLE `Features` (
  `pk_featureId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_featureId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=ascii;

LOCK TABLES `Features` WRITE;
/*!40000 ALTER TABLE `Features` DISABLE KEYS */;

INSERT INTO `Features` (`pk_featureId`, `description`)
VALUES
	(1,'Login Module'),
	(2,'patient registration'),
	(3,'patient profile'),
	(4,'patient release form'),
	(5,'physician profile'),
	(6,'address verification'),
	(7,'patient authentication'),
	(8,'patient medication form'),
	(9,'patient-e bill'),
	(10,'patient reporting');

/*!40000 ALTER TABLE `Features` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PhoneNumber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PhoneNumber`;

CREATE TABLE `PhoneNumber` (
  `pk_phoneNumber` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `fk_phoneTypeId` int(5) NOT NULL,
  PRIMARY KEY (`pk_phoneNumber`),
  CONSTRAINT `phonenumber_ibfk_1` FOREIGN KEY (`pk_phoneNumber`) REFERENCES `Customer` (`fk_phoneNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ascii;



# Dump of table PhoneType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PhoneType`;

CREATE TABLE `PhoneType` (
  `pk_phoneTypeId` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_phoneTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=ascii;

LOCK TABLES `PhoneType` WRITE;
/*!40000 ALTER TABLE `PhoneType` DISABLE KEYS */;

INSERT INTO `PhoneType` (`pk_phoneTypeId`, `description`)
VALUES
	(1,'Work'),
	(2,'Home'),
	(3,'Mobile'),
	(4,'Fax');

/*!40000 ALTER TABLE `PhoneType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Platform
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Platform`;

CREATE TABLE `Platform` (
  `pk_platformId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `platformType` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_platformId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ascii;

LOCK TABLES `Platform` WRITE;
/*!40000 ALTER TABLE `Platform` DISABLE KEYS */;

INSERT INTO `Platform` (`pk_platformId`, `platformType`)
VALUES
	(1,'Windows'),
	(2,'Mac OS X'),
	(3,'Linux');

/*!40000 ALTER TABLE `Platform` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `pk_productId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_platformId` int(10) unsigned NOT NULL,
  `description` varchar(50) NOT NULL DEFAULT '',
  `fk_versionId` float unsigned NOT NULL,
  `fk_featuresId` int(10) unsigned NOT NULL,
  `fk_releaseTypeId` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `fk_releaseId` float NOT NULL,
  PRIMARY KEY (`pk_productId`),
  KEY `VersionIdRelation` (`fk_versionId`),
  KEY `Feastures` (`fk_featuresId`),
  KEY `ReleaseType` (`fk_releaseTypeId`),
  CONSTRAINT `ReleaseType` FOREIGN KEY (`fk_releaseTypeId`) REFERENCES `ReleaseType` (`pk_releaseType`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Feastures` FOREIGN KEY (`fk_featuresId`) REFERENCES `Features` (`pk_featureId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=ascii;

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;

INSERT INTO `Product` (`pk_productId`, `fk_platformId`, `description`, `fk_versionId`, `fk_featuresId`, `fk_releaseTypeId`, `date`, `fk_releaseId`)
VALUES
	(1,1,'health records system for the patients',1.1,1,1,'2000-01-01',1.1),
	(2,1,'health records system for the patients',1.1,2,1,'2000-01-01',1.1),
	(4,1,'health records system for the patients',1.1,3,1,'2000-01-01',1.1),
	(5,1,'health records system for the patients',1.1,4,1,'2000-01-01',1.1),
	(6,1,'health records system for the patients',1.1,5,1,'2000-01-01',1.1),
	(7,1,'health records system for the patients',1.1,6,1,'2000-01-01',1.1),
	(8,3,'health records system for the patients',1.1,1,1,'2000-01-01',1.1),
	(9,3,'health records system for the patients',1.2,2,1,'2000-01-01',1.1),
	(10,3,'health records system for the patients',1.2,3,1,'2000-01-01',1.1),
	(11,3,'health records system for the patients',1.2,4,1,'2000-01-01',1.1),
	(12,3,'health records system for the patients',1.2,5,1,'2000-01-01',1.1),
	(13,3,'health records system for the patients',1.2,6,1,'2000-01-01',1.1),
	(14,1,'health records system for the patients',1.1,7,1,'2000-05-01',1.1),
	(15,1,'health records system for the patients',2.1,8,1,'2000-05-01',2.1),
	(16,1,'health records system for the patients',2.1,9,1,'2000-05-01',2.1),
	(17,1,'health records system for the patients',2.1,10,1,'2000-05-01',2.1),
	(18,1,'health records system for the patients',2.1,7,1,'2000-05-01',2.1),
	(19,3,'health records system for the patients',2.2,8,1,'2000-05-01',2.1),
	(20,3,'health records system for the patients',2.2,9,1,'2000-05-01',2.1),
	(21,3,'health records system for the patients',2.2,10,1,'2000-05-01',2.1),
	(22,3,'health records system for the patients',2.2,10,1,'2000-06-01',2.2);

/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Release
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Release`;

CREATE TABLE `Release` (
  `pk_releaseId` float unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pk_releaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=ascii;

LOCK TABLES `Release` WRITE;
/*!40000 ALTER TABLE `Release` DISABLE KEYS */;

INSERT INTO `Release` (`pk_releaseId`)
VALUES
	(1.1),
	(1.2),
	(2.1);

/*!40000 ALTER TABLE `Release` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ReleaseType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ReleaseType`;

CREATE TABLE `ReleaseType` (
  `pk_releaseType` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_releaseType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ascii;

LOCK TABLES `ReleaseType` WRITE;
/*!40000 ALTER TABLE `ReleaseType` DISABLE KEYS */;

INSERT INTO `ReleaseType` (`pk_releaseType`, `description`)
VALUES
	(1,'new product release'),
	(2,'new feature release'),
	(3,'bug-fix release');

/*!40000 ALTER TABLE `ReleaseType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Version
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Version`;

CREATE TABLE `Version` (
  `pk_versionId` float unsigned NOT NULL,
  PRIMARY KEY (`pk_versionId`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
