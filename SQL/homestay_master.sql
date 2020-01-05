/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : homestay_master

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-06-13 19:56:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(255) NOT NULL,
  `sex` int(5) DEFAULT NULL COMMENT '0女 1男',
  `phone` bigint(30) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', '马小小', '0', '17868684545', '612535199102026975');
INSERT INTO `customers` VALUES ('3', '李大锤', '1', '17868812254', '612456199636357546');
INSERT INTO `customers` VALUES ('4', '李笨笨', '1', '17868812236', '612526199636458555');
INSERT INTO `customers` VALUES ('5', '胖大海', '1', '17868812262', '951263196805189626');
INSERT INTO `customers` VALUES ('7', '葫芦娃', '0', '17868812252', '147852369852147412');
INSERT INTO `customers` VALUES ('8', '枸杞', '0', '17868812265', '852369789654128523');
INSERT INTO `customers` VALUES ('9', '黄芪', '1', '17868812254', '963258789465788521');
INSERT INTO `customers` VALUES ('10', '灰太狼', '1', '17868845565', '963258147845217555');
INSERT INTO `customers` VALUES ('11', '王大锤', '1', '17868845565', '852147785412549556');
INSERT INTO `customers` VALUES ('12', '王大锤', '1', '17868812252', '852147986512453562');
INSERT INTO `customers` VALUES ('13', '张三', '1', '17868812242', '612455475556222214');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) NOT NULL,
  `cus_id_card` varchar(255) NOT NULL,
  `room_id` int(11) NOT NULL,
  `order_status` int(5) DEFAULT NULL COMMENT '0已完成 1进行中',
  `amount_paid` decimal(10,2) DEFAULT NULL COMMENT '已付金额',
  `deposit` decimal(10,2) DEFAULT NULL COMMENT '押金',
  `is_deposit_return` int(5) DEFAULT NULL COMMENT '押金是否已退',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `follow_cus_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'WDD2019052001', '612535199102026975', '1', '0', '229.99', '100.00', '0', '2019-05-20 20:07:22', '2019-05-21 14:00:00', null);
INSERT INTO `orders` VALUES ('2', 'WDD20180525001', '612526199636458555', '2', '0', '189.99', '100.00', '0', '2019-05-23 17:49:14', '2019-05-24 14:00:00', null);
INSERT INTO `orders` VALUES ('3', 'WDD20150523002', '951263196805189626', '18', '0', '299.99', '100.00', '0', '2019-05-23 18:19:17', '2019-05-24 14:00:00', null);
INSERT INTO `orders` VALUES ('4', 'WDD20180523004', '147852369852147412', '16', '0', '229.99', '100.00', '0', '2019-05-23 23:47:59', '2019-05-24 14:00:00', null);
INSERT INTO `orders` VALUES ('5', 'WDD20190523005', '852369789654128523', '19', '0', '255.50', '100.00', '0', '2019-05-23 23:49:30', '2019-05-24 14:00:00', null);
INSERT INTO `orders` VALUES ('7', 'WDD20190525001', '852147986512453562', '20', '0', '188.88', '100.00', '0', '2019-05-25 14:14:43', '2019-05-26 14:00:00', null);
INSERT INTO `orders` VALUES ('8', 'WDD20190523002', '612455475556222214', '21', '0', '266.65', '100.00', '0', '2019-05-25 15:08:40', '2019-05-26 14:00:00', null);

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_num` int(11) NOT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `available_num` int(5) DEFAULT NULL,
  `bed_type` int(5) DEFAULT NULL COMMENT '1 单人床 2双人床',
  `bed_num` int(5) DEFAULT NULL,
  `window` int(5) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES ('1', '1001', '王多多主卧', '2', '2', '1', '2', '129.99');
INSERT INTO `rooms` VALUES ('2', '1002', '风情海景房', '1', '1', '1', '1', '89.99');
INSERT INTO `rooms` VALUES ('16', '1003', '柯南主题房', '2', '2', '2', '1', '129.99');
INSERT INTO `rooms` VALUES ('18', '2001', '海贼王主题房', '2', '2', '1', '2', '199.99');
INSERT INTO `rooms` VALUES ('19', '2002', '叫啥名呢', '2', '2', '2', '1', '155.50');
INSERT INTO `rooms` VALUES ('20', '1505', '叫啥名2', '1', '1', '1', '1', '88.88');
INSERT INTO `rooms` VALUES ('21', '1235', '你说叫啥名', '2', '2', '2', '2', '166.65');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `phone` bigint(30) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `registerdate` datetime DEFAULT NULL,
  `lastlogindate` datetime DEFAULT NULL,
  `logincount` int(11) DEFAULT NULL,
  `identity` int(11) DEFAULT NULL COMMENT '用户身份：0房东 1管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '王多多', '男', '17868812243', '123456', '612455199505059682', '2019-05-05 20:30:29', '2019-06-10 23:41:10', '62', '0');
INSERT INTO `users` VALUES ('2', '李笨笨', '男', '17868812242', '123456', '612455199605059696', '2019-05-25 00:38:30', '2019-06-10 23:41:02', '5', '1');
