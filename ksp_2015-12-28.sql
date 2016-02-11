# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.9)
# Database: ksp
# Generation Time: 2015-12-28 02:59:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cicilan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cicilan`;

CREATE TABLE `cicilan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `cicilan` WRITE;
/*!40000 ALTER TABLE `cicilan` DISABLE KEYS */;

INSERT INTO `cicilan` (`id`, `kode_nasabah`, `pinjaman_id`, `cicilan_ke`, `jumlah`, `tanggal`)
VALUES
	(6,'001',5,1,1033333,'2015-03-15'),
	(7,'002',6,1,1233333,'2015-03-15'),
	(8,'002',6,2,1216667,'2015-03-15'),
	(9,'002',6,3,1200000,'2015-03-15'),
	(10,'002',6,4,1183333,'2015-03-15'),
	(11,'002',6,24,15833333,'2015-03-15'),
	(12,'001',5,2,1016667,'2015-04-15'),
	(13,'001',5,3,1000000,'2015-05-15'),
	(14,'001',5,4,983333,'2015-07-24'),
	(15,'002',9,12,4583333,'2015-07-13'),
	(16,'001',5,5,966667,'2015-08-17'),
	(17,'002',10,1,2200000,'2015-07-15'),
	(18,'002',10,2,2160000,'2015-07-15');

/*!40000 ALTER TABLE `cicilan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table denda
# ------------------------------------------------------------

DROP TABLE IF EXISTS `denda`;

CREATE TABLE `denda` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) DEFAULT NULL,
  `jumlah` float DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `denda` WRITE;
/*!40000 ALTER TABLE `denda` DISABLE KEYS */;

INSERT INTO `denda` (`id`, `kode_nasabah`, `pinjaman_id`, `cicilan_ke`, `jumlah`, `tanggal`)
VALUES
	(1,'001',5,4,270000,'2015-07-24'),
	(2,'001',5,5,53333,'2015-08-17');

/*!40000 ALTER TABLE `denda` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table keanggotaan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `keanggotaan`;

CREATE TABLE `keanggotaan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(100) DEFAULT NULL,
  `simpanan_pokok` int(11) DEFAULT NULL,
  `simpanan_wajib` int(11) DEFAULT NULL,
  `jenis_bunga` enum('tetap','turunan') DEFAULT NULL,
  `bunga_simpanan` float DEFAULT NULL,
  `bunga_pinjaman` float DEFAULT NULL,
  `denda_pinjaman` float DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `keanggotaan` WRITE;
/*!40000 ALTER TABLE `keanggotaan` DISABLE KEYS */;

INSERT INTO `keanggotaan` (`id`, `jenis`, `simpanan_pokok`, `simpanan_wajib`, `jenis_bunga`, `bunga_simpanan`, `bunga_pinjaman`, `denda_pinjaman`, `keterangan`)
VALUES
	(1,'Masyarakat',500000,0,'tetap',0.5,2,0.2,'Setelah simpanan di atas Rp. 1 juta'),
	(2,'Anggota',500000,5000,'tetap',0.7,2,0.2,'Setelah ada saldo simpanan pokok'),
	(3,'Siswa',0,0,'tetap',0,2,0.2,'Tanpa jasa');

/*!40000 ALTER TABLE `keanggotaan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nasabah
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nasabah`;

CREATE TABLE `nasabah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `departemen` varchar(40) DEFAULT '',
  `alamat` varchar(200) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `keanggotaan_id` int(11) DEFAULT NULL,
  `tgl_masuk` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `nasabah` WRITE;
/*!40000 ALTER TABLE `nasabah` DISABLE KEYS */;

INSERT INTO `nasabah` (`id`, `kode`, `nama`, `departemen`, `alamat`, `hp`, `keanggotaan_id`, `tgl_masuk`)
VALUES
	(1,'001','Aris Setyono','','Trenggalek','085259838599',1,'2014-11-11'),
	(2,'002','setyo','','','',1,'2015-02-08'),
	(3,'003','agus','','','',3,'2014-07-01'),
	(4,'004','Budi Waseso','Dalam Negeri','Jakarta Utara','085259838599',2,'2015-03-12'),
	(5,'005','Kaskus','0','','',2,'2015-02-11'),
	(6,'006','Facebook','0','','',3,'2015-02-19'),
	(7,'007','Twitter','0','','',3,'2015-02-20'),
	(8,'008','Google','0','','',1,'2014-11-12'),
	(9,'009','Instagram','0','','',2,'2015-01-07'),
	(10,'010','Path','0','','',1,'2015-02-24'),
	(11,'011','Bbm','0','','',2,'2014-12-10');

/*!40000 ALTER TABLE `nasabah` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pinjaman
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pinjaman`;

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) NOT NULL DEFAULT '',
  `jenis` enum('Uang','Barang') NOT NULL,
  `jumlah` int(20) NOT NULL,
  `bunga` float DEFAULT NULL,
  `total_bayar` int(20) DEFAULT NULL,
  `lama` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `pinjaman` WRITE;
/*!40000 ALTER TABLE `pinjaman` DISABLE KEYS */;

INSERT INTO `pinjaman` (`id`, `kode_nasabah`, `jenis`, `jumlah`, `bunga`, `total_bayar`, `lama`, `tanggal`, `status`)
VALUES
	(5,'001','Uang',10000000,2,11300000,12,'2015-03-15','5'),
	(6,'002','Uang',20000000,2,25000000,24,'2015-03-15','24'),
	(7,'004','Uang',80000000,2,100000000,24,'2015-07-07','0'),
	(9,'002','Uang',5000000,2,5650000,12,'2015-07-13','12'),
	(10,'002','Uang',10000000,2,10600000,5,'2015-07-15','2'),
	(11,'006','Uang',10000000,2,11300000,12,'2015-08-11','0');

/*!40000 ALTER TABLE `pinjaman` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table preference
# ------------------------------------------------------------

DROP TABLE IF EXISTS `preference`;

CREATE TABLE `preference` (
  `attr` varchar(200) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;

INSERT INTO `preference` (`attr`, `value`)
VALUES
	('last_check_bunga','2015-12-23'),
	('kop_text','Koperasi Indonesia\nJakarta\nJl. Warga Raya No.30 RT 03/03 Pejaten Barat, Jakarta Selatan, Telp. 085259838599'),
	('kop_koperasi','koperasi1.jpeg'),
	('kop_logo','lambang-baru-koperasi-indonesia.jpg');

/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table simpanan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `simpanan`;

CREATE TABLE `simpanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('Pokok','Wajib','Sukarela','Bunga','Ambil') NOT NULL,
  `jumlah` float NOT NULL,
  `sld` float DEFAULT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `simpanan` WRITE;
/*!40000 ALTER TABLE `simpanan` DISABLE KEYS */;

INSERT INTO `simpanan` (`id`, `kode_nasabah`, `tanggal`, `jenis`, `jumlah`, `sld`, `created`)
VALUES
	(1,'001','2015-01-01','Pokok',500,500,1425997395),
	(2,'001','2015-01-05','Sukarela',700000,700500,1425997412),
	(3,'001','2015-02-01','Pokok',500,701000,1425997430),
	(4,'001','2015-02-25','Sukarela',500000,1201000,1425997473),
	(9,'004','2015-03-11','Pokok',500,503.5,1426035085),
	(11,'001','2015-03-01','Bunga',6005,1207000,1426035266),
	(12,'004','2015-03-01','Bunga',3.5,3.5,1426035266),
	(13,'001','2015-05-01','Bunga',6035,1213040,1430626985),
	(14,'001','2015-06-01','Bunga',6065.2,1219110,1434779120),
	(15,'001','2015-06-20','Pokok',500,1219610,1434779465),
	(16,'001','2015-07-01','Bunga',6098.05,1225700,1435736467),
	(17,'001','2015-08-01','Bunga',6128.5,1231830,1439271255),
	(18,'001','2015-12-01','Bunga',6159.15,1237990,1450874625);

/*!40000 ALTER TABLE `simpanan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `level` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `nama`, `level`, `username`, `password`)
VALUES
	(5,'Administrator','admin','admin','21232f297a57a5a743894a0e4a801fc3'),
	(6,'teller','teller','teller','8482dfb1bca15b503101eb438f52deed');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table view_laporan
# ------------------------------------------------------------

DROP VIEW IF EXISTS `view_laporan`;

CREATE TABLE `view_laporan` (
   `id` INT(11) NOT NULL DEFAULT '0',
   `tabel` VARCHAR(8) NOT NULL DEFAULT '',
   `kode_nasabah` VARCHAR(100) NULL DEFAULT NULL,
   `debet` VARCHAR(11) NOT NULL DEFAULT '',
   `kredit` VARCHAR(12) NULL DEFAULT NULL,
   `tanggal` DATE NULL DEFAULT NULL,
   `keterangan` VARCHAR(11) NULL DEFAULT NULL
) ENGINE=MyISAM;





# Replace placeholder table for view_laporan with correct view syntax
# ------------------------------------------------------------

DROP TABLE `view_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan`
AS SELECT
   `simpanan`.`id` AS `id`,'simpanan' AS `tabel`,
   `simpanan`.`kode_nasabah` AS `kode_nasabah`,'' AS `debet`,
   `simpanan`.`jumlah` AS `kredit`,
   `simpanan`.`tanggal` AS `tanggal`,
   `simpanan`.`jenis` AS `keterangan`
FROM `simpanan` union select `pinjaman`.`id` AS `id`,'pinjaman' AS `tabel`,`pinjaman`.`kode_nasabah` AS `kode_nasabah`,`pinjaman`.`jumlah` AS `debet`,'' AS `kredit`,`pinjaman`.`tanggal` AS `tanggal`,`pinjaman`.`lama` AS `keterangan` from `pinjaman` union select `cicilan`.`id` AS `id`,'cicilan' AS `tabel`,`cicilan`.`kode_nasabah` AS `kode_nasabah`,'' AS `debet`,`cicilan`.`jumlah` AS `kredit`,`cicilan`.`tanggal` AS `tanggal`,`cicilan`.`cicilan_ke` AS `keterangan` from `cicilan` union select `denda`.`id` AS `id`,'denda' AS `tabel`,`denda`.`kode_nasabah` AS `kode_nasabah`,'' AS `debet`,`denda`.`jumlah` AS `kredit`,`denda`.`tanggal` AS `tanggal`,`denda`.`cicilan_ke` AS `keterangan` from `denda`;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
