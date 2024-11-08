-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 09:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_yusuf`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(9) NOT NULL,
  `id_kategori` int(9) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `satuan` varchar(60) NOT NULL,
  `qty` int(9) NOT NULL,
  `harga` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_kategori`, `nama_barang`, `satuan`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ciki Zeky', 'Karton', 18, 2000, '2024-11-06 03:52:39', '2024-11-06 03:52:39'),
(2, 2, 'Okky Jelly Drink', 'Karton', 2, 3000, '2024-11-06 03:52:39', '2024-11-06 03:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` int(9) NOT NULL,
  `id_penjualan` int(9) DEFAULT NULL,
  `id_barang` int(9) DEFAULT NULL,
  `jumlah` int(9) DEFAULT NULL,
  `qty` int(9) DEFAULT NULL,
  `harga` double(10,2) DEFAULT NULL,
  `total_harga` double(10,2) DEFAULT NULL,
  `sub_total` double NOT NULL,
  `nominal_bayar` double(10,2) DEFAULT NULL,
  `kembalian` double(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id`, `id_penjualan`, `id_barang`, `jumlah`, `qty`, `harga`, `total_harga`, `sub_total`, `nominal_bayar`, `kembalian`, `created_at`) VALUES
(1, 2, 1, 1, 30, 2000.00, 5000.00, 0, 50000.00, 45000.00, '2024-11-07 07:46:30'),
(2, 2, 2, 1, 20, 3000.00, 5000.00, 0, 50000.00, 45000.00, '2024-11-07 07:46:30'),
(3, 3, 1, 1, 29, 2000.00, 2000.00, 0, 5000.00, 3000.00, '2024-11-07 07:48:20'),
(4, 4, 2, 10, 19, 3000.00, 30000.00, 0, 50000.00, 20000.00, '2024-11-08 01:02:33'),
(5, 5, 1, 1, 28, 2000.00, 2000.00, 0, 5000.00, 3000.00, '2024-11-08 01:48:39'),
(6, 6, 1, 1, 27, 2000.00, 14000.00, 0, 50000.00, 36000.00, '2024-11-08 07:16:20'),
(7, 6, 2, 1, 9, 3000.00, 14000.00, 0, 50000.00, 36000.00, '2024-11-08 07:16:20'),
(8, 6, 1, 1, 26, 2000.00, 14000.00, 0, 50000.00, 36000.00, '2024-11-08 07:16:20'),
(9, 7, 1, 2, NULL, 2000.00, 4.00, 0, 5000.00, 1000.00, '2024-11-08 07:43:25'),
(10, 8, 1, 5, NULL, 2000.00, 28000.00, 10000, 50000.00, 22000.00, '2024-11-08 07:58:19'),
(11, 8, 2, 6, NULL, 3000.00, 28000.00, 18000, 50000.00, 22000.00, '2024-11-08 07:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` int(9) NOT NULL,
  `nama_kategori` varchar(55) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', '2024-11-06 03:39:10', '2024-11-06 03:39:10'),
(2, 'Minuman', '2024-11-06 03:39:10', '2024-11-06 03:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(9) NOT NULL,
  `id_user` int(9) DEFAULT NULL,
  `kode_transaksi` varchar(60) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_user`, `kode_transaksi`, `tanggal_transaksi`, `created_at`) VALUES
(2, 1, 'TR-241107144613', '2024-11-07', '2024-11-07 07:46:30'),
(3, 1, 'TR-241107144801', '2024-11-07', '2024-11-07 07:48:20'),
(4, 1, 'TR-241108080145', '2024-11-08', '2024-11-08 01:02:33'),
(5, 1, 'TR-241108084813', '2024-11-08', '2024-11-08 01:48:39'),
(6, 1, 'TR-241108141433', '2024-11-08', '2024-11-08 07:16:20'),
(7, 0, 'TR-241108144215', '2024-11-08', '2024-11-08 07:43:25'),
(8, 0, 'TR-241108145716', '2024-11-08', '2024-11-08 07:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `nama_pengguna`, `email`, `password`, `foto`, `cover`, `created_at`, `updated_at`) VALUES
(1, 'Reza Ibrahim', 'rezaibrahim08', 'admin@gmail.com', '12345678', '0018120113_10.jpg', '', '2024-10-31 08:10:47', '2024-11-04 04:27:13'),
(2, 'ggwp', 'ggwp', 'ggwp@gmail.com', '12345678', '', '', '2024-11-05 05:53:03', '2024-11-05 05:53:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_to_kategori_id` (`id_kategori`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penjualan_to_penjualan_id` (`id_penjualan`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `id_kategori_to_kategori_id` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `id_penjualan_to_penjualan_id` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
