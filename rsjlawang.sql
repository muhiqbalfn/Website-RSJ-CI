-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2018 at 04:30 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsjlawang`
--

-- --------------------------------------------------------

--
-- Table structure for table `apoteker`
--

CREATE TABLE `apoteker` (
  `id` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nip` varchar(18) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text,
  `no_tlp` varchar(25) DEFAULT NULL,
  `jk` enum('laki-laki','perempuan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa_sekunder`
--

CREATE TABLE `diagnosa_sekunder` (
  `id` int(10) NOT NULL,
  `id_periksa` int(10) DEFAULT NULL,
  `id_icd10` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nip` varchar(18) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text,
  `no_tlp` varchar(25) DEFAULT NULL,
  `jk` enum('laki-laki','perempuan') DEFAULT NULL,
  `id_klinik` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icd9`
--

CREATE TABLE `icd9` (
  `id` int(11) NOT NULL,
  `kode` varchar(8) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icd10`
--

CREATE TABLE `icd10` (
  `id` int(11) NOT NULL,
  `icd_kode` varchar(7) DEFAULT NULL,
  `jenis_penyakit` varchar(184) DEFAULT NULL,
  `sebabpenyakit` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `no_tlp` varchar(15) DEFAULT NULL,
  `hubungan` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klinik`
--

CREATE TABLE `klinik` (
  `id_klinik` int(11) NOT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(10) NOT NULL,
  `id_rm` varchar(10) NOT NULL,
  `no_ktp` varchar(16) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `jk` enum('laki-laki','perempuan') NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `umur` varchar(16) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `pendidikan` varchar(30) DEFAULT NULL,
  `pekerjaan` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(10) NOT NULL,
  `no_pendaftaran` varchar(25) DEFAULT NULL,
  `id_pasien` int(10) DEFAULT NULL,
  `rujukan` varchar(100) DEFAULT NULL,
  `id_klinik` int(10) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `no_antrian` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nip` varchar(18) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text,
  `no_tlp` varchar(25) DEFAULT NULL,
  `jk` enum('laki-laki','perempuan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id_periksa` int(10) NOT NULL,
  `kode` varchar(25) DEFAULT NULL,
  `id_pendaftaran` int(10) DEFAULT NULL,
  `id_dokter` int(10) DEFAULT NULL,
  `tgl_periksa` date DEFAULT NULL,
  `keluhan` text,
  `id_icd10` int(10) DEFAULT NULL,
  `catatan` text,
  `kondisi_umum` varchar(25) DEFAULT NULL,
  `foto` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `periksa_lab`
--

CREATE TABLE `periksa_lab` (
  `id` int(11) NOT NULL,
  `id_dokter` int(10) DEFAULT NULL,
  `id_periksa` int(11) DEFAULT NULL,
  `tgl_periksa` date DEFAULT NULL,
  `periksa` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `id_rawatinap` int(10) NOT NULL,
  `id_ruangan` int(10) DEFAULT NULL,
  `id_pendaftaran` int(11) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` int(10) NOT NULL,
  `kode` varchar(15) DEFAULT NULL,
  `id_periksa` int(10) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_det`
--

CREATE TABLE `resep_det` (
  `id` int(10) NOT NULL,
  `id_resep` int(10) DEFAULT NULL,
  `id_obat` int(10) DEFAULT NULL,
  `aturan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `nama`, `kapasitas`) VALUES
(1, 'Ruang 06', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tindakan`
--

CREATE TABLE `tindakan` (
  `id_tindakan` int(10) NOT NULL,
  `id_dokter` int(10) DEFAULT NULL,
  `id_perawat` int(10) DEFAULT NULL,
  `id_periksa` int(10) DEFAULT NULL,
  `id_ruangan` int(10) DEFAULT NULL,
  `tgl_tindakan` date DEFAULT NULL,
  `id_icd9` int(10) DEFAULT NULL,
  `catatan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apoteker`
--
ALTER TABLE `apoteker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `diagnosa_sekunder`
--
ALTER TABLE `diagnosa_sekunder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_icd10` (`id_icd10`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_klinik` (`id_klinik`);

--
-- Indexes for table `icd9`
--
ALTER TABLE `icd9`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `icd10`
--
ALTER TABLE `icd10`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `klinik`
--
ALTER TABLE `klinik`
  ADD PRIMARY KEY (`id_klinik`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_klinik` (`id_klinik`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id_perawat`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id_periksa`),
  ADD KEY `id_pendaftaran` (`id_pendaftaran`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_icd10` (`id_icd10`);

--
-- Indexes for table `periksa_lab`
--
ALTER TABLE `periksa_lab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`id_rawatinap`),
  ADD KEY `id_pendaftaran` (`id_pendaftaran`),
  ADD KEY `id_ruangan` (`id_ruangan`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_periksa` (`id_periksa`);

--
-- Indexes for table `resep_det`
--
ALTER TABLE `resep_det`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`id_tindakan`),
  ADD KEY `id_perawat` (`id_perawat`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_ruangan` (`id_ruangan`),
  ADD KEY `id_icd9` (`id_icd9`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apoteker`
--
ALTER TABLE `apoteker`
  ADD CONSTRAINT `apoteker_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `diagnosa_sekunder`
--
ALTER TABLE `diagnosa_sekunder`
  ADD CONSTRAINT `diagnosa_sekunder_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id_periksa`),
  ADD CONSTRAINT `diagnosa_sekunder_ibfk_2` FOREIGN KEY (`id_icd10`) REFERENCES `icd10` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `dokter_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `dokter_ibfk_3` FOREIGN KEY (`id_klinik`) REFERENCES `klinik` (`id_klinik`);

--
-- Constraints for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD CONSTRAINT `keluarga_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `keluarga_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `keluarga_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `pendaftaran_ibfk_2` FOREIGN KEY (`id_klinik`) REFERENCES `klinik` (`id_klinik`),
  ADD CONSTRAINT `pendaftaran_ibfk_3` FOREIGN KEY (`id_klinik`) REFERENCES `klinik` (`id_klinik`);

--
-- Constraints for table `perawat`
--
ALTER TABLE `perawat`
  ADD CONSTRAINT `perawat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`),
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `periksa_ibfk_3` FOREIGN KEY (`id_icd10`) REFERENCES `icd10` (`id`);

--
-- Constraints for table `periksa_lab`
--
ALTER TABLE `periksa_lab`
  ADD CONSTRAINT `periksa_lab_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id_periksa`),
  ADD CONSTRAINT `periksa_lab_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`),
  ADD CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id_ruangan`);

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id_periksa`);

--
-- Constraints for table `resep_det`
--
ALTER TABLE `resep_det`
  ADD CONSTRAINT `resep_det_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `resep` (`id_resep`),
  ADD CONSTRAINT `resep_det_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`);

--
-- Constraints for table `tindakan`
--
ALTER TABLE `tindakan`
  ADD CONSTRAINT `tindakan_ibfk_1` FOREIGN KEY (`id_perawat`) REFERENCES `perawat` (`id_perawat`),
  ADD CONSTRAINT `tindakan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `tindakan_ibfk_3` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id_periksa`),
  ADD CONSTRAINT `tindakan_ibfk_4` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id_ruangan`),
  ADD CONSTRAINT `tindakan_ibfk_5` FOREIGN KEY (`id_icd9`) REFERENCES `icd9` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
