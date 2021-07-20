/*
Navicat MySQL Data Transfer

Source Server         : Datebase Experiment2&3
Source Server Version : 80024
Source Host           : localhost:3306
Source Database       : zust bar

Target Server Type    : MYSQL
Target Server Version : 80024
File Encoding         : 65001

Date: 2021-07-04 11:24:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article_to_tag`
-- ----------------------------
DROP TABLE IF EXISTS `article_to_tag`;
CREATE TABLE `article_to_tag` (
  `middle_id` int NOT NULL AUTO_INCREMENT COMMENT '充当文章表和标签表之间的中间表',
  `article_id` int NOT NULL COMMENT '文章表的id',
  `tag_id` int NOT NULL COMMENT '标签表的id',
  PRIMARY KEY (`middle_id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  KEY `article_to_tag_ibfk_2` (`tag_id`) USING BTREE,
  CONSTRAINT `article_to_tag_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_to_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `a_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article_to_tag
-- ----------------------------
INSERT INTO `article_to_tag` VALUES ('106', '184', '7');
INSERT INTO `article_to_tag` VALUES ('107', '185', '5');
INSERT INTO `article_to_tag` VALUES ('108', '186', '5');

-- ----------------------------
-- Table structure for `a_article`
-- ----------------------------
DROP TABLE IF EXISTS `a_article`;
CREATE TABLE `a_article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章id值',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `author` int NOT NULL COMMENT '文章作者id',
  `published_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章发表的时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章的内容（HTML）',
  `collection` int NOT NULL DEFAULT '0' COMMENT '文章收藏数',
  `share` int NOT NULL DEFAULT '0' COMMENT '文章转发数',
  `comment` int NOT NULL DEFAULT '0' COMMENT '文章评论数',
  `star` int NOT NULL DEFAULT '0' COMMENT '文章点赞数',
  `stick` int NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `page_view` int NOT NULL DEFAULT '0' COMMENT '浏览量',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of a_article
-- ----------------------------
INSERT INTO `a_article` VALUES ('184', '繁星之约', '77', '2021-07-03 13:35:10', '<div>广场上除了星月还是可爱的星月。山间的风是清甜的，沁人心脾，一呼一吸，都能让人心襟空朗。山间的夜是明静的，闭上眼也能让人洞察千里之外。怀疑吗？抬望眼轻而易举就捕捉到了隔着河汉的织女与牛郎；还疑惑吗？你闭上眼就能知道山外所有的发生，且听深远处那车水马龙，人声鼎沸，且看那不夜的城市，弥漫烟火……在秋虫卿卿的广场上，我们都寡语了，成了安安静静的守夜者，用心点燃大地间的每豆流萤，用情点燃天空里的每一盏星斗。那哪是流萤与星斗？分明是母亲深情的目光呀，我又听到了母亲亲切的土语，那是星月传给下界的声音，倾诉着一个个荡气回肠的故事……</div><div><br></div><div>有人指着天空，高兴地喊那是我的水瓶座，那是我的天平座，那是……理清童年的记忆，还是浓墨重彩，朴实的乡亲告诉我的只有镰刀座，斧王座，锄头座，铁锹座……西洋传过来的知识在课本中流传，乡土的概念铺上厚厚尘埃，在一点点流失，心在滴血，浓浓乡愁，却上心头。</div><div><br></div><div>故乡的星空无比美妙，以致无法用文字描述，用图画去展示。梵高的《星空》又如何与之媲美？因为梵高的《星空》只有稚气、呆板，沉闷，故乡的星星看了也不会高兴。曾经有个摄影家拍下星空下的故乡，揽下了国家大奖，要是下点点儿力气，拍下故乡的星空，或许人间又新添一个诺贝尔奖！</div><div><br></div><div>不知是谁悄然点着了乡亲们给我们准备的篝火，山间的夜也就些点燃。老萧把烧烤拿了过来，分发给大家。我们拿白天孤独的茶杯斟满深情的心悠然，共赴今晚上的繁星之约，品尝悠闲自得的慢时光！“我们升起火堆，唱起歌儿，跳起舞来……我们唱睡了黑夜，唱睡了星辰……”不知是谁起的头，唱起了海来阿木的《别知己》，尽管大家调子不靠谱，但都是心声。没音乐细胞的老萧也跟着乱哼哼，不停问是什么歌？我笑说是别红颜，他笑答像别冤家！大家一齐哄笑起来，便大口吃肉，小口品酒……</div><div><br></div><div>夜空中，蝙蝠侠从我们的篝火上忽闪而过。它的飞行不知是受时间的提示，还是受星光的唆使，或许是受月亮的蛊惑……它从阴暗角缝处闯荡而出，尽显飞檐走壁的本领，使我想起金庸笔下险恶的江湖。它每圈不规矩的飞行，让我很担心会撞在老墙上成为夜的标本。但我也特希望它成为那标本，了却我好奇的担心，这样我可以看见它忽闪忽闪的真面目，知晓它飞行的目的了。但我的担心总是悬在嗓眼里，全是多余，它就那样跟着我们飞舞着，带着我的担心飞舞着，飞入黑黑的夜，消失在满天繁星里。……</div>\r\n					   ', '1', '1', '2', '3', '0', '0');
INSERT INTO `a_article` VALUES ('185', '月亮之上', '78', '2021-07-03 13:39:45', '<b><i>&nbsp; &nbsp; &nbsp; &nbsp;在这灯红酒绿的世界里，我想躲在一个安静的地方做一次深深的呼吸，但是城市的喧嚣一次次破坏了我的心境。我没敢说我恨城市，但我此刻却确确实实我想起了故乡，那个有人叫傅家沟亦或叫傅家湾的小山庄，因为那里有比大姑娘眼睛还要清澈的月亮。那月亮挂在树杈上，让人想起欧阳修的“月上柳梢头，人约黄昏后”的诗句来；挂在天河旁，让人勾起牛郎与织女缱绻的传说来；挂在云朵边，让人隐约闻到凤凰传奇那句：“生命已被牵引，潮落潮涨，有你的地方就是天堂……”来；月亮挂在窗口上，举头低头总能看到满世界都是可爱的影子，所以有那句：“举头望明月，低头思故乡……”\r\n					   </i></b>', '2', '1', '2', '2', '0', '0');
INSERT INTO `a_article` VALUES ('186', '朦雨', '79', '2021-07-04 09:17:59', '<div>一滴雨落在鞋带上，意识被唤醒了。</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　他被丢了过来，像个废弃的罐子，响声从木椅上传来，顺着地面渗入我的肌肤。</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　感到后背有些痒，然后是大腿。“嘶嘶——”如果我没有听错，有这种声音从后面发出，就像有一个红眼的恶魔蹲在草丛里，恰好在这时露出一部分似的。</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　它是在窥探我们吗？</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　我转过头，看着瘫倒在一旁的他，他的脸埋在手臂里，朝向倚背。染着灰色的头发像受惊的刺猬，让我有种不知所谓的感觉。推了推肩膀，对方松软的在半空中悬停了。</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　“嗯。”</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　我看着他，好像自己是一个疲惫的抬棺手。“我在这里休息。”我会点上一支烟，语气凝重的说出这句话。既是对着自己说的，也是对着众人说的。</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　他穿着一副褐色的风衣，质感已有些老旧了，搞得有一番残次品的味道。他在镜子前试穿这件衣服时，一定是面容平静、眼神死板，胡子像宝石般镶嵌在唇前与下巴，稍微看到些人的模样，便在店员的赞赏声中取钱付款。</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　你真的看仔细了？如果当时在场，我一定会这样质问。可话又说回来，即使当时不在场，或是在场又不说，又有什么关系呢？不过是一件衣服而已，动物也不会对自己的毛皮羞涩。</div><div><br></div><div>&nbsp;</div><div><br></div><div>　　雨逐渐下了起来，我接过后面递来的伞，撑到耳边。他的头稍带被遮住了，被浸湿的部分逐渐扩散，好像他被一根巨型针管刺入，正享受着比此刻还要深沉的东西。悬着的手流着雨水，顺着动脉汇入地面。</div>\r\n					   ', '0', '0', '0', '2', '0', '0');

-- ----------------------------
-- Table structure for `a_collection`
-- ----------------------------
DROP TABLE IF EXISTS `a_collection`;
CREATE TABLE `a_collection` (
  `collection_id` int NOT NULL AUTO_INCREMENT COMMENT '文章收藏表的id',
  `user_id` int NOT NULL COMMENT '进行收藏操作的用户',
  `article_id` int NOT NULL COMMENT '被收藏的文章id',
  PRIMARY KEY (`collection_id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  CONSTRAINT `a_collection_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of a_collection
-- ----------------------------
INSERT INTO `a_collection` VALUES ('35', '78', '184');
INSERT INTO `a_collection` VALUES ('36', '77', '185');
INSERT INTO `a_collection` VALUES ('37', '79', '185');

-- ----------------------------
-- Table structure for `a_comment`
-- ----------------------------
DROP TABLE IF EXISTS `a_comment`;
CREATE TABLE `a_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT COMMENT '文章评论表的id',
  `article_id` int NOT NULL COMMENT '被评论的文章的id',
  `user_id` int NOT NULL COMMENT '进行评论的用户id',
  `c_msg` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论的内容',
  `c_star` int NOT NULL DEFAULT '0' COMMENT '点赞数，默认为0',
  `c_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论的时间',
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `aricle_id` (`article_id`) USING BTREE,
  CONSTRAINT `a_comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of a_comment
-- ----------------------------
INSERT INTO `a_comment` VALUES ('166', '184', '77', '我写的怎么样？', '1', '2021-07-03 13:36:26');
INSERT INTO `a_comment` VALUES ('167', '184', '78', '太棒了', '1', '2021-07-03 13:41:23');
INSERT INTO `a_comment` VALUES ('168', '185', '79', '666666', '1', '2021-07-03 18:33:11');
INSERT INTO `a_comment` VALUES ('169', '185', '77', '优秀！', '1', '2021-07-04 09:14:48');

-- ----------------------------
-- Table structure for `a_reply`
-- ----------------------------
DROP TABLE IF EXISTS `a_reply`;
CREATE TABLE `a_reply` (
  `reply_id` int NOT NULL AUTO_INCREMENT COMMENT '对评论下进行回复的id',
  `comment_id` int NOT NULL COMMENT '被回复的评论id',
  `from_user_id` int NOT NULL COMMENT '发出回复的人的id值',
  `to_user_id` int NOT NULL COMMENT '接收回复的人的id值',
  `reply_msg` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复的内容',
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复的时间',
  `r_star` int NOT NULL DEFAULT '0' COMMENT '回复的点赞数',
  PRIMARY KEY (`reply_id`) USING BTREE,
  KEY `comment_id` (`comment_id`) USING BTREE,
  CONSTRAINT `a_reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `a_comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of a_reply
-- ----------------------------
INSERT INTO `a_reply` VALUES ('59', '166', '78', '77', '666', '2021-07-03 13:48:33', '0');

-- ----------------------------
-- Table structure for `a_share`
-- ----------------------------
DROP TABLE IF EXISTS `a_share`;
CREATE TABLE `a_share` (
  `share_id` int NOT NULL AUTO_INCREMENT COMMENT '转发文章表的id值',
  `user_id` int NOT NULL COMMENT '进行转发的用户名的id值',
  `article_id` int NOT NULL COMMENT '被转发的文章的id值',
  PRIMARY KEY (`share_id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  CONSTRAINT `a_share_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of a_share
-- ----------------------------
INSERT INTO `a_share` VALUES ('19', '77', '185');
INSERT INTO `a_share` VALUES ('20', '77', '184');

-- ----------------------------
-- Table structure for `a_star`
-- ----------------------------
DROP TABLE IF EXISTS `a_star`;
CREATE TABLE `a_star` (
  `star_id` int NOT NULL AUTO_INCREMENT COMMENT '点赞表的id',
  `type_id` int NOT NULL COMMENT '被点赞的对象id',
  `type` int NOT NULL COMMENT '被点赞的对象类型-1-文章 2-评论 3-回复',
  `user_id` int NOT NULL COMMENT '进行点赞的用户id',
  PRIMARY KEY (`star_id`) USING BTREE,
  KEY `a_star_ibfk_1` (`user_id`) USING BTREE,
  CONSTRAINT `a_star_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of a_star
-- ----------------------------
INSERT INTO `a_star` VALUES ('109', '181', '1', '77');
INSERT INTO `a_star` VALUES ('110', '184', '1', '77');
INSERT INTO `a_star` VALUES ('111', '184', '1', '78');
INSERT INTO `a_star` VALUES ('112', '185', '1', '77');
INSERT INTO `a_star` VALUES ('113', '185', '1', '79');
INSERT INTO `a_star` VALUES ('114', '184', '1', '79');
INSERT INTO `a_star` VALUES ('115', '168', '2', '77');
INSERT INTO `a_star` VALUES ('116', '186', '1', '79');
INSERT INTO `a_star` VALUES ('117', '167', '2', '79');
INSERT INTO `a_star` VALUES ('118', '166', '2', '79');
INSERT INTO `a_star` VALUES ('119', '186', '1', '78');
INSERT INTO `a_star` VALUES ('120', '169', '2', '79');

-- ----------------------------
-- Table structure for `a_tag`
-- ----------------------------
DROP TABLE IF EXISTS `a_tag`;
CREATE TABLE `a_tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT COMMENT '文章分类表的id值',
  `tag_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类名',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of a_tag
-- ----------------------------
INSERT INTO `a_tag` VALUES ('1', '无分组');
INSERT INTO `a_tag` VALUES ('2', '言论');
INSERT INTO `a_tag` VALUES ('3', '思想');
INSERT INTO `a_tag` VALUES ('4', '社会热点');
INSERT INTO `a_tag` VALUES ('5', '情感');
INSERT INTO `a_tag` VALUES ('6', '美食');
INSERT INTO `a_tag` VALUES ('7', '读书');
INSERT INTO `a_tag` VALUES ('8', '科技');
INSERT INTO `a_tag` VALUES ('9', '学习');
INSERT INTO `a_tag` VALUES ('10', 'NBA');
INSERT INTO `a_tag` VALUES ('11', '小明');
INSERT INTO `a_tag` VALUES ('12', '天文');
INSERT INTO `a_tag` VALUES ('13', '科学');
INSERT INTO `a_tag` VALUES ('14', '电影');
INSERT INTO `a_tag` VALUES ('15', '音乐');
INSERT INTO `a_tag` VALUES ('16', '其他');

-- ----------------------------
-- Table structure for `friend`
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `friend_id` int NOT NULL AUTO_INCREMENT COMMENT '好友的id值',
  `from_user_id` int NOT NULL COMMENT 'a用户名id（该记录的发出者）',
  `to_user_id` int NOT NULL COMMENT 'b用户名id（该记录的接收者）',
  `status` int NOT NULL DEFAULT '1' COMMENT '1->a关注b 2->ab为好友（双向关注）3->b被a拉黑',
  PRIMARY KEY (`friend_id`) USING BTREE,
  KEY `to_user_id` (`to_user_id`) USING BTREE,
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('232', '79', '78', '1');
INSERT INTO `friend` VALUES ('233', '78', '79', '1');
INSERT INTO `friend` VALUES ('235', '77', '79', '3');
INSERT INTO `friend` VALUES ('236', '79', '77', '1');
INSERT INTO `friend` VALUES ('237', '77', '78', '1');
INSERT INTO `friend` VALUES ('239', '78', '77', '1');

-- ----------------------------
-- Table structure for `privatemail`
-- ----------------------------
DROP TABLE IF EXISTS `privatemail`;
CREATE TABLE `privatemail` (
  `privatemail_id` int NOT NULL AUTO_INCREMENT COMMENT '璞嗛偖琛ㄧ殑id',
  `from_user_id` int NOT NULL COMMENT '发出豆邮的用户的id',
  `to_user_id` int NOT NULL COMMENT '接收豆邮的用户的id',
  `chat_msg` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '豆邮的内容',
  `chat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '聊天的时间',
  `status` int NOT NULL DEFAULT '0' COMMENT '记录删除状态，0为双方都没有删除，1为豆邮发出者删除，2为豆邮接收者删除',
  `read` int NOT NULL DEFAULT '0' COMMENT '0为未读状态，1为已读状态',
  PRIMARY KEY (`privatemail_id`) USING BTREE,
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  KEY `to_user_id` (`to_user_id`) USING BTREE,
  CONSTRAINT `privatemail_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privatemail_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of privatemail
-- ----------------------------
INSERT INTO `privatemail` VALUES ('121', '78', '77', 'Hello!', '2021-07-03 13:39:00', '0', '0');
INSERT INTO `privatemail` VALUES ('122', '77', '78', 'Hi!', '2021-07-03 13:42:17', '0', '0');
INSERT INTO `privatemail` VALUES ('123', '79', '78', '你好！', '2021-07-03 15:34:15', '0', '0');
INSERT INTO `privatemail` VALUES ('124', '78', '79', '你好鸭！', '2021-07-03 19:34:37', '0', '0');
INSERT INTO `privatemail` VALUES ('125', '79', '78', 'hahaha', '2021-07-04 11:24:23', '0', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户名的id',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名（通常为邮箱）',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码（MD5）',
  `gender` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '用户的权限（0为普通用户，1为管理员）',
  `title_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '封号截止时间',
  `portrait` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'http://47.102.212.18/DouBan/image/default.png' COMMENT '用户头像（存储路径）',
  `signature` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个性签名',
  `self_introduction` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '自我介绍',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '某某' COMMENT '昵称',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户地址',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('77', 'wbrsnda', 'D4E78D65132E7417ED670A78930E5F38', 'male', '1306688142@qq.com', '13868609528', '0', '2021-07-03 13:24:36', '/image/202107031325127553.jpg', '我就是太阳！', '我就是太阳！', 'wbr', '浙江XXXXXX', '2021-07-03 13:24:36');
INSERT INTO `user` VALUES ('78', 'chris', 'D4E78D65132E7417ED670A78930E5F38', 'male', '123666666@qq.com', '13888888888', '0', '2021-07-03 13:37:26', '/image/202107031338228503.jpg', 'hahahahaha', 'hahahahaha', 'chris', 'japan', '2021-07-03 13:37:26');
INSERT INTO `user` VALUES ('79', 'PAUL', '94A3B1FD44BE2CE173A0B15BF19412C5', 'male', '123666667@qq.com', '13868605963', '0', '2021-07-03 15:27:30', '/image/202107031533406241.jpg', 'llllaaa', 'lllllllaaa', 'paul', 'xxxxxx', '2021-07-03 15:27:30');
