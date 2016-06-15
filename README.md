`注：`本系统初始源码来源于[铭飞MCMS内容管理系统v4.5.7](http://ms.mingsoft.net),如有侵权或者其他问题请[`发邮件给我`](mailto:sun_ao@foxmail.com),我会第一时间删除。

在调整过程中部分源码做了修改，原版代码的说明请访问[MS源码说明](https://github.com/ming-soft/MCMS)，本文档只记录改变和补充说明。

#开发环境

建议开发者使用以下环境，这样避免版本带来的问题

* [Eclipse](http://www.eclipse.org/downloads/)
* [Maven](http://maven.apache.org/download.cgi)
* [JDK7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
* [Tomcat8.0](http://tomcat.apache.org/download-80.cgi)

#快速体验

* 将HYCo项目源码导入eclipse；
* 创建数据库hy,注意：数据库使用utf-8编码，导入doc/db-hy.sql备份文件；
* 修改src\main\resources\config.properties文件中的数据库设置参数；
* 第一次启动必须先访问后台，后台访问地址：`http://+ip地址（或localhost）+tomcat端口+项目发布名/ms/login.do` （例如：`http://127.0.0.1:8080/hy/ms/login.do`）,<font color="red">必需先访问后台界面再访问前台界面</font>
* 管理员账号，用户名：admin 密码：admin
* 先在后台生成静态页面再进行访问,通过后台系统菜单`生成器`,将主页、栏目、文章生成一遍
* 前台访问地址：`http://+ip地址（或localhost）+tomcat端口+项目发布名` （例如：`http://127.0.0.1:8080/hy`）,如果是部署在公网的服务器注意将菜单`系统管理>应用菜单`中的域名属性修正为对应的地址（修改后将主页、栏目、文章重新生成一遍）。


#文件说明 

* .gitignore  git配置文件忽略部分与本地环境相关的文件或文件夹
* doc  项目文档文件夹，里面有数据库文件
* src/main 源代码  
* LICENSE 项目协议说明
* README.md 项目说明文档
* pom.xml maven的依赖配置文件

#后台菜单功能说明
后期补充

#
