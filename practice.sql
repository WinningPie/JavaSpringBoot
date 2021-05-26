/*
 Navicat Premium Data Transfer

 Source Server         : he
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : practice

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 19/10/2020 22:50:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, 1, '所有', '');
INSERT INTO `menu` VALUES (2, '/home', 1, 1, '所有管理', 'Home');
INSERT INTO `menu` VALUES (3, '/db/**', 2, 1, '成绩管理', 'Score');
INSERT INTO `menu` VALUES (4, '/admin/**', 2, 1, '基本信息', 'Information');
INSERT INTO `menu` VALUES (5, '/teacher/**', 2, 1, '教师管理', 'Teacher');
INSERT INTO `menu` VALUES (6, '/home', 1, 1, '权限管理', 'Home');
INSERT INTO `menu` VALUES (7, '/user/**', 6, 1, '用户管理', 'UserManage'); 
INSERT INTO `menu` VALUES (8, '/course/**', 2, 1, '课程管理', 'Course');
INSERT INTO `menu` VALUES (9, '/dormitory_repair/**', 2, 1, '宿舍报修', 'Dormitory_repair');
INSERT INTO `menu` VALUES (10, '/teachingBook/**', 2, 1, '教材管理', 'teachingBook');
-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (1, 3, 1);
INSERT INTO `menu_role` VALUES (2, 4, 2);
INSERT INTO `menu_role` VALUES (3, 5, 3);
INSERT INTO `menu_role` VALUES (4, 7, 2);
INSERT INTO `menu_role` VALUES (5, 8, 2);
INSERT INTO `menu_role` VALUES (6, 9, 2);
INSERT INTO `menu_role` VALUES (7, 10, 2);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_dba', '数据库管理员');
INSERT INTO `role` VALUES (2, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (3, 'ROLE_user', '用户');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
`uid` bigint(20) NOT NULL AUTO_INCREMENT,
`name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`ethnic` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`height` int(20) DEFAULT NULL,
`weight` int(20) DEFAULT NULL,
`salary` int(11) DEFAULT NULL,
`email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`record` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
 `phone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`hobby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`school` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
 `qq` int(20) DEFAULT NULL,
`wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`marry` boolean DEFAULT NULL,
`teaching_age` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`specialty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`data` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (29, '徐昊', '男','汉',175,60,'5000','239874@qq.com','本科',22,123456,'篮球','1998-11-19','重庆师范大学','重庆市',123456,'das',true,'4年','擅长分析','数学','2021.4.5');
-- ----------------------------
-- Table structure for teacher_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_copy`;
CREATE TABLE `teacher_copy`  (
`uid` bigint(20) NOT NULL AUTO_INCREMENT,
`name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
 `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`ethnic` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`height` int(20) DEFAULT NULL,
`weight` int(20) DEFAULT NULL,
`salary` int(11) DEFAULT NULL, 
`email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`record` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
 `phone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`hobby` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`school` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
 `qq` int(20) DEFAULT NULL,
`wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`marry` boolean DEFAULT NULL,
`teaching_age` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`specialty` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
`data` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_copy
-- ----------------------------

-- ----------------------------
-- Table structure for teacher_count
-- ----------------------------
DROP TABLE IF EXISTS `teacher_count`;
CREATE TABLE `teacher_count`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_count
-- ----------------------------
INSERT INTO `teacher_count` VALUES (1, 3);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_credits` int(11) DEFAULT NULL,
  `course_teacher` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_introduction` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_nature` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_choose` boolean DEFAULT NULL,
  `course_test_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `academy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `place` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '高等数学', 5, '小明','数学','选修',true,'2021.4.5','数学科学学院','特教楼');


-- ----------------------------
-- Table structure for course_copy
-- ----------------------------
DROP TABLE IF EXISTS `course_copy`;
CREATE TABLE `course_copy`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_credits` int(11) DEFAULT NULL,
  `course_teacher` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_introduction` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_nature` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_choose` boolean DEFAULT NULL,
  `course_test_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
   `academy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `place` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course_copy
-- ----------------------------


-- ----------------------------
-- Table structure for course_count
-- ----------------------------
DROP TABLE IF EXISTS `course_count`;
CREATE TABLE `course_count`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course_count
-- ----------------------------
INSERT INTO `course_count` VALUES (1, 3);

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
 `number` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `academy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `semester` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (26,  '小明',2018051604099,'计算机与信息科学学院','软件工程',2020,'第二学期','数据结构',80);

-- ----------------------------
-- Table structure for score_copy
-- ----------------------------
DROP TABLE IF EXISTS `score_copy`;
CREATE TABLE `score_copy`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
 `number` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `academy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `semester` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of score_copy
-- ----------------------------

-- ----------------------------
-- Table structure for score_count
-- ----------------------------
DROP TABLE IF EXISTS `score_count`;
CREATE TABLE `score_count`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of score_count
-- ----------------------------
INSERT INTO `score_count` VALUES (1, 3);

-- ----------------------------
-- Table structure for dormity_repair
-- ----------------------------
DROP TABLE IF EXISTS `dormitory_repair`;
CREATE TABLE `dormitory_repair`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `campus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `building` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dormitory_repair
-- ----------------------------
INSERT INTO `dormitory_repair` VALUES (29, '大学城校区', '清风苑', '5楼',503,'小明',19912459419,'空调故障');


-- ----------------------------
-- Table structure for dormitory_repair_copy
-- ----------------------------
DROP TABLE IF EXISTS `dormitory_repair_copy`;
CREATE TABLE `dormitory_repair_copy`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `campus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `building` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dormitory_repair_copy
-- ----------------------------


-- ----------------------------
-- Table structure for dormitory_repair_count
-- ----------------------------
DROP TABLE IF EXISTS `dormitory_repair_count`;
CREATE TABLE `dormitory_repair_count`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dormitory_repair_count
-- ----------------------------
INSERT INTO `dormitory_repair_count` VALUES (1, 3);

-- ----------------------------
-- Table structure for teachingbook
-- ----------------------------
CREATE TABLE IF NOT EXISTS `teachingbook` (
  `uid` varchar(255) NOT NULL DEFAULT '12',
  `name` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `writer` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dormitory_repair
-- ----------------------------
INSERT INTO `teachingbook` (`uid`, `name`, `isbn`, `writer`, `version`, `price`, `reason`) VALUES
('12', '', '', '', '', '', ''),
('12', '1', '2', '3', '4', '5', '6');
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT 1,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '超级管理员', '18568887789', '029-82881234', '哈尔滨', 1, 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', NULL);
INSERT INTO `user` VALUES (2, '徐昊', '18568123489', '029-82123434', '重庆', 1, 'xuhao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (3, '老王', '18568123666', '029-82111555', '广州', 1, 'laowang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (8, '老张', NULL, NULL, NULL, 1, 'laozhang', '$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq', NULL);
INSERT INTO `user` VALUES (9, '老李', NULL, NULL, NULL, 0, 'laoli', '$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i', NULL);
INSERT INTO `user` VALUES (10, '小程', NULL, NULL, NULL, 1, 'xiaocheng', '$2a$10$9WvViONP7a.VcId3ktgg.Odj.WJExpc./j/eSNv2bSa8nArwfGGY2', NULL);
INSERT INTO `user` VALUES (11, '哈哈哈', NULL, NULL, NULL, 1, 'hhh', '$2a$10$30.wi4mGO6.wWgG2TEVw/O5glfMG1TWpgeEi7xK5Y5GvrQglQlH86', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);
INSERT INTO `user_role` VALUES (4, 3, 3);
INSERT INTO `user_role` VALUES (5, 1, 3);

SET FOREIGN_KEY_CHECKS = 1;
