# kitty

### 项目介绍
Kitty是基于Spring Boot、Spring Cloud、Vue、Element实现的Java快速开发平台。
目标是搭建出一套简洁易用的快速解决方案，可以帮助用户有效降低项目开发难度和成本。
个人博客提供本项目开发过程同步系列教程文章，手把手的教你如何开发同类系统。

### 功能计划
- 登录注册：登录注册，第三方登录（QQ、微信、微博）
- 用户管理：新建用户，修改用户，删除用户，查询用户
- 机构管理：新建机构，修改机构，删除机构，查询机构
- 角色管理：新建角色，修改角色，删除角色，查询角色
- 菜单管理：新建菜单，修改菜单，删除菜单，查询菜单
- 字典管理：新建字典，修改字典，删除字典，查询字典
- 日志管理：记录用户操作日志，查看系统执行日志
- 数据权限：结合用户机构关系，实现数据权限功能
- 数据监控：定制Druid信息，提供有效的SQL监控
- 单点登录：利用 OAuth2, 提供统一的单点登录功能
- 聚合文档：定制在线文档，提供简洁美观的API文档
- 微服务化：结合Spring Cloud，实现系统微服务化
- 服务监控：结合微服务治理，实现服务的全方位监控
- 服务限流：结合微服务治理，实现有效的服务限流
- ...

### 软件架构（后端）

##### 开发环境

- IDE : eclipse 4.x
- JDK : JDK1.8.x
- Maven : Maven 3.5.x
- MySQL: MySQL 5.7.x

##### 技术选型

- 核心框架：Spring Boot 2.x
- 安全框架：Apache Shiro 1.4.x
- 视图框架：Spring MVC 5.x
- 持久层框架：MyBatis 3.x
- 定时器：Quartz 2.x
- 数据库连接池：Druid 1.x
- 日志管理：SLF4J、Log4j

##### 项目结构

- kitty-pom： 统一管理 Maven 版本，打包配置
- kitty-common： 公共代码模块，主要放置工具类
- kitty-core： 核心代码模块，主要封装公共业务模块
- kitty-admin： 后台管理模块，包含用户、角色、菜单管理等
- kitty-boot： Spring Boot 启动模块，包含一些全局配置信息

### 软件架构（前端）

##### 开发环境

- IDE : VS Code 1.27
- NODE: Node 8.9.x
- NPM : NPM 6.4.x

##### 技术选型

- 前端框架：Vue 2.x
- 页面组件：Element 2.x
- 状态管理：Vuex 2.x
- 后台交互：axios 0.18.x
- 图标使用：Font Awesome 4.x

##### 项目结构

- assets： 图标、字体、国际化信息等静态信息
- components： 组件库，对常用组件进行封装
- http： 后台交互模块，统一后台接口请求API
- i18n： 国际化模块，使用Vue i18n进行国际化
- mock： Mock模块，模拟接口调用并返回定制数据
- permission： 权限控制模块，处理权限认证逻辑
- router： 路由管理模块，负责页面各种路由配置
- store： 状态管理模块，提供组件间状态共享
- utils： 工具模块，提供一些通用的工具方法
- views： 页面模块，主要放置各种页面视图组件


#### 安装教程

1. xxxx
2. xxxx
3. xxxx

#### 使用说明

1. xxxx
2. xxxx
3. xxxx

#### 参与贡献

1. Fork 本项目
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request


#### 码云特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. 码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5. 码云官方提供的使用手册 [http://git.mydoc.io/](http://git.mydoc.io/)
6. 码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)