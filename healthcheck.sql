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

 Date: 25/06/2021 18:39:24
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, '五邑大学');
INSERT INTO `school` VALUES (2, 'wyu');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (1, 3, 1, NULL);
INSERT INTO `sign` VALUES (2, 3, 1, NULL);

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
INSERT INTO `signinfo` VALUES (123, 1, '123', '36', '北京市北京市123路', '2021-06-25 18:14:47', '绿码', '否');
INSERT INTO `signinfo` VALUES (1, 1, '123', '36', '江门市蓬江区五邑大学', '2021-06-25 18:15:44', '绿码', '否');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tips
-- ----------------------------
INSERT INTO `tips` VALUES (1, '健康打卡', 'lw', 'http://www.baidu.com', 3, 1, 1, '2021-06-22 11:28:32');
INSERT INTO `tips` VALUES (2, 'daka', 'lw', '/sign/1', 3, 1, 1, '2021-06-25 17:41:16');
INSERT INTO `tips` VALUES (3, '管理员发布的系统提示', 'admin', '#', 2, 0, 0, '2021-06-25 17:42:40');
INSERT INTO `tips` VALUES (4, '打卡测试', 'lw', '/sign?id=2', 3, 1, 1, '2021-06-25 18:01:11');

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

SET FOREIGN_KEY_CHECKS = 1;
