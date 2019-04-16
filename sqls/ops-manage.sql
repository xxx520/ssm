/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : xboot-opensource

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2019-04-02 15:58:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_demo
-- ----------------------------
CREATE TABLE `t_demo` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT '名字',
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '测试表';


-- ----------------------------
-- Records of t_demo
-- ----------------------------

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', '0', '', '2018-08-11 17:26:38', '40322811096469504', '3.00', '-1', '人工智障', null);
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', '0', '', '2018-08-11 00:03:06', '0', '1.00', '0', '总部', '');
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', '0', '', '2018-08-11 00:27:05', '40322777781112832', '1.00', '0', '技术部', '');
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', '0', '', '2018-08-11 01:29:42', '40322811096469504', '1.00', '0', '研发中心', null);
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', '0', '', '2018-08-10 22:02:15', '40322811096469504', '2.00', '0', '大数据', null);
INSERT INTO `t_department` VALUES ('40343262766043136', '', '2018-08-10 22:02:04', '0', '', '2018-08-11 00:02:53', '0', '2.00', '0', '成都分部', '');
INSERT INTO `t_department` VALUES ('40681289119961088', '', '2018-08-11 20:25:16', '0', '', '2018-08-11 22:47:48', '40652270295060480', '2.00', '0', 'VIP', '\0');
INSERT INTO `t_department` VALUES ('40344005342400512', '', '2018-08-10 22:05:01', '0', '', '2018-08-11 17:48:44', '40343262766043136', '2.00', '0', 'Vue', null);
INSERT INTO `t_department` VALUES ('40652270295060480', '', '2018-08-11 18:29:57', '0', '', '2018-08-12 18:45:01', '0', '3.00', '0', '人事部', '');
INSERT INTO `t_department` VALUES ('40389030113710080', '', '2018-08-11 01:03:56', '0', '', '2018-08-11 17:50:04', '40343262766043136', '1.00', '0', 'JAVA', '\0');
INSERT INTO `t_department` VALUES ('40652338142121984', null, '2018-08-11 18:30:13', '0', null, '2018-08-11 18:30:13', '40652270295060480', '1.00', '0', '游客', '\0');

-- ----------------------------
-- Table structure for t_department_header
-- ----------------------------
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE `t_department_header` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` varchar(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department_header
-- ----------------------------

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('75135930788220928', 'admin', '2018-11-14 22:15:43', '0', 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', '0.00');
INSERT INTO `t_dict` VALUES ('75383353938808832', 'admin', '2018-11-15 14:38:53', '0', 'admin', '2018-11-27 01:39:15', '', '消息类型', 'message_type', '1.00');
INSERT INTO `t_dict` VALUES ('75388696739713024', 'admin', '2018-11-15 15:00:07', '0', 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', '3.00');
INSERT INTO `t_dict` VALUES ('75392985935646720', 'admin', '2018-11-15 15:17:10', '0', 'admin', '2018-11-27 01:39:29', '', '腾讯云对象存储区域', 'tencent_bucket_region', '4.00');

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dict_id` varchar(32) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
INSERT INTO `t_dict_data` VALUES ('75158227712479232', 'admin', '2018-11-14 23:44:19', '0', 'admin', '2018-11-14 23:50:23', '', '75135930788220928', '0.00', '0', '男', '1');
INSERT INTO `t_dict_data` VALUES ('75159254272577536', 'admin', '2018-11-14 23:48:24', '0', 'admin', '2018-11-14 23:50:14', '', '75135930788220928', '1.00', '0', '女', '0');
INSERT INTO `t_dict_data` VALUES ('75159898425397248', 'admin', '2018-11-14 23:50:57', '0', 'admin', '2018-11-15 17:27:15', '', '75135930788220928', '2.00', '-1', '保密', '2');
INSERT INTO `t_dict_data` VALUES ('75385648017575936', 'admin', '2018-11-15 14:48:00', '0', 'admin', '2018-11-15 14:48:41', '', '75383353938808832', '0.00', '0', '系统公告', '0');
INSERT INTO `t_dict_data` VALUES ('75385706913992704', 'admin', '2018-11-15 14:48:14', '0', 'admin', '2018-11-15 14:48:44', '', '75383353938808832', '1.00', '0', '提醒', '1');
INSERT INTO `t_dict_data` VALUES ('75385774274514944', 'admin', '2018-11-15 14:48:30', '0', 'admin', '2018-11-15 14:48:48', '', '75383353938808832', '2.00', '0', '私信', '2');
INSERT INTO `t_dict_data` VALUES ('75390787835138048', 'admin', '2018-11-15 15:08:26', '0', 'admin', '2018-11-15 15:08:26', '', '75388696739713024', '0.00', '0', '查看操作(view)', 'view');
INSERT INTO `t_dict_data` VALUES ('75390886501945344', 'admin', '2018-11-15 15:08:49', '0', 'admin', '2018-11-15 15:08:57', '', '75388696739713024', '1.00', '0', '添加操作(add)', 'add');
INSERT INTO `t_dict_data` VALUES ('75390993939042304', 'admin', '2018-11-15 15:09:15', '0', 'admin', '2018-11-15 15:09:15', '', '75388696739713024', '2.00', '0', '编辑操作(edit)', 'edit');
INSERT INTO `t_dict_data` VALUES ('75391067532300288', 'admin', '2018-11-15 15:09:32', '0', 'admin', '2018-11-15 15:09:32', '', '75388696739713024', '3.00', '0', '删除操作(delete)', 'delete');
INSERT INTO `t_dict_data` VALUES ('75391126902673408', 'admin', '2018-11-15 15:09:46', '0', 'admin', '2018-11-15 15:09:46', '', '75388696739713024', '4.00', '0', '清空操作(clear)', 'clear');
INSERT INTO `t_dict_data` VALUES ('75391192883269632', 'admin', '2018-11-15 15:10:02', '0', 'admin', '2018-11-15 15:10:02', '', '75388696739713024', '5.00', '0', '启用操作(enable)', 'enable');
INSERT INTO `t_dict_data` VALUES ('75391251024711680', 'admin', '2018-11-15 15:10:16', '0', 'admin', '2018-11-15 15:10:16', '', '75388696739713024', '6.00', '0', '禁用操作(disable)', 'disable');
INSERT INTO `t_dict_data` VALUES ('75391297124306944', 'admin', '2018-11-15 15:10:27', '0', 'admin', '2018-11-15 15:10:27', '', '75388696739713024', '7.00', '0', '搜索操作(search)', 'search');
INSERT INTO `t_dict_data` VALUES ('75391343379091456', 'admin', '2018-11-15 15:10:38', '0', 'admin', '2018-11-15 15:10:38', '', '75388696739713024', '8.00', '0', '上传文件(upload)', 'upload');
INSERT INTO `t_dict_data` VALUES ('75391407526776832', 'admin', '2018-11-15 15:10:53', '0', 'admin', '2018-11-15 15:10:53', '', '75388696739713024', '9.00', '0', '导出操作(output)', 'output');
INSERT INTO `t_dict_data` VALUES ('75391475042488320', 'admin', '2018-11-15 15:11:09', '0', 'admin', '2018-11-15 15:11:09', '', '75388696739713024', '10.00', '0', '导入操作(input)', 'input');
INSERT INTO `t_dict_data` VALUES ('75391522182270976', 'admin', '2018-11-15 15:11:21', '0', 'admin', '2018-11-15 15:11:21', '', '75388696739713024', '11.00', '0', '分配权限(editPerm)', 'editPerm');
INSERT INTO `t_dict_data` VALUES ('75391576364290048', 'admin', '2018-11-15 15:11:34', '0', 'admin', '2018-11-15 15:11:34', '', '75388696739713024', '12.00', '0', '设为默认(setDefault)', 'setDefault');
INSERT INTO `t_dict_data` VALUES ('75391798033256448', 'admin', '2018-11-15 15:12:26', '0', 'admin', '2018-11-15 15:12:26', '', '75388696739713024', '13.00', '0', '其他操作(other)', 'other');
INSERT INTO `t_dict_data` VALUES ('75393605291741184', 'admin', '2018-11-15 15:19:37', '0', 'admin', '2018-11-15 15:19:37', '', '75392985935646720', '0.00', '0', '北京一区（华北）', 'ap-beijing-1');
INSERT INTO `t_dict_data` VALUES ('75393681254780928', 'admin', '2018-11-15 15:19:55', '0', 'admin', '2018-11-15 15:19:55', '', '75392985935646720', '1.00', '0', '北京', 'ap-beijing');
INSERT INTO `t_dict_data` VALUES ('75393767619694592', 'admin', '2018-11-15 15:20:16', '0', 'admin', '2018-11-15 15:20:16', '', '75392985935646720', '2.00', '0', '上海（华东）', 'ap-shanghai');
INSERT INTO `t_dict_data` VALUES ('75393851484803072', 'admin', '2018-11-15 15:20:36', '0', 'admin', '2018-11-15 15:20:36', '', '75392985935646720', '3.00', '0', '广州（华南）', 'ap-guangzhou');
INSERT INTO `t_dict_data` VALUES ('75393961887272960', 'admin', '2018-11-15 15:21:02', '0', 'admin', '2018-11-15 15:21:02', '', '75392985935646720', '4.00', '0', '成都（西南）', 'ap-chengdu');
INSERT INTO `t_dict_data` VALUES ('75394053969022976', 'admin', '2018-11-15 15:21:24', '0', 'admin', '2018-11-15 15:21:24', '', '75392985935646720', '5.00', '0', '重庆', 'ap-chongqing');
INSERT INTO `t_dict_data` VALUES ('75394122474590208', 'admin', '2018-11-15 15:21:41', '0', 'admin', '2018-11-15 15:21:41', '', '75392985935646720', '6.00', '0', '新加坡', 'ap-singapore');
INSERT INTO `t_dict_data` VALUES ('75394186202845184', 'admin', '2018-11-15 15:21:56', '0', 'admin', '2018-11-15 15:21:56', '', '75392985935646720', '7.00', '0', '香港', 'ap-hongkong');
INSERT INTO `t_dict_data` VALUES ('75394254255427584', 'admin', '2018-11-15 15:22:12', '0', 'admin', '2018-11-15 15:22:12', '', '75392985935646720', '8.00', '0', '多伦多', 'na-toronto');
INSERT INTO `t_dict_data` VALUES ('75394309125312512', 'admin', '2018-11-15 15:22:25', '0', 'admin', '2018-11-15 15:22:25', '', '75392985935646720', '9.00', '0', '法兰克福', 'eu-frankfurt');
INSERT INTO `t_dict_data` VALUES ('75394367044456448', 'admin', '2018-11-15 15:22:39', '0', 'admin', '2018-11-15 15:22:39', '', '75392985935646720', '10.00', '0', '孟买', 'ap-mumbai');
INSERT INTO `t_dict_data` VALUES ('75394448523005952', 'admin', '2018-11-15 15:22:58', '0', 'admin', '2018-11-15 15:22:58', '', '75392985935646720', '11.00', '0', '首尔', 'ap-seoul');
INSERT INTO `t_dict_data` VALUES ('75394604765024256', 'admin', '2018-11-15 15:23:36', '0', 'admin', '2018-11-15 15:23:36', '', '75392985935646720', '12.00', '0', '硅谷', 'na-siliconvalley');
INSERT INTO `t_dict_data` VALUES ('75394659299364864', 'admin', '2018-11-15 15:23:49', '0', 'admin', '2018-11-15 15:23:49', '', '75392985935646720', '13.00', '0', '弗吉尼亚', 'na-ashburn');
INSERT INTO `t_dict_data` VALUES ('75394705700950016', 'admin', '2018-11-15 15:24:00', '0', 'admin', '2018-11-15 15:24:00', '', '75392985935646720', '14.00', '0', '曼谷', 'ap-bangkok');
INSERT INTO `t_dict_data` VALUES ('75394759287377920', 'admin', '2018-11-15 15:24:12', '0', 'admin', '2018-11-15 15:24:12', '', '75392985935646720', '15.00', '0', '莫斯科', 'eu-moscow');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `f_key` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` longtext,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('123918030634749952', null, '2019-03-29 12:58:22', '0', null, '2019-03-29 12:58:22', '331', '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', '1');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', '0', '', '2018-09-29 23:11:56', '', 'sys', '', '0', '1.00', 'Main', '/sys', '系统管理', 'ios-settings', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', '0', '', '2018-08-13 15:15:33', '', 'user-manage', '5129710648430592', '0', '1.10', 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', '0', '', '2018-10-13 13:51:36', '', 'role-manage', '5129710648430592', '0', '1.60', 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', '0', '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', '0', '1.70', 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41375330996326400', '', '2018-08-13 18:23:08', '0', 'admin', '2018-10-20 22:47:07', '', 'simple-table', '41373430515240960', '0', '3.10', 'xboot-vue-template/simple-table/simpleTable', 'simple-table', '简单表格', 'ios-grid-outline', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', '0', '', '2018-09-19 22:16:44', '', '', '5129710648430593', '1', '1.11', '', '/xboot/user/admin/add*', '添加用户', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', '0', '', '2018-06-06 14:46:51', '', '', '5129710648430593', '1', '1.13', '', '/xboot/user/admin/disable/**', '禁用用户', '', '3', 'disable', '0', null);
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', '0', '', '2018-06-28 16:44:48', '', '', '5129710648430593', '1', '1.14', '', '/xboot/user/admin/enable/**', '启用用户', '', '3', 'enable', '0', null);
INSERT INTO `t_permission` VALUES ('16392767785668608', '', '2018-06-05 19:51:21', '0', 'admin', '2018-10-23 12:34:38', '', 'access_index', '16392452747300864', '0', '5.10', 'access/access', 'index', '权限按钮测试页', 'md-lock', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('16438800255291392', '', '2018-06-05 22:54:18', '0', 'admin', '2018-10-23 12:34:51', '', '', '16392767785668608', '1', '5.11', '', 'test-add', '添加按钮测试', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('16438962738434048', '', '2018-06-05 22:54:55', '0', 'admin', '2018-10-23 12:35:05', '', '', '16392767785668608', '1', '5.12', '', 'test-edit', '编辑按钮测试', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16439068543946752', '', '2018-06-05 22:55:20', '0', 'admin', '2018-10-23 12:34:54', '', '', '16392767785668608', '1', '5.13', '', 'test-delete', '删除按钮测试', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', '0', '', '2018-09-19 22:16:48', '', '', '5129710648430593', '1', '1.12', '', '/xboot/user/admin/edit*', '编辑用户', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', '0', '', '2018-08-10 21:41:16', '', '', '5129710648430593', '1', '1.15', '', '/xboot/user/delByIds/**', '删除用户', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', '0', '', '2018-09-19 22:07:34', '', '', '5129710648430594', '1', '1.21', '', '/xboot/role/save*', '添加角色', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', '0', '', '2018-09-19 22:07:37', '', '', '5129710648430594', '1', '1.22', '', '/xboot/role/edit*', '编辑角色', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', '0', '', '2018-08-10 21:41:23', '', '', '5129710648430594', '1', '1.23', '', '/xboot/role/delAllByIds/**', '删除角色', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('16689883993083904', null, '2018-06-06 15:31:59', '0', null, '2018-06-06 15:31:59', null, null, '5129710648430594', '1', '1.24', null, '/xboot/role/editRolePerm**', '分配权限', null, '3', 'editPerm', '0', null);
INSERT INTO `t_permission` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', '0', '', '2018-09-19 22:07:46', '', '', '5129710648430594', '1', '1.25', '', '/xboot/role/setDefault*', '设为默认角色', '', '3', 'setDefault', '0', '');
INSERT INTO `t_permission` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', '0', '', '2018-09-19 22:07:52', '', '', '5129710648430595', '1', '1.31', '', '/xboot/permission/add*', '添加菜单', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', '0', '', '2018-09-19 22:07:57', '', '', '5129710648430595', '1', '1.32', '', '/xboot/permission/edit*', '编辑菜单', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', '0', '', '2018-08-10 21:41:33', '', '', '5129710648430595', '1', '1.33', '', '/xboot/permission/delByIds/**', '删除菜单', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('41370251991977984', null, '2018-08-13 18:02:57', '0', null, '2018-08-13 18:02:57', null, 'quartz-job', '39915540965232640', '0', '2.10', 'sys/quartz-manage/quartzManage', 'quartz-job', '定时任务', 'md-time', '2', '', '0', null);
INSERT INTO `t_permission` VALUES ('25014528525733888', '', '2018-06-29 14:51:09', '0', '', '2018-10-08 11:13:27', '', '', '5129710648430593', '1', '1.16', '', '无', '上传图片', '', '3', 'upload', '0', '');
INSERT INTO `t_permission` VALUES ('39915540965232640', '', '2018-08-09 17:42:28', '0', '', '2019-03-01 18:20:14', '', 'monitor', '', '0', '3.00', 'Main', '/monitor', '系统监控', 'ios-analytics', '1', '', '0', '');
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', '0', 'admin', '2019-01-20 00:37:29', '', 'druid', '39915540965232640', '0', '2.40', 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', '2', '', '0', 'http://127.0.0.1:8888/druid/login.html');
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', '0', 'admin', '2019-01-20 00:37:41', '', 'swagger', '39915540965232640', '0', '2.50', 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', '2', '', '0', 'http://127.0.0.1:8888/swagger-ui.html');
INSERT INTO `t_permission` VALUES ('40238597734928384', null, '2018-08-10 15:06:10', '0', null, '2018-08-10 15:06:10', null, 'department-manage', '5129710648430592', '0', '1.20', 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', '2', '', '0', null);
INSERT INTO `t_permission` VALUES ('42082442672082944', '', '2018-08-15 17:12:57', '0', 'admin', '2019-02-04 17:03:47', '', 'new-window', '41373430515240960', '0', '3.20', 'xboot-vue-template/new-window/newWindow', 'new-window', '新窗口操作', 'ios-browsers', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', '0', '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', '0', '2.20', 'sys/log-manage/logManage', 'log-manage', '操作日志管理', 'md-list-box', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', '0', '', '2018-08-13 17:56:11', '', '', '41363147411427328', '1', '2.11', '', '/xboot/log/delByIds/**', '删除日志', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', '0', '', '2018-09-19 22:08:57', '', '', '41363147411427328', '1', '2.12', '', '/xboot/log/delAll*', '清空日志', '', '3', 'undefined', '0', '');
INSERT INTO `t_permission` VALUES ('41378916912336896', '', '2018-08-13 18:37:23', '0', 'admin', '2019-02-04 17:04:04', '', 'tree', '41373430515240960', '0', '3.21', 'xboot-vue-template/tree/tree', 'tree', '树形结构', 'ios-git-network', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('41469219249852416', null, '2018-08-14 00:36:13', '0', null, '2018-08-14 00:36:13', null, '', '41371711400054784', '1', '2.31', '', '无', '查看数据', '', '3', 'view', '0', null);
INSERT INTO `t_permission` VALUES ('45069342940860416', '', '2018-08-23 23:01:49', '0', '', '2018-08-24 10:01:09', '', '', '44986029924421632', '1', '1.42', '', '无', '查看社交账号数据', '', '3', 'view', '0', '');
INSERT INTO `t_permission` VALUES ('45235228800716800', '', '2018-08-24 10:01:00', '0', '', '2018-09-19 22:07:23', '', '', '44986029924421632', '1', '1.41', '', '/xboot/relate/delByIds*', '删除解绑', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', '0', '', '2018-09-19 22:06:57', '', '', '40238597734928384', '1', '1.21', '', '/xboot/department/add*', '添加部门', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', '0', '', '2018-09-19 22:07:02', '', '', '40238597734928384', '1', '1.22', '', '/xboot/department/edit*', '编辑部门', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('45235939278065664', null, '2018-08-24 10:03:49', '0', null, '2018-08-24 10:03:49', null, '', '40238597734928384', '1', '1.23', '', '/xboot/department/delByIds/*', '删除部门', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('45236734832676864', '', '2018-08-24 10:06:59', '0', '', '2018-09-19 22:07:07', '', '', '43117268627886080', '1', '1.31', '', '/xboot/message/add*', '添加消息', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('45237010692050944', '', '2018-08-24 10:08:04', '0', '', '2018-09-19 22:07:12', '', '', '43117268627886080', '1', '1.32', '', '/xboot/message/edit*', '编辑消息', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('45237170029465600', null, '2018-08-24 10:08:42', '0', null, '2018-08-24 10:08:42', null, '', '43117268627886080', '1', '1.33', '', '/xboot/message/delByIds/*', '删除消息', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('45264987354042368', '', '2018-08-24 11:59:14', '0', '', '2018-09-19 22:08:11', '', '', '41370251991977984', '1', '2.11', '', '/xboot/quartzJob/add*', '添加定时任务', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('45265487029866496', '', '2018-08-24 12:01:14', '0', '', '2018-09-19 22:08:17', '', '', '41370251991977984', '1', '2.12', '', '/xboot/quartzJob/edit*', '编辑定时任务', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('45265762415284224', '', '2018-08-24 12:02:19', '0', '', '2018-09-19 22:08:24', '', '', '41370251991977984', '1', '2.13', '', '/xboot/quartzJob/pause*', '暂停定时任务', '', '3', 'disable', '0', '');
INSERT INTO `t_permission` VALUES ('45265886315024384', '', '2018-08-24 12:02:49', '0', '', '2018-09-19 22:09:13', '', '', '41370251991977984', '1', '2.14', '', '/xboot/quartzJob/resume*', '恢复定时任务', '', '3', 'enable', '0', '');
INSERT INTO `t_permission` VALUES ('45266070000373760', null, '2018-08-24 12:03:33', '0', null, '2018-08-24 12:03:33', null, '', '41370251991977984', '1', '2.15', '', '/xboot/quartzJob/delByIds/*', '删除定时任务', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', '0', '', '2018-09-25 15:12:46', '', '', '5129710648430593', '1', '1.17', '', '/xboot/user/importData*', '导入用户', '', '3', 'input', '0', '');
INSERT INTO `t_permission` VALUES ('57009544286441472', null, '2018-09-25 21:47:55', '0', null, '2018-09-25 21:47:55', null, '', '43117268627886080', '1', '1.40', '', '/xboot/messageSend/save*', '添加已发送消息', '', '3', 'add', '0', null);
INSERT INTO `t_permission` VALUES ('57009744761589760', null, '2018-09-25 21:48:43', '0', null, '2018-09-25 21:48:43', null, '', '43117268627886080', '1', '1.50', '', '/xboot/messageSend/update*', '编辑已发送消息', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('57009981228060672', null, '2018-09-25 21:49:39', '0', null, '2018-09-25 21:49:39', null, '', '43117268627886080', '1', '1.60', '', '/xboot/messageSend/delByIds/*', '删除已发送消息', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('57212882168844288', '', '2018-09-26 11:15:55', '0', '', '2018-10-08 11:10:05', '', '', '56309618086776832', '1', '1.41', '', '无', '上传文件', '', '3', 'upload', '0', '');
INSERT INTO `t_permission` VALUES ('61394706252173312', null, '2018-10-08 00:12:59', '0', null, '2018-10-08 00:12:59', null, '', '58480609315524608', '1', '1.81', '', '/xboot/setting/seeSecret/**', '查看私密配置', '', '3', 'view', '0', null);
INSERT INTO `t_permission` VALUES ('61417744146370560', '', '2018-10-08 01:44:32', '0', '', '2018-10-08 01:50:03', '', '', '58480609315524608', '1', '1.82', '', '/xboot/setting/*/set*', '编辑配置', '', '3', 'edit', '0', '');
INSERT INTO `t_permission` VALUES ('61560480518377472', null, '2018-10-08 11:11:43', '0', null, '2018-10-08 11:11:43', null, '', '56309618086776832', '1', '1.44', '', '/xboot/file/delete/*', '删除文件', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('61560275261722624', null, '2018-10-08 11:10:54', '0', null, '2018-10-08 11:10:54', null, '', '56309618086776832', '1', '1.43', '', '/xboot/file/copy*', '复制文件', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('61560041605435392', null, '2018-10-08 11:09:58', '0', null, '2018-10-08 11:09:58', null, '', '56309618086776832', '1', '1.42', '', '/xboot/file/rename*', '重命名文件', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('75002207560273920', 'admin', '2018-11-14 13:24:21', '0', 'admin', '2018-11-20 20:06:22', '', 'dict', '5129710648430592', '0', '1.80', 'sys/dict-manage/dictManage', 'dict', '数据字典管理', 'md-bookmarks', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('76215889006956544', 'admin', '2018-11-17 21:47:05', '0', 'admin', '2018-11-17 21:47:53', '', '', '75002207560273920', '1', '1.81', '', '/xboot/dict/add*', '添加字典', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('76216071333351424', 'admin', '2018-11-17 21:47:48', '0', 'admin', '2018-11-17 21:47:48', null, '', '75002207560273920', '1', '1.82', '', '/xboot/dict/edit*', '编辑字典', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('76216264070008832', 'admin', '2018-11-17 21:48:34', '0', 'admin', '2018-11-17 21:48:34', null, '', '75002207560273920', '1', '1.83', '', '/xboot/dict/delByIds/**', '删除字典', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('76216459709124608', 'admin', '2018-11-17 21:49:21', '0', 'admin', '2018-11-17 21:49:21', null, '', '75002207560273920', '1', '1.84', '', '/xboot/dictData/add*', '添加字典数据', '', '3', 'add', '0', null);
INSERT INTO `t_permission` VALUES ('76216594207870976', 'admin', '2018-11-17 21:49:53', '0', 'admin', '2018-11-17 21:49:53', null, '', '75002207560273920', '1', '1.85', '', '/xboot/dictData/edit*', '编辑字典数据', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('76216702639017984', 'admin', '2018-11-17 21:50:18', '0', 'admin', '2018-11-17 21:50:18', null, '', '75002207560273920', '1', '1.86', '', '/xboot/dictData/delByIds/**', '删除字典数据', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84082369492946944', 'admin', '2018-12-09 14:45:40', '0', 'admin', '2018-12-09 14:46:59', '', '', '81558529864896512', '1', '0.00', '', '/xboot/leave/add*', '添加请假申请', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('84082920431554560', 'admin', '2018-12-09 14:47:51', '0', 'admin', '2018-12-09 14:47:51', null, '', '81558529864896512', '1', '1.00', '', '/xboot/actBusiness/delByIds/**', '删除草稿申请', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84083562503999488', 'admin', '2018-12-09 14:50:25', '0', 'admin', '2018-12-09 14:50:25', null, '', '81716172680073216', '1', '0.00', '', '/xboot/actTask/pass**', '审批通过', '', '3', 'enable', '0', null);
INSERT INTO `t_permission` VALUES ('84083641302388736', 'admin', '2018-12-09 14:50:43', '0', 'admin', '2018-12-09 14:50:43', null, '', '81716172680073216', '1', '1.00', '', '/xboot/actTask/back**', '审批驳回', '', '3', 'disable', '0', null);
INSERT INTO `t_permission` VALUES ('84084404707659776', 'admin', '2018-12-09 14:53:45', '0', 'admin', '2018-12-09 14:53:45', null, '', '81716172680073216', '1', '3.00', '', '/xboot/actTask/delegate**', '委托代办', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84084724590448640', 'admin', '2018-12-09 14:55:02', '0', 'admin', '2018-12-09 14:55:02', null, '', '82269650301227008', '1', '0.00', '', '/xboot/actTask/deleteHistoric/**', '删除已办任务', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84084965817454592', 'admin', '2018-12-09 14:55:59', '0', 'admin', '2018-12-09 14:55:59', null, '', '81319435670917120', '1', '0.00', '', '/xboot/actProcess/delInsByIds/**', '删除运行流程', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84085542324539392', 'admin', '2018-12-09 14:58:17', '0', 'admin', '2018-12-09 14:58:17', null, '', '76914082455752704', '1', '0.00', '', '/xboot/actProcess/updateInfo/**', '编辑流程信息', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('84085810797744128', 'admin', '2018-12-09 14:59:21', '0', 'admin', '2018-12-09 14:59:21', null, '', '76914082455752704', '1', '1.00', '', '/xboot/actProcess/editNodeUser**', '流程节点设置', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('84085980943880192', 'admin', '2018-12-09 15:00:01', '0', 'admin', '2018-12-09 15:00:01', null, '', '76914082455752704', '1', '2.00', '', '/xboot/actProcess/convertToModel/**', '流程转模型', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84086163001839616', 'admin', '2018-12-09 15:00:45', '0', 'admin', '2018-12-09 15:01:37', '', '', '76914082455752704', '1', '3.00', '', '/xboot/actProcess/delByIds/**', '删除流程定义', '', '3', 'delete', '0', '');
INSERT INTO `t_permission` VALUES ('84086362248056832', 'admin', '2018-12-09 15:01:32', '0', 'admin', '2018-12-09 15:01:32', null, '', '76914082455752704', '1', '4.00', '', '/xboot/actModel/deployByFile**', '文件部署流程', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84086882907983872', 'admin', '2018-12-09 15:03:36', '0', 'admin', '2018-12-09 15:03:36', null, '', '76607201262702592', '1', '0.00', '', '/xboot/actModel/add**', '添加模型', '', '3', 'add', '0', null);
INSERT INTO `t_permission` VALUES ('84087009940869120', 'admin', '2018-12-09 15:04:06', '0', 'admin', '2018-12-09 15:04:06', null, '', '76607201262702592', '1', '1.00', '', '/xboot/actModel/delByIds/**', '删除模型', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('84087154040377344', 'admin', '2018-12-09 15:04:41', '0', 'admin', '2018-12-09 15:04:41', null, '', '76607201262702592', '1', '2.00', '', '/xboot/actModel/deploy/**', '部署模型', '', '3', 'other', '0', null);
INSERT INTO `t_permission` VALUES ('84087344352727040', 'admin', '2018-12-09 15:05:26', '0', 'admin', '2018-12-09 15:05:33', '', '', '80539147005071360', '1', '0.00', '', '/xboot/actCategory/add**', '添加流程分类', '', '3', 'add', '0', '');
INSERT INTO `t_permission` VALUES ('84087480852156416', 'admin', '2018-12-09 15:05:59', '0', 'admin', '2018-12-09 15:05:59', null, '', '80539147005071360', '1', '1.00', '', '/xboot/actCategory/edit**', '编辑流程分类', '', '3', 'edit', '0', null);
INSERT INTO `t_permission` VALUES ('84087593041399808', 'admin', '2018-12-09 15:06:25', '0', 'admin', '2018-12-09 15:06:25', null, '', '80539147005071360', '1', '2.00', '', '/xboot/actCategory/delByIds/**', '删除流程分类', '', '3', 'delete', '0', null);
INSERT INTO `t_permission` VALUES ('103658022701633536', 'admin', '2019-02-01 15:12:20', '0', 'admin', '2019-02-01 18:38:29', '', 'test', '102235632889237504', '0', '3.00', 'xboot-vue-generator/test', 'test', '代码生成测试页', 'ios-bug', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('104451721685635072', 'admin', '2019-02-03 19:46:12', '0', 'admin', '2019-02-03 19:47:04', '', 'flutter', '104451415484665856', '0', '0.00', 'flutter/flutter', 'flutter', 'XBoot Flutter App', 'md-phone-portrait', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('113603617897844736', 'admin', '2019-03-01 01:52:34', '0', 'admin', '2019-03-01 02:03:15', '', 'library', '113603512293658624', '0', '0.00', 'xboot-library/boot-library', 'library', '第三方依赖工具/组件', 'ios-link', '2', '', '0', '');
INSERT INTO `t_permission` VALUES ('113602342657462272', 'admin', '2019-03-01 01:47:30', '0', 'admin', '2019-03-01 02:03:26', '', 'components', '113602149589454848', '0', '0.00', 'xboot-components/boot-components', 'components', 'XBoot业务组件', 'md-cube', '2', '', '0', '');

-- ----------------------------
-- Table structure for t_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_job`;
CREATE TABLE `t_quartz_job` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_class_name` varchar(255) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_quartz_job
-- ----------------------------
INSERT INTO `t_quartz_job` VALUES ('41065738420621312', '', '2018-08-12 21:52:56', '0', '', '2019-04-01 11:58:31', '0/1 * * * * ? ', '带参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'World', '0');
INSERT INTO `t_quartz_job` VALUES ('41060689401352192', '', '2018-08-12 20:32:52', '0', 'admin', '2018-11-20 09:51:38', '0/1 * * * * ? ', '无参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleJob', '', '-1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', '0', null, '超级管理员 拥有所有权限', '0');
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', '0', '', '普通注册用户 路过看看', '0');
INSERT INTO `t_role` VALUES ('16457350655250432', '', '2018-06-06 00:08:00', 'admin', '2018-11-02 20:42:24', 'ROLE_TEST', '0', null, '测试权限按钮显示', '1');

-- ----------------------------
-- Table structure for t_role_department
-- ----------------------------
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE `t_role_department` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_department
-- ----------------------------
INSERT INTO `t_role_department` VALUES ('70763874256687105', 'admin', '2018-11-02 20:42:43', '0', 'admin', '2018-11-02 20:42:43', '40322777781112832', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874265075712', 'admin', '2018-11-02 20:42:43', '0', 'admin', '2018-11-02 20:42:43', '40322811096469504', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874277658624', 'admin', '2018-11-02 20:42:43', '0', 'admin', '2018-11-02 20:42:43', '40322852833988608', '16457350655250432');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('118525221467590656', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113602149589454848', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221459202048', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '103658022701633536', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525259979689984', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525259992272896', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430593', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260000661504', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '40238597734928384', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525220997828608', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84083562503999488', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221002022912', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84083641302388736', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221014605824', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84084404707659776', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221018800128', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '82269650301227008', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221052354560', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '117806106536841216', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221043965952', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84084965817454592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221035577344', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '81319435670917120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221027188736', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84084724590448640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221060743168', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76914082455752704', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221064937472', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84085542324539392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221077520384', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84085810797744128', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221085908992', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84085980943880192', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221094297600', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84086163001839616', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221102686208', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84086362248056832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221115269120', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76607201262702592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221123657728', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84086882907983872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221127852032', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087009940869120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221136240640', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087154040377344', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221144629248', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '80539147005071360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221153017856', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087344352727040', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221165600768', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087480852156416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221173989376', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84087593041399808', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221182377984', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '39915540965232640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221224321024', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45265886315024384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221211738112', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45265762415284224', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221203349504', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45265487029866496', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221190766592', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41370251991977984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221194960896', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45264987354042368', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221232709632', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45266070000373760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221241098240', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41363147411427328', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221249486848', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41363537456533504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221257875456', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41364927394353152', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221266264064', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41371711400054784', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221274652672', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41469219249852416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221283041280', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '39916171171991552', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221291429888', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '39918482854252544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221299818496', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41373430515240960', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221308207104', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41375330996326400', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221316595712', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '42082442672082944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221324984320', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41378916912336896', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221354344448', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '56911328312299520', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221345955840', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41377034236071936', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221341761536', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '41376192166629376', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221333372928', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '63741744973352960', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221387898880', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '66790433014943744', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221375315968', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '64290663792906240', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221366927360', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '63482475359244288', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221396287488', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '42087054753927168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221400481792', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67027338952445952', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221408870400', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67027909637836800', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221417259008', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67042515441684480', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221425647616', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '67082402312228864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221434036224', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '102235632889237504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221442424832', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '102237605176807424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221450813440', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '102240052523831296', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220540649472', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '15701915807518720', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220528066560', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16678126574637056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220519677952', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '15701400130424832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220507095040', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430593', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220469346304', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220553232384', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '15708892205944832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220565815296', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16678447719911424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220578398208', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '25014528525733888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220586786816', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '56898976661639168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525260009050112', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '43117268627886080', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260021633024', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '57009744761589760', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260030021632', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '56309618086776832', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260042604544', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '44986029924421632', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260050993152', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430594', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260059381760', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '5129710648430595', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525220599369728', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '40238597734928384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220607758336', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235621697949696', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220620341248', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235787867885568', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220628729856', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235939278065664', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220687450112', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57009544286441472', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220674867200', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45237170029465600', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220662284288', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45237010692050944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220649701376', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45236734832676864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220641312768', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '43117268627886080', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220712615936', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '56309618086776832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220695838720', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57009744761589760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220704227328', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57009981228060672', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220725198848', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '57212882168844288', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220733587456', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61560041605435392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220741976064', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61560275261722624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220750364672', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61560480518377472', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220762947584', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '44986029924421632', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220771336192', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45235228800716800', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220779724800', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '45069342940860416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220788113408', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430594', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220796502016', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16687383932047360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220804890624', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16689632049631232', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220813279232', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16689745006432256', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220821667840', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16689883993083904', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220830056448', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16690313745666048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220838445056', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '5129710648430595', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220842639360', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16694861252005888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220851027968', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16695107491205120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220859416576', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16695243126607872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220867805184', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '75002207560273920', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220876193792', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76215889006956544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220888776704', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216071333351424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220897165312', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216264070008832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220905553920', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216459709124608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220913942528', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216594207870976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220918136832', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76216702639017984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220926525440', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '58480609315524608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220939108352', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61394706252173312', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220947496960', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '61417744146370560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220955885568', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '76606430504816640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220964274176', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '81558529864896512', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220972662784', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84082369492946944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220981051392', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '84082920431554560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525220989440000', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '81716172680073216', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525260067770368', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '75002207560273920', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260076158976', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '58480609315524608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260080353280', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '76606430504816640', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260088741888', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '81558529864896512', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260097130496', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '81716172680073216', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260105519104', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '82269650301227008', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260113907712', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '81319435670917120', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260122296320', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '117806106536841216', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260130684928', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '76914082455752704', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260160045056', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '39915540965232640', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260151656448', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '80539147005071360', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260143267840', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '76607201262702592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260197793792', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '39918482854252544', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260189405184', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '39916171171991552', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260181016576', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41371711400054784', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260176822272', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41363147411427328', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260168433664', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41370251991977984', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260222959616', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41378916912336896', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260214571008', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '42082442672082944', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260206182400', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41375330996326400', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260201988096', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41373430515240960', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260290068480', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '42087054753927168', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260281679872', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '66790433014943744', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260273291264', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '64290663792906240', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260264902656', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '63482475359244288', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260256514048', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '56911328312299520', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260248125440', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41377034236071936', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260239736832', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '41376192166629376', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260231348224', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '63741744973352960', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260306845696', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67027909637836800', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260298457088', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67027338952445952', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260340400128', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '102237605176807424', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260332011520', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '102235632889237504', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260323622912', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67082402312228864', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260315234304', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '67042515441684480', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260348788736', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '102240052523831296', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260352983040', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113602149589454848', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260361371648', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113602342657462272', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260369760256', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113603512293658624', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260378148864', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '113603617897844736', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260386537472', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16392452747300864', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260399120384', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16392767785668608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260407508992', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16438800255291392', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260411703296', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16438962738434048', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('118525260420091904', null, '2019-03-14 15:49:25', '0', null, '2019-03-14 15:49:25', '16439068543946752', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('75002588591820806', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '5129710648430592', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588604403712', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '5129710648430593', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588612792320', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '40238597734928384', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588650541056', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '16439068543946752', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588637958144', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '16392767785668608', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588633763840', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '16392452747300864', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588625375232', 'admin', '2018-11-14 13:25:52', '0', 'admin', '2018-11-14 13:25:52', '57009744761589760', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('118525221475979264', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113602342657462272', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221484367872', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113603512293658624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221488562176', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '113603617897844736', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221501145088', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16392452747300864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221509533696', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16392767785668608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221517922304', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16438800255291392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221526310912', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16438962738434048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('118525221534699520', null, '2019-03-14 15:49:16', '0', null, '2019-03-14 15:49:16', '16439068543946752', '496138616573952');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('682265633886208', '', '2018-05-01 16:13:51', 'admin', '2018-11-14 21:52:20', '[\"510000\",\"510100\",\"510104\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', 'test', '2549575805@qq.com', '18782059038', 'Exrick', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '1', '0', '1', 'admin', '0', '40322777781112832', '天府1街', '弱');
INSERT INTO `t_user` VALUES ('124297167375437824', '', '2019-03-30 14:04:55', '', '2019-03-30 14:04:55', '', '', '', '123@qq.com', '13112341234', '', '$2a$10$50nJsvsOw.uzzcjS5tQmgemA4jQtdUZcFEoHNjFgWkgQcGHHzFt4C', '1', '0', '0', 'xxx', '0', '40652338142121984', '', '弱');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('70669807116095488', null, '2018-11-02 14:28:56', '0', null, '2018-11-02 14:28:56', '496138616573952', '682265633886208');

CREATE TABLE `keystone_user` (
  `id` varchar(64) NOT NULL,
  `extra` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `default_project_id` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_active_at` date DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_user_id_domain_id` (`id`,`domain_id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `keystone_project` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `extra` text,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `is_domain` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_project_name_domain_id` (`domain_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


