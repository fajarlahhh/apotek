/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : apotek

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 22/10/2020 07:50:14
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
  `barang_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_barang_id` bigint(20) NULL DEFAULT NULL,
  `pbf_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `jenis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `satuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `harga` decimal(15, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`barang_id`) USING BTREE,
  INDEX `barang_jenis_barang_id_foreign`(`jenis_barang_id`) USING BTREE,
  INDEX `barang_obat_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  INDEX `barang_pbf_id_foreign`(`pbf_id`) USING BTREE,
  CONSTRAINT `barang_jenis_barang_id_foreign` FOREIGN KEY (`jenis_barang_id`) REFERENCES `jenis_barang` (`jenis_barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_obat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_pbf_id_foreign` FOREIGN KEY (`pbf_id`) REFERENCES `pbf` (`pbf_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 640 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES (417, 'Aspilet chewable', 10, NULL, 1, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:55:49', NULL, 'Acetylsalicilyc 100 mg', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (418, 'Mini aspi tablet', 10, NULL, 2, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:20:03', NULL, 'acetylsalicilyc 80 mg', NULL, NULL);
INSERT INTO `barang` VALUES (419, 'Acyclovir generik', 10, NULL, 3, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Acyclovir 400 mg', 'tablet', 1500.00);
INSERT INTO `barang` VALUES (420, 'Lagesil sirup', 10, NULL, 4, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'al hidroksida, simeticon', 'botol', 36000.00);
INSERT INTO `barang` VALUES (421, 'Alkohol 70% 100 ml botol', 10, NULL, 5, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:20:05', NULL, 'Alkohol 70%', NULL, NULL);
INSERT INTO `barang` VALUES (422, 'Alkohol 70% 300 ml botol', 10, NULL, 5, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Alkohol 70%', 'botol', 17500.00);
INSERT INTO `barang` VALUES (423, 'Nobor ', 10, NULL, 6, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Allylestrenol ', 'tablet', 6000.00);
INSERT INTO `barang` VALUES (424, 'Multigyn active gel ', 10, NULL, 7, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Aloe vera ', 'botol', 267000.00);
INSERT INTO `barang` VALUES (425, 'Epexol tablet', 10, NULL, 8, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Ambroxol', 'tablet', 1500.00);
INSERT INTO `barang` VALUES (426, 'Epexol sirup', 10, NULL, 8, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Ambroxol', 'botol', 26000.00);
INSERT INTO `barang` VALUES (427, 'Epexol drop ', 10, NULL, 8, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Ambroxol', 'botol', 56000.00);
INSERT INTO `barang` VALUES (428, 'Amlodipine 10 mg ', 10, NULL, 9, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Amlodipine 10 mg', 'tablet', 1500.00);
INSERT INTO `barang` VALUES (429, 'Cardipin 10 mg', 10, NULL, 9, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Amlodipine 10 mg', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (430, 'Amoxan 500 mg', 10, NULL, 10, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Amoxicilin 500 mg', 'kapsul', 5000.00);
INSERT INTO `barang` VALUES (431, 'Leomoxyl 500 mg', 10, NULL, 10, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Amoxicilin 500 mg', 'kapsul', 5000.00);
INSERT INTO `barang` VALUES (432, 'Amoxan drop ', 10, NULL, 11, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Amoxicillin 100 mg', 'botol', 34000.00);
INSERT INTO `barang` VALUES (433, 'Amoxan sirup ', 10, NULL, 12, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Amoxicillin 125 mg', 'botol', 34000.00);
INSERT INTO `barang` VALUES (434, 'Amoxan Forte sirup', 10, NULL, 13, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Amoxicillin 250 mg', 'botol', 48000.00);
INSERT INTO `barang` VALUES (435, 'Antasida DOEN tablet', 10, NULL, 14, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-19 13:19:45', NULL, 'Antasida', 'tablet', 300.00);
INSERT INTO `barang` VALUES (437, 'Lagesil sirup', 10, NULL, 15, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'antasida sirup', 'botol', 37000.00);
INSERT INTO `barang` VALUES (438, 'Anelat', 10, NULL, 16, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'asam folat 1 mg', 'tablet', 500.00);
INSERT INTO `barang` VALUES (439, 'Mefenamic Acid ', 10, NULL, 17, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Asam mefenamat 500 mg', 'tablet', 500.00);
INSERT INTO `barang` VALUES (440, 'Plasminex', 10, NULL, 18, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Asam tranexamat', 'tablet', 4000.00);
INSERT INTO `barang` VALUES (441, 'Depakene sirup', 10, NULL, 19, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Asam valproat', 'botol', 235000.00);
INSERT INTO `barang` VALUES (442, 'Xidane', 10, NULL, 20, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Astaxanthin', 'kapsul', 11500.00);
INSERT INTO `barang` VALUES (443, 'Dermia cream 15 gr', 10, NULL, 21, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Astaxanthine', 'tube', 63000.00);
INSERT INTO `barang` VALUES (444, 'Xidane gel', 10, NULL, 22, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'astaxanthine gel', 'tube', 110000.00);
INSERT INTO `barang` VALUES (445, 'Azitromisin Nulab', 10, NULL, 23, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Azitromisin 500 mg', 'tablet', 15000.00);
INSERT INTO `barang` VALUES (446, 'Batugin Elixir 300 ml', 10, NULL, 24, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Batugin', 'botol', 52000.00);
INSERT INTO `barang` VALUES (447, 'Paratusin tablet', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Batuk pilek', 'strip', 15000.00);
INSERT INTO `barang` VALUES (448, 'Decolsin tablet', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Batuk pilek', 'strip', 4000.00);
INSERT INTO `barang` VALUES (449, 'Flucadex', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Batuk pilek', 'kaplet', 1000.00);
INSERT INTO `barang` VALUES (450, 'Dextral tablet ', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'batuk pilek ', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (451, 'Actifed merah Batuk pilek sirup4', 10, NULL, 27, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:54:02', NULL, 'Batuk pilek sirup', 'botol', 62000.00);
INSERT INTO `barang` VALUES (452, 'OBH combi dewasa jahe ', 10, NULL, 27, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Batuk pilek sirup', 'botol', 14000.00);
INSERT INTO `barang` VALUES (453, 'Skinbright Lightening CC cream Beige', 10, NULL, 28, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Bedak', 'tube', 90000.00);
INSERT INTO `barang` VALUES (454, 'Skinbright Lightening CC cream Normal', 10, NULL, 28, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Bedak', 'tube', 90000.00);
INSERT INTO `barang` VALUES (455, 'Betadine sol 5 ml', 10, NULL, 29, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'betadine', 'botol', 7000.00);
INSERT INTO `barang` VALUES (456, 'Betason krim 5 gr', 10, NULL, 30, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Betametason', 'tube', 12000.00);
INSERT INTO `barang` VALUES (457, 'Betason N krim 5 gr ', 10, NULL, 31, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'betametason neomisin', 'tube', 20000.00);
INSERT INTO `barang` VALUES (458, 'Mucohexin sirup', 10, NULL, 32, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Bromhexine', 'botol', 25000.00);
INSERT INTO `barang` VALUES (459, 'Miravon', 10, NULL, 32, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Bromhexine', 'tablet', 500.00);
INSERT INTO `barang` VALUES (460, 'Na Cl 0,9% 1 Liter', 10, NULL, 33, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cairan infus', 'botol', 10000.00);
INSERT INTO `barang` VALUES (461, 'Qcef sirup ', 10, NULL, 34, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefadroxil 125 mg', 'botol', 73000.00);
INSERT INTO `barang` VALUES (462, 'Cefadroxil generik', 10, NULL, 35, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefadroxil 500 mg', 'kapsul', 3000.00);
INSERT INTO `barang` VALUES (463, 'Qcef 500 mg', 10, NULL, 35, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefadroxil 500 mg', 'kapsul', 15000.00);
INSERT INTO `barang` VALUES (464, 'Cefat 500 mg', 10, NULL, 35, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefadroxil 500 mg', 'kapsul', 15000.00);
INSERT INTO `barang` VALUES (465, 'Cefco ', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:20:09', NULL, 'Cefixime 100 mg', NULL, NULL);
INSERT INTO `barang` VALUES (466, 'Cefixime 100 mg Hexa', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefixime 100 mg', 'kapsul', 2000.00);
INSERT INTO `barang` VALUES (467, 'Cefixime 100 mg KF', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefixime 100 mg', 'kapsul', 2000.00);
INSERT INTO `barang` VALUES (468, 'Cefixime 100 mg Nulab ', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefixime 100 mg', 'kapsul', 3200.00);
INSERT INTO `barang` VALUES (469, 'Helixim 100 mg', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefixime 100 mg', 'kaplet', 2000.00);
INSERT INTO `barang` VALUES (470, 'Sporetik 100 mg', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefixime 100 mg', 'kapsul', 29000.00);
INSERT INTO `barang` VALUES (471, 'Inbacef 200 mg ', 10, NULL, 37, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cefixime 200 mg ', 'kaplet', 29000.00);
INSERT INTO `barang` VALUES (472, 'tekasol oint ', 10, NULL, 38, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Centella asiatica', 'tube', 55000.00);
INSERT INTO `barang` VALUES (473, 'Cetirizine Hexa', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cetirizin', 'tablet', 500.00);
INSERT INTO `barang` VALUES (474, 'Cetirizine Nulab', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cetirizin', 'tablet', 500.00);
INSERT INTO `barang` VALUES (475, 'Cerini tablet', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cetirizin', 'kapsul', 5000.00);
INSERT INTO `barang` VALUES (476, 'Cerini drop ', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cetirizin', 'botol', 94000.00);
INSERT INTO `barang` VALUES (477, 'Alerzin sirup', 10, NULL, 40, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cetirizin sirup', 'botol', 8000.00);
INSERT INTO `barang` VALUES (478, 'Erlamycetin salep mata', 10, NULL, 41, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Chlorampenicol', 'tube', 10000.00);
INSERT INTO `barang` VALUES (479, 'Erlamycetin tetes telinga ', 10, NULL, 41, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'chlorampenicol', 'botol', 11000.00);
INSERT INTO `barang` VALUES (480, 'Alleron ', 10, NULL, 42, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Chlorpheniramine maleat', 'kapsul', 300.00);
INSERT INTO `barang` VALUES (481, 'Ciprofloxacin generik', 10, NULL, 43, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Ciprofloxacin', 'tablet', 500.00);
INSERT INTO `barang` VALUES (482, 'Clinoma', 10, NULL, 44, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Clindamisin', 'Kapsul', 2000.00);
INSERT INTO `barang` VALUES (483, 'Indanox 300 mg', 10, NULL, 45, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Clindamisin 300 mg ', 'kapsul', 10000.00);
INSERT INTO `barang` VALUES (484, 'Mediklin gel 15 gr ', 10, NULL, 46, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Clindamisin krim', 'tube', 35000.00);
INSERT INTO `barang` VALUES (485, 'Provula', 10, NULL, 47, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Clomifene citrate', 'tablet', 23000.00);
INSERT INTO `barang` VALUES (486, 'Dexyclav', 10, NULL, 48, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Coamoxiclav', 'kaplet', 18000.00);
INSERT INTO `barang` VALUES (487, 'Dexyclav sirup', 10, NULL, 49, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Coamoxiclav 125 mg', 'botol', 82000.00);
INSERT INTO `barang` VALUES (488, 'Sanprima', 10, NULL, 50, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cotrimoxazole', 'tablet', 1500.00);
INSERT INTO `barang` VALUES (489, 'Sanprima sirup', 10, NULL, 50, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cotrimoxazole', 'botol', 38000.00);
INSERT INTO `barang` VALUES (490, 'Heptasan', 10, NULL, 51, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:20:14', NULL, 'Cyproheptadine', NULL, NULL);
INSERT INTO `barang` VALUES (491, 'Pronicy', 10, NULL, 51, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Cyproheptadine', 'kaplet', 400.00);
INSERT INTO `barang` VALUES (492, 'Inerson krim 15 gr ', 10, NULL, 52, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'desoksimetasone', 'tube', 108000.00);
INSERT INTO `barang` VALUES (493, 'Nupeson krim 10 gr ', 10, NULL, 52, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'desoksimetasone', 'tube', 33000.00);
INSERT INTO `barang` VALUES (494, 'Dextamine', 10, NULL, 53, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Dexametasone + CTM', 'kaplet', 2500.00);
INSERT INTO `barang` VALUES (495, 'Polofar plus', 10, NULL, 53, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Dexametasone + CTM', 'kaplet', 300.00);
INSERT INTO `barang` VALUES (496, 'BDM sirup', 10, NULL, 53, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Dexametasone + CTM', 'botol', 40000.00);
INSERT INTO `barang` VALUES (497, 'Cortidex', 10, NULL, 54, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Dexametasone 0,5 mg', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (498, 'Confortin cream 20 gr tube', 10, NULL, 55, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Diaper krim ', 'tube', 40000.00);
INSERT INTO `barang` VALUES (499, 'Doksisiklin 100 mg', 10, NULL, 56, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Doksisiklin 100 mg', 'kapsul', 1000.00);
INSERT INTO `barang` VALUES (500, 'Vosedon sirup', 10, NULL, 57, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Domperidone', 'botol', 40000.00);
INSERT INTO `barang` VALUES (501, 'Vometa drop', 10, NULL, 57, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Domperidone', 'botol', 56500.00);
INSERT INTO `barang` VALUES (502, 'Duphaston', 10, NULL, 58, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'dydrogesterone 10 mg', 'tablet', 24000.00);
INSERT INTO `barang` VALUES (503, 'Erysanbe 500 mg', 10, NULL, 59, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Eritromisin ', 'kaplet', 4000.00);
INSERT INTO `barang` VALUES (504, 'Erysanbe sirup', 10, NULL, 60, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Eritromisin 200 mg', 'botol', 33000.00);
INSERT INTO `barang` VALUES (505, 'Erymed krim 20 gr', 10, NULL, 61, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'eritromisin krim', 'tube', 43000.00);
INSERT INTO `barang` VALUES (506, 'Fluconazole 150 mg generik', 10, NULL, 62, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Fluconazole 150 mg', 'kapsul', 24000.00);
INSERT INTO `barang` VALUES (507, 'Furosemide generik', 10, NULL, 63, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Furosemide 40 mg', 'tablet', 250.00);
INSERT INTO `barang` VALUES (508, 'Sagestam 10  gr salep kulit', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'gentamisin cream', 'tube', 19000.00);
INSERT INTO `barang` VALUES (509, 'Sagestam salep mata 3,5 gr', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'gentamisin cream', 'tube', 55000.00);
INSERT INTO `barang` VALUES (510, 'Gentalex Cream', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'gentamisin cream', 'tube', 5000.00);
INSERT INTO `barang` VALUES (511, 'Genalten cream', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'gentamisin cream', 'tube', 5000.00);
INSERT INTO `barang` VALUES (512, 'Sagestam tetes mata/telinga', 10, NULL, 65, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'gentamisin drop', 'botol', 43000.00);
INSERT INTO `barang` VALUES (513, 'Griseofulvin 500 mg ', 10, NULL, 66, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Griseofulvin', 'tablet', 2500.00);
INSERT INTO `barang` VALUES (514, 'Bufect sirup 100 mg', 10, NULL, 67, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Ibuprofen sirup', 'botol', 22000.00);
INSERT INTO `barang` VALUES (515, 'Bufect forte sirup 200 mg', 10, NULL, 67, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:45', NULL, 'Ibuprofen sirup', 'botol', 31000.00);
INSERT INTO `barang` VALUES (516, 'Kassa steril Husada', 10, NULL, 68, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:46', NULL, 'kassa', 'box', 10000.00);
INSERT INTO `barang` VALUES (517, 'Ketoconazole tab generik', 10, NULL, 69, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:46', NULL, 'Ketoconazole', 'box', 2000.00);
INSERT INTO `barang` VALUES (518, 'Fungasol', 10, NULL, 69, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:46', NULL, 'Ketoconazole', 'tablet', 7500.00);
INSERT INTO `barang` VALUES (519, 'Mycoral ', 10, NULL, 69, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:46', NULL, 'Ketoconazole', 'tablet', 6000.00);
INSERT INTO `barang` VALUES (520, 'Formyco krim 10 gr', 10, NULL, 70, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:46', NULL, 'Ketoconazole cream', 'tube', 28000.00);
INSERT INTO `barang` VALUES (521, 'Fungasol krim 10 gr', 10, NULL, 70, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:46', NULL, 'Ketoconazole cream', 'tube', 40000.00);
INSERT INTO `barang` VALUES (522, 'Fungasol SS 2%', 10, NULL, 71, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-19 13:19:46', NULL, 'Ketoconazole shampoo', 'botol', 115000.00);
INSERT INTO `barang` VALUES (523, 'Kloderma 10 gr krim', 10, NULL, 72, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Klobetasol propionat', 'tube', 47000.00);
INSERT INTO `barang` VALUES (524, 'Kondom sutra', 10, NULL, 73, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:18', NULL, 'kondom', NULL, NULL);
INSERT INTO `barang` VALUES (525, 'Interlac drop', 10, NULL, 74, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'lactoB', 'botol', 350000.00);
INSERT INTO `barang` VALUES (526, 'L-Bio', 10, NULL, 75, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Lactobacillus', 'sachet', 11000.00);
INSERT INTO `barang` VALUES (527, 'Dulcolactol sirup', 10, NULL, 76, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Lactulose', 'botol', 88000.00);
INSERT INTO `barang` VALUES (528, 'Dobrizol', 10, NULL, 77, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Lanzoprasole', 'tablet', 3000.00);
INSERT INTO `barang` VALUES (529, 'Lodia', 10, NULL, 78, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Loperamide', 'tablet', 1500.00);
INSERT INTO `barang` VALUES (530, 'Loran', 10, NULL, 79, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Loratadin', 'tablet', 8000.00);
INSERT INTO `barang` VALUES (531, 'Loratadine generik', 10, NULL, 79, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Loratadin', 'tablet', 500.00);
INSERT INTO `barang` VALUES (532, 'Alloris tablet', 10, NULL, 79, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Loratadin', 'tablet', 7000.00);
INSERT INTO `barang` VALUES (533, 'Sanoskin Melladerm Plus', 10, NULL, 80, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Luka bakar', 'botol', 258000.00);
INSERT INTO `barang` VALUES (534, 'Interhistin', 10, NULL, 81, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Mebhidrolin', 'tablet', 1500.00);
INSERT INTO `barang` VALUES (535, 'Spasminal', 10, NULL, 82, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metampiron belladona', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (536, 'Eraphage', 10, NULL, 83, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metformin 500 mg', 'tablet', 3000.00);
INSERT INTO `barang` VALUES (537, 'Metformin generik', 10, NULL, 83, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metformin 500 mg', 'tablet', 300.00);
INSERT INTO `barang` VALUES (538, 'Stenirol 16mg', 10, NULL, 84, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metil Prednisolon 16 mg', 'tablet', 11500.00);
INSERT INTO `barang` VALUES (539, 'Metil Prednisolon 16 mg', 10, NULL, 84, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metil Prednisolon 16 mg', 'tablet', 1500.00);
INSERT INTO `barang` VALUES (540, 'Metil Prednisolon 4 mg', 10, NULL, 85, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metil Prednisolon 4 mg', 'tablet', 600.00);
INSERT INTO `barang` VALUES (541, 'Metil Prednisolon 8 mg ', 10, NULL, 86, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metil Prednisolon 8 mg', 'tablet', 800.00);
INSERT INTO `barang` VALUES (542, 'Damaben drop', 10, NULL, 87, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metoclopramide', 'botol', 21000.00);
INSERT INTO `barang` VALUES (543, 'Damaben sirup', 10, NULL, 87, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metoclopramide', 'botol', 15000.00);
INSERT INTO `barang` VALUES (544, 'Rheu-trex 2,5 mg', 10, NULL, 88, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metotreksat', 'tablet', 8500.00);
INSERT INTO `barang` VALUES (545, 'Metronidazole 500 mg KF', 10, NULL, 89, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metronidazole 500 mg', 'tablet', 500.00);
INSERT INTO `barang` VALUES (546, 'Metronidazole 500 mg Novapharin', 10, NULL, 89, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Metronidazole 500 mg', 'tablet', 500.00);
INSERT INTO `barang` VALUES (547, 'Miconazole krim generik 5 gr', 10, NULL, 90, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'miconazole', 'tube', 5000.00);
INSERT INTO `barang` VALUES (548, 'Microlax gel', 10, NULL, 91, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'microlax', 'tube', 28000.00);
INSERT INTO `barang` VALUES (549, 'Mycrogest 200 mg ', 10, NULL, 92, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Micronised Progesteron', 'kapsul', 33000.00);
INSERT INTO `barang` VALUES (550, 'Mycrogest 100 mg ', 10, NULL, 92, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Micronised Progesteron', 'kapsul', 18000.00);
INSERT INTO `barang` VALUES (551, 'Minyak kayu putih caplang 60 ml', 10, NULL, 93, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'minyak kayu putih', 'botol', 27000.00);
INSERT INTO `barang` VALUES (552, 'Minyak kayu putih caplang 120 ml', 10, NULL, 93, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'minyak kayu putih', 'botol', 50000.00);
INSERT INTO `barang` VALUES (553, 'Loksin 10 gr', 10, NULL, 94, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'mometason furoate cream', 'tube', 100000.00);
INSERT INTO `barang` VALUES (554, 'Elox krim 5 gr', 10, NULL, 94, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'mometason furoate cream', 'tube', 68000.00);
INSERT INTO `barang` VALUES (555, 'H2 fair skin', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'tablet', 9000.00);
INSERT INTO `barang` VALUES (556, 'Nulacta', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'kapsul', 7000.00);
INSERT INTO `barang` VALUES (557, 'Caviplex', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'tablet', 700.00);
INSERT INTO `barang` VALUES (558, 'Obdhamin', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'tablet', 6500.00);
INSERT INTO `barang` VALUES (559, 'Folamil Genio', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'kapsul', 5500.00);
INSERT INTO `barang` VALUES (560, 'Inlacin 100 mg', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'kapsul', 7500.00);
INSERT INTO `barang` VALUES (561, 'Sanvita B sirup ', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 20000.00);
INSERT INTO `barang` VALUES (562, 'Muveron drop ', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 43000.00);
INSERT INTO `barang` VALUES (563, 'Apialis sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 49000.00);
INSERT INTO `barang` VALUES (564, 'Apialis drop', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 60000.00);
INSERT INTO `barang` VALUES (565, 'Muveron sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 63000.00);
INSERT INTO `barang` VALUES (566, 'San B Plex drop', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 25000.00);
INSERT INTO `barang` VALUES (567, 'Zamel sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 56000.00);
INSERT INTO `barang` VALUES (568, 'Dhavit Sirup ', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'tablet', 48000.00);
INSERT INTO `barang` VALUES (569, 'Elkana sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Multivitamin', 'botol', 35000.00);
INSERT INTO `barang` VALUES (570, 'Pirotop 5 gr ', 10, NULL, 96, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Mupirocin cream', 'tube', 57000.00);
INSERT INTO `barang` VALUES (571, 'Pirotop 10 gr', 10, NULL, 96, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Mupirocin cream', 'tube', 89000.00);
INSERT INTO `barang` VALUES (572, 'Natrium diklofenak 50 mg', 10, NULL, 97, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Natrium diklofenak', 'tablet', 2000.00);
INSERT INTO `barang` VALUES (573, 'Nymiko drop', 10, NULL, 98, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Nistatin', 'botol', 50000.00);
INSERT INTO `barang` VALUES (574, 'Norestil 2', 10, NULL, 99, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Norethisterone ', 'tablet', 6000.00);
INSERT INTO `barang` VALUES (575, 'Enterostop', 10, NULL, 100, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'obat diare', 'strip ', 45000.00);
INSERT INTO `barang` VALUES (576, 'Lokev', 10, NULL, 101, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Omeprazole 20 mg', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (577, 'Omeprazole 20 mg', 10, NULL, 101, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Omeprazole 20 mg', 'kapsul', 1000.00);
INSERT INTO `barang` VALUES (578, 'Ondansentron Generik', 10, NULL, 102, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Ondansentron', 'tablet', 2000.00);
INSERT INTO `barang` VALUES (579, 'Dehidralit', 10, NULL, 103, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Oralit', 'botol', 23000.00);
INSERT INTO `barang` VALUES (580, 'Renalite', 10, NULL, 103, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Oralit', 'botol', 23000.00);
INSERT INTO `barang` VALUES (581, 'Sanmol tablet', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol', 'tablet', 500.00);
INSERT INTO `barang` VALUES (582, 'Paracetamol 500 mg generik', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol', 'tablet', 400.00);
INSERT INTO `barang` VALUES (583, 'Nufadol', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol', 'kaplet', 500.00);
INSERT INTO `barang` VALUES (584, 'Pamol 125 mg supp', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol', 'supp', 20000.00);
INSERT INTO `barang` VALUES (585, 'Pamol 250 mg supp', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol', 'supp', 29000.00);
INSERT INTO `barang` VALUES (586, 'Sanmol sirup 120 mg', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol', 'botol', 18000.00);
INSERT INTO `barang` VALUES (587, 'Sanmol drop 60 mg', 10, NULL, 105, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol sirup', 'botol', 24000.00);
INSERT INTO `barang` VALUES (588, 'Kamolas Forte 250 mg sirup', 10, NULL, 105, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol sirup', 'botol', 39000.00);
INSERT INTO `barang` VALUES (589, 'Paracetamol sirup 120 mg', 10, NULL, 105, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Paracetamol sirup', 'botol', 35000.00);
INSERT INTO `barang` VALUES (590, 'QV cream ', 10, NULL, 106, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Pelembab', 'botol', 197000.00);
INSERT INTO `barang` VALUES (591, 'Medscab', 10, NULL, 107, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Permethrin 5%', 'tube', 98000.00);
INSERT INTO `barang` VALUES (592, 'Scacid cream 10 gr', 10, NULL, 107, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Permethrin 5%', 'tube', 57000.00);
INSERT INTO `barang` VALUES (593, 'Combantrin sirup', 10, NULL, 108, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Pirantel pamoat sirup', 'botol', 21000.00);
INSERT INTO `barang` VALUES (594, 'Combantrin 125 mg tablet', 10, NULL, 109, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Pirantel pamoat tablet', 'strip', 17000.00);
INSERT INTO `barang` VALUES (595, 'Combantrin 250 mg tablet', 10, NULL, 109, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:23', NULL, 'Pirantel pamoat tablet', NULL, NULL);
INSERT INTO `barang` VALUES (596, 'Piroxicam 10 mg generik', 10, NULL, 110, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:24', NULL, 'Piroxicam 10 mg', NULL, NULL);
INSERT INTO `barang` VALUES (597, 'Miradene 20 mg', 10, NULL, 111, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Piroxicam 20 mg', 'kapsul', 1000.00);
INSERT INTO `barang` VALUES (598, 'Novaxicam', 10, NULL, 111, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:25', NULL, 'Piroxicam 20 mg', NULL, NULL);
INSERT INTO `barang` VALUES (599, 'Bioplacenton 15 gr', 10, NULL, 112, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Placenta ekstrak', 'tube', 23000.00);
INSERT INTO `barang` VALUES (600, 'chilli plast plester coklat', 10, NULL, 113, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:26', NULL, 'plester', NULL, NULL);
INSERT INTO `barang` VALUES (601, 'Hansaplast', 10, NULL, 113, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'plester', 'lembar', 500.00);
INSERT INTO `barang` VALUES (602, 'Hansaplast rol kain', 10, NULL, 113, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:26', NULL, 'plester', NULL, NULL);
INSERT INTO `barang` VALUES (603, 'Meptin mini', 10, NULL, 114, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Procaterol HCl', 'tablet', 4000.00);
INSERT INTO `barang` VALUES (604, 'Ranitidine Hcl', 10, NULL, 115, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Ranitidine', 'tablet', 300.00);
INSERT INTO `barang` VALUES (605, 'Topicare Cleanser', 10, NULL, 116, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Sabun cuci muka', 'botol', 90000.00);
INSERT INTO `barang` VALUES (606, 'Salbutamol 2 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:28', NULL, 'Salbutamol', NULL, NULL);
INSERT INTO `barang` VALUES (607, 'Salbutamol 2 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Salbutamol', 'tablet', 150.00);
INSERT INTO `barang` VALUES (608, 'Salbutamol 4 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:29', NULL, 'Salbutamol', NULL, NULL);
INSERT INTO `barang` VALUES (609, 'Salbutamol 4 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:22:05', NULL, 'Salbutamol', NULL, NULL);
INSERT INTO `barang` VALUES (610, 'Ventolin nebul', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Salbutamol', 'unit', 14000.00);
INSERT INTO `barang` VALUES (611, 'Velutine inhalation sol', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:30', NULL, 'Salbutamol', NULL, NULL);
INSERT INTO `barang` VALUES (612, 'Teosal', 10, NULL, 118, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Salbutamol + teofilin', 'tablet', 400.00);
INSERT INTO `barang` VALUES (613, 'Gramax 100 mg', 10, NULL, 119, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Sildenafil citrate', 'kapsul', 71000.00);
INSERT INTO `barang` VALUES (614, 'Bye-bye fever anak ', 10, NULL, 120, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'tempel panas ', 'strip', 12000.00);
INSERT INTO `barang` VALUES (615, 'Bye-bye fever bayi', 10, NULL, 120, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'tempel panas ', 'strip', 9000.00);
INSERT INTO `barang` VALUES (616, 'Tes hamil Onemed', 10, NULL, 121, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'tes kehamilan', 'piece', 5000.00);
INSERT INTO `barang` VALUES (617, 'Tes hamil Quick & sure', 10, NULL, 121, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:34', NULL, 'tes kehamilan', NULL, NULL);
INSERT INTO `barang` VALUES (618, 'Tes hamil Steril', 10, NULL, 121, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:35', NULL, 'tes kehamilan', NULL, NULL);
INSERT INTO `barang` VALUES (619, 'Cendoxitrol Tetes Mata', 10, NULL, 122, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Tetes mata', 'botol', 41000.00);
INSERT INTO `barang` VALUES (620, 'Thiamycin 1000', 10, NULL, 123, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Thiampenicol', 'kaplet', 12000.00);
INSERT INTO `barang` VALUES (621, 'Thiamycin 500', 10, NULL, 123, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Thiampenicol', 'kaplet', 7000.00);
INSERT INTO `barang` VALUES (622, 'Vitacid 0,1%', 10, NULL, 124, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Tretinoin acid 0,1%', 'tube', 66000.00);
INSERT INTO `barang` VALUES (623, 'Rafacort tab', 10, NULL, 125, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Triamcinolone acetonide', 'tablet', 5000.00);
INSERT INTO `barang` VALUES (624, 'Bufacomb cream in ora base', 10, NULL, 125, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Triamcinolone acetonide', 'tube', 25000.00);
INSERT INTO `barang` VALUES (625, 'Carmed 10% krim 40 gr', 10, NULL, 126, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'urea 10%', 'tube', 44000.00);
INSERT INTO `barang` VALUES (626, 'Carmed 20% krim 40 gr', 10, NULL, 127, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'urea 20%', 'tube', 56000.00);
INSERT INTO `barang` VALUES (627, 'Nuce ', 10, NULL, 128, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Vit C 500 + Collagen ', 'kapsul', 5000.00);
INSERT INTO `barang` VALUES (628, 'Vomil B6', 10, NULL, 129, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Vitamin B6 ', 'tablet', 4000.00);
INSERT INTO `barang` VALUES (629, 'Vit B complex IPI', 10, NULL, 130, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Vitamin Bkompleks', 'botol', 6000.00);
INSERT INTO `barang` VALUES (630, 'Vit C IPI ', 10, NULL, 131, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'vitamin C', 'botol', 6000.00);
INSERT INTO `barang` VALUES (631, 'Vitamin C 250 mg ', 10, NULL, 132, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Vitamin C 250 mg', 'tablet', 500.00);
INSERT INTO `barang` VALUES (632, 'Vitamin C 50 mg', 10, NULL, 133, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:20:41', NULL, 'Vitamin C 50 mg', 'tablet', 500.00);
INSERT INTO `barang` VALUES (633, 'Sanbe C 500 mg', 10, NULL, 134, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Vitamin C 500 mg', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (634, 'Prove D3 tablet', 10, NULL, 135, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Vitamin D 1000 IU ', 'kaplet', 4000.00);
INSERT INTO `barang` VALUES (635, 'Prove D3 drop', 10, NULL, 135, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Vitamin D 1000 IU ', 'botol', 297000.00);
INSERT INTO `barang` VALUES (636, 'Zinc 20 mg Kimia farma', 10, NULL, 136, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Zinc', 'tablet', 1000.00);
INSERT INTO `barang` VALUES (637, 'L-zinc sirup', 10, NULL, 137, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Zinc sirup', 'botol', 50000.00);
INSERT INTO `barang` VALUES (638, 'Zinckid Sirup', 10, NULL, 137, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-19 13:19:46', NULL, 'Zinc sirup', 'botol', 41000.00);
INSERT INTO `barang` VALUES (639, 'asdf', 1, 'asdfasd', NULL, NULL, 'administrator', '2020-10-21 16:58:48', '2020-10-21 16:58:48', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk`  (
  `barang_masuk_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
INSERT INTO `barang_masuk` VALUES ('202010210210388667030', '2020-10-21', 'asdf', '2020-10-21', NULL, 3, '2020-10-21', 50000, '10000', NULL, 417, 5, 'administrator', '2020-10-21 14:20:38', '2020-10-21 14:20:38', NULL);
INSERT INTO `barang_masuk` VALUES ('202010210410229009310', '2020-10-21', '10000', '2020-10-21', '-', 1, '2020-10-21', 5000, '0000', NULL, 417, NULL, 'administrator', '2020-10-21 16:22:22', '2020-10-21 16:22:22', NULL);
INSERT INTO `barang_masuk` VALUES ('202010210410433339070', '2020-10-21', '2222', '2020-10-21', '-', 2, '2020-10-21', 60000, '0', NULL, 417, NULL, 'administrator', '2020-10-21 16:22:43', '2020-10-21 16:22:43', NULL);

-- ----------------------------
-- Table structure for biaya
-- ----------------------------
DROP TABLE IF EXISTS `biaya`;
CREATE TABLE `biaya`  (
  `biaya_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `biaya_nilai` decimal(15, 2) NULL DEFAULT NULL,
  `biaya_tampil` tinyint(255) NULL DEFAULT 0,
  `biaya_satuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `biaya_per` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`biaya_nama`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biaya
-- ----------------------------
INSERT INTO `biaya` VALUES ('Biaya Admin', 2000.00, 1, 'Rupiah', 'Resep', NULL, '2020-10-21 07:34:49', '2020-10-21 07:37:07', NULL);
INSERT INTO `biaya` VALUES ('Biaya Racikan', 1000.00, 1, 'Rupiah', '10 Obat Pertama', NULL, '2020-10-21 07:34:49', '2020-10-21 07:37:03', NULL);
INSERT INTO `biaya` VALUES ('Persentase Dokter', 10.00, 1, '%', 'Obat', NULL, '2020-10-21 07:34:49', '2020-10-21 07:34:49', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES (1, 'dr. Nurhandini Eka Dewi SpA', 'dokter Anak', 'administrator', '2020-10-21 16:40:55', '2020-10-21 16:41:10', NULL);
INSERT INTO `dokter` VALUES (2, 'dr. Andrew C Taufiq SpOG', 'dokter Obgyn', 'administrator', '2020-10-21 16:41:45', '2020-10-21 16:41:45', NULL);
INSERT INTO `dokter` VALUES (3, 'dr Angelica Vanini W Taufiq SpKK', 'Dokter Kulit', 'administrator', '2020-10-21 16:42:49', '2020-10-21 16:42:49', NULL);
INSERT INTO `dokter` VALUES (4, 'dr Ancella Soenardi SpKK', 'Kulit', 'administrator', '2020-10-21 16:43:02', '2020-10-21 16:43:02', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_barang
-- ----------------------------
INSERT INTO `jenis_barang` VALUES (1, 'Acetylsalicilyc 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (2, 'acetylsalicilyc 80 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (3, 'Acyclovir 400 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (4, 'al hidroksida, simeticon', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (5, 'Alkohol 70%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (6, 'Allylestrenol ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (7, 'Aloe vera ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (8, 'Ambroxol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (9, 'Amlodipine 10 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (10, 'Amoxicilin 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (11, 'Amoxicillin 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (12, 'Amoxicillin 125 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (13, 'Amoxicillin 250 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (14, 'Antasida', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (15, 'antasida sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (16, 'asam folat 1 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (17, 'Asam mefenamat 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (18, 'Asam tranexamat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (19, 'Asam valproat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (20, 'Astaxanthin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (21, 'Astaxanthine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (22, 'astaxanthine gel', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (23, 'Azitromisin 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (24, 'Batugin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (25, 'Batuk pilek', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (27, 'Batuk pilek sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (28, 'Bedak', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (29, 'betadine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (30, 'Betametason', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (31, 'betametason neomisin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (32, 'Bromhexine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (33, 'Cairan infus', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (34, 'Cefadroxil 125 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (35, 'Cefadroxil 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (36, 'Cefixime 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (37, 'Cefixime 200 mg ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (38, 'Centella asiatica', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (39, 'Cetirizin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (40, 'Cetirizin sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (41, 'Chlorampenicol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (42, 'Chlorpheniramine maleat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (43, 'Ciprofloxacin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (44, 'Clindamisin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (45, 'Clindamisin 300 mg ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (46, 'Clindamisin krim', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (47, 'Clomifene citrate', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (48, 'Coamoxiclav', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (49, 'Coamoxiclav 125 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (50, 'Cotrimoxazole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (51, 'Cyproheptadine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (52, 'desoksimetasone', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (53, 'Dexametasone + CTM', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (54, 'Dexametasone 0,5 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (55, 'Diaper krim ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (56, 'Doksisiklin 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (57, 'Domperidone', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (58, 'dydrogesterone 10 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (59, 'Eritromisin ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (60, 'Eritromisin 200 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (61, 'eritromisin krim', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (62, 'Fluconazole 150 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (63, 'Furosemide 40 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (64, 'gentamisin cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (65, 'gentamisin drop', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (66, 'Griseofulvin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (67, 'Ibuprofen sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (68, 'kassa', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (69, 'Ketoconazole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (70, 'Ketoconazole cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (71, 'Ketoconazole shampoo', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (72, 'Klobetasol propionat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (73, 'kondom', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (74, 'lactoB', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (75, 'Lactobacillus', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (76, 'Lactulose', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (77, 'Lanzoprasole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (78, 'Loperamide', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (79, 'Loratadin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (80, 'Luka bakar', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (81, 'Mebhidrolin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (82, 'Metampiron belladona', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (83, 'Metformin 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (84, 'Metil Prednisolon 16 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (85, 'Metil Prednisolon 4 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (86, 'Metil Prednisolon 8 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (87, 'Metoclopramide', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (88, 'Metotreksat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (89, 'Metronidazole 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (90, 'miconazole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (91, 'microlax', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (92, 'Micronised Progesteron', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (93, 'minyak kayu putih', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (94, 'mometason furoate cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (95, 'Multivitamin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (96, 'Mupirocin cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (97, 'Natrium diklofenak', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (98, 'Nistatin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (99, 'Norethisterone ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (100, 'obat diare', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (101, 'Omeprazole 20 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (102, 'Ondansentron', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (103, 'Oralit', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (104, 'Paracetamol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (105, 'Paracetamol sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (106, 'Pelembab', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (107, 'Permethrin 5%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (108, 'Pirantel pamoat sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (109, 'Pirantel pamoat tablet', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (110, 'Piroxicam 10 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (111, 'Piroxicam 20 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (112, 'Placenta ekstrak', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (113, 'plester', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (114, 'Procaterol HCl', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (115, 'Ranitidine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (116, 'Sabun cuci muka', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (117, 'Salbutamol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (118, 'Salbutamol + teofilin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (119, 'Sildenafil citrate', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (120, 'tempel panas ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (121, 'tes kehamilan', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (122, 'Tetes mata', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (123, 'Thiampenicol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (124, 'Tretinoin acid 0,1%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (125, 'Triamcinolone acetonide', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (126, 'urea 10%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (127, 'urea 20%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (128, 'Vit C 500 + Collagen ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (129, 'Vitamin B6 ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (130, 'Vitamin Bkompleks', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (131, 'vitamin C', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (132, 'Vitamin C 250 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (133, 'Vitamin C 50 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (134, 'Vitamin C 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (135, 'Vitamin D 1000 IU ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (136, 'Zinc', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (137, 'Zinc sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pbf
-- ----------------------------
INSERT INTO `pbf` VALUES (3, 'Darya Varia', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (4, 'Mersifarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (5, 'Kimia Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (6, 'Lapi', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (7, 'Guardian', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (8, 'Infion', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (9, 'Sanbe', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (10, 'Hexpharm', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (11, 'Sampharindo Perdana', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (12, 'Ifars', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (13, 'Abbott', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (14, 'Interbat', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (15, 'Nulab OGB', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (16, 'Prafa', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (17, 'Medifarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (18, 'Graha farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (19, 'Molex Ayus', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (20, 'GlaxoSmith Kline', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (21, 'Combiphar', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (22, 'SDM', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (23, 'Mundipharma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (24, 'Sanbe ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (25, 'Hexpharm/KF', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (26, 'Nulab ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (27, 'Saka Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (28, 'Erela', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (29, 'Mega Esa Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (30, 'Novapharin', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (31, 'Rama Emerald ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (32, 'Dexa Medica', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (33, 'Kalbe', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (34, 'Phapros', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (35, 'Solas', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (36, 'Molex', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (37, 'Husada', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (38, 'Boehringer', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (39, 'Caprifarmindo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (40, 'Pharos', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (41, 'Cap Lang', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (42, 'Cap Lang ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (43, 'Novell', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (44, 'Fahrenheit', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (45, 'Mahakam Beta Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (46, 'Johnson Johnson', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (47, 'Otsuka', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (48, 'First medipharma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (49, 'GSK', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (50, 'Erlimpex', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (51, 'Onemed', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (52, 'Quick & sure', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (53, 'Steril', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (54, 'Cendo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (55, 'Bufa ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (56, 'Nulab', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (57, 'IPI', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (58, 'Enseval', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (59, 'Indofarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (60, 'Terumo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pbf` VALUES (61, 'Brataco', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);

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
  `penjualan_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penjualan_tanggal` date NULL DEFAULT NULL,
  `penjualan_jenis` enum('Bebas','Resep') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penjualan_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penjualan_tagihan` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_racikan` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_admin` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_dokter` double NULL DEFAULT NULL,
  `penjualan_biaya_dokter` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_bayar` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_sisa` decimal(15, 2) NULL DEFAULT NULL,
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
-- Records of penjualan
-- ----------------------------
INSERT INTO `penjualan` VALUES ('20201021011057021348', '2020-10-21', 'Bebas', NULL, 18150.00, 3000.00, 2000.00, 10, NULL, 50000.00, 29850.00, NULL, 'administrator', '2020-10-21 13:37:57', '2020-10-21 13:37:57', NULL);
INSERT INTO `penjualan` VALUES ('20201021021011051952', '2020-10-21', 'Bebas', NULL, 3000.00, NULL, NULL, NULL, NULL, 10000.00, 7000.00, NULL, 'administrator', '2020-10-21 14:21:11', '2020-10-21 14:21:11', NULL);

-- ----------------------------
-- Table structure for penjualan_detail
-- ----------------------------
DROP TABLE IF EXISTS `penjualan_detail`;
CREATE TABLE `penjualan_detail`  (
  `penjualan_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penjualan_detail_resep` int(11) NULL DEFAULT NULL,
  `penjualan_detail_resep_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_id` bigint(20) NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `satuan_harga` decimal(15, 2) NOT NULL,
  `penjualan_detail_tambahan` decimal(15, 2) NULL DEFAULT NULL,
  `satuan_rasio_dari_utama` double NOT NULL,
  `penjualan_detail_qty` double NOT NULL,
  `penjualan_detail_diskon` double NULL DEFAULT NULL,
  INDEX `penjualan_detail_penjualan_id_foreign`(`penjualan_id`) USING BTREE,
  CONSTRAINT `penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`penjualan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penjualan_detail
-- ----------------------------
INSERT INTO `penjualan_detail` VALUES ('20201021011057021348', 0, NULL, 477, 'botol', 8000.00, 800.00, 1, 1, 0);
INSERT INTO `penjualan_detail` VALUES ('20201021011057021348', 1, NULL, 419, 'tablet', 1500.00, 150.00, 1, 1, 0);
INSERT INTO `penjualan_detail` VALUES ('20201021011057021348', 1, NULL, 455, 'botol', 7000.00, 700.00, 1, 1, 0);
INSERT INTO `penjualan_detail` VALUES ('20201021021011051952', NULL, NULL, 417, 'tablet', 1000.00, NULL, 1, 3, 0);

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

-- ----------------------------
-- Table structure for satuan
-- ----------------------------
DROP TABLE IF EXISTS `satuan`;
CREATE TABLE `satuan`  (
  `barang_id` bigint(20) NOT NULL,
  `satuan_id` int(11) NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `satuan_harga` decimal(15, 2) NOT NULL,
  `satuan_rasio_dari_utama` double NOT NULL,
  `utama` tinyint(255) NOT NULL,
  INDEX `satuan_barang_id_foreign`(`barang_id`) USING BTREE,
  CONSTRAINT `satuan_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of satuan
-- ----------------------------
INSERT INTO `satuan` VALUES (417, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (419, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (420, 0, 'botol', 36000.00, 1, 1);
INSERT INTO `satuan` VALUES (422, 0, 'botol', 17500.00, 1, 1);
INSERT INTO `satuan` VALUES (423, 0, 'tablet', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (424, 0, 'botol', 267000.00, 1, 1);
INSERT INTO `satuan` VALUES (425, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (426, 0, 'botol', 26000.00, 1, 1);
INSERT INTO `satuan` VALUES (427, 0, 'botol', 56000.00, 1, 1);
INSERT INTO `satuan` VALUES (428, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (429, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (430, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (431, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (432, 0, 'botol', 34000.00, 1, 1);
INSERT INTO `satuan` VALUES (433, 0, 'botol', 34000.00, 1, 1);
INSERT INTO `satuan` VALUES (434, 0, 'botol', 48000.00, 1, 1);
INSERT INTO `satuan` VALUES (435, 0, 'tablet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (437, 0, 'botol', 37000.00, 1, 1);
INSERT INTO `satuan` VALUES (438, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (439, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (440, 0, 'tablet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (441, 0, 'botol', 235000.00, 1, 1);
INSERT INTO `satuan` VALUES (442, 0, 'kapsul', 11500.00, 1, 1);
INSERT INTO `satuan` VALUES (443, 0, 'tube', 63000.00, 1, 1);
INSERT INTO `satuan` VALUES (444, 0, 'tube', 110000.00, 1, 1);
INSERT INTO `satuan` VALUES (445, 0, 'tablet', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (446, 0, 'botol', 52000.00, 1, 1);
INSERT INTO `satuan` VALUES (447, 0, 'strip', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (448, 0, 'strip', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (449, 0, 'kaplet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (450, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (452, 0, 'botol', 14000.00, 1, 1);
INSERT INTO `satuan` VALUES (453, 0, 'tube', 90000.00, 1, 1);
INSERT INTO `satuan` VALUES (454, 0, 'tube', 90000.00, 1, 1);
INSERT INTO `satuan` VALUES (455, 0, 'botol', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (456, 0, 'tube', 12000.00, 1, 1);
INSERT INTO `satuan` VALUES (457, 0, 'tube', 20000.00, 1, 1);
INSERT INTO `satuan` VALUES (458, 0, 'botol', 25000.00, 1, 1);
INSERT INTO `satuan` VALUES (459, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (460, 0, 'botol', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (461, 0, 'botol', 73000.00, 1, 1);
INSERT INTO `satuan` VALUES (462, 0, 'kapsul', 3000.00, 1, 1);
INSERT INTO `satuan` VALUES (463, 0, 'kapsul', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (464, 0, 'kapsul', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (466, 0, 'kapsul', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (467, 0, 'kapsul', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (468, 0, 'kapsul', 3200.00, 1, 1);
INSERT INTO `satuan` VALUES (469, 0, 'kaplet', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (470, 0, 'kapsul', 29000.00, 1, 1);
INSERT INTO `satuan` VALUES (471, 0, 'kaplet', 29000.00, 1, 1);
INSERT INTO `satuan` VALUES (472, 0, 'tube', 55000.00, 1, 1);
INSERT INTO `satuan` VALUES (473, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (474, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (475, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (476, 0, 'botol', 94000.00, 1, 1);
INSERT INTO `satuan` VALUES (477, 0, 'botol', 8000.00, 1, 1);
INSERT INTO `satuan` VALUES (478, 0, 'tube', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (479, 0, 'botol', 11000.00, 1, 1);
INSERT INTO `satuan` VALUES (480, 0, 'kapsul', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (481, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (482, 0, 'Kapsul', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (483, 0, 'kapsul', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (484, 0, 'tube', 35000.00, 1, 1);
INSERT INTO `satuan` VALUES (485, 0, 'tablet', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (486, 0, 'kaplet', 18000.00, 1, 1);
INSERT INTO `satuan` VALUES (487, 0, 'botol', 82000.00, 1, 1);
INSERT INTO `satuan` VALUES (488, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (489, 0, 'botol', 38000.00, 1, 1);
INSERT INTO `satuan` VALUES (491, 0, 'kaplet', 400.00, 1, 1);
INSERT INTO `satuan` VALUES (492, 0, 'tube', 108000.00, 1, 1);
INSERT INTO `satuan` VALUES (493, 0, 'tube', 33000.00, 1, 1);
INSERT INTO `satuan` VALUES (494, 0, 'kaplet', 2500.00, 1, 1);
INSERT INTO `satuan` VALUES (495, 0, 'kaplet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (496, 0, 'botol', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (497, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (498, 0, 'tube', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (499, 0, 'kapsul', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (500, 0, 'botol', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (501, 0, 'botol', 56500.00, 1, 1);
INSERT INTO `satuan` VALUES (502, 0, 'tablet', 24000.00, 1, 1);
INSERT INTO `satuan` VALUES (503, 0, 'kaplet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (504, 0, 'botol', 33000.00, 1, 1);
INSERT INTO `satuan` VALUES (505, 0, 'tube', 43000.00, 1, 1);
INSERT INTO `satuan` VALUES (506, 0, 'kapsul', 24000.00, 1, 1);
INSERT INTO `satuan` VALUES (507, 0, 'tablet', 250.00, 1, 1);
INSERT INTO `satuan` VALUES (508, 0, 'tube', 19000.00, 1, 1);
INSERT INTO `satuan` VALUES (510, 0, 'tube', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (511, 0, 'tube', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (512, 0, 'botol', 43000.00, 1, 1);
INSERT INTO `satuan` VALUES (513, 0, 'tablet', 2500.00, 1, 1);
INSERT INTO `satuan` VALUES (514, 0, 'botol', 22000.00, 1, 1);
INSERT INTO `satuan` VALUES (515, 0, 'botol', 31000.00, 1, 1);
INSERT INTO `satuan` VALUES (516, 0, 'box', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (517, 0, 'box', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (518, 0, 'tablet', 7500.00, 1, 1);
INSERT INTO `satuan` VALUES (519, 0, 'tablet', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (520, 0, 'tube', 28000.00, 1, 1);
INSERT INTO `satuan` VALUES (521, 0, 'tube', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (522, 0, 'botol', 115000.00, 1, 1);
INSERT INTO `satuan` VALUES (523, 0, 'tube', 47000.00, 1, 1);
INSERT INTO `satuan` VALUES (525, 0, 'botol', 350000.00, 1, 1);
INSERT INTO `satuan` VALUES (526, 0, 'sachet', 11000.00, 1, 1);
INSERT INTO `satuan` VALUES (527, 0, 'botol', 88000.00, 1, 1);
INSERT INTO `satuan` VALUES (528, 0, 'tablet', 3000.00, 1, 1);
INSERT INTO `satuan` VALUES (529, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (530, 0, 'tablet', 8000.00, 1, 1);
INSERT INTO `satuan` VALUES (531, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (532, 0, 'tablet', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (533, 0, 'botol', 258000.00, 1, 1);
INSERT INTO `satuan` VALUES (534, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (535, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (536, 0, 'tablet', 3000.00, 1, 1);
INSERT INTO `satuan` VALUES (537, 0, 'tablet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (538, 0, 'tablet', 11500.00, 1, 1);
INSERT INTO `satuan` VALUES (539, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (540, 0, 'tablet', 600.00, 1, 1);
INSERT INTO `satuan` VALUES (541, 0, 'tablet', 800.00, 1, 1);
INSERT INTO `satuan` VALUES (542, 0, 'botol', 21000.00, 1, 1);
INSERT INTO `satuan` VALUES (543, 0, 'botol', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (544, 0, 'tablet', 8500.00, 1, 1);
INSERT INTO `satuan` VALUES (545, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (546, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (547, 0, 'tube', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (548, 0, 'tube', 28000.00, 1, 1);
INSERT INTO `satuan` VALUES (549, 0, 'kapsul', 33000.00, 1, 1);
INSERT INTO `satuan` VALUES (550, 0, 'kapsul', 18000.00, 1, 1);
INSERT INTO `satuan` VALUES (551, 0, 'botol', 27000.00, 1, 1);
INSERT INTO `satuan` VALUES (552, 0, 'botol', 50000.00, 1, 1);
INSERT INTO `satuan` VALUES (553, 0, 'tube', 100000.00, 1, 1);
INSERT INTO `satuan` VALUES (554, 0, 'tube', 68000.00, 1, 1);
INSERT INTO `satuan` VALUES (555, 0, 'tablet', 9000.00, 1, 1);
INSERT INTO `satuan` VALUES (556, 0, 'kapsul', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (557, 0, 'tablet', 700.00, 1, 1);
INSERT INTO `satuan` VALUES (558, 0, 'tablet', 6500.00, 1, 1);
INSERT INTO `satuan` VALUES (559, 0, 'kapsul', 5500.00, 1, 1);
INSERT INTO `satuan` VALUES (560, 0, 'kapsul', 7500.00, 1, 1);
INSERT INTO `satuan` VALUES (561, 0, 'botol', 20000.00, 1, 1);
INSERT INTO `satuan` VALUES (562, 0, 'botol', 43000.00, 1, 1);
INSERT INTO `satuan` VALUES (563, 0, 'botol', 49000.00, 1, 1);
INSERT INTO `satuan` VALUES (564, 0, 'botol', 60000.00, 1, 1);
INSERT INTO `satuan` VALUES (565, 0, 'botol', 63000.00, 1, 1);
INSERT INTO `satuan` VALUES (566, 0, 'botol', 25000.00, 1, 1);
INSERT INTO `satuan` VALUES (567, 0, 'botol', 56000.00, 1, 1);
INSERT INTO `satuan` VALUES (568, 0, 'tablet', 48000.00, 1, 1);
INSERT INTO `satuan` VALUES (569, 0, 'botol', 35000.00, 1, 1);
INSERT INTO `satuan` VALUES (570, 0, 'tube', 57000.00, 1, 1);
INSERT INTO `satuan` VALUES (571, 0, 'tube', 89000.00, 1, 1);
INSERT INTO `satuan` VALUES (572, 0, 'tablet', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (573, 0, 'botol', 50000.00, 1, 1);
INSERT INTO `satuan` VALUES (574, 0, 'tablet', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (575, 0, 'strip ', 45000.00, 1, 1);
INSERT INTO `satuan` VALUES (576, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (577, 0, 'kapsul', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (578, 0, 'tablet', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (579, 0, 'botol', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (580, 0, 'botol', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (581, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (582, 0, 'tablet', 400.00, 1, 1);
INSERT INTO `satuan` VALUES (583, 0, 'kaplet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (584, 0, 'supp', 20000.00, 1, 1);
INSERT INTO `satuan` VALUES (585, 0, 'supp', 29000.00, 1, 1);
INSERT INTO `satuan` VALUES (586, 0, 'botol', 18000.00, 1, 1);
INSERT INTO `satuan` VALUES (587, 0, 'botol', 24000.00, 1, 1);
INSERT INTO `satuan` VALUES (588, 0, 'botol', 39000.00, 1, 1);
INSERT INTO `satuan` VALUES (589, 0, 'botol', 35000.00, 1, 1);
INSERT INTO `satuan` VALUES (590, 0, 'botol', 197000.00, 1, 1);
INSERT INTO `satuan` VALUES (591, 0, 'tube', 98000.00, 1, 1);
INSERT INTO `satuan` VALUES (592, 0, 'tube', 57000.00, 1, 1);
INSERT INTO `satuan` VALUES (593, 0, 'botol', 21000.00, 1, 1);
INSERT INTO `satuan` VALUES (594, 0, 'strip', 17000.00, 1, 1);
INSERT INTO `satuan` VALUES (597, 0, 'kapsul', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (599, 0, 'tube', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (601, 0, 'lembar', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (603, 0, 'tablet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (604, 0, 'tablet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (605, 0, 'botol', 90000.00, 1, 1);
INSERT INTO `satuan` VALUES (607, 0, 'tablet', 150.00, 1, 1);
INSERT INTO `satuan` VALUES (610, 0, 'unit', 14000.00, 1, 1);
INSERT INTO `satuan` VALUES (612, 0, 'tablet', 400.00, 1, 1);
INSERT INTO `satuan` VALUES (613, 0, 'kapsul', 71000.00, 1, 1);
INSERT INTO `satuan` VALUES (614, 0, 'strip', 12000.00, 1, 1);
INSERT INTO `satuan` VALUES (615, 0, 'strip', 9000.00, 1, 1);
INSERT INTO `satuan` VALUES (616, 0, 'piece', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (619, 0, 'botol', 41000.00, 1, 1);
INSERT INTO `satuan` VALUES (620, 0, 'kaplet', 12000.00, 1, 1);
INSERT INTO `satuan` VALUES (621, 0, 'kaplet', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (622, 0, 'tube', 66000.00, 1, 1);
INSERT INTO `satuan` VALUES (623, 0, 'tablet', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (624, 0, 'tube', 25000.00, 1, 1);
INSERT INTO `satuan` VALUES (625, 0, 'tube', 44000.00, 1, 1);
INSERT INTO `satuan` VALUES (626, 0, 'tube', 56000.00, 1, 1);
INSERT INTO `satuan` VALUES (627, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (628, 0, 'tablet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (629, 0, 'botol', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (630, 0, 'botol', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (631, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (632, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (633, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (634, 0, 'kaplet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (635, 0, 'botol', 297000.00, 1, 1);
INSERT INTO `satuan` VALUES (636, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (637, 0, 'botol', 50000.00, 1, 1);
INSERT INTO `satuan` VALUES (638, 0, 'botol', 41000.00, 1, 1);
INSERT INTO `satuan` VALUES (451, 0, 'botol', 62000.00, 1, 1);
INSERT INTO `satuan` VALUES (639, 0, 'asd', 123123.00, 1, 1);
INSERT INTO `satuan` VALUES (509, 0, 'tube', 55000.00, 1, 1);
INSERT INTO `satuan` VALUES (509, 1, 'gr', 1000.00, 3, 0);

-- ----------------------------
-- Table structure for stok_awal
-- ----------------------------
DROP TABLE IF EXISTS `stok_awal`;
CREATE TABLE `stok_awal`  (
  `stok_awal_tanggal` date NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `barang_qty` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`stok_awal_tanggal`, `barang_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stok_awal
-- ----------------------------
INSERT INTO `stok_awal` VALUES ('2020-10-01', 386, 50);

SET FOREIGN_KEY_CHECKS = 1;
