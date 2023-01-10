/*
 Navicat Premium Data Transfer

 Source Server         : Quan
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : touko_mall

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 10/01/2023 16:59:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userName` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'touko', '322322');

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品大类名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类封面图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES (1, '木吉他', '木吉他机描述', '20230106121546000000135.jpg');
INSERT INTO `t_bigtype` VALUES (2, '电吉他', '电脑平板描述', '20230105115738000000710.jpg');
INSERT INTO `t_bigtype` VALUES (3, '贝斯', '智能穿戴描述', '20230106121729000000594.jpg');
INSERT INTO `t_bigtype` VALUES (4, '音乐键盘', '电视描述', '20230105115956000000443.jpg');
INSERT INTO `t_bigtype` VALUES (5, '其他配件', '大家电描述', '20230106120401000000999.jpg');
INSERT INTO `t_bigtype` VALUES (6, '吉他谱', '小家电描述', '20230106090841000000511.jpg');
INSERT INTO `t_bigtype` VALUES (7, '钢琴谱', '智能家居描述', '20230106090851000000781.jpg');
INSERT INTO `t_bigtype` VALUES (8, '贝斯谱', '户外出行描述', '20230106090901000000060.jpg');
INSERT INTO `t_bigtype` VALUES (9, '鼓谱', '日用百货描述', '20230106090909000000908.jpg');
INSERT INTO `t_bigtype` VALUES (10, '乐队总谱', '儿童用品描述', '20230106090915000000706.jpg');
INSERT INTO `t_bigtype` VALUES (45, 'K-on!乐队', 'K-on!乐队', 'default.jpg');
INSERT INTO `t_bigtype` VALUES (46, '結束乐队', '結束乐队', 'default.jpg');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openId微信用户ID',
  `totalPrice` decimal(8, 2) NULL DEFAULT NULL COMMENT '总价',
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `consignee` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `telNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '订单创建日期',
  `payDate` datetime(0) NULL DEFAULT NULL COMMENT '订单支付日期',
  `status` int(0) NULL DEFAULT 1 COMMENT '订单状态 0 未支付 1 已经支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (108, 'JAVA20230106075528000000726', 'ot6Vy5TvKzezLoG_2xjEJwaNxYo0', 2929.00, '广东省广州市增城区华立路11号广州华立学院', 'Touko', '020-81167888', '2023-01-06 19:55:29', NULL, 1);
INSERT INTO `t_order` VALUES (109, 'JAVA20230106095813000000819', 'ot6Vy5TvKzezLoG_2xjEJwaNxYo0', 15.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-01-06 21:58:14', NULL, 1);
INSERT INTO `t_order` VALUES (110, 'JAVA20230106114204000000042', 'ot6Vy5TvKzezLoG_2xjEJwaNxYo0', 3713.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-01-06 23:42:04', NULL, 1);

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mId` int(0) NULL DEFAULT NULL COMMENT '订单主表ID',
  `goodsId` int(0) NULL DEFAULT NULL COMMENT '商品ID',
  `goodsNumber` int(0) NULL DEFAULT NULL COMMENT '商品购买数量',
  `goodsPrice` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `goodsName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goodsPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mId`(`mId`) USING BTREE,
  CONSTRAINT `t_order_detail_ibfk_1` FOREIGN KEY (`mId`) REFERENCES `t_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES (140, 108, 38, 1, 2899.00, 'GIbson Studio HB', '20230106041542000000124.jpg');
INSERT INTO `t_order_detail` VALUES (141, 108, 63, 1, 30.00, '忘れてやらない', '20230106053839000000651.jpg');
INSERT INTO `t_order_detail` VALUES (142, 109, 56, 1, 15.00, '上海红茶馆', '20230106051703000000480.jpg');
INSERT INTO `t_order_detail` VALUES (143, 110, 56, 1, 15.00, '上海红茶馆', '20230106051703000000480.jpg');
INSERT INTO `t_order_detail` VALUES (144, 110, 38, 1, 2899.00, 'GIbson Studio HB', '20230106041542000000124.jpg');
INSERT INTO `t_order_detail` VALUES (145, 110, 52, 1, 799.00, 'UR12 ', '20230106050417000000788.jpg');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `proPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default.jpg' COMMENT '商品图片',
  `isHot` bit(1) NULL DEFAULT b'0' COMMENT '是否热门推荐商品',
  `isSwiper` bit(1) NULL DEFAULT b'0' COMMENT '是否轮播图片商品',
  `swiperPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default.jpg' COMMENT '商品轮播图片',
  `swiperSort` int(0) NULL DEFAULT 0 COMMENT '轮播排序',
  `typeId` int(0) NULL DEFAULT NULL COMMENT '商品类别编号',
  `hotDateTime` datetime(0) NULL DEFAULT NULL COMMENT '设置热卖日期',
  `productIntroImgs` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品介绍图片',
  `productParaImgs` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格参数图片',
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typeId`(`typeId`) USING BTREE,
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `t_smalltype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '吉他与孤独与蓝色星球', 15.00, 3451, '20230106020441000000509.jfif', b'0', b'1', '3.jpg', 3, 17, '2024-12-28 21:36:34', '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/Snipaste_2023-01-06_21-16-45.jpg\"></p>', '\"\"', '\"\"');
INSERT INTO `t_product` VALUES (4, '卡马F2m', 1599.00, 3232, '20230106020735000000772.jpg', b'0', b'0', 'default.jpg', 0, 2, NULL, '<p><img width=\"100%\" src=\"http://192.168.0.116/image/productIntroImgs/11.jpg\"></p>', '<p><img width=\"100%\" src=\"http://192.168.0.116/image/productParaImgs/11.jpg\"></p>', '卡马F1m面单吉他kepma指弹弹唱41寸单板圆角专业民谣电箱木吉它');
INSERT INTO `t_product` VALUES (5, 'One Last Kiss', 15.00, 2005, '20230106020904000000549.jpg', b'0', b'1', '20230106074320000000826.jpg', 1, 17, NULL, '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/Snipaste_2023-01-06_21-53-37.jpg\"></p>', '<p>\"\"</p>', '\"\"');
INSERT INTO `t_product` VALUES (6, '卡马G1', 3499.00, 2343, '20230106021200000000059.jpg', b'0', b'0', 'default.jpg', 0, 2, NULL, '\"\"', NULL, '卡马G1面单吉他kepma指弹弹唱41寸单板圆角专业民谣电箱木吉它');
INSERT INTO `t_product` VALUES (7, 'FG800', 1999.00, 2222, '20230106021500000000185.jpg', b'0', b'0', 'default.jpg', 0, 3, NULL, '\"\"', NULL, '正品YAMAHA雅马哈吉他FG800电箱单板民谣吉他初学者学男生女41寸');
INSERT INTO `t_product` VALUES (14, '楚门TF35', 1599.00, 4444, '20230106021807000000529.jpg', b'0', b'0', 'default.jpg', 0, 1, NULL, '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/1.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/2.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/3.jpg\"></p>', '<p><br></p>', 'Trumon楚门Tf35民谣吉他41寸电箱吉他进阶吉他');
INSERT INTO `t_product` VALUES (15, '海豚物语', 2499.00, 4444, '20230106021958000000547.jpg', b'1', b'0', 'default.jpg', 0, 1, '2023-01-06 16:20:35', '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/1.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/2.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/3.jpg\"></p>', NULL, 'Trumon楚门全单海豚物语夏至民谣吉他41寸电箱吉他进阶吉他');
INSERT INTO `t_product` VALUES (16, '极光', 3999.00, 444, '20230106022049000000887.jpg', b'0', b'0', 'default.jpg', 0, 1, NULL, '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/1.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/2.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/3.jpg\"></p>', '<p><img width=\"100%\" src=\"http://192.168.0.116/image/productParaImgs/111.jpg\"></p>', 'Trumon楚门全单极光民谣吉他41寸电箱吉他进阶吉他');
INSERT INTO `t_product` VALUES (17, '落樱', 2499.00, 444, '20230106022150000000496.jpg', b'0', b'0', 'default.jpg', 0, 1, NULL, NULL, NULL, 'Trumon楚门全单落樱花夏至民谣吉他41寸电箱吉他进阶吉他');
INSERT INTO `t_product` VALUES (32, 'FG830', 2999.00, 233, '20230106021626000000679.jpg', b'0', b'0', 'default.jpg', 0, 3, NULL, NULL, NULL, '正品YAMAHA雅马哈吉他FG830电箱单板民谣吉他初学者学男生女41寸');
INSERT INTO `t_product` VALUES (33, 'Squier', 1599.00, 999, '20230106040415000000000.jpg', b'0', b'0', 'default.jpg', 0, 5, NULL, NULL, NULL, 'fender芬达电吉他套装squier子弹affinity初学入门SQ bullet 单摇');
INSERT INTO `t_product` VALUES (34, '芬达玩家', 4999.00, 233, '20230106040535000000877.jpg', b'1', b'1', '20230106054525000000079.jpg', 0, 5, '2023-01-06 17:43:30', '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_20230106212913.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129131.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129132.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129134.jpg\"></p>', NULL, 'fender芬达电吉他套装s芬达玩家 墨芬 单摇');
INSERT INTO `t_product` VALUES (35, 'Squier John 5签名款', 2999.00, 2333, '20230106040657000000682.jpg', b'0', b'0', 'default.jpg', 0, 5, NULL, NULL, NULL, 'fender芬达电吉他套装Squier John 5签名款 单单双 单摇');
INSERT INTO `t_product` VALUES (36, 'PAC 012 ', 1599.00, 233, '20230106041302000000839.jpg', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, 'YAMAHA雅马哈PAC012/112/212V/311H/611/612初学进阶电吉他印尼产');
INSERT INTO `t_product` VALUES (37, 'PAC 112J ', 2199.00, 233, '20230106041348000000143.jpg', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, 'YAMAHA雅马哈PAC012/112/212V/311H/611/612初学进阶电吉他印尼产');
INSERT INTO `t_product` VALUES (38, 'GIbson Studio HB', 2899.00, 233, '20230106041542000000124.jpg', b'1', b'0', 'default.jpg', 0, 7, '2023-01-06 16:20:25', '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129135.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129136.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129137.jpg\"></p>', NULL, 'Epiphone易普锋Les Paul Standard 50S/Modern Figured电吉他60s');
INSERT INTO `t_product` VALUES (39, 'Gibson 黑卡', 3999.00, 233, '20230106041628000000544.jpg', b'1', b'0', 'default.jpg', 0, 7, '2023-01-06 17:43:24', '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129135.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129136.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129137.jpg\"></p>', NULL, 'Epiphone Gibson 黑卡 Les Paul Standard 50S/Modern Figured电吉他60s');
INSERT INTO `t_product` VALUES (40, 'Fender', 5999.00, 233, '20230106041808000000255.jpg', b'0', b'0', 'default.jpg', 0, 10, NULL, NULL, NULL, 'Fender芬达玩家电贝斯 墨芬Player Plus P J bass 墨标玩家电贝司');
INSERT INTO `t_product` VALUES (41, 'Squier Bass', 2199.00, 233, '20230106041848000000484.jpg', b'1', b'0', 'default.jpg', 0, 10, '2023-01-06 16:19:28', '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129138.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_2023010621291311.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_202301062129139.jpg\"></p>', NULL, 'Fender Squier Bass  电贝司');
INSERT INTO `t_product` VALUES (42, 'TRBX 305', 1999.00, 233, '20230106043011000000064.jpg', b'0', b'0', 'default.jpg', 0, 11, NULL, NULL, NULL, 'YAMAHA雅马哈电贝斯TRBX174/304四弦BB234/235五弦被主动贝司BASS');
INSERT INTO `t_product` VALUES (43, 'TRBX 174', 3199.00, 233, '20230106043039000000167.jpg', b'0', b'0', 'default.jpg', 0, 11, NULL, NULL, NULL, 'YAMAHA雅马哈电贝斯TRBX174/304四弦BB234/235五弦被主动贝司BASS');
INSERT INTO `t_product` VALUES (44, 'EK50 CHINA国乐版', 2520.00, 2333, '20230106043911000000568.jpg', b'0', b'0', 'default.jpg', 0, 15, NULL, NULL, NULL, 'KORG科音合成器EK50 PA300 PA600 PA700 PA1000 自动伴奏编曲键盘');
INSERT INTO `t_product` VALUES (45, 'PA 700', 8082.00, 233, '20230106043920000000542.jpg', b'0', b'0', 'default.jpg', 0, 15, NULL, NULL, NULL, 'KORG科音合成器EK50 PA300 PA600 PA700 PA1000 自动伴奏编曲键盘');
INSERT INTO `t_product` VALUES (46, 'YAMAHA moXF8', 7610.00, 2333, '20230106044147000000388.jpg', b'1', b'0', 'default.jpg', 0, 16, '2023-01-06 16:48:40', '<p><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_2023010621291312.jpg\"><img width=\"100%\" src=\"http://localhost:8080/image/productIntroImgs/微信图片_2023010621291313.jpg\"></p>', NULL, '雅马哈MOXF8 音乐编曲成人舞台乐队演奏88键全配重专业电子合成器');
INSERT INTO `t_product` VALUES (47, 'MODX8', 12450.00, 233, '20230106044501000000535.jpg', b'0', b'0', 'default.jpg', 0, 16, NULL, NULL, NULL, 'YAMAHA雅马哈合成器MODX8/7MODX6重锤编曲电子键盘MOXF升级88键');
INSERT INTO `t_product` VALUES (48, 'JG-10 动态压缩', 179.00, 233, '20230106050011000000470.jpg', b'0', b'0', 'default.jpg', 0, 12, NULL, NULL, NULL, 'JOYO卓乐电吉他单块效果器经典过载音箱模拟延迟重金属失真电源器');
INSERT INTO `t_product` VALUES (49, 'MG15GFX', 1590.00, 233, '20230106050000000000813.jpg', b'0', b'0', 'default.jpg', 0, 13, NULL, NULL, NULL, 'MARSHALL马歇尔电吉他音箱MG15GFX失真重金属效果器进口马勺音响');
INSERT INTO `t_product` VALUES (50, 'JF-17 失真效果', 189.00, 233, '20230106050153000000188.jpg', b'0', b'0', 'default.jpg', 0, 12, NULL, NULL, NULL, 'JOYO卓乐电吉他单块效果器经典过载音箱模拟延迟重金属失真电源器');
INSERT INTO `t_product` VALUES (51, 'JF-14 芬达音色', 219.00, 233, '20230106050159000000891.jpg', b'0', b'0', 'default.jpg', 0, 12, NULL, NULL, NULL, 'JOYO卓乐电吉他单块效果器经典过载音箱模拟延迟重金属失真电源器');
INSERT INTO `t_product` VALUES (52, 'UR12 ', 799.00, 233, '20230106050417000000788.jpg', b'1', b'0', 'default.jpg', 0, 14, '2023-01-06 17:42:40', NULL, NULL, 'Steinberg/YAMAHA雅马哈声卡 UR12专业直播K歌编曲配音录音设备');
INSERT INTO `t_product` VALUES (53, '打上花火', 10.00, 233, '20230106051639000000344.jpg', b'0', b'0', 'default.jpg', 0, 17, NULL, NULL, NULL, '打上花火 tab谱');
INSERT INTO `t_product` VALUES (54, '未闻花名', 10.00, 233, '20230106051645000000887.jpg', b'0', b'0', 'default.jpg', 0, 17, NULL, NULL, NULL, '未闻花名 tab谱');
INSERT INTO `t_product` VALUES (55, '雲流れ', 15.00, 233, '20230106051655000000893.jpg', b'0', b'0', '20230106074548000000895.jpg', 0, 17, NULL, NULL, NULL, '东方幻想乡 tab谱');
INSERT INTO `t_product` VALUES (56, '上海红茶馆', 15.00, 233, '20230106051703000000480.jpg', b'0', b'0', 'default.jpg', 0, 17, NULL, NULL, NULL, '东方红魔乡 -  - 上海红茶馆   tab谱');
INSERT INTO `t_product` VALUES (57, '安河桥', 15.00, 233, '20230106051711000000902.jpg', b'0', b'0', 'default.jpg', 0, 17, NULL, NULL, NULL, '安河桥 tab谱');
INSERT INTO `t_product` VALUES (58, '烂泥', 10.00, 233, '20230106052033000000644.jpg', b'0', b'0', 'default.jpg', 0, 18, NULL, NULL, NULL, '烂泥 tab谱');
INSERT INTO `t_product` VALUES (59, '大风吹', 10.00, 233, '20230106052023000000300.jpg', b'0', b'0', 'default.jpg', 0, 18, NULL, NULL, NULL, '草东没有派对');
INSERT INTO `t_product` VALUES (60, '眩しいDNAだけ', 115.00, 233, '20230106052108000000778.jpg', b'0', b'0', 'default.jpg', 0, 19, NULL, NULL, NULL, '真夜中 眩しいDNAだけ 五线谱');
INSERT INTO `t_product` VALUES (61, 'MILABO ', 10.00, 233, '20230106052050000000143.jpg', b'0', b'0', 'default.jpg', 0, 23, NULL, NULL, NULL, '真夜中 眩しいDNAだけ');
INSERT INTO `t_product` VALUES (62, '星座になれたら', 30.00, 233, '20230106053633000000281.jpg', b'1', b'0', 'default.jpg', 0, 23, '2023-01-06 17:42:23', NULL, NULL, 'TV动画《孤独摇滚！》插曲《如果能成为星座》配信发布！');
INSERT INTO `t_product` VALUES (63, '忘れてやらない', 30.00, 233, '20230106053839000000651.jpg', b'1', b'0', 'default.jpg', 0, 23, '2023-01-06 17:38:54', NULL, NULL, 'TV动画《孤独摇滚！》插曲《不要忘记》配信发布！');
INSERT INTO `t_product` VALUES (64, 'あのバンド', 10.00, 233, '20230106053848000000148.jpg', b'0', b'0', 'default.jpg', 0, 20, NULL, NULL, NULL, 'TV动画《孤独摇滚！》插曲《那个乐队》配信发布！');
INSERT INTO `t_product` VALUES (65, '忘れてやらない', 10.00, 233, '20230106054150000000254.jpg', b'0', b'0', 'default.jpg', 0, 22, NULL, '<p><br></p>', '<p><br></p>', '忘れてやらない 鼓谱');
INSERT INTO `t_product` VALUES (66, 'Gibson Les Paul Standard', 25000.00, 1, '20230106070723000000065.jpg', b'0', b'0', 'default.jpg', 0, 24, NULL, NULL, NULL, '唯的乐器');
INSERT INTO `t_product` VALUES (67, 'Fender Japan Mustang ', 8000.00, 1, '20230106070745000000513.jpg', b'0', b'0', 'default.jpg', 0, 28, NULL, NULL, NULL, '啊梓喵的乐器');
INSERT INTO `t_product` VALUES (68, 'Fender japan JB62-DMC', 8000.00, 1, '20230106070759000000233.jpg', b'0', b'0', 'default.jpg', 0, 25, NULL, NULL, NULL, 'mio的乐器');
INSERT INTO `t_product` VALUES (69, 'KORG Triton Extreme 76', 18000.00, 1, '20230106070809000000184.jpg', b'0', b'0', 'default.jpg', 0, 26, NULL, NULL, NULL, '紬的合成器！');
INSERT INTO `t_product` VALUES (70, 'Yamaha Hipgig HG6T46', 15000.00, 1, '20230106065948000000074.jpg', b'0', b'0', 'default.jpg', 0, 27, NULL, NULL, NULL, '律的这款鼓同样属于日本内销产品，国外实体店一般没有，价格在一万五左右。 ');
INSERT INTO `t_product` VALUES (71, 'Gibson 1968 Les Paul', 23409.00, 1, '20230106073530000000071.jpg', b'0', b'0', 'default.jpg', 0, 30, NULL, NULL, NULL, '波奇酱的吉他');
INSERT INTO `t_product` VALUES (72, 'Fender Player Bass', 8300.00, 1, '20230106073540000000485.jpg', b'0', b'0', 'default.jpg', 0, 29, NULL, NULL, NULL, '凉的贝斯');
INSERT INTO `t_product` VALUES (73, '1959 Gibson Les Paul', 8920.00, 1, '20230110034002000000028.jpg', b'0', b'0', 'default.jpg', 0, 32, NULL, NULL, NULL, '喜多酱的吉他');
INSERT INTO `t_product` VALUES (74, 'Pearl CS1450 Chad Smith', 12000.00, 1, '20230106073600000000407.jpg', b'0', b'0', 'default.jpg', 0, 33, NULL, NULL, NULL, '虹夏的鼓');
INSERT INTO `t_product` VALUES (75, 'Yamaha THR5', 2300.00, 1, '20230106073624000000501.jpg', b'0', b'0', 'default.jpg', 0, 13, NULL, NULL, NULL, 'YAMAHA THR5扩音器');

-- ----------------------------
-- Table structure for t_product_swiper_image
-- ----------------------------
DROP TABLE IF EXISTS `t_product_swiper_image`;
CREATE TABLE `t_product_swiper_image`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `productId` int(0) NULL DEFAULT NULL COMMENT '所属商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_swiper_image
-- ----------------------------
INSERT INTO `t_product_swiper_image` VALUES (1, '1.jpg', 1, 14);
INSERT INTO `t_product_swiper_image` VALUES (2, '2.jpg', 2, 14);
INSERT INTO `t_product_swiper_image` VALUES (3, '3.jpg', 3, 14);
INSERT INTO `t_product_swiper_image` VALUES (4, '4.jpg', 4, 14);
INSERT INTO `t_product_swiper_image` VALUES (5, '5.jpg', 5, 14);
INSERT INTO `t_product_swiper_image` VALUES (6, '6.jpg', 6, 14);
INSERT INTO `t_product_swiper_image` VALUES (7, '7.jpg', 7, 14);
INSERT INTO `t_product_swiper_image` VALUES (8, '11.jpg', 1, 4);
INSERT INTO `t_product_swiper_image` VALUES (9, '22.jpg', 2, 4);
INSERT INTO `t_product_swiper_image` VALUES (10, '33.jpg', 3, 4);
INSERT INTO `t_product_swiper_image` VALUES (11, '44.jpg', 4, 4);
INSERT INTO `t_product_swiper_image` VALUES (19, '20230106091628000000194.jfif', 0, 1);
INSERT INTO `t_product_swiper_image` VALUES (20, '20230106091703000000334.jpg', 0, 1);
INSERT INTO `t_product_swiper_image` VALUES (21, '20230106092947000000140.jpg', 0, 15);
INSERT INTO `t_product_swiper_image` VALUES (22, '20230106093004000000246.jpg', 0, 15);
INSERT INTO `t_product_swiper_image` VALUES (23, '20230106093409000000652.jpg', 0, 38);
INSERT INTO `t_product_swiper_image` VALUES (24, '20230106093424000000176.jpg', 0, 38);
INSERT INTO `t_product_swiper_image` VALUES (25, '20230106093830000000291.jpg', 0, 41);
INSERT INTO `t_product_swiper_image` VALUES (26, '20230106093852000000959.jpg', 0, 41);
INSERT INTO `t_product_swiper_image` VALUES (27, '20230106094123000000576.jpg', 0, 46);
INSERT INTO `t_product_swiper_image` VALUES (28, '20230106094130000000107.jpg', 0, 46);
INSERT INTO `t_product_swiper_image` VALUES (29, '20230106094322000000271.jpg', 0, 34);
INSERT INTO `t_product_swiper_image` VALUES (30, '20230106094527000000445.jpg', 0, 34);
INSERT INTO `t_product_swiper_image` VALUES (31, '20230106094648000000225.jpg', 0, 74);
INSERT INTO `t_product_swiper_image` VALUES (32, '20230106094718000000719.jpg', 0, 63);
INSERT INTO `t_product_swiper_image` VALUES (33, '20230106094802000000572.jpg', 0, 62);
INSERT INTO `t_product_swiper_image` VALUES (34, '20230106094843000000395.jpg', 0, 52);
INSERT INTO `t_product_swiper_image` VALUES (35, '20230106094856000000421.jpg', 0, 39);
INSERT INTO `t_product_swiper_image` VALUES (36, '20230106095057000000820.jpg', 0, 5);
INSERT INTO `t_product_swiper_image` VALUES (37, '20230106095647000000662.jpg', 0, 16);
INSERT INTO `t_product_swiper_image` VALUES (38, '20230106095708000000895.jpg', 0, 17);

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品小类',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `bigTypeId` int(0) NULL DEFAULT NULL COMMENT '商品大类编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bigTypeId`(`bigTypeId`) USING BTREE,
  CONSTRAINT `t_smalltype_ibfk_1` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES (1, '楚门系列', '楚门系列', 1);
INSERT INTO `t_smalltype` VALUES (2, '卡马系列', '卡马系列', 1);
INSERT INTO `t_smalltype` VALUES (3, 'YAMAHA系列', 'YAMAHA系列', 1);
INSERT INTO `t_smalltype` VALUES (5, 'Fender系列', 'Fender系列', 2);
INSERT INTO `t_smalltype` VALUES (6, 'YAMAHA系列', 'YAMAHA系列', 2);
INSERT INTO `t_smalltype` VALUES (7, 'Gibson系列', 'Gibson系列', 2);
INSERT INTO `t_smalltype` VALUES (10, 'Fender系列', 'Fender系列', 3);
INSERT INTO `t_smalltype` VALUES (11, 'YAMAHA系列', 'YAMAHA系列', 3);
INSERT INTO `t_smalltype` VALUES (12, '吉他效果器', '吉他效果器', 5);
INSERT INTO `t_smalltype` VALUES (13, '扩音器', '扩音器', 5);
INSERT INTO `t_smalltype` VALUES (14, '声卡', '声卡', 5);
INSERT INTO `t_smalltype` VALUES (15, 'KORG系列', 'KORG系列', 4);
INSERT INTO `t_smalltype` VALUES (16, 'YAMAHA系列', 'YAMAHA系列', 4);
INSERT INTO `t_smalltype` VALUES (17, '木吉他谱', '木吉他谱', 6);
INSERT INTO `t_smalltype` VALUES (18, '电吉他谱', '电吉他谱', 6);
INSERT INTO `t_smalltype` VALUES (19, '键盘谱', '键盘谱', 7);
INSERT INTO `t_smalltype` VALUES (20, '四弦贝斯', '四弦贝斯', 8);
INSERT INTO `t_smalltype` VALUES (21, '六弦贝斯', '六弦贝斯', 8);
INSERT INTO `t_smalltype` VALUES (22, '鼓谱', '鼓谱', 9);
INSERT INTO `t_smalltype` VALUES (23, '乐队总谱', '乐队总谱', 10);
INSERT INTO `t_smalltype` VALUES (24, '平泽唯', '平泽唯', 45);
INSERT INTO `t_smalltype` VALUES (25, 'mio', 'mio', 45);
INSERT INTO `t_smalltype` VALUES (26, '䌷', '䌷', 45);
INSERT INTO `t_smalltype` VALUES (27, '律队', '律队', 45);
INSERT INTO `t_smalltype` VALUES (28, '梓', '梓', 45);
INSERT INTO `t_smalltype` VALUES (29, '凉', '凉', 46);
INSERT INTO `t_smalltype` VALUES (30, '波奇', '波奇', 46);
INSERT INTO `t_smalltype` VALUES (32, '喜多', '喜多', 46);
INSERT INTO `t_smalltype` VALUES (33, '虹夏', '虹夏', 46);
INSERT INTO `t_smalltype` VALUES (39, '测试1', '测试1', 10);
INSERT INTO `t_smalltype` VALUES (40, '测试2', '测试2', 10);
INSERT INTO `t_smalltype` VALUES (41, '测试3', '测试3', 10);

-- ----------------------------
-- Table structure for t_wxuserinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuserinfo`;
CREATE TABLE `t_wxuserinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `openid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户唯一标识',
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatarUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像图片的 URL',
  `registerDate` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
  `lastLoginDate` datetime(0) NULL DEFAULT NULL COMMENT '最后登录日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wxuserinfo
-- ----------------------------
INSERT INTO `t_wxuserinfo` VALUES (6, 'ot6Vy5TvKzezLoG_2xjEJwaNxYo0', '咲夜', 'https://thirdwx.qlogo.cn/mmopen/vi_32/lxibjEUaQ0tp10xxgHT3oeia03OU0K19KGXtz4qbPrRqpJJDbZRFWvIRSvgGqrcDvPa6S6s4oNY14jibCv1qeaWLQ/132', '2023-01-06 19:54:56', '2023-01-10 13:48:21');

SET FOREIGN_KEY_CHECKS = 1;
