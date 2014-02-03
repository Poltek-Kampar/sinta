-- MySQL dump 10.13  Distrib 5.1.73, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sinta
-- ------------------------------------------------------
-- Server version	5.1.73-0ubuntu0.10.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosen`
--

DROP TABLE IF EXISTS `dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosen` (
  `nrp_dsn` int(15) NOT NULL,
  `nama_dsn` varchar(100) NOT NULL,
  `nidn_dsn` varchar(100) NOT NULL,
  `alamat_dsn` varchar(100) NOT NULL,
  `email_dsn` varchar(100) NOT NULL,
  `telpon_dsn` varchar(100) NOT NULL,
  `id_prodi` int(10) NOT NULL,
  PRIMARY KEY (`nrp_dsn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES (3455666,'Sunanto','1234567','pekanbaru','-','-',1),(110306001,'Abdul Gafar','1005098101','Bangkinang','gafar@poltek-kampar.ac.id','-',1),(110306006,'Fenty Kurnia Oktorina, ST., M.sc','1031107801','Pekanbaru','fenty@Poltek-kampar.ac.id','-',1),(110306007,'Fitri, ST., M.sc','1021058003','Bangkinang','fitri@poltek-kampar.ac.id','085271454004',1),(110306014,'Safni Marwah, ST., M.sc','1026067802','Bangkinang','-','08127549725',1),(110809041,'Ade Kurniawan','-','Bangkinang','-','-',1),(110907025,'Muhammad Jazman, SKom., MInfoSys MCTS','1004068202','Bangkinang','Jazman@poltek-kampar.ac.id','081210127812',1);
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `nim_mh` int(15) NOT NULL,
  `nama_mh` varchar(100) NOT NULL,
  `id_prodi` varchar(100) NOT NULL,
  `angkatan` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (201012019,'Teguh Mulya','1',2010),(200913003,'Benny Novriyadi','2',2009),(201013004,'Andri Nofiar.AM','1',2010),(201013010,'Nur Efendi','1',2010),(201012001,'Al Fahri','3',2010),(201013005,'Cici Herawati','1',2010),(201012002,'M Wahyu Firdaus','3',2010),(201013020,'Andri yadi','3',2011);
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodi`
--

DROP TABLE IF EXISTS `prodi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodi`
--

LOCK TABLES `prodi` WRITE;
/*!40000 ALTER TABLE `prodi` DISABLE KEYS */;
INSERT INTO `prodi` VALUES (1,'Teknik Informatika'),(2,'Teknik Pengolahan Sawit'),(3,'Perawatan Dan Perbaikan Mesin');
/*!40000 ALTER TABLE `prodi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tugas_akhir`
--

DROP TABLE IF EXISTS `tugas_akhir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tugas_akhir` (
  `nim_mh` int(15) NOT NULL,
  `judul` varchar(1000) NOT NULL,
  `NRP1` varchar(15) NOT NULL,
  `NRP2` varchar(15) NOT NULL,
  `abstrak` mediumtext NOT NULL,
  PRIMARY KEY (`nim_mh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tugas_akhir`
--

LOCK TABLES `tugas_akhir` WRITE;
/*!40000 ALTER TABLE `tugas_akhir` DISABLE KEYS */;
INSERT INTO `tugas_akhir` VALUES (201013004,'Perancangan Dan Pembuatan Sistem Informasi Tugas Akhir Mahasiswa Teknik Infomatika Politeknik Kampar Berbasiskan WEB','110306006','110809041','<h1 style=\"text-align: center;\">ABSTRAK</h1>\r\n\r\n<p style=\"text-align: justify;\"><strong>ANDRI NOFIAR.AM. </strong>Perancangan Dan Pembuatan Sistem Informasi Tugas Akhir Mahasiswa Politeknik Kampar Berbasiskan <em>Web</em>. Dibimbing oleh Fenty Kurnia Oktorina, ST., MSc dan Ade Kurniawan, S.Kom.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">Tugas akhir di Politeknik Kampar merupakan karya ilmiah yang dibuat oleh seorang/sekelompok mahasiswa tingkat III semester VI&nbsp; untuk menyelesaikan Studi Jenjang Diploma-III. Setelah menyelesaikan tugas akhir,&nbsp; mahasiswa&nbsp; diwajibkan untuk mengumpulkan <em>soft</em> <em>file</em> tugas akhir ke ketua program studi (Ka. Prodi), akademik dan perpustakaan.Untuk dapat&nbsp; mengetahui informasi tentang tugas akhir yang telah dibuat, mahasiswa terlebih dahulu meminjam dokumen tugas akhir ke Ka. Prodi atau perpustakaan. Untuk menunjang dan mempermudah penyampaian informasi mengenai tugas akhir maka dibutuhkan sebuah sistem informasi untuk dapat meningkatkan kualitas pendidikan yang lebih baik. Sistem tersebut nantinya dapat diakses oleh pengguna yang telah terkoneksi dengan <em>internet</em>. Dalam perancangan dan pembuatan Sistem Informasi Tugas Akhir ini menggunakan bahasa pemograman &nbsp;<em>Java </em>dan <em>MySQL</em> dengan metode <em>MVC </em>(<em>Model View Control</em>).</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">Kata kunci :&nbsp; tugas akhir mahasiswa, <em>Java </em>dan <em>MySQL,</em><em> MVC </em>(<em>Model View Control</em>).</p>\r\n'),(201013005,'Sistem Informasi Peralatan Di Kantor Dinas Elektronika Bandara Sultan Syarif Kasim II','110306001','0',''),(201013010,'Sistem Informasi Penjadwalan Mata Kuliah Prodi Teknik Informatika Politeknik Kampar menggunakan Add-ins Microsoft excel 2007 dengan Php Framework CodeIgniter versi 2.1.3 dan JavaScript Framework Bootstrap versi 2.3.2','110907025','110306006','<h1 style=\"text-align: center;\">ABSTRAK</h1>\r\n\r\n<p style=\"text-align: justify;\"><strong>NUR EFENDI. </strong>Sistem Informasi Penjadwalan Mata Kuliah Prodi Teknik Informatika Politeknik Kampar Menggunakan <em>Add</em>-<em>Ins</em> <em>Microsoft Excel</em> <em>2007</em> Dengan <em>Php</em> <em>Framework</em> <em>Codeigniter</em> Versi 2.1.3 Dan <em>Javascript</em> <em>Framework</em> <em>Bootstrap</em> Versi 2.3.2. Dibimbing oleh Muhammad Jazman, SKom., MInfoSys dan Fenty Kurnia Oktorina, ST., MSc.</p>\r\n\r\n<p style=\"text-align: justify;\">Dalam penyampaian informasi mengenai jadwal perkuliahan di Program Studi Teknik Informatika Politeknik Kampar masih dilakukan secara manual. Sistem ini dianggap masih terdapat kekurangan dari segi kecepatan informasi yang dibutuhkan oleh dosen dan mahasiswa. Untuk itu, dibutuhkan suatu sistem yang mampu menyajikan informasi lebih mumpuni.</p>\r\n\r\n<p style=\"text-align: justify;\">Sistem Informasi Penjadwalan Mata Kuliah Prodi Teknik Informatika Politeknik Kampar Menggunakan <em>Add</em>-<em>Ins</em> <em>Microsoft Excel</em> <em>2007</em> Dengan <em>Php</em> <em>Framework</em> <em>Codeigniter</em> Versi 2.1.3 Dan <em>Javascript</em> <em>Framework</em> <em>Bootstrap</em> Versi 2.3.2 yang penulis buat, diharapkan mampu membantu penyampaian informasi penjadwalan mata kuliah di Prodi Teknik Informatika.</p>\r\n\r\n<p style=\"text-align: justify;\">Sistem ini dirancang untuk dapat menyajikan informasi berdasarkan mata kuliah, dosen pengajar, kelas, serta ruangan yang dipergunakan untuk proses perkuliahan.</p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"line-height:1.6em\">Kata kunci : &nbsp;Jadwal mata kuliah, </span><em style=\"line-height:1.6em\">Add</em><span style=\"line-height:1.6em\">-</span><em style=\"line-height:1.6em\">ins,</em><span style=\"line-height:1.6em\"> </span><em style=\"line-height:1.6em\">Microsoft excel</em><span style=\"line-height:1.6em\"> </span><em style=\"line-height:1.6em\">2007</em><span style=\"line-height:1.6em\">, </span><em style=\"line-height:1.6em\">framework</em><span style=\"line-height:1.6em\">, </span><em style=\"line-height:1.6em\">CodeIgniter</em><span style=\"line-height:1.6em\">, </span><em style=\"line-height:1.6em\">Bootstrap</em><span style=\"line-height:1.6em\">.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n');
/*!40000 ALTER TABLE `tugas_akhir` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-03 13:29:13
