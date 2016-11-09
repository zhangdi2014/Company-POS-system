/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : pos

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-11-08 20:25:57
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
  `Alevel` varchar(20) NOT NULL,
  PRIMARY KEY (`Aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admininfo
-- ----------------------------

-- ----------------------------
-- Table structure for `consumerback`
-- ----------------------------
DROP TABLE IF EXISTS `consumerback`;
CREATE TABLE `consumerback` (
  `CBid` varchar(20) NOT NULL,
  `Cid` varchar(10) NOT NULL,
  `Eid` varchar(20) NOT NULL,
  `CBdate` date NOT NULL,
  PRIMARY KEY (`CBid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consumerback
-- ----------------------------

-- ----------------------------
-- Table structure for `consumerbackdetail`
-- ----------------------------
DROP TABLE IF EXISTS `consumerbackdetail`;
CREATE TABLE `consumerbackdetail` (
  `Cbdid` varchar(20) NOT NULL,
  `Cbid` varchar(20) NOT NULL,
  `Gid` varchar(20) NOT NULL,
  `Cbdamount` int(11) NOT NULL,
  `Cbdprice` double DEFAULT NULL,
  `Cbdtotalprice` double DEFAULT NULL,
  PRIMARY KEY (`Cbdid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Cemail` varchar(50) DEFAULT NULL,
  `Cremark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consumerinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `goodsclassinfo`
-- ----------------------------
DROP TABLE IF EXISTS `goodsclassinfo`;
CREATE TABLE `goodsclassinfo` (
  `GCid` varchar(20) NOT NULL,
  `GCname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GCid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodsclassinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `goodsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo` (
  `Gid` varchar(20) NOT NULL,
  `Gname` varchar(50) NOT NULL,
  `GCid` varchar(20) NOT NULL,
  `Gunit` varchar(10) NOT NULL,
  `Gpin` double NOT NULL,
  `Gpout` double NOT NULL,
  `Gamount` int(11) NOT NULL,
  PRIMARY KEY (`Gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `providerback`
-- ----------------------------
DROP TABLE IF EXISTS `providerback`;
CREATE TABLE `providerback` (
  `Pbid` varchar(20) NOT NULL,
  `Pid` varchar(20) NOT NULL,
  `Sid` varchar(20) NOT NULL,
  `PBdate` date NOT NULL,
  PRIMARY KEY (`Pbid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of providerback
-- ----------------------------

-- ----------------------------
-- Table structure for `providerbackdetail`
-- ----------------------------
DROP TABLE IF EXISTS `providerbackdetail`;
CREATE TABLE `providerbackdetail` (
  `Pbdid` varchar(20) NOT NULL,
  `Pbid` varchar(20) NOT NULL,
  `Gid` varchar(20) NOT NULL,
  `Pbdamount` int(11) NOT NULL,
  `Pbdprice` double DEFAULT NULL,
  `Pbdtotalprice` double DEFAULT NULL,
  PRIMARY KEY (`Pbdid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Pinkman` varchar(50) NOT NULL,
  `Paddress` varchar(50) NOT NULL,
  `Pel` varchar(20) NOT NULL,
  `Pemail` varchar(50) DEFAULT NULL,
  `Premark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of providerinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `selldetail`
-- ----------------------------
DROP TABLE IF EXISTS `selldetail`;
CREATE TABLE `selldetail` (
  `EDid` varchar(20) NOT NULL,
  `Eid` varchar(20) NOT NULL,
  `Gid` varchar(20) NOT NULL,
  `EDamount` int(11) NOT NULL,
  `EDprice` double NOT NULL DEFAULT '0',
  `EDtotalprice` double DEFAULT NULL,
  PRIMARY KEY (`EDid`,`EDprice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of selldetail
-- ----------------------------

-- ----------------------------
-- Table structure for `sellinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sellinfo`;
CREATE TABLE `sellinfo` (
  `Eid` varchar(20) NOT NULL,
  `Cid` varchar(20) NOT NULL,
  `Edate` date DEFAULT NULL,
  `Etotalprice` double NOT NULL,
  `Ebuyer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sellinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `stockdetail`
-- ----------------------------
DROP TABLE IF EXISTS `stockdetail`;
CREATE TABLE `stockdetail` (
  `SDid` varchar(20) NOT NULL,
  `Sid` varchar(20) NOT NULL,
  `Gid` varchar(20) NOT NULL,
  `SDamount` int(11) NOT NULL,
  `SDprice` double DEFAULT NULL,
  `SDtotalprice` double DEFAULT NULL,
  PRIMARY KEY (`SDid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stockdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `stockinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stockinfo`;
CREATE TABLE `stockinfo` (
  `Sid` varchar(20) NOT NULL,
  `Pid` varchar(20) NOT NULL,
  `Sdate` date DEFAULT NULL,
  `Stotalprice` double NOT NULL,
  `Sbuyer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stockinfo
-- ----------------------------
