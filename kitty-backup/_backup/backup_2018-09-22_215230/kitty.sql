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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='机构管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,'轻尘集团',0,0,NULL,NULL,NULL,NULL,0),(2,'北京分公司',1,1,NULL,NULL,NULL,NULL,0),(3,'上海分公司',1,2,NULL,NULL,NULL,NULL,0),(4,'技术部',3,0,NULL,NULL,NULL,NULL,0),(6,'宣传部',3,1,NULL,NULL,NULL,NULL,0),(7,'销售部',3,2,NULL,NULL,NULL,NULL,0),(8,'市场部',3,3,NULL,NULL,NULL,NULL,0),(9,'牧尘集团',0,1,NULL,NULL,NULL,NULL,0),(10,'北京分公司',9,1,NULL,NULL,NULL,NULL,0),(11,'上海分公司',9,2,NULL,NULL,NULL,NULL,0),(12,'技术部',10,1,NULL,NULL,NULL,NULL,0),(13,'宣传部',10,2,NULL,NULL,NULL,NULL,0),(14,'销售部',11,1,NULL,NULL,NULL,NULL,0),(15,'市场部',11,2,NULL,NULL,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'male','男','sex','男性',0,NULL,NULL,NULL,NULL,NULL,0),(2,'female','女','sex','女性',1,NULL,NULL,NULL,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',17,'0:0:0:0:0:0:0:1','admin','2018-09-22 10:34:55',NULL,NULL),(2,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',13,'0:0:0:0:0:0:0:1','admin','2018-09-22 11:53:16',NULL,NULL),(3,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',15,'0:0:0:0:0:0:0:1','admin','2018-09-22 11:53:17',NULL,NULL),(4,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',13,'0:0:0:0:0:0:0:1','admin','2018-09-22 12:01:32',NULL,NULL),(5,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',76,'0:0:0:0:0:0:0:1','admin','2018-09-22 15:40:27',NULL,NULL),(6,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',24,'0:0:0:0:0:0:0:1','admin','2018-09-22 15:54:40',NULL,NULL),(7,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',49,'0:0:0:0:0:0:0:1','admin','2018-09-22 17:02:41',NULL,NULL),(8,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','1',4,'0:0:0:0:0:0:0:1','admin','2018-09-22 17:36:23',NULL,NULL),(9,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','1',4,'0:0:0:0:0:0:0:1','admin','2018-09-22 17:39:18',NULL,NULL),(10,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','1',4,'0:0:0:0:0:0:0:1','admin','2018-09-22 17:39:24',NULL,NULL),(11,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','1',3,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:25:39',NULL,NULL),(12,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',378,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:28:12',NULL,NULL),(13,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','1',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:42:54',NULL,NULL),(14,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',10,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:45:32',NULL,NULL),(15,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','1',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:48:07',NULL,NULL),(16,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','1',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:48:40',NULL,NULL),(17,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{},\"pageNum\":1,\"pageSize\":8}',33,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:48:40',NULL,NULL),(18,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',49,'0:0:0:0:0:0:0:1','admin','2018-09-22 18:56:57',NULL,NULL),(19,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',38,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:04:56',NULL,NULL),(20,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',72,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:05:12',NULL,NULL),(21,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',51,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:05:20',NULL,NULL),(22,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',49,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:05:26',NULL,NULL),(23,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',49,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:06:53',NULL,NULL),(24,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',40,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:09:08',NULL,NULL),(25,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',96,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:09:35',NULL,NULL),(26,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',42,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:10:54',NULL,NULL),(27,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',47,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:11:45',NULL,NULL),(28,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',47,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:21:18',NULL,NULL),(29,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',37,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:22:35',NULL,NULL),(30,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',33,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:23:44',NULL,NULL),(31,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',41,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:28:08',NULL,NULL),(32,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',57,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:34:55',NULL,NULL),(33,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',60,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:35:26',NULL,NULL),(34,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',36,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:36:23',NULL,NULL),(35,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',38,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:39:04',NULL,NULL),(36,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',37,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:42:04',NULL,NULL),(37,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',35,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:42:37',NULL,NULL),(38,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',35,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:50:05',NULL,NULL),(39,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',27,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:50:10',NULL,NULL),(40,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',77,'0:0:0:0:0:0:0:1','admin','2018-09-22 19:51:41',NULL,NULL),(41,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',55,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:06:13',NULL,NULL),(42,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','0',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:07:00',NULL,NULL),(43,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',27,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:07:00',NULL,NULL),(44,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',33,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:07:54',NULL,NULL),(45,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','0',14,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:10:16',NULL,NULL),(46,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',38,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:10:16',NULL,NULL),(47,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',43,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:10:34',NULL,NULL),(48,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','0',31,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:10:57',NULL,NULL),(49,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',53,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:19:22',NULL,NULL),(50,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',45,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:19:35',NULL,NULL),(51,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','0',10,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:19:51',NULL,NULL),(52,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',36,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:26:11',NULL,NULL),(53,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',56,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:26:16',NULL,NULL),(54,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',24,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:26:19',NULL,NULL),(55,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',20,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:26:20',NULL,NULL),(56,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',32,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:26:39',NULL,NULL),(57,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',22,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:26:43',NULL,NULL),(58,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','0',16,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:27:04',NULL,NULL),(59,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537619230667,\"deptId\":1,\"deptName\":\"轻尘集团\",\"email\":\"test@qq.com\",\"id\":0,\"mobile\":\"13889700023\",\"name\":\"112\",\"password\":\"a62bc4fd1502f8b632ba8d9a70beccd3cde8f59dd222c90...',4169,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:27:13',NULL,NULL),(60,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',29,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:27:13',NULL,NULL),(61,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','15',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:27:30',NULL,NULL),(62,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537619231000,\"delFlag\":0,\"deptId\":1,\"deptName\":\"轻尘集团\",\"email\":\"test@qq.com\",\"id\":15,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537619261017,\"mobile\":\"13889700023\",\"name...',22682,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:27:53',NULL,NULL),(63,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',20,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:27:53',NULL,NULL),(64,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',37,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:28:22',NULL,NULL),(65,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',21,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:28:23',NULL,NULL),(66,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',33,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:36:55',NULL,NULL),(67,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',42,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:40:22',NULL,NULL),(68,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',28,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:40:25',NULL,NULL),(69,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','15',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:41:10',NULL,NULL),(70,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537619231000,\"delFlag\":0,\"deptId\":1,\"deptName\":\"轻尘集团\",\"email\":\"test@qq.com\",\"id\":15,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620077009,\"mobile\":\"13889700023\",\"name...',16149,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:41:26',NULL,NULL),(71,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',23,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:41:26',NULL,NULL),(72,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','15',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:41:42',NULL,NULL),(73,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537619231000,\"delFlag\":0,\"deptId\":1,\"deptName\":\"轻尘集团\",\"email\":\"test@qq.com\",\"id\":15,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620102238,\"mobile\":\"13889700023\",\"name...',7,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:41:42',NULL,NULL),(74,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',29,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:41:42',NULL,NULL),(75,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','15',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:42:11',NULL,NULL),(76,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537619231000,\"delFlag\":0,\"deptId\":1,\"deptName\":\"轻尘集团\",\"email\":\"test@qq.com\",\"id\":15,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620130942,\"mobile\":\"13889700023\",\"name...',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:42:11',NULL,NULL),(77,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',21,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:42:11',NULL,NULL),(78,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',34,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:42:59',NULL,NULL),(79,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','6',1,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:02',NULL,NULL),(80,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":12,\"deptName\":\"技术部\",\"email\":\"iverson@qq.com\",\"id\":6,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620301833,\"mobile\":\"18200932238\",\"na...',8,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:02',NULL,NULL),(81,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',33,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:02',NULL,NULL),(82,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','4',3,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:30',NULL,NULL),(83,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":8,\"deptName\":\"市场部\",\"email\":\"iverson@qq.com\",\"id\":4,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620329642,\"mobile\":\"18200932238\",\"nam...',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:30',NULL,NULL),(84,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',30,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:30',NULL,NULL),(85,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','8',1,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:41',NULL,NULL),(86,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"iverson@qq.com\",\"id\":8,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620340939,\"mobile\":\"18200932238\",\"na...',4,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:41',NULL,NULL),(87,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',28,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:41',NULL,NULL),(88,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','8',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:46',NULL,NULL),(89,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"iverson@qq.com\",\"id\":8,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620346426,\"mobile\":\"18200932238\",\"na...',15,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:46',NULL,NULL),(90,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',30,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:47',NULL,NULL),(91,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','8',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:55',NULL,NULL),(92,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"iverson@qq.com\",\"id\":8,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537620355317,\"mobile\":\"18200932238\",\"na...',6,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:55',NULL,NULL),(93,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',32,'0:0:0:0:0:0:0:1','admin','2018-09-22 20:45:55',NULL,NULL),(94,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',46,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:08:54',NULL,NULL),(95,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',32,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:09:01',NULL,NULL),(96,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',33,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:09:39',NULL,NULL),(97,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',32,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:10:26',NULL,NULL),(98,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',34,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:10:47',NULL,NULL),(99,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',34,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:11:52',NULL,NULL),(100,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',28,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:13:08',NULL,NULL),(101,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',34,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:14:43',NULL,NULL),(102,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',42,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:15:53',NULL,NULL),(103,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',42,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:16:05',NULL,NULL),(104,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',54,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:16:55',NULL,NULL),(105,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',32,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:17:54',NULL,NULL),(106,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',31,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:20:28',NULL,NULL),(107,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',27,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:20:41',NULL,NULL),(108,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',33,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:21:38',NULL,NULL),(109,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',30,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:22:41',NULL,NULL),(110,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',218,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:23:31',NULL,NULL),(111,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',63,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:23:41',NULL,NULL),(112,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',32,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:25:52',NULL,NULL),(113,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',29,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:29:12',NULL,NULL),(114,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',28,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:31:06',NULL,NULL),(115,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',47,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:34:23',NULL,NULL),(116,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',39,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:34:26',NULL,NULL),(117,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',371,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:44:40',NULL,NULL),(118,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',79,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:45:18',NULL,NULL),(119,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',50,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:45:25',NULL,NULL),(120,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',90,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:45:46',NULL,NULL),(121,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','5',3,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:45:58',NULL,NULL),(122,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":12,\"deptName\":\"技术部\",\"email\":\"iverson@qq.com\",\"id\":5,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537623957735,\"mobile\":\"18200932238\",\"na...',70,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:45:58',NULL,NULL),(123,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',57,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:45:58',NULL,NULL),(124,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','5',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:04',NULL,NULL),(125,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":12,\"deptName\":\"技术部\",\"email\":\"iverson@qq.com\",\"id\":5,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537623964061,\"mobile\":\"18200932238\",\"na...',15,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:04',NULL,NULL),(126,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',60,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:04',NULL,NULL),(127,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','5',3,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:11',NULL,NULL),(128,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":12,\"deptName\":\"技术部\",\"email\":\"iverson@qq.com\",\"id\":5,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537623970667,\"mobile\":\"18200932238\",\"na...',7,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:11',NULL,NULL),(129,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',53,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:11',NULL,NULL),(130,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',38,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:16',NULL,NULL),(131,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','0',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:28',NULL,NULL),(132,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537623988398,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"test@qq.com\",\"id\":0,\"mobile\":\"13889700023\",\"name\":\"111\",\"password\":\"2d01a099e1ce1adee5cf0352f8fb2cd121a0ec714da3553...',3,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:28',NULL,NULL),(133,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',45,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:28',NULL,NULL),(134,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','16',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:35',NULL,NULL),(135,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537623988000,\"delFlag\":0,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"test@qq.com\",\"id\":16,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537623994688,\"mobile\":\"13889700023\",\"name...',10,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:35',NULL,NULL),(136,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',45,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:35',NULL,NULL),(137,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','16',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:42',NULL,NULL),(138,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537623988000,\"delFlag\":0,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"test@qq.com\",\"id\":16,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624001817,\"mobile\":\"13889700023\",\"name...',6,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:42',NULL,NULL),(139,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',40,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:42',NULL,NULL),(140,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','16',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:47',NULL,NULL),(141,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537623988000,\"delFlag\":0,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"test@qq.com\",\"id\":16,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624007064,\"mobile\":\"13889700023\",\"name...',7,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:47',NULL,NULL),(142,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',41,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:47',NULL,NULL),(143,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',46,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:46:57',NULL,NULL),(144,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','7',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:47:10',NULL,NULL),(145,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":13,\"deptName\":\"宣传部\",\"email\":\"iverson@qq.com\",\"id\":7,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624030090,\"mobile\":\"18200932238\",\"na...',6,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:47:10',NULL,NULL),(146,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',49,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:47:10',NULL,NULL),(147,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',7,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:47:22',NULL,NULL),(148,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',7,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:48:04',NULL,NULL),(149,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',43,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:48:06',NULL,NULL),(150,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',44,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:48:50',NULL,NULL),(151,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','6',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:07',NULL,NULL),(152,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":12,\"deptName\":\"技术部\",\"email\":\"iverson@qq.com\",\"id\":6,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624146918,\"mobile\":\"18200932238\",\"na...',4,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:07',NULL,NULL),(153,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',53,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:07',NULL,NULL),(154,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','4',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:12',NULL,NULL),(155,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":8,\"deptName\":\"市场部\",\"email\":\"iverson@qq.com\",\"id\":4,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624152290,\"mobile\":\"18200932238\",\"nam...',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:12',NULL,NULL),(156,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',45,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:12',NULL,NULL),(157,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',29,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:14',NULL,NULL),(158,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','9',1,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:20',NULL,NULL),(159,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":15,\"deptName\":\"市场部\",\"email\":\"iverson@qq.com\",\"id\":9,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624160337,\"mobile\":\"18200932238\",\"na...',4,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:20',NULL,NULL),(160,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',37,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:20',NULL,NULL),(161,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','10',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:25',NULL,NULL),(162,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":4,\"deptName\":\"技术部\",\"email\":\"iverson@qq.com\",\"id\":10,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624165350,\"mobile\":\"18200932238\",\"na...',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:25',NULL,NULL),(163,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',46,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:25',NULL,NULL),(164,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','11',1,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:30',NULL,NULL),(165,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":6,\"deptName\":\"宣传部\",\"email\":\"iverson@qq.com\",\"id\":11,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624170311,\"mobile\":\"18200932238\",\"na...',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:30',NULL,NULL),(166,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',45,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:30',NULL,NULL),(167,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','12',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:36',NULL,NULL),(168,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1534216271000,\"delFlag\":0,\"deptId\":15,\"deptName\":\"市场部\",\"email\":\"iverson@qq.com\",\"id\":12,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624176066,\"mobile\":\"18200932238\",\"n...',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:36',NULL,NULL),(169,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',47,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:36',NULL,NULL),(170,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','15',1,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:41',NULL,NULL),(171,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537619231000,\"delFlag\":0,\"deptId\":1,\"deptName\":\"轻尘集团\",\"email\":\"test@qq.com\",\"id\":15,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624180563,\"mobile\":\"13889700023\",\"name...',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:41',NULL,NULL),(172,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',40,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:41',NULL,NULL),(173,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findById()','16',2,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:46',NULL,NULL),(174,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.save()','{\"createBy\":\"admin\",\"createTime\":1537623988000,\"delFlag\":0,\"deptId\":14,\"deptName\":\"销售部\",\"email\":\"test@qq.com\",\"id\":16,\"lastUpdateBy\":\"admin\",\"lastUpdateTime\":1537624185945,\"mobile\":\"13889700023\",\"name...',6,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:46',NULL,NULL),(175,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',36,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:49:46',NULL,NULL),(176,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',36,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:50:00',NULL,NULL),(177,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',29,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:50:30',NULL,NULL),(178,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',37,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:50:32',NULL,NULL),(179,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',38,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:50:38',NULL,NULL),(180,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":2,\"pageSize\":8}',31,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:50:43',NULL,NULL),(181,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',31,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:50:45',NULL,NULL),(182,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',5,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:50:55',NULL,NULL),(183,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()','{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',19,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:51:14',NULL,NULL),(184,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',39,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:51:25',NULL,NULL),(185,'admin',NULL,'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()','{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}',61,'0:0:0:0:0:0:0:1','admin','2018-09-22 21:52:24',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,NULL,NULL,0,'el-icon-setting',0,NULL,NULL,NULL,NULL,0),(2,'用户管理',1,'/sys/user',NULL,1,'el-icon-service',1,NULL,NULL,NULL,NULL,0),(3,'机构管理',1,'/sys/dept',NULL,1,'el-icon-news',2,NULL,NULL,NULL,NULL,0),(4,'角色管理',1,'/sys/role',NULL,1,'el-icon-view',4,NULL,NULL,NULL,NULL,0),(5,'菜单管理',1,'/sys/menu',NULL,1,'el-icon-menu',5,NULL,NULL,NULL,NULL,0),(6,'SQL监控',1,'iframe:/druid/login.html',NULL,1,'el-icon-info',6,NULL,NULL,NULL,NULL,0),(7,'字典管理',1,'/sys/dict',NULL,1,'el-icon-edit-outline',7,NULL,NULL,NULL,NULL,0),(8,'系统日志',1,'/sys/log','sys:log:view',1,'el-icon-info',8,NULL,NULL,NULL,NULL,0),(9,'查看',2,NULL,'sys:user:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(10,'新增',2,NULL,'sys:user:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(11,'修改',2,NULL,'sys:user:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(12,'删除',2,NULL,'sys:user:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(13,'查看',3,NULL,'sys:dept:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(14,'新增',3,NULL,'sys:dept:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(15,'修改',3,NULL,'sys:dept:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(16,'删除',3,NULL,'sys:dept:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(17,'查看',4,NULL,'sys:role:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(18,'新增',4,NULL,'sys:role:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(19,'修改',4,NULL,'sys:role:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(20,'删除',4,NULL,'sys:role:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(21,'查看',5,NULL,'sys:menu:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(22,'新增',5,NULL,'sys:menu:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(23,'修改',5,NULL,'sys:menu:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(24,'删除',5,NULL,'sys:menu:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(25,'内容管理',0,NULL,NULL,0,'el-icon-document',0,NULL,NULL,NULL,NULL,0),(26,'栏目管理',25,'/content/category',NULL,1,'el-icon-tickets',1,NULL,NULL,NULL,NULL,0),(27,'文章管理',25,'/content/artical',NULL,1,'el-icon-tickets',2,NULL,NULL,NULL,NULL,0),(28,'使用案例',0,NULL,NULL,0,'el-icon-picture-outline',0,NULL,NULL,NULL,NULL,0),(29,'国际化',28,'/demo/i18n',NULL,1,'el-icon-edit',1,NULL,NULL,NULL,NULL,0),(30,'换皮肤',28,'/demo/theme',NULL,1,'el-icon-picture',2,NULL,NULL,NULL,NULL,0),(31,'查看',7,NULL,'sys:dict:view',2,NULL,0,NULL,NULL,NULL,NULL,0),(32,'新增',7,NULL,'sys:dict:add',2,NULL,0,NULL,NULL,NULL,NULL,0),(33,'修改',7,NULL,'sys:dict:edit',2,NULL,0,NULL,NULL,NULL,NULL,0),(34,'删除',7,NULL,'sys:dict:delete',2,NULL,0,NULL,NULL,NULL,NULL,0),(35,'接口文档',0,'iframe:/swagger-ui.html',NULL,1,'el-icon-tickets',10,NULL,NULL,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'admin','超级管理员','admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(2,'dev','开发人员','admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(3,'test','测试人员','admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,2,25,NULL,NULL,NULL,NULL),(2,2,26,NULL,NULL,NULL,NULL),(3,2,27,NULL,NULL,NULL,NULL),(4,2,28,NULL,NULL,NULL,NULL),(5,2,29,NULL,NULL,NULL,NULL),(6,2,30,NULL,NULL,NULL,NULL),(7,3,25,NULL,NULL,NULL,NULL),(8,3,26,NULL,NULL,NULL,NULL),(9,3,27,NULL,NULL,NULL,NULL),(10,3,28,NULL,NULL,NULL,NULL),(11,3,29,NULL,NULL,NULL,NULL),(12,3,30,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','admin@qq.com','13612345678',1,4,'admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(2,'Louis','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','louis@qq.com','18200932238',1,6,'admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(3,'Kobe','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','kobe@qq.com','18200932238',1,7,'admin','2018-08-14 11:11:11','admin','2018-08-14 11:11:11',0),(4,'Iverson','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,8,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:49:12',0),(5,'Iverson5','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,12,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:46:11',0),(6,'Iverson6','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,12,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:49:07',0),(7,'Iverson7','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,13,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:47:10',0),(8,'Iverson8','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,14,'admin','2018-08-14 11:11:11','admin','2018-09-22 20:45:55',0),(9,'Iverson9','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,15,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:49:20',0),(10,'Iverson10','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,4,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:49:25',0),(11,'Iverson11','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,6,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:49:30',0),(12,'Iverson12','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','iverson@qq.com','18200932238',1,15,'admin','2018-08-14 11:11:11','admin','2018-09-22 21:49:36',0),(15,'112','a62bc4fd1502f8b632ba8d9a70beccd3cde8f59dd222c908d0b0c05d128df433','53ae51e134094ebeb7b9','test@qq.com','13889700023',1,1,'admin','2018-09-22 20:27:11','admin','2018-09-22 21:49:41',0),(16,'111','2d01a099e1ce1adee5cf0352f8fb2cd121a0ec714da35535b34474dcd54f8358','cbb69337105843d4ab45','test@qq.com','13889700023',1,14,'admin','2018-09-22 21:46:28','admin','2018-09-22 21:49:46',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL,NULL),(3,3,2,NULL,NULL,NULL,NULL),(21,8,2,NULL,NULL,NULL,NULL),(26,5,3,NULL,NULL,NULL,NULL),(32,7,3,NULL,NULL,NULL,NULL),(33,6,2,NULL,NULL,NULL,NULL),(34,4,2,NULL,NULL,NULL,NULL),(35,9,2,NULL,NULL,NULL,NULL),(36,10,3,NULL,NULL,NULL,NULL),(37,11,2,NULL,NULL,NULL,NULL),(38,12,3,NULL,NULL,NULL,NULL),(39,15,2,NULL,NULL,NULL,NULL),(40,16,3,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_token`
--

LOCK TABLES `sys_user_token` WRITE;
/*!40000 ALTER TABLE `sys_user_token` DISABLE KEYS */;
INSERT INTO `sys_user_token` VALUES (1,1,'5496454f6ac5c6b08b8decd383635966','2018-09-23 09:52:21',NULL,NULL,NULL,'2018-09-22 21:52:21');
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

-- Dump completed on 2018-09-22 21:52:31
