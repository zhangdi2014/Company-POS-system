/*
Navicat MySQL Data Transfer

Source Server         : 28root
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : feidapos

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-11-11 18:18:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `Aid` varchar(20) NOT NULL,
  `Aname` varchar(50) NOT NULL,
  `Apwd` varchar(20) NOT NULL,
  `Alevel` varchar(20) DEFAULT '普通',
  PRIMARY KEY (`Aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES ('10001', 'zrk', '12345', '超级');
INSERT INTO `admininfo` VALUES ('10002', 'cgq', '12345', '普通');
INSERT INTO `admininfo` VALUES ('10003', 'hxl', '12345', '普通');

-- ----------------------------
-- Table structure for consumerback
-- ----------------------------
DROP TABLE IF EXISTS `consumerback`;
CREATE TABLE `consumerback` (
  `CBid` varchar(20) NOT NULL,
  `Cid` varchar(20) DEFAULT NULL,
  `Eid` varchar(20) DEFAULT NULL,
  `CBdate` date DEFAULT NULL,
  PRIMARY KEY (`CBid`),
  KEY `Cid` (`Cid`),
  KEY `Eid` (`Eid`),
  CONSTRAINT `consumerback_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `consumerinfo` (`Cid`) ON DELETE CASCADE,
  CONSTRAINT `consumerback_ibfk_2` FOREIGN KEY (`Eid`) REFERENCES `sellinfo` (`Eid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumerback
-- ----------------------------

-- ----------------------------
-- Table structure for consumerbackdetail
-- ----------------------------
DROP TABLE IF EXISTS `consumerbackdetail`;
CREATE TABLE `consumerbackdetail` (
  `CBDid` varchar(20) NOT NULL,
  `CBid` varchar(20) DEFAULT NULL,
  `Gid` varchar(20) DEFAULT NULL,
  `CBDamount` int(11) NOT NULL,
  `CBDprice` double DEFAULT NULL,
  `CBDtotalprice` double DEFAULT NULL,
  PRIMARY KEY (`CBDid`),
  KEY `CBid` (`CBid`),
  KEY `Gid` (`Gid`),
  CONSTRAINT `consumerbackdetail_ibfk_1` FOREIGN KEY (`CBid`) REFERENCES `consumerback` (`CBid`) ON DELETE CASCADE,
  CONSTRAINT `consumerbackdetail_ibfk_2` FOREIGN KEY (`Gid`) REFERENCES `goodsinfo` (`Gid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumerbackdetail
-- ----------------------------

-- ----------------------------
-- Table structure for consumerinfo
-- ----------------------------
DROP TABLE IF EXISTS `consumerinfo`;
CREATE TABLE `consumerinfo` (
  `Cid` varchar(20) NOT NULL,
  `Cname` varchar(50) NOT NULL,
  `Clinkman` varchar(50) NOT NULL,
  `Caddress` varchar(50) NOT NULL,
  `Ctel` varchar(20) NOT NULL,
  `Cemail` varchar(50) DEFAULT '暂无',
  `Cremark` varchar(100) DEFAULT '暂无',
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumerinfo
-- ----------------------------
INSERT INTO `consumerinfo` VALUES ('10001', '奇川贸易', '张先生', '唐山', '1234567', 'ligong@sina.com', '暂无');
INSERT INTO `consumerinfo` VALUES ('10002', '唐山物流', '王先生', '保定', '2134567', 'hebei@sina.com', '暂无');
INSERT INTO `consumerinfo` VALUES ('10003', '理工货运', '张先生', '唐山', '1234567', 'heut@sina.com', '暂无户');
INSERT INTO `consumerinfo` VALUES ('10004', '唐山科技', '张先生', '唐山', '1234567', 'heut@sina.com', '暂无');
INSERT INTO `consumerinfo` VALUES ('10005', '河北贸易', '张先生', '唐山', '1234567', 'heut@sina.com', '暂无');

-- ----------------------------
-- Table structure for goodsclassinfo
-- ----------------------------
DROP TABLE IF EXISTS `goodsclassinfo`;
CREATE TABLE `goodsclassinfo` (
  `GCid` varchar(20) NOT NULL,
  `GCname` varchar(50) NOT NULL,
  PRIMARY KEY (`GCid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsclassinfo
-- ----------------------------
INSERT INTO `goodsclassinfo` VALUES ('10001', '水果');
INSERT INTO `goodsclassinfo` VALUES ('10002', '电脑');
INSERT INTO `goodsclassinfo` VALUES ('10003', '手机');
INSERT INTO `goodsclassinfo` VALUES ('10004', '电视');

-- ----------------------------
-- Table structure for goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo` (
  `Gid` varchar(20) NOT NULL,
  `Gname` varchar(50) NOT NULL,
  `GCid` varchar(20) DEFAULT NULL,
  `Gamount` int(11) NOT NULL,
  `Gunit` varchar(10) NOT NULL,
  `Gpin` double NOT NULL,
  `Gpout` double NOT NULL,
  PRIMARY KEY (`Gid`),
  KEY `GCid` (`GCid`),
  CONSTRAINT `goodsinfo_ibfk_1` FOREIGN KEY (`GCid`) REFERENCES `goodsclassinfo` (`GCid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO `goodsinfo` VALUES ('10001', '苹果', '10001', '20', '斤', '11', '20');
INSERT INTO `goodsinfo` VALUES ('10002', '梨', '10001', '20', '斤', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10003', '桃子', '10001', '20', '斤', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10004', '桔子', '10001', '20', '斤', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10005', '香焦', '10001', '20', '斤', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10006', '联想笔记本5000', '10002', '20', '台', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10007', '苹果笔记本4100', '10002', '20', '台', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10008', '惠普笔记本3240', '10002', '20', '台', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10009', '夏新手机M630', '10003', '20', '台', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10010', '诺基亚5200', '10003', '20', '台', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10011', '索爱1100', '10003', '20', '台', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10012', '联想电视机', '10004', '20', '台', '10', '20');
INSERT INTO `goodsinfo` VALUES ('10013', 'TCL电视机', '10004', '20', '台', '10', '20');

-- ----------------------------
-- Table structure for providerback
-- ----------------------------
DROP TABLE IF EXISTS `providerback`;
CREATE TABLE `providerback` (
  `PBid` varchar(20) NOT NULL,
  `Pid` varchar(20) DEFAULT NULL,
  `Sid` varchar(20) DEFAULT NULL,
  `PBdate` date DEFAULT NULL,
  PRIMARY KEY (`PBid`),
  KEY `Pid` (`Pid`),
  KEY `Sid` (`Sid`),
  CONSTRAINT `providerback_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `providerinfo` (`Pid`) ON DELETE CASCADE,
  CONSTRAINT `providerback_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `stockinfo` (`Sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of providerback
-- ----------------------------

-- ----------------------------
-- Table structure for providerbackdetail
-- ----------------------------
DROP TABLE IF EXISTS `providerbackdetail`;
CREATE TABLE `providerbackdetail` (
  `PBDid` varchar(20) DEFAULT NULL,
  `PBid` varchar(20) DEFAULT NULL,
  `Gid` varchar(20) DEFAULT NULL,
  `PBDamount` int(11) NOT NULL,
  `PBDprice` double DEFAULT NULL,
  `PBDtotalprice` double DEFAULT NULL,
  KEY `PBid` (`PBid`),
  KEY `Gid` (`Gid`),
  CONSTRAINT `providerbackdetail_ibfk_1` FOREIGN KEY (`PBid`) REFERENCES `providerback` (`PBid`) ON DELETE CASCADE,
  CONSTRAINT `providerbackdetail_ibfk_2` FOREIGN KEY (`Gid`) REFERENCES `goodsinfo` (`Gid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of providerbackdetail
-- ----------------------------

-- ----------------------------
-- Table structure for providerinfo
-- ----------------------------
DROP TABLE IF EXISTS `providerinfo`;
CREATE TABLE `providerinfo` (
  `Pid` varchar(20) NOT NULL,
  `Pname` varchar(50) NOT NULL,
  `Plinkman` varchar(50) NOT NULL,
  `Paddress` varchar(50) NOT NULL,
  `Ptel` varchar(20) NOT NULL,
  `Pemail` varchar(50) DEFAULT NULL,
  `Premark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of providerinfo
-- ----------------------------
INSERT INTO `providerinfo` VALUES ('10001', '河北数码', '张先生', '唐山', '1234567', 'ligong@sina.com', '暂无');
INSERT INTO `providerinfo` VALUES ('10002', '唐山数码', '王先生', '保定', '2134567', 'hebei@sina.com', '暂无');
INSERT INTO `providerinfo` VALUES ('10003', '北京数码', '张先生', '唐山', '1234567', 'heut@sina.com', '暂无');
INSERT INTO `providerinfo` VALUES ('10004', '唐山电脑城', '张先生', '唐山', '1234567', 'heut@sina.com', '暂无');
INSERT INTO `providerinfo` VALUES ('10005', '河北电脑城', '张先生', '唐山', '1234567', 'heut@sina.com', '暂无');

-- ----------------------------
-- Table structure for selldetail
-- ----------------------------
DROP TABLE IF EXISTS `selldetail`;
CREATE TABLE `selldetail` (
  `EDid` varchar(20) NOT NULL,
  `Eid` varchar(20) DEFAULT NULL,
  `Gid` varchar(20) DEFAULT NULL,
  `EDamount` int(11) NOT NULL,
  `EDprice` double DEFAULT NULL,
  `EDtotalprice` double DEFAULT NULL,
  PRIMARY KEY (`EDid`),
  KEY `Eid` (`Eid`),
  KEY `Gid` (`Gid`),
  CONSTRAINT `selldetail_ibfk_1` FOREIGN KEY (`Eid`) REFERENCES `sellinfo` (`Eid`) ON DELETE CASCADE,
  CONSTRAINT `selldetail_ibfk_2` FOREIGN KEY (`Gid`) REFERENCES `goodsinfo` (`Gid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selldetail
-- ----------------------------

-- ----------------------------
-- Table structure for sellinfo
-- ----------------------------
DROP TABLE IF EXISTS `sellinfo`;
CREATE TABLE `sellinfo` (
  `Eid` varchar(20) NOT NULL,
  `Cid` varchar(20) DEFAULT NULL,
  `Edate` date DEFAULT NULL,
  `Eseller` varchar(50) DEFAULT NULL,
  `Etotalprice` double NOT NULL,
  PRIMARY KEY (`Eid`),
  KEY `Cid` (`Cid`),
  CONSTRAINT `sellinfo_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `consumerinfo` (`Cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellinfo
-- ----------------------------

-- ----------------------------
-- Table structure for stockdetail
-- ----------------------------
DROP TABLE IF EXISTS `stockdetail`;
CREATE TABLE `stockdetail` (
  `SDid` varchar(20) NOT NULL,
  `Sid` varchar(20) DEFAULT NULL,
  `Gid` varchar(20) DEFAULT NULL,
  `SDamount` int(11) NOT NULL,
  `SDprice` double DEFAULT NULL,
  `SDtotalprice` double DEFAULT NULL,
  PRIMARY KEY (`SDid`),
  KEY `Sid` (`Sid`),
  KEY `Gid` (`Gid`),
  CONSTRAINT `stockdetail_ibfk_1` FOREIGN KEY (`Sid`) REFERENCES `stockinfo` (`Sid`) ON DELETE CASCADE,
  CONSTRAINT `stockdetail_ibfk_2` FOREIGN KEY (`Gid`) REFERENCES `goodsinfo` (`Gid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockdetail
-- ----------------------------

-- ----------------------------
-- Table structure for stockinfo
-- ----------------------------
DROP TABLE IF EXISTS `stockinfo`;
CREATE TABLE `stockinfo` (
  `Sid` varchar(20) NOT NULL,
  `Pid` varchar(20) DEFAULT NULL,
  `Sdate` date DEFAULT NULL,
  `Sbuyer` varchar(50) DEFAULT NULL,
  `Stotalprice` double NOT NULL,
  PRIMARY KEY (`Sid`),
  KEY `Pid` (`Pid`),
  CONSTRAINT `stockinfo_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `providerinfo` (`Pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockinfo
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
