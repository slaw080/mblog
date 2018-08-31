/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysqlserver
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : db_mblog

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-08-30 16:13:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mto_channels
-- ----------------------------
DROP TABLE IF EXISTS `mto_channels`;
CREATE TABLE `mto_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2s863lts1h6m7c30152262cvj` (`key_`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_channels
-- ----------------------------
INSERT INTO `mto_channels` VALUES ('1', 'banner', 'banner', '1');
INSERT INTO `mto_channels` VALUES ('2', 'blog', '博客', '0');
INSERT INTO `mto_channels` VALUES ('3', 'questions', '问答', '0');
INSERT INTO `mto_channels` VALUES ('4', 'share', '分享', '0');

-- ----------------------------
-- Table structure for mto_comments
-- ----------------------------
DROP TABLE IF EXISTS `mto_comments`;
CREATE TABLE `mto_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_comments
-- ----------------------------

-- ----------------------------
-- Table structure for mto_config
-- ----------------------------
DROP TABLE IF EXISTS `mto_config`;
CREATE TABLE `mto_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_99vo6d7ci4wlxruo3gd0q2jq8` (`key_`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_config
-- ----------------------------
INSERT INTO `mto_config` VALUES ('1', 'site_name', '0', 'Bjgoodwill');
INSERT INTO `mto_config` VALUES ('3', 'site_domain', '0', '');
INSERT INTO `mto_config` VALUES ('4', 'site_keywords', '0', '问答,博客,社区');
INSERT INTO `mto_config` VALUES ('5', 'site_description', '0', '一个有内涵的技术社区');
INSERT INTO `mto_config` VALUES ('6', 'site_metas', '0', '');
INSERT INTO `mto_config` VALUES ('7', 'site_copyright', '0', 'Copyright © Bjgoodwill');
INSERT INTO `mto_config` VALUES ('8', 'site_icp', '0', '');
INSERT INTO `mto_config` VALUES ('11', 'site_oauth_qq', '0', '');
INSERT INTO `mto_config` VALUES ('12', 'qq_app_id', '0', '');
INSERT INTO `mto_config` VALUES ('13', 'qq_app_key', '0', '');
INSERT INTO `mto_config` VALUES ('14', 'site_oauth_weibo', '0', '');
INSERT INTO `mto_config` VALUES ('15', 'weibo_client_id', '0', '');
INSERT INTO `mto_config` VALUES ('16', 'weibo_client_sercret', '0', '');

-- ----------------------------
-- Table structure for mto_favors
-- ----------------------------
DROP TABLE IF EXISTS `mto_favors`;
CREATE TABLE `mto_favors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `own_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_favors
-- ----------------------------
INSERT INTO `mto_favors` VALUES ('1', '2018-08-30 14:59:48', '1', '3');

-- ----------------------------
-- Table structure for mto_feeds
-- ----------------------------
DROP TABLE IF EXISTS `mto_feeds`;
CREATE TABLE `mto_feeds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `own_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_feeds
-- ----------------------------

-- ----------------------------
-- Table structure for mto_follows
-- ----------------------------
DROP TABLE IF EXISTS `mto_follows`;
CREATE TABLE `mto_follows` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `follow_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlbcc3hcj1cikyow8cvlk1eupe` (`follow_id`),
  KEY `FKso66aluvvri4r5a5x3lh31t8s` (`user_id`),
  CONSTRAINT `FKlbcc3hcj1cikyow8cvlk1eupe` FOREIGN KEY (`follow_id`) REFERENCES `mto_users` (`id`),
  CONSTRAINT `FKso66aluvvri4r5a5x3lh31t8s` FOREIGN KEY (`user_id`) REFERENCES `mto_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_follows
-- ----------------------------

-- ----------------------------
-- Table structure for mto_notify
-- ----------------------------
DROP TABLE IF EXISTS `mto_notify`;
CREATE TABLE `mto_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `event` int(11) NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `own_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_notify
-- ----------------------------
INSERT INTO `mto_notify` VALUES ('1', '2018-08-30 14:59:48', '1', '1', '1', '3', '1');

-- ----------------------------
-- Table structure for mto_posts
-- ----------------------------
DROP TABLE IF EXISTS `mto_posts`;
CREATE TABLE `mto_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `favors` int(11) NOT NULL,
  `featured` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_posts
-- ----------------------------

-- ----------------------------
-- Table structure for mto_posts_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mto_posts_attribute`;
CREATE TABLE `mto_posts_attribute` (
  `id` bigint(20) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_posts_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for mto_users
-- ----------------------------
DROP TABLE IF EXISTS `mto_users`;
CREATE TABLE `mto_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT '/assets/images/ava/default.png',
  `updated` datetime DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `source` int(11) NOT NULL,
  `active_email` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `fans` int(11) NOT NULL,
  `favors` int(11) NOT NULL,
  `follows` int(11) NOT NULL,
  `posts` int(11) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_users
-- ----------------------------
INSERT INTO `mto_users` VALUES ('1', '2017-08-06 17:52:41', 'example@mtons.com', '2018-08-30 16:12:41', null, '3TGCQF25BLHU9R7IQUITN0FCC5', '0', 'admin', '小豆丁', '/store/ava/000/00/00/01_100.jpg', '2017-07-26 11:08:36', '0', '1', '0', '0', '6', '-2', '0', '-2', '19', '');
INSERT INTO `mto_users` VALUES ('2', '2018-08-30 15:47:28', 'slaw080@163.com', '2018-08-30 16:10:34', null, '3931MUEQD1939MQMLM4AISPVNE', '0', 'slaw080', 'asdf', '/dist/images/ava/default.png', null, '0', null, '0', '0', '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for mto_users_open_oauth
-- ----------------------------
DROP TABLE IF EXISTS `mto_users_open_oauth`;
CREATE TABLE `mto_users_open_oauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) DEFAULT NULL,
  `expire_in` varchar(255) DEFAULT NULL,
  `oauth_code` varchar(255) DEFAULT NULL,
  `oauth_type` int(11) DEFAULT NULL,
  `oauth_user_id` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_users_open_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for mto_verify
-- ----------------------------
DROP TABLE IF EXISTS `mto_verify`;
CREATE TABLE `mto_verify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(60) NOT NULL,
  `created` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  `target` varchar(96) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_m7p0b526c4xlgjn787t22om2g` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_verify
-- ----------------------------
INSERT INTO `mto_verify` VALUES ('1', '5169654358', '2018-08-30 15:52:29', '2018-08-30 16:22:29', '0', 'slaw080@163.com', null, '1', '2');

-- ----------------------------
-- Table structure for shiro_permission
-- ----------------------------
DROP TABLE IF EXISTS `shiro_permission`;
CREATE TABLE `shiro_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_89ve8ffuihnryt1nw4o2t1feu` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_permission
-- ----------------------------
INSERT INTO `shiro_permission` VALUES ('1', '进入后台', 'admin', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('2', '栏目管理', 'channel:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('3', '编辑栏目', 'channel:update', '2', '0', '0');
INSERT INTO `shiro_permission` VALUES ('4', '删除栏目', 'channel:delete', '2', '0', '0');
INSERT INTO `shiro_permission` VALUES ('5', '文章管理', 'post:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('6', '编辑文章', 'post:update', '5', '0', '0');
INSERT INTO `shiro_permission` VALUES ('7', '删除文章', 'post:delete', '5', '0', '0');
INSERT INTO `shiro_permission` VALUES ('8', '评论管理', 'comment:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('10', '删除评论', 'comment:delete', '8', '0', '0');
INSERT INTO `shiro_permission` VALUES ('11', '用户管理', 'user:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('12', '用户授权', 'user:role', '11', '0', '0');
INSERT INTO `shiro_permission` VALUES ('13', '修改密码', 'user:pwd', '11', '0', '0');
INSERT INTO `shiro_permission` VALUES ('14', '激活用户', 'user:open', '11', '0', '0');
INSERT INTO `shiro_permission` VALUES ('15', '关闭用户', 'user:close', '11', '0', '0');
INSERT INTO `shiro_permission` VALUES ('16', '角色管理', 'role:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('17', '修改角色', 'role:update', '16', '0', '0');
INSERT INTO `shiro_permission` VALUES ('18', '删除角色', 'role:delete', '16', '0', '0');
INSERT INTO `shiro_permission` VALUES ('19', '系统配置', 'config:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('20', '修改配置', 'config:update', '19', '0', '0');

-- ----------------------------
-- Table structure for shiro_role
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role`;
CREATE TABLE `shiro_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role
-- ----------------------------
INSERT INTO `shiro_role` VALUES ('1', null, 'admin', '0');

-- ----------------------------
-- Table structure for shiro_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role_permission`;
CREATE TABLE `shiro_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role_permission
-- ----------------------------
INSERT INTO `shiro_role_permission` VALUES ('1', '10', '1');
INSERT INTO `shiro_role_permission` VALUES ('2', '4', '1');
INSERT INTO `shiro_role_permission` VALUES ('3', '16', '1');
INSERT INTO `shiro_role_permission` VALUES ('4', '1', '1');
INSERT INTO `shiro_role_permission` VALUES ('5', '14', '1');
INSERT INTO `shiro_role_permission` VALUES ('6', '17', '1');
INSERT INTO `shiro_role_permission` VALUES ('7', '3', '1');
INSERT INTO `shiro_role_permission` VALUES ('8', '12', '1');
INSERT INTO `shiro_role_permission` VALUES ('9', '6', '1');
INSERT INTO `shiro_role_permission` VALUES ('10', '2', '1');
INSERT INTO `shiro_role_permission` VALUES ('11', '5', '1');
INSERT INTO `shiro_role_permission` VALUES ('12', '18', '1');
INSERT INTO `shiro_role_permission` VALUES ('13', '15', '1');
INSERT INTO `shiro_role_permission` VALUES ('14', '19', '1');
INSERT INTO `shiro_role_permission` VALUES ('15', '13', '1');
INSERT INTO `shiro_role_permission` VALUES ('16', '7', '1');
INSERT INTO `shiro_role_permission` VALUES ('17', '20', '1');
INSERT INTO `shiro_role_permission` VALUES ('18', '8', '1');
INSERT INTO `shiro_role_permission` VALUES ('19', '11', '1');

-- ----------------------------
-- Table structure for shiro_user_role
-- ----------------------------
DROP TABLE IF EXISTS `shiro_user_role`;
CREATE TABLE `shiro_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_user_role
-- ----------------------------
INSERT INTO `shiro_user_role` VALUES ('1', '1', '1');
