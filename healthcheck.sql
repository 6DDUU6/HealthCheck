/*
 Navicat Premium Data Transfer

 Source Server         : LocalMysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : healthcheck

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 28/06/2021 16:23:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, '五邑大学');
INSERT INTO `school` VALUES (2, 'wyu');
INSERT INTO `school` VALUES (3, '江门职业');

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `fromid` int(0) NOT NULL,
  `schoolid` int(0) NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (1, 3, 1, NULL);
INSERT INTO `sign` VALUES (2, 3, 1, NULL);
INSERT INTO `sign` VALUES (3, 3, 1, NULL);
INSERT INTO `sign` VALUES (4, 3, 1, NULL);
INSERT INTO `sign` VALUES (5, 5, 1, NULL);

-- ----------------------------
-- Table structure for signinfo
-- ----------------------------
DROP TABLE IF EXISTS `signinfo`;
CREATE TABLE `signinfo`  (
  `signid` int(0) NOT NULL,
  `userid` int(0) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `temperature` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  `qr_code_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_to_dongguan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signinfo
-- ----------------------------
INSERT INTO `signinfo` VALUES (1, 1, '123', '36', '五邑大学', '2021-06-25 17:32:08', '绿色', '否');
INSERT INTO `signinfo` VALUES (3, 1, '123', '36', '北京市北京市123路', '2021-06-28 00:58:43', '绿码', '否');
INSERT INTO `signinfo` VALUES (2, 1, '123', '36', '北京市北京市123路', '2021-06-28 01:32:52', '绿码', '是');
INSERT INTO `signinfo` VALUES (4, 1, '123', '32', '北京市北京市321路', '2021-06-28 01:34:21', '黄码', '否');
INSERT INTO `signinfo` VALUES (1, 4, '皮卡丘', '35', '北京市北京市321路区间', '2021-06-28 15:45:05', '绿码', '否');
INSERT INTO `signinfo` VALUES (2, 4, '皮卡丘', '35', '北京市大兴区12345北京市市民热线服务中心', '2021-06-28 15:56:58', '绿码', '否');

-- ----------------------------
-- Table structure for tip_sign
-- ----------------------------
DROP TABLE IF EXISTS `tip_sign`;
CREATE TABLE `tip_sign`  (
  `tipid` int(0) NOT NULL,
  `signid` int(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tip_sign
-- ----------------------------
INSERT INTO `tip_sign` VALUES (6, 3);
INSERT INTO `tip_sign` VALUES (2, 1);
INSERT INTO `tip_sign` VALUES (4, 2);
INSERT INTO `tip_sign` VALUES (7, 4);
INSERT INTO `tip_sign` VALUES (8, 5);

-- ----------------------------
-- Table structure for tips
-- ----------------------------
DROP TABLE IF EXISTS `tips`;
CREATE TABLE `tips`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `fromnick` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `tourl` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `fromid` int(0) DEFAULT NULL,
  `active_range` int(0) DEFAULT 0,
  `tips_type` int(0) DEFAULT 0,
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tips
-- ----------------------------
INSERT INTO `tips` VALUES (2, 'daka', 'lw', '/jumpSign/1', 3, 1, 1, '2021-06-25 17:41:16');
INSERT INTO `tips` VALUES (3, '管理员发布的系统提示', 'admin', '#', 2, 0, 0, '2021-06-25 17:42:40');
INSERT INTO `tips` VALUES (4, '打卡测试', 'lw', '/jumpSign/2', 3, 1, 1, '2021-06-25 18:01:11');
INSERT INTO `tips` VALUES (5, '公告测试', 'admin', '#', 2, 0, 0, '2021-06-26 15:48:01');
INSERT INTO `tips` VALUES (6, 'daka2', 'lw', '/jumpSign/3', 3, 1, 1, '2021-06-26 15:49:12');
INSERT INTO `tips` VALUES (7, 'daka3', 'lw', '/jumpSign/4', 3, 1, 1, '2021-06-28 01:33:36');
INSERT INTO `tips` VALUES (8, 'daka4', '老王', '/jumpSign/5', 5, 1, 1, '2021-06-28 15:59:05');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(0) DEFAULT 2,
  `schoolid` int(0) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '123', 2, 1);
INSERT INTO `user` VALUES (2, 'admin', 'admin', 0, 0);
INSERT INTO `user` VALUES (3, 'lw', 'lw', 1, 1);
INSERT INTO `user` VALUES (4, '皮卡丘', '123', 2, 1);
INSERT INTO `user` VALUES (5, '老王', '123', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
