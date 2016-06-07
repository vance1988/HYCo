-- MySQL dump 10.13  Distrib 5.5.38, for Linux (x86_64)
--
-- Host: localhost    Database: heyueit
-- ------------------------------------------------------
-- Server version	5.5.38

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
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app` (
  `APP_ID` int(22) NOT NULL AUTO_INCREMENT COMMENT '站点ID，关联基础表BasicId',
  `APP_NAME` varchar(60) NOT NULL COMMENT '站点名称',
  `APP_URL` varchar(200) NOT NULL COMMENT '站点域名',
  `APP_LOGO` varchar(120) DEFAULT NULL COMMENT '站点LOGO',
  `APP_KEYWORD` varchar(500) DEFAULT NULL COMMENT '站点关键字',
  `APP_COPYRIGHT` varchar(500) DEFAULT NULL COMMENT '站点版权信息',
  `APP_STYLE` varchar(50) DEFAULT NULL COMMENT '站点风格',
  `APP_MANAGERID` int(11) DEFAULT NULL COMMENT '站点管理员ID',
  `APP_DESCRIPTION` varchar(500) DEFAULT NULL,
  `APP_DATETIME` datetime DEFAULT NULL COMMENT '应用发布日期',
  `APP_MOBILE_STYLE` varchar(11) DEFAULT NULL COMMENT '应用移动端风格',
  `APP_PAY_DATE` datetime DEFAULT NULL COMMENT '应用续费时间',
  `APP_PAY` varchar(300) DEFAULT NULL COMMENT '费用清单',
  `APP_STATE` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0运行中 1已停止  ',
  `APP_MOBILE_STATE` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0启用 1停用',
  PRIMARY KEY (`APP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` VALUES (1,'杭州和越科技有限公司','http://121.40.87.175:8080','/upload/app/1/hy_banner.png','杭州和越','Copyright @2016 杭州和越科技有限公司 版权所有','mooc',1,'杭州和越科技有限公司','2016-05-26 14:47:56','m',NULL,'',0,0);
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic`
--

DROP TABLE IF EXISTS `basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic` (
  `BASIC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `BASIC_TITLE` varchar(300) DEFAULT NULL COMMENT '标题',
  `BASIC_DESCRIPTION` text COMMENT '描述',
  `BASIC_THUMBNAILS` varchar(1000) DEFAULT NULL COMMENT '缩略图',
  `BASIC_HIT` bigint(22) DEFAULT NULL COMMENT '点击次数',
  `BASIC_SORT` int(11) DEFAULT NULL COMMENT '排序',
  `BASIC_DATETIME` datetime DEFAULT NULL COMMENT ' 发布时间',
  `BASIC_UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间',
  `BASIC_PEOPLEID` int(22) DEFAULT NULL COMMENT '用户编号',
  `BASIC_CATEGORYID` int(22) DEFAULT NULL COMMENT '所属分类编号',
  `BASIC_APPID` int(11) DEFAULT NULL COMMENT '应用编号',
  `BASIC_MODELID` int(11) DEFAULT NULL COMMENT '模块编号',
  PRIMARY KEY (`BASIC_ID`),
  UNIQUE KEY `SYS_C009068` (`BASIC_ID`),
  KEY `BASIC_TITLE` (`BASIC_TITLE`(255)),
  KEY `BASIC_APPID` (`BASIC_APPID`) USING BTREE,
  KEY `BASIC_MODELID` (`BASIC_MODELID`) USING BTREE,
  KEY `BASIC_CATEGORYID` (`BASIC_CATEGORYID`) USING BTREE,
  KEY `BASIC_DATETIME` (`BASIC_DATETIME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic`
--

LOCK TABLES `basic` WRITE;
/*!40000 ALTER TABLE `basic` DISABLE KEYS */;
INSERT INTO `basic` VALUES (1,'互联网','','/upload/article/1/1464325065975.jpg',0,1,'2016-05-27 12:58:45','2016-05-30 14:34:43',0,1,0,3),(2,'微信','','/upload/article/1/1464325161513.jpg',0,2,'2016-05-27 12:59:23','2016-05-27 12:59:23',0,1,0,3),(3,'产品','','/upload/article/1/1464325209508.jpg',0,3,'2016-05-27 13:00:21','2016-05-27 13:00:21',0,1,0,3),(4,'关于我们','公司名称：杭州和越科技有限公司','',0,0,'2016-05-30 11:40:20','2016-05-30 11:40:20',0,2,0,3),(8,'联系我们','','',0,0,'2016-05-30 11:53:02','2016-05-30 15:12:56',0,5,0,3),(9,'什么是 Java？','Java 是一项用于开发应用程序的技术','/upload/article/1/1464580864414.jpg',0,0,'2016-05-30 12:02:06','2016-05-30 12:02:06',0,6,0,3),(10,'Android','','/upload/article/1/1464583146743.jpg',0,0,'2016-05-30 12:39:27','2016-05-30 12:39:27',0,6,0,0),(11,'iOS','','/upload/article/1/1464583513687.jpg',0,0,'2016-05-30 12:45:32','2016-05-30 12:45:32',0,6,0,3),(12,'服务','','',0,0,'2016-05-30 14:34:19','2016-05-30 14:34:19',0,3,0,3),(13,'人事工作系统','','/upload/article/1/1464590103664.png',0,0,'2016-05-30 14:35:38','2016-05-30 14:35:38',0,4,0,3),(14,'家宽辅助平台','','/upload/article/1/1464590164683.png',0,0,'2016-05-30 14:36:22','2016-05-30 14:36:22',0,4,0,3),(15,'内控平台','','/upload/article/1/1464590195271.png',0,0,'2016-05-30 14:36:54','2016-05-30 14:36:54',0,4,0,3),(16,'代维材料管理平台','','/upload/article/1/1464590242727.png',0,0,'2016-05-30 14:37:52','2016-05-30 14:37:52',0,4,0,3),(17,'家宽装维管理平台','','/upload/article/1/1464590298944.png',0,0,'2016-05-30 14:38:39','2016-05-30 14:38:39',0,4,0,3),(18,'装维管理平台','','/upload/article/1/1464590336800.png',0,0,'2016-05-30 14:39:16','2016-05-30 14:39:16',0,4,0,3),(19,'阿里云','','/upload/article/1/1464592649657.jpg',0,0,'2016-05-30 15:17:33','2016-05-30 15:17:33',0,7,0,3),(20,'铭飞MS平台','','/upload/article/1/1464592760653.png',0,0,'2016-05-30 15:19:22','2016-05-30 15:19:22',0,7,0,3);
/*!40000 ALTER TABLE `basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_attention`
--

DROP TABLE IF EXISTS `basic_attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_attention` (
  `ba_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `ba_peopleID` int(11) DEFAULT NULL COMMENT '用户id',
  `ba_appID` int(11) DEFAULT NULL COMMENT '用户应用id',
  `ba_basicID` int(11) DEFAULT NULL COMMENT '用户收藏关联的基础id',
  `ba_type` int(11) DEFAULT NULL COMMENT '收藏类型 1： 收藏  2：顶',
  `ba_datetime` datetime DEFAULT NULL COMMENT '用户收藏文章，帖子或商品时的时间',
  `ba_url` varchar(200) DEFAULT NULL COMMENT '收藏的文章,帖子，商品的链接地址',
  PRIMARY KEY (`ba_id`),
  KEY `BA_PEOPLEID` (`ba_peopleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_attention`
--

LOCK TABLES `basic_attention` WRITE;
/*!40000 ALTER TABLE `basic_attention` DISABLE KEYS */;
/*!40000 ALTER TABLE `basic_attention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_category`
--

DROP TABLE IF EXISTS `basic_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_category` (
  `bc_basic_id` int(11) NOT NULL COMMENT '文章编号',
  `bc_category_id` int(11) NOT NULL COMMENT '分类编号',
  UNIQUE KEY `bc_basic_id` (`bc_basic_id`,`bc_category_id`),
  KEY `bc_category_id` (`bc_category_id`),
  KEY `bc_category_id_2` (`bc_category_id`),
  KEY `bc_category_id_3` (`bc_category_id`),
  CONSTRAINT `basic_category_ibfk_1` FOREIGN KEY (`bc_basic_id`) REFERENCES `basic` (`BASIC_ID`) ON DELETE CASCADE,
  CONSTRAINT `basic_category_ibfk_2` FOREIGN KEY (`bc_category_id`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章多分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_category`
--

LOCK TABLES `basic_category` WRITE;
/*!40000 ALTER TABLE `basic_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `basic_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CATEGORY_ID` int(22) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `CATEGORY_TITLE` varchar(50) DEFAULT NULL COMMENT '类别标题',
  `CATEGORY_SORT` int(10) DEFAULT NULL COMMENT '类别排序',
  `CATEGORY_DATETIME` datetime DEFAULT NULL COMMENT '类别发布时间',
  `CATEGORY_MANAGERID` int(22) DEFAULT NULL COMMENT '发布用户ID',
  `CATEGORY_MODELID` int(11) DEFAULT NULL COMMENT '所属模块ID',
  `CATEGORY_CATEGORYID` int(22) DEFAULT NULL COMMENT '父类别编号',
  `CATEGORY_SMALLIMG` varchar(120) DEFAULT NULL COMMENT '缩略图',
  `CATEGORY_APPID` int(11) DEFAULT NULL COMMENT '应用编号',
  `CATEGORY_DESCRIPTION` varchar(45) DEFAULT NULL COMMENT '栏目描述',
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_APPID` (`CATEGORY_APPID`),
  KEY `CATEGORY_MANAGERID` (`CATEGORY_MANAGERID`),
  KEY `CATEGORY_MODELID` (`CATEGORY_MODELID`),
  KEY `CATEGORY_CATEGORYID` (`CATEGORY_CATEGORYID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'首页幻灯',0,'2016-05-27 12:51:40',1,2,0,NULL,1,NULL),(2,'关于我们',0,'2016-05-27 13:49:23',1,2,0,NULL,1,NULL),(3,'服务',0,'2016-05-27 13:49:50',1,2,0,NULL,1,NULL),(4,'案例',0,'2016-05-27 13:50:22',1,2,0,NULL,1,NULL),(5,'联系我们',0,'2016-05-27 13:50:40',1,2,0,NULL,1,NULL),(6,'新闻动态',0,'2016-05-27 13:52:10',1,2,0,NULL,1,NULL),(7,'友情链接',0,'2016-05-27 13:52:45',1,2,0,NULL,1,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `ARTICLE_BASICID` int(20) DEFAULT NULL COMMENT '文章ID',
  `ARTICLE_AUTHOR` varchar(20) DEFAULT NULL COMMENT '文章作者',
  `ARTICLE_CONTENT` longtext COMMENT '文章内容',
  `ARTICLE_TYPE` varchar(100) DEFAULT NULL COMMENT '文章类型',
  `ARTICLE_SOURCE` varchar(300) DEFAULT NULL COMMENT '文章来源',
  `ARTICLE_URL` varchar(200) DEFAULT NULL COMMENT '文章跳转链接地址',
  `ARTICLE_KEYWORD` varchar(300) DEFAULT NULL COMMENT '文章关键字',
  `ARTICLE_FREEORDER` int(255) DEFAULT NULL COMMENT '文章自定义显示顺序',
  `ARTICLE_WEBID` int(11) DEFAULT NULL COMMENT '文章管理的应用id',
  UNIQUE KEY `ARTICLE_BASICID` (`ARTICLE_BASICID`) USING BTREE,
  KEY `ARTICLE_WEBID` (`ARTICLE_WEBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES (1,'',NULL,'f,','','/1/1.html','',0,1),(2,'',NULL,'f,','','/1/2.html','',0,1),(3,'',NULL,'f,','','/1/3.html','',0,1),(4,'杭州和越','<p><strong>公司名称</strong>：<span style=\"text-decoration: underline;\"><em>杭州和越科技有限公司</em></span></p>','','杭州和越','/2/index.html','',0,1),(8,'杭州和越','<p><span style=\"font-size: 20px;\">中国</span><strong>·</strong><span style=\"font-size: 14px;\">杭州</span></p><p><span style=\"font-size: 14px;\"><img src=\"/upload/editor/1/1464580378837.jpg\" title=\"1464580378837.jpg\" alt=\"hz.jpg\"/></span></p>','','杭州和越','/5/index.html','',0,1),(9,'杭州和越','<ul style=\"margin-right: 1.5em; margin-bottom: 1.5em; margin-left: 1.5em; padding: 0px; border: 0px; font-size: 12px; font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(17, 17, 17); line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\" class=\" list-paddingleft-2\"><li><p>Java 是一项用于开发应用程序的技术，可以让 Web 变得更有意思和更实用。 Java 与 javascript 并不相同，后者是一种用于创建 Web 页的简单技术，只能在浏览器中运行。</p></li><li><p>使用 Java 可以玩游戏、上载照片、联机聊天以及参与虚拟体验，并能够使用联机培训、网上银行和互动地图等服务。如果没有安装 Java，则许多应用程序和网站都无法工作。</p></li><li><p>默认情况下，Java 将自动通知您有新的更新可供安装。&nbsp;<strong>为确保软件最新和计算机安全，请您务必接受并安装更新。</strong>&nbsp;如果您在 Windows 计算机上收到了更新 Java 的通知但您记得从未下载或安装它，则有可能是 Java 已经随您的新计算机预先加载。</p></li></ul><p><br/></p>','','杭州和越','/6/9.html','Java ',0,1),(10,'杭州和越','<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Android是一种基于Linux的自由及开放源代码的操作系统，主要使用于移动设备，如智能手机和平板电脑，由Google公司和开放手机联盟领导及开发。尚未有统一中文名称，中国大陆地区较多人使用“安卓”或“安致”。Android操作系统最初由Andy Rubin开发，主要支持手机。2005年8月由Google收购注资。2007年11月，Google与84家硬件制造商、软件开发商及电信营运商组建开放手机联盟共同研发改良Android系统。随后Google以Apache开源许可证的授权方式，发布了Android的源代码。第一部Android智能手机发布于2008年10月。Android逐渐扩展到平板电脑及其他领域上，如电视、数码相机、游戏机等。2011年第一季度，Android在全球的市场份额首次超过塞班系统，跃居全球第一。 2013年的第四季度，Android平台手机的全球市场份额已经达到78.1%. 2013年09月24日谷歌开发的操作系统Android在迎来了5岁生日，全世界采用这款系统的设备数量已经达到10亿台。</p>','','杭州和越','/6/10.html','',0,1),(11,'杭州和越','<header class=\"section section-hero\" data-analytics-section-engagement=\"name:hero\" style=\"position: relative; margin-bottom: -110px; color: rgb(51, 51, 51); font-family: &#39;PingFang SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, STHeitiSC-Light, Arial, sans-serif; line-height: 28.8px; white-space: normal; background-color: rgb(255, 255, 255);\"><h1 class=\"headline-hero-page\" style=\"margin: 0px auto 18px; padding: 0px; line-height: 1.06667; letter-spacing: 0px; font-size: 60px; font-weight: 200; text-align: center; font-family: PingHei, &#39;Helvetica Neue&#39;, Helvetica, STHeitiSC-Light, Arial, sans-serif; width: 646px;\">先进的移动操作系统</h1><p class=\"intro\" style=\"margin: 0px auto 13px; padding: 0px; font-size: 22px; line-height: 1.54545; text-align: center; font-family: PingHei, &#39;PingFang SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, STHeitiSC-Light, Arial, sans-serif; width: 750px;\">iOS 9 简单易用的界面、出色的功能和源自核心的安全性，令其成为 iPhone、iPad 和 iPod&nbsp;touch 的强大基础。它看起来赏心悦目，用起来同样得心应手。甚至连简单的日常任务，做起来也更引人入胜。由于 iOS 9 是为充分发挥 Apple 硬件蕴含的先进技术而设计，你的设备将始终保持卓越。</p><p></p><figure class=\"image image-what-is-hero\" style=\"margin: -92px 0px 60px -1050.5px; padding: 0px; height: 954px; width: 2101px; position: relative; left: 490px; background-image: url(&quot;http://images.apple.com/cn/ios/images/what-is/hero_large_2x.png&quot;); background-size: 2101px 954px; background-repeat: no-repeat;\"></figure><p></p></header><p><section class=\"section section-interface alternate\" data-analytics-section-engagement=\"name:interface\" style=\"position: relative; color: rgb(51, 51, 51); font-family: &#39;PingFang SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, STHeitiSC-Light, Arial, sans-serif; line-height: 28.8px; white-space: normal; background-color: rgb(250, 250, 250);\"></section></p><p><br/></p>','','杭州和越','/6/11.html','',0,1),(12,'杭州和越','<p>后台、前端、移动端（<span style=\"font-family: &#39;comic sans ms&#39;;\"><em>Android/iOS</em></span>）</p>','','杭州和越','/3/index.html','',0,1),(13,'','<p>休假（请假）管理</p>','','','/4/13.html','',0,1),(14,'','<p>资管辅助</p>','','','/4/14.html','',0,1),(15,'','<p>内控</p>','','','/4/15.html','',0,1),(16,'','<p>耗材管理、人员薪酬管理</p>','','','/4/16.html','',0,1),(17,'','<p>耗材管理</p>','','','/4/17.html','',0,1),(18,'','<p>家宽、政企、任务单、驻地网</p>','','','/4/18.html','',0,1),(19,'',NULL,'','','/7/19.html','',0,1),(20,'',NULL,'','','/7/20.html','',0,1);
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_case_1`
--

DROP TABLE IF EXISTS `cms_case_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_case_1` (
  `basicId` int(11) NOT NULL,
  `caseType` varchar(225) DEFAULT '自主研发,其他',
  PRIMARY KEY (`basicId`),
  CONSTRAINT `fk_cms_case_1_basicId` FOREIGN KEY (`basicId`) REFERENCES `basic` (`BASIC_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_case_1`
--

LOCK TABLES `cms_case_1` WRITE;
/*!40000 ALTER TABLE `cms_case_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_case_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_column`
--

DROP TABLE IF EXISTS `cms_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_column` (
  `COLUMN_CATEGORYID` int(22) NOT NULL DEFAULT '0' COMMENT '关联category表（类别表ID）',
  `COLUMN_KEYWORD` varchar(300) DEFAULT NULL COMMENT '栏目简介',
  `COLUMN_DESCRIP` varchar(500) DEFAULT NULL COMMENT '栏目关键字描述',
  `COLUMN_TYPE` int(2) DEFAULT NULL COMMENT '1,代表列表栏目。2，代表缩单篇。',
  `COLUMN_URL` varchar(50) DEFAULT NULL COMMENT '如果是外部链接，则保持外部链接地址。如果为最终列表栏目，就保存文章显示列表',
  `COLUMN_LISTURL` varchar(50) DEFAULT NULL COMMENT '最终列表栏目的列表模板地址',
  `COLUMN_TENTMODELID` int(22) DEFAULT NULL COMMENT '栏目类型,直接影响栏目发布的表单样式',
  `COLUMN_WEBSITEID` int(22) DEFAULT NULL COMMENT '栏目所属站点ID',
  `COLUMN_PATH` varchar(150) DEFAULT NULL COMMENT '栏目路径',
  `COLUMN_CONTENTMODELID` int(11) DEFAULT '0' COMMENT '栏目管理的内容模型id',
  PRIMARY KEY (`COLUMN_CATEGORYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_column`
--

LOCK TABLES `cms_column` WRITE;
/*!40000 ALTER TABLE `cms_column` DISABLE KEYS */;
INSERT INTO `cms_column` VALUES (1,'','',1,'about.htm','about.htm',NULL,1,'/1',0),(2,'','',2,'about.htm','about.htm',NULL,1,'/2',0),(3,'','',2,'about.htm','about.htm',NULL,1,'/3',0),(4,'','',1,'detail.htm','list.htm',NULL,1,'/4',0),(5,'','',2,'about.htm','about.htm',NULL,1,'/5',0),(6,'','',1,'detail.htm','list.htm',NULL,1,'/6',0),(7,'','',1,'detail.htm','list.htm',NULL,1,'/7',0);
/*!40000 ALTER TABLE `cms_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_content_mode_field`
--

DROP TABLE IF EXISTS `cms_content_mode_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_content_mode_field` (
  `FIELD_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段自增长id',
  `FIELD_TIPSNAME` varchar(30) DEFAULT NULL COMMENT '字段提示文字',
  `FIELD_FIELDNAME` varchar(20) DEFAULT NULL COMMENT '字段名称',
  `FIELD_TYPE` int(11) DEFAULT NULL COMMENT '字段类型（如1.单行，2.多行，3.图片，等）',
  `FIELD_DEFAULT` varchar(250) DEFAULT NULL COMMENT '字段默认值',
  `FIELD_ISNULL` int(11) DEFAULT NULL COMMENT '字段是否为空 0:必填 1:可选',
  `FIELD_CMID` int(11) DEFAULT NULL COMMENT '关联内容模型表id',
  `FIELD_SORT` int(11) DEFAULT NULL COMMENT '字段排序',
  `FIELD_ISSEARCH` int(255) DEFAULT NULL COMMENT '字段是否支持后台搜索0：不支持，1：支持',
  `FIELD_LENGTH` int(11) DEFAULT '1' COMMENT '字段长度',
  PRIMARY KEY (`FIELD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自定义内容模型关联字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_content_mode_field`
--

LOCK TABLES `cms_content_mode_field` WRITE;
/*!40000 ALTER TABLE `cms_content_mode_field` DISABLE KEYS */;
INSERT INTO `cms_content_mode_field` VALUES (1,'类型','caseType',10,'自主研发,其他',0,1,NULL,0,1);
/*!40000 ALTER TABLE `cms_content_mode_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_content_model`
--

DROP TABLE IF EXISTS `cms_content_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_content_model` (
  `CM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `CM_TIPSNAME` varchar(30) NOT NULL COMMENT '表单提示文字',
  `CM_TABLENAME` varchar(20) NOT NULL COMMENT '表单名称',
  `CM_MANAGERID` int(11) NOT NULL COMMENT '表单管理员ID',
  PRIMARY KEY (`CM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自定义模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_content_model`
--

LOCK TABLES `cms_content_model` WRITE;
/*!40000 ALTER TABLE `cms_content_model` DISABLE KEYS */;
INSERT INTO `cms_content_model` VALUES (1,'案例','cms_case_1',1);
/*!40000 ALTER TABLE `cms_content_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_search`
--

DROP TABLE IF EXISTS `cms_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_search` (
  `SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `SEARCH_NAME` varchar(20) NOT NULL COMMENT '搜索名称',
  `SEARCH_TEMPLETS` varchar(50) NOT NULL COMMENT '搜索结果模版',
  `SEARCH_WEBSITEID` int(11) NOT NULL COMMENT '搜索管理的应用id',
  PRIMARY KEY (`SEARCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义搜索表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_search`
--

LOCK TABLES `cms_search` WRITE;
/*!40000 ALTER TABLE `cms_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID（主键）',
  `COMMENT_COMMENTID` int(11) NOT NULL COMMENT '父评论ID',
  `COMMENT_CONTENT` text NOT NULL COMMENT '评论的内容',
  `COMMENT_PICTURE` varchar(300) DEFAULT NULL COMMENT '评论时发布的图片，可上传多张图片',
  `COMMENT_TIME` datetime NOT NULL COMMENT '评论时间',
  `COMMENT_TYPE` int(11) NOT NULL DEFAULT '2' COMMENT '评论的类型：1 匿名，2 公开，默认为公开',
  `COMMENT_PEOPLEID` int(11) DEFAULT '0' COMMENT '评论者ID，默认为非会员用户（即游客）',
  `COMMENT_POINTS` int(11) DEFAULT '0' COMMENT '评价打分（-1至5分）',
  `COMMENT_BASICID` int(11) NOT NULL COMMENT '（文章、商品...）绑定basicId（外键）',
  `COMMENT_APPID` int(11) DEFAULT NULL COMMENT '(文章、商品）绑定的应用编号',
  PRIMARY KEY (`COMMENT_ID`),
  KEY `index2` (`COMMENT_BASICID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diy_form`
--

DROP TABLE IF EXISTS `diy_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diy_form` (
  `DF_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `DF_TIPSNAME` varchar(30) NOT NULL COMMENT '自定义表单提示文字',
  `DF_TABLENAME` varchar(20) NOT NULL COMMENT '自定义表单表名',
  `DF_MANAGERID` int(11) NOT NULL COMMENT '自定义表单关联的关联员id',
  `DF_APPID` int(11) DEFAULT NULL COMMENT '自定义表单关联的应用编号',
  PRIMARY KEY (`DF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diy_form`
--

LOCK TABLES `diy_form` WRITE;
/*!40000 ALTER TABLE `diy_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `diy_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diy_form_field`
--

DROP TABLE IF EXISTS `diy_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diy_form_field` (
  `DFF_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段自增长id',
  `DFF_TIPSNAME` varchar(30) DEFAULT NULL COMMENT '字段提示文字',
  `DFF_FIELDNAME` varchar(20) DEFAULT NULL COMMENT '字段名称',
  `DFF_TYPE` int(11) DEFAULT NULL COMMENT '字段类型（如1.单行，2.多行，3.图片，等）',
  `DFF_DEFAULT` varchar(250) DEFAULT NULL COMMENT '字段的默认值',
  `DFF_ISNULL` int(11) DEFAULT NULL COMMENT '字段是否为空',
  `DFF_SORT` int(11) DEFAULT NULL COMMENT '自定义表单的排序',
  `DFF_FORMID` int(11) DEFAULT NULL COMMENT '字段管理的表单id',
  PRIMARY KEY (`DFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diy_form_field`
--

LOCK TABLES `diy_form_field` WRITE;
/*!40000 ALTER TABLE `diy_form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `diy_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `MANAGER_ID` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '管理员ID(主键)',
  `MANAGER_NAME` varchar(15) DEFAULT NULL COMMENT '管理员用户名',
  `MANAGER_NICKNAME` varchar(15) DEFAULT NULL COMMENT '管理员昵称',
  `MANAGER_PASSWORD` varchar(45) DEFAULT NULL COMMENT '管理员密码',
  `MANAGER_ROLEID` bigint(22) DEFAULT NULL COMMENT '角色编号',
  `MANAGER_PEOPLEID` bigint(22) DEFAULT '0' COMMENT '用户编号即商家编号',
  `MANAGER_TIME` datetime DEFAULT NULL COMMENT '管理员创建时间',
  PRIMARY KEY (`MANAGER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'admin','admin','21232f297a57a5a743894a0e4a801fc3',1,0,'2016-05-26 14:47:56');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_model_page`
--

DROP TABLE IF EXISTS `manager_model_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_model_page` (
  `mmp_managerID` int(11) DEFAULT NULL COMMENT '自增长id',
  `mmp_modelID` int(11) DEFAULT NULL COMMENT '模块编号',
  `mmp_url` varchar(255) DEFAULT NULL COMMENT '默认后台显示的主界面'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台主界面管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_model_page`
--

LOCK TABLES `manager_model_page` WRITE;
/*!40000 ALTER TABLE `manager_model_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_model_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `MODEL_ID` int(22) NOT NULL AUTO_INCREMENT COMMENT '模块自增长id',
  `MODEL_TITLE` varchar(150) DEFAULT NULL COMMENT '模块标题',
  `MODEL_CODE` varchar(255) DEFAULT NULL COMMENT '模块编码',
  `MODEL_MODELID` int(22) DEFAULT NULL COMMENT '模块的父模块id',
  `MODEL_URL` varchar(255) DEFAULT NULL COMMENT '模块连接地址',
  `MODEL_DATETIME` datetime DEFAULT NULL,
  `MODEL_ICON` varchar(120) DEFAULT NULL COMMENT '模块图标',
  `MODEL_MODELMANAGERID` int(11) DEFAULT NULL COMMENT '模块关联的关联员id',
  `MODEL_SORT` int(11) DEFAULT NULL COMMENT '模块的排序',
  `MODEL_ISMENU` int(1) DEFAULT NULL COMMENT '模块是否是菜单',
  PRIMARY KEY (`MODEL_ID`),
  UNIQUE KEY `SYS_C009201` (`MODEL_ID`),
  KEY `MODEL_MODELID` (`MODEL_MODELID`),
  KEY `model_code` (`MODEL_CODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'内容管理','02000000',0,'','2016-05-27 11:27:48','&#xe77a;',0,NULL,NULL),(2,'栏目管理','02990000',1,'/manager/cms/column/list.do','2016-05-27 11:27:48','',0,NULL,NULL),(3,'文章管理','02980000',1,'/manager/cms/article/index.do','2016-05-27 11:27:48','',0,NULL,NULL),(4,'会员中心','07000000',0,'','2016-05-27 11:27:48','&#xe6b6;',0,NULL,1),(5,'用户管理','07020100',4,'/manager/people/user/list.do','2016-05-27 11:27:48','',0,NULL,1),(6,'权限管理','01000000',0,'','2016-05-27 11:27:48','&#xe950;',0,NULL,NULL),(7,'管理员管理','01020000',6,'/manager/manager/queryList.do','2016-05-27 11:27:48','',0,NULL,NULL),(8,'角色管理','01010000',6,'/manager/role/queryList.do','2016-05-27 11:27:48','',0,NULL,NULL),(9,'系统管理','12000000',0,'','2016-05-27 11:27:48','&#xe71f;',0,NULL,NULL),(10,'应用设置','12010000',9,'/manager/app/-1/edit.do','2016-05-27 11:27:48','',0,NULL,NULL),(11,'自定义模型','02060000',9,'/manager/mdiy/contentModel/list.do','2016-05-27 11:27:48','',0,NULL,NULL),(12,'自定义搜索','02050000',9,'/manager/mdiy/search/list.do','2016-05-27 11:27:48','',0,NULL,NULL),(13,'自定义表单','12050000',9,'/manager/mdiy/diyForm/form/list.do','2016-05-27 11:27:48',NULL,NULL,NULL,NULL),(14,'自定义页面','12030100',9,'/manager/mdiy/modeltemplate/list.do','2016-05-27 11:27:48',NULL,0,NULL,NULL),(15,'模板管理','12020000',9,'/manager/template/queryTemplateSkin.do','2016-05-27 11:27:48',NULL,NULL,NULL,NULL),(16,'生成器','11000000',0,'','2016-05-27 11:27:48','&#xe6cc;',0,NULL,NULL),(17,'生成主页','11010000',16,'/manager/cms/generate/index.do','2016-05-27 11:27:48','',0,NULL,NULL),(18,'生成栏目','11020000',16,'/manager/cms/generate/column.do','2016-05-27 11:27:48','',0,NULL,NULL),(19,'生成文章','11030000',16,'/manager/cms/generate/article.do','2016-05-27 11:27:48','',0,NULL,NULL);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_template`
--

DROP TABLE IF EXISTS `model_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_template` (
  `mt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `mt_modelID` int(11) DEFAULT NULL COMMENT '模块id',
  `mt_appID` int(11) DEFAULT NULL COMMENT '应用id',
  `mt_path` varchar(255) DEFAULT NULL COMMENT '自定义页面绑定模板的路径',
  `mt_title` varchar(255) DEFAULT NULL COMMENT '自定义页面标题',
  `mt_key` varchar(255) DEFAULT NULL COMMENT '自定义页面访问路径',
  PRIMARY KEY (`mt_id`),
  KEY `mt_key` (`mt_key`) USING BTREE,
  KEY `mt_appID` (`mt_appID`),
  KEY `mt_modelID` (`mt_modelID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义页面表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_template`
--

LOCK TABLES `model_template` WRITE;
/*!40000 ALTER TABLE `model_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `PEOPLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '增长自ID',
  `PEOPLE_PHONE` varchar(30) DEFAULT NULL COMMENT '手机号码',
  `PEOPLE_NAME` varchar(30) DEFAULT NULL COMMENT '陆登账号',
  `PEOPLE_PASSWORD` varchar(50) DEFAULT NULL COMMENT '陆登密码',
  `PEOPLE_DATETIME` datetime NOT NULL COMMENT '注册时间',
  `PEOPLE_APP_ID` int(11) NOT NULL COMMENT '用户所属用户ID',
  `PEOPLE_MAIL` varchar(120) DEFAULT NULL COMMENT '用户邮箱',
  `PEOPLE_STATE` int(2) DEFAULT '0' COMMENT '用户状态',
  `PEOPLE_CODE` varchar(15) DEFAULT NULL COMMENT '随机验证码',
  `PEOPLE_CODESENDDATE` datetime DEFAULT NULL,
  `PEOPLE_PHONECHECK` int(1) DEFAULT NULL,
  `PEOPLE_MAILLCHECK` int(1) DEFAULT NULL,
  PRIMARY KEY (`PEOPLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='户用基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_user`
--

DROP TABLE IF EXISTS `people_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_user` (
  `PU_PEOPLE_ID` int(11) NOT NULL COMMENT '用户ID关联people表的（people_id）',
  `PU_REAL_NAME` varchar(50) DEFAULT NULL COMMENT '用户真实名称',
  `PU_ADDRESS` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `PU_ICON` varchar(120) DEFAULT NULL COMMENT '用户头像图标地址',
  `PU_NICKNAME` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `PU_SEX` int(2) DEFAULT NULL COMMENT '用户性别(0.未知、1.男、2.女)',
  `PU_BIRTHDAY` date DEFAULT NULL COMMENT '用户出生年月日',
  `PU_CARD` varchar(255) DEFAULT NULL COMMENT '身份证',
  `PU_APP_ID` int(11) NOT NULL COMMENT '用户所属应用ID',
  PRIMARY KEY (`PU_PEOPLE_ID`),
  KEY `PU_PEOPLE_ID` (`PU_PEOPLE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基础信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_user`
--

LOCK TABLES `people_user` WRITE;
/*!40000 ALTER TABLE `people_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `people_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLE_ID` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '角色ID，自增长',
  `ROLE_NAME` varchar(30) DEFAULT NULL COMMENT '角色名',
  `ROLE_MANAGERID` bigint(22) DEFAULT '0' COMMENT '角色管理员编号',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_model`
--

DROP TABLE IF EXISTS `role_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_model` (
  `RM_MODELID` int(22) DEFAULT NULL COMMENT '模块编号',
  `RM_ROLEID` int(22) DEFAULT NULL COMMENT '角色编号',
  UNIQUE KEY `index` (`RM_MODELID`,`RM_ROLEID`) USING BTREE,
  KEY `RM_MODELID` (`RM_MODELID`) USING BTREE,
  CONSTRAINT `role_model_ibfk_1` FOREIGN KEY (`RM_MODELID`) REFERENCES `model` (`MODEL_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色模块关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_model`
--

LOCK TABLES `role_model` WRITE;
/*!40000 ALTER TABLE `role_model` DISABLE KEYS */;
INSERT INTO `role_model` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1);
/*!40000 ALTER TABLE `role_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_main_page`
--

DROP TABLE IF EXISTS `system_main_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_main_page` (
  `smp_appID` int(11) DEFAULT NULL COMMENT '自增长ID',
  `smp_url` varchar(255) DEFAULT NULL COMMENT '默认后台显示的主界面',
  `smp_modelID` int(11) DEFAULT NULL COMMENT '模块编号',
  `smp_managerID` int(11) DEFAULT NULL COMMENT '管理员编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台主界面管理界面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_main_page`
--

LOCK TABLES `system_main_page` WRITE;
/*!40000 ALTER TABLE `system_main_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_main_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_skin`
--

DROP TABLE IF EXISTS `system_skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_skin` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `ss_loginpage` varchar(255) DEFAULT NULL COMMENT '登陆页面',
  `ss_backgroundimg` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `ss_color` varchar(255) DEFAULT NULL COMMENT '字体颜色',
  `ss_css` varchar(255) DEFAULT NULL COMMENT '样式',
  `ss_datetime` datetime DEFAULT NULL COMMENT '生成时间',
  `ss_appID` int(11) DEFAULT NULL COMMENT '0后台发布大于０表示是应用自定义',
  `ss_categoryID` int(11) DEFAULT NULL COMMENT '主题分类',
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台皮肤管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_skin`
--

LOCK TABLES `system_skin` WRITE;
/*!40000 ALTER TABLE `system_skin` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_skin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_skin_manager`
--

DROP TABLE IF EXISTS `system_skin_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_skin_manager` (
  `ssm_managerID` int(11) NOT NULL DEFAULT '0' COMMENT '系统管理员编号',
  `ssm_system_skin_ID` int(11) DEFAULT NULL COMMENT '系统皮肤管理员编号',
  PRIMARY KEY (`ssm_managerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统皮肤与管理员关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_skin_manager`
--

LOCK TABLES `system_skin_manager` WRITE;
/*!40000 ALTER TABLE `system_skin_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_skin_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_article`
--

DROP TABLE IF EXISTS `v_article`;
/*!50001 DROP VIEW IF EXISTS `v_article`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_article` (
  `ARTICLE_BASICID` tinyint NOT NULL,
  `BASIC_ID` tinyint NOT NULL,
  `BASIC_CATEGORYID` tinyint NOT NULL,
  `BASIC_TITLE` tinyint NOT NULL,
  `BASIC_DESCRIPTION` tinyint NOT NULL,
  `BASIC_THUMBNAILS` tinyint NOT NULL,
  `BASIC_HIT` tinyint NOT NULL,
  `BASIC_DATETIME` tinyint NOT NULL,
  `BASIC_UPDATETIME` tinyint NOT NULL,
  `BASIC_PEOPLEID` tinyint NOT NULL,
  `ARTICLE_AUTHOR` tinyint NOT NULL,
  `ARTICLE_CONTENT` tinyint NOT NULL,
  `ARTICLE_TYPE` tinyint NOT NULL,
  `ARTICLE_SOURCE` tinyint NOT NULL,
  `ARTICLE_URL` tinyint NOT NULL,
  `ARTICLE_KEYWORD` tinyint NOT NULL,
  `ARTICLE_FREEORDER` tinyint NOT NULL,
  `ARTICLE_WEBID` tinyint NOT NULL,
  `COLUMN_KEYWORD` tinyint NOT NULL,
  `COLUMN_DESCRIP` tinyint NOT NULL,
  `COLUMN_TYPE` tinyint NOT NULL,
  `COLUMN_URL` tinyint NOT NULL,
  `COLUMN_LISTURL` tinyint NOT NULL,
  `COLUMN_TENTMODELID` tinyint NOT NULL,
  `COLUMN_WEBSITEID` tinyint NOT NULL,
  `column_path` tinyint NOT NULL,
  `COLUMN_CONTENTMODELID` tinyint NOT NULL,
  `CATEGORY_TITLE` tinyint NOT NULL,
  `CATEGORY_APPID` tinyint NOT NULL,
  `COLUMN_CATEGORYID` tinyint NOT NULL,
  `CATEGORY_ID` tinyint NOT NULL,
  `BASIC_SORT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_people_user`
--

DROP TABLE IF EXISTS `v_people_user`;
/*!50001 DROP VIEW IF EXISTS `v_people_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_people_user` (
  `PEOPLE_ID` tinyint NOT NULL,
  `PEOPLE_PHONE` tinyint NOT NULL,
  `PEOPLE_NAME` tinyint NOT NULL,
  `PEOPLE_PASSWORD` tinyint NOT NULL,
  `PEOPLE_DATETIME` tinyint NOT NULL,
  `PEOPLE_APP_ID` tinyint NOT NULL,
  `PEOPLE_MAIL` tinyint NOT NULL,
  `PEOPLE_STATE` tinyint NOT NULL,
  `PEOPLE_CODE` tinyint NOT NULL,
  `PEOPLE_CODESENDDATE` tinyint NOT NULL,
  `PEOPLE_PHONECHECK` tinyint NOT NULL,
  `PEOPLE_MAILLCHECK` tinyint NOT NULL,
  `PU_PEOPLE_ID` tinyint NOT NULL,
  `PU_REAL_NAME` tinyint NOT NULL,
  `PU_ADDRESS` tinyint NOT NULL,
  `PU_ICON` tinyint NOT NULL,
  `PU_NICKNAME` tinyint NOT NULL,
  `PU_SEX` tinyint NOT NULL,
  `PU_BIRTHDAY` tinyint NOT NULL,
  `PU_CARD` tinyint NOT NULL,
  `PU_APP_ID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'heyueit'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_getAllChildren` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllChildren`(`pId` int,`appId`int,`modelId` int)
BEGIN
	
   declare lev int;
   set lev=1;
   drop TEMPORARY table if exists tmp_category;    
   drop TEMPORARY table if exists tmp_category_child;    
   CREATE  TEMPORARY TABLE  tmp_category(category_id int(40),category_title varchar(50),category_categoryid varchar(40) ,lev INT) engine=memory;    
   CREATE  TEMPORARY TABLE  tmp_category_child(category_id int(40),category_title varchar(50),category_categoryid varchar(40) ,lev INT) engine=memory;    
   INSERT tmp_category SELECT category_id,category_title,category_categoryid,1 FROM `category` WHERE category_categoryid=pid and category_appid=appId and category_modelId=modelId;    
   INSERT tmp_category_child SELECT category_id,category_title,category_categoryid,1 FROM `category` WHERE category_categoryid=pid and category_appid=appId and category_modelId=modelId;   
  while ROW_COUNT()>0 
    do     set lev=lev+1; 
     INSERT tmp_category SELECT c.category_id,c.category_title,c.category_categoryid,lev  from category c  join tmp_category_child a on c.category_categoryid = a.category_id AND a.lev=lev-1 and c.category_appid=appId and c.category_modelId=modelId;
     INSERT tmp_category_child SELECT c.category_id,c.category_title,c.category_categoryid,lev  from category c  join tmp_category a on c.category_categoryid = a.category_id AND a.lev=lev-1 and c.category_appid=appId and c.category_modelId=modelId;
  end while ;    
  INSERT tmp_category SELECT c.category_id,c.category_title,c.category_categoryid,0 FROM category  c WHERE c.category_id=pid and c.category_appid=appId and c.category_modelId=modelId;   
  SELECT * FROM tmp_category;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_article`
--

/*!50001 DROP TABLE IF EXISTS `v_article`*/;
/*!50001 DROP VIEW IF EXISTS `v_article`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_article` AS select `cms_article`.`ARTICLE_BASICID` AS `ARTICLE_BASICID`,`basic`.`BASIC_ID` AS `BASIC_ID`,`basic`.`BASIC_CATEGORYID` AS `BASIC_CATEGORYID`,`basic`.`BASIC_TITLE` AS `BASIC_TITLE`,`basic`.`BASIC_DESCRIPTION` AS `BASIC_DESCRIPTION`,`basic`.`BASIC_THUMBNAILS` AS `BASIC_THUMBNAILS`,`basic`.`BASIC_HIT` AS `BASIC_HIT`,`basic`.`BASIC_DATETIME` AS `BASIC_DATETIME`,`basic`.`BASIC_UPDATETIME` AS `BASIC_UPDATETIME`,`basic`.`BASIC_PEOPLEID` AS `BASIC_PEOPLEID`,`cms_article`.`ARTICLE_AUTHOR` AS `ARTICLE_AUTHOR`,`cms_article`.`ARTICLE_CONTENT` AS `ARTICLE_CONTENT`,`cms_article`.`ARTICLE_TYPE` AS `ARTICLE_TYPE`,`cms_article`.`ARTICLE_SOURCE` AS `ARTICLE_SOURCE`,`cms_article`.`ARTICLE_URL` AS `ARTICLE_URL`,`cms_article`.`ARTICLE_KEYWORD` AS `ARTICLE_KEYWORD`,`cms_article`.`ARTICLE_FREEORDER` AS `ARTICLE_FREEORDER`,`cms_article`.`ARTICLE_WEBID` AS `ARTICLE_WEBID`,`cms_column`.`COLUMN_KEYWORD` AS `COLUMN_KEYWORD`,`cms_column`.`COLUMN_DESCRIP` AS `COLUMN_DESCRIP`,`cms_column`.`COLUMN_TYPE` AS `COLUMN_TYPE`,`cms_column`.`COLUMN_URL` AS `COLUMN_URL`,`cms_column`.`COLUMN_LISTURL` AS `COLUMN_LISTURL`,`cms_column`.`COLUMN_TENTMODELID` AS `COLUMN_TENTMODELID`,`cms_column`.`COLUMN_WEBSITEID` AS `COLUMN_WEBSITEID`,`cms_column`.`COLUMN_PATH` AS `column_path`,`cms_column`.`COLUMN_CONTENTMODELID` AS `COLUMN_CONTENTMODELID`,`category`.`CATEGORY_TITLE` AS `CATEGORY_TITLE`,`category`.`CATEGORY_APPID` AS `CATEGORY_APPID`,`cms_column`.`COLUMN_CATEGORYID` AS `COLUMN_CATEGORYID`,`category`.`CATEGORY_ID` AS `CATEGORY_ID`,`basic`.`BASIC_SORT` AS `BASIC_SORT` from (((`basic` join `cms_article` on((`basic`.`BASIC_ID` = `cms_article`.`ARTICLE_BASICID`))) join `cms_column` on((`basic`.`BASIC_CATEGORYID` = `cms_column`.`COLUMN_CATEGORYID`))) join `category` on((`cms_column`.`COLUMN_CATEGORYID` = `category`.`CATEGORY_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_people_user`
--

/*!50001 DROP TABLE IF EXISTS `v_people_user`*/;
/*!50001 DROP VIEW IF EXISTS `v_people_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_people_user` AS select `people`.`PEOPLE_ID` AS `PEOPLE_ID`,`people`.`PEOPLE_PHONE` AS `PEOPLE_PHONE`,`people`.`PEOPLE_NAME` AS `PEOPLE_NAME`,`people`.`PEOPLE_PASSWORD` AS `PEOPLE_PASSWORD`,`people`.`PEOPLE_DATETIME` AS `PEOPLE_DATETIME`,`people`.`PEOPLE_APP_ID` AS `PEOPLE_APP_ID`,`people`.`PEOPLE_MAIL` AS `PEOPLE_MAIL`,`people`.`PEOPLE_STATE` AS `PEOPLE_STATE`,`people`.`PEOPLE_CODE` AS `PEOPLE_CODE`,`people`.`PEOPLE_CODESENDDATE` AS `PEOPLE_CODESENDDATE`,`people`.`PEOPLE_PHONECHECK` AS `PEOPLE_PHONECHECK`,`people`.`PEOPLE_MAILLCHECK` AS `PEOPLE_MAILLCHECK`,`people_user`.`PU_PEOPLE_ID` AS `PU_PEOPLE_ID`,`people_user`.`PU_REAL_NAME` AS `PU_REAL_NAME`,`people_user`.`PU_ADDRESS` AS `PU_ADDRESS`,`people_user`.`PU_ICON` AS `PU_ICON`,`people_user`.`PU_NICKNAME` AS `PU_NICKNAME`,`people_user`.`PU_SEX` AS `PU_SEX`,`people_user`.`PU_BIRTHDAY` AS `PU_BIRTHDAY`,`people_user`.`PU_CARD` AS `PU_CARD`,`people_user`.`PU_APP_ID` AS `PU_APP_ID` from (`people` left join `people_user` on((`people`.`PEOPLE_ID` = `people_user`.`PU_PEOPLE_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-07 11:09:07
