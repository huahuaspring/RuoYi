/*
Navicat MySQL Data Transfer

Source Server         : jyjclocal
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : ry

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2019-04-16 17:23:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-LC75SUJ1555405039438', '1555406603812', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1555405040000', '-1', '5', 'PAUSED', 'CRON', '1555405039000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1555405040000', '-1', '5', 'PAUSED', 'CRON', '1555405040000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `comId` bigint(20) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('110', '0', '1', '宁江山川', '1', 'spring', '13778193325', 'spring@qq.com', '0', '0', 'spring', '2019-04-09 17:34:04', '', null, '1');
INSERT INTO `sys_dept` VALUES ('111', '110', '1,110', '技术中心', '2', 'haohoa', '13698521475', 'haohao@163.com', '0', '0', 'spring', '2019-04-09 17:36:18', '', null, '1');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 09:38:59');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 10:40:19');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 11:25:05');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 11:25:08');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 15:06:46');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 15:15:50');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 15:31:35');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 15:46:14');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 15:47:22');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 15:49:10');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 16:10:18');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 16:10:24');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 16:28:29');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 17:04:27');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 17:07:27');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 17:07:30');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 17:20:25');
INSERT INTO `sys_logininfor` VALUES ('117', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-04-09 17:20:36');
INSERT INTO `sys_logininfor` VALUES ('118', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-04-09 17:20:46');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 17:20:51');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 17:24:01');
INSERT INTO `sys_logininfor` VALUES ('121', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:24:49');
INSERT INTO `sys_logininfor` VALUES ('122', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 17:24:52');
INSERT INTO `sys_logininfor` VALUES ('123', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 17:29:19');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:29:25');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:29:27');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:29:30');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:29:34');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 17:29:38');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 17:30:09');
INSERT INTO `sys_logininfor` VALUES ('130', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:30:15');
INSERT INTO `sys_logininfor` VALUES ('131', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:30:20');
INSERT INTO `sys_logininfor` VALUES ('132', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:30:25');
INSERT INTO `sys_logininfor` VALUES ('133', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 17:30:28');
INSERT INTO `sys_logininfor` VALUES ('134', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 17:31:43');
INSERT INTO `sys_logininfor` VALUES ('135', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 17:31:48');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 16:41:32');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 19:01:59');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-10 19:24:18');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 19:24:22');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 20:11:14');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-10 20:32:40');
INSERT INTO `sys_logininfor` VALUES ('142', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-04-10 20:32:50');
INSERT INTO `sys_logininfor` VALUES ('143', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-04-10 20:32:58');
INSERT INTO `sys_logininfor` VALUES ('144', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2019-04-10 20:33:08');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 20:33:20');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-10 20:37:11');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 20:37:16');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-10 21:20:15');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-10 21:20:18');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 21:20:24');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-10 21:25:08');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-11 10:21:57');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-11 14:47:57');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-11 15:50:43');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-11 15:57:44');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-11 16:06:11');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-11 16:06:14');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-11 16:20:05');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-11 16:20:08');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-12 09:45:05');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-12 10:45:13');
INSERT INTO `sys_logininfor` VALUES ('162', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-04-12 10:45:20');
INSERT INTO `sys_logininfor` VALUES ('163', 'spring', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-04-12 10:45:33');
INSERT INTO `sys_logininfor` VALUES ('164', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-04-12 10:45:59');
INSERT INTO `sys_logininfor` VALUES ('165', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-04-12 10:46:10');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-12 10:46:15');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-12 10:48:06');
INSERT INTO `sys_logininfor` VALUES ('168', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-12 10:48:22');
INSERT INTO `sys_logininfor` VALUES ('169', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-12 10:51:38');
INSERT INTO `sys_logininfor` VALUES ('170', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-12 10:51:44');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-15 09:40:05');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 09:40:09');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 10:18:22');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 10:28:21');
INSERT INTO `sys_logininfor` VALUES ('175', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 10:28:27');
INSERT INTO `sys_logininfor` VALUES ('176', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 10:29:18');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 10:29:22');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 10:29:36');
INSERT INTO `sys_logininfor` VALUES ('179', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 10:29:47');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 10:46:56');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 10:47:06');
INSERT INTO `sys_logininfor` VALUES ('182', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-15 10:47:11');
INSERT INTO `sys_logininfor` VALUES ('183', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 10:47:15');
INSERT INTO `sys_logininfor` VALUES ('184', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 11:15:41');
INSERT INTO `sys_logininfor` VALUES ('185', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 15:21:39');
INSERT INTO `sys_logininfor` VALUES ('186', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 15:26:10');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 15:26:13');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 15:56:48');
INSERT INTO `sys_logininfor` VALUES ('189', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 15:56:55');
INSERT INTO `sys_logininfor` VALUES ('190', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 15:57:03');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 15:57:08');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 15:57:22');
INSERT INTO `sys_logininfor` VALUES ('193', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 15:57:26');
INSERT INTO `sys_logininfor` VALUES ('194', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 16:04:50');
INSERT INTO `sys_logininfor` VALUES ('195', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 17:08:02');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 17:08:08');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 17:08:26');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-15 17:08:38');
INSERT INTO `sys_logininfor` VALUES ('199', 'spring1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-15 17:08:43');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-16 15:48:45');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-16 16:23:39');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-16 16:59:11');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-16 16:59:14');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2028 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-09 11:21:03', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '部门查询部分', '103', '2', '#', 'F', '0', 'system:dept:list_com', '#', 'spring', '2019-04-09 17:28:58', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '资源池管理', '0', '4', '#', 'M', '0', null, 'fa fa-asterisk', 'admin', '2019-04-10 19:03:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2002', '设备类别管理', '2001', '1', '/sourcepool/dtype', 'C', '0', 'sourcepool:dtype:view', '#', 'admin', '2019-04-10 19:03:59', 'admin', '2019-04-10 19:05:41', '');
INSERT INTO `sys_menu` VALUES ('2003', '设备信息管理', '2001', '2', '/sourcepool/device', 'C', '0', 'sourcepool:device:view', '#', 'admin', '2019-04-10 19:04:38', 'spring1', '2019-04-15 17:09:27', '');
INSERT INTO `sys_menu` VALUES ('2004', '类别查询', '2002', '1', '#', 'F', '0', 'sourcepool:dtype:list', '#', 'admin', '2019-04-10 19:05:28', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '类别增加', '2002', '2', '#', 'F', '0', 'sourcepool:dtype:add', '#', 'admin', '2019-04-10 19:07:58', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '类别修改', '2002', '3', '#', 'F', '0', 'sourcepool:dtype:edit', '#', 'admin', '2019-04-10 19:08:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '类别删除', '2002', '4', '#', 'F', '0', 'sourcepool:dtype:remove', '#', 'admin', '2019-04-10 19:08:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '设备查询', '2003', '1', '#', 'F', '0', 'sourcepool:device:list', '#', 'admin', '2019-04-10 19:09:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '设备增加', '2003', '2', '#', 'F', '0', 'sourcepool:device:add', '#', 'admin', '2019-04-10 19:09:56', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '设备修改', '2003', '3', '#', 'F', '0', 'sourcepool:device:edit', '#', 'admin', '2019-04-10 19:10:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '设备删除', '2003', '4', '#', 'F', '0', 'sourcepool:device:remove', '#', 'admin', '2019-04-10 19:10:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '技术团队管理', '2001', '3', '/sourcepool/techteam', 'C', '0', 'sourcepool:techteam:view', '#', 'admin', '2019-04-15 10:19:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '技术团队查询', '2012', '1', '#', 'F', '0', 'sourcepool:techteam:list', '#', 'admin', '2019-04-15 10:19:48', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '技术团队增加', '2012', '2', '#', 'F', '0', 'sourcepool:techteam:add', '#', 'admin', '2019-04-15 10:20:49', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '技术团队修改', '2012', '3', '#', 'F', '0', 'sourcepool:techteam:edit', '#', 'admin', '2019-04-15 10:21:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '技术团队删除', '2012', '4', '#', 'F', '0', 'sourcepool:techteam:remove', '#', 'admin', '2019-04-15 10:21:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '检测服务项管理', '2001', '4', '/sourcepool/serviceitem', 'C', '0', 'sourcepool:serviceitem:view', '#', 'spring1', '2019-04-15 15:23:33', 'spring1', '2019-04-15 15:23:45', '');
INSERT INTO `sys_menu` VALUES ('2019', '检测服务项', '2018', '1', '#', 'F', '0', 'sourcepool:serviceitem:list', '#', 'spring1', '2019-04-15 15:24:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '检测服务项新增', '2018', '2', '#', 'F', '0', 'sourcepool:serviceitem:add', '#', 'spring1', '2019-04-15 15:24:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '检测服务项编辑', '2018', '3', '#', 'F', '0', 'sourcepool:serviceitem:edit', '#', 'spring1', '2019-04-15 15:25:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '检测服务项删除', '2018', '4', '#', 'F', '0', 'sourcepool:serviceitem:remove', '#', 'spring1', '2019-04-15 15:25:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '检测能力管理', '2001', '5', '/sourcepool/tability', 'C', '0', 'sourcepool:tability:view', '#', 'spring1', '2019-04-15 17:05:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '检测能力查询', '2023', '1', '#', 'F', '0', 'sourcepool:tability:list', '#', 'spring1', '2019-04-15 17:06:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '检测能力添加', '2023', '2', '#', 'F', '0', 'sourcepool:tability:add', '#', 'spring1', '2019-04-15 17:07:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '检测能力编辑', '2023', '3', '#', 'F', '0', 'sourcepool:tability:edit', '#', 'spring1', '2019-04-15 17:07:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2027', '检测能力删除', '2023', '4', '#', 'F', '0', 'sourcepool:tability:remove', '#', 'spring1', '2019-04-15 17:07:59', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1016\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"部门查询\"],\"url\":[\"#\"],\"perms\":[\"system:dept:list_com\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-09 11:06:05');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1016\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"部门查询\"],\"url\":[\"#\"],\"perms\":[\"system:dept:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-09 11:21:03');
INSERT INTO `sys_oper_log` VALUES ('102', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"spring\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"13778193325\"],\"email\":[\"862694536@qq.com\"],\"loginName\":[\"spring\"],\"password\":[\"123456789\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'comId\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.user.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       login_name,       user_name,       email,       phonenumber,       sex,       password,       salt,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,       ?,       ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'comId\' doesn\'t have a default value\n; Field \'comId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'comId\' doesn\'t have a default value', '2019-04-09 17:21:54');
INSERT INTO `sys_oper_log` VALUES ('103', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"spring\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"13778193325\"],\"email\":[\"862694536@qq.com\"],\"loginName\":[\"spring\"],\"password\":[\"123456789\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-04-09 17:23:28');
INSERT INTO `sys_oper_log` VALUES ('104', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'spring', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-04-09 17:26:45');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"部门查询部分\"],\"url\":[\"\"],\"perms\":[\"system:dept:list_com\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-09 17:28:58');
INSERT INTO `sys_oper_log` VALUES ('106', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"\"]}', '0', null, '2019-04-09 17:29:56');
INSERT INTO `sys_oper_log` VALUES ('107', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,2000,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\"]}', '0', null, '2019-04-09 17:30:08');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"资源池管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-asterisk\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:03:12');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"部门类别管理\"],\"url\":[\"/sourcepool/dtype\"],\"perms\":[\"sourcepool:dtype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:03:59');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"设备管理\"],\"url\":[\"/sourcepool/device\"],\"perms\":[\"sourcepool:device:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:04:39');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"类别查询\"],\"url\":[\"\"],\"perms\":[\"sourcepool:dtype:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:05:28');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"设备类别管理\"],\"url\":[\"/sourcepool/dtype\"],\"perms\":[\"sourcepool:dtype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:05:41');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"类别增加\"],\"url\":[\"\"],\"perms\":[\"sourcepool:dtype:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:07:58');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"类别修改\"],\"url\":[\"\"],\"perms\":[\"sourcepool:dtype:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:08:25');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"类别删除\"],\"url\":[\"\"],\"perms\":[\"sourcepool:dtype:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:08:46');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"设备查询\"],\"url\":[\"\"],\"perms\":[\"sourcepool:device:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:09:11');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"设备增加\"],\"url\":[\"\"],\"perms\":[\"sourcepool:device:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:09:56');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"设备修改\"],\"url\":[\"\"],\"perms\":[\"sourcepool:device:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:10:17');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"设备删除\"],\"url\":[\"\"],\"perms\":[\"sourcepool:device:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-10 19:10:44');
INSERT INTO `sys_oper_log` VALUES ('120', '通知公告', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"deviceType\":[\"拉索疲劳试验台 \"],\"typeDesc\":[\"拉索疲劳试验机包括结构系统、动力系统、测量与控制系统等各系统\"]}', '0', null, '2019-04-10 19:41:11');
INSERT INTO `sys_oper_log` VALUES ('121', '通知公告', '2', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.editSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/edit', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"4\"],\"deviceType\":[\"1拉索疲劳试验台 \"],\"typeDesc\":[\"[object Object]\"]}', '0', null, '2019-04-10 20:11:53');
INSERT INTO `sys_oper_log` VALUES ('122', '通知公告', '2', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.editSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/edit', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"4\"],\"deviceType\":[\"1拉索疲劳试验台 \"],\"typeDesc\":[\"[object Object]\"]}', '0', null, '2019-04-10 20:12:13');
INSERT INTO `sys_oper_log` VALUES ('123', '通知公告', '2', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.editSave()', '1', 'admin', null, '/sourcepool/dtype/edit', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"3\"],\"deviceType\":[\"气相色谱仪31\"],\"typeDesc\":[\"[object Object]\"]}', '0', null, '2019-04-10 20:16:28');
INSERT INTO `sys_oper_log` VALUES ('124', '通知设备类型', '2', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.editSave()', '1', 'admin', null, '/sourcepool/dtype/edit', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"4\"],\"deviceType\":[\"1拉索疲劳试验台 \"],\"typeDesc\":[\"123\"]}', '0', null, '2019-04-10 20:22:34');
INSERT INTO `sys_oper_log` VALUES ('125', '通知设备类型', '2', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.editSave()', '1', 'admin', null, '/sourcepool/dtype/edit', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"3\"],\"deviceType\":[\"气相色谱仪31\"],\"typeDesc\":[\"1235\"]}', '0', null, '2019-04-10 20:22:40');
INSERT INTO `sys_oper_log` VALUES ('126', '通知设备类型', '3', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.remove()', '1', 'admin', null, '/sourcepool/dtype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.sys_dtype\' doesn\'t exist\r\n### The error may involve com.ruoyi.project.sourcepool.dtype.mapper.DtypeMapper.deleteDtypeByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_dtype where dtype_id in      (         ?      )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.sys_dtype\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.sys_dtype\' doesn\'t exist', '2019-04-10 20:23:05');
INSERT INTO `sys_oper_log` VALUES ('127', '通知设备类型', '3', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.remove()', '1', 'admin', null, '/sourcepool/dtype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '0', null, '2019-04-10 20:24:16');
INSERT INTO `sys_oper_log` VALUES ('128', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', null, '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"deviceType\":[\"洪梅振动试验机 \"],\"typeDesc\":[\"振动试验机,试验机,动静万能试验机,疲劳试验机,用于各种材质,拉伸,压缩,耐久疲劳,往复疲劳,伸缩疲劳,动静刚度,疲劳寿命等性能试验.\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'insertTime )\n    values (\n      \'洪梅振动试验机 \',  \n     \n      \'振\' at line 5\r\n### The error may involve com.ruoyi.project.sourcepool.dtype.mapper.DtypeMapper.insertDtype-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_dtype (      deviceType,              typeDesc      insertTime )     values (       ?,               ?,      sysdate()       )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'insertTime )\n    values (\n      \'洪梅振动试验机 \',  \n     \n      \'振\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'insertTime )\n    values (\n      \'洪梅振动试验机 \',  \n     \n      \'振\' at line 5', '2019-04-10 20:28:31');
INSERT INTO `sys_oper_log` VALUES ('129', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', null, '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"deviceType\":[\"洪梅振动试验机 \"],\"typeDesc\":[\"振动试验机,试验机,动静万能试验机,疲劳试验机,用于各种材质,拉伸,压缩,耐久疲劳,往复疲劳,伸缩疲劳,动静刚度,疲劳寿命等性能试验.\"]}', '0', null, '2019-04-10 20:29:36');
INSERT INTO `sys_oper_log` VALUES ('130', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', null, '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"deviceType\":[\"洪梅振动试验机 \"],\"typeDesc\":[\"getSysUser().getComId()11111\"]}', '0', null, '2019-04-10 20:32:09');
INSERT INTO `sys_oper_log` VALUES ('131', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"deviceType\":[\"拉索疲劳试验台 \"],\"typeDesc\":[\"getSysUser().getComId()11\"]}', '0', null, '2019-04-10 20:34:06');
INSERT INTO `sys_oper_log` VALUES ('132', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"deviceType\":[\"1\"],\"typeDesc\":[\"1\"]}', '0', null, '2019-04-10 20:37:25');
INSERT INTO `sys_oper_log` VALUES ('133', '通知设备类型', '3', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.remove()', '1', 'admin', '研发部门', '/sourcepool/dtype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '0', null, '2019-04-10 20:38:06');
INSERT INTO `sys_oper_log` VALUES ('134', '通知设备类型', '3', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.remove()', '1', 'admin', '研发部门', '/sourcepool/dtype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '0', null, '2019-04-10 20:38:08');
INSERT INTO `sys_oper_log` VALUES ('135', '通知设备类型', '3', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.remove()', '1', 'admin', '研发部门', '/sourcepool/dtype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '0', null, '2019-04-10 20:38:11');
INSERT INTO `sys_oper_log` VALUES ('136', '通知设备类型', '3', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.remove()', '1', 'admin', '研发部门', '/sourcepool/dtype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '0', null, '2019-04-10 20:38:14');
INSERT INTO `sys_oper_log` VALUES ('137', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"deviceType\":[\"洪梅振动试验机 \"],\"typeDesc\":[\"振动试验机,试验机,动静万能试验机,疲劳试验机,用于各种材质,拉伸,压缩,耐久疲劳,往复疲劳,伸缩疲劳,动静刚度,疲劳寿命等性能试验.\"]}', '0', null, '2019-04-10 20:38:34');
INSERT INTO `sys_oper_log` VALUES ('138', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"1\"],\"deviceName\":[\"2\"],\"deviceSize\":[\"21\"],\"testContent\":[\"212\"],\"deviceSupply\":[\"121212\"],\"deviceStatus\":[\"1\",\"5000\"],\"buyTime\":[\"2015.08.21\"],\"imgUrl\":[\"1212\"]}', '0', null, '2019-04-11 16:09:15');
INSERT INTO `sys_oper_log` VALUES ('139', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"1\"],\"deviceName\":[\"2\"],\"deviceSize\":[\"qw\"],\"testContent\":[\"awe\"],\"deviceSupply\":[\"aw\"],\"deviceStatus\":[\"1\",\"q\"],\"buyTime\":[\"weqe\"],\"imgUrl\":[\"qweqw\"]}', '0', null, '2019-04-11 16:10:02');
INSERT INTO `sys_oper_log` VALUES ('140', '通知设备类型', '1', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.addSave()', '1', 'admin', '研发部门', '/sourcepool/dtype/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"1\"],\"deviceName\":[\"sd\"],\"deviceSize\":[\"sd\"],\"testContent\":[\"1\"],\"deviceSupply\":[\"1\"],\"deviceStatus\":[\"1\",\"1\"],\"buyTime\":[\"1\"],\"imgUrl\":[\"1\"]}', '0', null, '2019-04-11 16:10:40');
INSERT INTO `sys_oper_log` VALUES ('141', '通知设备类型', '3', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.remove()', '1', 'admin', null, '/sourcepool/dtype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10,11,12\"]}', '0', null, '2019-04-11 16:12:49');
INSERT INTO `sys_oper_log` VALUES ('142', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', null, '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"气密性测试仪\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"分辨率：1pa；通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）重量：8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"16000.00\"],\"buyTime\":[\"2017.05.21\"],\"imgUrl\":[\"\"]}', '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2019-04-11 16:17:24');
INSERT INTO `sys_oper_log` VALUES ('143', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', null, '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"气密性测试仪\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"分辨率：1pa；通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）重量：8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"16000.00\"],\"buyTime\":[\"2017.05.21\"],\"imgUrl\":[\"123234324\"]}', '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2019-04-11 16:17:37');
INSERT INTO `sys_oper_log` VALUES ('144', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', null, '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"气密性测试仪\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"分辨率：1pa；通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）重量：8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"16000.00\"],\"buyTime\":[\"2017.05.21\"],\"imgUrl\":[\"123234324\"]}', '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2019-04-11 16:18:31');
INSERT INTO `sys_oper_log` VALUES ('145', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"气密性测试仪\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）；重量:8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"16000.00\"],\"buyTime\":[\"2017.05.27\"],\"imgUrl\":[\"qwe\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'com_id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.sourcepool.device.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_device (      deviceName,              deviceStatus,              imgUrl,       buyTime,       deviceSupply,       deviceSize,       dtype_id,                   testContent,      registerTime     )     values (      ?,              ?,               ?,          ?,        ?,        ?,       ?,                   ?,      sysdate()     )\r\n### Cause: java.sql.SQLException: Field \'com_id\' doesn\'t have a default value\n; Field \'com_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'com_id\' doesn\'t have a default value', '2019-04-11 16:22:33');
INSERT INTO `sys_oper_log` VALUES ('146', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', null, '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"气密性测试仪\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）；重量:8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"16000.00\"],\"buyTime\":[\"2017.05.27\"],\"imgUrl\":[\"qwe\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'buyTime\' at row 1\r\n### The error may involve com.ruoyi.project.sourcepool.device.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_device (      deviceName,              deviceStatus,              imgUrl,       buyTime,       deviceSupply,       deviceSize,       dtype_id,       com_id,             testContent,      registerTime     )     values (      ?,              ?,               ?,          ?,        ?,        ?,       ?,       ?,              ?,      sysdate()     )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'buyTime\' at row 1\n; Data truncation: Data too long for column \'buyTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'buyTime\' at row 1', '2019-04-11 16:24:15');
INSERT INTO `sys_oper_log` VALUES ('147', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', null, '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"气密性测试仪\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）；重量:8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"16000.00\"],\"buyTime\":[\"1\"],\"imgUrl\":[\"qwe\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'buyTime\' at row 1\r\n### The error may involve com.ruoyi.project.sourcepool.device.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_device (      deviceName,              deviceStatus,              imgUrl,       buyTime,       deviceSupply,       deviceSize,       dtype_id,       com_id,             testContent,      registerTime     )     values (      ?,              ?,               ?,          ?,        ?,        ?,       ?,       ?,              ?,      sysdate()     )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'buyTime\' at row 1\n; Data truncation: Data too long for column \'buyTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'buyTime\' at row 1', '2019-04-11 16:24:46');
INSERT INTO `sys_oper_log` VALUES ('148', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', null, '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"气密性测试仪\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）；重量:8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"16000.00\"],\"buyTime\":[\"1\"],\"imgUrl\":[\"qwe\"]}', '0', null, '2019-04-11 16:25:49');
INSERT INTO `sys_oper_log` VALUES ('149', '通知设备类型', '2', 'com.ruoyi.project.sourcepool.dtype.controller.DtypeController.editSave()', '1', 'admin', null, '/sourcepool/dtype/edit', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"2\"],\"deviceType\":[\"气密性测试仪\"],\"typeDesc\":[\"气相色谱仪1\"]}', '0', null, '2019-04-11 16:26:30');
INSERT INTO `sys_oper_log` VALUES ('150', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', null, '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"2\"],\"deviceName\":[\"2\"],\"deviceSize\":[\"2\"],\"testContent\":[\"2\"],\"deviceSupply\":[\"2\"],\"deviceStatus\":[\"1\",\"5000\"],\"buyTime\":[\"3\"],\"imgUrl\":[\"\"]}', '0', null, '2019-04-11 16:33:18');
INSERT INTO `sys_oper_log` VALUES ('151', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"1\"],\"deviceName\":[\"1\"],\"deviceSize\":[\"1\"],\"testContent\":[\"1\"],\"deviceSupply\":[\"1\"],\"deviceStatus\":[\"1\",\"1\"],\"buyTime\":[\"1\"]}', '0', null, '2019-04-12 09:49:08');
INSERT INTO `sys_oper_log` VALUES ('152', '通知公告', '3', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.remove()', '1', 'admin', '研发部门', '/sourcepool/device/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"402892\"]}', '0', null, '2019-04-12 09:51:20');
INSERT INTO `sys_oper_log` VALUES ('153', '通知公告', '3', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.remove()', '1', 'admin', '研发部门', '/sourcepool/device/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"402891\"]}', '0', null, '2019-04-12 09:51:23');
INSERT INTO `sys_oper_log` VALUES ('154', '通知公告', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"5\"],\"deviceName\":[\"5\"],\"deviceSize\":[\"5\"],\"testContent\":[\"5\"],\"deviceSupply\":[\"5\"],\"deviceStatus\":[\"1\",\"5000\"],\"buyTime\":[\"2000\"]}', '0', null, '2019-04-12 09:59:26');
INSERT INTO `sys_oper_log` VALUES ('155', '通知公告', '2', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.editSave()', '1', 'admin', '研发部门', '/sourcepool/device/edit', '127.0.0.1', '内网IP', '{\"device_id\":[\"402890\"],\"dtype_id\":[\"2\"],\"deviceName\":[\"汽车减震器气密性测试仪\"],\"deviceSize\":[\"通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）；重量:8（kg）\"],\"testContent\":[\"它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\\r\\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。\"],\"deviceSupply\":[\"致远\"],\"deviceStatus\":[\"1\",\"1\"],\"buyTime\":[\"1\"],\"imgUrl\":[\"device/2.jpg\"]}', '0', null, '2019-04-12 10:36:27');
INSERT INTO `sys_oper_log` VALUES ('156', '用户管理', '3', 'com.ruoyi.project.system.user.controller.UserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-04-12 10:46:27');
INSERT INTO `sys_oper_log` VALUES ('157', '用户管理', '3', 'com.ruoyi.project.system.user.controller.UserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"100\"]}', '0', null, '2019-04-12 10:46:31');
INSERT INTO `sys_oper_log` VALUES ('158', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"111\"],\"userName\":[\"spring\"],\"deptName\":[\"技术中心\"],\"phonenumber\":[\"17396245871\"],\"email\":[\"17396245871@qq.com\"],\"loginName\":[\"spring1\"],\"password\":[\"123456789\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-04-12 10:47:37');
INSERT INTO `sys_oper_log` VALUES ('159', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,2000,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2001,2002,2004,2005,2006,2007,2003,2008,2009,2010,2011\"]}', '0', null, '2019-04-12 10:48:01');
INSERT INTO `sys_oper_log` VALUES ('160', '通知设备', '1', 'com.ruoyi.project.sourcepool.device.controller.DeviceController.addSave()', '1', 'spring1', '技术中心', '/sourcepool/device/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"弹簧检测\"],\"deviceName\":[\"旭联减震器弹簧试验机\"],\"deviceSize\":[\"最大负荷:10（KN）;测量范围:0-10KN;重量300（kg）;适用范围0-10KN;加工定制:是:\"],\"testContent\":[\"弹簧检测设备能对多种弹簧进行多个项目的检测，主要测试弹簧的刚度，位移及力值，同时也有可能会进行弹簧疲劳性能试验的检测。\\r\\n\\r\\n弹簧测试机的专业产品名称弹簧试验机济南旭联仪器弹簧测试机产品机型：TLY-Z10KN，请看以下产品简介：\\r\\n\\r\\n适用范围：主要用于对拉簧、压簧、塔簧、卡簧、片弹簧、复合弹簧、气弹簧、模具弹簧、异形弹簧等精密弹簧的进行拉力、压力、位移、刚度等强度试验和分析！\"],\"deviceSupply\":[\"旭联\"],\"deviceStatus\":[\"1\",\"18500.00\"],\"buyTime\":[\"2015.02.18\"]}', '0', null, '2019-04-12 10:59:10');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"技术团队管理\"],\"url\":[\"/sourcepool/techteam\"],\"perms\":[\"sourcepool:techteam:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 10:19:07');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"技术团队查询\"],\"url\":[\"\"],\"perms\":[\"sourcepool:techteam:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 10:19:48');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"技术团队增加\"],\"url\":[\"\"],\"perms\":[\"sourcepool:techteam:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 10:20:16');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '{}', '0', null, '2019-04-15 10:20:24');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"技术团队增加\"],\"url\":[\"\"],\"perms\":[\"sourcepool:techteam:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 10:20:49');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"技术团队修改\"],\"url\":[\"\"],\"perms\":[\"sourcepool:techteam:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 10:21:14');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"技术团队删除\"],\"url\":[\"\"],\"perms\":[\"sourcepool:techteam:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 10:21:42');
INSERT INTO `sys_oper_log` VALUES ('168', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,2000,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2001,2002,2004,2005,2006,2007,2003,2008,2009,2010,2011,2012,2013,2015,2016,2017\"]}', '0', null, '2019-04-15 10:29:33');
INSERT INTO `sys_oper_log` VALUES ('169', '通知技术团队', '1', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.addSave()', '1', 'spring1', null, '/sourcepool/techteam/add', '127.0.0.1', '内网IP', '{\"teamName\":[\"北京国实检测团队\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是：\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n　　6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院！\"],\"notes\":[\"北京国实检测技术研究院是为检验检测机构和实验室提供资质认定和认可综合性服务的研究机构。承担资质认定和认可科学研究、标准制定、技术培训、技术咨询、政策解读和国际交流等服务工作。\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'com_id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.sourcepool.techteam.mapper.TechteamMapper.insertTechteam-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_techteam(                teamStructure,         expertiseTechnology,         supportPlatform,         notes,         teamName    )values(                ?,         ?,         ?,         ?,         ?      )\r\n### Cause: java.sql.SQLException: Field \'com_id\' doesn\'t have a default value\n; Field \'com_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'com_id\' doesn\'t have a default value', '2019-04-15 10:42:04');
INSERT INTO `sys_oper_log` VALUES ('170', '通知技术团队', '1', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.addSave()', '1', 'spring1', '技术中心', '/sourcepool/techteam/add', '127.0.0.1', '内网IP', '{\"teamName\":[\"北京国实检测团队\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是：\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院\"],\"notes\":[\"北京国实检测技术研究院是为检验检测机构和实验室提供资质认定和认可综合性服务的研究机构。承担资质认定和认可科学研究、标准制定、技术培训、技术咨询、政策解读和国际交流等服务工作。\"]}', '0', null, '2019-04-15 10:55:54');
INSERT INTO `sys_oper_log` VALUES ('171', '通知技术团队', '2', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.editSave()', '1', 'spring1', '技术中心', '/sourcepool/techteam/edit', '127.0.0.1', '内网IP', '{\"tech_id\":[\"4\"],\"teamName\":[\"北京国实检测团队1\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。1\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是1：\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院1\"],\"notes\":[\"1111111111\"]}', '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'expertiseTechnology != null  expertiseTechnology != \'\'\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: expertiseTechnology != null  expertiseTechnology != \'\' [org.apache.ibatis.ognl.ParseException: Encountered \" <IDENT> \"expertiseTechnology \"\" at line 1, column 30.\r\nWas expecting one of:\r\n    <EOF> \r\n    \",\" ...\r\n    \"=\" ...\r\n    \"?\" ...\r\n    \"||\" ...\r\n    \"or\" ...\r\n    \"&&\" ...\r\n    \"and\" ...\r\n    \"|\" ...\r\n    \"bor\" ...\r\n    \"^\" ...\r\n    \"xor\" ...\r\n    \"&\" ...\r\n    \"band\" ...\r\n    \"==\" ...\r\n    \"eq\" ...\r\n    \"!=\" ...\r\n    \"neq\" ...\r\n    \"<\" ...\r\n    \"lt\" ...\r\n    \">\" ...\r\n    \"gt\" ...\r\n    \"<=\" ...\r\n    \"lte\" ...\r\n    \">=\" ...\r\n    \"gte\" ...\r\n    \"in\" ...\r\n    \"not\" ...\r\n    \"<<\" ...\r\n    \"shl\" ...\r\n    \">>\" ...\r\n    \"shr\" ...\r\n    \">>>\" ...\r\n    \"ushr\" ...\r\n    \"+\" ...\r\n    \"-\" ...\r\n    \"*\" ...\r\n    \"/\" ...\r\n    \"%\" ...\r\n    \"instanceof\" ...\r\n    \".\" ...\r\n    \"(\" ...\r\n    \"[\" ...\r\n    <DYNAMIC_SUBSCRIPT> ...\r\n    ]', '2019-04-15 11:16:27');
INSERT INTO `sys_oper_log` VALUES ('172', '通知技术团队', '2', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.editSave()', '1', 'spring1', '技术中心', '/sourcepool/techteam/edit', '127.0.0.1', '内网IP', '{\"tech_id\":[\"4\"],\"teamName\":[\"北京国实检测团队1\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。1\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是：1\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院1\"],\"notes\":[\"1\"]}', '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'expertiseTechnology != null  expertiseTechnology != \'\'\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: expertiseTechnology != null  expertiseTechnology != \'\' [org.apache.ibatis.ognl.ParseException: Encountered \" <IDENT> \"expertiseTechnology \"\" at line 1, column 30.\r\nWas expecting one of:\r\n    <EOF> \r\n    \",\" ...\r\n    \"=\" ...\r\n    \"?\" ...\r\n    \"||\" ...\r\n    \"or\" ...\r\n    \"&&\" ...\r\n    \"and\" ...\r\n    \"|\" ...\r\n    \"bor\" ...\r\n    \"^\" ...\r\n    \"xor\" ...\r\n    \"&\" ...\r\n    \"band\" ...\r\n    \"==\" ...\r\n    \"eq\" ...\r\n    \"!=\" ...\r\n    \"neq\" ...\r\n    \"<\" ...\r\n    \"lt\" ...\r\n    \">\" ...\r\n    \"gt\" ...\r\n    \"<=\" ...\r\n    \"lte\" ...\r\n    \">=\" ...\r\n    \"gte\" ...\r\n    \"in\" ...\r\n    \"not\" ...\r\n    \"<<\" ...\r\n    \"shl\" ...\r\n    \">>\" ...\r\n    \"shr\" ...\r\n    \">>>\" ...\r\n    \"ushr\" ...\r\n    \"+\" ...\r\n    \"-\" ...\r\n    \"*\" ...\r\n    \"/\" ...\r\n    \"%\" ...\r\n    \"instanceof\" ...\r\n    \".\" ...\r\n    \"(\" ...\r\n    \"[\" ...\r\n    <DYNAMIC_SUBSCRIPT> ...\r\n    ]', '2019-04-15 11:18:09');
INSERT INTO `sys_oper_log` VALUES ('173', '通知技术团队', '2', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.editSave()', '1', 'spring1', null, '/sourcepool/techteam/edit', '127.0.0.1', '内网IP', '{\"tech_id\":[\"4\"],\"teamName\":[\"北京国实检测团队1\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。1\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是1：\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院1\"],\"notes\":[\"1123423543534563456\"]}', '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'teamName != null teamName != \'\'\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: teamName != null teamName != \'\' [org.apache.ibatis.ognl.ParseException: Encountered \" <IDENT> \"teamName \"\" at line 1, column 18.\r\nWas expecting one of:\r\n    <EOF> \r\n    \",\" ...\r\n    \"=\" ...\r\n    \"?\" ...\r\n    \"||\" ...\r\n    \"or\" ...\r\n    \"&&\" ...\r\n    \"and\" ...\r\n    \"|\" ...\r\n    \"bor\" ...\r\n    \"^\" ...\r\n    \"xor\" ...\r\n    \"&\" ...\r\n    \"band\" ...\r\n    \"==\" ...\r\n    \"eq\" ...\r\n    \"!=\" ...\r\n    \"neq\" ...\r\n    \"<\" ...\r\n    \"lt\" ...\r\n    \">\" ...\r\n    \"gt\" ...\r\n    \"<=\" ...\r\n    \"lte\" ...\r\n    \">=\" ...\r\n    \"gte\" ...\r\n    \"in\" ...\r\n    \"not\" ...\r\n    \"<<\" ...\r\n    \"shl\" ...\r\n    \">>\" ...\r\n    \"shr\" ...\r\n    \">>>\" ...\r\n    \"ushr\" ...\r\n    \"+\" ...\r\n    \"-\" ...\r\n    \"*\" ...\r\n    \"/\" ...\r\n    \"%\" ...\r\n    \"instanceof\" ...\r\n    \".\" ...\r\n    \"(\" ...\r\n    \"[\" ...\r\n    <DYNAMIC_SUBSCRIPT> ...\r\n    ]', '2019-04-15 11:19:46');
INSERT INTO `sys_oper_log` VALUES ('174', '通知技术团队', '2', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.editSave()', '1', 'spring1', null, '/sourcepool/techteam/edit', '127.0.0.1', '内网IP', '{\"tech_id\":[\"4\"],\"teamName\":[\"北京国实检测团队1\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。1\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是：1\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院1\"],\"notes\":[\"12134214324325435\"]}', '0', null, '2019-04-15 11:20:22');
INSERT INTO `sys_oper_log` VALUES ('175', '通知技术团队', '2', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.editSave()', '1', 'spring1', null, '/sourcepool/techteam/edit', '127.0.0.1', '内网IP', '{\"tech_id\":[\"4\"],\"teamName\":[\"北京国实检测团队\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是：\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院\"],\"notes\":[\"啊sewer贝多芬个地方\"]}', '0', null, '2019-04-15 11:20:40');
INSERT INTO `sys_oper_log` VALUES ('176', '通知技术团队', '2', 'com.ruoyi.project.sourcepool.techteam.controller.TechteamController.editSave()', '1', 'spring1', null, '/sourcepool/techteam/edit', '127.0.0.1', '内网IP', '{\"tech_id\":[\"4\"],\"teamName\":[\"北京国实检测团队\"],\"teamStructure\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。\"],\"expertiseTechnology\":[\"北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是：\\r\\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\\r\\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\\r\\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\\r\\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\\r\\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\\r\\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;\"],\"supportPlatform\":[\"北京国实检测技术研究院\"],\"notes\":[\"本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。\"]}', '0', null, '2019-04-15 11:21:29');
INSERT INTO `sys_oper_log` VALUES ('177', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', '技术中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"检测服务项管理\"],\"url\":[\"/sourcepool/serviceitem\"],\"perms\":[\"sourcepool:serviceitem:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 15:23:33');
INSERT INTO `sys_oper_log` VALUES ('178', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'spring1', '技术中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"检测服务项管理\"],\"url\":[\"/sourcepool/serviceitem\"],\"perms\":[\"sourcepool:serviceitem:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 15:23:45');
INSERT INTO `sys_oper_log` VALUES ('179', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', '技术中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"检测服务项\"],\"url\":[\"\"],\"perms\":[\"sourcepool:serviceitem:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 15:24:07');
INSERT INTO `sys_oper_log` VALUES ('180', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', '技术中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"检测服务项新增\"],\"url\":[\"\"],\"perms\":[\"sourcepool:serviceitem:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 15:24:40');
INSERT INTO `sys_oper_log` VALUES ('181', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', '技术中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"检测服务项编辑\"],\"url\":[\"\"],\"perms\":[\"sourcepool:serviceitem:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 15:25:13');
INSERT INTO `sys_oper_log` VALUES ('182', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', '技术中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"检测服务项删除\"],\"url\":[\"\"],\"perms\":[\"sourcepool:serviceitem:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 15:25:39');
INSERT INTO `sys_oper_log` VALUES ('183', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,2000,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2001,2002,2004,2005,2006,2007,2003,2008,2009,2010,2011,2012,2013,2015,2016,2017,2018,2019,2020,2021,2022\"]}', '0', null, '2019-04-15 15:57:20');
INSERT INTO `sys_oper_log` VALUES ('184', '通知服务项', '1', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.addSave()', '1', 'spring1', '技术中心', '/sourcepool/serviceitem/add', '127.0.0.1', '内网IP', '{\"dtype_id\":[\"1\"],\"serviceitem\":[\"疲劳测试\"],\"telphone\":[\"17963251850\"],\"tAbli_id\":[\"2\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \n     \n     \'17963251850\', \n     \n     \n     \n     \n   )\' at line 9\r\n### The error may involve com.ruoyi.project.sourcepool.serviceitem.mapper.ServiceitemMapper.insertServiceitem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_serviceitem(                        telphone,                                    )values(                  ?,                             )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \n     \n     \'17963251850\', \n     \n     \n     \n     \n   )\' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \n     \n     \'17963251850\', \n     \n     \n     \n     \n   )\' at line 9', '2019-04-15 16:05:29');
INSERT INTO `sys_oper_log` VALUES ('185', '通知服务项', '1', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.addSave()', '1', 'spring1', null, '/sourcepool/serviceitem/add', '127.0.0.1', '内网IP', '{\"dType_id\":[\"1\"],\"serviceName\":[\"疲劳测试\"],\"telphone\":[\"13778193325\"],\"tAbli_id\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \'疲劳测试\', \n     \n     \'13778193325\', \n     2, \n     1, \n    \' at line 9\r\n### The error may involve com.ruoyi.project.sourcepool.serviceitem.mapper.ServiceitemMapper.insertServiceitem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_serviceitem(        serviceName,                 telphone,         com_id,         dType_id,                    )values(      ?,             ?,       ?,       ?,                 )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \'疲劳测试\', \n     \n     \'13778193325\', \n     2, \n     1, \n    \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \'疲劳测试\', \n     \n     \'13778193325\', \n     2, \n     1, \n    \' at line 9', '2019-04-15 16:09:46');
INSERT INTO `sys_oper_log` VALUES ('186', '通知服务项', '1', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.addSave()', '1', 'spring1', null, '/sourcepool/serviceitem/add', '127.0.0.1', '内网IP', '{\"dType_id\":[\"1\"],\"serviceName\":[\"疲劳测试\"],\"telphone\":[\"17396242175\"],\"tAbli_id\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \'疲劳测试\', \n     \'spring1\', \n     \'17396242175\', \n     2, \n  \' at line 9\r\n### The error may involve com.ruoyi.project.sourcepool.serviceitem.mapper.ServiceitemMapper.insertServiceitem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_serviceitem(        serviceName,         publisher,         telphone,         com_id,         dType_id,                    )values(      ?,       ?,       ?,       ?,       ?,                 )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \'疲劳测试\', \n     \'spring1\', \n     \'17396242175\', \n     2, \n  \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n     \'疲劳测试\', \n     \'spring1\', \n     \'17396242175\', \n     2, \n  \' at line 9', '2019-04-15 16:15:07');
INSERT INTO `sys_oper_log` VALUES ('187', '通知服务项', '1', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.addSave()', '1', 'spring1', null, '/sourcepool/serviceitem/add', '127.0.0.1', '内网IP', '{\"dType_id\":[\"1\"],\"serviceName\":[\"疲劳测试\"],\"telphone\":[\"18952693458\"],\"tAbli_id\":[\"2\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'publishTime\' at row 1\r\n### The error may involve com.ruoyi.project.sourcepool.serviceitem.mapper.ServiceitemMapper.insertServiceitem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_serviceitem (        serviceName,         publisher,         telphone,         com_id,         dType_id,               publishTime    )     values(      ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'publishTime\' at row 1\n; Data truncation: Data too long for column \'publishTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'publishTime\' at row 1', '2019-04-15 16:20:00');
INSERT INTO `sys_oper_log` VALUES ('188', '通知服务项', '1', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.addSave()', '1', 'spring1', null, '/sourcepool/serviceitem/add', '127.0.0.1', '内网IP', '{\"dType_id\":[\"1\"],\"serviceName\":[\"疲劳测试\"],\"telphone\":[\"123456789\"],\"tAbli_id\":[\"1\"]}', '0', null, '2019-04-15 16:21:18');
INSERT INTO `sys_oper_log` VALUES ('189', '通知服务项', '1', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.addSave()', '1', 'spring1', null, '/sourcepool/serviceitem/add', '127.0.0.1', '内网IP', '{\"dType_id\":[\"1\"],\"serviceName\":[\"2\"],\"tAbli_id\":[\"12\"],\"tech_id\":[\"402888\"],\"telphone\":[\"13962584712\"]}', '0', null, '2019-04-15 16:23:52');
INSERT INTO `sys_oper_log` VALUES ('190', '通知服务项', '3', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.remove()', '1', 'spring1', null, '/sourcepool/serviceitem/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '1', 'Invalid bound statement (not found): com.ruoyi.project.sourcepool.serviceitem.mapper.ServiceitemMapper.deleteServiceitemByIds', '2019-04-15 16:23:57');
INSERT INTO `sys_oper_log` VALUES ('191', '通知服务项', '3', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.remove()', '1', 'spring1', null, '/sourcepool/serviceitem/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '1', 'Invalid bound statement (not found): com.ruoyi.project.sourcepool.serviceitem.mapper.ServiceitemMapper.deleteServiceitemByIds', '2019-04-15 16:24:13');
INSERT INTO `sys_oper_log` VALUES ('192', '通知服务项', '3', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.remove()', '1', 'spring1', null, '/sourcepool/serviceitem/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '0', null, '2019-04-15 16:27:47');
INSERT INTO `sys_oper_log` VALUES ('193', '通知服务项', '3', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.remove()', '1', 'spring1', null, '/sourcepool/serviceitem/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '0', null, '2019-04-15 16:28:16');
INSERT INTO `sys_oper_log` VALUES ('194', '通知服务项', '2', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.editSave()', '1', 'spring1', null, '/sourcepool/serviceitem/edit', '127.0.0.1', '内网IP', '{\"serviceItem_id\":[\"2\"],\"serviceName\":[\"性能试验1\"],\"dType_id\":[\"4\"],\"tAbli_id\":[\"1\"],\"techteam.teamName\":[\"压力测试\"],\"telphone\":[\"17396242178\"]}', '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'com_id != null and \'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: com_id != null and  [org.apache.ibatis.ognl.ParseException: Encountered \"<EOF>\" at line 1, column 19.\r\nWas expecting one of:\r\n    \":\" ...\r\n    \"not\" ...\r\n    \"+\" ...\r\n    \"-\" ...\r\n    \"~\" ...\r\n    \"!\" ...\r\n    \"(\" ...\r\n    \"true\" ...\r\n    \"false\" ...\r\n    \"null\" ...\r\n    \"#this\" ...\r\n    \"#root\" ...\r\n    \"#\" ...\r\n    \"[\" ...\r\n    \"{\" ...\r\n    \"@\" ...\r\n    \"new\" ...\r\n    <IDENT> ...\r\n    <DYNAMIC_SUBSCRIPT> ...\r\n    \"\\\'\" ...\r\n    \"`\" ...\r\n    \"\\\"\" ...\r\n    <INT_LITERAL> ...\r\n    <FLT_LITERAL> ...\r\n    ]', '2019-04-15 16:38:35');
INSERT INTO `sys_oper_log` VALUES ('195', '通知服务项', '2', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.editSave()', '1', 'spring1', null, '/sourcepool/serviceitem/edit', '127.0.0.1', '内网IP', '{\"serviceItem_id\":[\"10\"],\"serviceName\":[\"21\"],\"dType_id\":[\"4\"],\"tAbli_id\":[\"12\"],\"techteam.teamName\":[\"耐久测试\"],\"telphone\":[\"1396258471211\"]}', '0', null, '2019-04-15 16:40:53');
INSERT INTO `sys_oper_log` VALUES ('196', '通知服务项', '3', 'com.ruoyi.project.sourcepool.serviceitem.controller.ServiceitemController.remove()', '1', 'spring1', null, '/sourcepool/serviceitem/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '0', null, '2019-04-15 16:41:01');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"检测能力管理\"],\"url\":[\"/sourcepool/tability\"],\"perms\":[\"sourcepool:tability:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 17:05:43');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2023\"],\"menuType\":[\"F\"],\"menuName\":[\"检测能力查询\"],\"url\":[\"\"],\"perms\":[\"sourcepool:tability:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 17:06:30');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2023\"],\"menuType\":[\"F\"],\"menuName\":[\"检测能力添加\"],\"url\":[\"\"],\"perms\":[\"sourcepool:tability:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 17:07:06');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2023\"],\"menuType\":[\"F\"],\"menuName\":[\"检测能力编辑\"],\"url\":[\"\"],\"perms\":[\"sourcepool:tability:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 17:07:37');
INSERT INTO `sys_oper_log` VALUES ('201', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'spring1', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2023\"],\"menuType\":[\"F\"],\"menuName\":[\"检测能力删除\"],\"url\":[\"\"],\"perms\":[\"sourcepool:tability:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 17:07:59');
INSERT INTO `sys_oper_log` VALUES ('202', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,2000,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2001,2002,2004,2005,2006,2007,2003,2008,2009,2010,2011,2012,2013,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027\"]}', '0', null, '2019-04-15 17:08:35');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'spring1', '技术中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"设备信息管理\"],\"url\":[\"/sourcepool/device\"],\"perms\":[\"sourcepool:device:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-15 17:09:27');
INSERT INTO `sys_oper_log` VALUES ('204', '通知检测能力', '1', 'com.ruoyi.project.sourcepool.tability.controller.TabilityController.addSave()', '1', 'admin', null, '/sourcepool/tability/add', '127.0.0.1', '内网IP', '{\"sizeRange\":[\"1\"],\"materialKind\":[\"2\"],\"mainStandard\":[\"3\"],\"otherStandard\":[\"4\"],\"otherinfo\":[\"5\"]}', '1', 'Invalid bound statement (not found): com.ruoyi.project.sourcepool.tability.mapper.TabilityMapper.insertTability', '2019-04-16 16:48:26');
INSERT INTO `sys_oper_log` VALUES ('205', '通知检测能力', '1', 'com.ruoyi.project.sourcepool.tability.controller.TabilityController.addSave()', '1', 'admin', null, '/sourcepool/tability/add', '127.0.0.1', '内网IP', '{\"sizeRange\":[\"123\"],\"materialKind\":[\"33\"],\"mainStandard\":[\"223\"],\"otherStandard\":[\"223\"],\"otherinfo\":[\"222\"]}', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'sizerange\' in \'class com.ruoyi.project.sourcepool.tability.domain.Tability\'', '2019-04-16 16:49:47');
INSERT INTO `sys_oper_log` VALUES ('206', '通知检测能力', '1', 'com.ruoyi.project.sourcepool.tability.controller.TabilityController.addSave()', '1', 'admin', null, '/sourcepool/tability/add', '127.0.0.1', '内网IP', '{\"sizeRange\":[\"q2e\"],\"materialKind\":[\"asd\"],\"mainStandard\":[\"asda\"],\"otherStandard\":[\"asdad\"],\"otherinfo\":[\"asdad\"]}', '0', null, '2019-04-16 16:50:23');
INSERT INTO `sys_oper_log` VALUES ('207', '通知检测能力', '3', 'com.ruoyi.project.sourcepool.tability.controller.TabilityController.remove()', '1', 'admin', null, '/sourcepool/tability/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '1', 'Invalid bound statement (not found): com.ruoyi.project.sourcepool.tability.mapper.TabilityMapper.deleteTabilityByIds', '2019-04-16 16:50:27');
INSERT INTO `sys_oper_log` VALUES ('208', '通知检测能力', '3', 'com.ruoyi.project.sourcepool.tability.controller.TabilityController.remove()', '1', 'admin', null, '/sourcepool/tability/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-04-16 16:52:25');
INSERT INTO `sys_oper_log` VALUES ('209', '通知检测能力', '2', 'com.ruoyi.project.sourcepool.tability.controller.TabilityController.editSave()', '1', 'admin', '研发部门', '/sourcepool/tability/edit', '127.0.0.1', '内网IP', '{\"tAbility_id\":[\"1\"],\"sizeRange\":[\"12\"],\"materialKind\":[\"12222\"],\"mainStandard\":[\"1221222\"],\"otherStandard\":[\"122222\"],\"otherinfo\":[\"12222\"]}', '0', null, '2019-04-16 16:59:31');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 17:08:35', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2001');
INSERT INTO `sys_role_menu` VALUES ('2', '2002');
INSERT INTO `sys_role_menu` VALUES ('2', '2003');
INSERT INTO `sys_role_menu` VALUES ('2', '2004');
INSERT INTO `sys_role_menu` VALUES ('2', '2005');
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('2', '2013');
INSERT INTO `sys_role_menu` VALUES ('2', '2015');
INSERT INTO `sys_role_menu` VALUES ('2', '2016');
INSERT INTO `sys_role_menu` VALUES ('2', '2017');
INSERT INTO `sys_role_menu` VALUES ('2', '2018');
INSERT INTO `sys_role_menu` VALUES ('2', '2019');
INSERT INTO `sys_role_menu` VALUES ('2', '2020');
INSERT INTO `sys_role_menu` VALUES ('2', '2021');
INSERT INTO `sys_role_menu` VALUES ('2', '2022');
INSERT INTO `sys_role_menu` VALUES ('2', '2023');
INSERT INTO `sys_role_menu` VALUES ('2', '2024');
INSERT INTO `sys_role_menu` VALUES ('2', '2025');
INSERT INTO `sys_role_menu` VALUES ('2', '2026');
INSERT INTO `sys_role_menu` VALUES ('2', '2027');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `comId` bigint(20) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-04-16 16:59:14', 'admin', '2018-03-16 11:33:00', 'ry', '2019-04-16 16:59:14', '管理员', '1');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '29c67a30398638269fe600f73a054934', '222222', '0', '2', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员', '2');
INSERT INTO `sys_user` VALUES ('100', '103', 'spring', 'spring', '00', '862694536@qq.com', '13778193325', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '2', '127.0.0.1', '2019-04-09 17:31:48', 'admin', '2019-04-09 17:23:28', '', '2019-04-09 17:31:48', '', '1');
INSERT INTO `sys_user` VALUES ('101', '111', 'spring1', 'spring', '00', '17396245871@qq.com', '17396245871', '1', '', '8c4a090c21fe2e38c9471b52cec69938', '7b6c4a', '0', '0', '127.0.0.1', '2019-04-15 17:08:43', 'admin', '2019-04-12 10:47:37', '', '2019-04-15 17:08:43', '', '2');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('09495197-0237-4dca-b20a-1866f37b8e3c', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-04-16 16:59:07', '2019-04-16 17:03:28', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '4');
INSERT INTO `sys_user_post` VALUES ('101', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '2');
INSERT INTO `sys_user_role` VALUES ('101', '2');

-- ----------------------------
-- Table structure for t_case
-- ----------------------------
DROP TABLE IF EXISTS `t_case`;
CREATE TABLE `t_case` (
  `case_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `com_id` bigint(20) NOT NULL,
  `sbrand_id` bigint(20) DEFAULT NULL,
  `sItem` varchar(100) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL COMMENT '结果展示地址',
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_case
-- ----------------------------

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deviceName` varchar(100) NOT NULL,
  `deviceDesc` varchar(500) DEFAULT NULL,
  `deviceStatus` int(10) NOT NULL DEFAULT '0',
  `devicePrice` double(50,0) DEFAULT '0',
  `imgUrl` varchar(500) DEFAULT NULL,
  `buyTime` varchar(50) DEFAULT NULL,
  `registerTime` varchar(50) DEFAULT NULL,
  `deviceSupply` varchar(200) DEFAULT NULL,
  `dtype_id` varchar(32) DEFAULT NULL,
  `deviceSize` varchar(100) DEFAULT NULL,
  `com_id` bigint(20) NOT NULL,
  `tAbli_id` bigint(20) DEFAULT NULL,
  `testContent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=402895 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES ('1', '虚拟设备22号', '不是虚拟哦				', '1', '2000', 'device/1.jpg', '', '2019-03-14 20:13:53', '天瑞', '1', '100', '2', '1', '147');
INSERT INTO `t_device` VALUES ('2', '虚拟设备39号', '新的首都北京市的			', '1', '8000', 'device/电子王能拉力试验测试机.jpg', '', '2019-03-19 20:03:31', '美纲', '1', '00', '5', '1', '125');
INSERT INTO `t_device` VALUES ('402890', '汽车减震器气密性测试仪', null, '1', '0', 'device/1.jpg', '1', '2019-04-12 10:36:27', '致远', '2', '通讯接口：RS485；存储功能：数据保存/U盘；导出电源：220V；尺寸：367*230*230*（mm）；重量:8（kg）', '2', null, '它采用直压法检测原理，具有高精度测试功能、数据通迅功能、测试数据保存、测试数据U盘导出等功能；并且它是以空气作为介质对产品进行检测，是一款无损检测仪器。\r\n  它以其结构简单、操作方便、经济实用，能短时间检测出微小泄漏的特点，广泛应用于产品零部件的密封性检测。');
INSERT INTO `t_device` VALUES ('402893', '5', null, '1', '0', 'device/电子王能拉力试验测试机.jpg', '2000', '2019-04-12 09:59:26', '5', '5', '5', '1', null, '5');
INSERT INTO `t_device` VALUES ('402894', '旭联减震器弹簧试验机', null, '1', '0', 'device/2.jpg', '2015.02.18', '2019-04-12 10:59:09', '旭联', '弹簧检测', '最大负荷:10（KN）;测量范围:0-10KN;重量300（kg）;适用范围0-10KN;加工定制:是:', '2', null, '弹簧检测设备能对多种弹簧进行多个项目的检测，主要测试弹簧的刚度，位移及力值，同时也有可能会进行弹簧疲劳性能试验的检测。\r\n\r\n弹簧测试机的专业产品名称弹簧试验机济南旭联仪器弹簧测试机产品机型：TLY-Z10KN，请看以下产品简介：\r\n\r\n适用范围：主要用于对拉簧、压簧、塔簧、卡簧、片弹簧、复合弹簧、气弹簧、模具弹簧、异形弹簧等精密弹簧的进行拉力、压力、位移、刚度等强度试验和分析！');

-- ----------------------------
-- Table structure for t_dtype
-- ----------------------------
DROP TABLE IF EXISTS `t_dtype`;
CREATE TABLE `t_dtype` (
  `dtype_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deviceType` varchar(255) DEFAULT NULL,
  `com_id` bigint(20) DEFAULT NULL,
  `insertTime` datetime DEFAULT NULL,
  `typeDesc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`dtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dtype
-- ----------------------------
INSERT INTO `t_dtype` VALUES ('1', '气相色谱仪', '2', '2019-03-23 09:38:10', '测定样品在固定相上的分配系数、活度系数、分子量和比表面积等物理化学常数。一种对混合气体中各组成分进行分析检测的仪器。');
INSERT INTO `t_dtype` VALUES ('2', '气密性测试仪', '1', '2019-04-11 16:26:30', '气相色谱仪1');
INSERT INTO `t_dtype` VALUES ('3', '气相色谱仪31', '2', '2019-04-10 20:22:40', '1235');
INSERT INTO `t_dtype` VALUES ('9', '洪梅振动试验机 ', '1', '2019-04-10 20:38:34', '振动试验机,试验机,动静万能试验机,疲劳试验机,用于各种材质,拉伸,压缩,耐久疲劳,往复疲劳,伸缩疲劳,动静刚度,疲劳寿命等性能试验.');

-- ----------------------------
-- Table structure for t_rability
-- ----------------------------
DROP TABLE IF EXISTS `t_rability`;
CREATE TABLE `t_rability` (
  `id` varchar(32) NOT NULL,
  `companyid` varchar(32) DEFAULT NULL,
  `userRating` varchar(50) DEFAULT NULL,
  `userEvaluation` varchar(1000) DEFAULT NULL,
  `classicCaseid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rability
-- ----------------------------

-- ----------------------------
-- Table structure for t_servicefee
-- ----------------------------
DROP TABLE IF EXISTS `t_servicefee`;
CREATE TABLE `t_servicefee` (
  `fee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `com_id` bigint(20) DEFAULT NULL,
  `sItem_id` bigint(32) DEFAULT NULL COMMENT '服务项目',
  `deliverContent` varchar(200) DEFAULT NULL,
  `costStandard` varchar(1000) DEFAULT NULL,
  `chargeCategory` double DEFAULT NULL COMMENT '计费方式',
  `otherExpenses` double DEFAULT NULL,
  `servicePrice` double DEFAULT NULL,
  `dType_id` bigint(20) DEFAULT NULL COMMENT '设备类型',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_servicefee
-- ----------------------------

-- ----------------------------
-- Table structure for t_serviceitem
-- ----------------------------
DROP TABLE IF EXISTS `t_serviceitem`;
CREATE TABLE `t_serviceitem` (
  `serviceItem_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(200) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `com_id` bigint(32) NOT NULL,
  `device_id` bigint(32) DEFAULT NULL,
  `tech_id` bigint(32) DEFAULT NULL,
  `publishTime` varchar(50) DEFAULT NULL,
  `tAbli_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`serviceItem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_serviceitem
-- ----------------------------
INSERT INTO `t_serviceitem` VALUES ('1', '拉伸性能', '王成文', '17361016759', '5', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('2', '性能试验', '张郭刚', '17396242175', '2', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('3', '强度11试验22', 'admin-user42', '18361016767', '0', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('4', '强度测试1', 'admin-user1', '17361016759', '2', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('5', '耐久测试', 'admin-user3', '15361016759', '5', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('6', '压力动态测试', 'admin-user22', '17361016759', '5', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('7', '滚轴检测', 'admin', '16361016749', '0', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('8', '地盘抗撞测试', 'admin', '17361016759', '0', '402889', '402889', '', null);
INSERT INTO `t_serviceitem` VALUES ('9', '疲劳测试', 'spring1', '123456789', '2', '1', null, '2019-04-15 16:21:17', null);

-- ----------------------------
-- Table structure for t_tability
-- ----------------------------
DROP TABLE IF EXISTS `t_tability`;
CREATE TABLE `t_tability` (
  `materialKind` varchar(255) DEFAULT NULL,
  `tAbility_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sizeRange` varchar(255) DEFAULT NULL,
  `com_id` bigint(20) NOT NULL,
  `mainStandard` varchar(255) DEFAULT NULL,
  `otherStandard` varchar(255) DEFAULT NULL,
  `otherinfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tAbility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tability
-- ----------------------------
INSERT INTO `t_tability` VALUES ('12222', '1', '12', '1', '1221222', '122222', '12222');

-- ----------------------------
-- Table structure for t_techteam
-- ----------------------------
DROP TABLE IF EXISTS `t_techteam`;
CREATE TABLE `t_techteam` (
  `tech_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `com_id` bigint(20) NOT NULL,
  `teamStructure` varchar(1000) DEFAULT NULL,
  `expertiseTechnology` varchar(1000) DEFAULT NULL,
  `supportPlatform` varchar(100) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `teamName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tech_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_techteam
-- ----------------------------
INSERT INTO `t_techteam` VALUES ('1', '1', '恩承科技的研发团队由国际行业领军人物、教授、归国博士、硕士以及从事石油行业多年的资深高级工程师等组成，研发人员占公司总人数的35%以上。		', '成都恩承科技股份有限公司研发团队以研发和设计为基础、	', '西南交通大学', '目前已成功完成4各系列的水处理设备、多项新型井下工具的研发设计、制造及应用，				', '减震器测试');
INSERT INTO `t_techteam` VALUES ('4', '2', '本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。', '北京国实检测技术研究院承担了国家认监委2017年立项的六项认证认可行业标准的制修订工作，该六项标准分别是：\r\n　　1、《检验检测机构资质认定能力评价  防雷检验机构要求》;\r\n　　2、《检验检测机构资质认定能力评价 电气检测机构要求》;\r\n　　3、《检验检测机构资质认定能力评价  环境监测机构要求》;\r\n　　4、《检验检测机构资质认定能力评价  工程检测机构要求》;\r\n　　5、《检验检测机构资质认定能力评价  内部审核要求》;\r\n6、《检验检测机构资质认定能力评价  检验检测机构授权签字人能力要求》;', '北京国实检测技术研究院', '本公司拥有国家级、省级CMA评审员;实验室认可评审员等10余人，教授级高级工程师、实验室、检验机构、资质认定培训教师2余人，主要工作经历(认证认可/检验检测行业相关)及成就丰硕。', '北京国实检测团队');
INSERT INTO `t_techteam` VALUES ('402888', '2', '公司同时还拥有各类型高级职称的专业型人才10多名，有些是具有同行业十多年的行业技术专家,是国内少数既生产设备又开发、研制控制系统的科技型、现代化企业。					', '针对目前直流充电桩的质量和安全问题，智能网联汽车测评工程技术中心（中国软件评测中心重要组成部分），从基本信息、功能性、易用性、可靠性、协议一致性、通信信号质量等方面对直流充电桩进行测评，并给出相关问题统计分析结果，为用户、研发企业、监管部门等提供参考。	测试范围包括基本信息、功能性、易用性、可靠性、协议一致性、通信信号质量等6个方面。				', '长安汽车', '本公司遵照贝恩检测，追求卓越的精 神，踏实做人，专业做事，以振兴中国机动车检测事业为己任，树立中国人自己的品牌。					', '耐久测试');
INSERT INTO `t_techteam` VALUES ('402889', '3', '公司同时还拥有各类型高级职称的专业型人才10多名，有些是具有同行业十多年的行业技术专家,是国内少数既生产设备又开发、研制控制系统的科技型、现代化企业。				', '本公司借鉴了国外同行的先进技术，也总结了国内同行的经验，与吉林大学，湖南大学，华南理工大学等大学进行专业合作，时刻保持技术在行业前沿，所生产的产品得到了众多国内外同行和用户的好评及广泛认同，我们的产品现在已销往全国众多地区的公安车管部门、交通运输部门，汽车制造、维修、销售企业。				', '电子科技大学', '本公司遵照贝恩检测，追求卓越的精 神，踏实做人，专业做事，以振兴中国机动车检测事业为己任，树立中国人自己的品牌。				', '压力测试');

-- ----------------------------
-- Table structure for t_weight
-- ----------------------------
DROP TABLE IF EXISTS `t_weight`;
CREATE TABLE `t_weight` (
  `brand_name` varchar(255) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `weight_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wValue` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`weight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_weight
-- ----------------------------
