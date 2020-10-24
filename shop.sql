/*
Navicat MySQL Data Transfer

Source Server         : jdbctest01
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-10-24 18:06:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ausertable
-- ----------------------------
DROP TABLE IF EXISTS `ausertable`;
CREATE TABLE `ausertable` (
  `aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ausertable
-- ----------------------------
INSERT INTO `ausertable` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for busertable
-- ----------------------------
DROP TABLE IF EXISTS `busertable`;
CREATE TABLE `busertable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bpwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10029 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of busertable
-- ----------------------------
INSERT INTO `busertable` VALUES ('10020', 'admin', 'admin');
INSERT INTO `busertable` VALUES ('10024', '2861298397@qq.com', '123456');
INSERT INTO `busertable` VALUES ('10025', '123@qq.com', '123');
INSERT INTO `busertable` VALUES ('10026', '384118774@qq.com', '123456');
INSERT INTO `busertable` VALUES ('10027', '2241698635@qq.com', '123456');
INSERT INTO `busertable` VALUES ('10028', '4445887@qq.com', '123456');

-- ----------------------------
-- Table structure for carttable
-- ----------------------------
DROP TABLE IF EXISTS `carttable`;
CREATE TABLE `carttable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `busertable_id` int NOT NULL,
  `goodstable_id` int NOT NULL,
  `shoppingnum` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`busertable_id`),
  KEY `gno` (`goodstable_id`),
  CONSTRAINT `bid` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of carttable
-- ----------------------------
INSERT INTO `carttable` VALUES ('35', '10020', '1092', '1');
INSERT INTO `carttable` VALUES ('36', '10024', '1114', '3');
INSERT INTO `carttable` VALUES ('37', '10020', '1095', '1');
INSERT INTO `carttable` VALUES ('38', '10024', '1092', '1');
INSERT INTO `carttable` VALUES ('40', '10026', '1054', '1');
INSERT INTO `carttable` VALUES ('41', '10026', '1065', '10');
INSERT INTO `carttable` VALUES ('42', '10026', '1065', '1');
INSERT INTO `carttable` VALUES ('43', '10026', '1145', '1');
INSERT INTO `carttable` VALUES ('44', '10020', '1126', '2');
INSERT INTO `carttable` VALUES ('45', '10027', '1065', '1');
INSERT INTO `carttable` VALUES ('46', '10027', '1103', '1');
INSERT INTO `carttable` VALUES ('47', '10027', '1143', '2');
INSERT INTO `carttable` VALUES ('48', '10024', '1055', '1');
INSERT INTO `carttable` VALUES ('49', '10028', '1065', '4');
INSERT INTO `carttable` VALUES ('50', '10028', '1054', '1');
INSERT INTO `carttable` VALUES ('51', '10028', '1123', '1');
INSERT INTO `carttable` VALUES ('52', '10024', '1077', '1');
INSERT INTO `carttable` VALUES ('53', '10024', '1095', '1');

-- ----------------------------
-- Table structure for focustable
-- ----------------------------
DROP TABLE IF EXISTS `focustable`;
CREATE TABLE `focustable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goodstable_id` int NOT NULL,
  `busertable_id` int NOT NULL,
  `focustime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gno1` (`goodstable_id`),
  KEY `bid1` (`busertable_id`),
  CONSTRAINT `bid1` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno1` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of focustable
-- ----------------------------

-- ----------------------------
-- Table structure for goodstable
-- ----------------------------
DROP TABLE IF EXISTS `goodstable`;
CREATE TABLE `goodstable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goprice` double DEFAULT NULL,
  `grprice` double DEFAULT NULL,
  `gstore` int DEFAULT NULL,
  `gpicture` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodstype_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`goodstype_id`),
  CONSTRAINT `typeid` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goodstable
-- ----------------------------
INSERT INTO `goodstable` VALUES ('1054', '耳机', '2200', '1899', '0', 'timg1.jpg', '6');
INSERT INTO `goodstable` VALUES ('1055', '香水', '100', '98', '1', 'timg2.jpg', '5');
INSERT INTO `goodstable` VALUES ('1056', '马丁靴', '200', '180', '5', 'timg3.jpg', '2');
INSERT INTO `goodstable` VALUES ('1057', '百奇饼干', '12', '10', '6', 'timg4.jpg', '1');
INSERT INTO `goodstable` VALUES ('1058', '匡威帆布鞋', '150', '125', '5', 'timg5.jpg', '2');
INSERT INTO `goodstable` VALUES ('1059', '生抽', '8', '7.5', '6', 'timg6.jpg', '5');
INSERT INTO `goodstable` VALUES ('1060', '工具箱', '45', '45', '5', 'timg7.jpg', '5');
INSERT INTO `goodstable` VALUES ('1061', '木井方', '120', '120', '6', 'timg8.jpg', '24');
INSERT INTO `goodstable` VALUES ('1062', '星星抱枕', '25', '20', '7', 'timg9.jpg', '5');
INSERT INTO `goodstable` VALUES ('1063', '挖掘机', '120', '115', '8', 'timg10.jpg', '3');
INSERT INTO `goodstable` VALUES ('1064', '榴莲', '20', '20', '6', 'timg11.jpg', '1');
INSERT INTO `goodstable` VALUES ('1065', '性感内衣', '125', '99', '96', 'timg12.jpg', '2');
INSERT INTO `goodstable` VALUES ('1066', '圣经', '180', '99', '8', 'timg13.jpg', '7');
INSERT INTO `goodstable` VALUES ('1067', '男士卫衣', '150', '88', '5', 'timg14.jpg', '2');
INSERT INTO `goodstable` VALUES ('1068', '苹果醋', '6', '5.5', '5', 'timg15.jpg', '21');
INSERT INTO `goodstable` VALUES ('1069', '玩具超人', '50', '39', '5', 'timg16.jpg', '3');
INSERT INTO `goodstable` VALUES ('1070', '王八', '10', '8', '5', 'timg17.jpg', '3');
INSERT INTO `goodstable` VALUES ('1071', '高端茶具', '89', '78', '5', 'timg18.jpg', '5');
INSERT INTO `goodstable` VALUES ('1072', '绿玛瑙吊坠', '180', '150', '5', 'timg19.jpg', '2');
INSERT INTO `goodstable` VALUES ('1073', 'iphone手机', '4999', '4399', '5', 'timg20.jpg', '6');
INSERT INTO `goodstable` VALUES ('1074', '炒锅', '28', '30', '5', 'timg21.jpg', '5');
INSERT INTO `goodstable` VALUES ('1075', '毛线团', '1', '0.8', '5', 'timg22.jpg', '2');
INSERT INTO `goodstable` VALUES ('1076', '盆栽', '20', '10', '5', 'timg23.jpg', '5');
INSERT INTO `goodstable` VALUES ('1077', 'DELL键盘', '198', '140', '1', 'timg24.jpg', '6');
INSERT INTO `goodstable` VALUES ('1078', '男士皮鞋', '220', '200', '5', 'timg25.jpg', '2');
INSERT INTO `goodstable` VALUES ('1079', '玩具蛇', '20', '25', '5', 'timg26.jpg', '3');
INSERT INTO `goodstable` VALUES ('1080', '代步电动车', '20000', '18000', '5', 'timg27.jpg', '24');
INSERT INTO `goodstable` VALUES ('1081', '大公鸡', '56', '78', '5', 'timg28.jpg', '1');
INSERT INTO `goodstable` VALUES ('1082', '板鞋', '50', '45', '5', 'timg29.jpg', '2');
INSERT INTO `goodstable` VALUES ('1083', '茅台酒', '560', '450', '5', 'timg30.jpg', '21');
INSERT INTO `goodstable` VALUES ('1084', '铠甲勇士变身器', '25', '20', '5', 'timg31.jpg', '3');
INSERT INTO `goodstable` VALUES ('1085', '玉佛吊坠', '10', '5', '5', 'timg32.jpg', '2');
INSERT INTO `goodstable` VALUES ('1089', '投影仪', '6000', '5000', '4', '34.jpg', '6');
INSERT INTO `goodstable` VALUES ('1090', '中国结', '15', '13', '5', '35.jpg', '2');
INSERT INTO `goodstable` VALUES ('1091', '小龙虾', '25', '20', '5', '36.jpg', '1');
INSERT INTO `goodstable` VALUES ('1092', '高科技缝纫机', '1200', '1000', '1', '37.jpg', '6');
INSERT INTO `goodstable` VALUES ('1093', '耕地机', '3000', '2000', '5', '38.jpg', '5');
INSERT INTO `goodstable` VALUES ('1094', '家庭亲子套装', '300', '200', '5', '39.jpg', '2');
INSERT INTO `goodstable` VALUES ('1095', '小米手机', '3000', '3000', '4', '40.jpg', '6');
INSERT INTO `goodstable` VALUES ('1096', '小儿咽扁颗粒', '30', '20', '5', '41.jpg', '4');
INSERT INTO `goodstable` VALUES ('1097', '全自动洗衣机', '6000', '5000', '5', '42.jpg', '6');
INSERT INTO `goodstable` VALUES ('1098', '心形生日蛋糕', '300', '200', '5', '43.jpg', '1');
INSERT INTO `goodstable` VALUES ('1099', '小魔仙变身棒', '30', '20', '5', '44.jpg', '3');
INSERT INTO `goodstable` VALUES ('1100', '玉如意', '6000', '5000', '5', '45.jpg', '3');
INSERT INTO `goodstable` VALUES ('1101', '陈列柜', '200', '100', '5', '46.jpg', '5');
INSERT INTO `goodstable` VALUES ('1102', '上肢健身器材', '200', '100', '5', '47.jpg', '5');
INSERT INTO `goodstable` VALUES ('1103', '防骨质增生丸', '200', '100', '3', '48.jpg', '4');
INSERT INTO `goodstable` VALUES ('1104', '益心片', '200', '100', '5', '49.jpg', '4');
INSERT INTO `goodstable` VALUES ('1105', '装饰眼镜', '300', '200', '5', '50.jpg', '2');
INSERT INTO `goodstable` VALUES ('1106', '装饰画框', '6', '5', '5', '51.jpg', '5');
INSERT INTO `goodstable` VALUES ('1107', '柜门合页', '3', '2', '5', '52.jpg', '5');
INSERT INTO `goodstable` VALUES ('1108', '活菌胶囊', '35', '20', '5', '53.jpg', '4');
INSERT INTO `goodstable` VALUES ('1109', '夜空之剑', '88', '59', '5', '54.jpg', '3');
INSERT INTO `goodstable` VALUES ('1110', '大卡车', '200000', '180000', '5', '56.jpg', '24');
INSERT INTO `goodstable` VALUES ('1111', '旗袍', '100', '99', '5', '57.jpg', '2');
INSERT INTO `goodstable` VALUES ('1112', '摩托公路赛', '10000', '9999', '5', '58.jpg', '24');
INSERT INTO `goodstable` VALUES ('1113', '湖人球衣', '200', '100', '5', '59.jpg', '2');
INSERT INTO `goodstable` VALUES ('1114', 'MP3', '200', '100', '52', '60.jpg', '6');
INSERT INTO `goodstable` VALUES ('1115', '老年双人代步车', '3000', '2000', '5', '61.jpg', '24');
INSERT INTO `goodstable` VALUES ('1116', '黑白情侣T恤', '129', '99', '5', '62.jpg', '2');
INSERT INTO `goodstable` VALUES ('1117', '粉色羽绒服', '699', '599', '5', '63.jpg', '2');
INSERT INTO `goodstable` VALUES ('1118', '粉色T恤', '129', '99', '5', '64.jpg', '2');
INSERT INTO `goodstable` VALUES ('1119', '蓝色体恤', '129', '99', '5', '65.jpg', '2');
INSERT INTO `goodstable` VALUES ('1120', '仿警察套装', '159', '99', '5', '66.jpg', '2');
INSERT INTO `goodstable` VALUES ('1121', '老式摩托罗拉手机', '600', '500', '5', '67.jpg', '5');
INSERT INTO `goodstable` VALUES ('1122', '貂皮大衣', '10000', '8888', '5', '68.jpg', '2');
INSERT INTO `goodstable` VALUES ('1123', '苹果10', '7000', '6000', '5', '69.jpg', '6');
INSERT INTO `goodstable` VALUES ('1124', '头孢分散片', '68', '52', '10', '70.jpg', '4');
INSERT INTO `goodstable` VALUES ('1125', '苹果11', '6000', '5000', '5', '71.jpg', '6');
INSERT INTO `goodstable` VALUES ('1126', '水果拼盘', '3', '2', '3', '72.jpg', '1');
INSERT INTO `goodstable` VALUES ('1127', '血管氢铝片', '27', '25', '5', '73.jpg', '4');
INSERT INTO `goodstable` VALUES ('1128', '红黑条纹情侣T恤', '300', '200', '5', '74.jpg', '2');
INSERT INTO `goodstable` VALUES ('1129', '格子短裙', '300', '200', '5', '75.jpg', '2');
INSERT INTO `goodstable` VALUES ('1130', '牛仔上衣女式', '300', '200', '5', '76.jpg', '2');
INSERT INTO `goodstable` VALUES ('1131', '绿色羊毛衫', '10000', '990', '5', '77.jpg', '2');
INSERT INTO `goodstable` VALUES ('1132', '黑白条纹情侣T恤', '90', '80', '5', '78.jpg', '2');
INSERT INTO `goodstable` VALUES ('1133', '粉色连衣裙', '90', '80', '5', '79.jpg', '2');
INSERT INTO `goodstable` VALUES ('1134', '涂鸦男士外套', '90', '80', '5', '79.jpg', '2');
INSERT INTO `goodstable` VALUES ('1135', '图案白色体恤', '90', '80', '5', '81.jpg', '2');
INSERT INTO `goodstable` VALUES ('1136', '红蓝条纹连衣裙', '90', '80', '5', '82.jpg', '2');
INSERT INTO `goodstable` VALUES ('1137', '条纹短裙', '100', '90', '5', '83.jpg', '2');
INSERT INTO `goodstable` VALUES ('1138', 'noc显示器', '800', '600', '5', '84.jpg', '6');
INSERT INTO `goodstable` VALUES ('1139', '苯酸分散片', '60', '50', '5', '85.jpg', '4');
INSERT INTO `goodstable` VALUES ('1140', '金色苹果手机', '10000', '8999', '5', '86.jpg', '6');
INSERT INTO `goodstable` VALUES ('1141', '雪碧饮料', '4', '3', '5', '91.jpg', '21');
INSERT INTO `goodstable` VALUES ('1142', '幼儿画册', '9', '8', '5', '92.jpg', '7');
INSERT INTO `goodstable` VALUES ('1143', '周易全书', '9', '8', '1', '93.jpg', '7');
INSERT INTO `goodstable` VALUES ('1144', '麻辣鸭脖', '8', '7', '5', '94.jpg', '1');
INSERT INTO `goodstable` VALUES ('1145', '宗申摩托', '9000', '8677', '4', '95.jpg', '24');
INSERT INTO `goodstable` VALUES ('1146', '双人上下铺木床', '90', '82', '5', '96.jpg', '24');
INSERT INTO `goodstable` VALUES ('1147', '古典钟表', '60', '55', '5', '97.jpg', '24');
INSERT INTO `goodstable` VALUES ('1148', '泡椒鸡爪', '30', '25', '5', '98.jpg', '1');
INSERT INTO `goodstable` VALUES ('1149', '新鲜猪腿', '30', '25', '5', '99.jpg', '1');
INSERT INTO `goodstable` VALUES ('1150', '周六福金项链', '9000', '8888', '5', '100.jpg', '2');
INSERT INTO `goodstable` VALUES ('1151', '古典屏风', '60', '58', '5', '101.jpg', '24');
INSERT INTO `goodstable` VALUES ('1152', '蜘蛛侠面具', '60', '58', '5', '102.jpg', '3');
INSERT INTO `goodstable` VALUES ('1153', '欧式钟表', '90', '89', '5', '103.jpg', '24');
INSERT INTO `goodstable` VALUES ('1154', '二次元服装', '90', '89', '5', '104.jpg', '2');
INSERT INTO `goodstable` VALUES ('1155', '立马电动车', '9000', '8999', '5', '105.jpg', '24');
INSERT INTO `goodstable` VALUES ('1156', '韩国钓鱼竿', '100', '88', '5', null, '24');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', '食品');
INSERT INTO `goodstype` VALUES ('2', '鞋服饰品');
INSERT INTO `goodstype` VALUES ('3', '玩具');
INSERT INTO `goodstype` VALUES ('4', '药品');
INSERT INTO `goodstype` VALUES ('5', '生活用品');
INSERT INTO `goodstype` VALUES ('6', '电子产品');
INSERT INTO `goodstype` VALUES ('7', '书籍');
INSERT INTO `goodstype` VALUES ('21', '饮品');
INSERT INTO `goodstype` VALUES ('22', '手办周边');
INSERT INTO `goodstype` VALUES ('24', '其他');

-- ----------------------------
-- Table structure for noticetable
-- ----------------------------
DROP TABLE IF EXISTS `noticetable`;
CREATE TABLE `noticetable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ncontent` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ntime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of noticetable
-- ----------------------------
INSERT INTO `noticetable` VALUES ('15', '青花瓷', '素胚勾勒出青花笔锋浓转淡\r\n瓶身描绘的牡丹一如你初妆\r\n冉冉檀香透过窗心事我了然\r\n宣纸上走笔至此搁一半\r\n釉色渲染仕女图韵味被私藏\r\n而你嫣然的一笑如含苞待放\r\n你的美一缕飘散\r\n去到我去不了的地方\r\n天青色等烟雨 而我在等你\r\n炊烟袅袅升起 隔江千万里\r\n在瓶底书汉隶仿前朝的飘逸\r\n就当我为遇见你伏笔', '2020-10-25 23:52:36');
INSERT INTO `noticetable` VALUES ('16', '夜曲', '一群嗜血的蚂蚁 被腐肉所吸引\r\n我面无表情 看孤独的风景\r\n失去你 爱恨开始分明\r\n失去你 还有什么事好关心\r\n当鸽子不再象征和平\r\n我终于被提醒\r\n广场上喂食的是秃鹰\r\n我用漂亮的押韵\r\n形容被掠夺一空的爱情\r\n啊 乌云开始遮蔽 夜色不干净\r\n公园里 葬礼的回音 在漫天飞行\r\n送你的白色玫瑰\r\n在纯黑的环境凋零\r\n乌鸦在树枝上诡异的很安静\r\n静静听 我黑色的大衣\r\n想温暖你日渐冰冷的回忆\r\n走过的 走过的 生命\r\n啊 四周弥漫雾气\r\n我在空旷的墓地', '2020-10-07 22:52:39');
INSERT INTO `noticetable` VALUES ('17', '七里香', '窗外的麻雀 在电线杆上多嘴\r\n你说这一句 很有夏天的感觉\r\n手中的铅笔 在纸上来来回回\r\n我用几行字形容你是我的谁\r\n秋刀鱼的滋味 猫跟你都想了解\r\n初恋的香味就这样被我们寻回\r\n那温暖的阳光 像刚摘的鲜艳草莓\r\n你说你舍不得吃掉这一种感觉\r\n雨下整夜 我的爱溢出就像雨水\r\n院子落叶 跟我的思念厚厚一叠\r\n几句是非 也无法将我的热情冷却\r\n你出现在我诗的每一页', '2020-10-20 23:52:42');
INSERT INTO `noticetable` VALUES ('18', '稻香', '对这个世界 如果你有太多的抱怨\r\n跌倒了 就不敢继续往前走\r\n为什么 人要这么的脆弱 堕落\r\n请你打开电视看看\r\n多少人为生命 在努力勇敢的走下去\r\n我们是不是该知足\r\n珍惜一切 就算没有拥有\r\n还记得 你说家是唯一的城堡\r\n随着稻香 河流继续奔跑\r\n微微笑 小时候的梦我知道\r\n不要哭 让萤火虫带着你逃跑\r\n乡间的歌谣 永远的依靠\r\n回家吧 回到最初的美好\r\n不要这么容易 就想放弃\r\n就像我说的\r\n追不到的梦想 换个梦不就得了\r\n为自己的人生鲜艳上色\r\n先把爱涂上喜欢的颜色', '2020-10-22 23:52:46');
INSERT INTO `noticetable` VALUES ('28', '苏瑜朝又把饭卡丢了', '今天上学时，苏瑜朝把饭卡丢了', '2020-09-17 13:11:31');

-- ----------------------------
-- Table structure for orderbasetable
-- ----------------------------
DROP TABLE IF EXISTS `orderbasetable`;
CREATE TABLE `orderbasetable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `busertable_id` int NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint NOT NULL,
  `orderdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid2` (`busertable_id`),
  CONSTRAINT `bid2` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10065 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orderbasetable
-- ----------------------------
INSERT INTO `orderbasetable` VALUES ('10053', '10020', '3280', '1', '2020-09-17 00:26:33');
INSERT INTO `orderbasetable` VALUES ('10054', '10024', '280', '1', '2020-09-17 00:42:11');
INSERT INTO `orderbasetable` VALUES ('10055', '10020', '4000', '0', '2020-09-17 12:42:47');
INSERT INTO `orderbasetable` VALUES ('10056', '10024', '300', '1', '2020-09-17 12:43:23');
INSERT INTO `orderbasetable` VALUES ('10057', '10020', '1000', '1', '2020-09-17 13:02:39');
INSERT INTO `orderbasetable` VALUES ('10058', '10026', '2097', '1', '2020-09-17 13:08:36');
INSERT INTO `orderbasetable` VALUES ('10059', '10026', '990', '0', '2020-09-17 13:09:42');
INSERT INTO `orderbasetable` VALUES ('10060', '10026', '8677', '1', '2020-09-17 13:12:51');
INSERT INTO `orderbasetable` VALUES ('10061', '10020', '4', '1', '2020-09-18 13:52:00');
INSERT INTO `orderbasetable` VALUES ('10062', '10027', '215', '1', '2020-09-18 13:56:05');
INSERT INTO `orderbasetable` VALUES ('10063', '10028', '8295', '0', '2020-09-22 18:58:04');
INSERT INTO `orderbasetable` VALUES ('10064', '10024', '3000', '1', '2020-09-24 17:07:01');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int NOT NULL,
  `goodstable_id` int NOT NULL,
  `shoppingnum` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `odsn` (`orderbasetable_id`),
  KEY `gno3` (`goodstable_id`),
  CONSTRAINT `gno3` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`),
  CONSTRAINT `odsn` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('53', '10053', '1092', '3');
INSERT INTO `orderdetail` VALUES ('54', '10053', '1077', '2');
INSERT INTO `orderdetail` VALUES ('55', '10054', '1077', '2');
INSERT INTO `orderdetail` VALUES ('56', '10055', '1092', '4');
INSERT INTO `orderdetail` VALUES ('57', '10056', '1114', '3');
INSERT INTO `orderdetail` VALUES ('58', '10057', '1092', '1');
INSERT INTO `orderdetail` VALUES ('59', '10058', '1054', '1');
INSERT INTO `orderdetail` VALUES ('60', '10058', '1065', '2');
INSERT INTO `orderdetail` VALUES ('61', '10059', '1065', '10');
INSERT INTO `orderdetail` VALUES ('62', '10060', '1145', '1');
INSERT INTO `orderdetail` VALUES ('63', '10061', '1126', '2');
INSERT INTO `orderdetail` VALUES ('64', '10062', '1143', '2');
INSERT INTO `orderdetail` VALUES ('65', '10062', '1103', '1');
INSERT INTO `orderdetail` VALUES ('66', '10062', '1065', '1');
INSERT INTO `orderdetail` VALUES ('67', '10063', '1065', '4');
INSERT INTO `orderdetail` VALUES ('68', '10063', '1054', '1');
INSERT INTO `orderdetail` VALUES ('69', '10063', '1123', '1');
INSERT INTO `orderdetail` VALUES ('70', '10064', '1095', '1');
