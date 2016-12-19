/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : pos

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2016-12-19 15:49:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admininfo`
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
INSERT INTO `admininfo` VALUES ('10002', '李晓阳', '1234', '普通');

-- ----------------------------
-- Table structure for `consumerback`
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
INSERT INTO `consumerback` VALUES ('10001', '10002', '10001', '2016-12-12');
INSERT INTO `consumerback` VALUES ('10002', '10004', '10002', '2016-12-12');
INSERT INTO `consumerback` VALUES ('10003', '10002', '10001', '2016-12-12');
INSERT INTO `consumerback` VALUES ('10004', '10002', '10001', '2016-12-12');
INSERT INTO `consumerback` VALUES ('10005', '10002', '10001', '2016-12-12');
INSERT INTO `consumerback` VALUES ('10006', '10004', '10002', '2016-12-12');

-- ----------------------------
-- Table structure for `consumerbackdetail`
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
-- Table structure for `consumerinfo`
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
INSERT INTO `consumerinfo` VALUES ('10002', '专卖店', '王先生', '保定', '2134567', 'hebei@sina.com', '正品行货');
INSERT INTO `consumerinfo` VALUES ('10003', '旗舰店', '李先生', '广东', '1234567', 'heut@sina.com', '暂无户');
INSERT INTO `consumerinfo` VALUES ('10004', '商场', '张先生', '杭州', '1234567', 'heut@sina.com', '专供');
INSERT INTO `consumerinfo` VALUES ('10005', '手机官网', '张先生', '深圳', '1234567', 'heut@sina.com', '正品行货');

-- ----------------------------
-- Table structure for `goodsclassinfo`
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
INSERT INTO `goodsclassinfo` VALUES ('10002', '计算机');
INSERT INTO `goodsclassinfo` VALUES ('10003', '手机');
INSERT INTO `goodsclassinfo` VALUES ('10004', '电视');
INSERT INTO `goodsclassinfo` VALUES ('10005', '平板');
INSERT INTO `goodsclassinfo` VALUES ('10006', '风衣');

-- ----------------------------
-- Table structure for `goodsinfo`
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
INSERT INTO `goodsinfo` VALUES ('10018', '华为 mate9', '10003', '92', '台', '3000', '3399');
INSERT INTO `goodsinfo` VALUES ('10021', '小米 MIX', '10003', '1', '台', '4000', '49');
INSERT INTO `goodsinfo` VALUES ('10022', 'MacBook Pro', '10002', '20', '台', '12000', '18999');
INSERT INTO `goodsinfo` VALUES ('10023', '三星 s7edge', '10003', '100', '台', '3500', '5399');
INSERT INTO `goodsinfo` VALUES ('10025', '联想R2000S', '10002', '3', '台', '45000', '60000');
INSERT INTO `goodsinfo` VALUES ('10026', '华硕', '10002', '20', '台', '4500', '5499');
INSERT INTO `goodsinfo` VALUES ('10027', '三星（SAMSUNG）', '10004', '27', '台', '3500', '6000');
INSERT INTO `goodsinfo` VALUES ('10028', 'Sony U9', '10004', '30', '台', '4000', '6000');
INSERT INTO `goodsinfo` VALUES ('10029', 'iPad Pro', '10005', '582', '台', '7000', '9999');
INSERT INTO `goodsinfo` VALUES ('10030', 'iPad Air2', '10005', '201', '台', '1800', '2699');
INSERT INTO `goodsinfo` VALUES ('10031', '荣耀magic', '10003', '10', '台', '2500', '4000');
INSERT INTO `goodsinfo` VALUES ('10032', '荣耀v8', '10003', '21', '台', '1800', '2799');

-- ----------------------------
-- Table structure for `providerback`
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
INSERT INTO `providerback` VALUES ('10001', '10007', '10002', '2016-12-13');

-- ----------------------------
-- Table structure for `providerbackdetail`
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
-- Table structure for `providerinfo`
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
INSERT INTO `providerinfo` VALUES ('10007', '三星', '董小姐', '东莞', '46587769', '23436999@sina.com', '电视供应商');
INSERT INTO `providerinfo` VALUES ('10008', '鸿海', '李先生', '广州', '8325346', '2346587@sina.com', '暂无');

-- ----------------------------
-- Table structure for `selldetail`
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
INSERT INTO `selldetail` VALUES ('10001', '10001', '10018', '9', '3399', '30591');

-- ----------------------------
-- Table structure for `sellinfo`
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
INSERT INTO `sellinfo` VALUES ('10001', '10002', '2016-12-01', '赵先生', '30591');
INSERT INTO `sellinfo` VALUES ('10002', '10004', '2016-12-12', '赵女士', '123');

-- ----------------------------
-- Table structure for `stockdetail`
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
INSERT INTO `stockdetail` VALUES ('10001', '10002', '10018', '1', '3000', '3000');

-- ----------------------------
-- Table structure for `stockinfo`
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
INSERT INTO `stockinfo` VALUES ('10002', '10008', '2016-12-05', '李先生', '3000');
INSERT INTO `stockinfo` VALUES ('10003', '10007', '2016-12-05', '王先生', '35576');
INSERT INTO `stockinfo` VALUES ('10004', '10008', '2016-12-12', '3214324', '3546547');
INSERT INTO `stockinfo` VALUES ('10005', '10007', '2016-12-12', '刘女士', '2121321');
INSERT INTO `stockinfo` VALUES ('10006', '10008', '2016-12-12', '12', '12');
