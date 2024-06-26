/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : hiplantsai

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 08/12/2023 15:54:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for recorridos
-- ----------------------------
DROP TABLE IF EXISTS `recorridos`;
CREATE TABLE `recorridos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_mapa` bigint UNSIGNED NOT NULL,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `tiempo` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recorridos_id_usuario_foreign`(`id_usuario` ASC) USING BTREE,
  INDEX `recorridos_id_mapa_foreign`(`id_mapa` ASC) USING BTREE,
  CONSTRAINT `recorridos_id_mapa_foreign` FOREIGN KEY (`id_mapa`) REFERENCES `mapa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `recorridos_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of recorridos
-- ----------------------------
INSERT INTO `recorridos` VALUES (25, 16, 1, 21, '2023-12-04 01:11:08', '2023-12-04 01:11:08');
INSERT INTO `recorridos` VALUES (26, 16, 1, 4, '2023-12-04 01:11:55', '2023-12-04 01:11:55');
INSERT INTO `recorridos` VALUES (27, 16, 1, 244, '2023-12-04 01:16:38', '2023-12-04 01:16:38');
INSERT INTO `recorridos` VALUES (28, 16, 1, 5, '2023-12-04 01:16:49', '2023-12-04 01:16:49');
INSERT INTO `recorridos` VALUES (29, 16, 1, 28, '2023-12-04 01:17:37', '2023-12-04 01:17:37');
INSERT INTO `recorridos` VALUES (30, 16, 1, 30, '2023-12-04 01:18:13', '2023-12-04 01:18:13');
INSERT INTO `recorridos` VALUES (31, 16, 1, 2, '2023-12-04 01:18:37', '2023-12-04 01:18:37');
INSERT INTO `recorridos` VALUES (32, 16, 1, 45, '2023-12-04 01:19:45', '2023-12-04 01:19:45');
INSERT INTO `recorridos` VALUES (33, 16, 1, 11, '2023-12-04 01:25:57', '2023-12-04 01:25:57');
INSERT INTO `recorridos` VALUES (34, 16, 1, 3, '2023-12-04 01:34:31', '2023-12-04 01:34:31');
INSERT INTO `recorridos` VALUES (35, 16, 1, 13, '2023-12-04 01:41:30', '2023-12-04 01:41:30');
INSERT INTO `recorridos` VALUES (36, 16, 1, 5, '2023-12-04 01:42:56', '2023-12-04 01:42:56');
INSERT INTO `recorridos` VALUES (37, 16, 1, 5, '2023-12-04 01:43:38', '2023-12-04 01:43:38');
INSERT INTO `recorridos` VALUES (38, 16, 1, 381, '2023-12-04 01:50:07', '2023-12-04 01:50:07');
INSERT INTO `recorridos` VALUES (39, 16, 1, 119, '2023-12-04 01:53:45', '2023-12-04 01:53:45');
INSERT INTO `recorridos` VALUES (40, 16, 1, 18, '2023-12-04 01:54:06', '2023-12-04 01:54:06');
INSERT INTO `recorridos` VALUES (41, 16, 1, 41, '2023-12-04 01:54:55', '2023-12-04 01:54:55');
INSERT INTO `recorridos` VALUES (42, 17, 1, 4, '2023-12-05 01:51:05', '2023-12-05 01:51:05');
INSERT INTO `recorridos` VALUES (43, 17, 1, 4, '2023-12-05 01:51:45', '2023-12-05 01:51:45');
INSERT INTO `recorridos` VALUES (44, 17, 1, 37, '2023-12-05 01:53:24', '2023-12-05 01:53:24');
INSERT INTO `recorridos` VALUES (45, 17, 1, 5, '2023-12-05 01:53:38', '2023-12-05 01:53:38');
INSERT INTO `recorridos` VALUES (46, 17, 1, 19, '2023-12-05 01:53:38', '2023-12-05 01:53:38');
INSERT INTO `recorridos` VALUES (47, 18, 1, 62, '2023-12-05 01:54:53', '2023-12-05 01:54:53');
INSERT INTO `recorridos` VALUES (48, 18, 1, 17, '2023-12-05 01:55:18', '2023-12-05 01:55:18');
INSERT INTO `recorridos` VALUES (49, 17, 1, 5, '2023-12-05 01:55:50', '2023-12-05 01:55:50');
INSERT INTO `recorridos` VALUES (50, 17, 1, 5, '2023-12-05 01:55:51', '2023-12-05 01:55:51');
INSERT INTO `recorridos` VALUES (51, 17, 1, 1, '2023-12-05 01:55:53', '2023-12-05 01:55:53');
INSERT INTO `recorridos` VALUES (52, 17, 1, 10, '2023-12-05 01:56:28', '2023-12-05 01:56:28');
INSERT INTO `recorridos` VALUES (53, 17, 1, 37, '2023-12-05 01:56:28', '2023-12-05 01:56:28');
INSERT INTO `recorridos` VALUES (54, 17, 1, 5, '2023-12-05 01:56:46', '2023-12-05 01:56:46');
INSERT INTO `recorridos` VALUES (55, 17, 1, 5, '2023-12-05 01:56:46', '2023-12-05 01:56:46');
INSERT INTO `recorridos` VALUES (56, 17, 1, 10, '2023-12-05 01:57:09', '2023-12-05 01:57:09');
INSERT INTO `recorridos` VALUES (57, 17, 1, 70, '2023-12-05 01:58:01', '2023-12-05 01:58:01');
INSERT INTO `recorridos` VALUES (58, 17, 1, 13, '2023-12-05 03:20:49', '2023-12-05 03:20:49');
INSERT INTO `recorridos` VALUES (59, 17, 1, 25, '2023-12-05 03:24:37', '2023-12-05 03:24:37');
INSERT INTO `recorridos` VALUES (60, 17, 1, 18, '2023-12-05 03:25:00', '2023-12-05 03:25:00');
INSERT INTO `recorridos` VALUES (61, 17, 1, 3, '2023-12-05 03:27:19', '2023-12-05 03:27:19');
INSERT INTO `recorridos` VALUES (62, 18, 1, 5, '2023-12-05 03:28:47', '2023-12-05 03:28:47');
INSERT INTO `recorridos` VALUES (63, 17, 1, 18, '2023-12-05 03:31:49', '2023-12-05 03:31:49');
INSERT INTO `recorridos` VALUES (64, 17, 1, 77, '2023-12-05 03:33:46', '2023-12-05 03:33:46');
INSERT INTO `recorridos` VALUES (65, 18, 1, 4, '2023-12-05 03:33:56', '2023-12-05 03:33:56');
INSERT INTO `recorridos` VALUES (66, 19, 1, 15, '2023-12-05 03:34:01', '2023-12-05 03:34:01');
INSERT INTO `recorridos` VALUES (67, 20, 1, 5, '2023-12-05 03:34:18', '2023-12-05 03:34:18');
INSERT INTO `recorridos` VALUES (68, 17, 1, 5, '2023-12-05 03:34:30', '2023-12-05 03:34:30');
INSERT INTO `recorridos` VALUES (69, 17, 1, 5, '2023-12-05 03:34:30', '2023-12-05 03:34:30');
INSERT INTO `recorridos` VALUES (70, 19, 1, 5, '2023-12-05 03:34:30', '2023-12-05 03:34:30');
INSERT INTO `recorridos` VALUES (71, 17, 1, 9, '2023-12-05 03:34:49', '2023-12-05 03:34:49');
INSERT INTO `recorridos` VALUES (72, 17, 1, 9, '2023-12-05 03:34:50', '2023-12-05 03:34:50');
INSERT INTO `recorridos` VALUES (73, 17, 1, 30, '2023-12-05 03:35:35', '2023-12-05 03:35:35');
INSERT INTO `recorridos` VALUES (74, 17, 1, 30, '2023-12-05 03:35:35', '2023-12-05 03:35:35');
INSERT INTO `recorridos` VALUES (75, 20, 1, 5, '2023-12-05 03:37:10', '2023-12-05 03:37:10');
INSERT INTO `recorridos` VALUES (76, 17, 1, 100, '2023-12-05 03:37:32', '2023-12-05 03:37:32');
INSERT INTO `recorridos` VALUES (77, 17, 1, 100, '2023-12-05 03:37:32', '2023-12-05 03:37:32');
INSERT INTO `recorridos` VALUES (78, 17, 1, 320, '2023-12-05 03:42:57', '2023-12-05 03:42:57');
INSERT INTO `recorridos` VALUES (79, 17, 1, 320, '2023-12-05 03:42:58', '2023-12-05 03:42:58');
INSERT INTO `recorridos` VALUES (80, 17, 1, 13, '2023-12-05 03:45:39', '2023-12-05 03:45:39');
INSERT INTO `recorridos` VALUES (81, 19, 1, 18, '2023-12-05 03:45:40', '2023-12-05 03:45:40');
INSERT INTO `recorridos` VALUES (84, 21, 1, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00');
INSERT INTO `recorridos` VALUES (85, 17, 1, 63, '2023-12-08 01:32:18', '2023-12-08 01:32:18');
INSERT INTO `recorridos` VALUES (86, 18, 1, 63, '2023-12-08 01:32:18', '2023-12-08 01:32:18');
INSERT INTO `recorridos` VALUES (87, 19, 1, 63, '2023-12-08 01:32:18', '2023-12-08 01:32:18');
INSERT INTO `recorridos` VALUES (88, 20, 1, 63, '2023-12-08 01:32:18', '2023-12-08 01:32:18');
INSERT INTO `recorridos` VALUES (89, 17, 1, 4, '2023-12-08 01:32:28', '2023-12-08 01:32:28');
INSERT INTO `recorridos` VALUES (90, 18, 1, 4, '2023-12-08 01:32:28', '2023-12-08 01:32:28');
INSERT INTO `recorridos` VALUES (91, 19, 1, 4, '2023-12-08 01:32:28', '2023-12-08 01:32:28');
INSERT INTO `recorridos` VALUES (92, 17, 1, 15, '2023-12-08 01:33:10', '2023-12-08 01:33:10');
INSERT INTO `recorridos` VALUES (93, 18, 1, 15, '2023-12-08 01:33:10', '2023-12-08 01:33:10');
INSERT INTO `recorridos` VALUES (94, 19, 1, 15, '2023-12-08 01:33:10', '2023-12-08 01:33:10');
INSERT INTO `recorridos` VALUES (95, 18, 1, 9, '2023-12-08 01:34:59', '2023-12-08 01:34:59');
INSERT INTO `recorridos` VALUES (96, 17, 1, 12, '2023-12-08 01:44:45', '2023-12-08 01:44:45');
INSERT INTO `recorridos` VALUES (97, 18, 1, 12, '2023-12-08 01:44:45', '2023-12-08 01:44:45');
INSERT INTO `recorridos` VALUES (98, 19, 1, 12, '2023-12-08 01:44:45', '2023-12-08 01:44:45');
INSERT INTO `recorridos` VALUES (99, 20, 1, 12, '2023-12-08 01:44:45', '2023-12-08 01:44:45');
INSERT INTO `recorridos` VALUES (100, 18, 1, 39, '2023-12-08 04:23:04', '2023-12-08 04:23:04');
INSERT INTO `recorridos` VALUES (101, 19, 1, 39, '2023-12-08 04:23:04', '2023-12-08 04:23:04');
INSERT INTO `recorridos` VALUES (102, 20, 1, 39, '2023-12-08 04:23:04', '2023-12-08 04:23:04');
INSERT INTO `recorridos` VALUES (103, 17, 1, 283, '2023-12-08 04:30:07', '2023-12-08 04:30:07');
INSERT INTO `recorridos` VALUES (104, 18, 1, 283, '2023-12-08 04:30:07', '2023-12-08 04:30:07');
INSERT INTO `recorridos` VALUES (105, 19, 1, 283, '2023-12-08 04:30:07', '2023-12-08 04:30:07');
INSERT INTO `recorridos` VALUES (106, 20, 1, 283, '2023-12-08 04:30:07', '2023-12-08 04:30:07');
INSERT INTO `recorridos` VALUES (107, 16, 1, 210, '2023-12-08 14:50:51', '2023-12-08 14:50:51');
INSERT INTO `recorridos` VALUES (108, 21, 1, 210, '2023-12-08 14:50:51', '2023-12-08 14:50:51');
INSERT INTO `recorridos` VALUES (109, 16, 1, 5, '2023-12-08 14:51:21', '2023-12-08 14:51:21');
INSERT INTO `recorridos` VALUES (110, 16, 1, 15, '2023-12-08 14:51:42', '2023-12-08 14:51:42');
INSERT INTO `recorridos` VALUES (111, 21, 1, 15, '2023-12-08 14:51:42', '2023-12-08 14:51:42');
INSERT INTO `recorridos` VALUES (112, 16, 1, 85, '2023-12-08 14:55:06', '2023-12-08 14:55:06');
INSERT INTO `recorridos` VALUES (113, 21, 1, 85, '2023-12-08 14:55:06', '2023-12-08 14:55:06');
INSERT INTO `recorridos` VALUES (114, 16, 1, 5, '2023-12-08 15:02:35', '2023-12-08 15:02:35');
INSERT INTO `recorridos` VALUES (115, 21, 1, 5, '2023-12-08 15:02:35', '2023-12-08 15:02:35');
INSERT INTO `recorridos` VALUES (116, 16, 1, 4, '2023-12-08 15:02:49', '2023-12-08 15:02:49');
INSERT INTO `recorridos` VALUES (117, 21, 1, 4, '2023-12-08 15:02:49', '2023-12-08 15:02:49');
INSERT INTO `recorridos` VALUES (118, 16, 1, 17, '2023-12-08 15:05:53', '2023-12-08 15:05:53');
INSERT INTO `recorridos` VALUES (119, 21, 1, 17, '2023-12-08 15:05:53', '2023-12-08 15:05:53');
INSERT INTO `recorridos` VALUES (120, 16, 1, 322, '2023-12-08 15:20:38', '2023-12-08 15:20:38');
INSERT INTO `recorridos` VALUES (121, 21, 1, 322, '2023-12-08 15:20:38', '2023-12-08 15:20:38');
INSERT INTO `recorridos` VALUES (122, 16, 1, 779, '2023-12-08 20:52:38', '2023-12-08 20:52:38');
INSERT INTO `recorridos` VALUES (123, 21, 1, 779, '2023-12-08 20:52:38', '2023-12-08 20:52:38');
INSERT INTO `recorridos` VALUES (124, 22, 1, 779, '2023-12-08 20:52:38', '2023-12-08 20:52:38');
INSERT INTO `recorridos` VALUES (125, 16, 1, 5, '2023-12-08 20:52:47', '2023-12-08 20:52:47');
INSERT INTO `recorridos` VALUES (126, 21, 1, 5, '2023-12-08 20:52:47', '2023-12-08 20:52:47');
INSERT INTO `recorridos` VALUES (127, 22, 1, 5, '2023-12-08 20:52:47', '2023-12-08 20:52:47');
INSERT INTO `recorridos` VALUES (128, 16, 1, 819, '2023-12-08 21:32:07', '2023-12-08 21:32:07');
INSERT INTO `recorridos` VALUES (129, 21, 1, 819, '2023-12-08 21:32:07', '2023-12-08 21:32:07');
INSERT INTO `recorridos` VALUES (130, 22, 1, 819, '2023-12-08 21:32:07', '2023-12-08 21:32:07');
INSERT INTO `recorridos` VALUES (131, 23, 1, 819, '2023-12-08 21:32:07', '2023-12-08 21:32:07');
INSERT INTO `recorridos` VALUES (132, 16, 1, 191, '2023-12-08 21:35:22', '2023-12-08 21:35:22');
INSERT INTO `recorridos` VALUES (133, 21, 1, 191, '2023-12-08 21:35:22', '2023-12-08 21:35:22');
INSERT INTO `recorridos` VALUES (134, 22, 1, 191, '2023-12-08 21:35:22', '2023-12-08 21:35:22');
INSERT INTO `recorridos` VALUES (135, 23, 1, 191, '2023-12-08 21:35:22', '2023-12-08 21:35:22');
INSERT INTO `recorridos` VALUES (136, 16, 1, 1069, '2023-12-08 21:53:16', '2023-12-08 21:53:16');
INSERT INTO `recorridos` VALUES (137, 21, 1, 1069, '2023-12-08 21:53:16', '2023-12-08 21:53:16');
INSERT INTO `recorridos` VALUES (138, 22, 1, 1069, '2023-12-08 21:53:16', '2023-12-08 21:53:16');
INSERT INTO `recorridos` VALUES (139, 23, 1, 1069, '2023-12-08 21:53:16', '2023-12-08 21:53:16');

SET FOREIGN_KEY_CHECKS = 1;
