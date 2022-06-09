/*
 Navicat Premium Data Transfer

 Source Server         : phpStudy
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : chenyafei1207

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 07/06/2022 09:39:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');
INSERT INTO `admin` VALUES (3, 'admin', '12345');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `loc` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门所在地',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '销售部', '三楼');
INSERT INTO `department` VALUES (2, '运营部', '二楼');
INSERT INTO `department` VALUES (3, '设计部', '四楼');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `empno` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `empname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `empsalary` decimal(10, 2) NULL DEFAULT NULL COMMENT '员工工资',
  `dptno` int(11) NULL DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`empno`) USING BTREE,
  INDEX `dptno`(`dptno`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '张三', 5000.00, 1);
INSERT INTO `employee` VALUES (2, '李四', 6000.00, 1);
INSERT INTO `employee` VALUES (3, '王五', 6000.00, 2);
INSERT INTO `employee` VALUES (4, '马云', 5000.00, 2);
INSERT INTO `employee` VALUES (5, '马腾', 5000.00, 3);
INSERT INTO `employee` VALUES (6, '刘东', 6000.00, 3);
INSERT INTO `employee` VALUES (11, '张三分', 5000.00, 3);

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empno` int(11) NULL DEFAULT NULL,
  `empsalary` decimal(10, 2) NULL DEFAULT NULL,
  `empyear` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empmonth` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `a`(`empno`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (1, 1, 5000.00, '2015', '1');
INSERT INTO `salary` VALUES (2, 1, 5000.00, '2015', '2');
INSERT INTO `salary` VALUES (3, 2, 6000.00, '2015', '1');
INSERT INTO `salary` VALUES (4, 2, 6000.00, '2015', '2');
INSERT INTO `salary` VALUES (5, 3, 6000.00, '2015', '1');
INSERT INTO `salary` VALUES (6, 3, 6000.00, '2015', '2');
INSERT INTO `salary` VALUES (7, 4, 5000.00, '2015', '1');
INSERT INTO `salary` VALUES (8, 4, 5000.00, '2015', '2');
INSERT INTO `salary` VALUES (9, 5, 5000.00, '2015', '1');
INSERT INTO `salary` VALUES (10, 5, 5000.00, '2015', '2');
INSERT INTO `salary` VALUES (11, 6, 6000.00, '2015', '1');
INSERT INTO `salary` VALUES (12, 6, 6000.00, '2015', '2');

SET FOREIGN_KEY_CHECKS = 1;

