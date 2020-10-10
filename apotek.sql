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

 Date: 10/10/2020 17:26:41
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
  `barang_satuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_stok_min` double NOT NULL DEFAULT 0,
  `barang_harga_jual` decimal(15, 2) NULL DEFAULT NULL,
  `barang_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_barang_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`barang_id`) USING BTREE,
  UNIQUE INDEX `namaBarang_UNIQUE`(`barang_nama`) USING BTREE,
  INDEX `barang_jenis_barang_id_foreign`(`jenis_barang_id`) USING BTREE,
  INDEX `barang_obat_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  CONSTRAINT `barang_jenis_barang_id_foreign` FOREIGN KEY (`jenis_barang_id`) REFERENCES `jenis_barang` (`jenis_barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_obat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 382 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES (1, 'Alleronsd', 'tablet', 10, 500.00, '-', 1, 'administrator', '2020-10-06 11:00:33', '2020-10-07 08:02:41', NULL);
INSERT INTO `barang` VALUES (3, 'Amoxan 500 mg', 'kapsul     ', 10, 5000.00, 'BSP', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (4, 'Amoxicillin 500 mg', 'tablet', 20, 750.00, 'MAS  /  KF', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (5, 'Amoxsan Sirup 60 ml', 'botol', 3, 32000.00, 'BSP', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (6, 'Asam mefenamat 500mg', 'tablet ', 20, 400.00, 'MAS  /  KF', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (7, 'Azithromycin 500mg', 'tablet', 10, 15000.00, 'KF', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (8, 'BDM Sirup 60 ml', 'botol ', 2, 54000.00, 'PV', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (9, 'Betadin Kumur 100 ml', 'botol ', 3, 16500.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (10, 'Betadin Solution 15 ml', 'botol ', 5, 14000.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (11, 'Betadin Solution 5ml', 'botol ', 5, 5000.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (12, 'Biocollagenta', 'kapsul', 10, 4500.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (13, 'Bioplacenton Gelly', 'tube', 5, 23000.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (14, 'Carmed 10%', 'tube', 5, 42000.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (15, 'Carmed Urea 20%', 'tube', 5, 54000.00, 'SST', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (16, 'Carmeson  4 mg', 'tablet', 10, 600.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (17, 'Cefat Sirup 125 mg', 'botol', 3, 60000.00, 'BSP', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (18, 'Cefixime 100 mg', 'kapsul', 10, 3250.00, 'Penta Valent', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (19, 'Cendo Xitrol TM', 'botol', 5, 40000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (20, 'Cerini Sirup', 'botol', 5, 55000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (21, 'Clanexy Sirup', 'botol', 3, 80000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (22, 'Clinoma', 'kapsul', 10, 2000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (23, 'Combantrin Sirup', 'botol', 3, 21500.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (24, 'Dehidralite 200 ml', 'botol', 5, 24000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (25, 'Diapet', 'tablet', 10, 650.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (26, 'Dohixat  100 mg', 'kapsul', 10, 750.00, 'PT MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (27, 'Elok 0,1% 5 gr', 'tube', 10, 65000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (28, 'Epexol Sirup 60ml', 'botol', 10, 25000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (29, 'Ery Sanbe Sirup', 'botol', 10, 33000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (30, 'Forcanox 100 mg', 'kapsul', 10, 30000.00, 'Penta Valen', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (31, 'Fungasol', 'tablet', 10, 8000.00, 'Penta Valen', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (32, 'Fungasol 10 gr 2%', 'tube', 10, 42500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (33, 'Gardasil Vaksin', 'spuit', 10, 850000.00, 'vaksin', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (34, 'Genalten 5% tidak dipakai ', 'tube', 10, 4000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (35, 'Gentamycin 5 gr 0,1 %', 'tube', 10, 3000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (36, 'Hot In Cream 120 gr', 'tube', 10, 24000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (37, 'Hot In Cream Aromatherapy 120 gr', 'tube', 10, 22000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (38, 'Inerson 15 gr', 'tube', 10, 99000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (39, 'Interhistin', 'tablet', 10, 1250.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (40, 'Kamolas Forte Sirup', 'botol', 10, 35000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (41, 'Kasa Steril (husada)', 'dus', 10, 15000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (42, 'Kasa Steril One Med', 'dus', 10, 15000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (43, 'Ketomed SS', 'botol', 10, 53000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (44, 'Ketokonazol  200 mg', 'tablet', 10, 500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (45, 'Kloderma 10 gr', 'tube', 10, 43500.00, 'PT SST', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (46, 'Lamodex 0,05%', 'tube', 10, 55000.00, 'PT Penta ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (47, 'Lansoprasole  30 mg', 'kapsul', 60, 3000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (48, 'Livron B Plex', 'tablet', 10, 400.00, 'PT MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (49, 'Loksin 1%', 'tube', 10, 91500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (50, 'Loran', 'tablet', 10, 7500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (51, 'Masker Biasa', 'buah', 10, 1000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (52, 'Medscab 30 gr', 'tube', 10, 95000.00, 'PT SST', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (53, 'Mefinal 500 mg', 'caplet', 10, 2000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (54, 'tidak dipakai Methyl Prednisolon  16 mg', 'tablet', 10, 1800.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (55, 'Miconazole 10 gr', 'tube', 10, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (56, 'Minyak Kayu Putih Cap Lang 30 ml', 'botol', 10, 15000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (57, 'Minyak Kayu Putih Cap Lang 60 ml', 'botol', 10, 25000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (58, 'Minyak Selada', 'botol', 10, 25000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (59, 'Mycoral  200 mg', 'tablet', 10, 5600.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (60, 'Mylanta', 'tablet', 10, 800.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (61, 'Mylanta Sirup 50 ml', 'botol', 10, 16000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (62, 'Na Cl 0,9%', 'botol', 10, 10000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (63, 'Neurobion Biasa', 'tablet', 10, 2200.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (64, 'Neurobion Forte', 'tablet', 10, 3800.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (65, 'Neurodex', 'tablet', 10, 900.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (66, 'Nomika', 'kapsul', 10, 8000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (67, 'Nucef', 'kapsul', 10, 28000.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (68, 'Panadol Extra', 'tablet', 10, 1250.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (69, 'Paracetamol Sirup 60 ml', 'botol', 10, 7000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (70, 'Pirotop 10 gr cream', 'tube', 3, 85000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (71, 'Rifabiotic 600 mg', 'kaplet', 10, 6000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:01', NULL);
INSERT INTO `barang` VALUES (72, 'Ponstan 500 mg', 'tablet', 10, 3500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (73, 'Qcef Sirup 125mg/5ml', 'botol', 10, 74000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (74, 'QV Cream 100 gr', 'tube', 1, 190000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (75, 'Rafacort', 'tablet', 10, 4700.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (76, 'Ranitidine', 'tablet', 10, 500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (77, 'Redoxon EFF', 'botol', 10, 44000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (78, 'Rohto TM', 'botol', 10, 15000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (79, 'Rydian', 'tablet', 10, 5800.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (80, 'Sabun Hijau / Holly', 'buah', 10, 7500.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (81, 'Sagestam 10gr', 'tube', 10, 17000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (83, 'Sanmol Drop', 'Botol', 10, 22000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (84, 'Sarung Tangan ( M )', 'pasang', 10, 1500.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (85, 'Scacid 10 gr', 'tube', 10, 52500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (86, 'Spuit 1 CC', 'buah', 10, 3000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (88, 'Spuit 3CC', 'buah', 10, 4000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (89, 'Stenirol 16', 'tablet', 10, 11000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (90, 'Tarivid Ofloxacin 400ml', 'tablet', 10, 26000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (91, 'Top Cort 10gr', 'tube', 10, 31500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (92, 'Topicare Cleanser', 'tube', 10, 85000.00, 'PT SST', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (93, 'Xidane', 'kapsul', 10, 11000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (94, 'Zibramax 500 mg', 'caplet', 10, 55000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (95, 'Acyclovir 400 mg', 'tablet', 10, 1500.00, 'PT MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (96, 'Diazink ', 'tablet', 10, 900.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (97, 'alcohol 70 persen  300 ml', 'botol', 2, 17000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (98, 'Metil prednisolon 8 mg', 'tablet', 10, 750.00, 'Nulab', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (99, 'Kasa Braja', 'box', 4, 10000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (100, 'ketoconazole 2% cr', 'tube', 5, 7000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (101, 'Alcohol 70 persen  100 ml', 'botol', 5, 5000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (102, 'Alcohol  70 persen   1000 ml', 'botol', 10, 38000.00, NULL, NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (103, 'Dermia', 'tube ', 5, 56000.00, 'Enseval', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (104, 'Rheutrex ', 'tablet ', 10, 8650.00, 'Enseval ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (105, 'Cetirizin  10  mg', 'tablet', 10, 650.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (107, 'Rheu Trex', 'tablet', 10, 9000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (108, 'Vicks Vaporub  10 gram', 'pot', 3, 0.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (109, 'Hansaplast kain', 'lembar', 10, 500.00, '--', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (110, 'Genalten  5% cream', 'tube', 1, 5000.00, 'MAS/ Mandiri', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (112, 'Cerini Syrup', 'botol', 3, 58000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (113, 'L-zinc ', 'botol', 10, 45000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (114, 'Buffect forte syrup', 'botol', 10, 33000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (115, 'Elkana syrup', 'botol', 10, 31000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (116, 'Balsem Geliga 40 g', 'pot', 3, 0.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (117, 'Balsam geliga 20 gram ', 'pot', 10, 0.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (118, 'Hydrocortison 2,5% ', 'tube', 10, 6000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (119, 'Indanox 300 mg', 'kapsul', 10, 9250.00, 'Penta Valen', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (120, 'griseofulvin 500 mg ', 'tablet', 10, 2500.00, 'PT MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (121, 'propanolol 40 mg', 'tablet', 10, 0.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (122, 'SC1', 'pot', 10, 90000.00, 'krim dr angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (123, 'SBL', 'pot', 10, 75000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (124, 'Serum WT', 'pot', 10, 90000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (125, 'W3', 'Pot', 10, 85000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (126, 'Oil Stretch Mark', 'botol', 10, 100000.00, 'krim dr angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (127, 'AC1', 'pot', 10, 85000.00, 'Krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (128, 'AG1', 'pot', 10, 85000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (129, 'AGx', 'pot', 10, 85000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (130, 'Axa mlm', 'pot', 10, 85000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (131, 'Tutul acne', 'pot', 10, 90000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (132, 'Viti cream', 'pot', 2, 125000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (133, 'Loratadine 10 mg ', 'tablet', 10, 750.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (134, 'Paket BHP Elektrokauter dengan EMLA', 'paket', 1, 80000.00, 'EMLA, kassa, sarung tangan, pemeliharaan alat', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (135, 'Paket BHP elektrokauter dengan pehakain injeksi', 'paket', 2, 50000.00, 'pehacain, spuit 1 cc, kassa, sarung tangan, pemeliharaan alat ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (136, 'BBIV ', 'pot', 10, 80000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (137, 'ALAT KAKI', 'piece', 1, 25000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (138, 'Pehacain ampul ', 'ampul ', 10, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (139, 'W1', 'pot', 10, 85000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (140, 'Hidra ', 'pot', 10, 60000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (141, 'moist', 'pot', 10, 85000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (142, 'SBW', 'pot', 10, 75000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (143, 'Sbgel ', 'pot', 10, 75000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (144, 'SBA', 'pot', 10, 75000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (145, 'SB axa', 'pot', 10, 80000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (146, 'SB pink ', 'pot', 10, 75000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (147, 'BBO2', 'pot', 10, 85000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (148, 'BBO2 tube', 'pot', 10, 100000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (149, 'Axa pg', 'pot', 10, 85000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (150, 'Eye Cream', 'pot', 10, 100000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (151, 'Neck Cream', 'pot', 10, 100000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (152, 'PIH', 'pot', 10, 85000.00, 'krim dr ANgel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (153, 'Manne Lotion', 'pot', 10, 85000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (154, 'CLW', 'pot', 10, 80000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (155, 'Sabun Batang', 'pot', 10, 80000.00, 'krim dr Angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (156, 'Sabun Foam', 'pot', 10, 60000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (157, 'Bedak Tabur', 'pot', 10, 100000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (158, 'Bedak Padat', 'pot', 10, 100000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (159, 'Serum pore', 'botol', 10, 60000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (160, 'serum Soft Lines', 'pot', 10, 300000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (161, 'Serum rambut', 'pot', 10, 100000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (162, 'lipgloss', 'krim dr Angel ', 10, 100000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (163, 'Body White', 'botol', 10, 130000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (164, 'Body Lotion', 'botol', 10, 85000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (165, 'serum Brightening', 'pot', 10, 110000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (166, 'Zinc dispersible', 'tablet', 10, 850.00, 'Kimia Farma ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (167, 'Flamicort', 'Vial', 2, 165000.00, 'vial ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (168, 'Opsite 9,5 x 8,5', 'lembar', 10, 30000.00, 'beli bebas', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (169, 'Opsite 6,5 x 5 ', 'lembar', 10, 15000.00, 'beli bebas', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (170, 'asam Salisilat', 'paten', 10, 3000.00, 'untuk racikan', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (171, 'Metil Prednisolon 16 mg', 'tablet', 10, 1800.00, 'PV', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (172, 'isotretinoin ', 'caps', 10, 7000.00, 'krim dr Angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (173, 'cefadroxil ', 'tablet', 10, 1900.00, 'Indofarma', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (174, 'KETRICIN 0.1 %salep', '72000', 1, 68500.00, 'up dewi farma', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (175, 'pot crem 5 gram', '-', 1, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (176, 'Hufagrip Batuk Pilek ', 'botol ', 1, 18500.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (177, 'Unicough Baby ', 'botol ', 1, 5250.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (178, 'Sanmol Tablet ', 'strip (isi 4)', 10, 1500.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (179, 'Hufagrip TMP ', 'botol ', 1, 15500.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (180, 'Hufagrip Pilek ', 'botol ', 1, 16500.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (181, 'Enterostop ', 'tablet ', 5, 750.00, 'beli bebas', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (182, 'Guanistrep ', 'botol ', 1, 6500.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (183, 'Vitacimin ', 'strip ', 1, 2000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (184, 'Laserin', 'botol ', 1, 11000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (185, 'Enervon C', 'strip ', 1, 6000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (186, 'Fatigon ', 'strip ', 1, 4000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (187, 'Listerin cair ', 'botol ', 1, 9000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (188, 'Antangin tablet ', 'strip ', 1, 3000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (189, 'Vicks formula 44 Dewasa/anak ', 'botol ', 1, 8000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (190, 'Mixagrip Flu ', 'strip ', 1, 2500.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (191, 'OBH combi dewasa', 'botol ', 1, 14000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (192, 'OBH Combi anak ', 'botol ', 1, 15500.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (193, 'Promag ', 'strip ', 1, 8000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (194, 'Procold ', 'strip ', 1, 4000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (195, 'Diatab ', 'strip ', 1, 3000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (196, 'Paratusin tablet ', 'strip ', 1, 15000.00, 'Jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (197, 'Minyak telon konicare ', 'botol ', 1, 15000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (198, 'antimo cair ', 'sachet ', 1, 1200.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (199, 'safe care', 'botol ', 1, 18000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (200, 'kapsul', 'kapsul ', 10, 500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (201, 'pot 5-15 gr', 'pot', 10, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (202, 'pot 30 gram keatas ', 'pot', 5, 10000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (203, 'Tolak angin cair', 'sachet ', 1, 3200.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (204, 'Combantrin Jeruk ', 'botol ', 1, 20000.00, 'jarum jati ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (205, 'Genoint salep Kulit', 'tube', 5, 6500.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (206, 'LCD 5%', 'racikan ', 100, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (207, 'Termisil Cream', 'tube', 1, 64000.00, 'PT AAM ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (208, 'Tremenza tablet', 'tablet', 1, 2500.00, 'beli luar', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (209, 'Allopurinol ', 'tablet', 10, 500.00, 'beli bebas', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (210, 'san-b-plex', 'botol', 1, 26000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (211, 'Acyclovir Cream', 'Tube', 10, 5600.00, 'KF', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (212, 'Erymed Cream', 'Tube', 1, 42000.00, 'SST', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (213, 'Mediklin gel', 'tube', 1, 61500.00, 'apotek sejahtera', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (214, 'Hair Grow Shampoo', 'botol', 1, 75000.00, 'Krim dr angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (215, 'serum glow (biru)', '120000', 1, 120000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (216, 'P-White', 'pot', 1, 110000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (217, 'P WHITE', '1', 1, 110000.00, 'STOK DR ANCELLA', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (218, 'BEKAS LUKA', '1', 1, 80000.00, 'DR ANCELLA', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (219, 'Renadinac ', 'tablet', 10, 1000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (220, 'Spasminal ', 'tablet', 10, 1000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (221, 'Farizol ', 'tablet', 10, 500.00, 'Apotek Mandiri ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (222, 'Govazol ', 'kapsul ', 1, 96000.00, 'Guardian ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (223, 'Nupeson Cream', 'tube', 1, 31500.00, 'Nulab', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (224, 'Tekasol 10 gram cream', 'tube', 1, 52500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (225, 'Maxiflon ', 'KAPLET', 1, 63500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (226, 'Paracetamol', 'strip', 1, 3000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (227, 'Sanmaag syrup', 'botol', 1, 35000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (228, 'Tracedol kaplet', 'kaplet', 10, 10000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (229, 'bedak salicyl', 'pcs', 1, 8000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (230, 'sulfur', '-', 0, 3000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (231, 'Abendazol 400 mg', 'tablet', 5, 2500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (232, 'Acanthe SPF 30', 'tube', 1, 92500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (233, 'Vitamin C IPI', 'botol', 10, 5000.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (234, 'Lameson 16 mg ', 'tablet ', 10, 10500.00, 'PV', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (235, 'soralen botol ', 'botol ', 10, 75000.00, 'racikan ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (236, 'SABUN BENGKOANG PURBASARI M. ZAITUN 90 G', 'PCS', 1, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (237, 'SABUN HERBORIST ZAITUN 80G', 'PCS', 1, 18000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (238, 'OILUM SOAP SKIN MOISTURIZING 85G', 'PCS', 1, 16500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (239, 'NIVEA SOAP CREME CARE 75G', 'PCS', 1, 7000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (240, 'clw biru', 'pcs', 1, 80000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (241, 'cefixime syrup ', 'botol ', 1, 24000.00, 'Enseval ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (242, 'Erythrin dry sirup ', 'botol ', 1, 65500.00, 'Enseval', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (243, 'Fungasol SS tidak dipakai', 'botol', 1, 102000.00, 'Guardian', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (244, 'Fuladic cream', 'tube', 1, 72500.00, 'Guardian ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (245, 'Natural Skin Bright CC Lightening Cream ', 'botol', 1, 90000.00, 'SDM', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (246, 'Beige Skin Bright CC Lightening Cream ', 'botol', 1, 90000.00, 'SDM', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (247, 'Kenalog in Ora Base', 'tube', 1, 70000.00, 'MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (248, 'Gragenta 0.1 %', 'tube', 10, 6800.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (249, 'solasic 500 mg', 'kaplet', 10, 500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (250, 'Indexon ', 'tablet ', 10, 1000.00, 'Interbat', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (251, 'Sedrofen Forte ', 'botol ', 1, 108000.00, 'Interbat ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (252, 'Sedrofen syrup ', 'botol ', 1, 80500.00, 'Interbat', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (253, 'IMBOOST FORCE', 'KAPLET', 10, 8000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (254, 'QV Body Lotion ', 'botol', 1, 200000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (255, 'CLABAT 500 MG', 'KAPLET', 10, 22000.00, 'Enseval', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (256, 'CLABAT DRY SYRUP', 'BOTOL', 1, 111000.00, 'Enseval', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (257, 'Cefat 500 mg', 'kapsul ', 10, 15000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (258, 'Fluconazole 150 mg ', 'kapsul ', 1, 30000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (259, 'Amoxan 250 mg ', 'kapsul', 1, 2500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (260, 'Herclov ', 'Kapsul', 1, 21000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (261, 'D-vit 100ml', 'botol', 1, 43000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (262, 'APIALLIS 100 mg', 'botol', 1, 48000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (263, 'Ciprofloxacin ', 'tablet', 10, 1000.00, 'beli bebas', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (264, 'Gabapentin 300mg', 'tablet', 10, 7500.00, 'Penta Valen', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (265, 'HISTRINE LEVO', 'TABLET', 10, 7500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (266, 'Vitacid 0.1  gram', 'tube', 2, 60500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (267, 'Refaquin 15 gr', 'tube', 1, 86500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (268, 'Benzolac - CL 10 gr', 'tube', 1, 42000.00, 'SST', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (269, 'Serum Gold', 'botol', 10, 120000.00, 'Krim dr.angel', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (270, 'Xidane Gel ', 'tube', 1, 105000.00, 'Penta Valent', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (271, 'LEVOFLOXACIN 500 MG', 'TABLET', 10, 2500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (272, 'Nivea', 'tube', 10, 50000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (273, 'Vitamin C 100 mg ', 'tablet', 10, 1000.00, 'Kimia Farma ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (274, 'Vitamin D 400 IU', 'kapsul ', 10, 2700.00, 'nature\'s boss', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (275, 'Masker Kolagen', 'Lembar', 10, 35000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (276, 'Coamoxiclav generik ', 'kapsul ', 10, 8000.00, 'Indofarma', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (277, 'Erytromisin sirup ', 'botol ', 1, 15000.00, 'Indofarma', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (278, 'Melanox ES cream 15 gram', 'tube', 1, 82500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (279, 'Medi-Klin TR gel', 'tube', 1, 55500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (280, 'cream O/W 1 gram', 'gram', 0, 2000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (281, 'CETIRIZINE HCL 60 ML', 'BOTOL', 1, 7500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (282, 'Krim O/W', '-', 100, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (283, 'lightening cream ', 'pot', 1, 90000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (284, 'Fungasol SS 2%', 'botol', 1, 106000.00, 'Penta Valen', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (285, 'spuit 5 cc Terumo', 'pcs', 0, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (286, 'coaltar per 1 gram', 'gram', 0, 2000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (287, 'Bedak Natural lightening', 'pot', 1, 95000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (288, 'Bedak Suntan Lightening', 'pot', 1, 95000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (289, 'H2 fair skin ', 'capsul ', 10, 7500.00, 'Enseval', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (290, 'Na Cl 100 cc', 'botol ', 1, 18000.00, ' -', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (291, 'spuit 10 cc ', 'spuit', 1, 5000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (292, 'Sunscreen Kids 35 gr', 'tube', 1, 100000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (293, 'Body Lotion M&amp;S Beauty Magnolia 250 ml', 'botol', 1, 140000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (294, 'Hyalumoist', 'pot', 10, 135000.00, 'SDM', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (295, 'Regrou forte 2%', 'botol', 1, 142000.00, 'SDM', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (296, 'Natrium diklofenak ', 'tablet ', 10, 750.00, 'Kimia farma', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (297, 'Vitamin C 50 mg ', 'tablet ', 10, 750.00, 'Kimia Farma ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (298, 'desoralen 1%', 'tetes', 10, 1000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (299, 'body lotion M & S 100 gram', 'tube', 1, 100000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (300, 'Prostacom', 'tablet', 10, 13000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (301, 'Ambeven ', 'tablet', 10, 1900.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (302, 'Body cream M&amp;S', 'pot', 2, 200000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (303, 'Deodorant', '-', 1, 125000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (304, 'Pot cream ', '-', 1, 10000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (305, 'asam folat 1 mg', 'tablet', 10, 1000.00, 'PT KF', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (306, 'Imboost syr', 'Botol', 2, 82000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (307, 'pirotop 5 gram ', 'tube', 1, 52000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (308, 'Tarivid 200 mg ( Ofloxacin ) ', 'tablet', 10, 12500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (309, 'Gel Glow', 'tube', 1, 90000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (310, 'Masker hijab', 'pcs', 10, 1000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (311, 'acdat cream asam fusidat', 'tube', 10, 13500.00, 'Mandiri', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (312, 'Peditox', 'botol', 1, 15000.00, 'PT MAS', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (313, 'Leomoxyl 500 mg', 'kapsul', 10, 4300.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (314, 'Body Wash M&amp;amp; S ', 'botol ', 10, 140000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (315, 'Vitamin B Kompleks', 'tablet', 10, 250.00, 'Kimia farma', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (316, 'Fucilex cr 5 gram', 'tube', 1, 14000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (317, 'Intifen 1 mg', 'tablet', 10, 5300.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (319, 'Clindamycin', 'kapsul', 50, 2000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (320, 'Itraconazole kapsul', 'kapsul', 10, 5500.00, 'DNR', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (321, 'Gentalex 5 gr', 'tube', 10, 5000.00, 'DNR', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (322, 'simvastatin 20 mg', 'tablet', 10, 1350.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (323, 'Paket Haji & Umrah', 'pack', 10, 250000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (324, 'Lemoxoyl sirup ', 'botol ', 10, 33000.00, 'Interbat', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (325, 'ELOX 10 GR CREAM', 'TUBE', 2, 99000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (326, 'Paket Operasi', '-', 10, 350000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (327, 'parasol gel 20 gr', 'tube', 1, 30000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (328, 'amitriptylin 25 mg', 'tablet', 10, 750.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (329, 'Cetirizine 5mg/ml 60 ml (Indofarma)', 'botol', 1, 13500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (330, 'Seloxy Premium', 'Kapsul', 10, 11000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (331, 'anti iritasi ', 'pot', 10, 35000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (332, 'Doxycycline', 'kapsul', 200, 900.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (333, 'Serum white &amp; glow', 'botol', 1, 200000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (334, 'Serum Vitamin C', 'botol', 10, 100000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (335, 'ALERFED TABLET', 'TABLET', 10, 2500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (336, 'ALERFED 60 ML', 'BOTOL', 1, 36000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (337, 'Serum FODERA 10 ml', 'tube', 1, 100000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (338, 'Multi-gyn', 'tube', 2, 250000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (339, 'kertas puyer ', 'lembar ', 10, 200.00, 'kertas puyer', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (340, 'Kloderma Oint 10 gr', 'tube', 10, 43500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (341, 'Gramax', 'tablet', 10, 68000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (342, 'Askamex', 'tablet', 10, 600.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (343, 'CTM', 'tablet', 10, 500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (344, 'eye serum', 'botol', 10, 100000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (345, 'CURACIL 500 MG IJEKSI', 'ML / CC', 1, 7000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (346, 'PROLIQ', 'BIJI', 10, 12000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (347, 'Capuera', 'botol', 10, 100000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (348, 'glucose', 'sendok ', 10, 0.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (349, 'Serum Whitening immortality', '1', 10, 200000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (350, 'Masker Byou', 'pcs', 10, 25000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (351, 'masker mata', 'pcs', 10, 25000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (352, 'white & glow cream imortal', 'pot', 10, 200000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (353, 'Calcindo', 'tablet', 10, 5500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (354, 'Scacid cr 30 gr', 'tube', 10, 100000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (355, 'serum komedo ', 'botol ', 1, 60000.00, 'krim dr angel ', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (356, 'Serum B you', 'botol', 10, 60000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (357, 'Metronidazol ', 'tablet', 10, 500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (358, 'Metil prednisolon 4 mg', 'tablet', 10, 600.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (359, 'ProLQ 1 botol ', 'botol ', 1, 350000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (360, 'Qcef ', 'kapsul ', 10, 15000.00, 'Penta Valent', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (361, 'prosentials ', 'kapsul ', 10, 8500.00, 'AAM', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (362, 'Bedak Padat Pulvus Hydro', '-', 10, 95000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (363, 'Hand Lotion ', 'tube', 10, 125000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (364, 'SPF mangoosten ', 'pot', 10, 75000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (365, 'Whitening body lotion malam ', 'botol', 10, 125000.00, '\'-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (366, 'Whitening body lotion pagi ', 'botol', 10, 125000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (367, 'Sea Quill Vit C 1000 mg ', 'tablet', 10, 9500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (368, 'Vit d 1000 iu ', 'tablet', 10, 4500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (369, 'Nutrikrim', 'pot', 10, 60000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (370, 'Lanakeloid', 'tube', 10, 165000.00, 'AAM', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (371, 'masker kain', 'biji', 32, 8000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (372, 'Vitamin C 500 mg', 'biji', 10, 3000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (373, 'Immortal Hand Gel', '-', 10, 30000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (374, 'Trisela syr 60 ml', 'botol', 10, 9000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (375, 'calcium lactate', 'tablet', 10, 500.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (376, 'gentamisin salep mata ', 'tube', 10, 50000.00, 'Penta', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (377, 'Vitamin c 250 mg', 'Tablet', 10, 600.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (378, 'vitamin c 250 box', 'box', 10, 60000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (379, 'Alcohol 95 %', 'botol', 10, 15000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (380, 'SC2', 'POT', 10, 90000.00, '-', NULL, 'administrator', '2020-10-06 11:00:33', '2020-10-07 15:48:02', NULL);
INSERT INTO `barang` VALUES (381, 'asdf', 'asdf', 2, 14124124.00, 'Keterangan', 1, 'administrator', '2020-10-07 08:02:49', '2020-10-07 08:02:49', NULL);

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk`  (
  `barang_masuk_id` bigint(20) NOT NULL,
  `barang_masuk_tanggal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_faktur` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_jatuh_tempo` date NULL DEFAULT NULL,
  `barang_masuk_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pbf_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`barang_masuk_id`) USING BTREE,
  INDEX `barang_masuk_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  INDEX `barang_masuk_pbf_id_foreign`(`pbf_id`) USING BTREE,
  CONSTRAINT `barang_masuk_pbf_id_foreign` FOREIGN KEY (`pbf_id`) REFERENCES `pbf` (`pbf_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_masuk_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for barang_masuk_detail
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk_detail`;
CREATE TABLE `barang_masuk_detail`  (
  `barang_masuk_id` bigint(20) NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `barang_masuk_kadaluarsa` date NULL DEFAULT NULL,
  `barang_masuk_harga` decimal(15, 0) NULL DEFAULT NULL,
  `barang_masuk_jumlah` double NULL DEFAULT NULL,
  PRIMARY KEY (`barang_masuk_id`, `barang_id`) USING BTREE,
  INDEX `barang_masuk_barang_idx`(`barang_id`) USING BTREE,
  CONSTRAINT `barang_masuk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_masuk_detail_barang_masuk_id_foreign` FOREIGN KEY (`barang_masuk_id`) REFERENCES `barang_masuk` (`barang_masuk_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biaya
-- ----------------------------
DROP TABLE IF EXISTS `biaya`;
CREATE TABLE `biaya`  (
  `biaya_id` bigint(20) NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_barang
-- ----------------------------
INSERT INTO `jenis_barang` VALUES (1, 'asdfasdf', 'administrator', '2020-10-07 01:24:24', '2020-10-07 01:27:30', NULL);

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
INSERT INTO `model_has_permissions` VALUES (3, 'App\\Models\\Pengguna', 'user');
INSERT INTO `model_has_permissions` VALUES (7, 'App\\Models\\Pengguna', 'user');
INSERT INTO `model_has_permissions` VALUES (8, 'App\\Models\\Pengguna', 'user');
INSERT INTO `model_has_permissions` VALUES (9, 'App\\Models\\Pengguna', 'user');
INSERT INTO `model_has_permissions` VALUES (10, 'App\\Models\\Pengguna', 'user');

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
INSERT INTO `model_has_roles` VALUES (1, 'App\\Pengguna', 'administrator');
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\Pengguna', 'user');

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
  `konsinyasi` tinyint(255) NULL DEFAULT NULL,
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
INSERT INTO `pbf` VALUES (1, 'Nama', 'Alamat', 'Kontak', 1, 'administrator', '2020-10-07 01:51:02', '2020-10-07 01:51:02', NULL);
INSERT INTO `pbf` VALUES (2, 'aaaa', 'ffff', 'afaaa', NULL, 'administrator', '2020-10-07 01:51:49', '2020-10-07 01:52:01', NULL);

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
INSERT INTO `pengguna` VALUES ('user', '$2y$10$fTkSVnlZLzxGcDhQwZSsqOMlYR5.Kv4yzMD/7mZ/mujejIC/wAgI2', 'user', NULL, '2020-10-07 06:37:17', '2020-10-07 06:43:32', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (3, 'dashboard', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (4, 'administrator', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (5, 'postingsstok', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (6, 'cetak', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (7, 'datamaster', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (8, 'barang', 'web', '2020-10-07 06:34:25', '2020-10-07 15:02:35');
INSERT INTO `permissions` VALUES (9, 'jenisbarang', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (10, 'pbf', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (11, 'investasi', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (12, 'setup', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (13, 'biaya', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');
INSERT INTO `permissions` VALUES (14, 'pengguna', 'web', '2020-10-07 06:34:25', '2020-10-07 06:34:25');

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

-- ----------------------------
-- Triggers structure for table barang_masuk_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `t_Barang_masuk_det_BEFORE_INSERT`;
delimiter ;;
CREATE TRIGGER `t_Barang_masuk_det_BEFORE_INSERT` BEFORE INSERT ON `barang_masuk_detail` FOR EACH ROW BEGIN

    select konsinyasiSupplier into @konsi from m_supplier where namaSupplier=new.namaSupplier;
    set new.konsinyasiSupplier = @konsi;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table barang_masuk_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `t_Barang_masuk_det_AFTER_INSERT`;
delimiter ;;
CREATE TRIGGER `t_Barang_masuk_det_AFTER_INSERT` AFTER INSERT ON `barang_masuk_detail` FOR EACH ROW BEGIN
	/*declare i int unsigned default 0;
	while i < new.jmlBarang do
		insert into t_stok_Barang(idStokBarang, idBarang, tglKadaluarsaBarang, idBarangMasuk, hargaBeliBarang, namaSupplier, konsinyasiSupplier, namaPabrik) 
        values (
        concat(date_format(new.tglBarangMasuk, '%Y%d%m'), concat(date_format(sysdate(6), '%h%i%s%f')), i), 
        new.idBarang, 
        new.tglKadaluarsaBarang,
        new.idBarangMasuk, 
        new.hargaBeliBarang, 
        new.namaSupplier, 
		new.konsinyasiSupplier,
        new.namaPabrik);
		set i=i+1;
	end while;
    update m_Barang set hargaBeliBarang=new.hargaBeliBarang where idBarang=new.idBarang;*/
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
