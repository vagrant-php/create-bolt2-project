/*
 Navicat Premium Data Transfer

 Source Server         : bolt.dev
 Source Server Type    : MariaDB
 Source Server Version : 100021
 Source Host           : localhost
 Source Database       : bolt

 Target Server Type    : MariaDB
 Target Server Version : 100021
 File Encoding         : utf-8

 Date: 10/29/2015 22:13:04 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `bolt_authtoken`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_authtoken`;
CREATE TABLE `bolt_authtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `lastseen` datetime DEFAULT NULL,
  `ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `useragent` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `validity` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_740AC52FF85E0677` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_cron`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_cron`;
CREATE TABLE `bolt_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interim` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `lastrun` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD38E123615F8869` (`interim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_entries`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_entries`;
CREATE TABLE `bolt_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `datecreated` datetime NOT NULL,
  `datechanged` datetime NOT NULL,
  `datepublish` datetime DEFAULT NULL,
  `datedepublish` datetime DEFAULT NULL,
  `templatefields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  `ownerid` int(11) DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `teaser` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci NOT NULL,
  `video` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2696ADF0989D9B62` (`slug`),
  KEY `IDX_2696ADF0AFBA6FD8` (`datecreated`),
  KEY `IDX_2696ADF0BE74E59A` (`datechanged`),
  KEY `IDX_2696ADF0A5131421` (`datepublish`),
  KEY `IDX_2696ADF0B7805520` (`datedepublish`),
  KEY `IDX_2696ADF07B00651C` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_log_change`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_log_change`;
CREATE TABLE `bolt_log_change` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ownerid` int(11) DEFAULT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contenttype` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `contentid` int(11) NOT NULL,
  `mutation_type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `diff` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(150) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `IDX_946F972AA9E377A` (`date`),
  KEY `IDX_946F97275DAD987` (`ownerid`),
  KEY `IDX_946F972745E1826` (`contenttype`),
  KEY `IDX_946F972E625AE99` (`contentid`),
  KEY `IDX_946F972B0AEEF39` (`mutation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_log_system`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_log_system`;
CREATE TABLE `bolt_log_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `ownerid` int(11) DEFAULT NULL,
  `requesturi` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `source` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_805C16D99AEACC13` (`level`),
  KEY `IDX_805C16D9AA9E377A` (`date`),
  KEY `IDX_805C16D975DAD987` (`ownerid`),
  KEY `IDX_805C16D9E25D857E` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `bolt_log_system`
-- ----------------------------
BEGIN;
INSERT INTO `bolt_log_system` VALUES ('1', '200', '2015-10-29 22:12:09', 'Added user account \'Administrator\'.', '0', '/bolt/userfirst', 'userfirst', '172.28.128.1', 'security', '{\"file\":\"src\\/Controllers\\/Backend.php\",\"line\":1423}');
COMMIT;

-- ----------------------------
--  Table structure for `bolt_pages`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_pages`;
CREATE TABLE `bolt_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `datecreated` datetime NOT NULL,
  `datechanged` datetime NOT NULL,
  `datepublish` datetime DEFAULT NULL,
  `datedepublish` datetime DEFAULT NULL,
  `templatefields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  `ownerid` int(11) DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teaser` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `IDX_31AF1BC8989D9B62` (`slug`),
  KEY `IDX_31AF1BC8AFBA6FD8` (`datecreated`),
  KEY `IDX_31AF1BC8BE74E59A` (`datechanged`),
  KEY `IDX_31AF1BC8A5131421` (`datepublish`),
  KEY `IDX_31AF1BC8B7805520` (`datedepublish`),
  KEY `IDX_31AF1BC87B00651C` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_relations`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_relations`;
CREATE TABLE `bolt_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_contenttype` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_contenttype` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `to_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C524BC3EA112943` (`from_contenttype`),
  KEY `IDX_4C524BC378CED90B` (`from_id`),
  KEY `IDX_4C524BC35ACD2645` (`to_contenttype`),
  KEY `IDX_4C524BC330354A65` (`to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_showcases`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_showcases`;
CREATE TABLE `bolt_showcases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `datecreated` datetime NOT NULL,
  `datechanged` datetime NOT NULL,
  `datepublish` datetime DEFAULT NULL,
  `datedepublish` datetime DEFAULT NULL,
  `templatefields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  `ownerid` int(11) DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `html` longtext COLLATE utf8_unicode_ci NOT NULL,
  `textarea` longtext COLLATE utf8_unicode_ci NOT NULL,
  `markdown` longtext COLLATE utf8_unicode_ci NOT NULL,
  `geolocation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `video` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci NOT NULL,
  `imagelist` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filelist` longtext COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checkbox` tinyint(1) NOT NULL DEFAULT '0',
  `datetime` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `integerfield` int(11) NOT NULL DEFAULT '0',
  `floatfield` double NOT NULL DEFAULT '0',
  `selectfield` longtext COLLATE utf8_unicode_ci NOT NULL,
  `multiselect` longtext COLLATE utf8_unicode_ci NOT NULL,
  `selectentry` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C5F751E8989D9B62` (`slug`),
  KEY `IDX_C5F751E8AFBA6FD8` (`datecreated`),
  KEY `IDX_C5F751E8BE74E59A` (`datechanged`),
  KEY `IDX_C5F751E8A5131421` (`datepublish`),
  KEY `IDX_C5F751E8B7805520` (`datedepublish`),
  KEY `IDX_C5F751E87B00651C` (`status`),
  KEY `IDX_C5F751E8FD4718AE` (`integerfield`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_taxonomy`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_taxonomy`;
CREATE TABLE `bolt_taxonomy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `contenttype` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `taxonomytype` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_ABAA120084A0A3ED` (`content_id`),
  KEY `IDX_ABAA1200745E1826` (`contenttype`),
  KEY `IDX_ABAA1200FE2A268F` (`taxonomytype`),
  KEY `IDX_ABAA1200FEA3B3F9` (`sortorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `bolt_users`
-- ----------------------------
DROP TABLE IF EXISTS `bolt_users`;
CREATE TABLE `bolt_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `lastseen` datetime DEFAULT NULL,
  `lastip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `displayname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `stack` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `shadowpassword` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shadowtoken` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shadowvalidity` datetime DEFAULT NULL,
  `failedlogins` int(11) NOT NULL DEFAULT '0',
  `throttleduntil` datetime DEFAULT NULL,
  `roles` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5585B54F85E0677` (`username`),
  UNIQUE KEY `UNIQ_5585B54E7927C74` (`email`),
  KEY `IDX_5585B5450F9BB84` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `bolt_users`
-- ----------------------------
BEGIN;
INSERT INTO `bolt_users` VALUES ('1', 'admin', '$P$DmWN0UQ7rDoFsQ1NXwZ.Q6/Cawtl64.', 'admin@admin.admin', null, '', 'Administrator', '[]', '1', '', '', null, '0', null, '[\"root\"]');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
