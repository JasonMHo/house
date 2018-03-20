/*
 Navicat Premium Data Transfer

 Source Server         : hzlocalhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : house

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 03/18/2018 22:31:06 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_district`
-- ----------------------------
DROP TABLE IF EXISTS `t_district`;
CREATE TABLE `t_district` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_district`
-- ----------------------------
BEGIN;
INSERT INTO `t_district` VALUES ('1', '南山区'), ('2', '福田区'), ('3', '罗湖区'), ('6', '龙岗区'), ('7', '盐田区');
COMMIT;

-- ----------------------------
--  Table structure for `t_house`
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERID` bigint(20) DEFAULT NULL,
  `TYPEID` bigint(20) DEFAULT NULL,
  `STREETID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `PUBDATE` datetime DEFAULT NULL,
  `ADDDATE` datetime DEFAULT NULL,
  `FLOORAGE` double DEFAULT NULL,
  `CONTACT` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `t_house`
-- ----------------------------
BEGIN;
INSERT INTO `t_house` VALUES ('3', '1', '4', '5', '阿拉雷', ' 精装修，拎包入住', '1300', '2016-02-26 00:00:00', null, '120', '张三丰'), ('6', '4', '2', '5', '红本在手，钥匙在手 ', '精装修', '1000', '2017-04-11 00:00:00', '2018-03-09 12:13:46', '90', '王五'), ('9', '2', '1', '5', '好房子带学位，不限购 ', '精装修', '1500', '2016-05-27 00:00:00', '2018-03-09 12:13:46', '50', '王五'), ('12', '4', '1', '11', '临近地铁口、全新装精装修、配送新家私出售、通风好', '拎包入住', '800', '2016-01-27 00:00:00', '2018-03-09 12:13:46', '30', '吴六奇 '), ('13', '4', '1', '11', '临近地铁口、全新装精装修', '拎包入住', '600', '2016-01-27 00:00:00', '2018-03-09 12:13:46', '50', '吴六奇 '), ('16', '4', '2', '12', '京基100', '精装修', '1300', '2016-01-01 00:00:00', '2018-03-09 12:13:46', '70', '吴六奇 '), ('26', '3', '1', '21', '看房方便随时签约 ', '拎包入住', '600', '2016-10-01 00:00:00', '2018-03-09 12:13:46', '40', '赵半山'), ('36', '2', '3', '14', '看房有钥匙 家私全送 近地铁 ', '拎包入住', '1400', '2016-10-01 00:00:00', '2018-03-09 12:13:46', '140', '王五'), ('37', '2', '3', '21', '事务处理标题222', '拎包入住', '1500', '2016-10-01 00:00:00', '2018-03-09 12:13:46', '138', '王五'), ('42', '2', '3', '21', '红本在手，钥匙在手 ', '精装修', '1350', '2016-10-01 00:00:00', '2018-03-09 12:13:46', '168', '王五'), ('43', '2', '3', '22', '好房子带学位，不限购 ', '精装修', '1500', '2016-10-01 00:00:00', '2018-03-09 12:13:46', '140', '王五'), ('46', '1', '3', '3', '南龙苑', '拎包入住', '1800', '2016-10-01 00:00:00', '2018-03-09 12:13:46', '150', '张三丰'), ('47', '1', '1', '3', '钰龙园', '拎包入住', '1000', '2016-10-01 00:00:00', '2018-03-10 18:45:11', '40', '张三丰'), ('48', '1', '4', '3', '荔园大厦', '精装修', '800', '2016-10-01 00:00:00', '2018-03-11 08:29:21', '100', '张三丰'), ('49', '4', '4', '32', '看房有钥匙 家私全送 近地铁 ', '拎包入住', '1200', '2016-10-01 00:00:00', '2018-03-11 17:08:29', '140', '吴六奇 '), ('50', '4', '2', '1', '看房方便随时签约 ', '精装修', '800', '2016-10-01 00:00:00', '2018-03-11 17:10:00', '65', '吴六奇 '), ('51', '2', '2', '1', '看房方便随时签约 ', '拎包入住', '800', '2016-10-01 00:00:00', '2018-03-11 17:54:42', '70', '王五'), ('53', '3', '2', '2', '临近地铁口、全新装精装修', '精装修', '900', '2016-10-01 00:00:00', '2018-03-11 18:00:04', '80', '赵半山'), ('54', '3', '3', '2', '临近地铁口、全新装精装修', '拎包入住', '1300', '2016-10-01 00:00:00', '2018-03-11 18:00:08', '75', '赵半山'), ('55', '3', '1', '3', '阿萨德', '精装修', '200', '2016-10-01 00:00:00', '2018-03-11 18:00:13', '20', '赵半山'), ('56', '3', '1', '5', '看房有钥匙 家私全送 近地铁 ', '拎包入住', '220', '2016-10-01 00:00:00', '2018-03-11 18:00:44', '22', '赵半山'), ('57', '4', '2', '34', '看房方便随时签约 ', '精装修', '700', '2016-10-01 00:00:00', '2018-03-11 18:02:12', '80', '吴六奇 '), ('58', '1', '3', '14', '临近地铁口、全新装精装修', '拎包入住', '1300', '2016-10-01 00:00:00', '2018-03-11 18:02:23', '110', '张三丰'), ('59', '1', '1', '14', '红本在手，钥匙在手 ', '精装修', '150', '2016-10-01 00:00:00', '2018-03-11 18:02:35', '20', '张三丰'), ('60', '1', '1', '14', '看房有钥匙 家私全送 近地铁 ', '拎包入住', '180', '2016-10-01 00:00:00', '2018-03-11 18:44:35', '22', '张三丰'), ('74', '1', '1', '12', '特价房源', ' 精装修，拎包入住', '400', null, '2018-03-17 16:35:50', '40', '张三丰'), ('75', '1', '2', '12', '111', ' 精装修，拎包入住', '300', null, '2018-03-17 21:44:45', '30', '张三丰'), ('76', '1', '2', '2', '111', ' 精装修，拎包入住', '200', null, '2018-03-17 21:48:02', '22', '张三丰'), ('77', '1', '2', '12', '111', ' 精装修，拎包入住', '600', null, '2018-03-17 22:00:34', '22', '张三丰'), ('78', '1', '2', '3', '111', ' 精装修，拎包入住', '800', null, '2018-03-17 22:01:02', '44', '张三丰'), ('79', '1', '3', '22', '111', ' 精装修，拎包入住', '800', null, '2018-03-17 22:08:11', '60', '张三丰'), ('80', '4', '4', '32', 'xxx', ' 精装修，拎包入住', '1800', null, '2018-03-17 22:19:02', '160', '吴六奇'), ('81', '1', '2', '22', 'xxx', ' 精装修，拎包入住', '300', null, '2018-03-18 10:51:16', '40', '张三丰'), ('82', '1', '2', '11', 'xxx', ' 精装修，拎包入住', '700', null, '2018-03-18 10:51:27', '50', '张三丰'), ('84', '1', '1', '11', 'xxx', ' 精装修，拎包入住', '600', null, '2018-03-18 10:51:49', '50', '张三丰'), ('86', '1', '1', '11', 'abc', ' 精装修，拎包入住', '1200', null, null, '90', '张三丰');
COMMIT;

-- ----------------------------
--  Table structure for `t_picture`
-- ----------------------------
DROP TABLE IF EXISTS `t_picture`;
CREATE TABLE `t_picture` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `HOUSEID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_picture`
-- ----------------------------
BEGIN;
INSERT INTO `t_picture` VALUES ('1', '3', 'pic', '/upload\\dce91bf4-5a1f-40e1-8e18-ca3d8bb20a18.png'), ('2', '6', 'pic', '/resources/upload/a.png'), ('3', '9', 'pic', '/resources/upload/a.png'), ('4', '12', 'pic', '/resources/upload/a.png'), ('5', '13', 'pic', '/resources/upload/a.png');
COMMIT;

-- ----------------------------
--  Table structure for `t_street`
-- ----------------------------
DROP TABLE IF EXISTS `t_street`;
CREATE TABLE `t_street` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISTRICTID` bigint(20) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_street`
-- ----------------------------
BEGIN;
INSERT INTO `t_street` VALUES ('1', '1', '南新路'), ('2', '1', '上步路'), ('3', '1', '南头'), ('4', '1', '南山大道'), ('5', '1', '南头古城'), ('11', '2', '华强北'), ('12', '2', '车公庙'), ('13', '1', '深南大道'), ('14', '2', '华强南'), ('21', '3', '春风路'), ('22', '3', '水贝'), ('23', '6', '民治'), ('24', '6', '布吉'), ('25', '6', '龙岗'), ('31', '7', '沙头角东'), ('32', '7', '小梅沙东'), ('33', '7', '小梅沙'), ('34', '7', '沙头角');
COMMIT;

-- ----------------------------
--  Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_type` VALUES ('1', '一房一厅'), ('2', '两房一厅'), ('3', '三房一厅'), ('4', '三房两厅');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  `TELEPHONE` varchar(32) DEFAULT NULL,
  `REALNAME` varchar(32) DEFAULT NULL,
  `ISADMIN` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '15800001234', '张三丰', 'y'), ('2', 'abc', 'abc', '15817412345', '王五', 'n'), ('3', 'abcd', 'abcd', '13512341234', '赵半山', 'n'), ('4', 'test', 'test', '13800138000', '吴六奇', 'y');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
