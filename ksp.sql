# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.17)
# Database: ksp
# Generation Time: 2015-07-15 11:29:26 +0000
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

CREATE TABLE `cicilan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table denda
# ------------------------------------------------------------

CREATE TABLE `denda` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) DEFAULT NULL,
  `jumlah` float DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table keanggotaan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `keanggotaan`;

CREATE TABLE `keanggotaan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(100) DEFAULT NULL,
  `simpanan_pokok` int(11) DEFAULT NULL,
  `simpanan_wajib` int(11) DEFAULT NULL,
  `bunga_simpanan` float DEFAULT NULL,
  `bunga_pinjaman` float DEFAULT NULL,
  `denda_pinjaman` float DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `keanggotaan` WRITE;
/*!40000 ALTER TABLE `keanggotaan` DISABLE KEYS */;

INSERT INTO `keanggotaan` (`id`, `jenis`, `simpanan_pokok`, `simpanan_wajib`, `bunga_simpanan`, `bunga_pinjaman`, `denda_pinjaman`, `keterangan`)
VALUES
	(1,'Masyarakat',500,0,0.5,2,0.2,'Setelah simpanan di atas Rp. 1 juta'),
	(2,'Anggota',500,5000,0.7,2,0.2,'Setelah ada saldo simpanan pokok'),
	(3,'Siswa',0,0,0,2,0.2,'Tanpa jasa');

/*!40000 ALTER TABLE `keanggotaan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nasabah
# ------------------------------------------------------------

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



# Dump of table pinjaman
# ------------------------------------------------------------

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
	('last_check_bunga','2015-07-01'),
	('kop_text','Koperasi Indonesia\nJakarta\nJl. Warga Raya No.30 RT 03/03 Pejaten Barat, Jakarta Selatan, Telp. 085259838599'),
	('kop_koperasi','koperasi1.jpeg'),
	('kop_logo','lambang-baru-koperasi-indonesia.jpg');

/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table simpanan
# ------------------------------------------------------------

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

CREATE VIEW `view_laporan`
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
