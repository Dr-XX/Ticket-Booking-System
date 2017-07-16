/*
 Navicat Premium Data Transfer

 Source Server         : ticket
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : 118.89.107.154
 Source Database       : kingsTicket

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 06/20/2017 15:16:01 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_permission`
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add group', '2', 'add_group'), ('5', 'Can change group', '2', 'change_group'), ('6', 'Can delete group', '2', 'delete_group'), ('7', 'Can add permission', '3', 'add_permission'), ('8', 'Can change permission', '3', 'change_permission'), ('9', 'Can delete permission', '3', 'delete_permission'), ('10', 'Can add user', '4', 'add_user'), ('11', 'Can change user', '4', 'change_user'), ('12', 'Can delete user', '4', 'delete_user'), ('13', 'Can add content type', '5', 'add_contenttype'), ('14', 'Can change content type', '5', 'change_contenttype'), ('15', 'Can delete content type', '5', 'delete_contenttype'), ('16', 'Can add session', '6', 'add_session'), ('17', 'Can change session', '6', 'change_session'), ('18', 'Can delete session', '6', 'delete_session'), ('19', 'Can add site', '7', 'add_site'), ('20', 'Can change site', '7', 'change_site'), ('21', 'Can delete site', '7', 'delete_site'), ('22', 'Can add seat', '8', 'add_seat'), ('23', 'Can change seat', '8', 'change_seat'), ('24', 'Can delete seat', '8', 'delete_seat'), ('25', 'Can add user', '9', 'add_user'), ('26', 'Can change user', '9', 'change_user'), ('27', 'Can delete user', '9', 'delete_user'), ('28', 'Can add line', '10', 'add_line'), ('29', 'Can change line', '10', 'change_line'), ('30', 'Can delete line', '10', 'delete_line'), ('31', 'Can add order', '11', 'add_order'), ('32', 'Can change order', '11', 'change_order'), ('33', 'Can delete order', '11', 'delete_order'), ('34', 'Can add route', '12', 'add_route'), ('35', 'Can change route', '12', 'change_route'), ('36', 'Can delete route', '12', 'delete_route'), ('37', 'Can add ticket', '13', 'add_ticket'), ('38', 'Can change ticket', '13', 'change_ticket'), ('39', 'Can delete ticket', '13', 'delete_ticket'), ('40', 'Can add though', '14', 'add_though'), ('41', 'Can change though', '14', 'change_though'), ('42', 'Can delete though', '14', 'delete_though'), ('43', 'Can add station', '15', 'add_station'), ('44', 'Can change station', '15', 'change_station'), ('45', 'Can delete station', '15', 'delete_station');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_user`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$BTHn7Ie6FFEp$tEBVWeez4I1ZRvTt//xdteh5GUodcSnTq+gtzwdy6rk=', null, '1', 'admin', '', '', 'cww970329@qq.com', '1', '1', '2017-06-17 04:06:02.970990');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('2', 'auth', 'group'), ('3', 'auth', 'permission'), ('4', 'auth', 'user'), ('5', 'contenttypes', 'contenttype'), ('6', 'sessions', 'session'), ('7', 'sites', 'site'), ('10', 'ticket', 'line'), ('11', 'ticket', 'order'), ('12', 'ticket', 'route'), ('8', 'ticket', 'seat'), ('15', 'ticket', 'station'), ('14', 'ticket', 'though'), ('13', 'ticket', 'ticket'), ('9', 'ticket', 'user');
COMMIT;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_migrations`
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-06-12 14:31:40.114926'), ('2', 'auth', '0001_initial', '2017-06-12 14:31:40.739320'), ('3', 'admin', '0001_initial', '2017-06-12 14:31:40.903795'), ('4', 'admin', '0002_logentry_remove_auto_add', '2017-06-12 14:31:40.969610'), ('5', 'contenttypes', '0002_remove_content_type_name', '2017-06-12 14:31:41.102861'), ('6', 'auth', '0002_alter_permission_name_max_length', '2017-06-12 14:31:41.183493'), ('7', 'auth', '0003_alter_user_email_max_length', '2017-06-12 14:31:41.268153'), ('8', 'auth', '0004_alter_user_username_opts', '2017-06-12 14:31:41.311214'), ('9', 'auth', '0005_alter_user_last_login_null', '2017-06-12 14:31:41.388306'), ('10', 'auth', '0006_require_contenttypes_0002', '2017-06-12 14:31:41.419265'), ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-06-12 14:31:41.479369'), ('12', 'auth', '0008_alter_user_username_max_length', '2017-06-12 14:31:41.616752'), ('13', 'sessions', '0001_initial', '2017-06-12 14:31:41.692233'), ('14', 'sites', '0001_initial', '2017-06-12 14:31:41.754661'), ('15', 'sites', '0002_alter_domain_unique', '2017-06-12 14:31:41.800445'), ('16', 'ticket', '0001_initial', '2017-06-12 14:31:42.757676');
COMMIT;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_session`
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('0lvsycy3n6rarlqd2k9v9ma8mi3zkp9j', 'OGNiZjBlNjU1YWFkYTRkMTVkZWM2YzE5NGFhOGJhYmMxNzQ3M2EyZTp7InVzZXJuYW1lIjoiam9yZGFuIiwiY2FyIjpbMl0sInByaWNlIjpbMTM0XSwiaXNTdHVzIjpbMF0sImlkMiI6IjQiLCJJRHMiOlsiNTQ1NDE2NTEiXSwiaW5wdXRlbWFpbCI6ImpvcmRhbjA4MDFAMTYzLmNvbSIsImlkMSI6IjEiLCJsaW5lX2lkIjoiMiIsImxlbnRoIjoxLCJuYW1lcyI6WyJcdTRlNTRcdTRlMzkiXSwiaXNMZXZlbDEiOlswXX0=', '2017-07-04 06:45:31.000000'), ('434omyzzp6p9fxe1b1xcj4dne575jz9j', 'ZmUyN2MxMjBjNWQ3OTI5NjljMTNkODE4YzUxMjkyYzY5N2U3OTRiODp7InVzZXJuYW1lIjoiam9yZGFuIiwiY2FyIjpbMl0sInByaWNlIjpbNTUzXSwiaXNTdHVzIjpbMF0sImlkMiI6IjkiLCJJRHMiOlsiNDE2NTE2NTE2Il0sImlucHV0ZW1haWwiOiJqb3JkYW4wODAxQDE2My5jb20iLCJpZDEiOiIxIiwibGluZV9pZCI6IjEiLCJsZW50aCI6MSwibmFtZXMiOlsiXHU0ZTU0XHU0ZTM5Il0sImlzTGV2ZWwxIjpbMF19', '2017-07-04 04:02:00.000000'), ('8acvrmc5mc8v8lbkbcxgvpfuckk6mhp0', 'YmY4YTVkMGU0NGIzMDBkMDY2YTk5NjFiNmU3M2VjZDEzNWIwZmUyMzp7InVzZXJuYW1lIjoiY3d3OTciLCJjYXIiOlsyLDFdLCJwcmljZSI6WzQxNC43NSw4MjkuNV0sImlzU3R1cyI6WzEsMF0sImlkMiI6IjkiLCJJRHMiOlsiMzQ2MzQ2MzQ1NiIsIjM0NTc1Njg2Nzg0NTM0MzQiXSwiaW5wdXRlbWFpbCI6ImN3dzk3MDMyOUBxcS5jb20iLCJpZDEiOiIxIiwibGluZV9pZCI6IjMiLCJsZW50aCI6MiwibmFtZXMiOlsiXHU1YzA2XHU1MzYxXHU2YzM0XHU2ZGMwXHU3Yzg5IiwiXHU3Njg0XHU5YWQ4XHU2ZTI5XHU3MGVkIl0sImlzTGV2ZWwxIjpbMCwxXX0=', '2017-07-03 15:53:03.034774');
COMMIT;

-- ----------------------------
--  Table structure for `django_site`
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_site`
-- ----------------------------
BEGIN;
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_line`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_line`;
CREATE TABLE `ticket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_line`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_line` VALUES ('1', 'G106', '9'), ('2', 'G102', '9'), ('3', 'G14', '4'), ('4', 'G6', '4'), ('5', 'G2', '3'), ('6', 'G8', '3');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_order`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_order`;
CREATE TABLE `ticket_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_order`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_order` VALUES ('1', '11:13:41.348000', '0'), ('2', '11:33:30.224000', '0'), ('3', '12:13:23.967000', '0'), ('4', '12:16:08.972000', '0'), ('5', '12:16:17.727000', '0'), ('6', '12:18:02.295000', '0'), ('7', '12:19:17.553000', '0'), ('8', '12:20:09.067000', '0'), ('9', '12:24:21.771000', '0'), ('10', '12:26:11.850000', '0'), ('11', '12:26:51.603000', '0'), ('12', '12:29:19.215000', '0'), ('13', '12:29:52.145000', '0'), ('14', '12:32:06.203000', '0'), ('15', '12:32:37.074000', '0'), ('16', '12:33:12.444000', '0'), ('17', '12:33:43.334000', '0'), ('18', '12:34:26.394000', '0'), ('19', '12:34:53.955000', '0'), ('20', '12:36:44.432000', '0'), ('21', '12:37:23.368000', '0'), ('22', '12:37:42.903000', '0'), ('23', '12:51:56.356000', '0'), ('24', '12:53:05.664000', '0'), ('25', '12:53:24.828000', '0'), ('26', '12:55:10.543000', '0'), ('27', '13:00:44.077000', '0'), ('28', '14:44:09.253000', '0'), ('29', '14:45:33.181000', '0');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_order_user_id`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_order_user_id`;
CREATE TABLE `ticket_order_user_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_order_user_id_order_id_user_id_2db30d4b_uniq` (`order_id`,`user_id`),
  KEY `ticket_order_user_id_user_id_715f4849_fk_ticket_user_id` (`user_id`),
  CONSTRAINT `ticket_order_user_id_order_id_255b0641_fk_ticket_order_id` FOREIGN KEY (`order_id`) REFERENCES `ticket_order` (`id`),
  CONSTRAINT `ticket_order_user_id_user_id_715f4849_fk_ticket_user_id` FOREIGN KEY (`user_id`) REFERENCES `ticket_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_order_user_id`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_order_user_id` VALUES ('1', '2', '1'), ('2', '3', '1'), ('3', '4', '1'), ('4', '5', '1'), ('5', '6', '1'), ('6', '7', '1'), ('7', '8', '1'), ('8', '9', '1'), ('9', '10', '1'), ('10', '11', '1'), ('11', '12', '1'), ('12', '13', '1'), ('13', '14', '1'), ('14', '15', '1'), ('15', '16', '1'), ('16', '17', '1'), ('17', '18', '1'), ('18', '19', '1'), ('19', '20', '1'), ('20', '21', '1'), ('21', '22', '1'), ('22', '23', '1'), ('23', '24', '1'), ('24', '25', '1'), ('25', '26', '1'), ('26', '27', '1'), ('27', '28', '1'), ('28', '29', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_route`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_route`;
CREATE TABLE `ticket_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `departure_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_route_departure_id_id_954ef037_fk_ticket_station_id` (`departure_id`),
  KEY `ticket_route_destination_id_id_7ea997fa_fk_ticket_station_id` (`destination_id`),
  CONSTRAINT `ticket_route_departure_id_id_954ef037_fk_ticket_station_id` FOREIGN KEY (`departure_id`) REFERENCES `ticket_station` (`id`),
  CONSTRAINT `ticket_route_destination_id_id_7ea997fa_fk_ticket_station_id` FOREIGN KEY (`destination_id`) REFERENCES `ticket_station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_route`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_route` VALUES ('1', '34.5', '1', '2'), ('2', '104.5', '1', '3'), ('3', '70', '2', '3'), ('4', '134.5', '1', '4'), ('5', '100', '2', '4'), ('6', '30', '3', '4'), ('7', '279', '1', '5'), ('8', '244.5', '2', '5'), ('9', '174.5', '3', '5'), ('10', '144.5', '4', '5'), ('11', '374', '1', '6'), ('12', '339.5', '2', '6'), ('13', '269.5', '3', '6'), ('14', '239.5', '4', '6'), ('15', '95', '5', '6'), ('16', '398.5', '1', '7'), ('17', '364', '2', '7'), ('18', '294', '3', '7'), ('19', '264', '4', '7'), ('20', '119.5', '5', '7'), ('21', '24.5', '6', '7'), ('22', '508.5', '1', '8'), ('23', '474', '2', '8'), ('24', '404', '3', '8'), ('25', '374', '4', '8'), ('26', '229.5', '5', '8'), ('27', '134.5', '6', '8'), ('28', '110', '7', '8'), ('29', '553', '1', '9'), ('30', '518.5', '2', '9'), ('31', '448.5', '3', '9'), ('32', '418.5', '4', '9'), ('33', '274', '5', '9'), ('34', '179', '6', '9'), ('35', '154.5', '7', '9'), ('36', '44.5', '8', '9'), ('37', '74.5', '1', '10'), ('38', '40', '2', '10'), ('39', '60', '10', '4'), ('40', '254', '1', '11'), ('41', '219.5', '2', '11'), ('42', '179.5', '10', '11'), ('43', '119.5', '4', '11'), ('44', '309', '1', '12'), ('45', '274.5', '2', '12'), ('46', '234.5', '10', '12'), ('47', '174.5', '4', '12'), ('48', '55', '11', '12'), ('49', '324', '10', '7'), ('50', '144.5', '11', '7'), ('51', '89.5', '12', '7'), ('52', '434', '10', '8'), ('53', '254.5', '11', '8'), ('54', '199.5', '12', '8'), ('55', '478.5', '10', '9'), ('56', '299', '11', '9'), ('57', '244', '12', '9');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_seat`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_seat`;
CREATE TABLE `ticket_seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` smallint(6) NOT NULL,
  `car` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_seat_line_id_id_ab475d46_fk_ticket_line_id` (`line_id`),
  CONSTRAINT `ticket_seat_line_id_id_ab475d46_fk_ticket_line_id` FOREIGN KEY (`line_id`) REFERENCES `ticket_line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1421 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_seat`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_seat` VALUES ('1', '1', '1', '1', '0', '1'), ('2', '1', '1', '2', '0', '1'), ('3', '1', '1', '3', '0', '1'), ('4', '1', '1', '4', '0', '1'), ('5', '1', '1', '5', '0', '1'), ('6', '1', '1', '6', '0', '1'), ('7', '1', '1', '7', '0', '1'), ('8', '1', '1', '8', '0', '1'), ('9', '1', '1', '9', '0', '1'), ('10', '1', '1', '10', '0', '1'), ('11', '1', '1', '11', '0', '1'), ('12', '1', '1', '12', '0', '1'), ('13', '1', '1', '13', '0', '1'), ('14', '1', '1', '14', '0', '1'), ('15', '1', '1', '15', '0', '1'), ('16', '1', '1', '16', '0', '1'), ('17', '1', '1', '17', '0', '1'), ('18', '1', '1', '18', '0', '1'), ('19', '1', '1', '19', '0', '1'), ('20', '1', '1', '20', '511', '1'), ('21', '2', '2', '1', '0', '1'), ('22', '2', '2', '2', '0', '1'), ('23', '2', '2', '3', '0', '1'), ('24', '2', '2', '4', '0', '1'), ('25', '2', '2', '5', '0', '1'), ('26', '2', '2', '6', '0', '1'), ('27', '2', '2', '7', '0', '1'), ('28', '2', '2', '8', '0', '1'), ('29', '2', '2', '9', '0', '1'), ('30', '2', '2', '10', '0', '1'), ('31', '2', '2', '11', '0', '1'), ('32', '2', '2', '12', '0', '1'), ('33', '2', '2', '13', '0', '1'), ('34', '2', '2', '14', '0', '1'), ('35', '2', '2', '15', '0', '1'), ('36', '2', '2', '16', '0', '1'), ('37', '2', '2', '17', '0', '1'), ('38', '2', '2', '18', '0', '1'), ('39', '2', '2', '19', '0', '1'), ('40', '2', '2', '20', '0', '1'), ('41', '2', '2', '21', '511', '1'), ('42', '2', '2', '22', '0', '1'), ('43', '2', '2', '23', '0', '1'), ('44', '2', '2', '24', '0', '1'), ('45', '2', '2', '25', '0', '1'), ('46', '2', '2', '26', '0', '1'), ('47', '2', '2', '27', '0', '1'), ('48', '2', '2', '28', '0', '1'), ('49', '2', '2', '29', '0', '1'), ('50', '2', '2', '30', '0', '1'), ('51', '2', '2', '31', '0', '1'), ('52', '2', '2', '32', '0', '1'), ('53', '2', '2', '33', '0', '1'), ('54', '2', '2', '34', '0', '1'), ('55', '2', '2', '35', '0', '1'), ('56', '2', '2', '36', '0', '1'), ('57', '2', '2', '37', '0', '1'), ('58', '2', '2', '38', '0', '1'), ('59', '2', '2', '39', '0', '1'), ('60', '2', '2', '40', '0', '1'), ('61', '2', '2', '41', '0', '1'), ('62', '2', '2', '42', '0', '1'), ('63', '2', '2', '43', '0', '1'), ('64', '2', '2', '44', '0', '1'), ('65', '2', '2', '45', '0', '1'), ('66', '2', '2', '46', '0', '1'), ('67', '2', '2', '47', '0', '1'), ('68', '2', '2', '48', '0', '1'), ('69', '2', '2', '49', '0', '1'), ('70', '2', '2', '50', '0', '1'), ('71', '1', '1', '1', '0', '2'), ('72', '1', '1', '2', '0', '2'), ('73', '1', '1', '3', '0', '2'), ('74', '1', '1', '4', '0', '2'), ('75', '1', '1', '5', '0', '2'), ('76', '1', '1', '6', '0', '2'), ('77', '1', '1', '7', '0', '2'), ('78', '1', '1', '8', '0', '2'), ('79', '1', '1', '9', '0', '2'), ('80', '1', '1', '10', '0', '2'), ('81', '1', '1', '11', '0', '2'), ('82', '1', '1', '12', '0', '2'), ('83', '1', '1', '13', '0', '2'), ('84', '1', '1', '14', '0', '2'), ('85', '1', '1', '15', '0', '2'), ('86', '1', '1', '16', '0', '2'), ('87', '1', '1', '17', '0', '2'), ('88', '1', '1', '18', '0', '2'), ('89', '1', '1', '19', '0', '2'), ('90', '1', '1', '20', '0', '2'), ('91', '2', '2', '1', '0', '2'), ('92', '2', '2', '2', '0', '2'), ('93', '2', '2', '3', '0', '2'), ('94', '2', '2', '4', '0', '2'), ('95', '2', '2', '5', '0', '2'), ('96', '2', '2', '6', '0', '2'), ('97', '2', '2', '7', '0', '2'), ('98', '2', '2', '8', '0', '2'), ('99', '2', '2', '9', '0', '2'), ('100', '2', '2', '10', '0', '2'), ('101', '2', '2', '11', '0', '2'), ('102', '2', '2', '12', '0', '2'), ('103', '2', '2', '13', '0', '2'), ('104', '2', '2', '14', '0', '2'), ('105', '2', '2', '15', '0', '2'), ('106', '2', '2', '16', '15', '2'), ('107', '2', '2', '17', '0', '2'), ('108', '2', '2', '18', '0', '2'), ('109', '2', '2', '19', '0', '2'), ('110', '2', '2', '20', '0', '2'), ('111', '2', '2', '21', '0', '2'), ('112', '2', '2', '22', '0', '2'), ('113', '2', '2', '23', '0', '2'), ('114', '2', '2', '24', '0', '2'), ('115', '2', '2', '25', '0', '2'), ('116', '2', '2', '26', '0', '2'), ('117', '2', '2', '27', '0', '2'), ('118', '2', '2', '28', '0', '2'), ('119', '2', '2', '29', '0', '2'), ('120', '2', '2', '30', '0', '2'), ('121', '2', '2', '31', '0', '2'), ('122', '2', '2', '32', '0', '2'), ('123', '2', '2', '33', '0', '2'), ('124', '2', '2', '34', '0', '2'), ('125', '2', '2', '35', '0', '2'), ('126', '2', '2', '36', '0', '2'), ('127', '2', '2', '37', '0', '2'), ('128', '2', '2', '38', '0', '2'), ('129', '2', '2', '39', '0', '2'), ('130', '2', '2', '40', '0', '2'), ('131', '2', '2', '41', '0', '2'), ('132', '2', '2', '42', '0', '2'), ('133', '2', '2', '43', '0', '2'), ('134', '2', '2', '44', '0', '2'), ('135', '2', '2', '45', '0', '2'), ('136', '2', '2', '46', '0', '2'), ('137', '2', '2', '47', '0', '2'), ('138', '2', '2', '48', '0', '2'), ('139', '2', '2', '49', '0', '2'), ('140', '2', '2', '50', '0', '2');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_station`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_station`;
CREATE TABLE `ticket_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_station`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_station` VALUES ('1', '上海虹桥'), ('2', '苏州北'), ('3', '镇江南'), ('4', '南京南'), ('5', '徐州东'), ('6', '泰安'), ('7', '济南西'), ('8', '天津南'), ('9', '北京南'), ('10', '常州北'), ('11', '宿州东'), ('12', '枣庄');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_through`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_through`;
CREATE TABLE `ticket_through` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ETD` time(6) NOT NULL,
  `ETA` time(6) NOT NULL,
  `order` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_though_line_id_id_be43737f_fk_ticket_line_id` (`line_id`),
  KEY `ticket_though_station_id_id_790ccde3_fk_ticket_station_id` (`station_id`),
  CONSTRAINT `ticket_though_line_id_id_be43737f_fk_ticket_line_id` FOREIGN KEY (`line_id`) REFERENCES `ticket_line` (`id`),
  CONSTRAINT `ticket_though_station_id_id_790ccde3_fk_ticket_station_id` FOREIGN KEY (`station_id`) REFERENCES `ticket_station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_through`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_through` VALUES ('1', '07:10:00.000000', '07:10:00.000000', '1', '1', '1'), ('2', '07:33:00.000000', '07:35:00.000000', '2', '1', '2'), ('3', '08:10:00.000000', '08:12:00.000000', '3', '1', '3'), ('4', '08:31:00.000000', '08:33:00.000000', '4', '1', '4'), ('5', '09:47:00.000000', '09:50:00.000000', '5', '1', '5'), ('6', '10:41:00.000000', '10:44:00.000000', '6', '1', '6'), ('7', '11:01:00.000000', '11:03:00.000000', '7', '1', '7'), ('8', '12:06:00.000000', '12:08:00.000000', '8', '1', '8'), ('9', '12:42:00.000000', '12:42:00.000000', '9', '1', '9'), ('10', '06:39:00.000000', '06:39:00.000000', '1', '2', '1'), ('11', '07:04:00.000000', '07:02:00.000000', '2', '2', '2'), ('12', '07:28:00.000000', '07:26:00.000000', '3', '2', '10'), ('13', '08:03:00.000000', '08:01:00.000000', '4', '2', '4'), ('14', '09:08:00.000000', '09:03:00.000000', '5', '2', '11'), ('15', '09:46:00.000000', '09:40:00.000000', '6', '2', '12'), ('16', '10:39:00.000000', '10:36:00.000000', '7', '2', '7'), ('17', '11:44:00.000000', '11:42:00.000000', '8', '2', '8'), ('18', '12:18:00.000000', '12:18:00.000000', '9', '2', '9'), ('19', '10:00:00.000000', '10:00:00.000000', '1', '3', '1'), ('20', '11:09:00.000000', '11:07:00.000000', '2', '3', '4'), ('21', '13:23:00.000000', '13:21:00.000000', '3', '3', '7'), ('22', '14:58:00.000000', '14:58:00.000000', '4', '3', '9'), ('23', '07:00:00.000000', '07:00:00.000000', '1', '4', '1'), ('24', '08:09:00.000000', '08:07:00.000000', '2', '4', '4'), ('25', '10:23:00.000000', '10:21:00.000000', '3', '4', '7'), ('26', '11:55:00.000000', '11:55:00.000000', '4', '4', '9'), ('27', '09:00:00.000000', '09:00:00.000000', '1', '5', '1'), ('28', '10:09:00.000000', '10:07:00.000000', '2', '5', '4'), ('29', '13:49:00.000000', '13:49:00.000000', '3', '5', '9'), ('30', '19:00:00.000000', '19:00:00.000000', '1', '6', '1'), ('31', '20:07:00.000000', '20:09:00.000000', '2', '6', '4'), ('32', '23:49:00.000000', '23:49:00.000000', '3', '6', '9');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticket`;
CREATE TABLE `ticket_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_number` varchar(18) NOT NULL,
  `name` varchar(20) NOT NULL,
  `is_stu` tinyint(1) NOT NULL,
  `line_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_ticket_line_id_id_1bc09325_fk_ticket_line_id` (`line_id`),
  KEY `ticket_ticket_route_id_id_dd1f897b_fk_ticket_route_id` (`route_id`),
  KEY `ticket_ticket_seat_id_id_db70265b_fk_ticket_seat_id` (`seat_id`),
  CONSTRAINT `ticket_ticket_line_id_id_1bc09325_fk_ticket_line_id` FOREIGN KEY (`line_id`) REFERENCES `ticket_line` (`id`),
  CONSTRAINT `ticket_ticket_route_id_id_dd1f897b_fk_ticket_route_id` FOREIGN KEY (`route_id`) REFERENCES `ticket_route` (`id`),
  CONSTRAINT `ticket_ticket_seat_id_id_db70265b_fk_ticket_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `ticket_seat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_ticket`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_ticket` VALUES ('1', '54165321', '乔丹', '0', '1', '1', '35'), ('2', '54165321', '乔丹', '0', '1', '1', '30'), ('5', '6521616', '乔丹', '0', '1', '1', '7'), ('6', '65416541648', '金照', '1', '1', '1', '8'), ('7', '5465163163', '乔丹', '0', '1', '29', '14'), ('8', '6546516556', '乔丹', '1', '1', '29', '20'), ('9', '56465', 'iHome', '1', '1', '29', '41'), ('10', '54541651', '乔丹', '0', '2', '4', '106');
COMMIT;

-- ----------------------------
--  Table structure for `ticket_ticket_order_id`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticket_order_id`;
CREATE TABLE `ticket_ticket_order_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_ticket_order_id_ticket_id_order_id_59779be4_uniq` (`ticket_id`,`order_id`),
  KEY `ticket_ticket_order_id_order_id_3bd363d8_fk_ticket_order_id` (`order_id`),
  CONSTRAINT `ticket_ticket_order_id_order_id_3bd363d8_fk_ticket_order_id` FOREIGN KEY (`order_id`) REFERENCES `ticket_order` (`id`),
  CONSTRAINT `ticket_ticket_order_id_ticket_id_4f4fce15_fk_ticket_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ticket_user`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_user`;
CREATE TABLE `ticket_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ticket_user`
-- ----------------------------
BEGIN;
INSERT INTO `ticket_user` VALUES ('1', 'jordan', 'jordan0801@163.com', '123456'), ('11', '987', '987@123.com', '987'), ('12', '7777', '7777@777.com', '7777'), ('13', '8888', '8888@777.com', '8888'), ('14', '乔丹', '987991610@qq.com', 'qiaodan'), ('15', 'jordan', 'jordan@987.com', 'jordan'), ('16', 'jj', 'jj@163.com', 'jjjjj'), ('17', 'ticket', 'ticket@123.com', 'ticket'), ('18', 'user2', 'user2@qq.com', 'user2'), ('19', 'cww97', 'cww970329@qq.com', '123456');
COMMIT;

-- ----------------------------
--  Procedure structure for `get_price`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_price`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_price`(IN id1 INT,IN id2 INT)
BEGIN
    SELECT price
      FROM ticket_route
        WHERE departure_id = id1 AND destination_id = id2;
  END
 ;;
delimiter ;

-- ----------------------------
--  Procedure structure for `search_line`
-- ----------------------------
DROP PROCEDURE IF EXISTS `search_line`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `search_line`(IN id1 INT, IN id2 INT)
BEGIN
    SELECT T1.line_id AS line_id,T1.ETD AS ETD,T2.ETA AS ETA, timediff(T2.ETA,T1.ETD) AS span,ticket_line.name
    FROM (SELECT ETD,`order`,line_id
    FROM ticket_through WHERE station_id = id1) AS T1 JOIN
      (SELECT ETA,`order`,line_id
      FROM ticket_through WHERE station_id = id2)AS T2 ON T1.line_id = T2.line_id JOIN ticket_line ON T1.line_id = ticket_line.id
    WHERE T1.`order` < T2.`order`;
  END
 ;;
delimiter ;

-- ----------------------------
--  Procedure structure for `search_route`
-- ----------------------------
DROP PROCEDURE IF EXISTS `search_route`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `search_route`(IN id1 INT, IN id2 INT)
BEGIN 
    SELECT * FROM ticket_route
      WHERE departure_id = id1 AND destination_id = id2;
  END
 ;;
delimiter ;

-- ----------------------------
--  Procedure structure for `seat_lv`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seat_lv`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `seat_lv`(IN line_id INT,IN id1 INT, IN id2 INT,IN lv INT)
BEGIN
    SET @i = 1;
    SET @pattern = 0;
    SET @temp = 1;
    WHILE @i < id1 DO
      BEGIN
        SET @temp = @temp*2;
        SET @i = @i +1;
      END ;
    END WHILE;
    SET @pattern = @temp;
    WHILE @i < id2 DO
      BEGIN
        SET @temp = @temp *2;
        SET @pattern = @pattern + @temp;
        SET @i = @i + 1;
      END ;
    END WHILE;
    SELECT id
      FROM ticket_seat
      WHERE ticket_seat.line_id =line_id AND ticket_seat.level = lv AND (~status) & @pattern = @pattern ;
  END
 ;;
delimiter ;

-- ----------------------------
--  Event structure for `testevent`
-- ----------------------------
DROP EVENT IF EXISTS `testevent`;
delimiter ;;
CREATE DEFINER=`root`@`%` EVENT `testevent` ON SCHEDULE EVERY 1 DAY STARTS '2017-06-20 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE ticket_seat SET status = 0
 ;;
delimiter ;

-- ----------------------------
--  Triggers structure for table ticket_ticket
-- ----------------------------
DROP TRIGGER IF EXISTS `update_status`;
delimiter ;;
CREATE TRIGGER `update_status` AFTER INSERT ON `ticket_ticket` FOR EACH ROW BEGIN
  SET @line_id = NEW.line_id;
  SET @route_id = NEW.route_id ;
  SET @id1 = (SELECT departure_id FROM ticket_route WHERE id = @route_id);
  SET @id2 = (SELECT destination_id FROM ticket_route WHERE id = @route_id);
  SET @seat_id = NEW.seat_id;
  SET @i = 1;
    SET @pattern = 0;
    SET @temp = 1;
    WHILE @i < @id1 DO
      BEGIN
        SET @temp = @temp*2;
        SET @i = @i +1;
      END ;
    END WHILE;
    SET @pattern = @temp;
    WHILE @i < @id2 DO
      BEGIN
        SET @temp = @temp *2;
        SET @pattern = @pattern + @temp;
        SET @i = @i + 1;
      END ;
    END WHILE;
  UPDATE ticket_seat SET status = status|@pattern WHERE id = @seat_id;
END
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
