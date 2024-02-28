/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : meituan

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 31/12/2023 15:09:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `consignee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, '张三', '1', '13712345678', '湖南科技大学', '学校', '1', '2023-11-02 08:52:03');
INSERT INTO `address` VALUES (2, 1, '张三', '1', '13712345678', '湖南大学', '学校', '0', '2023-11-02 15:46:44');
INSERT INTO `address` VALUES (3, 2, '王五', '0', '19118127070', '湘潭大学', '学校', '1', '2023-11-07 14:41:10');
INSERT INTO `address` VALUES (4, 3, '赵六', '1', '12345678901', '雨湖公园', '家', '1', '2023-11-07 14:43:08');
INSERT INTO `address` VALUES (5, 1, 'lihong', '0', '13712345678', 'hnust', '学校', '0', '2023-12-14 08:10:15');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 4, '奶茶');
INSERT INTO `category` VALUES (2, 4, '果茶');
INSERT INTO `category` VALUES (3, 4, '招牌');
INSERT INTO `category` VALUES (4, 2, '汉堡');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` int NOT NULL COMMENT '食物id',
  `store_id` int NOT NULL COMMENT '店铺id',
  `category_id` int NULL DEFAULT NULL COMMENT '分类',
  `food_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '食物名字',
  `food_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '食物图片',
  `food_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '食物价格',
  `month_sale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '食物月售',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, 4, 3, '奥利奥奶茶', 'http://10.100.15.60:9000/meituan/images/aoliao.jpg', '14', '100');
INSERT INTO `food` VALUES (2, 4, 1, '珍珠奶茶', 'http://10.100.15.60:9000/meituan/images/zhenzhu.jpg', '10', '120');
INSERT INTO `food` VALUES (3, 2, 4, '藤椒鸡腿汉堡', 'http://10.100.15.60:9000/meituan/images/tengjiao.jpg', '14', '200');
INSERT INTO `food` VALUES (4, 2, 4, '多汁牛肉中国堡', 'http://10.100.15.60:9000/meituan/images/beef.jpg', '18', '80');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL COMMENT '订单id',
  `user_id` int NOT NULL COMMENT '用户id',
  `food_id` int NOT NULL COMMENT '食物id',
  `store_id` int NOT NULL COMMENT '店铺id',
  `order_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单金额',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '订单状态',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `order_time` datetime NOT NULL COMMENT '订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 1, 4, '14', '0', '202310312333', '2023-10-31 23:33:31');
INSERT INTO `orders` VALUES (2, 1, 2, 4, '10', '0', '202310312333', '2023-10-31 23:34:15');
INSERT INTO `orders` VALUES (3, 1, 3, 2, '14', '0', '202311010950', '2023-11-01 09:50:32');
INSERT INTO `orders` VALUES (4, 1, 4, 2, '18', '0', '202311010950', '2023-11-01 09:50:53');
INSERT INTO `orders` VALUES (5, 1, 1, 4, '14', '0', '202311011741', '2023-11-01 17:41:08');
INSERT INTO `orders` VALUES (6, 1, 2, 4, '10', '0', '202311011741', '2023-11-01 17:41:39');
INSERT INTO `orders` VALUES (7, 1, 1, 4, '14', '0', '202311011741', '2023-11-01 17:42:01');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名字',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺图片',
  `store_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺评分',
  `month_sale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺月售',
  `people_avg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺人均',
  `minTakeOut_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '起送价格',
  `delivery_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送价格',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺评论',
  `store_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺类型',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, '瑞幸咖啡', 'http://10.100.15.60:9000/meituan/images/coffe.jpg', '4.7', '1000', '25', '20', '5', '难喝啊', '2', '【开票相关】请用订单手机号登录瑞幸咖啡小程序开具发票。\n');
INSERT INTO `store` VALUES (2, '塔斯汀·中国汉堡', 'http://10.100.15.60:9000/meituan/images/tasting.jpg', '4.6', '2000', '25', '20', '0', '不愧是中国汉堡', '1', '中国汉堡');
INSERT INTO `store` VALUES (3, '小菜园新徽菜', 'http://10.100.15.60:9000/meituan/images/smalldish.jpg', '4.9', '1000', '33', '25', '4', '近期1000人下单', '1', '欢迎来到小菜园');
INSERT INTO `store` VALUES (4, '茶百道', 'http://10.100.15.60:9000/meituan/images/tea.jpg', '4.9', '1000', '14', '16', '9', '大众点评高分店铺', '2', '茶百道「现蒸芋头系列」升级回归，精选优质芋头，每日现蒸手捣...\n');
INSERT INTO `store` VALUES (5, '麦啃基', 'http://10.100.15.60:9000/meituan/images/maikenji.jpg', '5.0', '100', '15', '15', '3', '就是好吃', '1', NULL);
INSERT INTO `store` VALUES (6, '永辉超市', 'http://10.100.15.60:9000/meituan/images/yonghui.jpg', '4.8', '500', '45', '25', '6', '很新鲜', '3', NULL);
INSERT INTO `store` VALUES (7, '丰鲜水果', 'http://10.100.15.60:9000/meituan/images/xianfeng.jpg', '4.7', '500', '25', '20', '5', '果子很好', '4', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '13712345678', '123456');
INSERT INTO `user` VALUES (2, '19118127070', '123456');
INSERT INTO `user` VALUES (3, '12345678901', '123456');

-- ----------------------------
-- Table structure for user_code
-- ----------------------------
DROP TABLE IF EXISTS `user_code`;
CREATE TABLE `user_code`  (
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`phone_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_code
-- ----------------------------
INSERT INTO `user_code` VALUES ('12345678901', NULL);
INSERT INTO `user_code` VALUES ('13712345678', '300824');
INSERT INTO `user_code` VALUES ('19118127070', NULL);

SET FOREIGN_KEY_CHECKS = 1;
