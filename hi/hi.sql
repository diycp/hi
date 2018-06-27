/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : hi

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-06-22 20:07:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classno` varchar(6) NOT NULL COMMENT '班级代号',
  `classname` varchar(20) NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`classno`) USING BTREE,
  KEY `classname` (`classname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('12', '网站开发3班');

-- ----------------------------
-- Table structure for dorm
-- ----------------------------
DROP TABLE IF EXISTS `dorm`;
CREATE TABLE `dorm` (
  `towno` varchar(5) NOT NULL COMMENT '楼号',
  `roomno` varchar(5) NOT NULL COMMENT '房间号',
  `amount` int(2) DEFAULT NULL COMMENT '床位数',
  `dsex` varchar(2) DEFAULT '男' COMMENT '宿舍性别',
  `ggrading` varchar(5) DEFAULT NULL COMMENT '宿舍等级',
  PRIMARY KEY (`towno`,`roomno`) USING BTREE,
  KEY `towno` (`towno`) USING BTREE,
  KEY `roomno` (`roomno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dorm
-- ----------------------------

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family` (
  `sid` varchar(18) NOT NULL COMMENT '身份证号',
  `sname` varchar(6) NOT NULL COMMENT '学生姓名',
  `relation` varchar(24) DEFAULT NULL COMMENT '关系',
  `parentname` varchar(26) DEFAULT NULL COMMENT '父母姓名',
  `parentwork` varchar(105) DEFAULT NULL COMMENT '工作单位',
  `parentphone` varchar(50) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `sname` (`sname`) USING BTREE,
  CONSTRAINT `family_ibfk_1` FOREIGN KEY (`sname`) REFERENCES `student` (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES ('440223199603164733', '张三', '父子,哥哥,母子', '李四,王麻子,西施', '12121212112,12313123131,12312312312', 'MMAOMF,爱的发顺丰,手动阀十分');
INSERT INTO `family` VALUES ('440223199603164736', '李四', '父子,父子,父子', '李四,李四,李四', '23123123123,23123131312,11111111111', '豆腐干豆腐干,123123123231,123123123231');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自动增量）',
  `sid` varchar(18) NOT NULL COMMENT '身份证号',
  `report` int(11) NOT NULL DEFAULT '0' COMMENT '报到情况',
  `phone1` char(11) NOT NULL COMMENT '联系电话1',
  `phone2` char(11) DEFAULT NULL COMMENT '联系电话2',
  `sick` int(11) DEFAULT NULL COMMENT '病史',
  `special` text COMMENT '特殊情况说明',
  `address` varchar(50) DEFAULT NULL COMMENT '家庭地址',
  `rmajor` int(11) DEFAULT NULL COMMENT '专业报到位数',
  `Deptno` int(11) DEFAULT NULL COMMENT '系报道位数',
  `prove` varchar(300) DEFAULT NULL COMMENT '贫困证明材料',
  `demoney` decimal(6,2) DEFAULT NULL COMMENT '银行扣费情况',
  `insurance` int(11) DEFAULT '0' COMMENT '保险，0不购买，1购买，2已付款',
  `Expense` decimal(6,0) DEFAULT '0' COMMENT '补交费用（一级宿舍补交）0无需补交，1需补交，2已补交',
  PRIMARY KEY (`id`,`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES ('1', '440223199603164733', '1', '12121111111', '12121111111', '0', '手动阀十分', '阿三发射点发生', null, null, '居委会/村/街道办贫困证明', '0.00', '0', '0');
INSERT INTO `register` VALUES ('2', '440223199603164736', '1', '11111111111', '12121111111', '0', 'sdfsadf', '阿三发射点发生', null, null, '无', '0.00', '0', '0');

-- ----------------------------
-- Table structure for specialty
-- ----------------------------
DROP TABLE IF EXISTS `specialty`;
CREATE TABLE `specialty` (
  `speno` varchar(6) NOT NULL COMMENT '专业代号',
  `spename` varchar(15) NOT NULL COMMENT '专业名称',
  PRIMARY KEY (`speno`) USING BTREE,
  KEY `spename` (`spename`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of specialty
-- ----------------------------
INSERT INTO `specialty` VALUES ('123', '计算机应用技术');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` varchar(18) NOT NULL COMMENT '身份证号',
  `sname` varchar(6) NOT NULL COMMENT '姓名',
  `ssex` char(2) DEFAULT '男' COMMENT '性别',
  `spename` varchar(15) DEFAULT NULL COMMENT '录取专业',
  `classname` varchar(15) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `spename` (`spename`) USING BTREE,
  KEY `classname` (`classname`) USING BTREE,
  KEY `sname` (`sname`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`spename`) REFERENCES `specialty` (`spename`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`classname`) REFERENCES `class` (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('440223199603164732', '叶过房', '男', '计算机应用技术', '网站开发3班');
INSERT INTO `student` VALUES ('440223199603164733', '张三', '男', '计算机应用技术', '网站开发3班');
INSERT INTO `student` VALUES ('440223199603164736', '李四', '男', '计算机应用技术', '网站开发3班');

-- ----------------------------
-- Table structure for studorm
-- ----------------------------
DROP TABLE IF EXISTS `studorm`;
CREATE TABLE `studorm` (
  `sid` varchar(18) NOT NULL COMMENT '身份证号',
  `towno` varchar(5) NOT NULL COMMENT '楼号',
  `roomno` varchar(5) NOT NULL COMMENT '房间号',
  PRIMARY KEY (`sid`,`towno`,`roomno`) USING BTREE,
  KEY `towno` (`towno`) USING BTREE,
  KEY `roomno` (`roomno`) USING BTREE,
  CONSTRAINT `studorm_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `studorm_ibfk_2` FOREIGN KEY (`towno`) REFERENCES `dorm` (`towno`),
  CONSTRAINT `studorm_ibfk_3` FOREIGN KEY (`roomno`) REFERENCES `dorm` (`roomno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of studorm
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '编号（自动增量',
  `uname` varchar(18) NOT NULL COMMENT '用户名',
  `upassword` varchar(18) NOT NULL COMMENT '密码',
  `Role` int(11) NOT NULL COMMENT '权限',
  PRIMARY KEY (`uname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
