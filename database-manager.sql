/*
 Navicat Premium Data Transfer

 Source Server         : Aliyun
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : 120.26.178.165:3306
 Source Schema         : database-manager

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 27/06/2020 22:53:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户类型',
  `linkpeople` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通信地址',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '小张', '贵宾', '张小小', '123456789', '1234567@qq.com', '他欠我钱');
INSERT INTO `customer` VALUES (23, '小王', '普通客户', '诸葛亮', '13120456266', '123456@qq.com', '三国蜀国丞相');
INSERT INTO `customer` VALUES (24, '小李', '普通客户', '李世民', '13120456266', '869830837@qq.com', '贞观之治');
INSERT INTO `customer` VALUES (25, '小周', '普通客户', '周瑜', '13120456266', '123456@qq.com', '吴国大将');
INSERT INTO `customer` VALUES (26, '小王', '普通客户', '王莽', '13120456266', '123456@qq.com', '王莽篡汉');

-- ----------------------------
-- Table structure for outstock
-- ----------------------------
DROP TABLE IF EXISTS `outstock`;
CREATE TABLE `outstock`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '出库编号',
  `pid` int(10) NOT NULL COMMENT '产品编号',
  `rid` int(10) NOT NULL COMMENT '仓库编号',
  `amount` int(10) NOT NULL COMMENT '出库数量',
  `datetime` date NOT NULL COMMENT '出库日期',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经办人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  CONSTRAINT `outstock_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `outstock_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `repository` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outstock
-- ----------------------------
INSERT INTO `outstock` VALUES (5, 1, 1, 1, '2020-05-30', '小张');
INSERT INTO `outstock` VALUES (6, 1, 1, 20, '2020-05-30', '小智');
INSERT INTO `outstock` VALUES (7, 2, 1, 30, '2020-06-03', '小明');
INSERT INTO `outstock` VALUES (8, 4, 1, 20, '2020-06-05', '小组');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `specification` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品规格',
  `price` float NOT NULL COMMENT '产品价格',
  `upper` int(11) NOT NULL COMMENT '数量上限',
  `lower` int(11) NOT NULL COMMENT '数量下限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '牛奶', '蒙古特级奶牛', 5, 100, 30);
INSERT INTO `product` VALUES (2, '辣条', '中国特产', 4.8, 100, 30);
INSERT INTO `product` VALUES (3, '牛肉', '日本和牛', 90, 100, 30);
INSERT INTO `product` VALUES (4, '面包', '法国面包', 78, 100, 30);
INSERT INTO `product` VALUES (5, '面包', '英国面包', 93, 100, 30);
INSERT INTO `product` VALUES (6, '薯片', '美国公司', 7, 100, 30);
INSERT INTO `product` VALUES (7, '可乐', '百事可乐', 5.4, 100, 30);
INSERT INTO `product` VALUES (8, '可乐', '可口可乐', 5.7, 100, 30);
INSERT INTO `product` VALUES (9, '雪碧', '可口可乐', 6.9, 100, 30);
INSERT INTO `product` VALUES (10, '雪碧', '七喜', 6.5, 100, 30);
INSERT INTO `product` VALUES (11, '薯片', '日本公司生产', 6.5, 100, 30);
INSERT INTO `product` VALUES (15, '泡面', '统一', 5, 100, 30);
INSERT INTO `product` VALUES (19, '卫生纸', '心心相印', 5, 100, 30);
INSERT INTO `product` VALUES (20, '华为P30', '华为', 4300, 100, 30);
INSERT INTO `product` VALUES (21, '苹果', '富士', 8, 100, 30);
INSERT INTO `product` VALUES (22, '香蕉', '很甜', 8, 100, 30);
INSERT INTO `product` VALUES (23, '白菜', '甜心白菜', 6.8, 100, 30);
INSERT INTO `product` VALUES (24, '猪肉', '国外进口', 20.9, 100, 30);
INSERT INTO `product` VALUES (25, '羊肉', '山上的小羊羔', 40.99, 100, 30);
INSERT INTO `product` VALUES (26, '火腿', '金华火腿', 2000, 100, 30);
INSERT INTO `product` VALUES (29, '小米8', '小米旗舰', 1000, 100, 30);
INSERT INTO `product` VALUES (30, '小米9', '小米旗舰', 2000, 100, 30);
INSERT INTO `product` VALUES (31, '华为P40', '华为P系列', 4300, 100, 30);
INSERT INTO `product` VALUES (32, '华为Mate40', '华为Mate系列', 5000, 100, 30);
INSERT INTO `product` VALUES (33, '玩具手枪', '小朋友玩具', 100, 100, 30);
INSERT INTO `product` VALUES (34, '玩具挖掘机', '塑料', 300, 100, 30);
INSERT INTO `product` VALUES (35, '男士洗面奶', '杰威尔', 100, 100, 30);
INSERT INTO `product` VALUES (36, '男士面膜', '水密码', 100, 100, 30);
INSERT INTO `product` VALUES (37, '女士洗面奶', '丹姿', 100, 100, 30);
INSERT INTO `product` VALUES (38, '洗发水', '清扬', 40, 100, 30);
INSERT INTO `product` VALUES (39, '洗发水', '飘柔', 40, 100, 30);

-- ----------------------------
-- Table structure for repository
-- ----------------------------
DROP TABLE IF EXISTS `repository`;
CREATE TABLE `repository`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库名称',
  `details` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repository
-- ----------------------------
INSERT INTO `repository` VALUES (1, '一号仓库', '存放食品');
INSERT INTO `repository` VALUES (2, '二号仓库', '存放生活用品');
INSERT INTO `repository` VALUES (3, '三号仓库', '存放化妆品');
INSERT INTO `repository` VALUES (4, '四号仓库', '存放小朋友玩具');
INSERT INTO `repository` VALUES (5, '五号仓库', '存放手机');
INSERT INTO `repository` VALUES (6, '六号仓库', '存放电脑，笔记本电脑，平板');
INSERT INTO `repository` VALUES (7, '七号仓库', '存放废物');
INSERT INTO `repository` VALUES (8, '八号仓库', '存放一些杂物');
INSERT INTO `repository` VALUES (9, '九号仓库', '存放二手电子产品');
INSERT INTO `repository` VALUES (10, '十号仓库', '存放汽车轮胎');
INSERT INTO `repository` VALUES (11, '十一号仓库', '存放宝马汽车');
INSERT INTO `repository` VALUES (12, '十二号仓库', '存放奔驰');
INSERT INTO `repository` VALUES (13, '十三号仓库', '存放法拉利');
INSERT INTO `repository` VALUES (14, '十四号仓库', '存放蔬菜');
INSERT INTO `repository` VALUES (15, '十五号仓库', '存放鸡、鸭、鱼、羊、猪肉');
INSERT INTO `repository` VALUES (16, '十六号仓库', '存放男士上衣');
INSERT INTO `repository` VALUES (17, '十七好仓库', '存放男士裤子，鞋子');
INSERT INTO `repository` VALUES (21, '十八号仓库', '存放奶粉');
INSERT INTO `repository` VALUES (22, '十九号仓库', '存放易燃、易爆物品，禁止烟火');
INSERT INTO `repository` VALUES (23, '二十号仓库', '存放水果');
INSERT INTO `repository` VALUES (25, '子弹仓库', '存放子弹，禁止燃烧');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `pid` int(10) NOT NULL COMMENT '商品主键',
  `rid` int(10) NOT NULL COMMENT '仓库主键',
  `amount` int(10) NOT NULL COMMENT '产品库存数量',
  PRIMARY KEY (`pid`, `rid`) USING BTREE,
  INDEX `stock_ibfk_2`(`rid`) USING BTREE,
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `repository` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (1, 1, 50);
INSERT INTO `stock` VALUES (2, 1, 58);
INSERT INTO `stock` VALUES (3, 1, 68);
INSERT INTO `stock` VALUES (4, 1, 48);
INSERT INTO `stock` VALUES (5, 1, 68);
INSERT INTO `stock` VALUES (6, 1, 68);
INSERT INTO `stock` VALUES (7, 1, 68);
INSERT INTO `stock` VALUES (8, 1, 68);
INSERT INTO `stock` VALUES (9, 1, 68);
INSERT INTO `stock` VALUES (10, 1, 68);
INSERT INTO `stock` VALUES (11, 1, 68);
INSERT INTO `stock` VALUES (15, 1, 68);
INSERT INTO `stock` VALUES (19, 2, 68);
INSERT INTO `stock` VALUES (20, 5, 68);
INSERT INTO `stock` VALUES (21, 23, 68);
INSERT INTO `stock` VALUES (22, 23, 68);
INSERT INTO `stock` VALUES (23, 14, 68);
INSERT INTO `stock` VALUES (24, 15, 68);
INSERT INTO `stock` VALUES (25, 15, 68);
INSERT INTO `stock` VALUES (26, 15, 68);
INSERT INTO `stock` VALUES (29, 5, 68);
INSERT INTO `stock` VALUES (30, 5, 68);
INSERT INTO `stock` VALUES (31, 5, 68);
INSERT INTO `stock` VALUES (32, 5, 68);
INSERT INTO `stock` VALUES (33, 4, 68);
INSERT INTO `stock` VALUES (34, 4, 68);
INSERT INTO `stock` VALUES (35, 3, 68);
INSERT INTO `stock` VALUES (36, 3, 68);
INSERT INTO `stock` VALUES (37, 3, 68);
INSERT INTO `stock` VALUES (38, 3, 68);

-- ----------------------------
-- Table structure for stocking
-- ----------------------------
DROP TABLE IF EXISTS `stocking`;
CREATE TABLE `stocking`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '入库号',
  `pid` int(10) NOT NULL COMMENT '产品编号',
  `rid` int(10) NOT NULL COMMENT '仓库编号',
  `amount` int(10) NOT NULL COMMENT '入库数量',
  `datetime` date NOT NULL COMMENT '入库日期',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入库人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  CONSTRAINT `stocking_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stocking_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `repository` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stocking
-- ----------------------------
INSERT INTO `stocking` VALUES (25, 1, 1, 2, '2020-05-29', '小张');
INSERT INTO `stocking` VALUES (26, 1, 1, 30, '2020-05-29', '小张');
INSERT INTO `stocking` VALUES (27, 1, 1, 20, '2020-06-01', '小米');
INSERT INTO `stocking` VALUES (28, 2, 1, 20, '2020-06-03', '小智');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作用户',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作方法名',
  `describes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法描述',
  `time` datetime(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 337 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (36, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 10:37:24');
INSERT INTO `syslog` VALUES (37, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 10:37:24');
INSERT INTO `syslog` VALUES (38, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 10:37:24');
INSERT INTO `syslog` VALUES (39, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 10:41:53');
INSERT INTO `syslog` VALUES (40, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 10:41:53');
INSERT INTO `syslog` VALUES (41, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 10:41:54');
INSERT INTO `syslog` VALUES (42, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 13:47:02');
INSERT INTO `syslog` VALUES (43, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 13:47:03');
INSERT INTO `syslog` VALUES (44, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 13:47:03');
INSERT INTO `syslog` VALUES (45, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 13:47:06');
INSERT INTO `syslog` VALUES (46, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 13:47:11');
INSERT INTO `syslog` VALUES (47, 'admin', 'pinksmile.database.controller.SystemlogController.searchLogByUsername()', '查询用户日志', '2020-06-01 13:47:21');
INSERT INTO `syslog` VALUES (48, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 13:47:28');
INSERT INTO `syslog` VALUES (49, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 13:47:51');
INSERT INTO `syslog` VALUES (50, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 13:47:54');
INSERT INTO `syslog` VALUES (51, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 13:47:56');
INSERT INTO `syslog` VALUES (52, 'admin', 'pinksmile.database.controller.SystemlogController.getStockingByTime()', '查询用户日志', '2020-06-01 13:48:04');
INSERT INTO `syslog` VALUES (53, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 13:50:09');
INSERT INTO `syslog` VALUES (54, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 13:50:09');
INSERT INTO `syslog` VALUES (55, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 13:50:09');
INSERT INTO `syslog` VALUES (56, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 13:50:12');
INSERT INTO `syslog` VALUES (57, 'admin', 'pinksmile.database.controller.SystemlogController.getStockingByTime()', '查询用户日志', '2020-06-01 13:50:53');
INSERT INTO `syslog` VALUES (58, 'user', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 13:51:36');
INSERT INTO `syslog` VALUES (59, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 13:51:36');
INSERT INTO `syslog` VALUES (60, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 13:51:36');
INSERT INTO `syslog` VALUES (61, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-01 13:51:42');
INSERT INTO `syslog` VALUES (62, 'user', 'pinksmile.database.controller.StockingController.getStockingByTime()', '查找入库记录', '2020-06-01 13:52:05');
INSERT INTO `syslog` VALUES (63, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 14:58:47');
INSERT INTO `syslog` VALUES (64, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 14:58:47');
INSERT INTO `syslog` VALUES (65, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 14:58:47');
INSERT INTO `syslog` VALUES (66, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 14:58:50');
INSERT INTO `syslog` VALUES (67, 'admin', 'pinksmile.database.controller.SystemlogController.getStockingByTime()', '查询用户日志', '2020-06-01 14:58:53');
INSERT INTO `syslog` VALUES (68, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 15:06:43');
INSERT INTO `syslog` VALUES (69, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 15:06:44');
INSERT INTO `syslog` VALUES (70, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 15:06:44');
INSERT INTO `syslog` VALUES (71, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 15:06:46');
INSERT INTO `syslog` VALUES (72, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-01 15:08:43');
INSERT INTO `syslog` VALUES (73, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 15:09:17');
INSERT INTO `syslog` VALUES (74, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 15:09:17');
INSERT INTO `syslog` VALUES (75, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 15:09:18');
INSERT INTO `syslog` VALUES (76, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 15:09:21');
INSERT INTO `syslog` VALUES (77, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-01 15:11:31');
INSERT INTO `syslog` VALUES (78, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 15:12:52');
INSERT INTO `syslog` VALUES (79, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 15:12:52');
INSERT INTO `syslog` VALUES (80, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 15:12:53');
INSERT INTO `syslog` VALUES (81, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 15:12:55');
INSERT INTO `syslog` VALUES (82, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 15:35:37');
INSERT INTO `syslog` VALUES (83, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 15:35:37');
INSERT INTO `syslog` VALUES (84, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 15:35:37');
INSERT INTO `syslog` VALUES (85, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 15:35:40');
INSERT INTO `syslog` VALUES (86, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-01 15:35:44');
INSERT INTO `syslog` VALUES (87, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 15:37:16');
INSERT INTO `syslog` VALUES (88, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 15:37:16');
INSERT INTO `syslog` VALUES (89, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 15:37:16');
INSERT INTO `syslog` VALUES (90, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 15:37:18');
INSERT INTO `syslog` VALUES (91, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-01 15:37:43');
INSERT INTO `syslog` VALUES (92, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 15:41:20');
INSERT INTO `syslog` VALUES (93, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 15:41:21');
INSERT INTO `syslog` VALUES (94, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 15:41:21');
INSERT INTO `syslog` VALUES (95, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 15:41:23');
INSERT INTO `syslog` VALUES (96, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-01 15:41:37');
INSERT INTO `syslog` VALUES (97, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 16:01:34');
INSERT INTO `syslog` VALUES (98, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 16:01:34');
INSERT INTO `syslog` VALUES (99, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 16:01:34');
INSERT INTO `syslog` VALUES (100, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:01:39');
INSERT INTO `syslog` VALUES (101, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:01:42');
INSERT INTO `syslog` VALUES (102, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:01:43');
INSERT INTO `syslog` VALUES (103, 'admin', 'pinksmile.database.controller.SystemlogController.searchLogByUsername()', '查询用户日志', '2020-06-01 16:01:49');
INSERT INTO `syslog` VALUES (104, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:01:56');
INSERT INTO `syslog` VALUES (105, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-01 16:02:02');
INSERT INTO `syslog` VALUES (106, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:05');
INSERT INTO `syslog` VALUES (107, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:06');
INSERT INTO `syslog` VALUES (108, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:12');
INSERT INTO `syslog` VALUES (109, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:17');
INSERT INTO `syslog` VALUES (110, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:20');
INSERT INTO `syslog` VALUES (111, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:23');
INSERT INTO `syslog` VALUES (112, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:26');
INSERT INTO `syslog` VALUES (113, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-01 16:02:31');
INSERT INTO `syslog` VALUES (114, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-01 16:02:37');
INSERT INTO `syslog` VALUES (115, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-01 16:02:54');
INSERT INTO `syslog` VALUES (116, 'pig', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 16:03:22');
INSERT INTO `syslog` VALUES (117, 'pig', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 16:03:22');
INSERT INTO `syslog` VALUES (118, 'pig', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 16:03:22');
INSERT INTO `syslog` VALUES (119, 'pig', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-01 16:03:25');
INSERT INTO `syslog` VALUES (120, 'pig', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-01 16:03:36');
INSERT INTO `syslog` VALUES (121, 'pig', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-01 16:03:43');
INSERT INTO `syslog` VALUES (122, 'pig', 'pinksmile.database.controller.StockingController.checkIsOver()', '检查入库数量是否符合要求', '2020-06-01 16:03:56');
INSERT INTO `syslog` VALUES (123, 'pig', 'pinksmile.database.controller.StockingController.checkIsOver()', '检查入库数量是否符合要求', '2020-06-01 16:04:07');
INSERT INTO `syslog` VALUES (124, 'pig', 'pinksmile.database.controller.StockingController.addStocking()', '添加入库记录', '2020-06-01 16:04:11');
INSERT INTO `syslog` VALUES (125, 'pig', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-01 16:04:12');
INSERT INTO `syslog` VALUES (126, 'pig', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-01 16:04:19');
INSERT INTO `syslog` VALUES (127, 'pig', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-01 16:04:24');
INSERT INTO `syslog` VALUES (128, 'pig', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-01 16:04:55');
INSERT INTO `syslog` VALUES (129, 'pig', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-01 16:04:57');
INSERT INTO `syslog` VALUES (130, 'pig', 'pinksmile.database.controller.CustomerController.addCustomer()', '添加客户信息', '2020-06-01 16:06:45');
INSERT INTO `syslog` VALUES (131, 'pig', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-01 16:06:46');
INSERT INTO `syslog` VALUES (132, 'pig', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-01 16:07:09');
INSERT INTO `syslog` VALUES (133, 'user', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 16:12:14');
INSERT INTO `syslog` VALUES (134, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 16:12:15');
INSERT INTO `syslog` VALUES (135, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 16:12:15');
INSERT INTO `syslog` VALUES (136, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-01 16:17:39');
INSERT INTO `syslog` VALUES (137, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-01 16:17:40');
INSERT INTO `syslog` VALUES (138, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-01 16:17:42');
INSERT INTO `syslog` VALUES (139, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-01 16:17:42');
INSERT INTO `syslog` VALUES (140, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-01 16:17:43');
INSERT INTO `syslog` VALUES (141, 'user', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 16:23:01');
INSERT INTO `syslog` VALUES (142, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 16:23:01');
INSERT INTO `syslog` VALUES (143, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 16:23:01');
INSERT INTO `syslog` VALUES (144, 'user', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-01 16:23:40');
INSERT INTO `syslog` VALUES (145, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-01 16:23:40');
INSERT INTO `syslog` VALUES (146, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-01 16:23:40');
INSERT INTO `syslog` VALUES (147, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-01 16:23:53');
INSERT INTO `syslog` VALUES (148, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-01 16:23:55');
INSERT INTO `syslog` VALUES (149, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-01 16:23:57');
INSERT INTO `syslog` VALUES (150, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-01 16:24:19');
INSERT INTO `syslog` VALUES (151, 'user', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-02 17:30:50');
INSERT INTO `syslog` VALUES (152, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-02 17:30:50');
INSERT INTO `syslog` VALUES (153, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-02 17:30:51');
INSERT INTO `syslog` VALUES (154, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-02 17:30:53');
INSERT INTO `syslog` VALUES (155, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-02 17:31:32');
INSERT INTO `syslog` VALUES (156, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-02 17:37:23');
INSERT INTO `syslog` VALUES (157, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-02 17:37:25');
INSERT INTO `syslog` VALUES (158, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-02 17:40:40');
INSERT INTO `syslog` VALUES (159, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-02 17:42:11');
INSERT INTO `syslog` VALUES (160, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-02 17:42:16');
INSERT INTO `syslog` VALUES (161, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-02 17:42:26');
INSERT INTO `syslog` VALUES (162, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-02 17:42:28');
INSERT INTO `syslog` VALUES (163, 'user', 'pinksmile.database.controller.ProductController.deleteOneProduct()', '删除一个产品信息', '2020-06-02 17:42:32');
INSERT INTO `syslog` VALUES (164, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-02 17:42:32');
INSERT INTO `syslog` VALUES (165, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-02 17:42:32');
INSERT INTO `syslog` VALUES (166, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-02 17:42:34');
INSERT INTO `syslog` VALUES (167, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-02 17:42:41');
INSERT INTO `syslog` VALUES (168, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-02 19:40:53');
INSERT INTO `syslog` VALUES (169, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-02 19:40:53');
INSERT INTO `syslog` VALUES (170, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-02 19:40:53');
INSERT INTO `syslog` VALUES (171, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-02 19:53:03');
INSERT INTO `syslog` VALUES (172, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-02 19:53:05');
INSERT INTO `syslog` VALUES (173, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-02 20:01:44');
INSERT INTO `syslog` VALUES (174, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-02 20:01:44');
INSERT INTO `syslog` VALUES (175, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-02 20:01:45');
INSERT INTO `syslog` VALUES (176, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-02 20:01:45');
INSERT INTO `syslog` VALUES (177, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-02 20:01:49');
INSERT INTO `syslog` VALUES (178, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-02 20:02:00');
INSERT INTO `syslog` VALUES (179, 'admin', 'pinksmile.database.controller.SystemlogController.searchLogByUsername()', '查询用户日志', '2020-06-02 20:03:38');
INSERT INTO `syslog` VALUES (180, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-02 20:24:58');
INSERT INTO `syslog` VALUES (181, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-02 20:25:14');
INSERT INTO `syslog` VALUES (182, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-02 20:25:16');
INSERT INTO `syslog` VALUES (183, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-02 20:25:50');
INSERT INTO `syslog` VALUES (184, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-02 20:28:01');
INSERT INTO `syslog` VALUES (185, 'user', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-02 23:10:07');
INSERT INTO `syslog` VALUES (186, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-02 23:10:07');
INSERT INTO `syslog` VALUES (187, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-02 23:10:07');
INSERT INTO `syslog` VALUES (188, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-02 23:10:59');
INSERT INTO `syslog` VALUES (189, 'user', 'pinksmile.database.controller.CustomerController.addCustomer()', '添加客户信息', '2020-06-02 23:13:29');
INSERT INTO `syslog` VALUES (190, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-02 23:13:30');
INSERT INTO `syslog` VALUES (191, 'user', 'pinksmile.database.controller.CustomerController.customerSearch()', '查找客户信息', '2020-06-02 23:15:00');
INSERT INTO `syslog` VALUES (192, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-02 23:15:47');
INSERT INTO `syslog` VALUES (193, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-02 23:16:42');
INSERT INTO `syslog` VALUES (194, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-02 23:17:10');
INSERT INTO `syslog` VALUES (195, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-02 23:20:04');
INSERT INTO `syslog` VALUES (196, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-02 23:20:27');
INSERT INTO `syslog` VALUES (197, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-02 23:21:00');
INSERT INTO `syslog` VALUES (198, 'user', 'pinksmile.database.controller.StockingController.checkIsOver()', '检查入库数量是否符合要求', '2020-06-02 23:22:09');
INSERT INTO `syslog` VALUES (199, 'admin', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-02 23:24:19');
INSERT INTO `syslog` VALUES (200, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-02 23:24:19');
INSERT INTO `syslog` VALUES (201, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-02 23:24:19');
INSERT INTO `syslog` VALUES (202, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-02 23:24:22');
INSERT INTO `syslog` VALUES (203, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-02 23:24:53');
INSERT INTO `syslog` VALUES (204, 'user', 'pinksmile.database.controller.Login.verification()', '用户登录', '2020-06-03 09:53:57');
INSERT INTO `syslog` VALUES (205, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-03 09:53:57');
INSERT INTO `syslog` VALUES (206, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-03 09:53:57');
INSERT INTO `syslog` VALUES (207, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-03 09:54:13');
INSERT INTO `syslog` VALUES (208, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-03 11:19:19');
INSERT INTO `syslog` VALUES (209, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-03 11:19:19');
INSERT INTO `syslog` VALUES (210, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-03 13:39:23');
INSERT INTO `syslog` VALUES (211, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-03 13:39:23');
INSERT INTO `syslog` VALUES (212, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-03 13:39:32');
INSERT INTO `syslog` VALUES (213, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-03 13:39:36');
INSERT INTO `syslog` VALUES (214, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-03 13:39:37');
INSERT INTO `syslog` VALUES (215, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-03 13:39:39');
INSERT INTO `syslog` VALUES (216, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-03 13:40:43');
INSERT INTO `syslog` VALUES (217, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-03 13:40:47');
INSERT INTO `syslog` VALUES (218, 'user', 'pinksmile.database.controller.StockingController.checkIsOver()', '检查入库数量是否符合要求', '2020-06-03 13:41:02');
INSERT INTO `syslog` VALUES (219, 'user', 'pinksmile.database.controller.StockingController.addStocking()', '添加入库记录', '2020-06-03 13:41:07');
INSERT INTO `syslog` VALUES (220, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-03 13:41:08');
INSERT INTO `syslog` VALUES (221, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-03 13:41:15');
INSERT INTO `syslog` VALUES (222, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-03 13:41:20');
INSERT INTO `syslog` VALUES (223, 'user', 'pinksmile.database.controller.OutstockController.addOutstock()', '添加出库记录', '2020-06-03 13:41:38');
INSERT INTO `syslog` VALUES (224, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-03 13:41:39');
INSERT INTO `syslog` VALUES (225, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-03 13:41:43');
INSERT INTO `syslog` VALUES (226, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-05 23:11:20');
INSERT INTO `syslog` VALUES (227, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-05 23:11:20');
INSERT INTO `syslog` VALUES (228, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-05 23:11:44');
INSERT INTO `syslog` VALUES (229, 'user', 'pinksmile.database.controller.CustomerController.addCustomer()', '添加客户信息', '2020-06-05 23:12:51');
INSERT INTO `syslog` VALUES (230, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-05 23:12:52');
INSERT INTO `syslog` VALUES (231, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-05 23:12:59');
INSERT INTO `syslog` VALUES (232, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-05 23:13:02');
INSERT INTO `syslog` VALUES (233, 'user', 'pinksmile.database.controller.CustomerController.addCustomer()', '添加客户信息', '2020-06-05 23:13:44');
INSERT INTO `syslog` VALUES (234, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-05 23:13:45');
INSERT INTO `syslog` VALUES (235, 'user', 'pinksmile.database.controller.CustomerController.customerSearch()', '查找客户信息', '2020-06-05 23:13:51');
INSERT INTO `syslog` VALUES (236, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-05 23:14:12');
INSERT INTO `syslog` VALUES (237, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-05 23:14:22');
INSERT INTO `syslog` VALUES (238, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-05 23:14:32');
INSERT INTO `syslog` VALUES (239, 'user', 'pinksmile.database.controller.StockController.getStocksByPid()', '查找库存信息', '2020-06-05 23:14:43');
INSERT INTO `syslog` VALUES (240, 'user', 'pinksmile.database.controller.StockController.getStocksByRid()', '查找库存信息', '2020-06-05 23:14:48');
INSERT INTO `syslog` VALUES (241, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-05 23:14:50');
INSERT INTO `syslog` VALUES (242, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-05 23:15:16');
INSERT INTO `syslog` VALUES (243, 'user', 'pinksmile.database.controller.StockController.getStockByRepositoryName()', '查找库存', '2020-06-05 23:15:41');
INSERT INTO `syslog` VALUES (244, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-05 23:15:49');
INSERT INTO `syslog` VALUES (245, 'user', 'pinksmile.database.controller.StockingController.getStockingByTime()', '查找入库记录', '2020-06-05 23:16:01');
INSERT INTO `syslog` VALUES (246, 'user', 'pinksmile.database.controller.StockingController.getStockingByRid()', '查找入库记录', '2020-06-05 23:16:14');
INSERT INTO `syslog` VALUES (247, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-05 23:16:18');
INSERT INTO `syslog` VALUES (248, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-05 23:16:32');
INSERT INTO `syslog` VALUES (249, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-05 23:17:06');
INSERT INTO `syslog` VALUES (250, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-05 23:17:06');
INSERT INTO `syslog` VALUES (251, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:17:09');
INSERT INTO `syslog` VALUES (252, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:17:15');
INSERT INTO `syslog` VALUES (253, 'admin', 'pinksmile.database.controller.UserController.updateUser()', '修改用户信息', '2020-06-05 23:17:23');
INSERT INTO `syslog` VALUES (254, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:17:23');
INSERT INTO `syslog` VALUES (255, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:17:25');
INSERT INTO `syslog` VALUES (256, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-05 23:17:28');
INSERT INTO `syslog` VALUES (257, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-05 23:17:47');
INSERT INTO `syslog` VALUES (258, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-05 23:18:03');
INSERT INTO `syslog` VALUES (259, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-05 23:18:04');
INSERT INTO `syslog` VALUES (260, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-05 23:18:09');
INSERT INTO `syslog` VALUES (261, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-05 23:18:12');
INSERT INTO `syslog` VALUES (262, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-05 23:18:15');
INSERT INTO `syslog` VALUES (263, 'admin', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-05 23:18:35');
INSERT INTO `syslog` VALUES (264, 'admin', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-05 23:18:35');
INSERT INTO `syslog` VALUES (265, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:18:37');
INSERT INTO `syslog` VALUES (266, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:18:38');
INSERT INTO `syslog` VALUES (267, 'admin', 'pinksmile.database.controller.UserController.updateUser()', '修改用户信息', '2020-06-05 23:18:42');
INSERT INTO `syslog` VALUES (268, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:18:42');
INSERT INTO `syslog` VALUES (269, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:18:43');
INSERT INTO `syslog` VALUES (270, 'user', 'pinksmile.database.controller.BackManage.manage()', '返回用户或管理员页面', '2020-06-05 23:21:21');
INSERT INTO `syslog` VALUES (271, 'user', 'pinksmile.database.controller.BackManage.toWelcome()', '返回欢迎页面', '2020-06-05 23:21:21');
INSERT INTO `syslog` VALUES (272, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-05 23:21:30');
INSERT INTO `syslog` VALUES (273, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-05 23:29:59');
INSERT INTO `syslog` VALUES (274, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-05 23:33:51');
INSERT INTO `syslog` VALUES (275, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-05 23:33:56');
INSERT INTO `syslog` VALUES (276, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-05 23:34:19');
INSERT INTO `syslog` VALUES (277, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-05 23:34:22');
INSERT INTO `syslog` VALUES (278, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-05 23:34:28');
INSERT INTO `syslog` VALUES (279, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-05 23:39:19');
INSERT INTO `syslog` VALUES (280, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-05 23:39:21');
INSERT INTO `syslog` VALUES (281, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-05 23:39:28');
INSERT INTO `syslog` VALUES (282, 'user', 'pinksmile.database.controller.OutstockController.addOutstock()', '添加出库记录', '2020-06-05 23:39:56');
INSERT INTO `syslog` VALUES (283, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-05 23:39:57');
INSERT INTO `syslog` VALUES (284, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-05 23:40:03');
INSERT INTO `syslog` VALUES (285, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-05 23:40:38');
INSERT INTO `syslog` VALUES (286, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-05 23:40:40');
INSERT INTO `syslog` VALUES (287, 'admin', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-05 23:40:43');
INSERT INTO `syslog` VALUES (288, 'admin', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-05 23:40:48');
INSERT INTO `syslog` VALUES (289, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:40:58');
INSERT INTO `syslog` VALUES (290, 'xiao', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-05 23:41:33');
INSERT INTO `syslog` VALUES (291, 'xiaowang', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-05 23:43:44');
INSERT INTO `syslog` VALUES (292, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 08:27:08');
INSERT INTO `syslog` VALUES (293, 'admin', 'pinksmile.database.controller.UserController.deleteById()', '删除一个用户', '2020-06-06 08:27:12');
INSERT INTO `syslog` VALUES (294, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 08:27:12');
INSERT INTO `syslog` VALUES (295, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 08:27:12');
INSERT INTO `syslog` VALUES (296, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 08:27:42');
INSERT INTO `syslog` VALUES (297, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-06 08:28:58');
INSERT INTO `syslog` VALUES (298, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 08:29:04');
INSERT INTO `syslog` VALUES (299, 'xiaoli', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-06 08:32:01');
INSERT INTO `syslog` VALUES (300, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 08:32:32');
INSERT INTO `syslog` VALUES (301, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 08:32:35');
INSERT INTO `syslog` VALUES (302, 'user', 'pinksmile.database.controller.StockController.getStockByRepositoryName()', '查找库存', '2020-06-06 08:32:45');
INSERT INTO `syslog` VALUES (303, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 08:32:47');
INSERT INTO `syslog` VALUES (304, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 08:32:53');
INSERT INTO `syslog` VALUES (305, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-06 08:46:48');
INSERT INTO `syslog` VALUES (306, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-06 09:16:14');
INSERT INTO `syslog` VALUES (307, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-06 09:16:22');
INSERT INTO `syslog` VALUES (308, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-06 09:16:25');
INSERT INTO `syslog` VALUES (309, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-06 09:16:28');
INSERT INTO `syslog` VALUES (310, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 09:16:32');
INSERT INTO `syslog` VALUES (311, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-06 09:16:37');
INSERT INTO `syslog` VALUES (312, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-06 09:16:40');
INSERT INTO `syslog` VALUES (313, 'user', 'pinksmile.database.controller.StockingController.checkIsOver()', '检查入库数量是否符合要求', '2020-06-06 09:17:01');
INSERT INTO `syslog` VALUES (314, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 09:17:29');
INSERT INTO `syslog` VALUES (315, 'admin', 'pinksmile.database.controller.UserController.updateUser()', '修改用户信息', '2020-06-06 09:17:53');
INSERT INTO `syslog` VALUES (316, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 09:17:53');
INSERT INTO `syslog` VALUES (317, 'admin', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 09:17:54');
INSERT INTO `syslog` VALUES (318, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 09:18:13');
INSERT INTO `syslog` VALUES (319, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-06 09:18:19');
INSERT INTO `syslog` VALUES (320, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-06 09:18:56');
INSERT INTO `syslog` VALUES (321, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 09:19:11');
INSERT INTO `syslog` VALUES (322, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-06 09:19:58');
INSERT INTO `syslog` VALUES (323, 'user', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-06 09:22:33');
INSERT INTO `syslog` VALUES (324, 'user', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 09:24:49');
INSERT INTO `syslog` VALUES (325, 'user', 'pinksmile.database.controller.UserController.updateUser()', '修改用户信息', '2020-06-06 09:27:10');
INSERT INTO `syslog` VALUES (326, 'user', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 09:27:11');
INSERT INTO `syslog` VALUES (327, 'user', 'pinksmile.database.controller.UserController.getAllUsers()', '查看用户信息', '2020-06-06 09:27:12');
INSERT INTO `syslog` VALUES (328, 'user', 'pinksmile.database.controller.StockController.getAllStockings()', '查看库存信息', '2020-06-06 09:27:32');
INSERT INTO `syslog` VALUES (329, 'user', 'pinksmile.database.controller.OutstockController.getAllOutstocks()', '查看出库记录', '2020-06-06 09:27:36');
INSERT INTO `syslog` VALUES (330, 'user', 'pinksmile.database.controller.ProductController.getAllProducts()', '查看产品信息', '2020-06-06 09:28:51');
INSERT INTO `syslog` VALUES (331, 'user', 'pinksmile.database.controller.StockingController.getAllStockings()', '查看所有入库记录', '2020-06-06 09:29:02');
INSERT INTO `syslog` VALUES (332, 'user', 'pinksmile.database.controller.SystemlogController.getAllLogs()', '查看用户日志', '2020-06-06 09:31:25');
INSERT INTO `syslog` VALUES (333, 'user', 'pinksmile.database.controller.SystemlogController.getLogByTime()', '查询用户日志', '2020-06-06 09:31:42');
INSERT INTO `syslog` VALUES (334, 'user', 'pinksmile.database.controller.CustomerController.getAllCustomers()', '查看客户信息', '2020-06-06 09:32:28');
INSERT INTO `syslog` VALUES (335, 'user', 'pinksmile.database.controller.RepositoryController.getAllRepositorys()', '查看所有仓库信息', '2020-06-06 09:32:32');
INSERT INTO `syslog` VALUES (336, 'user', 'pinksmile.database.controller.StockController.getStockView()', '查看所有库存', '2020-06-06 09:32:53');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `nickname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `permission` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `role` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '管理员', 'admin', 'database', 'A,C,S,D', 'admin');
INSERT INTO `user` VALUES (25, '小狗', 'dog', 'dog', 'C,S,D', 'user');
INSERT INTO `user` VALUES (26, '小张', 'xiao', 'xiao', 'S,D', 'admin');
INSERT INTO `user` VALUES (27, '小王', 'xiaowang', 'xiaowang', 'A,D', 'user');
INSERT INTO `user` VALUES (32, '小李', 'xiaoli', 'xiaoli', 'C,D', 'user');
INSERT INTO `user` VALUES (34, '小小', 'pig', 'pig', 'A,C', 'user');
INSERT INTO `user` VALUES (35, '张三', 'zhang', 'zhang', 'A,C,S,D', 'admin');
INSERT INTO `user` VALUES (40, '秦始皇', 'user', 'user', 'A,C,S,D', 'user');

-- ----------------------------
-- View structure for product_repository_stock
-- ----------------------------
DROP VIEW IF EXISTS `product_repository_stock`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `product_repository_stock` AS select `product`.`id` AS `pid`,`product`.`name` AS `pname`,`repository`.`id` AS `rid`,`repository`.`name` AS `rname`,`stock`.`amount` AS `amount`,`product`.`lower` AS `lower`,`product`.`upper` AS `upper` from ((`product` join `repository`) join `stock`) where ((`stock`.`pid` = `product`.`id`) and (`stock`.`rid` = `repository`.`id`));

-- ----------------------------
-- Triggers structure for table outstock
-- ----------------------------
DROP TRIGGER IF EXISTS `stocking_out`;
delimiter ;;
CREATE TRIGGER `stocking_out` AFTER INSERT ON `outstock` FOR EACH ROW BEGIN
	SET @a=new.rid;
	SET @b=new.pid;
	SET @d=new.amount;
	IF(SELECT stock.pid FROM stock WHERE stock.pid=@b AND stock.rid=@a) IS NOT NULL THEN
		IF(SELECT stock.amount FROM stock WHERE 
				stock.amount>=new.amount AND stock.pid=new.pid AND stock.rid=new.rid) IS NOT NULL THEN
				UPDATE stock
				SET stock.amount=stock.amount-@d
				WHERE stock.pid=@b AND stock.rid=@a;
		END	IF;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table stocking
-- ----------------------------
DROP TRIGGER IF EXISTS `stocking_into`;
delimiter ;;
CREATE TRIGGER `stocking_into` AFTER INSERT ON `stocking` FOR EACH ROW BEGIN
	SET @a=new.rid;
	SET @b=new.pid;
	SET @d=new.amount;
	IF(SELECT stock.pid from stock WHERE stock.pid=@b AND stock.rid=@a) IS NULL THEN
		INSERT INTO stock VALUES(@b,@a,@d);
	ELSE 
		UPDATE stock
		SET stock.amount=stock.amount+@d
		WHERE stock.pid=@b AND stock.rid=@a;
	END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
