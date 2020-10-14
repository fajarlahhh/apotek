/*
 Navicat Premium Data Transfer

 Source Server         : Localhost 57
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : apotek

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/10/2020 15:58:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang`  (
  `barang_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barang_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barang_stok_min` double NOT NULL DEFAULT 0,
  `barang_isi_persatuan` double NULL DEFAULT 0,
  `barang_satuan_1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_satuan_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `barang_harga_jual_1` decimal(15, 2) NULL DEFAULT NULL,
  `barang_harga_jual_2` decimal(15, 2) NULL DEFAULT NULL,
  `barang_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_barang_id` bigint(20) NULL DEFAULT NULL,
  `pbf_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`barang_id`) USING BTREE,
  UNIQUE INDEX `namaBarang_UNIQUE`(`barang_nama`) USING BTREE,
  INDEX `barang_jenis_barang_id_foreign`(`jenis_barang_id`) USING BTREE,
  INDEX `barang_obat_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  INDEX `barang_pbf_id_foreign`(`pbf_id`) USING BTREE,
  CONSTRAINT `barang_jenis_barang_id_foreign` FOREIGN KEY (`jenis_barang_id`) REFERENCES `jenis_barang` (`jenis_barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_obat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_pbf_id_foreign` FOREIGN KEY (`pbf_id`) REFERENCES `pbf` (`pbf_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 391 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES (386, 'aaaaaaa', 20, NULL, 'Tablet', NULL, 10000.00, NULL, NULL, NULL, 1, 'administrator', '2020-10-11 02:03:46', '2020-10-14 12:44:16', NULL);
INSERT INTO `barang` VALUES (387, 'bbbbbbbbbb', 3, NULL, 'Tablet', NULL, 5000.00, NULL, NULL, NULL, NULL, 'administrator', '2020-10-11 02:31:20', '2020-10-14 12:44:16', NULL);
INSERT INTO `barang` VALUES (388, 'ccccccc', 3, NULL, 'Tablet', NULL, 5000.00, NULL, NULL, NULL, NULL, 'administrator', '2020-10-11 02:31:20', '2020-10-11 02:31:20', NULL);
INSERT INTO `barang` VALUES (389, 'ddddddd', 0, 0, NULL, NULL, 567777.00, NULL, NULL, NULL, NULL, 'administrator', '2020-10-14 12:44:25', '2020-10-14 14:40:45', NULL);
INSERT INTO `barang` VALUES (390, 'eeeeeee', 0, 0, NULL, NULL, 72325.00, NULL, NULL, NULL, NULL, 'administrator', '2020-10-14 12:44:27', '2020-10-14 14:40:46', NULL);

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk`  (
  `barang_masuk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barang_masuk_tanggal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_faktur` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_jatuh_tempo` date NULL DEFAULT NULL,
  `barang_masuk_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_qty` double NULL DEFAULT NULL,
  `barang_masuk_kadaluarsa` date NULL DEFAULT NULL,
  `barang_masuk_harga_barang` decimal(15, 0) NULL DEFAULT NULL,
  `barang_masuk_nomor_batch` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `barang_id` bigint(20) NOT NULL,
  `pbf_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`barang_masuk_id`, `barang_id`) USING BTREE,
  INDEX `barang_masuk_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  INDEX `barang_masuk_pbf_id_foreign`(`pbf_id`) USING BTREE,
  INDEX `barang_masuk_barang_id_foreign`(`barang_id`) USING BTREE,
  CONSTRAINT `barang_masuk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_masuk_pbf_id_foreign` FOREIGN KEY (`pbf_id`) REFERENCES `pbf` (`pbf_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_masuk_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
INSERT INTO `barang_masuk` VALUES (2, '2020-10-13', '234', '2020-10-13', NULL, 13, '2020-10-31', 60000, '74674567', NULL, 387, NULL, 'administrator', '2020-10-13 04:55:08', '2020-10-14 07:41:51', '2020-10-14 07:41:51');
INSERT INTO `barang_masuk` VALUES (3, '2020-10-13', 'asdf', '2020-10-13', NULL, 1, '2020-10-13', 3415235, '2aafawerw', NULL, 386, 2, 'administrator', '2020-10-13 04:57:36', '2020-10-14 07:41:53', '2020-10-14 07:41:53');
INSERT INTO `barang_masuk` VALUES (4, '2020-10-14', 'sdf', '2020-10-14', NULL, 14, '2020-10-14', 23423423, '4', NULL, 387, NULL, 'administrator', '2020-10-14 07:41:47', '2020-10-14 07:43:52', '2020-10-14 07:43:52');
INSERT INTO `barang_masuk` VALUES (5, '2020-10-14', 'sdf', '2020-10-14', NULL, 1, '2020-10-27', 44, 'fsdfgsdfg', NULL, 388, NULL, 'administrator', '2020-10-14 07:41:47', '2020-10-14 07:41:47', NULL);

-- ----------------------------
-- Table structure for biaya
-- ----------------------------
DROP TABLE IF EXISTS `biaya`;
CREATE TABLE `biaya`  (
  `biaya_id` bigint(20) NOT NULL,
  `biaya_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `biaya_nilai` decimal(15, 2) NULL DEFAULT NULL,
  `biaya_tampil` tinyint(255) NULL DEFAULT 0,
  `biaya_per` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`biaya_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dokter
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter`  (
  `dokter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dokter_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dokter_bidang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`dokter_id`) USING BTREE,
  INDEX `dokter_obat_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  CONSTRAINT `dokter_obat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES (1, 'Distinctio Est quae', 'Aut magni deserunt d', 'administrator', '2020-10-11 02:47:31', '2020-10-11 02:47:52', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jenis_barang
-- ----------------------------
DROP TABLE IF EXISTS `jenis_barang`;
CREATE TABLE `jenis_barang`  (
  `jenis_barang_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jenis_barang_uraian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`jenis_barang_id`) USING BTREE,
  INDEX `jenis_barang_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  CONSTRAINT `jenis_barang_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_barang
-- ----------------------------
INSERT INTO `jenis_barang` VALUES (1, 'Et aut error nihil q', 'administrator', '2020-10-07 01:24:24', '2020-10-11 02:40:48', NULL);
INSERT INTO `jenis_barang` VALUES (2, 'Et sint dicta neces', 'administrator', '2020-10-11 02:40:53', '2020-10-11 02:40:57', '2020-10-11 02:40:57');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`permission_id`, `model_type`, `pengguna_id`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_type`) USING BTREE,
  INDEX `izin_pengguna_fk`(`pengguna_id`) USING BTREE,
  CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `model_has_permissions_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
INSERT INTO `model_has_permissions` VALUES (1, 'App\\Models\\Pengguna', 'testes');
INSERT INTO `model_has_permissions` VALUES (2, 'App\\Models\\Pengguna', 'testes');
INSERT INTO `model_has_permissions` VALUES (3, 'App\\Models\\Pengguna', 'testes');
INSERT INTO `model_has_permissions` VALUES (4, 'App\\Models\\Pengguna', 'testes');
INSERT INTO `model_has_permissions` VALUES (16, 'App\\Models\\Pengguna', 'testes');
INSERT INTO `model_has_permissions` VALUES (17, 'App\\Models\\Pengguna', 'testes');
INSERT INTO `model_has_permissions` VALUES (18, 'App\\Models\\Pengguna', 'testes');

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`role_id`, `model_type`, `pengguna_id`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_type`) USING BTREE,
  INDEX `level_pengguna_fk`(`pengguna_id`) USING BTREE,
  CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `model_has_roles_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\Pengguna', 'administrator');
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\Pengguna', 'testes');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pbf
-- ----------------------------
DROP TABLE IF EXISTS `pbf`;
CREATE TABLE `pbf`  (
  `pbf_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pbf_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pbf_alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pbf_kontak` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pbf_id`) USING BTREE,
  INDEX `supplier_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  CONSTRAINT `supplier_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pbf
-- ----------------------------
INSERT INTO `pbf` VALUES (1, 'At non veniam quis', 'Commodo vero in pers', 'Eum rerum nulla ex e', 'administrator', '2020-10-07 01:51:02', '2020-10-11 02:12:08', NULL);
INSERT INTO `pbf` VALUES (2, 'Cum possimus delect', 'Tempora quia do rati', 'Pariatur Molestiae', 'administrator', '2020-10-07 01:51:49', '2020-10-11 02:12:16', NULL);

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna`  (
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengguna_sandi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengguna_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pengguna_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('administrator', '$2y$10$x4jdMD9gGy17lLChhUxfU.o1Y./A9xp9WeR1sUtgkMo5aT1om.S6G', 'Administrator', NULL, NULL, '2020-10-07 06:55:27', NULL);
INSERT INTO `pengguna` VALUES ('testes', '$2y$10$iqPP5p7DcavMJAtqHhSTsOn9qV8qHcHoOtGfVMGdNn6yPb8uj3D0u', 'testes', NULL, '2020-10-10 10:22:09', '2020-10-10 10:22:09', NULL);

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan`  (
  `penjualan_id` bigint(255) NOT NULL,
  `penjualan_tanggal` date NULL DEFAULT NULL,
  `penjualan_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `dokter_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`penjualan_id`) USING BTREE,
  INDEX `penjualan_dokter_id_foreign`(`dokter_id`) USING BTREE,
  CONSTRAINT `penjualan_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`dokter_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for penjualan_biaya
-- ----------------------------
DROP TABLE IF EXISTS `penjualan_biaya`;
CREATE TABLE `penjualan_biaya`  (
  `penjualan_id` bigint(20) NOT NULL,
  `biaya_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya_nilai` decimal(15, 2) NOT NULL,
  `biaya_per` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `penjualan_biaya_penjualan_id_foreign`(`penjualan_id`) USING BTREE,
  CONSTRAINT `penjualan_biaya_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`penjualan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for penjualan_detail
-- ----------------------------
DROP TABLE IF EXISTS `penjualan_detail`;
CREATE TABLE `penjualan_detail`  (
  `penjualan_id` bigint(20) NOT NULL,
  `penjualan_resep` int(11) NULL DEFAULT NULL,
  `barang_id` bigint(20) NOT NULL,
  `barang_harga` decimal(15, 2) NOT NULL,
  `barang_satuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penjualan_qty` double NULL DEFAULT NULL,
  `penjualan_diskon` double NULL DEFAULT NULL,
  INDEX `penjualan_detail_penjualan_id_foreign`(`penjualan_id`) USING BTREE,
  CONSTRAINT `penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`penjualan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'dashboard', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (2, 'administrator', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (3, 'postingsstok', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (4, 'barangmasuk', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (5, 'cetak', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (6, 'laporanbarangmasuk', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (7, 'laporanpenjualan', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (8, 'laporanpenjualanbebas', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (9, 'laporanpenjualanresep', 'web', '2020-10-10 10:20:21', '2020-10-10 10:20:21');
INSERT INTO `permissions` VALUES (10, 'laporanstokbarang', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (11, 'datamaster', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (12, 'barang', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (13, 'dokter', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (14, 'jenisbarang', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (15, 'pbf', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (16, 'penjualan', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (17, 'bebas', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (18, 'resep', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (19, 'setup', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (20, 'biaya', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');
INSERT INTO `permissions` VALUES (21, 'pengguna', 'web', '2020-10-10 10:20:22', '2020-10-10 10:20:22');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'super-admin', 'web', '2019-04-24 03:38:59', '2019-04-24 03:38:59');
INSERT INTO `roles` VALUES (2, 'user', 'web', '2019-04-24 03:38:59', '2019-04-24 03:38:59');
INSERT INTO `roles` VALUES (3, 'guest', 'web', '2019-04-24 03:38:59', '2019-04-24 03:38:59');

SET FOREIGN_KEY_CHECKS = 1;
