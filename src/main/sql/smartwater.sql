/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.187.64
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 47.101.187.64:3306
 Source Schema         : smartwater

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 11/01/2019 11:25:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_common_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_common_attachment`;
CREATE TABLE `t_common_attachment`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名',
  `path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件地址',
  `ref_id` bigint(25) NULL DEFAULT NULL COMMENT '关联id',
  `ref_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联类型',
  `file_size` int(11) NULL DEFAULT NULL COMMENT '附件大小',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_alert_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_alert_config`;
CREATE TABLE `tbl_alert_config`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `compony` bigint(25) NULL DEFAULT NULL COMMENT '所属单位',
  `equipment_id` bigint(25) NULL DEFAULT NULL COMMENT '设备id',
  `attribute_id` bigint(25) NULL DEFAULT NULL COMMENT '设备指标id',
  `bigscreen_facous_ind` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是大屏关心设备数据指标',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(A-使用中;I-停用中)',
  `latest_alert_date` datetime(0) NULL DEFAULT NULL COMMENT '最近报警时间',
  `alert_ind` int(5) NULL DEFAULT NULL COMMENT '是否已报警(有正在处理的工单)(1-是;0-否)',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_alert_config_threshold
-- ----------------------------
DROP TABLE IF EXISTS `tbl_alert_config_threshold`;
CREATE TABLE `tbl_alert_config_threshold`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_id` bigint(25) NULL DEFAULT NULL COMMENT '报警指标id',
  `alert_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警数值',
  `times` int(5) NULL DEFAULT NULL COMMENT '持续次数',
  `level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警等级(ALERT_LEVEL)',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '维修组',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `already_times` int(5) NULL DEFAULT NULL COMMENT '已达阈值次数',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `check_user_id` bigint(25) NULL DEFAULT NULL COMMENT '验收人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_alert_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_alert_history`;
CREATE TABLE `tbl_alert_history`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_id` bigint(25) NULL DEFAULT NULL COMMENT '报警指标id',
  `threshold_id` bigint(25) NULL DEFAULT NULL COMMENT '报警项id',
  `equipment_id` bigint(25) NULL DEFAULT NULL COMMENT '设备id',
  `attribute_id` bigint(25) NULL DEFAULT NULL COMMENT '设备指标id',
  `alert_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警数值',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_base_data
-- ----------------------------
DROP TABLE IF EXISTS `tbl_base_data`;
CREATE TABLE `tbl_base_data`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(25) NULL DEFAULT NULL COMMENT '上级数据值',
  `sort_by` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_camera
-- ----------------------------
DROP TABLE IF EXISTS `tbl_camera`;
CREATE TABLE `tbl_camera`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_sn` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  `company` bigint(25) NULL DEFAULT NULL COMMENT '所属单位',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摄像头编号',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `port` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口号',
  `account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账户',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `passway_sn` int(11) NULL DEFAULT NULL COMMENT '通道编号',
  `install_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装地址',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用状态',
  `bigscreen_ind` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否大屏展示',
  `bigscreen_sort` int(11) NULL DEFAULT NULL COMMENT '大屏展示序号',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_code_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_code_type`;
CREATE TABLE `tbl_code_type`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_code_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_code_value`;
CREATE TABLE `tbl_code_value`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` bigint(25) NULL DEFAULT NULL COMMENT '状态',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_equipment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_equipment`;
CREATE TABLE `tbl_equipment`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类别(EQUIP_CATEGORY)',
  `install_place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装位置(EQUIP_INSTALL)',
  `purpose` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备用途(EQUIP_PURPOSE)',
  `model_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `main_param` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要参数',
  `product_date` datetime(0) NULL DEFAULT NULL COMMENT '生产日期',
  `install_date` datetime(0) NULL DEFAULT NULL COMMENT '安装日期',
  `enable_date` datetime(0) NULL DEFAULT NULL COMMENT '启用日期',
  `provider_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家(供应商)',
  `property_value` double(20, 2) NULL DEFAULT NULL COMMENT '资产原值(元)',
  `property_years` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产年限(年)',
  `factory_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出厂编号',
  `weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备重量(kg)',
  `first_machine_param` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主电动机参数',
  `second_machine` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅机一',
  `third_machine` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅机二',
  `specifications` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备说明书',
  `purchase_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购编号',
  `other_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他编号',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备状态(EQUIP_STATUS)',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `company` bigint(25) NULL DEFAULT NULL COMMENT '所属单位',
  `specifications_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备说明书地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_equipment_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tbl_equipment_attribute`;
CREATE TABLE `tbl_equipment_attribute`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `equipment_id` bigint(25) NULL DEFAULT NULL COMMENT '设备id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `data_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型(ATTR_DATA_TYPE)',
  `normal_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正常值',
  `uint` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `gasj_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部指标id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_equipment_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_equipment_attribute_value`;
CREATE TABLE `tbl_equipment_attribute_value`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attribute_id` bigint(25) NULL DEFAULT NULL COMMENT '设备指标id',
  `data_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据值',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `gasj_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部指标id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `gasj_id`(`gasj_id`, `created_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_equipment_maintain_item
-- ----------------------------
DROP TABLE IF EXISTS `tbl_equipment_maintain_item`;
CREATE TABLE `tbl_equipment_maintain_item`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `equipment_id` bigint(25) NULL DEFAULT NULL COMMENT '设备id',
  `cycle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养内容',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_form_lab
-- ----------------------------
DROP TABLE IF EXISTS `tbl_form_lab`;
CREATE TABLE `tbl_form_lab`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录编号',
  `weather` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天气',
  `cod_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cod进水',
  `cod_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cod出水',
  `nh_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '氨氮进水',
  `nh_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '氨氮出水',
  `ss_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ss进水',
  `ss_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ss出水',
  `cl_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '氯化物进水',
  `cl_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '氯化物出水',
  `ph_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ph值进水',
  `ph_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ph值出水',
  `naoh_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总碱度进水',
  `naoh_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总碱度出水',
  `bod_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'bod进水',
  `bod_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'bod出水',
  `tp_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'tp进水',
  `tp_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'tp出水',
  `tn_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'tn进水',
  `tn_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'tn出水',
  `hno_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '硝酸盐氮进水',
  `hno_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '硝酸盐氮出水',
  `sv_thirty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sv30',
  `svi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'svi',
  `bioc_pool_mlvss` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生化池MLVSS',
  `sludge_mlvss` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回流污泥MLVSS',
  `sludge_concentration` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱泥机进泥浓度',
  `sludge_water_rate` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '污泥含水率',
  `sludge_organics` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '污泥有机物',
  `bioc_pool_mlss` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生化池MLSS',
  `sludge_mlss` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回流污泥MLSS',
  `bioc_pool_do` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生化池DO',
  `bioc_pool_temperature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生化池水温',
  `out_color_degree` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出水色度',
  `out_cl_remain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出水余氯',
  `out_coliform` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出水粪大肠菌',
  `beetle_worm` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楯纤虫',
  `vorticella` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钟虫',
  `epistylis` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '累枝虫',
  `rotifer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮虫',
  `hyphomycete_degree` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '丝状菌丰度',
  `protozoan_trend` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原生动物,后生动物数量变化趋势',
  `water_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自由水情况',
  `record_date` datetime(0) NULL DEFAULT NULL COMMENT '记录日期',
  `reportor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填表人',
  `auditor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_form_monitor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_form_monitor`;
CREATE TABLE `tbl_form_monitor`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `date_one` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期1',
  `date_two` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期1',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_form_monitor_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_form_monitor_detail`;
CREATE TABLE `tbl_form_monitor_detail`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `monitor_id` bigint(25) NULL DEFAULT NULL COMMENT '监测表id',
  `shift_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班次(白班夜班)',
  `time_average` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间(或平均值项)',
  `cod_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进水COD',
  `nh_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进水NH3-N',
  `tp_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进水TP',
  `tn_in` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进水TN',
  `cod_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出水COD',
  `nh_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出水NH3-N',
  `tp_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出水TP',
  `tn_out` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出水TN',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `reportor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_form_sewage
-- ----------------------------
DROP TABLE IF EXISTS `tbl_form_sewage`;
CREATE TABLE `tbl_form_sewage`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `record_date` datetime(0) NULL DEFAULT NULL COMMENT '记录日期',
  `weather` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天气情况(晴,阴,小雨,中雨,大雨)',
  `equip_run_mode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备运行方式(自动,手动,故障)',
  `grille_machine` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '格栅机(正常,故障)',
  `lifting_pump` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提升泵(正常,故障)',
  `blower` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鼓风机(正常,故障)',
  `sludge_pump` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '污泥泵(正常,故障)',
  `disinfection_system` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消毒系统(正常,故障)',
  `dosing_system` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加药系统(正常,故障)',
  `stop_reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停机原因(计划停机,设备故障,停电,其他原因)',
  `stop_other_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他停机原因',
  `repair_record` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修记录(恢复正常,手动使用,部分修复,未修复)',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障现象,维修过程或保养情况',
  `flowmeter_reading` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量计读数',
  `daily_handling` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日处理量',
  `pac` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加PAC',
  `naclo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加次氯酸钠',
  `nacl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '氯酸钠',
  `hcl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐酸',
  `lifting_pump_running_time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提升泵运行时间',
  `blower_running_time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鼓风机运行时间',
  `sludge_pump_running_time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排泥泵运行时间',
  `reflux_pump_running_time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回流泵运行时间',
  `running_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行情况(良好,异常)',
  `running_unusual_spec` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行情况异常说明',
  `job_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日常工作描述',
  `duty_officer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值守人员',
  `electricity_consumption` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当日用电量',
  `sc_thirty_one` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sv30(1池)',
  `sc_thirty_two` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sv30(2池)',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `sort_by` int(5) NULL DEFAULT NULL COMMENT '显示顺序',
  `parent_id` bigint(25) NULL DEFAULT NULL COMMENT '上级组织',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织类型(F-水厂内部;O-组织)',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `duty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职责',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_group_space
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group_space`;
CREATE TABLE `tbl_group_space`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '组织id',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间编码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_maintain_plan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_maintain_plan`;
CREATE TABLE `tbl_maintain_plan`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划编号',
  `equipment_id` bigint(25) NULL DEFAULT NULL COMMENT '保养设备',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '保养组',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '验收人',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_maintain_plan_item
-- ----------------------------
DROP TABLE IF EXISTS `tbl_maintain_plan_item`;
CREATE TABLE `tbl_maintain_plan_item`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_id` bigint(25) NULL DEFAULT NULL COMMENT '计划id',
  `equipment_item_id` bigint(25) NULL DEFAULT NULL COMMENT '设备保养项id',
  `plan_cycle` double(11, 2) NULL DEFAULT NULL COMMENT '计划周期',
  `maintain_unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期单位(MAINTAIN_UNIT)',
  `last_matain_date` datetime(0) NULL DEFAULT NULL COMMENT '最近保养日期',
  `maintain_steps` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养步骤',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_materiel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_materiel`;
CREATE TABLE `tbl_materiel`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料名称',
  `category` bigint(25) NULL DEFAULT NULL COMMENT '物料类型',
  `spec` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `price` double(20, 2) NULL DEFAULT NULL COMMENT '采购单价',
  `stock_alert` int(11) NULL DEFAULT NULL COMMENT '预警库存',
  `bar_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条码',
  `valid_time` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `register_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册证号',
  `batch_num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批号',
  `place_origin` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地',
  `measurement_unit` bigint(25) NULL DEFAULT NULL COMMENT '计量单位',
  `procurement_cycle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购周期',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_materiel_application
-- ----------------------------
DROP TABLE IF EXISTS `tbl_materiel_application`;
CREATE TABLE `tbl_materiel_application`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(25) NULL DEFAULT NULL COMMENT '工单id',
  `order_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源单号',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '审核组',
  `repertory_id` bigint(25) NULL DEFAULT NULL COMMENT '仓库id',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(MA_APPLY_STATUS)',
  `audit_user_id` bigint(25) NULL DEFAULT NULL COMMENT '审核人1',
  `audit_date` datetime(0) NULL DEFAULT NULL COMMENT '审核时间1',
  `audit_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果1',
  `audit_remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见1',
  `repertory_user_id` bigint(25) NULL DEFAULT NULL COMMENT '审核人2',
  `repertory_date` datetime(0) NULL DEFAULT NULL COMMENT '审核时间2',
  `repertory_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果2',
  `repertory_remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见2',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_materiel_application_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_materiel_application_detail`;
CREATE TABLE `tbl_materiel_application_detail`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `application_id` bigint(25) NULL DEFAULT NULL COMMENT '申请单id',
  `materiel_id` bigint(25) NULL DEFAULT NULL COMMENT '物料id',
  `materiel_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料名称',
  `materiel_spec` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料规格',
  `materiel_unit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料计量单位',
  `apply_num` double(20, 6) NULL DEFAULT NULL COMMENT '领用数量',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_message_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_user`;
CREATE TABLE `tbl_message_user`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_id` bigint(25) NOT NULL COMMENT '消息标识',
  `user_id` bigint(25) NOT NULL COMMENT '用户标识',
  `if_read` int(1) NULL DEFAULT 0 COMMENT '是否已读',
  `read_date` datetime(0) NULL DEFAULT NULL COMMENT '读取时间',
  `priority` int(1) NULL DEFAULT 1 COMMENT '优先级1-3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_opinion_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_opinion_config`;
CREATE TABLE `tbl_opinion_config`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '用户id',
  `opinion_level` bigint(25) NULL DEFAULT NULL COMMENT '1设备部门；2运行部门；3厂长',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警数值',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_patrol_plan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_patrol_plan`;
CREATE TABLE `tbl_patrol_plan`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划编号',
  `type_id` bigint(25) NULL DEFAULT NULL COMMENT '巡检类别',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '巡检组',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '验收人',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_patrol_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_patrol_type`;
CREATE TABLE `tbl_patrol_type`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡检频率描述',
  `quartz_expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时表达式',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_patrol_type_item
-- ----------------------------
DROP TABLE IF EXISTS `tbl_patrol_type_item`;
CREATE TABLE `tbl_patrol_type_item`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` bigint(25) NULL DEFAULT NULL COMMENT '巡检类型id',
  `parent_id` bigint(25) NULL DEFAULT NULL COMMENT '父项id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `fill_in_method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写内容方式(PATROL_TYPE_FILL)',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_provider
-- ----------------------------
DROP TABLE IF EXISTS `tbl_provider`;
CREATE TABLE `tbl_provider`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `credit_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工商税务登记号',
  `legal_rep` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `bank_deposit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `category` bigint(25) NULL DEFAULT NULL COMMENT '供应商分类',
  `bank_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `constract` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `constract_tel` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `constract_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `constract_fax` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_quartz_task
-- ----------------------------
DROP TABLE IF EXISTS `tbl_quartz_task`;
CREATE TABLE `tbl_quartz_task`  (
  `task_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `task_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名',
  `task_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组',
  `trigger_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发名',
  `trigger_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  `class_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全类名',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间表达式',
  `param_json` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数json格式',
  `source_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源类型',
  `source_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源描述',
  `source_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源id',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repair_plan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repair_plan`;
CREATE TABLE `tbl_repair_plan`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划编号',
  `equipment_id` bigint(25) NULL DEFAULT NULL COMMENT '维修设备',
  `plan_cycle` double(11, 2) NULL DEFAULT NULL COMMENT '计划周期',
  `repair_unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期单位(REPAIR_UNIT)',
  `last_repair_date` datetime(0) NULL DEFAULT NULL COMMENT '上次维修时间',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '维修组',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '验收人',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory`;
CREATE TABLE `tbl_repertory`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '仓库负责人',
  `area` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库区域',
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_check
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_check`;
CREATE TABLE `tbl_repertory_check`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点编号',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '盘点日期',
  `repertory_id` bigint(25) NULL DEFAULT NULL COMMENT '盘点仓库',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '盘点人',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_check_materiel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_check_materiel`;
CREATE TABLE `tbl_repertory_check_materiel`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `check_id` bigint(25) NULL DEFAULT NULL COMMENT '调拨id',
  `materiel_id` bigint(25) NULL DEFAULT NULL COMMENT '物料id',
  `rep_num` double(20, 6) NULL DEFAULT NULL COMMENT '库存数量',
  `check_num` double(20, 6) NULL DEFAULT NULL COMMENT '盘点数量',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_input
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_input`;
CREATE TABLE `tbl_repertory_input`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库编号',
  `input_time` datetime(0) NULL DEFAULT NULL COMMENT '入库日期',
  `repertory_id` bigint(25) NULL DEFAULT NULL COMMENT '收入仓库',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '收货人',
  `provider_id` bigint(25) NULL DEFAULT NULL COMMENT '发货单位',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_input_materiel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_input_materiel`;
CREATE TABLE `tbl_repertory_input_materiel`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `input_id` bigint(25) NULL DEFAULT NULL COMMENT '入库id',
  `materiel_id` bigint(25) NULL DEFAULT NULL COMMENT '物料id',
  `input_num` double(20, 6) NULL DEFAULT NULL COMMENT '入库数量',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_materiel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_materiel`;
CREATE TABLE `tbl_repertory_materiel`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `repertory_id` bigint(25) NULL DEFAULT NULL COMMENT '仓库id',
  `materiel_id` bigint(25) NULL DEFAULT NULL COMMENT '物料id',
  `total_num` double(20, 6) NULL DEFAULT NULL COMMENT '库存数量',
  `last_modify_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后修改类型(I-入库;O-出库;T-调拨;C-盘点)',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_output
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_output`;
CREATE TABLE `tbl_repertory_output`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出库编号',
  `output_time` datetime(0) NULL DEFAULT NULL COMMENT '出库日期',
  `repertory_id` bigint(25) NULL DEFAULT NULL COMMENT '发出仓库',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '发货人',
  `company` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货单位',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `source_id` bigint(25) NULL DEFAULT NULL COMMENT '来源ID',
  `source_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_output_materiel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_output_materiel`;
CREATE TABLE `tbl_repertory_output_materiel`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `output_id` bigint(25) NULL DEFAULT NULL COMMENT '出库id',
  `materiel_id` bigint(25) NULL DEFAULT NULL COMMENT '物料id',
  `output_num` double(20, 6) NULL DEFAULT NULL COMMENT '出库数量',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_transfer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_transfer`;
CREATE TABLE `tbl_repertory_transfer`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调拨编号',
  `transfer_time` datetime(0) NULL DEFAULT NULL COMMENT '调拨日期',
  `output_rep_id` bigint(25) NULL DEFAULT NULL COMMENT '发出仓库',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '调拨人',
  `input_rep_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货仓库',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_repertory_transfer_materiel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_repertory_transfer_materiel`;
CREATE TABLE `tbl_repertory_transfer_materiel`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfert_id` bigint(25) NULL DEFAULT NULL COMMENT '调拨id',
  `materiel_id` bigint(25) NULL DEFAULT NULL COMMENT '物料id',
  `transfert_num` double(20, 6) NULL DEFAULT NULL COMMENT '调拨数量',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_resource
-- ----------------------------
DROP TABLE IF EXISTS `tbl_resource`;
CREATE TABLE `tbl_resource`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `request` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(25) NULL DEFAULT NULL,
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 414 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_resource`;
CREATE TABLE `tbl_role_resource`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(25) NULL DEFAULT NULL COMMENT '角色id',
  `resource_id` bigint(25) NULL DEFAULT NULL COMMENT '资源id',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 436 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_sequence
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sequence`;
CREATE TABLE `tbl_sequence`  (
  `seq_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `min_value` int(11) NOT NULL COMMENT '最小值',
  `max_value` int(11) NOT NULL COMMENT '最大值',
  `current_val` int(11) NOT NULL COMMENT '当前值',
  `increment_val` int(11) NULL DEFAULT 1 COMMENT '增长值',
  PRIMARY KEY (`seq_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_space
-- ----------------------------
DROP TABLE IF EXISTS `tbl_space`;
CREATE TABLE `tbl_space`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间编码',
  `space_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间名称',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职员代码',
  `office_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `telphone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '用户id',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '组织id',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `is_admin` int(1) NULL DEFAULT 0 COMMENT '是否是管理者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 362 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_user_msg
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_msg`;
CREATE TABLE `tbl_user_msg`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `msg_from` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息来源',
  `status` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息状态',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_role`;
CREATE TABLE `tbl_user_role`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(25) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(25) NULL DEFAULT NULL COMMENT '角色id',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_work_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_work_order`;
CREATE TABLE `tbl_work_order`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单编号',
  `plan_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划编号',
  `order_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单类别(ORDER_TYPE)',
  `group_id` bigint(25) NULL DEFAULT NULL COMMENT '组',
  `charge_user_id` bigint(25) NULL DEFAULT NULL COMMENT '责任人',
  `check_user_id` bigint(25) NULL DEFAULT NULL COMMENT '验收人',
  `equipment_id` bigint(25) NULL DEFAULT NULL COMMENT '设备id(保养和维修工单使用)',
  `apply_user_id` bigint(25) NULL DEFAULT NULL COMMENT '维修申请人',
  `source_order_id` bigint(25) NULL DEFAULT NULL COMMENT '来源工单id(维修工单使用)',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单状态(ORDER_STATUS)',
  `check_date` datetime(0) NULL DEFAULT NULL COMMENT '验收时间',
  `check_remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收意见',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `order_type_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单类别名',
  `alert_config_id` bigint(25) NULL DEFAULT NULL COMMENT '报警指标id(维修工单使用)',
  `check_result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收结果(1-通过;0-驳回)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_work_order_group_id`(`group_id`) USING BTREE,
  INDEX `idx_work_order_charge_user_id`(`charge_user_id`) USING BTREE,
  INDEX `idx_work_order_code`(`code`) USING BTREE,
  INDEX `idx_work_order_check_user_id`(`check_user_id`) USING BTREE,
  INDEX `idx_work_order_plan_code`(`plan_code`) USING BTREE,
  INDEX `idx_work_order_order_type`(`order_type`) USING BTREE,
  INDEX `idx_work_order_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1430347 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_work_order_maintain
-- ----------------------------
DROP TABLE IF EXISTS `tbl_work_order_maintain`;
CREATE TABLE `tbl_work_order_maintain`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(25) NULL DEFAULT NULL COMMENT '工单id',
  `maintain_item_id` bigint(25) NULL DEFAULT NULL COMMENT '保养计划项id',
  `maintain_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养内容',
  `maintain_remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `maintain_steps` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养步骤',
  `matain_date` datetime(0) NULL DEFAULT NULL COMMENT '保养日期',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成情况',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_work_order_patrol
-- ----------------------------
DROP TABLE IF EXISTS `tbl_work_order_patrol`;
CREATE TABLE `tbl_work_order_patrol`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(25) NULL DEFAULT NULL COMMENT '工单id',
  `parent_id` bigint(25) NULL DEFAULT NULL COMMENT '父项id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `fill_in_method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填写内容方式(PATROL_TYPE_FILL)',
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6499563 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_work_order_repair
-- ----------------------------
DROP TABLE IF EXISTS `tbl_work_order_repair`;
CREATE TABLE `tbl_work_order_repair`  (
  `id` bigint(25) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(25) NULL DEFAULT NULL COMMENT '工单id',
  `fault_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障现象描述',
  `fault_reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障原因描述',
  `repair_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修内容',
  `completed_date` datetime(0) NULL DEFAULT NULL COMMENT '完工时间',
  `equipment_user_id` bigint(25) NULL DEFAULT NULL COMMENT '设备部负责人',
  `equipment_response_date` datetime(0) NULL DEFAULT NULL COMMENT '设备部反馈时间',
  `equipment_suggestion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备部意见',
  `operation_user_id` bigint(25) NULL DEFAULT NULL COMMENT '运行部负责人',
  `operation_response_date` datetime(0) NULL DEFAULT NULL COMMENT '运行部反馈时间',
  `operation_suggestion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行部意见',
  `factory_user_id` bigint(25) NULL DEFAULT NULL COMMENT '厂长',
  `factory_response_date` datetime(0) NULL DEFAULT NULL COMMENT '厂长反馈时间',
  `factory_suggestion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂长意见',
  `logic_deleted` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `space_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `audit_remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Function structure for _nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `_nextval`;
delimiter ;;
CREATE FUNCTION `_nextval`(name varchar(50))
 RETURNS int(11)
begin
declare _cur int;
declare _maxvalue int;  -- 接收最大值
declare _increment int; -- 接收增长步数
set _increment = (select increment_val from tbl_sequence where seq_name = name);
set _maxvalue = (select max_value from tbl_sequence where seq_name = name);
set _cur = (select current_val from tbl_sequence where seq_name = name);
update tbl_sequence                      -- 更新当前值
 set current_val = _cur + increment_val
 where seq_name = name ;
if(_cur + _increment >= _maxvalue) then  -- 判断是都达到最大值
      update tbl_sequence
        set current_val = min_value
        where seq_name = name ;
end if;
return _cur;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
