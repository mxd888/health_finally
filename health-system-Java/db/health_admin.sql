/*
Navicat MySQL Data Transfer

Source Server         : renYun
Source Server Version : 80022
Source Host           : 150.158.188.102:3306
Source Database       : health_admin

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2021-04-11 09:46:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'com.health.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002F636F6D2E6865616C74682E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001784E9323687874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'iZcydxfu893ydkZ1617977122339', '1618105616417', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1618106400000', '-1', '5', 'WAITING', 'CRON', '1616226539000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002F636F6D2E6865616C74682E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001784E9323687874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'renren', '0 0/30 * * * ?', '0', '参数测试', '2021-03-20 15:39:29');

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1422 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'renren', '0', null, '0', '2021-03-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'renren', '0', null, '6', '2021-03-22 19:30:02');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'renren', '0', null, '2', '2021-03-22 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'renren', '0', null, '1', '2021-03-22 20:21:34');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'renren', '0', null, '0', '2021-03-22 20:22:34');
INSERT INTO `schedule_job_log` VALUES ('16', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '25', '2021-03-22 20:24:16');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'renren', '0', null, '0', '2021-03-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '2', '2021-03-22 20:30:02');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'renren', '0', null, '1', '2021-03-22 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('20', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '21', '2021-03-22 21:00:02');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'renren', '0', null, '1', '2021-03-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('22', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '1', '2021-03-27 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('24', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-27 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('26', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-27 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'renren', '0', null, '4', '2021-03-27 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('28', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '32', '2021-03-27 15:30:02');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('30', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '13', '2021-03-27 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'renren', '0', null, '1', '2021-03-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '37', '2021-03-27 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('34', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-27 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-27 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('38', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-27 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('40', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '15', '2021-03-27 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('42', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-27 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('44', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-27 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'renren', '0', null, '1', '2021-03-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('46', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-27 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('48', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-27 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('50', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '19', '2021-03-27 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('52', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-27 22:30:02');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('54', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-03-27 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'renren', '0', null, '0', '2021-03-27 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('56', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '13', '2021-03-27 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('58', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '25', '2021-03-28 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('60', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-28 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('62', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '25', '2021-03-28 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'renren', '0', null, '1', '2021-03-28 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('64', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('66', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('68', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-28 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-28 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'renren', '0', null, '2', '2021-03-28 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('72', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-28 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-28 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('76', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'renren', '0', null, '1', '2021-03-28 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('78', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'renren', '0', null, '1', '2021-03-28 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('80', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-28 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('82', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '62', '2021-03-28 06:00:02');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('84', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('86', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-28 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('88', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('90', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('92', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('94', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-28 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('96', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-03-28 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('98', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-28 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('100', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-28 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('102', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('104', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-28 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('106', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-28 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('108', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('110', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('112', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-28 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('114', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('116', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-28 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('118', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('120', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-28 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'renren', '0', null, '1', '2021-03-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('122', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'renren', '0', null, '1', '2021-03-28 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('124', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 16:30:02');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('126', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-28 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('128', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('130', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('132', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('134', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('136', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '2', '2021-03-28 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('138', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('140', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('142', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('144', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('146', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('148', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-28 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('150', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-28 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'renren', '0', null, '0', '2021-03-28 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('152', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-28 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'renren', '0', null, '1', '2021-03-29 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('154', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '36', '2021-03-29 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('156', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-29 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('158', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('160', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('162', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-29 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('164', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '20', '2021-03-29 02:30:02');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('166', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-29 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('168', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('170', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-29 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-29 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('174', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('176', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '2', '2021-03-29 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('178', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-29 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('180', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-29 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('182', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-29 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('184', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('186', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-29 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('188', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('190', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-29 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('192', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-03-29 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('194', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('196', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-29 10:30:02');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('198', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-29 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('200', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-29 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('201', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('202', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-29 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('203', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('204', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-29 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('206', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('208', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('210', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-29 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('212', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-29 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('214', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-29 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('215', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('216', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-29 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('217', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('218', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-29 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('219', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('220', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-29 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'renren', '0', null, '1', '2021-03-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('222', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-29 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('224', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '19', '2021-03-29 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('226', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '11', '2021-03-29 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('227', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('228', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('229', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('230', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-29 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('231', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('232', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '11', '2021-03-29 19:30:02');
INSERT INTO `schedule_job_log` VALUES ('233', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('234', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-29 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('235', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('236', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 20:30:02');
INSERT INTO `schedule_job_log` VALUES ('237', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('238', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('239', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('240', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-29 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('241', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('242', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-03-29 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('243', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('244', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-03-29 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('245', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('246', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-29 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('247', '1', 'testTask', 'renren', '0', null, '0', '2021-03-29 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('248', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-29 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('249', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('250', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '19', '2021-03-30 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('251', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('252', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-30 00:30:02');
INSERT INTO `schedule_job_log` VALUES ('253', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('254', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-30 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('255', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('256', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-30 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('257', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('258', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-03-30 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('259', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('260', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-30 02:30:02');
INSERT INTO `schedule_job_log` VALUES ('261', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('262', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('263', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('264', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('265', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('266', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-03-30 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('267', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('268', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('269', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('270', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-30 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('271', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('272', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('273', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('274', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-30 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('275', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('276', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-30 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('277', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('278', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-03-30 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('279', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('280', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-30 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('281', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('282', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('283', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('284', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('285', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('286', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '30', '2021-03-30 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('287', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('288', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '17', '2021-03-30 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('289', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('290', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-03-30 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('291', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('292', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('293', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('294', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '108', '2021-03-30 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('295', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('296', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-30 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('297', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('298', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('299', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('300', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-30 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('301', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('302', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-30 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('303', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('304', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('305', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('306', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('307', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('308', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-30 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('309', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('310', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('311', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('312', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-03-30 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('313', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('314', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-30 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('315', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('316', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-03-30 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('317', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('318', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-30 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('319', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('320', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 17:30:02');
INSERT INTO `schedule_job_log` VALUES ('321', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('322', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-30 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('323', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('324', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('325', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('326', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-30 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('327', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('328', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-30 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('329', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('330', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-03-30 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('331', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('332', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('333', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('334', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('335', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('336', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('337', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('338', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-30 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('339', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('340', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('341', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('342', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-30 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('343', '1', 'testTask', 'renren', '0', null, '0', '2021-03-30 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('344', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-30 23:30:02');
INSERT INTO `schedule_job_log` VALUES ('345', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('346', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '23', '2021-03-31 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('347', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('348', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('349', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('350', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('351', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('352', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('353', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('354', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-03-31 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('355', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('356', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('357', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('358', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('359', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('360', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('361', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('362', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('363', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('364', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('365', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('366', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-31 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('367', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('368', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '16', '2021-03-31 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('369', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('370', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('371', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('372', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('373', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('374', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('375', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('376', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('377', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('378', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-31 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('379', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('380', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('381', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('382', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '14', '2021-03-31 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('383', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('384', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-31 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('385', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('386', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-03-31 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('387', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('388', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('389', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('390', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-31 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('391', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('392', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('393', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('394', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-03-31 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('395', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('396', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '50', '2021-03-31 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('397', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('398', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('399', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('400', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-31 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('401', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('402', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-03-31 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('403', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('404', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('405', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('406', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('407', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('408', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '1', '2021-03-31 15:30:02');
INSERT INTO `schedule_job_log` VALUES ('409', '1', 'testTask', 'renren', '0', null, '1', '2021-03-31 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('410', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('411', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('412', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('413', '1', 'testTask', 'renren', '0', null, '1', '2021-03-31 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('414', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('415', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('416', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '58', '2021-03-31 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('417', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('418', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('419', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('420', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('421', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('422', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('423', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('424', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-03-31 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('425', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('426', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('427', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('428', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('429', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('430', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('431', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('432', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('433', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('434', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('435', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('436', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-03-31 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('437', '1', 'testTask', 'renren', '0', null, '1', '2021-03-31 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('438', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-03-31 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('439', '1', 'testTask', 'renren', '0', null, '0', '2021-03-31 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('440', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-03-31 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('441', '1', 'testTask', 'renren', '0', null, '1', '2021-04-01 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('442', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-04-01 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('443', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('444', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('445', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('446', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '24', '2021-04-01 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('447', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('448', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('449', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('450', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('451', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('452', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('453', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('454', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-01 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('455', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('456', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-01 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('457', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('458', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('459', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('460', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('461', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('462', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('463', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('464', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-01 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('465', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('466', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('467', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('468', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('469', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('470', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('471', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('472', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('473', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('474', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('475', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('476', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-04-01 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('477', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('478', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('479', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('480', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('481', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('482', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('483', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('484', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-01 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('485', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('486', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('487', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('488', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-04-01 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('489', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('490', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-01 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('491', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('492', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '11', '2021-04-01 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('493', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('494', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('495', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('496', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-01 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('497', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('498', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('499', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('500', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('501', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('502', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('503', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('504', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('505', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('506', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('507', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('508', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('509', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('510', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('511', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('512', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-01 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('513', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('514', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-01 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('515', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('516', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('517', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('518', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('519', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('520', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('521', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('522', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('523', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('524', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '15', '2021-04-01 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('525', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('526', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-01 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('527', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('528', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('529', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('530', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-01 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('531', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('532', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '16', '2021-04-01 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('533', '1', 'testTask', 'renren', '0', null, '0', '2021-04-01 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('534', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-04-01 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('535', '1', 'testTask', 'renren', '0', null, '1', '2021-04-01 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('536', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-01 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('537', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('538', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '14', '2021-04-02 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('539', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('540', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('541', '1', 'testTask', 'renren', '0', null, '6', '2021-04-02 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('542', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-04-02 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('543', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('544', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('545', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('546', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('547', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('548', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('549', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('550', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-02 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('551', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('552', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('553', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('554', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('555', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('556', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-02 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('557', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('558', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-02 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('559', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('560', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('561', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('562', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('563', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('564', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-04-02 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('565', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('566', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('567', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('568', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('569', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('570', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('571', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('572', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('573', '1', 'testTask', 'renren', '0', null, '4', '2021-04-02 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('574', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '19', '2021-04-02 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('575', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('576', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('577', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('578', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '2', '2021-04-02 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('579', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('580', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('581', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('582', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('583', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('584', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 11:30:02');
INSERT INTO `schedule_job_log` VALUES ('585', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('586', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('587', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('588', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('589', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('590', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('591', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('592', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('593', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('594', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('595', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('596', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 14:30:03');
INSERT INTO `schedule_job_log` VALUES ('597', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('598', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('599', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('600', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-02 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('601', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('602', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-02 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('603', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('604', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('605', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('606', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('607', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('608', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('609', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('610', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-02 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('611', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('612', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-02 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('613', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('614', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('615', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('616', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('617', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('618', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('619', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('620', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('621', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('622', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('623', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('624', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 21:30:02');
INSERT INTO `schedule_job_log` VALUES ('625', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('626', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('627', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('628', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-02 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('629', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('630', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-02 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('631', '1', 'testTask', 'renren', '0', null, '0', '2021-04-02 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('632', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-02 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('633', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('634', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '16', '2021-04-03 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('635', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('636', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('637', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('638', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('639', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('640', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('641', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('642', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-03 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('643', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('644', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-03 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('645', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('646', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('647', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('648', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-03 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('649', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('650', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('651', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('652', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-03 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('653', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('654', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('655', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('656', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('657', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('658', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-03 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('659', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('660', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('661', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('662', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('663', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('664', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-03 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('665', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('666', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('667', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('668', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('669', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('670', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('671', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('672', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-03 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('673', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('674', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('675', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('676', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '15', '2021-04-03 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('677', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('678', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-03 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('679', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('680', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('681', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('682', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-03 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('683', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('684', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('685', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('686', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-03 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('687', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('688', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('689', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('690', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('691', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('692', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('693', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('694', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '16', '2021-04-03 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('695', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('696', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('697', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('698', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('699', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('700', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('701', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('702', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('703', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('704', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('705', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('706', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('707', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('708', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('709', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('710', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('711', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('712', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('713', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('714', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('715', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('716', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('717', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('718', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-03 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('719', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('720', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('721', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('722', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('723', '1', 'testTask', 'renren', '0', null, '1', '2021-04-03 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('724', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-03 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('725', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('726', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-03 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('727', '1', 'testTask', 'renren', '0', null, '0', '2021-04-03 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('728', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-03 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('729', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('730', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '20', '2021-04-04 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('731', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('732', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('733', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('734', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('735', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('736', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('737', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('738', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('739', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('740', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('741', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('742', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('743', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('744', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('745', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('746', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('747', '1', 'testTask', 'renren', '0', null, '1', '2021-04-04 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('748', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-04 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('749', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('750', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('751', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('752', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-04-04 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('753', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('754', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('755', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('756', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('757', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('758', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-04 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('759', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('760', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('761', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('762', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-04 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('763', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('764', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('765', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('766', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('767', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('768', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('769', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('770', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('771', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('772', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('773', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('774', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('775', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('776', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('777', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('778', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('779', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('780', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-04 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('781', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('782', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('783', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('784', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('785', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('786', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('787', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('788', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('789', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('790', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('791', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('792', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('793', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('794', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('795', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('796', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-04 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('797', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('798', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('799', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('800', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('801', '1', 'testTask', 'renren', '0', null, '1', '2021-04-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('802', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-04 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('803', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('804', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('805', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('806', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('807', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('808', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('809', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('810', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-04 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('811', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('812', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('813', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('814', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-04 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('815', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('816', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('817', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('818', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-04 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('819', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('820', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('821', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('822', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-04 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('823', '1', 'testTask', 'renren', '0', null, '0', '2021-04-04 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('824', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-04 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('825', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('826', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '21', '2021-04-05 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('827', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('828', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-05 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('829', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('830', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-05 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('831', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('832', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-05 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('833', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('834', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('835', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('836', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('837', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('838', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '16', '2021-04-05 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('839', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('840', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('841', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('842', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('843', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('844', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('845', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('846', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('847', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('848', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '11', '2021-04-05 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('849', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('850', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('851', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('852', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('853', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('854', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('855', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('856', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-05 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('857', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('858', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('859', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('860', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 08:30:02');
INSERT INTO `schedule_job_log` VALUES ('861', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('862', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-05 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('863', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('864', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('865', '1', 'testTask', 'renren', '0', null, '1', '2021-04-05 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('866', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('867', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('868', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-05 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('869', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('870', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-05 11:00:02');
INSERT INTO `schedule_job_log` VALUES ('871', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('872', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('873', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('874', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-05 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('875', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('876', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('877', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('878', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('879', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('880', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-05 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('881', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('882', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('883', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('884', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-05 14:30:02');
INSERT INTO `schedule_job_log` VALUES ('885', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('886', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('887', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('888', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('889', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('890', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('891', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('892', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-05 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('893', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('894', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-05 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('895', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('896', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('897', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('898', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-05 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('899', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('900', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('901', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('902', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('903', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('904', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('905', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('906', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('907', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('908', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('909', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('910', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('911', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('912', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('913', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('914', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-05 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('915', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('916', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-05 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('917', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('918', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('919', '1', 'testTask', 'renren', '0', null, '0', '2021-04-05 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('920', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-05 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('921', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('922', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '20', '2021-04-06 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('923', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('924', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('925', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('926', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('927', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('928', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('929', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('930', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('931', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('932', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('933', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('934', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('935', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('936', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('937', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('938', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-06 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('939', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('940', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('941', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('942', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('943', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('944', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('945', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('946', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('947', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('948', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('949', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('950', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-06 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('951', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('952', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('953', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('954', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('955', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('956', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('957', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('958', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-06 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('959', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('960', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('961', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('962', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('963', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('964', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('965', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('966', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('967', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('968', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '11', '2021-04-06 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('969', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('970', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-06 12:00:02');
INSERT INTO `schedule_job_log` VALUES ('971', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('972', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('973', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('974', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('975', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('976', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('977', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('978', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-06 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('979', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('980', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-06 14:30:02');
INSERT INTO `schedule_job_log` VALUES ('981', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('982', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('983', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('984', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('985', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('986', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-06 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('987', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('988', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-06 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('989', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('990', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-06 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('991', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('992', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('993', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('994', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-06 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('995', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('996', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('997', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('998', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-06 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('999', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1000', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('1001', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1002', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '11', '2021-04-06 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('1003', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1004', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-06 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('1005', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1006', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('1007', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1008', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('1009', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1010', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('1011', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1012', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-06 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('1013', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1014', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-06 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('1015', '1', 'testTask', 'renren', '0', null, '0', '2021-04-06 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1016', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-06 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('1017', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('1018', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-04-07 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('1019', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1020', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('1021', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1022', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('1023', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1024', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('1025', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1026', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('1027', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1028', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-07 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('1029', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1030', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('1031', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1032', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('1033', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1034', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-07 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('1035', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1036', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('1037', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1038', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-07 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('1039', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1040', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-07 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('1041', '1', 'testTask', 'renren', '0', null, '1', '2021-04-07 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1042', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('1043', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1044', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('1045', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1046', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('1047', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1048', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('1049', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1050', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-07 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('1051', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1052', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('1053', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1054', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('1055', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1056', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('1057', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1058', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('1059', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('1060', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('1061', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1062', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('1063', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1064', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '15', '2021-04-07 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('1065', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1066', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('1067', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1068', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('1069', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1070', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('1071', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1072', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('1073', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1074', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('1075', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1076', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('1077', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1078', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('1079', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1080', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('1081', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1082', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('1083', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1084', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-07 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('1085', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1086', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('1087', '1', 'testTask', 'renren', '0', null, '1', '2021-04-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1088', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('1089', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1090', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('1091', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1092', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('1093', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1094', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('1095', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1096', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('1097', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1098', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-07 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('1099', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1100', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('1101', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1102', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('1103', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1104', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('1105', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1106', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('1107', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1108', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('1109', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1110', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-07 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('1111', '1', 'testTask', 'renren', '0', null, '0', '2021-04-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1112', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-07 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('1113', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1114', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '17', '2021-04-08 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('1115', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1116', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('1117', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1118', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('1119', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1120', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('1121', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1122', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('1123', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1124', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('1125', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1126', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-08 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('1127', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1128', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('1129', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1130', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('1131', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1132', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('1133', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1134', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('1135', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1136', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('1137', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1138', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('1139', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1140', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('1141', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1142', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('1143', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1144', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('1145', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1146', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('1147', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1148', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('1149', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1150', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('1151', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1152', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('1153', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1154', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('1155', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1156', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('1157', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1158', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('1159', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1160', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('1161', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1162', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('1163', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1164', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('1165', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1166', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('1167', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1168', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-08 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('1169', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1170', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('1171', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1172', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('1173', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1174', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('1175', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1176', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('1177', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1178', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('1179', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1180', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('1181', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1182', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-08 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('1183', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1184', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('1185', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1186', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('1187', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1188', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('1189', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1190', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('1191', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1192', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('1193', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('1194', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('1195', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1196', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('1197', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1198', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('1199', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1200', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('1201', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1202', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-08 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('1203', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1204', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-08 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('1205', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1206', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-08 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('1207', '1', 'testTask', 'renren', '0', null, '0', '2021-04-08 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1208', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-08 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('1209', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1210', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '12', '2021-04-09 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('1211', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1212', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('1213', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1214', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('1215', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1216', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('1217', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1218', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-09 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('1219', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1220', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-09 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('1221', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1222', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('1223', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1224', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('1225', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1226', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-09 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('1227', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1228', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-09 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('1229', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1230', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-09 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('1231', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1232', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('1233', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1234', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('1235', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1236', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('1237', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1238', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-09 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('1239', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1240', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('1241', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1242', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('1243', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1244', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('1245', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1246', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('1247', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1248', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-09 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('1249', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1250', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('1251', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1252', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('1253', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1254', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('1255', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1256', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('1257', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1258', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('1259', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1260', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('1261', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1262', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('1263', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1264', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-09 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('1265', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1266', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('1267', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1268', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '9', '2021-04-09 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('1269', '1', 'testTask', 'renren', '0', null, '1', '2021-04-09 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1270', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('1271', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1272', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '21', '2021-04-09 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('1273', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1274', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-09 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('1275', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1276', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('1277', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1278', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('1279', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1280', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('1281', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1282', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-09 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('1283', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1284', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('1285', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1286', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('1287', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1288', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('1289', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1290', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-09 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('1291', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1292', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('1293', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1294', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('1295', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1296', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('1297', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1298', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-09 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('1299', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1300', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-09 22:30:02');
INSERT INTO `schedule_job_log` VALUES ('1301', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1302', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('1303', '1', 'testTask', 'renren', '0', null, '0', '2021-04-09 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1304', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-09 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('1305', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1306', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-10 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('1307', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1308', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '8', '2021-04-10 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('1309', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1310', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('1311', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1312', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('1313', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1314', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-10 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('1315', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1316', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('1317', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1318', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-10 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('1319', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('1320', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('1321', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1322', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '10', '2021-04-10 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('1323', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1324', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('1325', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1326', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-10 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('1327', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1328', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-10 05:30:02');
INSERT INTO `schedule_job_log` VALUES ('1329', '1', 'testTask', 'renren', '0', null, '1', '2021-04-10 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1330', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('1331', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1332', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-10 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('1333', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1334', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('1335', '1', 'testTask', 'renren', '0', null, '1', '2021-04-10 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1336', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('1337', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1338', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('1339', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 08:21:09');
INSERT INTO `schedule_job_log` VALUES ('1340', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1341', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-10 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('1342', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1343', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('1344', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1345', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('1346', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1347', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('1348', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1349', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-10 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('1350', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1351', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-10 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('1352', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1353', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('1354', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1355', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-10 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('1356', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1357', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('1358', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1359', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('1360', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1361', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('1362', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1363', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('1364', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1365', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-10 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('1366', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1367', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '23', '2021-04-10 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('1368', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1369', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-10 15:30:02');
INSERT INTO `schedule_job_log` VALUES ('1370', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1371', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('1372', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1373', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '3', '2021-04-10 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('1374', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1375', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('1376', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1377', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('1378', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1379', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '5', '2021-04-10 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('1380', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1381', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('1382', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1383', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '7', '2021-04-10 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('1384', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1385', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('1386', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1387', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('1388', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1389', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('1390', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1391', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '6', '2021-04-10 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('1392', '1', 'testTask', 'renren', '0', null, '1', '2021-04-10 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1393', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('1394', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1395', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('1396', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '4', '2021-04-10 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1397', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1398', '1', 'testTask', 'renren', '0', null, '0', '2021-04-10 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1399', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '0', '2021-04-10 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1400', '1', 'testTask', 'renren', '0', null, '1', '2021-04-10 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1401', '2', 'huiTest', 'dami', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'huiTest\' available', '18', '2021-04-10 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('1402', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('1403', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('1404', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1405', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1406', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1407', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1408', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('1409', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1410', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1411', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1412', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1413', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1414', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1415', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1416', '1', 'testTask', 'renren', '0', null, '1', '2021-04-11 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1417', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1418', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1419', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1420', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1421', '1', 'testTask', 'renren', '0', null, '0', '2021-04-11 09:30:00');

-- ----------------------------
-- Table structure for `sys_captcha`
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('01eed269-321c-4ef9-8df3-0170592adccc', 'be3pe', '2021-04-09 21:59:53');
INSERT INTO `sys_captcha` VALUES ('156655e4-1f9a-45ad-8187-7d1ed8bf548e', 'adppm', '2021-03-20 18:15:49');
INSERT INTO `sys_captcha` VALUES ('33e3cffb-2617-4c39-8abe-ea5539b7b23f', 'mewdf', '2021-04-09 22:11:11');
INSERT INTO `sys_captcha` VALUES ('376832ca-914b-40ae-8f55-6a415e0cda0b', '7w2y2', '2021-03-20 23:05:18');
INSERT INTO `sys_captcha` VALUES ('3eb4923c-0b87-4a5c-843d-ddad5607b4a9', '7d578', '2021-04-10 07:42:58');
INSERT INTO `sys_captcha` VALUES ('49b164a0-0be9-4921-8a54-f634a3a6a1d9', '53n2n', '2021-03-20 23:00:57');
INSERT INTO `sys_captcha` VALUES ('4c112a11-6169-4850-83e5-544ca705ab8d', '7egwb', '2021-03-20 18:17:52');
INSERT INTO `sys_captcha` VALUES ('56800eb7-7b21-46ea-8838-c1f9ed6de313', 'yn67n', '2021-03-20 20:25:55');
INSERT INTO `sys_captcha` VALUES ('5c759237-54e7-48e4-85e6-33234204db1a', 'byemw', '2021-03-27 17:22:47');
INSERT INTO `sys_captcha` VALUES ('74a2c0c3-6a00-407f-8697-072a27485ddb', '5w72d', '2021-03-22 21:50:26');
INSERT INTO `sys_captcha` VALUES ('8334c393-33e4-4c75-84b5-e0e8d372cfa2', 'xceeg', '2021-03-22 22:16:00');
INSERT INTO `sys_captcha` VALUES ('841dcc5d-5883-46db-8347-27f1a81fbbba', 'dnnep', '2021-03-20 19:53:07');
INSERT INTO `sys_captcha` VALUES ('86345c88-062a-41ad-802d-323b9ec4160d', '3f8ne', '2021-03-22 20:18:31');
INSERT INTO `sys_captcha` VALUES ('8ace8f5b-8d17-4268-8c81-576aaafd10f4', 'fd87n', '2021-04-10 23:39:44');
INSERT INTO `sys_captcha` VALUES ('90b4e066-84f8-4f3e-83a6-1152b69fa4bc', 'm2m62', '2021-03-20 19:50:34');
INSERT INTO `sys_captcha` VALUES ('93570501-1c18-47e3-8055-f2720e9075b2', 'dffan', '2021-03-20 19:54:39');
INSERT INTO `sys_captcha` VALUES ('97a62607-0c42-4d6d-89d5-2b680c227ab2', 'n4na7', '2021-03-22 20:20:28');
INSERT INTO `sys_captcha` VALUES ('a21ad959-90c7-4024-86ca-61e2208c8de7', 'ny3ym', '2021-04-10 23:49:50');
INSERT INTO `sys_captcha` VALUES ('a2fd4f88-3abb-4522-8523-f8aa1948bd43', '5ddn5', '2021-03-20 19:51:50');
INSERT INTO `sys_captcha` VALUES ('a318840e-84d6-490d-8c31-f9a1c7725e7a', 'd75c4', '2021-04-09 22:14:06');
INSERT INTO `sys_captcha` VALUES ('a43e5bb2-33a6-499e-8b51-9d1cfb200916', 'n3gxn', '2021-03-20 19:43:55');
INSERT INTO `sys_captcha` VALUES ('aaaa154b-36d3-4cb6-8e2e-d50643c1d163', 'w52xd', '2021-03-20 18:15:38');
INSERT INTO `sys_captcha` VALUES ('bf6aa18e-46e5-41d2-8ebc-157e1673eae9', 'gw6nb', '2021-03-20 17:50:40');
INSERT INTO `sys_captcha` VALUES ('c351cb5d-78bc-4f00-85ef-27788682b670', 'd7ed4', '2021-03-20 18:18:25');
INSERT INTO `sys_captcha` VALUES ('c5c9b2cd-0e1a-4849-82da-78a647b469f0', 'wx7ye', '2021-03-20 19:43:51');
INSERT INTO `sys_captcha` VALUES ('c7872ad6-0e59-4c2e-8cff-537451c2a16a', 'nda26', '2021-03-20 19:51:03');
INSERT INTO `sys_captcha` VALUES ('d17b35d6-76db-463a-8923-892781c5aaa8', '784ag', '2021-03-20 19:43:57');
INSERT INTO `sys_captcha` VALUES ('d3738a07-bb89-4ec4-87a8-ad4459d00a49', 'yndc6', '2021-03-20 17:20:19');
INSERT INTO `sys_captcha` VALUES ('e9636d77-c0a4-4df1-8a50-c9dbdcf43fc3', '8ebab', '2021-03-22 22:15:42');
INSERT INTO `sys_captcha` VALUES ('f0851131-d990-4491-8f81-a0d94b3ac0c7', 'f42dc', '2021-03-27 17:06:57');
INSERT INTO `sys_captcha` VALUES ('f6f76ff5-8f21-4c26-8d79-cf9901ec9522', 'c8wad', '2021-04-09 22:16:10');
INSERT INTO `sys_captcha` VALUES ('fd3b6486-9c7f-4d32-8a13-a53c96a4d540', '4m8ne', '2021-03-27 15:05:47');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存用户', 'com.health.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"dami\",\"password\":\"5e2329edbcf84a63872cd756068d524ac13719c70cc6d2fa3f77aa92a592cb92\",\"salt\":\"O2biy2KXKwL5AW0vEX4P\",\"email\":\"119199828@qq.com\",\"mobile\":\"17320688183\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Mar 20, 2021 6:15:06 PM\"}]', '772', '0:0:0:0:0:0:0:1', '2021-03-20 18:15:07');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"医生管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0}]', '171', '0:0:0:0:0:0:0:1', '2021-03-20 18:30:37');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"医生详情\",\"url\":\"/yisheng\",\"perms\":\"sys:create,sys:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '259', '0:0:0:0:0:0:0:1', '2021-03-20 18:32:47');
INSERT INTO `sys_log` VALUES ('4', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"医生详情\",\"url\":\"sys/yisheng\",\"perms\":\"sys:create,sys:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '234', '0:0:0:0:0:0:0:1', '2021-03-20 18:33:20');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"运动管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":0}]', '167', '0:0:0:0:0:0:0:1', '2021-03-20 18:34:57');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"运动详情\",\"url\":\"sys/yundong\",\"perms\":\"user:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '532', '0:0:0:0:0:0:0:1', '2021-03-20 18:35:36');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', '68', '0:0:0:0:0:0:0:1', '2021-03-20 20:00:25');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":35,\"name\":\"用户详情\",\"url\":\"sys/user\",\"perms\":\"user:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '111', '0:0:0:0:0:0:0:1', '2021-03-20 20:01:09');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":0,\"name\":\"评价管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"pinglun\",\"orderNum\":0}]', '171', '0:0:0:0:0:0:0:1', '2021-03-20 20:02:52');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"评价详情\",\"url\":\"sys/pingjia\",\"perms\":\"user:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '138', '0:0:0:0:0:0:0:1', '2021-03-20 20:03:25');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改用户', 'com.health.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"dami\",\"salt\":\"O2biy2KXKwL5AW0vEX4P\",\"email\":\"119199828@qq.com\",\"mobile\":\"17320688183\",\"status\":0,\"roleIdList\":[],\"createUserId\":1}]', '263', '0:0:0:0:0:0:0:1', '2021-03-20 20:12:58');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改用户', 'com.health.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"dami\",\"salt\":\"O2biy2KXKwL5AW0vEX4P\",\"email\":\"119199828@qq.com\",\"mobile\":\"17320688183\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', '235', '0:0:0:0:0:0:0:1', '2021-03-20 20:13:57');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存角色', 'com.health.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"副管理\",\"remark\":\"无\",\"createUserId\":1,\"menuIdList\":[5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,-666666,1],\"createTime\":\"Mar 20, 2021 8:15:36 PM\"}]', '1791', '0:0:0:0:0:0:0:1', '2021-03-20 20:15:38');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存角色', 'com.health.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"小管理\",\"remark\":\"无系统管理\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,-666666],\"createTime\":\"Mar 20, 2021 8:16:41 PM\"}]', '1148', '0:0:0:0:0:0:0:1', '2021-03-20 20:16:43');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存角色', 'com.health.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"医生\",\"remark\":\"无医生管理\",\"createUserId\":1,\"menuIdList\":[33,34,35,36,37,38,-666666],\"createTime\":\"Mar 20, 2021 8:17:16 PM\"}]', '715', '0:0:0:0:0:0:0:1', '2021-03-20 20:17:17');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改用户', 'com.health.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"dami\",\"salt\":\"O2biy2KXKwL5AW0vEX4P\",\"email\":\"119199828@qq.com\",\"mobile\":\"17320688183\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '316', '0:0:0:0:0:0:0:1', '2021-03-20 20:17:58');
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改用户', 'com.health.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@dami.com\",\"mobile\":\"17320688184\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', '271', '0:0:0:0:0:0:0:1', '2021-03-20 20:18:33');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存角色', 'com.health.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":4,\"roleName\":\"高级管理员\",\"remark\":\"最高权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,-666666],\"createTime\":\"Mar 20, 2021 8:19:11 PM\"}]', '2784', '0:0:0:0:0:0:0:1', '2021-03-20 20:19:15');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改用户', 'com.health.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@dami.com\",\"mobile\":\"17320688184\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1}]', '288', '0:0:0:0:0:0:0:1', '2021-03-20 20:19:31');
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"医生详情\",\"url\":\"yisheng/yisheng\",\"perms\":\"sys:create,sys:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '383', '0:0:0:0:0:0:0:1', '2021-03-20 21:45:41');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"医生详情\",\"url\":\"yisheng/yisheng\",\"perms\":\"sys:doctor:list,sys:doctor:info,sys:doctor:save,sys:doctor:update,sys:doctor:delete,\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '255', '0:0:0:0:0:0:0:1', '2021-03-20 21:51:06');
INSERT INTO `sys_log` VALUES ('22', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"医生详情\",\"url\":\"yisheng/yisheng\",\"perms\":\"sys:doctor:list,sys:doctor:info\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '103', '0:0:0:0:0:0:0:1', '2021-03-20 21:51:50');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"医生详情\",\"url\":\"yisheng/yisheng\",\"perms\":\"sys:doctor:list,sys:doctor:info\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', '515', '0:0:0:0:0:0:0:1', '2021-03-20 21:52:12');
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"运动详情\",\"url\":\"sys/yundong\",\"perms\":\"user:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":1}]', '112', '0:0:0:0:0:0:0:1', '2021-03-20 21:52:23');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":35,\"name\":\"用户详情\",\"url\":\"sys/user\",\"perms\":\"user:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '11793', '0:0:0:0:0:0:0:1', '2021-03-20 21:52:53');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":35,\"name\":\"用户详情\",\"url\":\"sys/user\",\"perms\":\"user:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', '1657', '0:0:0:0:0:0:0:1', '2021-03-20 21:52:54');
INSERT INTO `sys_log` VALUES ('27', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"评价详情\",\"url\":\"sys/pingjia\",\"perms\":\"user:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', '223', '0:0:0:0:0:0:0:1', '2021-03-20 21:53:14');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"sys:doctor:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '111', '0:0:0:0:0:0:0:1', '2021-03-20 22:18:38');
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"sys:doctor:info,sys:doctor:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '281', '0:0:0:0:0:0:0:1', '2021-03-20 22:19:45');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":32,\"name\":\"删除\",\"url\":\"\",\"perms\":\"sys:doctor:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '104', '0:0:0:0:0:0:0:1', '2021-03-20 22:27:05');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存医生', 'com.health.modules.sys.controller.SysDoctorController.save()', '[{\"yishengId\":2,\"username\":\"大米\",\"password\":\"119\",\"createTime\":\"Mar 20, 2021 10:37:45 PM\"}]', '328', '0:0:0:0:0:0:0:1', '2021-03-20 22:37:45');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":32,\"name\":\"修改\",\"url\":\"\",\"perms\":\"sys:doctor:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '98', '0:0:0:0:0:0:0:1', '2021-03-20 22:39:08');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改医生', 'com.health.modules.sys.controller.SysDoctorController.update()', '[{\"username\":\"小米\"}]', '982', '0:0:0:0:0:0:0:1', '2021-03-20 22:40:11');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改医生', 'com.health.modules.sys.controller.SysDoctorController.update()', '[{\"username\":\"小米\",\"password\":\"123\"}]', '541', '0:0:0:0:0:0:0:1', '2021-03-20 22:40:43');
INSERT INTO `sys_log` VALUES ('35', 'admin', '修改医生', 'com.health.modules.sys.controller.SysDoctorController.update()', '[{\"yishengId\":2,\"username\":\"小米\"}]', '308', '0:0:0:0:0:0:0:1', '2021-03-20 22:42:00');
INSERT INTO `sys_log` VALUES ('36', 'admin', '修改医生', 'com.health.modules.sys.controller.SysDoctorController.update()', '[{\"yishengId\":2,\"username\":\"小米\",\"password\":\"120\"}]', '764', '0:0:0:0:0:0:0:1', '2021-03-20 22:42:13');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存医生', 'com.health.modules.sys.controller.SysDoctorController.save()', '[{\"yishengId\":3,\"username\":\"玩吧单\",\"password\":\"a\",\"createTime\":\"Mar 20, 2021 10:42:30 PM\"}]', '163', '0:0:0:0:0:0:0:1', '2021-03-20 22:42:31');
INSERT INTO `sys_log` VALUES ('38', 'admin', '删除医生', 'com.health.modules.sys.controller.SysDoctorController.delete()', '[[3]]', '104', '0:0:0:0:0:0:0:1', '2021-03-20 22:42:39');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":0,\"name\":\"心理管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"xiangqu\",\"orderNum\":0}]', '67', '0:0:0:0:0:0:0:1', '2021-03-20 22:45:37');
INSERT INTO `sys_log` VALUES ('40', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"心理详情\",\"url\":\"xinli-xinli\",\"perms\":\"\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":1}]', '103', '0:0:0:0:0:0:0:1', '2021-03-20 22:46:28');
INSERT INTO `sys_log` VALUES ('41', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"心理详情\",\"url\":\"xinli/xinli\",\"perms\":\"\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":1}]', '102', '0:0:0:0:0:0:0:1', '2021-03-20 22:46:59');
INSERT INTO `sys_log` VALUES ('42', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":0,\"name\":\"体检管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"sousuo\",\"orderNum\":0}]', '71', '0:0:0:0:0:0:0:1', '2021-03-20 22:47:36');
INSERT INTO `sys_log` VALUES ('43', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":44,\"name\":\"体检详情\",\"url\":\"tijian/tijian\",\"perms\":\"\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":1}]', '102', '0:0:0:0:0:0:0:1', '2021-03-20 22:48:03');
INSERT INTO `sys_log` VALUES ('44', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"生活管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":0}]', '76', '0:0:0:0:0:0:0:1', '2021-03-20 22:48:42');
INSERT INTO `sys_log` VALUES ('45', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":46,\"name\":\"生活详情\",\"url\":\"shenghuo/shenghuo\",\"perms\":\"\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":1}]', '120', '0:0:0:0:0:0:0:1', '2021-03-20 22:49:10');
INSERT INTO `sys_log` VALUES ('46', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":0,\"name\":\"疾病管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"role\",\"orderNum\":0}]', '77', '0:0:0:0:0:0:0:1', '2021-03-20 22:49:47');
INSERT INTO `sys_log` VALUES ('47', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":48,\"name\":\"疾病详情\",\"url\":\"jibing/jibing\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":1}]', '114', '0:0:0:0:0:0:0:1', '2021-03-20 22:50:08');
INSERT INTO `sys_log` VALUES ('48', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"副管理\",\"remark\":\"无\",\"createUserId\":1,\"menuIdList\":[5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,39,40,41,33,34,35,36,37,38,42,43,44,45,46,47,48,49,-666666,1]}]', '2463', '0:0:0:0:0:0:0:1', '2021-03-20 22:50:56');
INSERT INTO `sys_log` VALUES ('49', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"高级管理员\",\"remark\":\"最高权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,39,40,41,33,34,35,36,37,38,42,43,44,45,46,47,48,49,-666666]}]', '3618', '0:0:0:0:0:0:0:1', '2021-03-20 22:51:16');
INSERT INTO `sys_log` VALUES ('50', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"医生\",\"remark\":\"无医生管理\",\"createUserId\":1,\"menuIdList\":[33,34,35,36,37,38,42,43,44,45,48,49,-666666]}]', '1080', '0:0:0:0:0:0:0:1', '2021-03-20 22:51:34');
INSERT INTO `sys_log` VALUES ('51', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"小管理\",\"remark\":\"无系统管理\",\"createUserId\":1,\"menuIdList\":[31,32,39,40,41,33,34,35,36,37,38,42,43,44,45,46,47,48,49,-666666]}]', '1607', '0:0:0:0:0:0:0:1', '2021-03-20 22:51:52');
INSERT INTO `sys_log` VALUES ('52', 'admin', '保存医生', 'com.health.modules.sys.controller.SysDoctorController.save()', '[{\"yishengId\":4,\"username\":\"佳浩\",\"password\":\"156\",\"createTime\":\"Mar 20, 2021 10:54:26 PM\"}]', '174', '0:0:0:0:0:0:0:1', '2021-03-20 22:54:26');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改医生', 'com.health.modules.sys.controller.SysDoctorController.update()', '[{\"yishengId\":4,\"username\":\"傻傻\"}]', '164', '0:0:0:0:0:0:0:1', '2021-03-20 22:54:41');
INSERT INTO `sys_log` VALUES ('54', 'admin', '删除医生', 'com.health.modules.sys.controller.SysDoctorController.delete()', '[[4]]', '87', '0:0:0:0:0:0:0:1', '2021-03-20 22:55:01');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存医生', 'com.health.modules.sys.controller.SysDoctorController.save()', '[{\"yishengId\":5,\"username\":\"1\",\"password\":\"1\",\"createTime\":\"Mar 20, 2021 10:57:45 PM\"}]', '171', '0:0:0:0:0:0:0:1', '2021-03-20 22:57:45');
INSERT INTO `sys_log` VALUES ('56', 'admin', '保存医生', 'com.health.modules.sys.controller.SysDoctorController.save()', '[{\"yishengId\":6,\"username\":\"12\",\"password\":\"2\",\"createTime\":\"Mar 20, 2021 10:57:56 PM\"}]', '609', '0:0:0:0:0:0:0:1', '2021-03-20 22:57:57');
INSERT INTO `sys_log` VALUES ('57', 'admin', '保存医生', 'com.health.modules.sys.controller.SysDoctorController.save()', '[{\"yishengId\":7,\"username\":\"3\",\"password\":\"3\",\"createTime\":\"Mar 20, 2021 10:58:05 PM\"}]', '165', '0:0:0:0:0:0:0:1', '2021-03-20 22:58:06');
INSERT INTO `sys_log` VALUES ('58', 'admin', '删除医生', 'com.health.modules.sys.controller.SysDoctorController.delete()', '[[null,null]]', '67', '0:0:0:0:0:0:0:1', '2021-03-20 22:58:16');
INSERT INTO `sys_log` VALUES ('59', 'admin', '删除医生', 'com.health.modules.sys.controller.SysDoctorController.delete()', '[[6,7]]', '101', '0:0:0:0:0:0:0:1', '2021-03-20 22:59:59');
INSERT INTO `sys_log` VALUES ('60', 'admin', '删除医生', 'com.health.modules.sys.controller.SysDoctorController.delete()', '[[5]]', '74', '0:0:0:0:0:0:0:1', '2021-03-20 23:00:10');
INSERT INTO `sys_log` VALUES ('61', 'dami', '立即执行任务', 'com.health.modules.job.controller.ScheduleJobController.run()', '[[1]]', '1588', '0:0:0:0:0:0:0:1', '2021-03-22 20:21:32');
INSERT INTO `sys_log` VALUES ('62', 'dami', '立即执行任务', 'com.health.modules.job.controller.ScheduleJobController.run()', '[[1]]', '635', '0:0:0:0:0:0:0:1', '2021-03-22 20:22:33');
INSERT INTO `sys_log` VALUES ('63', 'dami', '保存定时任务', 'com.health.modules.job.controller.ScheduleJobController.save()', '[{\"jobId\":2,\"beanName\":\"huiTest\",\"params\":\"dami\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"测试\",\"createTime\":\"Mar 22, 2021 8:24:04 PM\"}]', '938', '0:0:0:0:0:0:0:1', '2021-03-22 20:24:05');
INSERT INTO `sys_log` VALUES ('64', 'dami', '立即执行任务', 'com.health.modules.job.controller.ScheduleJobController.run()', '[[2]]', '596', '0:0:0:0:0:0:0:1', '2021-03-22 20:24:15');
INSERT INTO `sys_log` VALUES ('65', 'dami', '保存医生', 'com.health.modules.sys.controller.SysDoctorController.save()', '[{\"yishengId\":8,\"username\":\"傻傻\",\"password\":\"123\",\"createTime\":\"Mar 22, 2021 8:27:55 PM\"}]', '250', '0:0:0:0:0:0:0:1', '2021-03-22 20:27:56');
INSERT INTO `sys_log` VALUES ('66', 'dami', '修改医生', 'com.health.modules.sys.controller.SysDoctorController.update()', '[{\"yishengId\":8,\"username\":\"111\"}]', '364', '0:0:0:0:0:0:0:1', '2021-03-22 20:28:34');
INSERT INTO `sys_log` VALUES ('67', 'dami', '删除医生', 'com.health.modules.sys.controller.SysDoctorController.delete()', '[[8]]', '194', '0:0:0:0:0:0:0:1', '2021-03-22 20:28:56');
INSERT INTO `sys_log` VALUES ('68', 'admin', '修改用户', 'com.health.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"dami\",\"salt\":\"O2biy2KXKwL5AW0vEX4P\",\"email\":\"119199828@qq.com\",\"mobile\":\"17320688183\",\"status\":0,\"roleIdList\":[1],\"createUserId\":1}]', '425', '0:0:0:0:0:0:0:1', '2021-03-22 20:32:36');
INSERT INTO `sys_log` VALUES ('69', 'admin', '修改用户', 'com.health.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"dami\",\"salt\":\"O2biy2KXKwL5AW0vEX4P\",\"email\":\"119199828@qq.com\",\"mobile\":\"17320688183\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '569', '0:0:0:0:0:0:0:1', '2021-03-22 20:36:05');
INSERT INTO `sys_log` VALUES ('70', 'admin', '保存角色', 'com.health.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":5,\"roleName\":\"辉哥权限\",\"remark\":\"广辉专用\",\"createUserId\":1,\"menuIdList\":[3,19,20,21,22,4,23,24,25,26,-666666,1],\"createTime\":\"Mar 22, 2021 8:37:17 PM\"}]', '1654', '0:0:0:0:0:0:0:1', '2021-03-22 20:37:19');
INSERT INTO `sys_log` VALUES ('71', 'admin', '保存用户', 'com.health.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"lgh\",\"password\":\"14e92f26c3a1c601c7e86f0f2af88f15cdee7cb9139ae9c0e138de214bd0f7e2\",\"salt\":\"gyXpcabNxzkdXKMvrth9\",\"email\":\"123@qq.com\",\"mobile\":\"13722823135\",\"status\":1,\"roleIdList\":[5],\"createUserId\":1,\"createTime\":\"Mar 22, 2021 8:38:46 PM\"}]', '387', '0:0:0:0:0:0:0:1', '2021-03-22 20:38:47');
INSERT INTO `sys_log` VALUES ('72', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":0,\"name\":\"体检\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"bianji\",\"orderNum\":0}]', '579', '0:0:0:0:0:0:0:1', '2021-03-22 20:58:14');
INSERT INTO `sys_log` VALUES ('73', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"病因\",\"url\":\"tj/by\",\"perms\":\"sys:list\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":1}]', '128', '0:0:0:0:0:0:0:1', '2021-03-22 21:01:35');
INSERT INTO `sys_log` VALUES ('74', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":50,\"name\":\"ttt\",\"url\":\"bin/ll\",\"perms\":\"sys:list\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":2}]', '178', '0:0:0:0:0:0:0:1', '2021-03-22 21:04:16');
INSERT INTO `sys_log` VALUES ('75', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[50]', '432', '0:0:0:0:0:0:0:1', '2021-03-22 21:09:17');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":48,\"name\":\"疾病详情\",\"url\":\"jibing/jibing\",\"perms\":\"code:jibing:list,code:jibing:info,\",\"type\":1,\"icon\":\"role\",\"orderNum\":1}]', '137', '0:0:0:0:0:0:0:1', '2021-03-27 11:56:07');
INSERT INTO `sys_log` VALUES ('77', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":49,\"name\":\"新增\",\"url\":\"\",\"perms\":\"code:jibing:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '207', '0:0:0:0:0:0:0:1', '2021-03-27 11:57:24');
INSERT INTO `sys_log` VALUES ('78', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":49,\"name\":\"删除\",\"url\":\"\",\"perms\":\"code:jibing:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '209', '0:0:0:0:0:0:0:1', '2021-03-27 11:57:47');
INSERT INTO `sys_log` VALUES ('79', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":49,\"name\":\"修改\",\"url\":\"\",\"perms\":\"code:jibing:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '171', '0:0:0:0:0:0:0:1', '2021-03-27 11:58:06');
INSERT INTO `sys_log` VALUES ('80', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":48,\"name\":\"疾病详情\",\"url\":\"jibing/jibing\",\"perms\":\"code:jibing:list,code:jibing:info,code:jibing:save\",\"type\":1,\"icon\":\"role\",\"orderNum\":1}]', '133', '0:0:0:0:0:0:0:1', '2021-03-27 11:59:22');
INSERT INTO `sys_log` VALUES ('81', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":48,\"name\":\"疾病详情\",\"url\":\"jibing/jibing\",\"perms\":\"code:jibing:list,code:jibing:info,code:jibing:save,code:jibing:delete\",\"type\":1,\"icon\":\"role\",\"orderNum\":1}]', '702', '0:0:0:0:0:0:0:1', '2021-03-27 11:59:47');
INSERT INTO `sys_log` VALUES ('82', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":50,\"parentId\":0,\"name\":\"体检管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"bianji\",\"orderNum\":0}]', '82', '0:0:0:0:0:0:0:1', '2021-03-27 12:06:11');
INSERT INTO `sys_log` VALUES ('83', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[52]', '370', '0:0:0:0:0:0:0:1', '2021-03-27 12:06:23');
INSERT INTO `sys_log` VALUES ('84', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"病因\",\"url\":\"tijian/tijian\",\"perms\":\"sys:list\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":1}]', '120', '0:0:0:0:0:0:0:1', '2021-03-27 12:07:05');
INSERT INTO `sys_log` VALUES ('85', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"病因\",\"url\":\"tijian/tijian\",\"perms\":\"code:tijian:save,code:tijian:list,code:tijian:info,code:tijian:delete\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":1}]', '156', '0:0:0:0:0:0:0:1', '2021-03-27 12:08:01');
INSERT INTO `sys_log` VALUES ('86', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":51,\"name\":\"新增\",\"url\":\"\",\"perms\":\"code:tijian:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '117', '0:0:0:0:0:0:0:1', '2021-03-27 12:08:37');
INSERT INTO `sys_log` VALUES ('87', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":51,\"name\":\"删除\",\"url\":\"\",\"perms\":\"code:jibing:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '126', '0:0:0:0:0:0:0:1', '2021-03-27 12:08:54');
INSERT INTO `sys_log` VALUES ('88', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":51,\"name\":\"修改\",\"url\":\"\",\"perms\":\"code:jibing:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '127', '0:0:0:0:0:0:0:1', '2021-03-27 12:09:15');
INSERT INTO `sys_log` VALUES ('89', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[45]', '204', '0:0:0:0:0:0:0:1', '2021-03-27 12:10:23');
INSERT INTO `sys_log` VALUES ('90', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[44]', '195', '0:0:0:0:0:0:0:1', '2021-03-27 12:10:32');
INSERT INTO `sys_log` VALUES ('91', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"体检中心\",\"url\":\"tijian/tijian\",\"perms\":\"code:tijian:save,code:tijian:list,code:tijian:info,code:tijian:delete\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":1}]', '116', '0:0:0:0:0:0:0:1', '2021-03-27 12:25:39');
INSERT INTO `sys_log` VALUES ('92', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"体检中心\",\"url\":\"tijian/tijian\",\"perms\":\"code:tijian:save,code:tijian:list,code:tijian:info,code:tijian:delete\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":1}]', '112', '0:0:0:0:0:0:0:1', '2021-03-27 12:26:25');
INSERT INTO `sys_log` VALUES ('93', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"心理详情\",\"url\":\"xinli/xinli\",\"perms\":\"code:xinli:save,code:xinli:list,code:xinli:info,code:xinli:delete\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":1}]', '113', '0:0:0:0:0:0:0:1', '2021-03-27 12:26:56');
INSERT INTO `sys_log` VALUES ('94', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":43,\"name\":\"新增\",\"url\":\"\",\"perms\":\"code:xinli:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '117', '0:0:0:0:0:0:0:1', '2021-03-27 12:27:38');
INSERT INTO `sys_log` VALUES ('95', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":60,\"parentId\":43,\"name\":\"删除\",\"url\":\"\",\"perms\":\"code:xinli:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '123', '0:0:0:0:0:0:0:1', '2021-03-27 12:27:59');
INSERT INTO `sys_log` VALUES ('96', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":61,\"parentId\":43,\"name\":\"修改\",\"url\":\"\",\"perms\":\"code:xinli:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '111', '0:0:0:0:0:0:0:1', '2021-03-27 12:28:24');
INSERT INTO `sys_log` VALUES ('97', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"评价详情\",\"url\":\"pingjia/pingjia\",\"perms\":\"code:tdpingjia:save,code:tdpingjia:list,code:tdpingjia:info,code:tdpingjia:delete\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', '114', '0:0:0:0:0:0:0:1', '2021-03-27 12:39:41');
INSERT INTO `sys_log` VALUES ('98', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"评价详情\",\"url\":\"tdpingjia/tdpingjia\",\"perms\":\"code:tdpingjia:save,code:tdpingjia:list,code:tdpingjia:info,code:tdpingjia:delete\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', '114', '0:0:0:0:0:0:0:1', '2021-03-27 12:40:20');
INSERT INTO `sys_log` VALUES ('99', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":62,\"parentId\":38,\"name\":\"新增\",\"url\":\"\",\"perms\":\"code:tdpingjia:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '206', '0:0:0:0:0:0:0:1', '2021-03-27 12:41:20');
INSERT INTO `sys_log` VALUES ('100', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":63,\"parentId\":38,\"name\":\"更新\",\"url\":\"\",\"perms\":\"code:tdpingjia:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '113', '0:0:0:0:0:0:0:1', '2021-03-27 12:41:44');
INSERT INTO `sys_log` VALUES ('101', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":64,\"parentId\":38,\"name\":\"删除\",\"url\":\"\",\"perms\":\"code:tdpingjia:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '109', '0:0:0:0:0:0:0:1', '2021-03-27 12:42:00');
INSERT INTO `sys_log` VALUES ('102', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"运动详情\",\"url\":\"yundong/yundong\",\"perms\":\"code:tdpingjia:save,code:tdpingjia:list,code:tdpingjia:info,code:tdpingjia:delete\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":1}]', '114', '0:0:0:0:0:0:0:1', '2021-03-27 12:44:14');
INSERT INTO `sys_log` VALUES ('103', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":65,\"parentId\":34,\"name\":\"新增\",\"url\":\"\",\"perms\":\"code:yundong:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '114', '0:0:0:0:0:0:0:1', '2021-03-27 12:44:43');
INSERT INTO `sys_log` VALUES ('104', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":66,\"parentId\":34,\"name\":\"更新\",\"url\":\"\",\"perms\":\"code:yundong:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '113', '0:0:0:0:0:0:0:1', '2021-03-27 12:45:03');
INSERT INTO `sys_log` VALUES ('105', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":67,\"parentId\":34,\"name\":\"删除\",\"url\":\"\",\"perms\":\"code:yundong:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '121', '0:0:0:0:0:0:0:1', '2021-03-27 12:45:21');
INSERT INTO `sys_log` VALUES ('106', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"运动详情\",\"url\":\"yundong/yundong\",\"perms\":\"code:yundong:save,code:yundong:list,code:yundong:info,code:yundong:delete\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":1}]', '118', '0:0:0:0:0:0:0:1', '2021-03-27 12:51:46');
INSERT INTO `sys_log` VALUES ('107', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[47]', '192', '0:0:0:0:0:0:0:1', '2021-03-27 12:53:00');
INSERT INTO `sys_log` VALUES ('108', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[46]', '196', '0:0:0:0:0:0:0:1', '2021-03-27 12:53:10');
INSERT INTO `sys_log` VALUES ('109', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[36]', '200', '0:0:0:0:0:0:0:1', '2021-03-27 12:55:11');
INSERT INTO `sys_log` VALUES ('110', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[35]', '191', '0:0:0:0:0:0:0:1', '2021-03-27 12:55:19');
INSERT INTO `sys_log` VALUES ('111', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"高级管理员\",\"remark\":\"最高权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,39,40,41,33,34,65,66,67,37,38,62,63,64,42,43,59,60,61,48,49,53,54,55,50,51,56,57,58,-666666]}]', '6818', '0:0:0:0:0:0:0:1', '2021-03-27 12:56:37');
INSERT INTO `sys_log` VALUES ('112', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"医生\",\"remark\":\"无医生管理\",\"createUserId\":1,\"menuIdList\":[33,34,65,66,67,37,38,62,63,64,42,43,59,60,61,48,49,53,54,55,50,51,56,57,58,-666666]}]', '2574', '0:0:0:0:0:0:0:1', '2021-03-27 12:57:17');
INSERT INTO `sys_log` VALUES ('113', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"副管理\",\"remark\":\"无\",\"createUserId\":1,\"menuIdList\":[5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,39,40,41,33,34,65,66,67,37,38,62,63,64,42,43,59,60,61,48,49,53,54,55,50,51,56,57,58,-666666,1]}]', '3554', '0:0:0:0:0:0:0:1', '2021-03-27 12:57:44');
INSERT INTO `sys_log` VALUES ('114', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"小管理\",\"remark\":\"无系统管理\",\"createUserId\":1,\"menuIdList\":[31,32,39,40,41,33,34,65,66,67,37,38,62,63,64,42,43,59,60,61,48,49,53,54,55,50,51,56,57,58,-666666]}]', '2455', '0:0:0:0:0:0:0:1', '2021-03-27 12:57:59');
INSERT INTO `sys_log` VALUES ('115', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":5,\"roleName\":\"辉哥权限\",\"remark\":\"广辉专用\",\"createUserId\":1,\"menuIdList\":[3,19,20,21,22,4,23,24,25,26,48,49,53,54,55,50,51,56,57,58,-666666,1]}]', '3311', '0:0:0:0:0:0:0:1', '2021-03-27 12:58:37');
INSERT INTO `sys_log` VALUES ('116', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":32,\"name\":\"查看\",\"url\":\"\",\"perms\":\"sys:doctor:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '192', '127.0.0.1', '2021-03-27 15:06:51');
INSERT INTO `sys_log` VALUES ('117', 'admin', '保存角色', 'com.health.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":6,\"roleName\":\"访客\",\"remark\":\"学生家长\",\"createUserId\":1,\"menuIdList\":[68,33,34,65,66,67,-666666,31,32],\"createTime\":\"Mar 27, 2021 3:08:04 PM\"}]', '1849', '127.0.0.1', '2021-03-27 15:08:05');
INSERT INTO `sys_log` VALUES ('118', 'admin', '保存用户', 'com.health.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"fangke\",\"password\":\"83ee7d16f974a883db73df2da7f3c873ccdc6c37c91a14794dfc970b65c6b452\",\"salt\":\"PxUr5sdpCk6RB2ggesGh\",\"email\":\"115@qq.com\",\"mobile\":\"15130051010\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"createTime\":\"Mar 27, 2021 3:09:00 PM\"}]', '478', '127.0.0.1', '2021-03-27 15:09:01');
INSERT INTO `sys_log` VALUES ('119', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":69,\"parentId\":34,\"name\":\"查看\",\"url\":\"\",\"perms\":\"code:yundong:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '163', '127.0.0.1', '2021-03-27 15:22:13');
INSERT INTO `sys_log` VALUES ('120', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"运动详情\",\"url\":\"yundong/yundong\",\"perms\":\"code:yundong:list,code:yundong:info\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":1}]', '218', '127.0.0.1', '2021-03-27 15:22:55');
INSERT INTO `sys_log` VALUES ('121', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":70,\"parentId\":38,\"name\":\"查看\",\"url\":\"\",\"perms\":\"code:tdpingjia:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '133', '127.0.0.1', '2021-03-27 15:24:44');
INSERT INTO `sys_log` VALUES ('122', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"评价详情\",\"url\":\"tdpingjia/tdpingjia\",\"perms\":\"code:tdpingjia:list,code:tdpingjia:info\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', '140', '127.0.0.1', '2021-03-27 15:25:38');
INSERT INTO `sys_log` VALUES ('123', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":71,\"parentId\":43,\"name\":\"查看\",\"url\":\"\",\"perms\":\"code:xinli:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '147', '127.0.0.1', '2021-03-27 15:27:35');
INSERT INTO `sys_log` VALUES ('124', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"心理详情\",\"url\":\"xinli/xinli\",\"perms\":\"code:xinli:list,code:xinli:info\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":1}]', '134', '127.0.0.1', '2021-03-27 15:28:14');
INSERT INTO `sys_log` VALUES ('125', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":72,\"parentId\":49,\"name\":\"查看\",\"url\":\"\",\"perms\":\"code:jibing:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '140', '127.0.0.1', '2021-03-27 15:29:05');
INSERT INTO `sys_log` VALUES ('126', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":73,\"parentId\":49,\"name\":\"查看\",\"url\":\"\",\"perms\":\"code:jibing:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '141', '127.0.0.1', '2021-03-27 15:29:05');
INSERT INTO `sys_log` VALUES ('127', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":48,\"name\":\"疾病详情\",\"url\":\"jibing/jibing\",\"perms\":\"code:jibing:info,code:jibing:save\",\"type\":1,\"icon\":\"role\",\"orderNum\":1}]', '162', '127.0.0.1', '2021-03-27 15:29:40');
INSERT INTO `sys_log` VALUES ('128', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":74,\"parentId\":51,\"name\":\"查看\",\"url\":\"\",\"perms\":\"code:tijian:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '134', '127.0.0.1', '2021-03-27 15:30:34');
INSERT INTO `sys_log` VALUES ('129', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":75,\"parentId\":51,\"name\":\"查看\",\"url\":\"\",\"perms\":\"code:tijian:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '120', '127.0.0.1', '2021-03-27 15:30:34');
INSERT INTO `sys_log` VALUES ('130', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"体检中心\",\"url\":\"tijian/tijian\",\"perms\":\"code:tijian:list,code:tijian:info\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":1}]', '2153', '127.0.0.1', '2021-03-27 15:31:06');
INSERT INTO `sys_log` VALUES ('131', 'admin', '修改菜单', 'com.health.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"体检中心\",\"url\":\"tijian/tijian\",\"perms\":\"code:tijian:list,code:tijian:info\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":1}]', '122', '127.0.0.1', '2021-03-27 15:31:07');
INSERT INTO `sys_log` VALUES ('132', 'admin', '立即执行任务', 'com.health.modules.job.controller.ScheduleJobController.run()', '[[1]]', '416', '183.199.243.105', '2021-04-10 08:21:09');
INSERT INTO `sys_log` VALUES ('133', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":76,\"parentId\":0,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', '93', '183.199.243.105', '2021-04-10 08:33:13');
INSERT INTO `sys_log` VALUES ('134', 'admin', '保存菜单', 'com.health.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":77,\"parentId\":76,\"name\":\"用户详情\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '466', '183.199.243.105', '2021-04-10 08:33:42');
INSERT INTO `sys_log` VALUES ('135', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"高级管理员\",\"remark\":\"最高权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,78,79,80,81,82,31,32,39,40,41,68,33,34,65,66,67,69,37,38,62,63,64,70,42,43,59,60,61,71,48,49,53,54,55,72,73,50,51,56,57,58,74,75,76,77,-666666]}]', '6238', '0:0:0:0:0:0:0:1', '2021-04-10 22:23:56');
INSERT INTO `sys_log` VALUES ('136', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"高级管理员\",\"remark\":\"最高权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,78,79,80,81,82,31,32,39,40,41,68,33,34,65,66,67,69,37,38,62,63,64,70,42,43,59,60,61,71,48,49,53,54,55,72,73,50,51,56,57,58,74,75,76,77,-666666]}]', '8197', '0:0:0:0:0:0:0:1', '2021-04-10 22:24:02');
INSERT INTO `sys_log` VALUES ('137', 'admin', '删除定时任务', 'com.health.modules.job.controller.ScheduleJobController.delete()', '[[2]]', '1414', '0:0:0:0:0:0:0:1', '2021-04-10 23:35:17');
INSERT INTO `sys_log` VALUES ('138', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[77]', '351', '0:0:0:0:0:0:0:1', '2021-04-10 23:43:50');
INSERT INTO `sys_log` VALUES ('139', 'admin', '删除菜单', 'com.health.modules.sys.controller.SysMenuController.delete()', '[76]', '236', '0:0:0:0:0:0:0:1', '2021-04-10 23:43:59');
INSERT INTO `sys_log` VALUES ('140', 'admin', '修改角色', 'com.health.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"医生\",\"remark\":\"无医生管理\",\"createUserId\":1,\"menuIdList\":[33,34,65,66,67,69,37,38,62,63,64,70,42,43,59,60,61,71,48,49,53,54,55,72,73,50,51,56,57,58,74,75,78,79,80,81,82,-666666]}]', '3903', '0:0:0:0:0:0:0:1', '2021-04-10 23:44:38');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('31', '0', '医生管理', '', '', '0', 'zonghe', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '医生详情', 'yisheng/yisheng', 'sys:doctor:list,sys:doctor:info', '1', 'log', '1');
INSERT INTO `sys_menu` VALUES ('33', '0', '运动管理', '', '', '0', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '运动详情', 'yundong/yundong', 'code:yundong:list,code:yundong:info', '1', 'tubiao', '1');
INSERT INTO `sys_menu` VALUES ('37', '0', '评价管理', '', '', '0', 'pinglun', '0');
INSERT INTO `sys_menu` VALUES ('38', '37', '评价详情', 'tdpingjia/tdpingjia', 'code:tdpingjia:list,code:tdpingjia:info', '1', 'log', '1');
INSERT INTO `sys_menu` VALUES ('39', '32', '新增', '', 'sys:doctor:info,sys:doctor:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('40', '32', '删除', '', 'sys:doctor:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('41', '32', '修改', '', 'sys:doctor:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('42', '0', '心理管理', '', '', '0', 'xiangqu', '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '心理详情', 'xinli/xinli', 'code:xinli:list,code:xinli:info', '1', 'xiangqufill', '1');
INSERT INTO `sys_menu` VALUES ('48', '0', '疾病管理', '', '', '0', 'role', '0');
INSERT INTO `sys_menu` VALUES ('49', '48', '疾病详情', 'jibing/jibing', 'code:jibing:info,code:jibing:save', '1', 'role', '1');
INSERT INTO `sys_menu` VALUES ('50', '0', '体检管理', '', '', '0', 'bianji', '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '体检中心', 'tijian/tijian', 'code:tijian:list,code:tijian:info', '1', 'mudedi', '1');
INSERT INTO `sys_menu` VALUES ('53', '49', '新增', '', 'code:jibing:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('54', '49', '删除', '', 'code:jibing:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('55', '49', '修改', '', 'code:jibing:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('56', '51', '新增', '', 'code:tijian:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('57', '51', '删除', '', 'code:jibing:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '51', '修改', '', 'code:jibing:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('59', '43', '新增', '', 'code:xinli:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('60', '43', '删除', '', 'code:xinli:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('61', '43', '修改', '', 'code:xinli:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('62', '38', '新增', '', 'code:tdpingjia:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('63', '38', '更新', '', 'code:tdpingjia:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('64', '38', '删除', '', 'code:tdpingjia:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('65', '34', '新增', '', 'code:yundong:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('66', '34', '更新', '', 'code:yundong:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '34', '删除', '', 'code:yundong:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '32', '查看', '', 'sys:doctor:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('69', '34', '查看', '', 'code:yundong:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('70', '38', '查看', '', 'code:tdpingjia:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('71', '43', '查看', '', 'code:xinli:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('72', '49', '查看', '', 'code:jibing:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('73', '49', '查看', '', 'code:jibing:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('74', '51', '查看', '', 'code:tijian:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('75', '51', '查看', '', 'code:tijian:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('78', '0', '用户', 'user/user', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('79', '78', '查看', null, 'user:user:list,user:user:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('80', '78', '新增', null, 'user:user:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('81', '78', '修改', null, 'user:user:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('82', '78', '删除', null, 'user:user:delete', '2', null, '6');

-- ----------------------------
-- Table structure for `sys_oss`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '副管理', '无', '1', '2021-03-20 20:15:36');
INSERT INTO `sys_role` VALUES ('2', '小管理', '无系统管理', '1', '2021-03-20 20:16:42');
INSERT INTO `sys_role` VALUES ('3', '医生', '无医生管理', '1', '2021-03-20 20:17:17');
INSERT INTO `sys_role` VALUES ('4', '高级管理员', '最高权限', '1', '2021-03-20 20:19:12');
INSERT INTO `sys_role` VALUES ('5', '辉哥权限', '广辉专用', '1', '2021-03-22 20:37:18');
INSERT INTO `sys_role` VALUES ('6', '访客', '学生家长', '1', '2021-03-27 15:08:04');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('292', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('293', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('294', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('295', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('296', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('297', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('298', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('299', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('300', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('301', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('302', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('303', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('304', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('305', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('306', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('307', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('308', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('309', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('310', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('311', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('312', '1', '65');
INSERT INTO `sys_role_menu` VALUES ('313', '1', '66');
INSERT INTO `sys_role_menu` VALUES ('314', '1', '67');
INSERT INTO `sys_role_menu` VALUES ('315', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('316', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('317', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('318', '1', '63');
INSERT INTO `sys_role_menu` VALUES ('319', '1', '64');
INSERT INTO `sys_role_menu` VALUES ('320', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('321', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('322', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('323', '1', '60');
INSERT INTO `sys_role_menu` VALUES ('324', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('325', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('326', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('327', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('328', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('329', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('330', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('331', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('332', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('333', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('334', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('335', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('336', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('337', '2', '31');
INSERT INTO `sys_role_menu` VALUES ('338', '2', '32');
INSERT INTO `sys_role_menu` VALUES ('339', '2', '39');
INSERT INTO `sys_role_menu` VALUES ('340', '2', '40');
INSERT INTO `sys_role_menu` VALUES ('341', '2', '41');
INSERT INTO `sys_role_menu` VALUES ('342', '2', '33');
INSERT INTO `sys_role_menu` VALUES ('343', '2', '34');
INSERT INTO `sys_role_menu` VALUES ('344', '2', '65');
INSERT INTO `sys_role_menu` VALUES ('345', '2', '66');
INSERT INTO `sys_role_menu` VALUES ('346', '2', '67');
INSERT INTO `sys_role_menu` VALUES ('347', '2', '37');
INSERT INTO `sys_role_menu` VALUES ('348', '2', '38');
INSERT INTO `sys_role_menu` VALUES ('349', '2', '62');
INSERT INTO `sys_role_menu` VALUES ('350', '2', '63');
INSERT INTO `sys_role_menu` VALUES ('351', '2', '64');
INSERT INTO `sys_role_menu` VALUES ('352', '2', '42');
INSERT INTO `sys_role_menu` VALUES ('353', '2', '43');
INSERT INTO `sys_role_menu` VALUES ('354', '2', '59');
INSERT INTO `sys_role_menu` VALUES ('355', '2', '60');
INSERT INTO `sys_role_menu` VALUES ('356', '2', '61');
INSERT INTO `sys_role_menu` VALUES ('357', '2', '48');
INSERT INTO `sys_role_menu` VALUES ('358', '2', '49');
INSERT INTO `sys_role_menu` VALUES ('359', '2', '53');
INSERT INTO `sys_role_menu` VALUES ('360', '2', '54');
INSERT INTO `sys_role_menu` VALUES ('361', '2', '55');
INSERT INTO `sys_role_menu` VALUES ('362', '2', '50');
INSERT INTO `sys_role_menu` VALUES ('363', '2', '51');
INSERT INTO `sys_role_menu` VALUES ('364', '2', '56');
INSERT INTO `sys_role_menu` VALUES ('365', '2', '57');
INSERT INTO `sys_role_menu` VALUES ('366', '2', '58');
INSERT INTO `sys_role_menu` VALUES ('367', '2', '-666666');
INSERT INTO `sys_role_menu` VALUES ('368', '5', '3');
INSERT INTO `sys_role_menu` VALUES ('369', '5', '19');
INSERT INTO `sys_role_menu` VALUES ('370', '5', '20');
INSERT INTO `sys_role_menu` VALUES ('371', '5', '21');
INSERT INTO `sys_role_menu` VALUES ('372', '5', '22');
INSERT INTO `sys_role_menu` VALUES ('373', '5', '4');
INSERT INTO `sys_role_menu` VALUES ('374', '5', '23');
INSERT INTO `sys_role_menu` VALUES ('375', '5', '24');
INSERT INTO `sys_role_menu` VALUES ('376', '5', '25');
INSERT INTO `sys_role_menu` VALUES ('377', '5', '26');
INSERT INTO `sys_role_menu` VALUES ('378', '5', '48');
INSERT INTO `sys_role_menu` VALUES ('379', '5', '49');
INSERT INTO `sys_role_menu` VALUES ('380', '5', '53');
INSERT INTO `sys_role_menu` VALUES ('381', '5', '54');
INSERT INTO `sys_role_menu` VALUES ('382', '5', '55');
INSERT INTO `sys_role_menu` VALUES ('383', '5', '50');
INSERT INTO `sys_role_menu` VALUES ('384', '5', '51');
INSERT INTO `sys_role_menu` VALUES ('385', '5', '56');
INSERT INTO `sys_role_menu` VALUES ('386', '5', '57');
INSERT INTO `sys_role_menu` VALUES ('387', '5', '58');
INSERT INTO `sys_role_menu` VALUES ('388', '5', '-666666');
INSERT INTO `sys_role_menu` VALUES ('389', '5', '1');
INSERT INTO `sys_role_menu` VALUES ('390', '6', '68');
INSERT INTO `sys_role_menu` VALUES ('391', '6', '33');
INSERT INTO `sys_role_menu` VALUES ('392', '6', '34');
INSERT INTO `sys_role_menu` VALUES ('393', '6', '65');
INSERT INTO `sys_role_menu` VALUES ('394', '6', '66');
INSERT INTO `sys_role_menu` VALUES ('395', '6', '67');
INSERT INTO `sys_role_menu` VALUES ('396', '6', '-666666');
INSERT INTO `sys_role_menu` VALUES ('397', '6', '31');
INSERT INTO `sys_role_menu` VALUES ('398', '6', '32');
INSERT INTO `sys_role_menu` VALUES ('474', '4', '1');
INSERT INTO `sys_role_menu` VALUES ('475', '4', '2');
INSERT INTO `sys_role_menu` VALUES ('476', '4', '15');
INSERT INTO `sys_role_menu` VALUES ('477', '4', '16');
INSERT INTO `sys_role_menu` VALUES ('478', '4', '17');
INSERT INTO `sys_role_menu` VALUES ('479', '4', '18');
INSERT INTO `sys_role_menu` VALUES ('480', '4', '3');
INSERT INTO `sys_role_menu` VALUES ('481', '4', '19');
INSERT INTO `sys_role_menu` VALUES ('482', '4', '20');
INSERT INTO `sys_role_menu` VALUES ('483', '4', '21');
INSERT INTO `sys_role_menu` VALUES ('484', '4', '22');
INSERT INTO `sys_role_menu` VALUES ('485', '4', '4');
INSERT INTO `sys_role_menu` VALUES ('486', '4', '23');
INSERT INTO `sys_role_menu` VALUES ('487', '4', '24');
INSERT INTO `sys_role_menu` VALUES ('488', '4', '25');
INSERT INTO `sys_role_menu` VALUES ('489', '4', '26');
INSERT INTO `sys_role_menu` VALUES ('490', '4', '5');
INSERT INTO `sys_role_menu` VALUES ('491', '4', '6');
INSERT INTO `sys_role_menu` VALUES ('492', '4', '7');
INSERT INTO `sys_role_menu` VALUES ('493', '4', '8');
INSERT INTO `sys_role_menu` VALUES ('494', '4', '9');
INSERT INTO `sys_role_menu` VALUES ('495', '4', '10');
INSERT INTO `sys_role_menu` VALUES ('496', '4', '11');
INSERT INTO `sys_role_menu` VALUES ('497', '4', '12');
INSERT INTO `sys_role_menu` VALUES ('498', '4', '13');
INSERT INTO `sys_role_menu` VALUES ('499', '4', '14');
INSERT INTO `sys_role_menu` VALUES ('500', '4', '27');
INSERT INTO `sys_role_menu` VALUES ('501', '4', '29');
INSERT INTO `sys_role_menu` VALUES ('502', '4', '30');
INSERT INTO `sys_role_menu` VALUES ('503', '4', '78');
INSERT INTO `sys_role_menu` VALUES ('504', '4', '79');
INSERT INTO `sys_role_menu` VALUES ('505', '4', '80');
INSERT INTO `sys_role_menu` VALUES ('506', '4', '81');
INSERT INTO `sys_role_menu` VALUES ('507', '4', '82');
INSERT INTO `sys_role_menu` VALUES ('508', '4', '31');
INSERT INTO `sys_role_menu` VALUES ('509', '4', '32');
INSERT INTO `sys_role_menu` VALUES ('510', '4', '39');
INSERT INTO `sys_role_menu` VALUES ('511', '4', '40');
INSERT INTO `sys_role_menu` VALUES ('512', '4', '41');
INSERT INTO `sys_role_menu` VALUES ('513', '4', '68');
INSERT INTO `sys_role_menu` VALUES ('514', '4', '33');
INSERT INTO `sys_role_menu` VALUES ('515', '4', '34');
INSERT INTO `sys_role_menu` VALUES ('516', '4', '65');
INSERT INTO `sys_role_menu` VALUES ('517', '4', '66');
INSERT INTO `sys_role_menu` VALUES ('518', '4', '67');
INSERT INTO `sys_role_menu` VALUES ('519', '4', '69');
INSERT INTO `sys_role_menu` VALUES ('520', '4', '37');
INSERT INTO `sys_role_menu` VALUES ('521', '4', '38');
INSERT INTO `sys_role_menu` VALUES ('522', '4', '62');
INSERT INTO `sys_role_menu` VALUES ('523', '4', '63');
INSERT INTO `sys_role_menu` VALUES ('524', '4', '64');
INSERT INTO `sys_role_menu` VALUES ('525', '4', '70');
INSERT INTO `sys_role_menu` VALUES ('526', '4', '42');
INSERT INTO `sys_role_menu` VALUES ('527', '4', '43');
INSERT INTO `sys_role_menu` VALUES ('528', '4', '59');
INSERT INTO `sys_role_menu` VALUES ('529', '4', '60');
INSERT INTO `sys_role_menu` VALUES ('530', '4', '61');
INSERT INTO `sys_role_menu` VALUES ('531', '4', '71');
INSERT INTO `sys_role_menu` VALUES ('532', '4', '48');
INSERT INTO `sys_role_menu` VALUES ('533', '4', '49');
INSERT INTO `sys_role_menu` VALUES ('534', '4', '53');
INSERT INTO `sys_role_menu` VALUES ('535', '4', '54');
INSERT INTO `sys_role_menu` VALUES ('536', '4', '55');
INSERT INTO `sys_role_menu` VALUES ('537', '4', '72');
INSERT INTO `sys_role_menu` VALUES ('538', '4', '73');
INSERT INTO `sys_role_menu` VALUES ('539', '4', '50');
INSERT INTO `sys_role_menu` VALUES ('540', '4', '51');
INSERT INTO `sys_role_menu` VALUES ('541', '4', '56');
INSERT INTO `sys_role_menu` VALUES ('542', '4', '57');
INSERT INTO `sys_role_menu` VALUES ('543', '4', '58');
INSERT INTO `sys_role_menu` VALUES ('544', '4', '74');
INSERT INTO `sys_role_menu` VALUES ('545', '4', '75');
INSERT INTO `sys_role_menu` VALUES ('548', '4', '-666666');
INSERT INTO `sys_role_menu` VALUES ('549', '3', '33');
INSERT INTO `sys_role_menu` VALUES ('550', '3', '34');
INSERT INTO `sys_role_menu` VALUES ('551', '3', '65');
INSERT INTO `sys_role_menu` VALUES ('552', '3', '66');
INSERT INTO `sys_role_menu` VALUES ('553', '3', '67');
INSERT INTO `sys_role_menu` VALUES ('554', '3', '69');
INSERT INTO `sys_role_menu` VALUES ('555', '3', '37');
INSERT INTO `sys_role_menu` VALUES ('556', '3', '38');
INSERT INTO `sys_role_menu` VALUES ('557', '3', '62');
INSERT INTO `sys_role_menu` VALUES ('558', '3', '63');
INSERT INTO `sys_role_menu` VALUES ('559', '3', '64');
INSERT INTO `sys_role_menu` VALUES ('560', '3', '70');
INSERT INTO `sys_role_menu` VALUES ('561', '3', '42');
INSERT INTO `sys_role_menu` VALUES ('562', '3', '43');
INSERT INTO `sys_role_menu` VALUES ('563', '3', '59');
INSERT INTO `sys_role_menu` VALUES ('564', '3', '60');
INSERT INTO `sys_role_menu` VALUES ('565', '3', '61');
INSERT INTO `sys_role_menu` VALUES ('566', '3', '71');
INSERT INTO `sys_role_menu` VALUES ('567', '3', '48');
INSERT INTO `sys_role_menu` VALUES ('568', '3', '49');
INSERT INTO `sys_role_menu` VALUES ('569', '3', '53');
INSERT INTO `sys_role_menu` VALUES ('570', '3', '54');
INSERT INTO `sys_role_menu` VALUES ('571', '3', '55');
INSERT INTO `sys_role_menu` VALUES ('572', '3', '72');
INSERT INTO `sys_role_menu` VALUES ('573', '3', '73');
INSERT INTO `sys_role_menu` VALUES ('574', '3', '50');
INSERT INTO `sys_role_menu` VALUES ('575', '3', '51');
INSERT INTO `sys_role_menu` VALUES ('576', '3', '56');
INSERT INTO `sys_role_menu` VALUES ('577', '3', '57');
INSERT INTO `sys_role_menu` VALUES ('578', '3', '58');
INSERT INTO `sys_role_menu` VALUES ('579', '3', '74');
INSERT INTO `sys_role_menu` VALUES ('580', '3', '75');
INSERT INTO `sys_role_menu` VALUES ('581', '3', '78');
INSERT INTO `sys_role_menu` VALUES ('582', '3', '79');
INSERT INTO `sys_role_menu` VALUES ('583', '3', '80');
INSERT INTO `sys_role_menu` VALUES ('584', '3', '81');
INSERT INTO `sys_role_menu` VALUES ('585', '3', '82');
INSERT INTO `sys_role_menu` VALUES ('586', '3', '-666666');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@dami.com', '17320688184', '1', '1', '2021-03-20 14:14:14');
INSERT INTO `sys_user` VALUES ('2', 'dami', '5e2329edbcf84a63872cd756068d524ac13719c70cc6d2fa3f77aa92a592cb92', 'O2biy2KXKwL5AW0vEX4P', '119199828@qq.com', '17320688183', '1', '1', '2021-03-20 18:15:06');
INSERT INTO `sys_user` VALUES ('3', 'lgh', '14e92f26c3a1c601c7e86f0f2af88f15cdee7cb9139ae9c0e138de214bd0f7e2', 'gyXpcabNxzkdXKMvrth9', '123@qq.com', '13722823135', '1', '1', '2021-03-22 20:38:47');
INSERT INTO `sys_user` VALUES ('4', 'fangke', '83ee7d16f974a883db73df2da7f3c873ccdc6c37c91a14794dfc970b65c6b452', 'PxUr5sdpCk6RB2ggesGh', '115@qq.com', '15130051010', '1', '1', '2021-03-27 15:09:01');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '1', '4');
INSERT INTO `sys_user_role` VALUES ('4', '2', '1');
INSERT INTO `sys_user_role` VALUES ('5', '3', '5');
INSERT INTO `sys_user_role` VALUES ('6', '4', '6');

-- ----------------------------
-- Table structure for `sys_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '5daf83583daba9bf8aafa16c222743f9', '2021-04-11 21:38:09', '2021-04-11 09:38:09');
INSERT INTO `sys_user_token` VALUES ('2', '7d0bd5f812607201722c77828014be48', '2021-07-30 08:16:41', '2021-03-22 20:16:41');
INSERT INTO `sys_user_token` VALUES ('3', 'f5e2967480b2547d34e6418d18e08c4b', '2021-03-23 08:39:51', '2021-03-22 20:39:51');
INSERT INTO `sys_user_token` VALUES ('4', '0a858a28f9900c297058c1976f5a7009', '2021-03-28 03:11:20', '2021-03-27 15:11:20');

-- ----------------------------
-- Table structure for `tb_jibing`
-- ----------------------------
DROP TABLE IF EXISTS `tb_jibing`;
CREATE TABLE `tb_jibing` (
  `jibing_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`jibing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_jibing
-- ----------------------------
INSERT INTO `tb_jibing` VALUES ('1', 'jibing', 'jibing', '2021-03-24 00:14:52');

-- ----------------------------
-- Table structure for `tb_tijian`
-- ----------------------------
DROP TABLE IF EXISTS `tb_tijian`;
CREATE TABLE `tb_tijian` (
  `tijian_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tijian_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tijian
-- ----------------------------
INSERT INTO `tb_tijian` VALUES ('1', 'tijian', 'tijian', '2021-03-22 22:01:06');
INSERT INTO `tb_tijian` VALUES ('2', '体检', '100元', '2021-03-27 12:24:42');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '閻劍鍩涢崥?',
  `health` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '閹靛婧€閸?',
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '瀵嗙爜',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `session_key` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`avatar_url`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('2', 'liu', '0', '1', '0', '0', '1', '0', '0', '0', '0', '2021-04-10 22:54:26', null);
INSERT INTO `tb_user` VALUES ('18', '一位学渣', 'https://thirdwx.qlogo.cn/mmopen/vi_32/8udden1kRL4giajiaeIWZFQDlPBce20atRbMpNrP1gs2gfOUgFfOuKUIrQyuj7N1icARvKic33qer87qfusB35kI1A/132', '0', 'Shijiazhuang', 'China', '1', 'zh_CN', 'Hebei', 'oZtjz5ADtVU6ZBvCZbtwoV_VdWNk', '9yTFu7fqQIFMqfCx+HpgPQ==', '2021-04-11 09:25:24', '刘广辉主管');

-- ----------------------------
-- Table structure for `tb_xinli`
-- ----------------------------
DROP TABLE IF EXISTS `tb_xinli`;
CREATE TABLE `tb_xinli` (
  `xinli_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`xinli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_xinli
-- ----------------------------
INSERT INTO `tb_xinli` VALUES ('1', 'tijian', 'tijian', '2021-03-24 00:11:35');

-- ----------------------------
-- Table structure for `tb_yisheng`
-- ----------------------------
DROP TABLE IF EXISTS `tb_yisheng`;
CREATE TABLE `tb_yisheng` (
  `yisheng_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`yisheng_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_yisheng
-- ----------------------------
INSERT INTO `tb_yisheng` VALUES ('1', '广辉', '123', '2021-03-20 20:39:25');
INSERT INTO `tb_yisheng` VALUES ('2', '小米', '120', '2021-03-20 22:37:45');

-- ----------------------------
-- Table structure for `tb_yundong`
-- ----------------------------
DROP TABLE IF EXISTS `tb_yundong`;
CREATE TABLE `tb_yundong` (
  `yundong_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`yundong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_yundong
-- ----------------------------
INSERT INTO `tb_yundong` VALUES ('1', 'yundong', 'yundong', '2021-03-27 11:21:23');
INSERT INTO `tb_yundong` VALUES ('3', '跑步', '1000mi', '2021-03-27 15:02:10');
INSERT INTO `tb_yundong` VALUES ('4', '跑步', '1000mi', '2021-03-27 15:02:10');
INSERT INTO `tb_yundong` VALUES ('5', '运动一号', '10001米冲刺', '2021-03-27 15:17:00');

-- ----------------------------
-- Table structure for `td_pingjia`
-- ----------------------------
DROP TABLE IF EXISTS `td_pingjia`;
CREATE TABLE `td_pingjia` (
  `pingjia_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pingjia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_pingjia
-- ----------------------------
INSERT INTO `td_pingjia` VALUES ('1', 'pingjia', 'pingjia', '2021-03-22 23:28:04');
