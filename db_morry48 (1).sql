-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Des 2025 pada 15.13
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_morry48`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_detail` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `sub_total` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_detail`, `id_pesanan`, `id_produk`, `nama_produk`, `harga`, `jumlah`, `sub_total`) VALUES
(11, 17, 4, 'LANYARD MANCHESTER UNITED', 20000.00, 1, 0.00),
(12, 18, 4, 'LANYARD MANCHESTER UNITED', 20000.00, 1, 0.00),
(13, 19, 22, 'Keychain Lotso', 20000.00, 1, 0.00),
(14, 19, 26, 'Keychain Feast', 4000.00, 1, 0.00),
(15, 20, 14, 'Keychain persija', 3000.00, 1, 0.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_pesanan` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(15,2) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status_Pembayaran` varchar(50) NOT NULL DEFAULT 'Menunggu Pembayaran',
  `bukti_Transfer` varchar(255) NOT NULL COMMENT 'File Upload',
  `resi_pengiriman` varchar(100) NOT NULL COMMENT 'nomor resi',
  `status_pengiriman` varchar(50) NOT NULL DEFAULT 'Belum Dikirim'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `nama_pelanggan`, `email`, `alamat`, `tanggal_pesanan`, `total`, `id_user`, `status_Pembayaran`, `bukti_Transfer`, `resi_pengiriman`, `status_pengiriman`) VALUES
(16, 'demo', 'fatandwif@gmail.com', 'assrr4512', '2025-12-11 16:14:37', 24000.00, 4, 'Lunas', '1765444489_1434.png', 'JP12345678', 'Dikirim'),
(19, 'keanu rizky', 'fatandwif@gmail.com', 'hhhhhh', '2025-12-16 21:28:18', 24000.00, 12, 'Lunas', '1765895316_6124.jpg', 'JP09876543', 'Dikirim'),
(20, 'Fataan', 'fatandwif@gmail.com', 'condet', '2025-12-18 20:47:40', 3000.00, 15, 'Lunas', '1766065718_4443.png', 'JP09876542', 'Dikirim');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `stok` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `harga`, `gambar`, `stok`) VALUES
(4, 'LANYARD MANCHESTER UNITED', 'Satu SET, Ukuran kartunya B2 10x10', 20000, '1760429108_lanyard manchester united.jpg', 200),
(14, 'Keychain persija', 'keychain persija dengan kualitas bagus ukuran 10x10cm', 3000, '1764833530_keychain_persija.jpeg', 99),
(15, 'lanyard barca', 'Hanya Tali lanyardnya saja', 12000, '1764831115_lanyard_barca.jpeg', 100),
(18, 'Keychain Nina feast', 'Ukuran 5x5', 5000, '1765870212_9510.jpeg', 200),
(19, 'Keychain Ac Milan', 'dibuat dengan bahan yang berkualitas dengan ukuran 5x5cm.', 3500, '1765870941_6839_keychain acmilan.jfif', 200),
(20, 'Keychain Inter Milan', 'Dibuat dengan bahan berkualitas dengan ukuran 5x5', 4000, '1765871469_1038.jpg', 200),
(21, 'Keychain Arsenal', 'Dibuat dengan bahan yang berkualitas dengan ukuran 5x5cm.', 4000, '1765871642_5743.jpg', 200),
(22, 'Keychain Lotso', 'Dibuat dengan bahan yang berkualitas dengan ukuran 10x10cm.', 20000, '1765871814_7836.jpg', 199),
(23, 'keychain realmadrid', 'Dibuat dengan bahan berkualitas dengan ukuran 5x5cm', 4000, '1765871954_2696.jpg', 200),
(24, 'Keychain Barcelona', 'Dibuat dengan bahan yang berkualitas dengan ukuran 5x5cm', 4000, '1765872112_2891.jpg', 200),
(25, 'Keychain Chelsea', 'Dibuat dengan bahan yang berkualitas dengan ukuran 5x5 cm', 4000, '1765872191_6515.jpg', 200),
(26, 'Keychain Feast', 'Dibuat dengan bahan yang berkualitas dengan ukuran 5x5 cm.', 4000, '1765872426_7766.jpg', 199),
(27, 'Keychain Hindia', 'Dibuat dengan bahan yang berkualitas dengan ukuran 5x5 cm.', 4000, '1765872480_6562.jpg', 200),
(28, 'Keychain Manchester City', 'Dibuat dengan bahan yang berkualitas dengan ukuran 5x5 cm.', 4000, '1765872535_5660.jpg', 200);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` enum('pending','selesai') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin','pelanggan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', '123', 'admin'),
(2, 'FATANDWIF', '12345', 'pelanggan'),
(4, 'demo', 'demo123', 'pelanggan'),
(9, 'neska', '$2y$10$y9oR4ZEFgKrzLkCMS0ybK.2MttyYmWAf6gsapd3tbLBUaxcqO3TT.', 'pelanggan'),
(10, 'neska1', '$2y$10$oa6VuEp7Yqsv1T3p1wU3p.rY0RO/hfBUP3iLKNnqhcm8pPis.izKC', 'pelanggan'),
(11, 'neska12', '$2y$10$onAnoNsl83318Ro934H9XeQYpHrtAf/rmjPJNnHbgFCB.qno.gbJC', 'pelanggan'),
(12, 'keanu', '$2y$10$AaC.uBibG3HIfIc4Ondbmen2i8VM5Dv0Yas1PZUuVjYe/Ab7S583i', 'pelanggan'),
(14, 'admin', '$2y$10$BqTwZx0VPJIu82OSPCGvkuCVN6/2tZY.1AGMoR23bNB8Gjkms0KBG', 'pelanggan'),
(15, 'vito', 'hahaha123', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
