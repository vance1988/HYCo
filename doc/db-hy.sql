-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: hy
-- ------------------------------------------------------
-- Server version	5.7.11

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
INSERT INTO `app` VALUES (1,'XXXX科技有限公司','http://localhost:8080/hy\r\n','/upload/app/1/logo.png','','Copyright &copy;2016 XXXX科技有限公司 版权所有','modern',1,'此模块域名比较关键，建议使用实际的域名（本地测试可以使用127.0.0.1或者localhost）,目前有两套样式，建议采用modern','2016-05-26 14:47:56','',NULL,'',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic`
--

LOCK TABLES `basic` WRITE;
/*!40000 ALTER TABLE `basic` DISABLE KEYS */;
INSERT INTO `basic` VALUES (1,'首页轮播图片样例一','此条目不需要设置任何东西，只需要配置图片即可，图片大小1900x1080','/upload/article/1/huandeng_demo1.png',0,1,'2016-05-27 12:58:45','2016-06-15 19:47:02',0,1,0,3),(2,'首页轮播图片样例二','此条目不需要设置任何东西，只需要配置图片即可，图片大小1900x1080','/upload/article/1/huandeng_demo2.png',0,2,'2016-05-27 12:59:23','2016-06-15 19:46:57',0,1,0,3),(3,'首页轮播图片样例三','此条目不需要设置任何东西，只需要配置图片即可，图片大小1900x1080','/upload/article/1/huandeng_demo3.png',0,3,'2016-05-27 13:00:21','2016-06-15 19:47:08',0,1,0,3),(4,'关于我们','此处文字对应首页公司简介，可以适当的添加对应的html标签，使用全角空格可以达到缩进效果','/upload/article/1/guanyuwomen_demo.png',0,0,'2016-05-30 11:40:20','2016-06-15 19:10:39',0,2,0,3),(8,'联系我们','','',0,0,'2016-05-30 11:53:02','2016-06-15 19:20:09',0,5,0,3),(9,'新闻一标题','此处会显示新闻一的简介到首页','/upload/article/1/xinwen_demo1.png',0,0,'2016-05-30 12:02:06','2016-06-15 19:22:13',0,6,0,3),(10,'新闻二标题','此处会显示新闻二的简介到首页','/upload/article/1/xinwen_demo2.png',0,0,'2016-05-30 12:39:27','2016-06-15 19:23:26',0,6,0,0),(11,'新闻三标题','此处会显示新闻三的简介到首页','/upload/article/1/xinwen_demo3.png',0,0,'2016-05-30 12:45:32','2016-06-15 19:24:27',0,6,0,3),(12,'服务和管理','','',0,0,'2016-05-30 14:34:19','2016-06-15 19:11:36',0,3,0,3),(13,'产品一','产品一的简要描述，会在产品列表页面展示','/upload/article/1/chanpin_demo1.png',0,0,'2016-05-30 14:35:38','2016-06-15 19:19:25',0,4,0,3),(14,'产品二','产品二的简要描述，会在产品列表页面展示','/upload/article/1/chanpin_demo2.png',0,0,'2016-05-30 14:36:22','2016-06-15 19:19:18',0,4,0,3),(15,'产品三','产品三的简要描述，会在产品列表页面展示','/upload/article/1/chanpin_demo3.png',0,0,'2016-05-30 14:36:54','2016-06-15 19:19:13',0,4,0,3),(16,'产品四','产品四的简要描述，会在产品列表页面展示','/upload/article/1/chanpin_demo4.png',0,0,'2016-05-30 14:37:52','2016-06-15 19:19:10',0,4,0,3),(17,'产品五','产品五的简要描述，会在产品列表页面展示','/upload/article/1/chanpin_demo5.png',0,0,'2016-05-30 14:38:39','2016-06-15 19:19:03',0,4,0,3),(18,'产品六','产品六的简要描述，会在产品列表页面展示','/upload/article/1/chanpin_demo6.png',0,0,'2016-05-30 14:39:16','2016-06-15 19:18:57',0,4,0,3),(19,'友情链接一','http://sun-ao.github.io','/upload/article/1/lianjie_demo1.png',0,0,'2016-05-30 15:17:33','2016-06-15 19:32:18',0,7,0,3),(20,'友情链接二','http://ms.mingsoft.net/','/upload/article/1/lianjie_demo2.png',0,0,'2016-05-30 15:19:22','2016-06-15 19:26:52',0,7,0,3),(21,'成员姓名','','/upload/article/1/chengyuan.png',0,0,'2016-06-15 19:28:17','2016-06-15 20:03:17',0,8,0,3),(22,'伙伴样式','','/upload/article/1/huoban.png',0,0,'2016-06-15 19:28:33','2016-06-15 20:02:43',0,9,0,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'首页幻灯',0,'2016-05-27 12:51:40',1,2,0,NULL,1,NULL),(2,'关于我们',0,'2016-05-27 13:49:23',1,2,0,NULL,1,NULL),(3,'服务和管理',0,'2016-05-27 13:49:50',1,2,0,NULL,1,NULL),(4,'产品和解决方案',0,'2016-05-27 13:50:22',1,2,0,NULL,1,NULL),(5,'联系我们',0,'2016-05-27 13:50:40',1,2,0,NULL,1,NULL),(6,'新闻中心',0,'2016-05-27 13:52:10',1,2,0,NULL,1,NULL),(7,'友情链接',0,'2016-05-27 13:52:45',1,2,0,NULL,1,NULL),(8,'团队',0,'2016-06-15 15:41:12',1,2,0,NULL,1,NULL),(9,'伙伴',0,'2016-06-15 15:41:54',1,2,0,NULL,1,NULL);
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
INSERT INTO `cms_article` VALUES (1,'',NULL,'f,','样例模板','/1/1.html','',0,1),(2,'',NULL,'f,','模板样例','/1/2.html','',0,1),(3,'',NULL,'f,','模板样例','/1/3.html','',0,1),(4,'','<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; 此处为关于我们的详情页面的详细介绍，可以在此处按自定样式和内容设置，对应的样式、图片等等<span style=\"color: rgb(192, 0, 0);\">会</span><span style=\"color: rgb(255, 0, 0);\">在</span><span style=\"color: rgb(255, 192, 0);\">详</span><span style=\"color: rgb(146, 208, 80);\">情</span><span style=\"color: rgb(0, 176, 80);\">页</span><span style=\"color: rgb(0, 176, 240);\">面</span><span style=\"color: rgb(0, 112, 192);\">对</span><em>应</em></strong><span style=\"text-decoration: underline;\"><strong>展</strong></span><span style=\"font-size: 24px;\"><strong>示</strong></span></p><p><span style=\"text-decoration: underline;\"><em><br/></em></span></p><p><span style=\"text-decoration: none;\">另外，此条目的文章缩略图也首页公司简介的图片，大小700x450</span><span style=\"text-decoration: underline;\"><em><br/></em></span><br/></p>','','样例模板','/2/index.html','',0,1),(8,'','<p><span style=\"font-size: 20px;\">中国</span><strong>·</strong><span style=\"font-size: 14px;\">杭州</span></p><p><span style=\"font-size: 14px;\"><br/></span></p><p><span style=\"font-size: 14px;\"><br/></span></p><p><span style=\"font-size: 14px;\">此处会在联系我们页面地图的右侧显示</span></p>','','模板样例','/5/index.html','',0,1),(9,'','<p>此处为新闻一的详情，会按照编辑的样式在新闻详情页展示</p><p><br/></p><p>此条目的文章缩略图会在新闻列表页面展示，大小600x300</p><p><br/></p>','','模板样例','/6/9.html','',0,1),(10,'','<p>&nbsp;此处为新闻二的详情，会按照编辑的样式在新闻详情页展示</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">此条目的文章缩略图会在新闻列表页面展示，大小600x300</p><p><br/></p>','','样例模板','/6/10.html','',0,1),(11,'','<p style=\"white-space: normal;\">此处为新闻三的详情，会按照编辑的样式在新闻详情页展示</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">此条目的文章缩略图会在新闻列表页面展示，大小600x300</p><p><br/></p>','','样例模板','/6/11.html','',0,1),(12,'','<p>后台、前端、移动端（<span style=\"font-family: &#39;comic sans ms&#39;;\"><em>Android/iOS</em></span>）</p><p><br/></p><p>此处是服务和管理详情页面展示的东西，会按照此处输入的样式对应展示</p>','','模板样例','/3/index.html','',0,1),(13,'','<p>此处会将产品一的详细内容在详情页展示</p><p><br/></p><p>注意：此条目的文章缩略图会在首页、产品列表页展示，大小700x450</p>','','样例模板','/4/13.html','',0,1),(14,'','<p>此处会将产品二的详细内容在详情页展示</p><p><br/></p><p>注意：此条目的文章缩略图会在首页、产品列表页展示，大小700x450</p>','','样例模板','/4/14.html','',0,1),(15,'','<p>此处会将产品三的详细内容在详情页展示</p><p><br/></p><p>注意：此条目的文章缩略图会在首页、产品列表页展示，大小700x450</p>','','样例模板','/4/15.html','',0,1),(16,'','<p>此处会将产品四的详细内容在详情页展示</p><p><br/></p><p>注意：此条目的文章缩略图会在首页、产品列表页展示，大小700x450</p>','','','/4/16.html','',0,1),(17,'','<p>此处会将产品五的详细内容在详情页展示</p><p><br/></p><p>注意：此条目的文章缩略图会在首页、产品列表页展示，大小700x450</p>','','样例模板','/4/17.html','',0,1),(18,'','<p>此处会将产品六的详细内容在详情页展示</p><p><br/></p><p>注意：此条目的文章缩略图会在首页、产品列表页展示，大小700x450</p>','','样例模板','/4/18.html','',0,1),(19,'','<p>此条目只需要填写两项，一个是文章缩略图为了首页展示，大小500x175，一个是描述为对应的网址，方便点击跳转</p>','','','/7/19.html','',0,1),(20,'','<p>此条目只需要填写两项，一个是文章缩略图为了首页展示，大小500x175，一个是描述为对应的网址，方便点击跳转</p>','','','/7/20.html','',0,1),(21,'','<p>成员在关于我们页面展示，大小700x450</p>','','模板样例','/8/21.html','',0,1),(22,'','<p>伙伴缩略图在关于我们页面展示，大小500x300</p>','','模板样例','/9/22.html','',0,1);
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
INSERT INTO `cms_case_1` VALUES (13,'自主研发'),(14,'其他'),(15,NULL),(16,NULL),(17,NULL),(18,NULL);
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
INSERT INTO `cms_column` VALUES (1,'','此处为固定设置，编号（ID）必须要为1，首页轮播图片取自此模块',1,'detail.htm','list.htm',NULL,1,'/1',0),(2,'','此处为固定设置，编号（ID）必须要为2，首页公司简介和关于我们的公司页面详情取自此栏目',2,'about.htm','about.htm',NULL,1,'/2',0),(3,'','此处为固定设置，编号（ID）必须要为3，服务和管理页面详情取自此栏目',2,'detail.htm','list.htm',NULL,1,'/3',0),(4,'','此处为固定设置，编号（ID）必须要为4，首页公司产品展示和产品列表页面、详情页面取自此栏目',1,'case.htm','cases.htm',NULL,1,'/4',1),(5,'','此处为固定设置，编号（ID）必须要为5，联系我们详情页面取自此栏目',2,'contact.htm','about.htm',NULL,1,'/5',0),(6,'','此处为固定设置，编号（ID）必须要为6，首页新闻提示和新闻中心列表、详情取自此模块',1,'news.htm','newses.htm',NULL,1,'/6',0),(7,'','此处为固定设置，编号（ID）必须要为7，首页友情链接取自此模块',1,'detail.htm','list.htm',NULL,1,'/7',0),(8,'','此处为固定设置，编号（ID）必须要为7，关于我们的公司团队信息取自此栏目',1,'detail.htm','list.htm',NULL,1,'/8',0),(9,'','此处为固定设置，编号（ID）必须要为8，关于我们的公司伙伴信息取自此栏目',1,'detail.htm','list.htm',NULL,1,'/9',0);
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
INSERT INTO `model` VALUES (1,'内容管理','02000000',0,'','2016-05-27 11:27:48','&#xe77a;',0,NULL,NULL),(2,'栏目管理','02990000',1,'/manager/cms/column/list.do','2016-05-27 11:27:48','',0,NULL,NULL),(3,'文章管理','02980000',1,'/manager/cms/article/index.do','2016-05-27 11:27:48','',0,NULL,NULL),(4,'会员中心','07000000',0,'','2016-05-27 11:27:48','&#xe6b6;',0,NULL,1),(5,'用户管理','07020100',4,'/manager/people/user/list.do','2016-05-27 11:27:48','',0,NULL,1),(6,'权限管理','01000000',0,'','2016-05-27 11:27:48','&#xe950;',0,NULL,NULL),(7,'管理员管理','01020000',6,'/manager/manager/queryList.do','2016-05-27 11:27:48','',0,NULL,NULL),(8,'角色管理','01010000',6,'/manager/role/queryList.do','2016-05-27 11:27:48','',0,NULL,NULL),(9,'系统管理','12000000',0,'','2016-05-27 11:27:48','&#xe71f;',0,NULL,NULL),(10,'应用设置','12010000',9,'/manager/app/1/edit.do','2016-05-27 11:27:48','',0,NULL,NULL),(11,'自定义模型','02060000',9,'/manager/mdiy/contentModel/list.do','2016-05-27 11:27:48','',0,NULL,NULL),(12,'自定义搜索','02050000',9,'/manager/mdiy/search/list.do','2016-05-27 11:27:48','',0,NULL,NULL),(13,'自定义表单','12050000',9,'/manager/mdiy/diyForm/form/list.do','2016-05-27 11:27:48',NULL,NULL,NULL,NULL),(14,'自定义页面','12030100',9,'/manager/mdiy/modeltemplate/list.do','2016-05-27 11:27:48',NULL,0,NULL,NULL),(15,'模板管理','12020000',9,'/manager/template/queryTemplateSkin.do','2016-05-27 11:27:48',NULL,NULL,NULL,NULL),(16,'生成器','11000000',0,'','2016-05-27 11:27:48','&#xe6cc;',0,NULL,NULL),(17,'生成主页','11010000',16,'/manager/cms/generate/index.do','2016-05-27 11:27:48','',0,NULL,NULL),(18,'生成栏目','11020000',16,'/manager/cms/generate/column.do','2016-05-27 11:27:48','',0,NULL,NULL),(19,'生成文章','11030000',16,'/manager/cms/generate/article.do','2016-05-27 11:27:48','',0,NULL,NULL);
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
-- Temporary view structure for view `v_article`
--

DROP TABLE IF EXISTS `v_article`;
/*!50001 DROP VIEW IF EXISTS `v_article`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_article` AS SELECT 
 1 AS `ARTICLE_BASICID`,
 1 AS `BASIC_ID`,
 1 AS `BASIC_CATEGORYID`,
 1 AS `BASIC_TITLE`,
 1 AS `BASIC_DESCRIPTION`,
 1 AS `BASIC_THUMBNAILS`,
 1 AS `BASIC_HIT`,
 1 AS `BASIC_DATETIME`,
 1 AS `BASIC_UPDATETIME`,
 1 AS `BASIC_PEOPLEID`,
 1 AS `ARTICLE_AUTHOR`,
 1 AS `ARTICLE_CONTENT`,
 1 AS `ARTICLE_TYPE`,
 1 AS `ARTICLE_SOURCE`,
 1 AS `ARTICLE_URL`,
 1 AS `ARTICLE_KEYWORD`,
 1 AS `ARTICLE_FREEORDER`,
 1 AS `ARTICLE_WEBID`,
 1 AS `COLUMN_KEYWORD`,
 1 AS `COLUMN_DESCRIP`,
 1 AS `COLUMN_TYPE`,
 1 AS `COLUMN_URL`,
 1 AS `COLUMN_LISTURL`,
 1 AS `COLUMN_TENTMODELID`,
 1 AS `COLUMN_WEBSITEID`,
 1 AS `column_path`,
 1 AS `COLUMN_CONTENTMODELID`,
 1 AS `CATEGORY_TITLE`,
 1 AS `CATEGORY_APPID`,
 1 AS `COLUMN_CATEGORYID`,
 1 AS `CATEGORY_ID`,
 1 AS `BASIC_SORT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_people_user`
--

DROP TABLE IF EXISTS `v_people_user`;
/*!50001 DROP VIEW IF EXISTS `v_people_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_people_user` AS SELECT 
 1 AS `PEOPLE_ID`,
 1 AS `PEOPLE_PHONE`,
 1 AS `PEOPLE_NAME`,
 1 AS `PEOPLE_PASSWORD`,
 1 AS `PEOPLE_DATETIME`,
 1 AS `PEOPLE_APP_ID`,
 1 AS `PEOPLE_MAIL`,
 1 AS `PEOPLE_STATE`,
 1 AS `PEOPLE_CODE`,
 1 AS `PEOPLE_CODESENDDATE`,
 1 AS `PEOPLE_PHONECHECK`,
 1 AS `PEOPLE_MAILLCHECK`,
 1 AS `PU_PEOPLE_ID`,
 1 AS `PU_REAL_NAME`,
 1 AS `PU_ADDRESS`,
 1 AS `PU_ICON`,
 1 AS `PU_NICKNAME`,
 1 AS `PU_SEX`,
 1 AS `PU_BIRTHDAY`,
 1 AS `PU_CARD`,
 1 AS `PU_APP_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'hy'
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

-- Dump completed on 2016-06-15 20:13:47
