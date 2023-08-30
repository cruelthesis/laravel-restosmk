-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Agu 2023 pada 01.03
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-restosmk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoris`
--

CREATE TABLE `kategoris` (
  `idkategori` int(10) UNSIGNED NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategoris`
--

INSERT INTO `kategoris` (`idkategori`, `kategori`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', '2022-12-03 00:27:15', '2022-12-03 00:27:15'),
(2, 'Minuman', '2022-12-03 00:28:05', '2022-12-03 00:28:05'),
(7, 'Gorengan', '2023-07-31 23:17:06', '2023-08-01 21:25:49'),
(8, 'Buah', '2023-07-31 23:17:13', '2023-08-01 21:25:56'),
(9, 'Kue', '2023-08-01 21:18:16', '2023-08-01 21:18:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `idmenu` bigint(20) UNSIGNED NOT NULL,
  `idkategori` int(11) NOT NULL,
  `menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`idmenu`, `idkategori`, `menu`, `gambar`, `deskripsi`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'bakso', 'bakso.jpeg', 'Bakso Enak', 7000.00, NULL, NULL),
(2, 1, 'Soto', 'soto.jpg', 'Soto segar', 6000.00, NULL, NULL),
(3, 2, 'Es Teh', 'esteh.jpg', 'Segar', 3000.00, NULL, NULL),
(4, 2, 'Es Jeruk', 'esjeruk.jpg', 'Segar', 3000.00, NULL, NULL),
(5, 9, 'Kue Basah', 'kue basah.jpg', 'Jajanan Pasar', 2000.00, '2023-08-01 21:22:03', '2023-08-01 21:22:03'),
(6, 7, 'Tahu Goreng', 'tahu goreng.jpg', 'gratis cabai', 1000.00, '2023-08-01 21:26:56', '2023-08-01 21:26:56'),
(7, 8, 'Jeruk', 'jeruk.jpg', 'Jeruk Sunkist', 3000.00, '2023-08-01 21:35:10', '2023-08-01 21:35:10'),
(9, 8, 'Apel', 'apel malang.jpg', 'Apel Malang', 4000.00, '2023-08-01 22:39:19', '2023-08-01 23:33:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_03_040738_create_pelanggans_table', 1),
(6, '2022_12_03_041113_create_orders_table', 1),
(7, '2022_12_03_041251_create_order_details_table', 1),
(8, '2022_12_03_041541_create_menus_table', 1),
(9, '2022_12_03_041723_create_kategoris_table', 1),
(10, '2023_07_31_013247_add_level_to_users', 2),
(11, '2023_07_31_013430_add_status_to_orders', 2),
(12, '2023_07_31_013534_add_aktif_to_pelanggans', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `idorder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `tglorder` date NOT NULL,
  `total` double(8,2) NOT NULL,
  `bayar` double(8,2) NOT NULL,
  `kembali` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`idorder`, `idpelanggan`, `tglorder`, `total`, `bayar`, `kembali`, `created_at`, `updated_at`, `status`) VALUES
('20230731010737', 37, '2023-07-31', 38000.00, 40000.00, 2000.00, '2023-07-30 18:29:37', '2023-08-06 17:53:05', 1),
('20230802060851', 37, '2023-08-02', 10000.00, 50000.00, 40000.00, '2023-08-01 23:55:52', '2023-08-06 17:55:23', 1),
('20230814010850', 37, '2023-08-14', 22000.00, 50000.00, 28000.00, '2023-08-13 18:23:50', '2023-08-13 18:24:54', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `idorderdetail` int(10) UNSIGNED NOT NULL,
  `idorder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idmenu` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `hargajual` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`idorderdetail`, `idorder`, `idmenu`, `jumlah`, `hargajual`, `created_at`, `updated_at`) VALUES
(6, '20230731010737', 1, 2, 7000.00, '2023-07-30 18:29:37', '2023-07-30 18:29:37'),
(7, '20230731010737', 3, 2, 3000.00, '2023-07-30 18:29:37', '2023-07-30 18:29:37'),
(8, '20230731010737', 2, 2, 6000.00, '2023-07-30 18:29:37', '2023-07-30 18:29:37'),
(9, '20230731010737', 4, 2, 3000.00, '2023-07-30 18:29:37', '2023-07-30 18:29:37'),
(10, '20230802060851', 6, 1, 1000.00, '2023-08-01 23:55:51', '2023-08-01 23:55:51'),
(11, '20230802060851', 7, 1, 3000.00, '2023-08-01 23:55:51', '2023-08-01 23:55:51'),
(12, '20230802060851', 5, 3, 2000.00, '2023-08-01 23:55:52', '2023-08-01 23:55:52'),
(13, '20230814010850', 1, 2, 7000.00, '2023-08-13 18:23:50', '2023-08-13 18:23:50'),
(14, '20230814010850', 6, 2, 1000.00, '2023-08-13 18:23:50', '2023-08-13 18:23:50'),
(15, '20230814010850', 7, 2, 3000.00, '2023-08-13 18:23:50', '2023-08-13 18:23:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggans`
--

CREATE TABLE `pelanggans` (
  `idpelanggan` int(10) UNSIGNED NOT NULL,
  `pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jeniskelamin` enum('P','L') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'P',
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `aktif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelanggans`
--

INSERT INTO `pelanggans` (`idpelanggan`, `pelanggan`, `jeniskelamin`, `alamat`, `telp`, `email`, `password`, `created_at`, `updated_at`, `aktif`) VALUES
(34, 'kiki', 'P', 'bogor', '08xxxx', 'tukinem@gmail.com', '$2y$10$NoMtligCADksNOhoNHGBeuzqAGXRE8Uvc6KJqpXMsUOQhkCBgr74.', '2022-12-03 20:15:15', '2023-08-06 20:58:13', 1),
(35, 'ana', 'P', 'surabaya', '08xxxx', 'anamargarett@gmail.com', '$2y$10$Ub8I/94x90/GXiGk6mRYR.52Fg7QFglDRh7MlMKgKWxLmedDA6S.u', '2022-12-03 20:20:22', '2023-08-06 20:58:12', 1),
(36, 'ayu', 'P', 'hijijiji', '78087', 'ayuhapsari@gmail.com', '$2y$10$aAKcLMjjcKrgYdPwtjxdcelqho9lOn7.s78W36c7cW7vWp5Vaxj4K', '2023-02-20 19:21:38', '2023-08-06 20:58:13', 1),
(37, 'aaaa', 'P', 'aaaaa', '0897968', 'admin@gmail.com', '$2y$10$v2DJ4IbEiOEiGDkoVrTD1uJC5uZBZhEeUwL7dDKYreNsMvBkl5W3y', '2023-07-30 17:46:10', '2023-07-30 17:46:10', 1),
(38, 'ani', 'P', 'bekasi', '999999', 'anibekasi@gmail.com', '$2y$10$VcnHY.MY8qBIrmtV2yFUA.Dg.dcew6c64KoQG.2wuBWIsq3oD2Gte', '2023-08-06 21:41:47', '2023-08-06 21:41:47', 1),
(39, 'beel', 'P', 'neraka', '666', 'beelzebub@gmail.com', '$2y$10$jf1rUPVXeYs6brj8/gCZyuYWPvYSjY3B6.qkvOC6MlOFLgPwiccJ6', '2023-08-13 18:06:39', '2023-08-13 18:06:39', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `level`) VALUES
(1, 'admin', 'admin1@gmail.com', NULL, '$2y$10$7VS3J0WVz.0bZFwPQBgJyuEEDuC5OLyXM2dj9IACo3sFrHztl1k86', NULL, '2023-07-30 19:07:07', '2023-07-30 19:07:07', 'admin'),
(2, 'kasir', 'kasir1@gmail.com', NULL, '$2y$10$CU2dvT9XydoQfBGW6DBZwOZTNIq7oqlYsD3YakFNgMNXkh4JwS3/2', NULL, '2023-07-30 19:07:07', '2023-08-06 23:35:30', 'kasir'),
(3, 'manager', 'manager@gmail.com', NULL, '$2y$10$BFD9VlLuO6ozQY7GjnFLDO9HvLQ.7X4ERcVo0DJRY0QMmY7n9tGme', NULL, '2023-07-30 19:07:08', '2023-07-30 19:07:08', 'manager');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idorder`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`idorderdetail`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `idkategori` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `idmenu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `idorderdetail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `idpelanggan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
