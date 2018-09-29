-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: kitty
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级机构ID，一级机构为0',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='机构管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (17,'轻尘集团',NULL,0,'admin','2018-09-23 19:35:22',NULL,NULL,0),(18,'牧尘集团',NULL,1,'admin','2018-09-23 19:35:55',NULL,NULL,0),(19,'三国集团',NULL,2,'admin','2018-09-23 19:36:24',NULL,NULL,0),(20,'上海分公司',17,0,'admin','2018-09-23 19:36:47',NULL,NULL,0),(21,'上海分公司',18,0,'admin','2018-09-23 19:37:03',NULL,NULL,0),(22,'北京分公司',17,1,'admin','2018-09-23 19:37:17',NULL,NULL,0),(23,'北京分公司',18,1,'admin','2018-09-23 19:37:28',NULL,NULL,0),(24,'技术部',20,0,'admin','2018-09-23 19:37:51',NULL,NULL,0),(25,'技术部',22,0,'admin','2018-09-23 19:38:00',NULL,NULL,0),(26,'技术部',21,0,'admin','2018-09-23 19:38:10',NULL,NULL,0),(27,'技术部',23,0,'admin','2018-09-23 19:38:17',NULL,NULL,0),(28,'市场部',20,1,'admin','2018-09-23 19:38:31',NULL,NULL,0),(29,'市场部',22,0,'admin','2018-09-23 19:38:45',NULL,NULL,0),(30,'市场部',23,0,'admin','2018-09-23 19:39:01',NULL,NULL,0),(31,'公关部',20,2,'admin','2018-09-23 19:39:26',NULL,NULL,0),(32,'人力资源部',20,3,'admin','2018-09-23 19:39:57',NULL,NULL,0),(33,'魏国',19,0,'admin','2018-09-23 19:40:42',NULL,NULL,0),(34,'蜀国',19,1,'admin','2018-09-23 19:40:54',NULL,NULL,0),(35,'吴国',19,2,'admin','2018-09-23 19:41:04',NULL,NULL,0);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (3,'male','男','sex','性别',0,'admin','2018-09-23 19:52:54',NULL,NULL,'性别',0),(4,'female','女','sex','性别',1,'admin','2018-09-23 19:53:17',NULL,NULL,'性别',0);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1089 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1071,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()','{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:16',NULL,NULL),(1072,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:17',NULL,NULL),(1073,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',36,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:18',NULL,NULL),(1074,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()','{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:20',NULL,NULL),(1075,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:20',NULL,NULL),(1076,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',27,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:21',NULL,NULL),(1077,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:22',NULL,NULL),(1078,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()','{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:23',NULL,NULL),(1079,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',5,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:30',NULL,NULL),(1080,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()','{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:31',NULL,NULL),(1081,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',30,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:37',NULL,NULL),(1082,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:38',NULL,NULL),(1083,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',37,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:39',NULL,NULL),(1084,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',16,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:42',NULL,NULL),(1085,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:54:44',NULL,NULL),(1086,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:55:11',NULL,NULL),(1087,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',4,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:55:13',NULL,NULL),(1088,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()','{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',7,'0:0:0:0:0:0:0:1','admin','2018-09-23 19:55:20',NULL,NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL,类型：1.普通页面（如用户管理， /sys/user） 2.嵌套完整外部页面，以http(s)开头的链接 3.嵌套服务器页面，使用iframe:前缀+目标URL(如SQL监控， iframe:/druid/login.html, iframe:前缀会替换成服务器地址)',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:add,sys:user:edit)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,NULL,NULL,0,'el-icon-setting',0,NULL,NULL,NULL,NULL,0),(2,'用户管理',1,'/sys/user',NULL,1,'el-icon-service',1,NULL,NULL,NULL,NULL,0),(3,'机构管理',1,'/sys/dept',NULL,1,'el-icon-news',2,NULL,NULL,NULL,NULL,0),(4,'角色管理',1,'/sys/role',NULL,1,'el-icon-view',4,NULL,NULL,NULL,NULL,0),(5,'菜单管理',1,'/sys/menu',NULL,1,'el-icon-menu',5,NULL,NULL,NULL,NULL,0),(6,'SQL监控',0,'iframe:/druid/login.html',NULL,1,'el-icon-info',1,NULL,NULL,'admin','2018-09-23 19:27:02',0),(7,'字典管理',1,'/sys/dict',NULL,1,'el-icon-edit-outline',7,NULL,NULL,NULL,NULL,0),(8,'系统日志',1,'/sys/log','sys:log:view',1,'el-icon-info',8,NULL,NULL,'admin','2018-09-23 19:32:28',0),(9,'查看',2,NULL,'sys:user:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(10,'新增',2,NULL,'sys:user:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(11,'修改',2,NULL,'sys:user:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(12,'删除',2,NULL,'sys:user:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(13,'查看',3,NULL,'sys:dept:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(14,'新增',3,NULL,'sys:dept:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(15,'修改',3,NULL,'sys:dept:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(16,'删除',3,NULL,'sys:dept:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(17,'查看',4,NULL,'sys:role:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(18,'新增',4,NULL,'sys:role:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(19,'修改',4,NULL,'sys:role:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(20,'删除',4,NULL,'sys:role:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(21,'查看',5,NULL,'sys:menu:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(22,'新增',5,NULL,'sys:menu:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(23,'修改',5,NULL,'sys:menu:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(24,'删除',5,NULL,'sys:menu:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(28,'使用案例',0,NULL,NULL,0,'el-icon-picture-outline',4,NULL,NULL,'admin','2018-09-23 19:28:15',0),(29,'国际化',28,'/demo/i18n',NULL,1,'el-icon-edit',1,NULL,NULL,NULL,NULL,0),(30,'换皮肤',28,'/demo/theme',NULL,1,'el-icon-picture',2,NULL,NULL,NULL,NULL,0),(31,'查看',7,NULL,'sys:dict:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(32,'新增',7,NULL,'sys:dict:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(33,'修改',7,NULL,'sys:dict:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(34,'删除',7,NULL,'sys:dict:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(35,'接口文档',0,'iframe:/swagger-ui.html',NULL,1,'el-icon-tickets',2,NULL,NULL,'admin','2018-09-23 19:27:40',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'admin','超级管理员','admin','2018-08-14 11:11:11','admin','2018-09-23 19:07:18',0),(2,'dev','开发人员','admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(3,'test','测试人员','admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(8,'mng','部门经理','admin','2018-09-23 19:09:52',NULL,NULL,0);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与机构对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (224,4,1,'admin','2018-09-23 16:22:41',NULL,NULL),(225,4,2,'admin','2018-09-23 16:22:41',NULL,NULL),(226,4,9,'admin','2018-09-23 16:22:41',NULL,NULL),(227,4,3,'admin','2018-09-23 16:22:41',NULL,NULL),(228,4,13,'admin','2018-09-23 16:22:41',NULL,NULL),(229,4,4,'admin','2018-09-23 16:22:41',NULL,NULL),(230,4,17,'admin','2018-09-23 16:22:41',NULL,NULL),(231,4,5,'admin','2018-09-23 16:22:41',NULL,NULL),(232,4,21,'admin','2018-09-23 16:22:41',NULL,NULL),(233,4,6,'admin','2018-09-23 16:22:41',NULL,NULL),(234,4,7,'admin','2018-09-23 16:22:41',NULL,NULL),(235,4,31,'admin','2018-09-23 16:22:41',NULL,NULL),(236,4,8,'admin','2018-09-23 16:22:41',NULL,NULL),(237,4,25,'admin','2018-09-23 16:22:41',NULL,NULL),(238,4,26,'admin','2018-09-23 16:22:41',NULL,NULL),(239,4,27,'admin','2018-09-23 16:22:41',NULL,NULL),(240,4,28,'admin','2018-09-23 16:22:41',NULL,NULL),(241,4,29,'admin','2018-09-23 16:22:41',NULL,NULL),(242,4,30,'admin','2018-09-23 16:22:41',NULL,NULL),(243,4,35,'admin','2018-09-23 16:22:41',NULL,NULL),(388,2,1,'admin','2018-09-23 19:51:53',NULL,NULL),(389,2,2,'admin','2018-09-23 19:51:53',NULL,NULL),(390,2,9,'admin','2018-09-23 19:51:53',NULL,NULL),(391,2,3,'admin','2018-09-23 19:51:53',NULL,NULL),(392,2,13,'admin','2018-09-23 19:51:53',NULL,NULL),(393,2,17,'admin','2018-09-23 19:51:53',NULL,NULL),(394,2,5,'admin','2018-09-23 19:51:53',NULL,NULL),(395,2,21,'admin','2018-09-23 19:51:53',NULL,NULL),(396,2,7,'admin','2018-09-23 19:51:53',NULL,NULL),(397,2,31,'admin','2018-09-23 19:51:53',NULL,NULL),(398,2,8,'admin','2018-09-23 19:51:53',NULL,NULL),(399,2,6,'admin','2018-09-23 19:51:53',NULL,NULL),(400,2,35,'admin','2018-09-23 19:51:53',NULL,NULL),(401,2,28,'admin','2018-09-23 19:51:53',NULL,NULL),(402,2,29,'admin','2018-09-23 19:51:53',NULL,NULL),(403,2,30,'admin','2018-09-23 19:51:53',NULL,NULL),(404,3,1,'admin','2018-09-23 19:51:55',NULL,NULL),(405,3,2,'admin','2018-09-23 19:51:55',NULL,NULL),(406,3,9,'admin','2018-09-23 19:51:55',NULL,NULL),(407,3,3,'admin','2018-09-23 19:51:55',NULL,NULL),(408,3,13,'admin','2018-09-23 19:51:55',NULL,NULL),(409,3,8,'admin','2018-09-23 19:51:55',NULL,NULL),(410,3,6,'admin','2018-09-23 19:51:55',NULL,NULL),(411,3,28,'admin','2018-09-23 19:51:55',NULL,NULL),(412,3,29,'admin','2018-09-23 19:51:55',NULL,NULL),(413,3,30,'admin','2018-09-23 19:51:55',NULL,NULL),(431,8,1,'admin','2018-09-23 19:55:08',NULL,NULL),(432,8,2,'admin','2018-09-23 19:55:08',NULL,NULL),(433,8,9,'admin','2018-09-23 19:55:08',NULL,NULL),(434,8,3,'admin','2018-09-23 19:55:08',NULL,NULL),(435,8,13,'admin','2018-09-23 19:55:08',NULL,NULL),(436,8,4,'admin','2018-09-23 19:55:08',NULL,NULL),(437,8,17,'admin','2018-09-23 19:55:08',NULL,NULL),(438,8,5,'admin','2018-09-23 19:55:08',NULL,NULL),(439,8,21,'admin','2018-09-23 19:55:08',NULL,NULL),(440,8,7,'admin','2018-09-23 19:55:08',NULL,NULL),(441,8,31,'admin','2018-09-23 19:55:08',NULL,NULL),(442,8,8,'admin','2018-09-23 19:55:08',NULL,NULL),(443,8,6,'admin','2018-09-23 19:55:08',NULL,NULL),(444,8,35,'admin','2018-09-23 19:55:08',NULL,NULL);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','admin@qq.com','13612345678',1,4,'admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(22,'刘备','3e2837c71ed7013809bda296e94c1e3141a47c17efe5c95d887ea7e16e4ed8df','5749c68caf394f50ad79','test@qq.com','13889700023',1,34,'admin','2018-09-23 19:43:00','admin','2018-09-23 19:43:13',0),(23,'赵云','7388da1b788173de33cd60023e72b048fe166fd59658eb0829bc92b662fe84b6','ba301cfff37c4f4294b1','test@qq.com','13889700023',1,34,'admin','2018-09-23 19:43:44','admin','2018-09-23 19:43:52',0),(24,'诸葛亮','03598a9d3ca0175b9652267a475b7b49a589a35bb25c5830e3d02c460f344991','7f31d587bd1a4ba6b28c','test@qq.com','13889700023',1,34,'admin','2018-09-23 19:44:23','admin','2018-09-23 19:44:29',0),(25,'曹操','1759880c5a2ea94967db4f5e7a82152cadf831c45c0d1f32af0e939eeb943255','b2cb4778302b486cb846','test@qq.com','13889700023',1,33,'admin','2018-09-23 19:45:32','admin','2018-09-23 19:45:37',0),(26,'典韦','c21cd657efcf9fff6e936155246ec3b3d0dc8051941c2edd80871652950919a7','cd0bd6d773314062a743','test@qq.com','13889700023',1,33,'admin','2018-09-23 19:45:48','admin','2018-09-23 19:45:57',0),(27,'夏侯惇','074f481a029c23fe655bb0a5ca80d4f46239bc7ad6aa1538c00dc32f6185db15','68024ab4050f423d9eaf','test@qq.com','13889700023',1,33,'admin','2018-09-23 19:46:09','admin','2018-09-23 19:46:17',0),(28,'荀彧','74361a718a9a6fa498362d3499c52c7446b1d8eaf2e1babef6bb88257eb7f710','fef1f3b8cc674e5a854d','test@qq.com','13889700023',1,33,'admin','2018-09-23 19:46:38','admin','2018-09-23 19:46:43',0),(29,'孙权','e12430482e68dcbffabbc9591e0b6a22c8609fa297c54311543173f200755bda','2f4300ded4294bb7bdf9','test@qq.com','13889700023',1,35,'admin','2018-09-23 19:46:54','admin','2018-09-23 19:47:03',0),(30,'周瑜','5de59dabc6e3ea9e8ed0adec59b84ae5df6c1843702242854cb13bebc176f7dd','33f508fae431405da24d','test@qq.com','13889700023',1,35,'admin','2018-09-23 19:47:28','admin','2018-09-23 19:48:04',0),(31,'陆逊','8f23cd3ba3602b4044c57853d73a9e559e19a8b09b38ba4878215b28a09df1e5','e4a2451603e04012ac24','test@qq.com','13889700023',1,35,'admin','2018-09-23 19:47:44','admin','2018-09-23 19:47:58',0),(32,'黄盖','d0914e18fe84a03149f5a293156e85ef5151327610bc9c48a2d66d4a9025b226','754d3457dc094c45b51a','test@qq.com','13889700023',1,35,'admin','2018-09-23 19:48:38','admin','2018-09-23 19:49:02',0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL,NULL),(26,5,3,NULL,NULL,NULL,NULL),(33,6,2,NULL,NULL,NULL,NULL),(34,4,2,NULL,NULL,NULL,NULL),(35,9,2,NULL,NULL,NULL,NULL),(36,10,3,NULL,NULL,NULL,NULL),(37,11,2,NULL,NULL,NULL,NULL),(38,12,3,NULL,NULL,NULL,NULL),(39,15,2,NULL,NULL,NULL,NULL),(41,16,3,NULL,NULL,NULL,NULL),(42,8,2,NULL,NULL,NULL,NULL),(43,7,4,NULL,NULL,NULL,NULL),(45,18,2,NULL,NULL,NULL,NULL),(46,17,3,NULL,NULL,NULL,NULL),(47,3,4,NULL,NULL,NULL,NULL),(48,21,2,NULL,NULL,NULL,NULL),(49,22,8,NULL,NULL,NULL,NULL),(50,23,2,NULL,NULL,NULL,NULL),(51,24,3,NULL,NULL,NULL,NULL),(52,25,8,NULL,NULL,NULL,NULL),(53,26,2,NULL,NULL,NULL,NULL),(54,27,2,NULL,NULL,NULL,NULL),(55,28,3,NULL,NULL,NULL,NULL),(56,29,8,NULL,NULL,NULL,NULL),(57,31,2,NULL,NULL,NULL,NULL),(58,30,2,NULL,NULL,NULL,NULL),(59,32,3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_token`
--

DROP TABLE IF EXISTS `sys_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_token`
--

LOCK TABLES `sys_user_token` WRITE;
/*!40000 ALTER TABLE `sys_user_token` DISABLE KEYS */;
INSERT INTO `sys_user_token` VALUES (1,1,'e5faf727406812ab5ac483179b46104c','2018-09-24 07:54:35',NULL,NULL,NULL,'2018-09-23 19:54:35'),(2,17,'3d32077ccddb6eb2c4302feb93765cd0','2018-09-24 05:11:17',NULL,NULL,NULL,'2018-09-23 17:11:17'),(3,18,'a939ac41fd309ca785485b4135b8baad','2018-09-24 05:10:36',NULL,NULL,NULL,'2018-09-23 17:10:36');
/*!40000 ALTER TABLE `sys_user_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-23 19:55:48
