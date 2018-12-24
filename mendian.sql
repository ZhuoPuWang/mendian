/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : mendian

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2018-12-20 23:04:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_activ
-- ----------------------------
DROP TABLE IF EXISTS `tp_activ`;
CREATE TABLE `tp_activ` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(5) DEFAULT NULL COMMENT '活动类型1充值优惠2满减活动',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `state` int(5) DEFAULT '0' COMMENT '0关闭1开启',
  `consume` decimal(10,0) DEFAULT '0' COMMENT '消费金额',
  `discount` decimal(10,0) DEFAULT '0' COMMENT '优惠金额金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_activ
-- ----------------------------
INSERT INTO `tp_activ` VALUES ('7', '1', '1', '0', '0', '500', '111');
INSERT INTO `tp_activ` VALUES ('8', '1', '1', '0', '0', '123', '123');
INSERT INTO `tp_activ` VALUES ('9', '1', '1', '0', '0', '750', '1');
INSERT INTO `tp_activ` VALUES ('10', '1', '1', '0', '0', '700', '1');
INSERT INTO `tp_activ` VALUES ('11', '1', '1', '0', '0', '650', '1');

-- ----------------------------
-- Table structure for tp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_access`;
CREATE TABLE `tp_admin_access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `node_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_access
-- ----------------------------
INSERT INTO `tp_admin_access` VALUES ('3', '125', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '124', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '123', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '122', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '121', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '120', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '119', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '118', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '117', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '116', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '115', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '114', '3', '66');
INSERT INTO `tp_admin_access` VALUES ('3', '66', '2', '1');
INSERT INTO `tp_admin_access` VALUES ('3', '154', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '153', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '113', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '112', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '111', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '110', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '109', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '108', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '107', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '106', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '105', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '104', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '103', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '102', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '101', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '100', '3', '65');
INSERT INTO `tp_admin_access` VALUES ('3', '65', '2', '1');
INSERT INTO `tp_admin_access` VALUES ('3', '152', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '99', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '98', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '97', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '96', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '95', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '94', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '93', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '92', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '91', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '90', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '89', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '88', '3', '64');
INSERT INTO `tp_admin_access` VALUES ('3', '64', '2', '1');
INSERT INTO `tp_admin_access` VALUES ('3', '8', '3', '6');
INSERT INTO `tp_admin_access` VALUES ('3', '7', '3', '6');
INSERT INTO `tp_admin_access` VALUES ('3', '6', '2', '1');
INSERT INTO `tp_admin_access` VALUES ('3', '1', '1', '0');

-- ----------------------------
-- Table structure for tp_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_group`;
CREATE TABLE `tp_admin_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_group
-- ----------------------------
INSERT INTO `tp_admin_group` VALUES ('1', '系统管理', '&#xe61d;', '2', '0', '', '1', '1450752856', '1481180175');
INSERT INTO `tp_admin_group` VALUES ('2', '工具', '&#xe616;', '3', '0', '', '1', '1476016712', '1481180175');
INSERT INTO `tp_admin_group` VALUES ('3', '股东管理', '', '50', '1', '', '0', '1540116374', '1540116374');
INSERT INTO `tp_admin_group` VALUES ('4', '商品设置', '&amp;#xe61d;', '50', '1', '', '0', '1540191790', '1540191790');
INSERT INTO `tp_admin_group` VALUES ('5', '用户管理', '&amp;#xe62c', '50', '1', '', '0', '1540193182', '1540193182');
INSERT INTO `tp_admin_group` VALUES ('6', '财务管理', '&amp;#xe611;', '50', '1', '', '0', '1540202279', '1540202279');

-- ----------------------------
-- Table structure for tp_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node`;
CREATE TABLE `tp_admin_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `isdelete` (`isdelete`),
  KEY `sort` (`sort`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_node
-- ----------------------------
INSERT INTO `tp_admin_node` VALUES ('1', '0', '1', 'Admin', '后台管理', '后台管理，不可更改', '1', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('2', '1', '1', 'AdminGroup', '分组管理', ' ', '2', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('3', '1', '1', 'AdminNode', '节点管理', ' ', '2', '1', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('4', '1', '1', 'AdminRole', '角色管理', ' ', '2', '1', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('5', '1', '1', 'AdminUser', '后台用户管理', '', '2', '1', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('6', '1', '0', 'Index', '首页', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('7', '6', '0', 'welcome', '欢迎页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('8', '6', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('9', '1', '2', 'Generate', '代码自动生成', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('10', '1', '2', 'Demo/excel', 'Excel一键导出', '', '2', '0', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('11', '1', '2', 'Demo/download', '下载', '', '2', '0', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('12', '1', '2', 'Demo/downloadImage', '远程图片下载', '', '2', '0', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('13', '1', '2', 'Demo/mail', '邮件发送', '', '2', '0', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('14', '1', '2', 'Demo/qiniu', '七牛上传', '', '2', '0', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('15', '1', '2', 'Demo/hashids', 'ID加密', '', '2', '0', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('16', '1', '2', 'Demo/layer', '丰富弹层', '', '2', '0', '8', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('17', '1', '2', 'Demo/tableFixed', '表格溢出', '', '2', '0', '9', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('18', '1', '2', 'Demo/ueditor', '百度编辑器', '', '2', '0', '10', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('19', '1', '2', 'Demo/imageUpload', '图片上传', '', '2', '0', '11', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('20', '1', '2', 'Demo/qrcode', '二维码生成', '', '2', '0', '12', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('21', '1', '1', 'NodeMap', '节点图', '', '2', '1', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('22', '1', '1', 'WebLog', '操作日志', '', '2', '1', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('23', '1', '1', 'LoginLog', '登录日志', '', '2', '1', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('59', '1', '2', 'one.two.three.Four/index', '多级节点', '', '2', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('24', '23', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('25', '22', '0', 'index', '列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('26', '22', '0', 'detail', '详情', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('27', '21', '0', 'load', '自动导入', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('28', '21', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('29', '5', '0', 'add', '添加', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('30', '21', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('31', '21', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('32', '9', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('33', '9', '0', 'generate', '生成方法', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('34', '5', '0', 'password', '修改密码', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('35', '5', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('36', '5', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('37', '5', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('38', '4', '0', 'user', '用户列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('39', '4', '0', 'access', '授权', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('40', '4', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('41', '4', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('42', '4', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('43', '4', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('44', '4', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('45', '3', '0', 'load', '节点快速导入测试', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('46', '3', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('47', '3', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('48', '3', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('49', '3', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('50', '3', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('51', '2', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('52', '2', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('53', '2', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('54', '2', '0', 'forbid', '默认禁用操作', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('55', '2', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('56', '1', '2', 'one', '一级菜单', '', '2', '1', '13', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('60', '56', '2', 'two', '二级', '', '3', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('61', '60', '2', 'three', '三级菜单', '', '4', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('62', '61', '2', 'Four', '四级菜单', '', '5', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('63', '1', '4', 'SetMail', '商品列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('64', '1', '5', 'User', '用户列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('65', '1', '6', 'Bells', '财务列表', '', '2', '1', '50', '0', '1');
INSERT INTO `tp_admin_node` VALUES ('66', '1', '3', 'Teacher', '技师管理', '', '2', '1', '50', '0', '1');
INSERT INTO `tp_admin_node` VALUES ('67', '5', '0', 'delete', '删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('68', '5', '0', 'recycleBin', '回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('69', '5', '0', 'delete', '默认删除操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('70', '5', '0', 'recycle', '从回收站恢复', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('71', '5', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('72', '5', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('73', '5', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('74', '5', '0', 'clear', '清空回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('75', '5', '0', 'saveOrder', '保存排序', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('76', '63', '0', 'del', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('77', '63', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('78', '63', '0', 'recycleBin', '回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('79', '63', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('80', '63', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('81', '63', '0', 'delete', '默认删除操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('82', '63', '0', 'recycle', '从回收站恢复', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('83', '63', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('84', '63', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('85', '63', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('86', '63', '0', 'clear', '清空回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('87', '63', '0', 'saveOrder', '保存排序', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('88', '64', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('89', '64', '0', 'edit', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('90', '64', '0', 'add', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('91', '64', '0', 'del', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('92', '64', '0', 'recycleBin', '回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('93', '64', '0', 'delete', '默认删除操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('94', '64', '0', 'recycle', '从回收站恢复', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('95', '64', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('96', '64', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('97', '64', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('98', '64', '0', 'clear', '清空回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('99', '64', '0', 'saveOrder', '保存排序', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('100', '65', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('101', '65', '0', 'order_list', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('102', '65', '0', 'jie', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('103', '65', '0', 'add', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('104', '65', '0', 'addclock', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('105', '65', '0', 'recycleBin', '回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('106', '65', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('107', '65', '0', 'delete', '默认删除操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('108', '65', '0', 'recycle', '从回收站恢复', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('109', '65', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('110', '65', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('111', '65', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('112', '65', '0', 'clear', '清空回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('113', '65', '0', 'saveOrder', '保存排序', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('114', '66', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('115', '66', '0', 'edit', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('116', '66', '0', 'add', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('117', '66', '0', 'del', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('118', '66', '0', 'recycleBin', '回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('119', '66', '0', 'delete', '默认删除操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('120', '66', '0', 'recycle', '从回收站恢复', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('121', '66', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('122', '66', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('123', '66', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('124', '66', '0', 'clear', '清空回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('125', '66', '0', 'saveOrder', '保存排序', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('126', '1', '4', 'Combination', '附加项目', '', '2', '1', '50', '0', '1');
INSERT INTO `tp_admin_node` VALUES ('128', '1', '4', 'Activ', '活动管理', '', '2', '1', '50', '0', '1');
INSERT INTO `tp_admin_node` VALUES ('129', '126', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('130', '126', '0', 'del', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('131', '126', '0', 'recycleBin', '回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('132', '126', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('133', '126', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('134', '126', '0', 'delete', '默认删除操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('135', '126', '0', 'recycle', '从回收站恢复', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('136', '126', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('137', '126', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('138', '126', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('139', '126', '0', 'clear', '清空回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('140', '126', '0', 'saveOrder', '保存排序', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('141', '128', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('142', '128', '0', 'add', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('143', '128', '0', 'recycleBin', '回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('144', '128', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('145', '128', '0', 'delete', '默认删除操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('146', '128', '0', 'recycle', '从回收站恢复', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('147', '128', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('148', '128', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('149', '128', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('150', '128', '0', 'clear', '清空回收站', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('151', '128', '0', 'saveOrder', '保存排序', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('152', '64', '0', 'Recharge', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('153', '65', '0', 'fjie', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('154', '65', '0', 'lockedit', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('155', '1', '3', 'holder', '股东列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('156', '1', '4', 'goodstype', '商品分类', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('157', '1', '6', 'Deliver', '发货列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('158', '1', '6', 'Daochu', '订单导出', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('159', '1', '6', 'holdermoney', '股东业绩', '', '2', '1', '50', '1', '0');

-- ----------------------------
-- Table structure for tp_admin_node_load
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node_load`;
CREATE TABLE `tp_admin_node_load` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='节点快速导入';

-- ----------------------------
-- Records of tp_admin_node_load
-- ----------------------------
INSERT INTO `tp_admin_node_load` VALUES ('4', '编辑', 'edit', '1');
INSERT INTO `tp_admin_node_load` VALUES ('5', '添加', 'add', '1');
INSERT INTO `tp_admin_node_load` VALUES ('6', '首页', 'index', '1');
INSERT INTO `tp_admin_node_load` VALUES ('7', '删除', 'delete', '1');

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`),
  KEY `isdelete` (`isdelete`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES ('3', '0', '分店', '', '1', '0', '1540116689', '1540116689');

-- ----------------------------
-- Table structure for tp_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role_user`;
CREATE TABLE `tp_admin_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of tp_admin_role_user
-- ----------------------------
INSERT INTO `tp_admin_role_user` VALUES ('3', '4');

-- ----------------------------
-- Table structure for tp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_user`;
CREATE TABLE `tp_admin_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(32) NOT NULL DEFAULT '',
  `realname` varchar(255) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` char(15) NOT NULL DEFAULT '',
  `login_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `accountpassword` (`account`,`password`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_user
-- ----------------------------
INSERT INTO `tp_admin_user` VALUES ('1', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1545317935', '123.139.41.248', '415', 'tianpian0805@gmail.com', '13121126169', '我是超级管理员', '1', '0', '1222907803', '1451033528');
INSERT INTO `tp_admin_user` VALUES ('2', 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', '1481206367', '127.0.0.1', '5', '', '', '', '1', '0', '1476777133', '1477399793');

-- ----------------------------
-- Table structure for tp_bells
-- ----------------------------
DROP TABLE IF EXISTS `tp_bells`;
CREATE TABLE `tp_bells` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `son_id` int(11) DEFAULT NULL,
  `createtime` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_bells
-- ----------------------------
INSERT INTO `tp_bells` VALUES ('10', '1', '0', '4', '1540375080');
INSERT INTO `tp_bells` VALUES ('11', '1', '0', '4', '1540461540');
INSERT INTO `tp_bells` VALUES ('12', '1', '0', '1', '1540539900');
INSERT INTO `tp_bells` VALUES ('13', '1', '0', '1', '1538987880');
INSERT INTO `tp_bells` VALUES ('14', '1', '0', '1', '1540618140');
INSERT INTO `tp_bells` VALUES ('15', '1', '0', '4', '1543556580');
INSERT INTO `tp_bells` VALUES ('16', '1', '0', '4', '1540791840');
INSERT INTO `tp_bells` VALUES ('17', '1', '0', '4', '1539668700');
INSERT INTO `tp_bells` VALUES ('18', '1', '0', '4', '1540878300');

-- ----------------------------
-- Table structure for tp_bells_list
-- ----------------------------
DROP TABLE IF EXISTS `tp_bells_list`;
CREATE TABLE `tp_bells_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `son_id` int(11) DEFAULT NULL COMMENT '分店id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `teacher_id` int(11) DEFAULT NULL COMMENT '技师id',
  `mail_id` int(11) DEFAULT NULL COMMENT '套餐id',
  `state` int(5) DEFAULT '1' COMMENT '是否会员0已完成1未完成',
  `bells_id` int(11) DEFAULT NULL,
  `record` text COMMENT '备注',
  `starttime` int(20) DEFAULT NULL COMMENT '上种时间',
  `com_id` varchar(255) DEFAULT NULL COMMENT '附加项目',
  `money` decimal(10,0) DEFAULT NULL COMMENT '订单总额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_bells_list
-- ----------------------------
INSERT INTO `tp_bells_list` VALUES ('39', null, '14', '11', '2', '0', '16', null, '1540619065', ',2,4', '186');
INSERT INTO `tp_bells_list` VALUES ('35', null, '14', '9', '3', '0', '12', null, '1540546932', ',6', '346');
INSERT INTO `tp_bells_list` VALUES ('37', null, '0', '9', '2', '1', '14', null, '1540618155', ',2,4', '186');
INSERT INTO `tp_bells_list` VALUES ('38', null, '14', '11', '0', '1', '15', null, '1540619000', ',2,4,6,8', '266');
INSERT INTO `tp_bells_list` VALUES ('40', null, '12', '11', '0', '1', '17', null, '1540619110', ',', '0');
INSERT INTO `tp_bells_list` VALUES ('41', null, '0', '11', '3', '0', '18', null, '1540619123', ',6,8', '326');

-- ----------------------------
-- Table structure for tp_combination
-- ----------------------------
DROP TABLE IF EXISTS `tp_combination`;
CREATE TABLE `tp_combination` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '套餐名称',
  `lengthtime` varchar(255) DEFAULT NULL COMMENT '套餐时长',
  `price` varchar(255) DEFAULT NULL COMMENT '套餐价格',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_combination
-- ----------------------------

-- ----------------------------
-- Table structure for tp_deliver
-- ----------------------------
DROP TABLE IF EXISTS `tp_deliver`;
CREATE TABLE `tp_deliver` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `son_id` varchar(255) DEFAULT NULL COMMENT '所属股东',
  `price` decimal(10,4) DEFAULT '0.0000' COMMENT '总价',
  `goods` longtext COMMENT '商品',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `state` int(5) DEFAULT '0' COMMENT '未收货0未确认1已收货',
  `createtime` int(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `mobile` varchar(20) DEFAULT NULL COMMENT '收货人手机号',
  `sprice` decimal(10,4) DEFAULT '0.0000' COMMENT '提成',
  `username` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `type` int(5) DEFAULT '0' COMMENT '0扣款1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_deliver
-- ----------------------------
INSERT INTO `tp_deliver` VALUES ('16', '7', '200.0000', '[{\"goodsId\":\"9\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c11\",\"goodsPrice\":\"100\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"},{\"goodsId\":\"9\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c11\",\"goodsPrice\":\"100\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"}]', '1', '0', '0', '1541665491', '23', '13289223170', '2.0000', '测试会员', '0');
INSERT INTO `tp_deliver` VALUES ('17', '0', '1100.0000', '[{\"goodsId\":\"9\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c11\",\"goodsPrice\":\"100\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"},{\"goodsId\":\"10\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c12\",\"goodsPrice\":\"1000\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"}]', '1', '0', '0', '1541665556', '0', '13289223170', '11.0000', '测试散户', '0');
INSERT INTO `tp_deliver` VALUES ('18', '8', '6100.0000', '[{\"goodsId\":\"9\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c11\",\"goodsPrice\":\"100\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"},{\"goodsId\":\"10\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c12\",\"goodsPrice\":\"1000\",\"goodsNum\":\"3\",\"goodsExtra\":\"0.0100\"},{\"goodsId\":\"11\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c13\",\"goodsPrice\":\"1000\",\"goodsNum\":\"3\",\"goodsExtra\":\"0.0200\"}]', '1', '0', '0', '1541666064', '24', '13289223172', '91.0000', '测试会员22', '0');
INSERT INTO `tp_deliver` VALUES ('19', '0', '1100.0000', '[{\"goodsId\":\"9\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c11\",\"goodsPrice\":\"100\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"},{\"goodsId\":\"11\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c13\",\"goodsPrice\":\"1000\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0200\"}]', '1', '0', '0', '1541666260', '0', '13289223170', '21.0000', '测试散户', '0');
INSERT INTO `tp_deliver` VALUES ('20', '0', '1100.0000', '[{\"goodsId\":\"9\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c11\",\"goodsPrice\":\"100\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"},{\"goodsId\":\"11\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c13\",\"goodsPrice\":\"1000\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0200\"}]', '1', '0', '0', '1541666536', '0', '13289223170', '21.0000', '我的', '0');
INSERT INTO `tp_deliver` VALUES ('21', '7', '1100.0000', '[{\"goodsId\":\"9\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c11\",\"goodsPrice\":\"100\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0100\"},{\"goodsId\":\"11\",\"goodsSname\":\"\\u6d4b\\u8bd5\\u5546\\u54c13\",\"goodsPrice\":\"1000\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.0200\"}]', '1', '0', '0', '1541666549', '23', '13289223170', '21.0000', '测试会员', '0');
INSERT INTO `tp_deliver` VALUES ('22', '9', '580.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"}]', '1', '0', '0', '1541669021', '25', '18681974288', '116.0000', '梅宇', '0');
INSERT INTO `tp_deliver` VALUES ('23', '11', '168.0000', '[{\"goodsId\":\"16\",\"goodsSname\":\"\\u57fa\\u56e0\\u4fee\\u590d\\u6d01\\u9762\\u4e73\",\"goodsPrice\":\"168\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.3000\"}]', '1', '0', '0', '1541669299', '26', '18774544125', '50.4000', '张媛媛', '0');
INSERT INTO `tp_deliver` VALUES ('24', '11', '380.0000', '[{\"goodsId\":\"14\",\"goodsSname\":\"\\u8fdb\\u53e3\\u8033\\u5760\",\"goodsPrice\":\"380\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.3000\"}]', '1', '0', '0', '1541669670', '27', '18778455214', '114.0000', '散客', '0');
INSERT INTO `tp_deliver` VALUES ('25', '13', '960.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"},{\"goodsId\":\"14\",\"goodsSname\":\"\\u8fdb\\u53e3\\u8033\\u5760\",\"goodsPrice\":\"380\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.3000\"}]', '1', '0', '0', '1541748711', '32', '13289223170', '230.0000', '测试会员', '0');
INSERT INTO `tp_deliver` VALUES ('26', '0', '580.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"}]', '1', '0', '0', '1541748746', '0', '13289223170', '116.0000', '测试订单', '1');
INSERT INTO `tp_deliver` VALUES ('27', '13', '580.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"}]', '1', '0', '0', '1541748788', '0', '13289223170', '116.0000', 'wangzhuo', '1');
INSERT INTO `tp_deliver` VALUES ('28', '13', '580.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"}]', '1', '0', '0', '1541748818', '0', '13289223170', '116.0000', '测试会员22', '1');
INSERT INTO `tp_deliver` VALUES ('29', '9', '580.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"}]', '1', '0', '0', '1541817576', '25', '18681974288', '116.0000', '梅宇', '0');
INSERT INTO `tp_deliver` VALUES ('30', '13', '580.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"}]', '1', '0', '0', '1541817598', '32', '13289223170', '116.0000', '测试会员', '0');
INSERT INTO `tp_deliver` VALUES ('31', '9', '580.0000', '[{\"goodsId\":\"13\",\"goodsSname\":\"\\u9ed1\\u8272\\u957f\\u6b3e\\u8fd0\\u52a8\\u88c5\",\"goodsPrice\":\"580\",\"goodsNum\":\"1\",\"goodsExtra\":\"0.2000\"}]', '1', '0', '0', '1545317956', '25', '18681974288', '116.0000', '梅宇', '0');

-- ----------------------------
-- Table structure for tp_file
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_file
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `tp_goodstype`;
CREATE TABLE `tp_goodstype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `son_id` varchar(255) DEFAULT NULL COMMENT '所属上级',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_goodstype
-- ----------------------------
INSERT INTO `tp_goodstype` VALUES ('27', '服饰', '0', '0', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('28', '鞋', '0', '0', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('29', '首饰配件', '0', '0', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('30', '美甲', '0', '0', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('31', '美容', '0', '0', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('32', '深圳服饰', '27', ',27', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('33', '普通服饰', '27', ',27', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('34', '特殊鞋', '28', ',28', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('35', '普通鞋', '28', ',28', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('36', '特殊首饰配件', '29', ',29', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('37', '普通首饰配件', '29', ',29', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('39', '美容服务', '31', ',31', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('40', '医美合作', '31', ',31', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('41', '美容产品', '31', ',31', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('42', '会员卡', '0', '0', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('43', '美容会员卡', '42', ',42', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('44', '测试分类', '0', '0', '1', '0');
INSERT INTO `tp_goodstype` VALUES ('45', '测试分类2', '44', ',44', '1', '0');

-- ----------------------------
-- Table structure for tp_holder
-- ----------------------------
DROP TABLE IF EXISTS `tp_holder`;
CREATE TABLE `tp_holder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '会员名称',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `age` varchar(255) DEFAULT NULL COMMENT '年龄',
  `sex` int(5) DEFAULT '0' COMMENT '性别',
  `money` decimal(10,2) DEFAULT NULL COMMENT '用户金额',
  `record` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `createtime` int(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_holder
-- ----------------------------
INSERT INTO `tp_holder` VALUES ('9', '张平', '13609280010', '30', '0', '348.00', '创始人', '1', '0', '1541667744');
INSERT INTO `tp_holder` VALUES ('10', '张菊萍', '13856552325', '38', '0', '0.00', 'A股东', '1', '0', '1541667796');
INSERT INTO `tp_holder` VALUES ('11', '武梅', '18665233214', '30', '1', '164.40', 'B股东', '1', '0', '1541667847');
INSERT INTO `tp_holder` VALUES ('12', '薛蕊怡', '18665477856', '30', '1', '0.00', 'B股东', '1', '0', '1541667879');
INSERT INTO `tp_holder` VALUES ('13', '测试股东', '13289223170', '12', '0', '578.00', '', '1', '0', '1541748220');

-- ----------------------------
-- Table structure for tp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `login_ip` char(15) NOT NULL DEFAULT '',
  `login_location` varchar(255) NOT NULL DEFAULT '',
  `login_browser` varchar(255) NOT NULL DEFAULT '',
  `login_os` varchar(255) NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES ('1', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-21 18:05:48');
INSERT INTO `tp_login_log` VALUES ('2', '3', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-21 18:14:13');
INSERT INTO `tp_login_log` VALUES ('3', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-21 18:15:56');
INSERT INTO `tp_login_log` VALUES ('4', '3', '127.0.0.1', '本机地址 本机地址  ', 'IE(11.0)', 'Windows 10', '2018-10-21 18:16:12');
INSERT INTO `tp_login_log` VALUES ('5', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-22 14:41:57');
INSERT INTO `tp_login_log` VALUES ('6', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-23 09:33:55');
INSERT INTO `tp_login_log` VALUES ('7', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-24 09:32:54');
INSERT INTO `tp_login_log` VALUES ('8', '4', '127.0.0.1', '本机地址 本机地址  ', 'IE(11.0)', 'Windows 10', '2018-10-24 17:47:49');
INSERT INTO `tp_login_log` VALUES ('9', '4', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-24 17:54:13');
INSERT INTO `tp_login_log` VALUES ('10', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-24 18:05:29');
INSERT INTO `tp_login_log` VALUES ('11', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-24 18:21:11');
INSERT INTO `tp_login_log` VALUES ('12', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-24 18:22:45');
INSERT INTO `tp_login_log` VALUES ('13', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-25 10:30:17');
INSERT INTO `tp_login_log` VALUES ('14', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-25 10:32:29');
INSERT INTO `tp_login_log` VALUES ('15', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-25 10:33:06');
INSERT INTO `tp_login_log` VALUES ('16', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-25 10:35:15');
INSERT INTO `tp_login_log` VALUES ('17', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-25 10:36:38');
INSERT INTO `tp_login_log` VALUES ('18', '4', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-25 10:46:43');
INSERT INTO `tp_login_log` VALUES ('19', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-26 14:59:35');
INSERT INTO `tp_login_log` VALUES ('20', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-26 20:22:55');
INSERT INTO `tp_login_log` VALUES ('21', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-27 09:49:29');
INSERT INTO `tp_login_log` VALUES ('22', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-27 13:41:11');
INSERT INTO `tp_login_log` VALUES ('23', '4', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-27 13:41:35');
INSERT INTO `tp_login_log` VALUES ('24', '1', '127.0.0.1', '本机地址 本机地址  ', 'IE(11.0)', 'Windows 10', '2018-10-27 13:47:05');
INSERT INTO `tp_login_log` VALUES ('25', '4', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-27 13:54:16');
INSERT INTO `tp_login_log` VALUES ('26', '1', '1.80.219.120', '中国 陕西 西安 ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-10-27 14:43:58');
INSERT INTO `tp_login_log` VALUES ('27', '4', '113.139.89.146', '中国 陕西 西安 ', 'IE(9.0)', 'Windows 7', '2018-10-27 15:49:11');
INSERT INTO `tp_login_log` VALUES ('28', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-03 10:13:26');
INSERT INTO `tp_login_log` VALUES ('29', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-03 11:21:00');
INSERT INTO `tp_login_log` VALUES ('30', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-04 11:10:56');
INSERT INTO `tp_login_log` VALUES ('31', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-05 10:09:51');
INSERT INTO `tp_login_log` VALUES ('32', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-05 15:18:12');
INSERT INTO `tp_login_log` VALUES ('33', '1', '0.0.0.0', '保留地址 保留地址  ', 'Edge(17.17134)', 'Windows 10', '2018-11-05 15:53:30');
INSERT INTO `tp_login_log` VALUES ('34', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-07 10:00:27');
INSERT INTO `tp_login_log` VALUES ('35', '1', '0.0.0.0', '保留地址 保留地址  ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-08 15:44:15');
INSERT INTO `tp_login_log` VALUES ('36', '1', '1.80.216.217', '中国 陕西 西安 ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-09 15:23:12');
INSERT INTO `tp_login_log` VALUES ('37', '1', '1.80.216.217', '中国 陕西 西安 ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-11-10 10:39:06');
INSERT INTO `tp_login_log` VALUES ('38', '1', '123.139.41.248', '中国 陕西 西安 ', 'Chrome(71.0.3551.3)', 'Windows 10', '2018-12-20 22:58:55');

-- ----------------------------
-- Table structure for tp_node_map
-- ----------------------------
DROP TABLE IF EXISTS `tp_node_map`;
CREATE TABLE `tp_node_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`),
  KEY `map` (`method`,`module`,`controller`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点图';

-- ----------------------------
-- Records of tp_node_map
-- ----------------------------

-- ----------------------------
-- Table structure for tp_one_two_three_four
-- ----------------------------
DROP TABLE IF EXISTS `tp_one_two_three_four`;
CREATE TABLE `tp_one_two_three_four` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) DEFAULT NULL COMMENT '选填',
  `select` varchar(255) DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='四级控制器';

-- ----------------------------
-- Records of tp_one_two_three_four
-- ----------------------------
INSERT INTO `tp_one_two_three_four` VALUES ('1', 'yuan1994', '门店服装管理系统', '2', '1', null, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', '50', '1', '0', '1481947278', '1481947353');

-- ----------------------------
-- Table structure for tp_set_mail
-- ----------------------------
DROP TABLE IF EXISTS `tp_set_mail`;
CREATE TABLE `tp_set_mail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '套餐名称',
  `price` varchar(255) DEFAULT NULL COMMENT '套餐价格',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `type` int(5) DEFAULT NULL COMMENT '商品分类1几类',
  `extra` decimal(5,4) DEFAULT '0.0000' COMMENT '股东t提成',
  `stype` int(5) DEFAULT NULL COMMENT '二级类',
  `stork` int(10) DEFAULT '0' COMMENT '商品库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_set_mail
-- ----------------------------
INSERT INTO `tp_set_mail` VALUES ('13', '黑色长款运动装', '580', '1', '0', '27', '0.2000', '32', '93');
INSERT INTO `tp_set_mail` VALUES ('14', '进口耳坠', '380', '1', '0', '29', '0.3000', '36', '99');
INSERT INTO `tp_set_mail` VALUES ('16', '基因修复洁面乳', '168', '1', '0', '31', '0.3000', '41', '10');
INSERT INTO `tp_set_mail` VALUES ('17', '测试商品', '10', '1', '0', '44', '0.0100', '45', '10000');

-- ----------------------------
-- Table structure for tp_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tp_teacher`;
CREATE TABLE `tp_teacher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '技师名称',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `age` varchar(255) DEFAULT NULL COMMENT '年龄',
  `son_id` varchar(255) DEFAULT NULL COMMENT '所属分店',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `createtime` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_teacher
-- ----------------------------
INSERT INTO `tp_teacher` VALUES ('9', '123123123', '0', '100', '1', '1', '0', '1540260933');
INSERT INTO `tp_teacher` VALUES ('10', '姚启航', '1', '12', '1', '1', '0', '1540344830');
INSERT INTO `tp_teacher` VALUES ('11', '小皮', '1', '66', '4', '1', '0', '1540374537');

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '会员名称',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `age` varchar(255) DEFAULT '0' COMMENT '年龄',
  `sex` int(5) DEFAULT '0' COMMENT '性别',
  `money` decimal(10,2) DEFAULT NULL COMMENT '用户金额',
  `record` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `createtime` int(20) DEFAULT NULL COMMENT '创建时间',
  `son_id` int(5) DEFAULT '0' COMMENT '分店id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES ('25', '梅宇', '18681974288', '32', '1', '18260.00', '张平老公', '1', '0', '1541668879', '9');
INSERT INTO `tp_user` VALUES ('26', '张媛媛', '18774544125', '28', '0', '19832.00', '武梅朋友', '1', '0', '1541669263', '11');
INSERT INTO `tp_user` VALUES ('27', '散客', '18778455214', '21', '0', '120.00', '', '1', '0', '1541669372', '11');
INSERT INTO `tp_user` VALUES ('32', '测试会员', '13289223170', '10', '0', '40.00', '', '1', '0', '1541748657', '13');

-- ----------------------------
-- Table structure for tp_web_log_001
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_001`;
CREATE TABLE `tp_web_log_001` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`),
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=748 DEFAULT CHARSET=utf8 COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_001
-- ----------------------------
INSERT INTO `tp_web_log_001` VALUES ('1', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holder/index.html', 'admin', 'Holder', 'index', 'GET', 'a:0:{}', '1541384812');
INSERT INTO `tp_web_log_001` VALUES ('2', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/daochu/index.html', 'admin', 'Daochu', 'index', 'GET', 'a:0:{}', '1541384815');
INSERT INTO `tp_web_log_001` VALUES ('3', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384815');
INSERT INTO `tp_web_log_001` VALUES ('4', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_001` VALUES ('5', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_001` VALUES ('6', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_001` VALUES ('7', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_001` VALUES ('8', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_001` VALUES ('9', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384892');
INSERT INTO `tp_web_log_001` VALUES ('10', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384892');

-- ----------------------------
-- Table structure for tp_web_log_all
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_all`;
CREATE TABLE `tp_web_log_all` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC INSERT_METHOD=LAST UNION=(`tp_web_log_001`) COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_all
-- ----------------------------
INSERT INTO `tp_web_log_all` VALUES ('1', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holder/index.html', 'admin', 'Holder', 'index', 'GET', 'a:0:{}', '1541384812');
INSERT INTO `tp_web_log_all` VALUES ('2', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/daochu/index.html', 'admin', 'Daochu', 'index', 'GET', 'a:0:{}', '1541384815');
INSERT INTO `tp_web_log_all` VALUES ('3', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384815');
INSERT INTO `tp_web_log_all` VALUES ('4', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_all` VALUES ('5', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_all` VALUES ('6', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_all` VALUES ('7', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_all` VALUES ('8', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384891');
INSERT INTO `tp_web_log_all` VALUES ('9', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384892');
INSERT INTO `tp_web_log_all` VALUES ('10', '1', '0.0.0.0', '保留地址 保留地址  ', 'Windows 10', 'Chrome(71.0.3551.3)', 'http://localhost/mendian/public/admin/holdermoney/index.html', 'admin', 'Holdermoney', 'index', 'GET', 'a:0:{}', '1541384892');

-- ----------------------------
-- Procedure structure for sl_bells_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `sl_bells_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sl_bells_id`(IN `_starttime` varchar(255),IN `_endtime` varchar(255),IN `_son_id` varchar(255))
BEGIN
	#Routine body goes here...
	set @id = (SELECT id from tp_bells where createtime >=_starttime and createtime < _endtime AND son_id = _son_id);
	SELECT @id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sl_holder
-- ----------------------------
DROP PROCEDURE IF EXISTS `sl_holder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sl_holder`(IN `_mobile` varchar(255))
BEGIN
	#Routine body goes here...
	set @id = (SELECT id from tp_holder where mobile = _mobile);
  SELECT @id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sl_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `sl_user`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sl_user`(IN `_mobile` varchar(255))
BEGIN
	#Routine body goes here...
	set @id = (SELECT id from tp_user where mobile = _mobile);
  SELECT @id;
END
;;
DELIMITER ;
