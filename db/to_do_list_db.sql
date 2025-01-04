-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 05:25 AM
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
-- Database: `to_do_list_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_tugas` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `status_tugas` enum('belum','selesai') DEFAULT 'belum',
  `tanggal_dibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_deadline` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id_tugas`, `id_user`, `nama_tugas`, `deskripsi`, `status_tugas`, `tanggal_dibuat`, `tanggal_deadline`) VALUES
(11, 4, 'buat ppt', 'membuat ppt tentang perang dunia 1', 'selesai', '2024-12-26 11:30:23', '2024-12-27 17:00:00'),
(27, 4, 'Membuat makalah', 'makalah kewirausahaan', 'belum', '2024-12-28 04:20:13', '2024-12-28 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tanggal_daftar` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `email`, `password`, `tanggal_daftar`) VALUES
(1, '', 'a', 'admin@gmail.com', '$2y$10$zztiwpNhfn3qTyabN9xOBu05.PLL6hVljoRHJPManyq.SUq.5FAYG', '2024-12-24 16:27:12'),
(2, '', 'ucup', 'ucup@gmail.com', '$2y$10$Ivr7T7SyPXwsWWwqyx8CruCHzmbBVZHncD0vve.x09teFixW8AU.2', '2024-12-25 13:32:34'),
(3, 'farhan kebab', 'farhan', 'farhankebab@gmail.com', '$2y$10$2eJvUX8yK4IGocrmjwaE..Srj1mXkT9THjYjbANLI7NlqmzWwIAci', '2024-12-25 15:15:20'),
(4, 'M Genio Brillian', 'genio', 'genio@gmail.com', '$2y$10$SAqt1Q8D/mCPh.ybjkuJlu5HeMrECwhCelNElw6BhfGMd1s42c9xK', '2024-12-26 01:14:00'),
(5, 'Dodik pucang', 'dodik', 'dodik@gmail.com', '$2y$10$oiL8/Oj8Omw3Z3GUPB1Ga.wUbOM.81FU.QWTcb9Y8K2jcfxcPxODa', '2024-12-27 09:39:59'),
(6, 'zahwa zz', 'zahwa', 'zahwa@gmail.com', '$2y$10$cQ9RSVI/1idE3/nbMuxMw.gRaWqeTgR300HxnRWNpzLahLKouIEYi', '2024-12-27 13:33:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `tugas_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
