-- ----------------------------------------------------
--  用户
-- ----------------------------------------------------
--  Table structure for `sys_user`
-- ----------------------------------------------------
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) COMMENT '密码',
  `salt` varchar(20) COMMENT '盐',
  `email` varchar(100) COMMENT '邮箱',
  `mobile` varchar(100) COMMENT '手机号',
  `status` tinyint COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) COMMENT '机构ID',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  `del_flag` tinyint DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------------------------------
--  机构
-- ------------------------------------------------
--  Table structure for `sys_dept`
-- ------------------------------------------------
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint COMMENT '上级机构ID，一级机构为0',
  `name` varchar(50) COMMENT '机构名称',
  `order_num` int COMMENT '排序',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  `del_flag` tinyint DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构管理';

-- ------------------------------------------------
--  角色
-- ------------------------------------------------
--  Table structure for `sys_role`
-- ------------------------------------------------
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_name` varchar(100) COMMENT '角色名称',
  `remark` varchar(100) COMMENT '备注',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  `del_flag` tinyint DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ------------------------------------------------
--  菜单
-- ------------------------------------------------
--  Table structure for `sys_menu`
-- ------------------------------------------------
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) COMMENT '菜单名称',
  `url` varchar(200) COMMENT '菜单URL',
  `perms` varchar(500) COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) COMMENT '菜单图标',
  `order_num` int COMMENT '排序',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  `del_flag` tinyint DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ------------------------------------------------
--  用户与角色对应关系
-- ------------------------------------------------
--  Table structure for `sys_user_role`
-- ------------------------------------------------
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint COMMENT '用户ID',
  `role_id` bigint COMMENT '角色ID',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ------------------------------------------------
--  角色与机构对应关系
-- ------------------------------------------------
--  Table structure for `sys_role_dept`
-- ------------------------------------------------
CREATE TABLE `sys_role_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint COMMENT '角色ID',
  `dept_id` bigint COMMENT '机构ID',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与机构对应关系';

-- ------------------------------------------------
--  角色与菜单对应关系
-- ------------------------------------------------
--  Table structure for `sys_role_menu`
-- ------------------------------------------------
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint COMMENT '角色ID',
  `menu_id` bigint COMMENT '菜单ID',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ------------------------------------------------
--  用户Token
-- ------------------------------------------------
--  Table structure for `sys_user_token`
-- ------------------------------------------------
CREATE TABLE `sys_user_token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ------------------------------------------------
--  系统日志
-- ------------------------------------------------
--  Table structure for `sys_log`
-- ------------------------------------------------
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) COMMENT '用户名',
  `operation` varchar(50) COMMENT '用户操作',
  `method` varchar(200) COMMENT '请求方法',
  `params` varchar(5000) COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) COMMENT 'IP地址',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8 COMMENT='系统日志';

-- ------------------------------------------------
--  数据字典
-- ------------------------------------------------
--  Table structure for `sys_dict`
-- ------------------------------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `create_by` bigint COMMENT '创建人',
  `create_time` datetime COMMENT '创建时间',
  `last_update_by` bigint COMMENT '更新人',
  `last_update_time` datetime COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` tinyint DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- --------------------------------------
-- 初始数据
-- --------------------------------------
--  Records of `sys_user`
-- --------------------------------------
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_time`) VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'admin@qq.com', '13612345678', '1', '2018-08-14 11:11:11');
-- --------------------------------------
--  Records of `sys_role`
-- --------------------------------------
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_time`) VALUES ('1', 'admin', '超级管理员', '2017-10-29 15:45:51');
-- --------------------------------------
--  Records of `sys_user_role`
-- --------------------------------------
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1', '1', '1');
-- --------------------------------------
--  Records of `sys_dept`
-- --------------------------------------
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES ('1', '0', '轻尘集团', '0', '0');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES ('2', '1', '北京分公司', '1', '0');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES ('3', '1', '上海分公司', '2', '0');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES ('4', '3', '技术部', '0', '0');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES ('6', '3', '宣传部', '1', '0');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES ('7', '3', '销售部', '2', '0');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES ('8', '3', '市场部', '3', '0');
-- --------------------------------------
--  Records of `sys_menu`
-- --------------------------------------
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('1', '0', '系统管理', NULL, NULL, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('2', '1', '用户管理', 'modules/sys/user.html', NULL, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('3', '1', '机构管理', 'modules/sys/dept.html', NULL, '1', 'fa fa-file-code-o', '2');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('4', '1', '角色管理', 'modules/sys/role.html', NULL, '1', 'fa fa-user-secret', '4');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('5', '1', '菜单管理', 'modules/sys/menu.html', NULL, '1', 'fa fa-th-list', '5');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('6', '1', 'SQL监控', 'druid/sql.html', NULL, '1', 'fa fa-bug', '6');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('8', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('9', '2', '查看', NULL, 'sys:user:list,sys:user:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('10', '2', '新增', NULL, 'sys:user:save,sys:role:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('11', '2', '修改', NULL, 'sys:user:update,sys:role:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('12', '2', '删除', NULL, 'sys:user:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('13', '3', '查看', NULL, 'sys:dept:list,sys:dept:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('14', '3', '新增', NULL, 'sys:dept:save,sys:dept:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('15', '3', '修改', NULL, 'sys:dept:update,sys:dept:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('16', '3', '删除', NULL, 'sys:dept:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('17', '4', '查看', NULL, 'sys:role:list,sys:role:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('18', '4', '新增', NULL, 'sys:role:save,sys:menu:perms', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('19', '4', '修改', NULL, 'sys:role:update,sys:menu:perms', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('20', '4', '删除', NULL, 'sys:role:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('21', '5', '查看', NULL, 'sys:menu:list,sys:menu:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('22', '5', '新增', NULL, 'sys:menu:save,sys:menu:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('23', '5', '修改', NULL, 'sys:menu:update,sys:menu:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('24', '5', '删除', NULL, 'sys:menu:delete', '2', NULL, '0');

