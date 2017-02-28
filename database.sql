-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cua_test
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_info` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminNumber` varchar(20) NOT NULL,
  `loginName` varchar(20) NOT NULL,
  `adminName` varchar(20) NOT NULL,
  `adminPassword` varchar(50) NOT NULL,
  `adminDepartment` varchar(50) DEFAULT NULL,
  `adminSex` varchar(10) DEFAULT NULL,
  `adminMail` varchar(30) DEFAULT NULL,
  `adminPhoneNumber` varchar(20) DEFAULT NULL,
  `adminRole` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_info`
--

LOCK TABLES `admin_info` WRITE;
/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
INSERT INTO `admin_info` VALUES (2,'2014111003','admin','管理员','1234','信息部','男','1@163.com','18888888888','普通管理员'),(28,'2014111009','liao','李奡','111111','市场部','男','1@163.com','18888888888','超级管理员'),(38,'2014111006','admin6','李同学','123','信息部','男','1@163.com','18888888888','超级管理员'),(39,'555','555','赵六','123','信息部','男','1@163.com','18888888888','超级管理员'),(54,'2014111004','admin3','李四','123','信息部','男','1@163.com','18888888888','普通管理员'),(55,'2014111005','admin4','赵六','123','信息部','男','1@163.com','18888888888','超级管理员'),(56,'2014111007','admin7','李七','123','信息部','女','1@163.com','18888888888','普通管理员'),(59,'1111111111','wtwtw','wwwww','111','信息部','男','1@1.com','13311111111','超级管理员');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buser_info`
--

DROP TABLE IF EXISTS `buser_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buser_info` (
  `buserId` int(11) NOT NULL AUTO_INCREMENT,
  `buserName` varchar(50) DEFAULT NULL,
  `buserPasswd` varchar(10) DEFAULT NULL,
  `buserMail` varchar(45) DEFAULT NULL,
  `buserType` int(11) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  `verifyCode` varchar(45) DEFAULT NULL,
  `businessId` int(11) DEFAULT NULL,
  PRIMARY KEY (`buserId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buser_info`
--

LOCK TABLES `buser_info` WRITE;
/*!40000 ALTER TABLE `buser_info` DISABLE KEYS */;
INSERT INTO `buser_info` VALUES (2,'boss','123','12',2,1,'1234',1),(3,'fyboss','123',NULL,2,NULL,NULL,2),(5,NULL,NULL,'12@163.com',0,NULL,NULL,0),(6,'ass4','123','12@163.com',0,NULL,NULL,1),(7,'fy10','123','123@456.com',0,NULL,NULL,1);
/*!40000 ALTER TABLE `buser_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_info`
--

DROP TABLE IF EXISTS `business_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_info` (
  `businessId` int(11) NOT NULL AUTO_INCREMENT,
  `businessName` varchar(50) DEFAULT NULL,
  `businessPasswd` varchar(10) DEFAULT NULL,
  `businessMail` varchar(100) DEFAULT NULL,
  `isActive` varchar(100) DEFAULT NULL,
  `verifyCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`businessId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_info`
--

LOCK TABLES `business_info` WRITE;
/*!40000 ALTER TABLE `business_info` DISABLE KEYS */;
INSERT INTO `business_info` VALUES (1,'aaaaa','aaa','aaa','1',NULL),(2,'wan5','123',NULL,NULL,NULL),(3,'fy7','123',NULL,NULL,NULL),(4,'fyd','123',NULL,NULL,NULL),(5,'fyshop',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `business_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_info`
--

DROP TABLE IF EXISTS `comment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_info` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `content` text,
  `date` timestamp NULL DEFAULT NULL,
  `replayId` int(11) DEFAULT '0',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_info`
--

LOCK TABLES `comment_info` WRITE;
/*!40000 ALTER TABLE `comment_info` DISABLE KEYS */;
INSERT INTO `comment_info` VALUES (1,'fy1',NULL,NULL,'2016-07-07 03:13:52',0),(2,'fy1',NULL,NULL,'2016-07-07 03:21:56',0),(3,'fy1',NULL,NULL,'2016-07-07 03:22:22',0),(4,'fy1',15,'wwwwwww','2016-07-07 03:24:46',0),(5,'fy1',NULL,'haodehne','2016-07-07 05:42:40',0),(6,'fy1',15,'非常nice','2016-07-07 05:45:38',0),(7,'fy1',15,'真费事','2016-07-07 06:41:12',0),(8,'fy1',15,'累心','2016-07-07 06:46:31',0),(9,'fy1',15,'诶？我又好了？','2016-07-07 08:05:50',0),(10,'fy1',27,'我是陈杰 我去了香港玩 回来要请我的爸爸莫少华吃饭','2016-07-25 02:41:20',0),(11,'fy1',27,'这个地方真好玩呀','2016-07-28 02:45:59',0),(12,'fy1',27,'这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的，这是一段100字以上的长篇评论用来测试查看具体信息功能的。','2016-07-28 02:45:59',0),(13,'商家:boss',27,'下次再来啊 呵呵呵呵呵呵','2016-10-07 07:42:50',11),(14,'msh',27,'儿子长大了呀 真懂事','2016-10-07 07:43:45',10);
/*!40000 ALTER TABLE `comment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey_info`
--

DROP TABLE IF EXISTS `journey_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journey_info` (
  `journeyId` int(11) NOT NULL AUTO_INCREMENT,
  `journeyDayNumber` int(11) DEFAULT NULL,
  `journeyTitle` varchar(20) DEFAULT NULL,
  `journeyDescription` text,
  `journeyFileName` varchar(100) DEFAULT NULL,
  `journeyRealName` varchar(150) DEFAULT NULL,
  `productName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`journeyId`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_info`
--

LOCK TABLES `journey_info` WRITE;
/*!40000 ALTER TABLE `journey_info` DISABLE KEYS */;
INSERT INTO `journey_info` VALUES (1,1,'九华山之旅行程第一天','九华山之旅行程测试，九华山之旅行程测试，九华山之旅行程测试，九华山之旅行程测试！','111.jpg','27B843FC8FC64F4EAF7FE6BD8BEF5E19.jpg','九华山之旅'),(2,2,'九华山之旅行程第二天','九华山之旅行程测试，九华山之旅行程测试，九华山之旅行程测试，九华山之旅行程测试！','111.jpg','D107B71CAD944F64B3AE7587878D0261.jpg','九华山之旅'),(3,1,'伊春之旅行程第一天','伊春之旅行程测试','test2.jpg','2B1E07E175BC4B48B97D46CEF74E7DB5.jpg','伊春之旅'),(4,2,'伊春之旅行程第二天','伊春之旅行程测试','test2.jpg','3598B57A0D694FADBB9C26F49C4876B1.jpg','伊春之旅'),(5,1,'兴义之旅行程第一天','兴义之旅行程测试兴义之旅行程测试兴义之旅行程测试兴义之旅行程测试兴义之旅行程测试','test1.jpg','DEE4F3F0FFF340FF9A57A449D63D3B04.jpg','兴义之旅'),(6,2,'兴义之旅行程第二天','兴义之旅行程测试兴义之旅行程测试兴义之旅行程测试兴义之旅行程测试','test1.jpg','4AB267A13B5D4D0AA673DA6AF06FC2F3.jpg','兴义之旅'),(7,1,'安顺之旅行程第一天','安顺之旅行程测试安顺之旅行程','test1.jpg','1857F6C424514F41A568265B5278238F.jpg','安顺之旅'),(8,2,'安顺之旅行程第二天','安顺之旅行程测试','test1.jpg','1217544F5B8742DEADEC02417C46B614.jpg','安顺之旅'),(9,1,'惠州之旅行程第一天','惠州之旅行程测试','test2.jpg','1C971ED03535404985A48B43945B8DBF.jpg','惠州之旅'),(10,2,'惠州之旅行程第二天','惠州之旅行程测试','test2.jpg','F3F0E802A969451B911FF432DE9C6435.jpg','惠州之旅'),(11,1,'毕节之旅行程第一天','毕节之旅行程测试 ','test2.jpg','DD5C8E1F3E0F4BBF90B829103EDC8D41.jpg','毕节之旅'),(12,2,'毕节之旅行程第二天','毕节之旅行程测试 ','test2.jpg','F1D4C19CFC8746DE90CBE6C9F1357B45.jpg','毕节之旅'),(13,1,'满洲里之旅行程第一天','满洲里之旅行程测试','test1.jpg','0CC08D91D5454639805A4D4D6E614A5D.jpg','满洲里之旅'),(14,2,'满洲里之旅行程第二天','满洲里之旅行程测试','test1.jpg','8B24E5F40E1C4DB1BE57AF29C3E77907.jpg','满洲里之旅'),(15,1,'舟山之旅行程第一天','舟山之旅行程测试舟山之旅行程测试舟山之旅行程测试舟山之旅行程测试舟山之旅行程测试','test1.jpg','A3D67E4798974F2AA6D990AB82611279.jpg','舟山之旅'),(16,2,'舟山之旅行程第二天','舟山之旅行程测试舟山之旅行程测试舟山之旅行程测试舟山之旅行程测试','test1.jpg','3078E926D68D458C84BCC2C7556ADA74.jpg','舟山之旅'),(17,1,'阿尔山之旅行程第一天','阿尔山之旅行程测试','test1.jpg','B4AF91CFD0F04C1F8428A3009F0630BC.jpg','阿尔山之旅'),(18,2,'阿尔山之旅行程第二天','阿尔山之旅行程测试','test1.jpg','A0D67AA521924245BBC0E81CC77575DD.jpg','阿尔山之旅'),(19,1,'黄山之旅行程第一天','黄山之旅行程测试','test2.jpg','28C90AA57C8B44C2B1F93D192F7ADF3E.jpg','黄山之旅'),(20,2,'黄山之旅行程第二天','黄山之旅行程测试','test2.jpg','10A5F978E3AA42AAB3532616498FCE7E.jpg','黄山之旅'),(34,1,'去程','北京南苑乘坐KN2985，乘机时间：06：30—07：50北京南苑乘坐KN2985，乘机时间：06：30—07：50北京南苑乘坐KN2985，乘机时间：06：30—07：50\r\n北京南苑乘坐KN2985，乘机时间：06：30—07：50北京南苑乘坐KN2985，乘机时间：06：30—07：50','1.jpeg','8F629007DBF4484C957D0E8F2ECF4769.jpeg','阿尔山自由行'),(35,2,'自由活动','','3.jpeg','A9F334C0A9D742468A869E568217C20A.jpeg','阿尔山自由行'),(36,3,'回程','阿尔山机场乘坐KN2986，乘机时间：08：30—09：50','位3534534.jpg','087A0CF054794335A50083AC5092B029.jpg','阿尔山自由行'),(37,1,'阿尔山第一天','北京—阿尔山航班时间 （参考航班时间  KN2985 06：30—07：50）-公园\r\n接机后驱车前往国家4AAA级景区--【阿尔山国家地质森林公园】，沿途可观赏雪域高原湿地、冰雕玉琢的林海雪源雪山奇观，在厚厚的雪源里滚雪球、打雪仗、堆雪娃、做雪屋（地接社备工具）。走进火山地质公园，赏冬日奇观【不冻河】，九曲河流在零下20摄氏度严寒下缓缓流淌，冰雪相依、泉雪相恋，碧绿的水草在泉水中随波荡漾，偶有牛悠闲地走到河边低头饮水，然后又心满意足地踱步回栏。中午景区野菜特色餐，品尝一下东北风味的大饼子、大馇子、发糕、大葱蘸大酱、猪肉酸菜炖粉条、小鸡炖蘑菇、炒山野菜等家常饭菜。赴【杜鹃湖】，银冬的杜鹃湖，白茫茫的湖面一望无际，验林区传统习俗“滚冰”，拔河，拽爬犁，嬉戏玩耍。走进【三潭峡】峡谷，给人一种仙境之感，岸上有小路随河而行，三潭之间，弯路颇多，九曲回肠。下午【银江沟】冰雪乐园互动，车辆奔驰在林区。银江沟温泉分室内、室外两种，室内温泉，在温暖如春的室内，体验温泉对肌肤的滋润，感受琼浆玉露滋养身心；室外温泉，体会大自然赋予人类的冰火两重天。伊尔施品尝特色【烤羊排】，晚返回阿尔山。','342343.jpg','F3C9E2F3608F4E5F809F014AF1AD67D1.jpg','阿尔山团队行'),(38,2,'阿尔山第二天','阿尔山—白狼\r\n早餐后，8点出发，兴安岭顶【敖包祭祀】，以最圣洁的姿态接受着人们对它的顶礼膜拜，徒步挑战雪地【雾凇长廊】，让身体在蓝天雪地中尽情舒展，让激情在冰雪世界中尽情释放。\r\n中午来到【白狼林俗村】，一个个温馨的林家小院记载着务林人坚守北疆，艰苦创业，到目前仍然保留有六、七十年代林业工人的住房，是东北林区的一个典型村落，“小杆栅栏、柴户垛，房屋脊上挂山货，客人来了炕上坐，炉子火墙烟袋锅，炕上棉被垛成垛”，是对林区人传统生活方，式的概括。中餐品尝【林俗餐】，感受东北老乡家过大年味道。餐后乘坐【马拉爬犁（自理）】，穿行林家小院，参与抬木头、劈柈子、压井。\r\n下午返回阿尔山市，首先领略到的是阿尔山市独特的欧式建筑市貌，让您感受到北方边境城市的风采。后来到阿尔山滑雪场，它由西山滑雪比赛、训练场和东山滑雪游乐场两部分组成，是大型多功能雪上运动游乐场所。穿越林海雪原中体验滑雪之感，用最热烈的方式与冰雪交流。晚餐品尝【内蒙古羊肉涮火锅】，围着热乎乎的火锅，回味滑雪带来的愉悦！\r\n','1232321321.jpg','1A7ECC692EA645E999A1DEA1FB54E50A.jpg','阿尔山团队行'),(39,3,'阿尔山第三天','阿尔山—北京（参考航班时间  KN2986   08：30—09：50）\r\n早餐后送机，沿途回味美丽的阿尔山自然风光，地质风貌，那一群群热情的人……您慢慢的回味吧……','位3534534.jpg','5BB87EA623F443E2B4A9721B8B081A63.jpg','阿尔山团队行'),(40,1,'去程','北京南苑乘坐KN5887，乘机时间：09：05—12：10','243243.png','C23177AEDC3F47829455AE624163565C.png','惠州自由行'),(41,2,'自由活动','','650547_153700558100_2.jpg','DE5968827CB04F5683166F31939CED85.jpg','惠州自由行'),(42,3,'回程','惠州平潭机场乘坐KN5888，乘机时间：12：55—15：50','u=307833989,2848919132&fm=21&gp=0.jpg','B5C7ACC7E87042359A409F9004EF8B54.jpg','惠州自由行'),(43,1,'惠州第一天','惠州机场接团，前往哈斯塔特小镇，（车程约1小时）其地处惠州江北CBD都市生态新区（博罗）,借鉴奥地利建筑风格，以奥地利哈尔施塔特小镇为建筑蓝本，结合本地特点，倾力打造而成；随后前往有“苎萝西子”美誉的惠州西湖，惠州【西湖】是国家重点风景名胜区，天下西湖三十六，唯有惠州并足杭州，它至今已有1600多年的历史。惠州西湖也像其他山水名胜一样有许多文人知己，这些文人墨客走遍西湖的山头水尾，写下众多的诗词篇章。“西湖各有妙，此以曲折胜”，历代文人墨客为惠州西湖留下了宝贵的文化遗产。近代革命先驱孙中山、廖仲恺、邓演达以及中国共产党人周恩来等均在惠州城、西湖畔留下了光辉的革命踪迹；近年来，江泽民、李鹏、杨尚昆等党和国家领导人亲临惠州视察，对西湖自然幽雅的风光深表赞赏 “人间仙境”。依次游览三个小景点 苏堤——“茫茫水月漾湖天，人在苏堤千倾边，多少管窥夸见月，可知月在此间圆”然后游览：泗州塔——惠州的标志性建筑，始建于唐代“一更三吐月，玉塔卧微澜”接着游览：苏东坡纪念馆——里面陈列了苏东坡在惠州所写的诗词，书画，还有他的妾恃王朝云墓，后游览：九曲桥——走过九曲桥，所以烦恼都忘掉！\r\n晚餐后前往被誉为“小马尔代夫”的惠东巽寮湾海滨度假，巽寮湾是粤东数百公里中海水最洁净的海湾之一。巽寮滨海旅游度假区滨海旅游资源得天独厚。素以“石奇美、水奇清、沙奇白”而著称，被赐予“动物石景公园”、“绿色翡翠”、“天赐白金堤”、“东方夏威夷”等多种美誉。度假区内的海水水质和大气质量均为国家一级（类）标准。依山傍海分布着七山八湾十八景。海岸线迂回曲折，海底平坦坚实，海沙洁白晶莹，海水清澈蔚蓝，海礁千姿百态，与岸上的山石奇景交相辉映，形成秀美宜人的亚热带海滨沙滩风光，在这里可以享受一流的阳光和空气，领略蓝天、白云、沙滩、海浪的诗情画意，尽情欣赏琳琅满目的海底世界，令人叹为观止、流连忘返，度过难忘的蓝色之旅，入住酒店，自由活动。\r\n','23232.jpg','DF41289DFA0B448B863E4C2BF7AAACF3.jpg','惠州团队行'),(44,2,'惠州第二天','酒店早餐后海边坐船出海捕鱼。渔民船出海撒网捕鱼（约30分钟），享受捕鱼的乐趣，体验渔民的生活，一定会有不少的收获，畅游百岛风情、观海上风光。在渔民教导下乘船出海撒网捕鱼，收网后捕到的全部海鲜属于个人，体验渔民之乐。亲身感受捕渔的乐趣同时亦可欣赏各海岛的秀美风光。\r\n午餐后回酒店休息。\r\n下午前往粤东最具特色的【海滨温泉度假区】（车程约30分钟）,度假区以海洋文化为主题，72余种大小、功能不一的露天温泉池，星罗棋布于海滨园林之中，拥有全国独有的“温泉迷宫”和规模较大的海洋文化温泉，享受咸水温泉中的“极品”温泉，具有极高的医疗保健作用。\r\n   晚餐后入住酒店，自由活动。\r\n','2423434.jpg','F93515E1D47543BA89C2F10C0627C5B4.jpg','惠州团队行'),(45,3,'惠州第三天','酒店早餐后前往磨子石景区，作为巽寮湾十八景的磨子石是巽寮浅海石林景观的典型代表。据说每逢风云变幻时节，巨磨飞转，呼呼作响，周围各种各样形态奇特的石群吸引了国内外数以百万计的游客前来观光旅游，感受 “风涛摧磨”的鬼斧神工之妙。在这里，奇石形体的抽象结构、碧浪潮汐沿岸流的节律与和谐、海浪亲吻滋润沙滩留下的线纹姿式，“最能表现吾人身心的情调与律动” ！磨子石公园又称奇石海岸线，是巽寮一绝。这是一段风景奇丽的海岸线，在长沙湾与高排湾节点的沙滩上。设计最小干预的步道系统、多层次大视域的观景平台、烘托环境氛围安置的植物……设计师通过塑造特定的心理结构范式，把休闲的精神深入到山海旅游与自然活动中。此时的磨子石，不再是我们知性所把握的客体对象，而是提供给游客一片体现生命情调，放逸精神的心灵空间。午餐后乘车前往惠州机场结束愉快的行程！返回温暖的家。','3435534.jpg','5707E8AF25B142CCA30E34A6DD858C72.jpg','惠州团队行'),(46,1,'去程','北京南苑机场乘坐： KN5929，乘机时间：13：20—15：45','243243.png','2D5A8C9CAF404BE785E524422260C0BA.png','舟山自由行'),(47,2,'自由活动','','rkoo4qv3u7p8am5bflupluqb.jpg','D65873F49F1E401188CD0436CAFE75A6.jpg','舟山自由行'),(48,3,'回程','','5113e94dhca7bb0ff64c3&690.jpg','C41190D8633C414A8FE10714C5A7665F.jpg','舟山自由行'),(49,1,'舟山第一天','中午北京南苑机场乘飞机至舟山，KN5929，13：20/15：45，下午导游舟山机场接团，车赴朱家尖，晚餐后入住酒店休息。                                                              （住朱家尖，含晚餐）','7334ebeb-849b-4119-982e-fdbe63609352.jpg','FF54818D2B494EECB1E4A50B0F8C3367.jpg','舟山团队行'),(50,2,'舟山第二天','早餐后车赴朱家尖码头，乘船赴普陀山，抵达后游览【西天景区】：有观音古洞、二龟听法石、磐陀石、梅福庵、心字石等景点，感受西天取经的艰辛（约1.5小时），参观【普济寺禅寺】：主殿圆通宝殿供奉毗卢观音正身像，进香祈福（约50分钟），中餐后游览【法雨寺】：有九龙壁、天王殿、九龙宝殿、大雄宝殿等，进香礼佛（约40分钟），【千步沙沙滩】：呼吸清新空气、欣赏旖旎的山海风光（约40分钟），入住酒店休息。\r\n（住普陀山，含早中晚餐）\r\n','普陀1.jpg','52DC8077AD644C849E73E11236588D01.jpg','舟山团队行'),(51,3,'舟山第三天','早餐后游览【紫竹林景区】：有普陀山开山寺院—不肯去观音院，观音显圣处—潮音洞、紫竹禅林等景点（约40分钟），参观【南海观音铜像】：佛像顶现弥陀，妙状慈祥，总高33米，为亚金铜铸成，有礼佛广场、功德厅、五百观音堂等（约40分钟），中午乘船返回朱家尖，中餐后参观【朱家尖佛学院】：学院建筑风格仿盛唐佛教建筑，寺院中轴对称，宏大庄严（约40分钟），下午车送舟山机场，乘KN5930，14：30/19: 00机飞北京，结束愉快旅途！                                                                 （含早中餐）','普陀2.jpg','519F27DBBD6F476FBB4B1C7182FCDCCA.jpg','舟山团队行'),(58,1,'第一天','啊啊啊啊啊啊啊啊啊','6878A5F90DB64CF28F6A5E15B95E7DCC (1).jpg','37A9BC5710D845F4840AEF2E5A20CEF4.jpg','测试'),(63,2,'哈哈哈','','1CB4A8FF53634543B8483273420FB66D.jpg','2CDA2790389841FABB612A669512DB45.jpg','测试'),(64,1,'gggg','sdgsadg','3.jpeg','087470A5743A471C9E0340AAA65C8F22.jpeg','测test'),(65,1,'似的发射点','士大夫士大夫','4.jpeg','BE41627AF3A541DD9D39A2AA3BFAA3FE.jpeg','sdgsdgsdg'),(67,1,'we\'r\'v','','2.jpeg','973D73103CD14BC0BF2743BEFE9E1144.jpeg','test2'),(68,1,'ccccc','','secondarytile.png','8C0DFBF0880A4EE582E2B8BA6A39F461.png','rrrrrr'),(69,1,'第一天','','C0B30255CD0A4B8CABD950A2FFA4F13E.jpeg','91640072B61E4FA1A1B96E41976ADB55.jpeg','九寨沟自由行'),(70,1,'第一天','','C0B30255CD0A4B8CABD950A2FFA4F13E.jpeg','4CFF135AF81E4C458A78F133F3F6325B.jpeg','九寨沟自由行'),(71,1,'第一天','','C0B30255CD0A4B8CABD950A2FFA4F13E.jpeg','2D99852543AB418FB3BA3A6DF0DB28AE.jpeg','九寨沟自由行'),(72,1,'第一天','','1F074B09B6C042C48395D666E37BFBC7.jpg','F40C50DFC9564123B6786F7E68845674.jpg','九寨沟自由行'),(73,1,'第一天','','63d0f703918fa0ece21013bd259759ee3c6ddbaf.jpg','B85E4E08E2224F28B858B39763ECE737.jpg','九寨沟自由行'),(74,1,'第一天','','63d0f703918fa0ece21013bd259759ee3c6ddbaf.jpg','948B02985EF042298EB95A35BE894C0C.jpg','九寨沟自由行'),(75,1,'第一天','范德萨放大','63d0f703918fa0ece21013bd259759ee3c6ddbaf.jpg','0A11653621AD4263AF35CBDD9291BC5A.jpg','九寨沟自由行'),(76,1,'武汉','','3.png','8B9EA14DC7D84A819B59CCEE2920FABA.png','武汉自由行'),(77,2,'真好玩','hhhhhh','94cad1c8a786c917099c2589ca3d70cf3ac757e6.jpg','415094E307624E249AFECB7F6D12FF5D.jpg','武汉自由行'),(78,1,'第一天','','4.jpg','41E667F4CEEE4077975679C490CF0EE9.jpg','hhhh'),(79,1,'第一天','','4.jpg','F7FD7F758F874417911A5B12E995BA1B.jpg','hhhh'),(80,2,'第二天','','4.jpg','87297A4FD15D4FC0A529C9F1E4064847.jpg','hhhh'),(81,3,'第三天','','5.jpg','39A18A083B6E4D798E949486B5ACB118.jpg','hhhh'),(82,4,'第四天','','4.jpg','156FB2FBBCA7434B86DDA546475F683E.jpg','hhhh'),(83,5,'第五天','','4.jpg','CAFD48CBB49248538CACEF50A045A8DA.jpg','hhhh'),(84,6,'第六天','','5.jpg','0AB495FB18C24522A9D2A7ED0A0516B5.jpg','hhhh'),(85,7,'第七天','','4.jpg','288DBE042B104E348F811D13560E571F.jpg','hhhh'),(86,8,'第八天','','5.jpg','E73BBCFE9CA44FC0BD1E809BC5744725.jpg','hhhh'),(87,9,'第九天','','1.jpg','96C1BE6977F84CC5BA66255C3C508629.jpg','hhhh'),(88,10,'第十天','','3.png','E023240B963548E9BE21D6C7D61D9EAF.png','hhhh'),(89,11,'第十一天','','4.jpg','C52D18499E424FC6808897F0D5C1EC64.jpg','hhhh'),(90,12,'第十二天','','4.jpg','ADD0D420CF2D4FC0AB2B48BE6E862DB1.jpg','hhhh'),(91,13,'第十三天','','3.png','FA8CF5D0FCCF43BB8C5254086129BC7A.png','hhhh');
/*!40000 ALTER TABLE `journey_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_info`
--

DROP TABLE IF EXISTS `note_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_info` (
  `businessId` int(11) DEFAULT NULL,
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(100) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_info`
--

LOCK TABLES `note_info` WRITE;
/*!40000 ALTER TABLE `note_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_info` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productCellphone` varchar(20) DEFAULT NULL,
  `productDescription` text,
  `productFileName` varchar(100) DEFAULT NULL,
  `productRealName` varchar(150) DEFAULT NULL,
  `isTop` varchar(10) DEFAULT NULL,
  `startDate` varchar(10) DEFAULT NULL,
  `endDate` varchar(10) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `costDescription` text,
  `isPublic` varchar(10) DEFAULT NULL,
  `productFeature` text,
  `businessId` int(11) DEFAULT NULL,
  `orderWeight` int(11) DEFAULT '100',
  `tags` varchar(200) DEFAULT NULL,
  `relate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES (14,'阿尔山自由行',688,'010-87106764','1、产品类型：自由行/私人定制\r\n2、行程天数：3天2晚\r\n3、产品价格：\r\nA、成人价：688元/人起（三天两晚可选酒店，天数可增加）；\r\nB、儿童价：528元/人起（不占床）\r\nC、单房差：160元2晚/人（准三）；\r\n4、报名截止时间：出行前6天\r\n','imgs.rar','A26B9FADE5F44AC6B6777C59E352BB5F.jpg','是','2015-12-01','2015-12-31','阿尔山','1）只包含酒店和机票的费用 \r\n2）机票价格中包含机建费；\r\n3）产品价格不含免费行李，如需办理，请登陆官网www.flycua.com根据票号办理！','是','',2,200,'13,14,5,27','3,3,4,3'),(15,'阿尔山团队行',1478,'010-87106764','1、产品类型：团队行\r\n2、行程天数：3天2晚\r\n3、发团时间：2015年12月每周五-周日；\r\n4、团队产品价格：（10人成团）\r\nA、成人价：1478元/人（准四酒店）；\r\nB、儿童价：1058元/人（不含门票，不占床）\r\nC、单房差：220元2晚/人（准四）；\r\n5、报名截止时间：出行前6天','1.jpeg','78FC55728B394FCBB67A65453E8D76A9.jpeg','是','2015-12-01','2015-12-31','阿尔山','报价包含： 全程车费、餐费 (含五正两早）、住宿（两晚准四）、导服、景点等\r\n报价不包含：1、滑雪场项目  雪地摩托150元（10分钟）\r\n               雪地圈 80元/小时\r\n               教练：1、2个人100元  3-5人180元  5-10人240元   10人以上380元\r\n2、马拉爬犁 80元/人  租爬犁20元/\r\n3、海神温泉洗浴328元/人  会馆168-228元/人\r\n4、烤全羊 2480元/只起   烤羊排88元/斤\r\n','是','',2,90,'13,14,5,27','3,3,4,3'),(16,'惠州自由行',1080,'010-87106764','1、产品类型：自由行/私人定制\r\n2、行程天数：3天2晚\r\n3、产品价格：\r\nA、成人价：1080元/人起（三天两晚可选酒店，天数可增加）；\r\nB、儿童价：860元/人起（不含门票，不占床）\r\nC、单房差：220元2晚/人；\r\n4、报名截止时间：出行前6天\r\n\r\n','5681506_172512440153_2.jpg','AADA4C3717654E69A242531F9DAEE88B.jpg','是','2015-12-01','2015-12-31','惠州','1）只包含酒店和机票的费用 2）机票价格中包含机建费； 3）产品价格不含免费行李，如需办理，请登陆官网www.flycua.com根据票号办理！','是','',1,80,'22,9','5,3'),(17,'惠州团队行',1688,'010-87106764','1、产品类型：团队行\r\n2、行程天数：3天2晚\r\n3、发团时间：2015年12月每周五-周日；\r\n4、团队产品价格：（10人成团）\r\nA、成人价：1688元/人（商务酒店）；\r\nB、儿童价：1338元/人（不含门票，不占床）\r\nC、单房差：200元2晚/人；\r\n5、报名截止时间：出行前6天 \r\n','B08EE153CD534612BD98F77B896A2CCE.jpeg','A2FFFDA5CC7E483BAF86CCE5E8935AFE.jpeg','是','2015-12-01','2015-12-31','惠州','报价包含：1. 交通：空调旅游用车（按人数配车），保证每人一正座（特殊约定除外）；\r\n2. 门票：行程内标明景点的第一道门票（不含小门票）。\r\n3. 住宿：按星级标准建造酒店双标房，团队产生单男单女，客人需补房差费用或根据具体情况安排；\r\n4. 用餐：安排 4正2早餐（正餐为八菜一汤、十人一席）（酒店含早）；\r\n5.其他：优秀导游服务；\r\n6.保险：含旅行社责任险（最高保额50万元/人）\r\n报价不包含：景点内小门票、行程外的自费节目及私人所产生的个人费用等；\r\n','是','',1,80,'22,9','5,3'),(18,'舟山自由行',1078,'010-87106764','1、产品类型：自由行/私人定制\r\n2、行程天数：3天2晚\r\n3、产品价格：\r\nA、成人价：1078元/人起（三天两晚可选酒店，天数可增加）；\r\nB、儿童价：928元/人起（不含门票，不占床）\r\nC、单房差：120元2晚/人；\r\n4、报名截止时间：出行前6天\r\n','乘四2.jpg','73EEB2DE75B644F1A4675414E4B7D96D.jpg','是','2015-12-01','2015-12-31','舟山','1）只包含酒店和机票的费用 2）机票价格中包含机建费； 3）产品价格不含免费行李，如需办理，请登陆官网www.flycua.com根据票号办理！',NULL,NULL,1,70,'15,28,1','2,6,3'),(19,'舟山团队行',1738,'010-87106764','1、产品类型：团队行\r\n2、行程天数：3天2晚\r\n3、发团时间：2015年12月每周四-周六；\r\n4、团队产品价格：（10人成团）\r\nA、成人价：1738元/人（商务酒店）；\r\nB、儿童价：1238元/人（不含门票，不占床）\r\nC、单房差：320元2晚/人；\r\n5、报名截止时间：出行前6天\r\n','乘四3.jpg','9A44E7C2CF5C44278B62F4690298BDF6.jpg','是','2015-12-01','2015-12-31','舟山','报价包含：1、住宿：朱家尖商务型酒店标准双床房一晚，含双早，\r\n普陀山商务型酒店标准双床房一晚，含双早，若产生单男单女或房间升级须另补差价，\r\n2、门票：行程内普陀山正山门票、寺院香花劵， \r\n3、船票：朱家尖—普陀山往返船费，\r\n4、交通：行程内普陀山岛上景交用车，\r\n         舟山机场至朱家尖码头及朱家尖酒店接送用车，\r\n5、用餐： 4正餐，不含酒水，酒店内含双早，\r\n6、导服：当地优秀导游讲解服务及安排；\r\n7、机票：北京南苑往返舟山机票（含基建费）\r\n',NULL,NULL,1,70,'15,28,1','2,6,3'),(22,'测test',11555,'010-63392078','古古怪怪','imgs.zip','CDB4EF6971294E948C2745B419784EF3.zip','是','2016-07-07','2016-07-21','北京','hhhhhhhhhhhhhhhh','是','顶顶顶顶顶顶顶顶顶顶顶顶',1,90,'0','0'),(23,'sdgsdgsdg',123,'010-63392078','算法','imgs.zip','77BF14DCC74B4ED1B7664FF012CE3F73.zip','是','2016-07-04','2016-07-07','北京','士大夫但是','是','hhhhhh',1,60,'0','0'),(25,'test2',123,'010-63392078','','test.zip','E1E051D69D8D4AC5B64625A67CC9923C.zip','是','2016-07-05','2016-07-13','北京','','是','',1,60,'0','0'),(26,'九寨沟自由行',10000,'010-63392078','',NULL,NULL,'是','2016-07-13','2016-08-18','九寨沟','','是','',1,300,'29,19,30,16,17,18','5,8,4,5,5,5'),(27,'武汉自由行',200000,'010-63392078','','','','是','2016-07-13','2016-07-22','武汉','','是','',1,1000,'0','0'),(28,'九寨沟团队行',10000,'010-63392078','',NULL,NULL,'是','2016-07-13','2016-08-18','九寨沟','','是','',1,301,'0','0'),(29,'hhhh',10032,'010-63392078','','','','是','2016-06-09','2016-07-21','jdf','','是','',1,1000,'0','0'),(30,'杭州西湖灵隐寺游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'26,16','8,8'),(31,'上海迪士尼亲子游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'5','9'),(32,'世界环游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'0','0'),(33,'双山游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'1,2,3','7,7,7'),(34,'苏州特色游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'10,7,22','8,7,5'),(35,'故宫奥森三里屯一日游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'4,11,22,32','7,7,5,6'),(36,'颐和园游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'11,22','9,7'),(37,'北京故宫长城颐和园古迹游',998,'010-63392078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'11,22','10,10');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_info`
--

DROP TABLE IF EXISTS `question_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_info` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `questionName` varchar(100) DEFAULT NULL,
  `questionContent` text,
  `questionTime` varchar(30) DEFAULT NULL,
  `questionOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_info`
--

LOCK TABLES `question_info` WRITE;
/*!40000 ALTER TABLE `question_info` DISABLE KEYS */;
INSERT INTO `question_info` VALUES (15,'如何退票？\r\n','链接：自愿退票\r\n自愿退票是指由于旅客原因造成购票后提出退票要求。\r\n1.要求退票旅客如已打印行程单必须退回行程单原件，方可办理退票；\r\n2.退票费收取最低标准为50元，不足50元的按50元收取；\r\n3.退票需在原购票地点申请办理。\r\n链接：非自愿退票\r\n非自愿退票是指由于航空公司、天气、政府以及其他不可抗力原因造成旅客购票后提出退票要求。其中，航空公司原因包括：机务维护不善、航班调配不当、商务或机组失职等。\r\n申请非自愿退票需在原购票地点申请办理，不需开具航班延误（取消）证明。\r\n','2015-12-10 14:05:36',1),(17,'如何进行选座、值机、登机牌、取票、换牌？','自2015年3月29日起，除机票产品本身包含，我们的普通机票将不再提供免费选座服务。\r\n自主选座销售规则：\r\n1）网上自主选座截止时间为航班起飞前6小时；\r\n2）付费选座后不可单独进行更改与退款；\r\n3）当发生机票自愿退票时，自主选座费用不退还。\r\n座位位置	官网价格	柜台价格\r\n超级经济舱	600元	按照现场升舱规定执行\r\n前舱座位	20元	40元\r\n安全出口座位	无	50元\r\n后舱座位	10元	20元\r\n','2015-12-10 14:07:40',2),(18,'如何对机票进行改期、变更？','旅客购票后，如要求改变航班、日期，可到原购票地点申请，涉及费用依照相关产品规定办理。\r\n\r\n如遇航班变更、取消等非自愿改期情况，请拨打中联航电话客服400-102-6666办理。\r\n','2015-12-10 14:08:56',3),(19,'婴儿票的购买标准是什么？','出生14天以上 – 2周岁以内可购买婴儿票；\r\n婴儿票价为经济舱全价票的10%；\r\n婴儿必须由年满18周岁成人携带，1名成人只能携带1名婴儿；\r\n婴儿车可免费托运，尺寸不得超过40*60*100cm；\r\n每个航班可搭乘婴儿数量有限，请尽快购买以免影响出行。\r\n','2015-12-10 14:10:35',4),(20,'儿童票的购买标准是什么？','2周岁 – 12周岁以内的儿童可购买儿童票乘机；\r\n儿童票价为经济舱全价票的50%，如现机票折扣低于此票价也可购买成人票乘机；\r\n每名成人至多可带2名儿童乘机。\r\n','2015-12-10 14:11:42',5),(21,'机场停车场的收费标准是什么？','南苑机场停车收费标准：\r\n7:00 – 21:00，5元/小时；\r\n21:00 - 次日7:00，0.5元/小时；\r\n一天一夜75元。\r\n','2015-12-10 14:12:52',6),(22,'登机牌姓名有错误怎么处理？','错字部分如为同音不同字情况可以修改；\r\n如不是上述错误或者姓有误，只能退票重订，按自愿退票处理；\r\n修改姓名请联系电话客服：400-102-6666。\r\n','2015-12-10 14:15:07',7),(23,'登机牌上身份证号出错怎么办？','证件号码写错3位（含）以内，可做更改，操作请联系电话客服：400-102-6666。\r\n\r\n','2015-12-10 14:16:02',8);
/*!40000 ALTER TABLE `question_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategyfile_info`
--

DROP TABLE IF EXISTS `strategyfile_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strategyfile_info` (
  `strategyFileId` int(11) NOT NULL AUTO_INCREMENT,
  `strategyFileName` varchar(100) DEFAULT NULL,
  `strategyFileRealName` varchar(150) DEFAULT NULL,
  `strategyPhotoFileName` varchar(100) NOT NULL,
  `strategyPhotoRealName` varchar(150) NOT NULL,
  `amountOfDownload` int(11) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isTop` varchar(10) NOT NULL,
  `cityName` varchar(50) NOT NULL,
  `strategyJpgName` varchar(100) DEFAULT NULL,
  `strategyJpgRealName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`strategyFileId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategyfile_info`
--

LOCK TABLES `strategyfile_info` WRITE;
/*!40000 ALTER TABLE `strategyfile_info` DISABLE KEYS */;
INSERT INTO `strategyfile_info` VALUES (50,'阿尔山攻略.pdf','0DAED4448AE84751B9F2D76B17BB77B5.pdf','1.jpg','A60E358575D24073810D556267F9EEBA.jpg',0,'2016-07-01 02:19:06','是','阿尔山','test.zip','6F9C11EFF83E4A679FCD29F30616DAEA.zip'),(51,'安顺攻略.pdf','798577F0A54048EAA7473DECA58BE302.pdf','1.jpg','0EA64C744F164E45BBCEBE215717F22D.jpg',0,'2015-12-18 08:15:58','是','安顺','安顺 jpg.zip','93AE634B250D49EC99F0FF3E0DE3CD00.zip'),(52,'毕节攻略.pdf','9949305555474045AD541D4E88DF9252.pdf','1.jpg','B4E9FFC3622D47FBAEADEFA5B3E2488F.jpg',3,'2016-07-04 01:19:20','是','毕节','毕节jpg.zip','406060C77EEF4133A098609A97971155.zip'),(53,'黄山内页.pdf','059CCC842F604D5B8100A02ABA31AE7D.pdf','1.jpg','50011553843D40D3B242D548A9DDA8D5.jpg',0,'2015-12-18 08:21:07','是','黄山','黄山jpg.zip','3295B7407C8E49C0B96AC928EE8B5FA1.zip'),(54,'兴义攻略.pdf','aaa.pdf','B4E9FFC3622D47FBAEADEFA5B3E2488F.jpg','5B0ED86532B0468781D844BD362691B8.jpg',5,'2016-07-04 01:22:21','是','兴义','兴义jpg.zip','82DA97F5154F460688D906B3FBEFD523.zip'),(55,'舟山攻略.pdf','F3099D5D292F48019E9733DCAE9E1F5E.pdf','8F8ADDA18A40471CAB29E6CA93B0EC38.jpg','19AED8BB2E0A47AD9371EEAB7DD3E7D5.jpg',0,'2016-06-26 13:20:42','是','舟山','舟山jpg.zip','5E57805F5FD24FD4B97BAB15AD994375.zip'),(56,'九华山攻略.pdf','83367A95F6E14114B980CF81A7B9C23B.pdf','55B04EBAAE194B4CACF36740986F41EB.jpg','8F8ADDA18A40471CAB29E6CA93B0EC38.jpg',0,'2016-06-26 13:19:58','是','九华山','九华山jpg.zip','05A568D00D0242EFA652E98A8B5ACD65.zip'),(59,'1-1.pdf','0A69CAC652584C578702353A97476F08.pdf','B4E9FFC3622D47FBAEADEFA5B3E2488F.jpg','55B04EBAAE194B4CACF36740986F41EB.jpg',0,'2016-06-26 13:19:07','是','北京','1.zip','98E6853860BB4DCC9A83A3CC20163BCC.zip');
/*!40000 ALTER TABLE `strategyfile_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategytopphoto_info`
--

DROP TABLE IF EXISTS `strategytopphoto_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strategytopphoto_info` (
  `strategyTopPhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `strategyTopPhotoFileName` varchar(255) DEFAULT NULL,
  `strategyTopPhotoRealName` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL,
  `isTop` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`strategyTopPhotoId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategytopphoto_info`
--

LOCK TABLES `strategytopphoto_info` WRITE;
/*!40000 ALTER TABLE `strategytopphoto_info` DISABLE KEYS */;
INSERT INTO `strategytopphoto_info` VALUES (43,'1.jpeg','28D9FCC83F084F43B734237241158620.jpeg','2016-6-29 16:57:42','是'),(44,'4.jpeg','EED126C3238C4E99B09379A0101F0C4B.jpeg','2016-6-29 16:57:50','是');
/*!40000 ALTER TABLE `strategytopphoto_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtags_info`
--

DROP TABLE IF EXISTS `subtags_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subtags_info` (
  `subtagId` int(11) NOT NULL AUTO_INCREMENT,
  `subtagName` varchar(45) NOT NULL,
  `tagNo` int(11) NOT NULL,
  PRIMARY KEY (`subtagId`),
  UNIQUE KEY `subtagId_UNIQUE` (`subtagId`),
  UNIQUE KEY `subtagName_UNIQUE` (`subtagName`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtags_info`
--

LOCK TABLES `subtags_info` WRITE;
/*!40000 ALTER TABLE `subtags_info` DISABLE KEYS */;
INSERT INTO `subtags_info` VALUES (1,'中低山',1),(2,'雪山',1),(3,'高山',1),(4,'观景公园',9),(5,'游乐公园',9),(6,'海洋公园',9),(7,'南方美食',10),(8,'北方美食',10),(9,'民族美食',10),(10,'园林',7),(11,'宫城',7),(12,'陵墓',7),(13,'火山',1),(14,'温泉',11),(15,'海滨',6),(16,'湖泊',6),(17,'河流',6),(18,'泉水',6),(19,'森林',5),(20,'草原',5),(21,'花卉',5),(22,'古建筑',7),(23,'现代建筑',7),(24,'民族建筑',7),(25,'沙滩',6),(26,'宗教建筑',7),(27,'山脉',2),(28,'岛屿',6),(29,'山沟',1),(30,'珍惜动物',14),(31,'地方特色动物',14),(32,'购物',11);
/*!40000 ALTER TABLE `subtags_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_info`
--

DROP TABLE IF EXISTS `tags_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_info` (
  `tagNo` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(45) NOT NULL,
  PRIMARY KEY (`tagNo`),
  UNIQUE KEY `tagNo_UNIQUE` (`tagNo`),
  UNIQUE KEY `tagName_UNIQUE` (`tagName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_info`
--

LOCK TABLES `tags_info` WRITE;
/*!40000 ALTER TABLE `tags_info` DISABLE KEYS */;
INSERT INTO `tags_info` VALUES (2,'丘陵'),(9,'公园'),(14,'动物'),(11,'娱乐活动'),(8,'岛屿'),(12,'峡谷'),(7,'建筑'),(5,'植物'),(6,'水'),(4,'沙漠'),(3,'盆地'),(10,'美食'),(13,'购物'),(1,'高山');
/*!40000 ALTER TABLE `tags_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdtopphoto_info`
--

DROP TABLE IF EXISTS `tdtopphoto_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdtopphoto_info` (
  `tdTopPhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `tdTopPhotoFileName` varchar(255) DEFAULT NULL,
  `tdTopPhotoRealName` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL,
  `isTop` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tdTopPhotoId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdtopphoto_info`
--

LOCK TABLES `tdtopphoto_info` WRITE;
/*!40000 ALTER TABLE `tdtopphoto_info` DISABLE KEYS */;
INSERT INTO `tdtopphoto_info` VALUES (10,'2.jpeg','6098E8EEE9324A3786F89B64AA7C1619.jpeg','2016-6-24 12:50:28','是');
/*!40000 ALTER TABLE `tdtopphoto_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_info`
--

DROP TABLE IF EXISTS `theme_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_info` (
  `themeId` int(11) NOT NULL AUTO_INCREMENT,
  `themeName` varchar(50) NOT NULL,
  `themeIsTop` varchar(10) DEFAULT NULL,
  `themeFileName` varchar(150) DEFAULT NULL,
  `themeRealName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`themeId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_info`
--

LOCK TABLES `theme_info` WRITE;
/*!40000 ALTER TABLE `theme_info` DISABLE KEYS */;
INSERT INTO `theme_info` VALUES (19,'亲子游','是','family-playing.svg','7DDD83F7437840C7900D85C4B6C03B2B.svg'),(22,'老年游','是','old-couple.svg','75CBA21009A84FC69CE58860AF5CFA6A.svg'),(26,'雪乡游','是','snowman.svg','C68F38E897A444CF894E4CD3356925F0.svg'),(27,'海岛游','是','palm-tree.svg','12CB06A7A82F4FB0B4D4B8408395571D.svg'),(28,'修禅游','是','temple.svg','4EC0595F2FC74FBF88FAA17F7C06BC4F.svg'),(32,'登山游','是','mountains.svg','233C26C3518F466CB5F70BE59D1A9C96.svg');
/*!40000 ALTER TABLE `theme_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topphoto_info`
--

DROP TABLE IF EXISTS `topphoto_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topphoto_info` (
  `topPhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `topPhotoFileName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `topPhotoRealName` varchar(150) CHARACTER SET utf8 NOT NULL,
  `updateTime` varchar(50) CHARACTER SET utf8 NOT NULL,
  `isTop` varchar(10) CHARACTER SET utf8 NOT NULL,
  `topPhotoCity` varchar(50) CHARACTER SET utf8 NOT NULL,
  `topPhotoOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`topPhotoId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topphoto_info`
--

LOCK TABLES `topphoto_info` WRITE;
/*!40000 ALTER TABLE `topphoto_info` DISABLE KEYS */;
INSERT INTO `topphoto_info` VALUES (80,'1.jpeg','3764EF8F49824A91852767122B28E63B.jpeg','2016-6-29 14:48:28','是','阿尔山',1),(81,'2.jpeg','ED145CA7E3274CE3BD887EC6A5EE3F3E.jpeg','2016-6-29 14:48:37','是','九华山',2),(82,'3.jpeg','2FD25C5AD4E54F86BA7BBE184282B4EB.jpeg','2016-6-29 14:48:48','是','安顺',3);
/*!40000 ALTER TABLE `topphoto_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traveldestination_info`
--

DROP TABLE IF EXISTS `traveldestination_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traveldestination_info` (
  `cityName` varchar(50) NOT NULL,
  `tdOrder` int(11) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `topSeason` varchar(100) DEFAULT NULL,
  `themeType` varchar(100) DEFAULT NULL,
  `themeNickname` varchar(50) DEFAULT NULL,
  `isHomeTopSeason` varchar(10) DEFAULT '',
  `isTopSeason` varchar(10) DEFAULT NULL,
  `isHomeThemeType` varchar(10) DEFAULT NULL,
  `isThemeType` varchar(10) DEFAULT NULL,
  `homeOrAbroad` varchar(10) DEFAULT NULL,
  `description` text,
  `cityPhotoFileName` varchar(100) DEFAULT NULL,
  `cityPhotoRealName` varchar(150) DEFAULT NULL,
  `trafficDescription` text,
  `trafficPhotoFileName` varchar(100) DEFAULT NULL,
  `trafficPhotoRealName` varchar(150) DEFAULT NULL,
  `spotDescription` text,
  `spotPhotoFileName` varchar(100) DEFAULT NULL,
  `spotPhotoRealName` varchar(150) DEFAULT NULL,
  `shoppingDescription` text,
  `shoppingPhotoFileName` varchar(100) DEFAULT NULL,
  `shoppingPhotoRealName` varchar(150) DEFAULT NULL,
  `foodDescription` text,
  `foodPhotoFileName` varchar(100) DEFAULT NULL,
  `foodPhotoRealName` varchar(150) DEFAULT NULL,
  `isPublic` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cityName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traveldestination_info`
--

LOCK TABLES `traveldestination_info` WRITE;
/*!40000 ALTER TABLE `traveldestination_info` DISABLE KEYS */;
INSERT INTO `traveldestination_info` VALUES ('九华山',1,'安徽','华东','第一季度（春）, 第四季度（冬）','老年游, 修禅游, 登山游','佛国之旅','是','否','是','是','国内','“佛缘圣地”\r\n—九华山—\r\n最高海拔1344米，由九座山峰环绕而成，连绵起伏宛若九片莲花花瓣合拢成一朵青莲，宁静优美的绽放在皖南的土地上，独自静香却有着出淤泥而不染濯清涟而不妖的风采。正如大诗人李白笔下：“惜在九江上，遥望九华峰，天河摆绿水，秀出九芙蓉”。','3.jpeg','DB0760B877F044ACB8A9D93C7AD85CF93.jpeg','★景区大巴 \r\n九华山景区很大，从柯村到九华街，以及九华山景区内各大景点间有景区大巴来往。购票处在柯村汽车站，游客可选择购买，每个乘车点只可乘坐一次，上车后有专人在门票上打孔。需要注意的是，多个上车点，如柯村、凤凰松、虎行山庄（即往天台索道）、迎仙桥（九华街）、花台之间并无任意往返。如花台只发车到柯村，必须重新购车票上车进山。所以从花台出来，必须要办好二次进山的手续。详细内容及信息更新请关注柯村汽车站当日的资讯显示，或者登录九华山官网：http://www.jiuhuashan.cc/\r\n','13213.jpg','EC99DBEA655F4102A6239BA8DB23F04213213.jpg','天台寺\r\n九华天台峰又称天台正顶。海拔高度1325米，略低于十王峰，因天台是教徒朝拜地藏\"圣迹\"之所在，所以往往将天台称为九华山的主峰。坐落在峰顶的地藏寺(即地藏禅林)，古名天台寺。来九华山的佛教徒大多到此朝拜，称之为\"中天世界\"。这里也是游客游九华必到之处。至寺前回首一看，左有龙头峰，右有龙珠峰，对面十王峰。龙头峰下为青龙背，因骄立如屏，故名玉屏峰。龙头峰上有平台，约20平方米，台上有捧日亭，亭六角形，前立铁鼎，有铁栏环护。天台峰最高处名云峡，有两大岩石，并立为门，下宽上窄，从岩隙仰视，蓝天一线，又名一线天。此处是观九华全景，看云海日出最佳处，\"天台晓日\"为九华十景之一。','4.jpg','EDE1B7D522734B388CCF6D9495BA942F4.jpg','徽道茶\r\n由乾隆皇帝赐名的“徽道茶”产于东至县葛公镇最高峰----鸡头岭。岭峰海拔1187.2米，与仙寓山、紫石塔等产茶名山同属一脉，具有原始自然风貌，是池州地区“国家生态经济示范区”亟待开发的处女地。“徽道茶”源于僧侣之野植，生长在云雾缭绕的幽壑峭岭，孕蕊与百花之中，饱含原始自然灵气，叶厚芽壮汁水浓，汤色碧绿味甘醇，细啜慢饮，幽香扑鼻。制茶名师黄荣铨先生为只惊叹：“此山茶叶内质之优不可多得”，新一代“徽道茶”定会亮丽于市场，赢得八方客商青昧。','5786789.jpg','AEF63F8AF01E47C49D2B14FEB44B34D05786789.jpg','九华山（Jiuhua Mountain）古称陵阳山、九子山，因有九峰形似莲花，因此而得名。于唐天宝年间（742～756）改名九华山。方圆100公里内有九十九峰，九华山是佛教名山，千百年来相沿成习，形成了特色独具的九华山素斋。素斋的主体是素菜，素菜原料取于本山出产的竹笋、百合、黄精、石耳、木耳、黄花菜、地心菜、马兰头、豆苗、椿苗、蕨菜等山珍野味，配以豆腐、冻粉、面筋、素油、新鲜蔬菜等，或清炒、或火煨、或清炖、或烘烤，一般不加佐料调色调味,以清淡为本色，青丝绿叶，间色分明，天然野味 ，香、脆、鲜、嫩并重，营养丰富，久食不腻。凡荤菜名目，素菜都可取其形制成食，如素鸡、素鸭、素鱼、素香肠、素海参、素火腿等。','5.jpg','24FC66F6E12F45239F73A994748F9F825.jpg','否'),('伊春',6,'黑龙江','东北','第一季度（春）, 第四季度（冬）','亲子游, 雪乡游','醉美伊春','否','是','是','是','国内','古人云：“山不在高有仙则灵，水不在深有龙则灵”。坐落在中国版图顶端的伊春正是如此，它没有耸立云霄的高峰，也没有深不可测的湖水，有的仅是朴实无华的风景，茂密的松林，潺潺的流水，绿野中掺杂着锦簇的杜鹃花，山与树相容，树与影相依，每一滴雨露，每一点气息无不透露着山、水、林的灵魂与美，时而甜美宁静，时而百鸟争鸣，静与动都尽显大自然的真实，漫步于林间会有幸看到野兔在草地上觅食，松鼠在林间上蹿下跳，百灵鸟停在枝头悠闲的歌唱，啄木鸟展示大自然白衣天使的职责，万物合一，完美和谐，此时的人也将成为自然美景的一个元素，恰如“你在看景，我在看你”的意境。即便快节奏的生活、城市的喧嚣和阴暗的雾霾带给你莫大的伤害，也将瞬间化无。','yichun.jpeg','26561AAACA4C4BEABAF6811836A9FF74yichun.jpeg','★包车游玩伊春，最好选择包车或自驾，因为有的拍摄点就在路边，而且早晚的光线要好很多，别的交通方式很难满足拍摄需要。伊春——五营——汤旺河——嘉荫这一路也都有大巴，除嘉荫外，还有火车，但会占用很多的时间，但城区到景区的路程仍然需要打车。\r\n包车可包全线，也可是点对点，因为景区都比较原生态，当地包车多为双程，去程时可记下司机电话，游玩后让司机来接就可以。\r\n★出租车\r\n伊春市内出租车起步价6元，不出城区起步价通达全城。\r\n★公交车\r\n伊春市内共有16线公交车，均在伊春城区内开行。首班车最早运营时间为6:00，末班车多到17:40，少数最晚开行至20:00，票价1元。\r\n\r\n\r\n','2.jpg','228FA855726D4783AE8A3CBFDA0B70E52.jpg','五营国家森林公园\r\n里是红松原始森林保持最完好的地方，也是亚洲规模最大，最完整，最有代表性的红松原始森林集散地。进入景区，就能看到“少奇号火车”，刘少奇晚年时曾乘坐它深入生产一线。再往深处走，脚下是木栈道，满眼都是松林，待到9、10月份，如果运气不错，地上能看到硕大的松塔，剥开来就是颗粒饱满的松子。\r\n景区内最值得一看的要算是天赐湖，典型的高山湖泊，湖面平静如水，远处是成片的松林，映衬在蓝天下，极美。\r\n','3.jpg','C8A47753B0FA41CFA4F7D36C2D6B8FAC3.jpg','伊春盛产山货，如松子、蘑菇、木耳、蓝莓制品……天然无污染，当地民风淳朴，价格合适。不用担心被宰。在伊春嘉荫县，有龙乡特产一条街，多是些蓝莓（当地人称都柿）、五味子和小兴安岭的山货产品。','1_副本.jpg','2F7D5655847D484BBC6D3F68B966640A1_副本.jpg','受当地经济状况影响，到目前为止伊春还没有形成有规模的美食街，也没有餐饮比较集中的特色地。从整体上看，伊春菜除了具有浓郁的东北特色外，最重要的特点就是拥有较多的山珍野味，对于远道而来的游客，还是比较富有吸引力。','webwxgetmsgimg (2).jpg','6E078245D62B420883CF248E52C7B6A6webwxgetmsgimg (2).jpg','是'),('兴义',5,'贵州','西南','第一季度（春）, 第四季度（冬）','亲子游, 老年游','美丽兴义','否','是','是','是','国内','兴义市地处滇、桂、黔三省（区）结合部，历来就是西南地区一个重要商贸中心，素有“黔桂锁钥”之称。说到兴义，最有名的就是美景与激情共存的马岭河峡谷，和那壮阔与秀气并有的万峰林。春季来万峰林赏万亩油菜花，夏季去马岭河峡谷玩漂流，当然你还可以去万峰湖坐船看湖景或体验岸边垂钓之乐，也可以去泥凼镇逛逛何应钦的故居，探探神奇的泥凼石林。','xingyi.png','CE00D78B18F446DE90D93BF756B9B79Dxingyi.png','兴义城区不大，出门尽可以选择步行，远一些的地方可以乘坐公交或者打车。\r\n公交车\r\n兴义市现已开通十余条公交线路，一般的出行需求问题不大。票价统一 1元。\r\n出租车\r\n起步价 5 元（2.5 公里），超过起步里程后，每增加 1 公里增收 1 元。\r\n','2.jpg','6FB1171F92F847CEA8E524D1587E69552.jpg','马岭河峡谷\r\n位于兴义城东北5公里，是国家AAAA级旅游景区、国家级风景名胜区、国家地质公园、国家自然遗产。马岭河峡谷被誉为“地球上一道美丽的疤痕”。峡谷内的瀑布非常多，上百条形态各异的瀑布构成了闻名遐迩的马岭河瀑布群。即便是在枯水季节的冬季，也能看见非常不错的景致；到了雨季，其壮丽的景色更可见一斑。','3.jpg','C9E654BCB07B4786BA69E219B7039F983.jpg','兴义最繁华的的地方是市政府坐在的黄草坝镇，那里的街心花园附近是购物中心，有各种各样的物品和土特产，可以有选择性地购买。马岭河峡谷景区产世界著名的野生兰花品种，当地人有挖了在附近卖。如果喜欢花草，不妨留意一下。','467890-.png','EC2D2AC416994DE3AC88D41A667D1DC6467890-.png','兴义的小吃与省内其他地方的口味差异比较大，刷把头、鸡肉汤圆、杠子面都是兴义特产，在其他地方很难吃到。所以来了兴义，千万不要错过这些小吃。','yt8yuoiu.jpg','404845564DFE4513A5C8C353D58CD373yt8yuoiu.jpg','是'),('北京',10,'北京','华北','第一季度（春）','亲子游, 老年游, 雪乡游','天朝最美','是','否','否','否','国内','中国首都北京是一个文化底蕴深厚，古典与现代结合的城市。来到北京可以实现曾经“我爱北京天安门”的北京情结，领略梦想中的紫禁城；穿梭在王朔笔下的胡同和大院；爬上万里长城。 在这里感受包容万象、海纳百川的大都市的魅力，它蕴含着三千年的历史，六朝故都，凝聚了自元明清以来的中华文化，荟萃了众多名胜古迹和人文景观。同时这里还汇聚了八方来客，宗教、文化、语言在这里融会贯通','6878A5F90DB64CF28F6A5E15B95E7DCC.jpg','71762013A7024F3682BCF00B6355B372.jpg','首都北京交通四通八达，是全国公路、铁路、航空运输的枢纽，无论是到达还是离开都非常方便，外部交通上： 北京有两个机场：无论是首都国际机场还是南苑机场，往返市区都非常方便。 北京主要有四个火车站：北京站、西站、南站和北站（西直门火车站），线路覆盖全国，且多为始发和终到站。此外还有北京东站（主要用于物资的运输）、清华园火车站（开往延庆）和黄村火车站（京南线）。 北京有多个长途汽车站，多为高级豪华大客车，安全舒适。 其中内部交通：有17条地铁线：一号线，二号线，四号线，五号线，六号线，八号线，九号线，十号线，十三号线，十四号线，十五号线，亦庄线，昌平线，大兴线，房山线，八通线，机场快轨；公交线路遍布整个城市与城郊，出行极其便利！','BB979886151C41A79BDB0A985C51B08B.jpg','BF141DF631AC4775AFBD35A5312F20FC.jpg','北京是世界第八大“美食之城”,居内地之首。北京的风味小吃历史悠久、品种繁多、用料讲究、制作精细,堪称有口皆碑。京味小吃的代表有豆汁儿、豆面酥糖、酸梅汤、茶汤、小窝头、茯苓夹饼、果脯蜜饯、冰糖葫芦、艾窝窝、豌豆黄、驴打滚、灌肠、爆肚、炒肝等。在前门、王府井、护国寺、后海、牛街这些地方可以吃到比较正宗的老北京小吃。北京是世界第八大“美食之城”,居内地之首。北京的风味小吃历史悠久、品种繁多、用料讲究、制作精细,堪称有口皆碑。京味小吃的代表有豆汁儿、豆面酥糖、酸梅汤、茶汤、小窝头、茯苓夹饼、果脯蜜饯、冰糖葫芦、艾窝窝、豌豆黄、驴打滚、灌肠、爆肚、炒肝等。在前门、王府井、护国寺、后海、牛街这些地方可以吃到比较正宗的老北京小吃。','1CB4A8FF53634543B8483273420FB66D.jpg','4046DA444B6C4028888FF644D8B4D20F.jpg','到了北京除了品尝特色小吃之外，别忘了带点老北京的京味糕点给亲戚朋友，稻香村、御食园等老字号品牌各类糕点五花八门，最常见的要数京八件礼盒，以及中秋期间的月饼礼盒等，还有那驴打滚、豌豆黄、茯苓饼、芙蓉糕、玫瑰饼、花生酥、粽子、果脯还有各类饼干，除了吃之外还有内联升的老北京布鞋，老北京布鞋有着浓郁的的历史文化，以北京布鞋为代表，是中式文化的典型代表。 它承载着中国的民众文化，并结合当时老北京布鞋的优势，在京城将老北京布鞋广为推广，闻名于京城，后渐传为佳话，北京布鞋的称呼便由此传开，也被称为北京特产之一。','FEFD498FF581428DA29F688FA51A732F.jpg','E350FE4F07CE47BAB24BE134C445B599.jpg','在这里你既可以走着老北京的道儿，吃着地道的老北京小吃，去一下胡同中寻找宅院进一趟博物馆看看老物件，感受一下老北京几百年风云变迁，也可以融合皇家古迹、市井胡同、繁华商业区、高等学府、高科技园区，体会一下北京的厚重沧桑和她的时尚繁华。逛完了市内还可以逛逛市郊，爬一爬“不到长城非好汉”的万里长城，登一登香山，观赏一下凤凰岭、石花洞的自然风光，总结一句：在北京你可以观了美景，学了文化，体验了高科技！在这里你既可以走着老北京的道儿，吃着地道的老北京小吃，去一下胡同中寻找宅院进一趟博物馆看看老物件，感受一下老北京几百年风云变迁，也可以融合皇家古迹、市井胡同、繁华商业区、高等学府、高科技园区，体会一下北京的厚重沧桑和她的时尚繁华。逛完了市内还可以逛逛市郊，爬一爬“不到长城非好汉”的万里长城，登一登香山，观赏一下凤凰岭、石花洞的自然风光，总结一句：在北京你可以观了美景，学了文化，体验了高科技！','2BC76939F368473595A368F3054B58A1.jpg','82A068B5234F49E9B9413998BEE05D91.jpg','是'),('安顺',2,'贵州','西南','第一季度（春）, 第四季度（冬）','亲子游, 老年游','雄伟安顺','否','是','是','是','国内','安顺是贵州省下辖的地级市，位于贵州省中西部，距贵州省省会贵阳90公里。地处长江水系乌江流域和珠江水系北盘江流域的分水岭地带，是世界上典型的安顺由黄果树瀑布和龙宫风景名胜区而远近闻名,成为全国甲类旅游开放城市,世界喀斯特风光旅游优选地区,全国六大黄金旅游热线之一和贵州西部旅游中心。曾经在2007年获“中国优秀旅游城市”殊荣。黄果树瀑布作为黔西南的最大牌景点，很难无视它的存在，它会出现在钞票上、烟盒上。后起之秀——龙宫，九曲回肠暗河溶洞，一旦你走进去，犹如踏入龙的腹中，多彩神秘。同时在安顺市100公里的半径范围内，有7个国家级风景名胜区。','anshun.png','271A63AEF5CC4DF18630E160B47FDAD7anshun.png','★公交 \r\n安顺市内目前开设有15条公交线路，覆盖了城区，市内交通便利。\r\n★出租车\r\n安顺市内出租车数量目前有1500余辆，全部实行打表收费，价格合理。7点至24点起步价3公里以内6元，超过3公里每公里加收1.2元；超过5公里，每公里加收1.5元。零点至7点起步价2公里以内12元，超过3公里每公里加收1.5元。\r\n★汽车\r\n黄果树距安顺40公里，安顺汽车西站、南站均有车前往，车费8元。从贵阳出发137公里，高速公路两小时可到，大巴往返每人40元，贵阳火车站前有一日游专线车。在黄果树镇下车后，路口至瀑布需步行约15分钟；景区间有三轮往返，乘坐索道8元/人；景区内漂流30元/人。\r\n','d8ab70ea5357b2513f516258fe75.jpg','40962F1BDE4946578AAE1917239CDA9Fd8ab70ea5357b2513f516258fe75.jpg','安顺黄果树瀑布是外地游客到贵州必游的景点。“透陇隙南顾，则路左一溪悬捣，万练习飞空，溪上石如莲叶下覆，中剜三门，水由叶上浸顶而下，如鲛绡万幅，横罩门外，直下者不可以丈数计，捣珠崩玉，飞沫反涌，如烟雾腾空，势甚雄历，所谓：珠帘钩不卷，匹练挂遥峰。俱不足以拟其状也，盖余所见瀑布，高峻数倍者有之而从无此阁大者，但从其上侧身下瞰，不免神竦。”公元1637年，徐霞客游历贵州，途经黄果树瀑布时，曾对黄果树瀑布作出了这样的描述。从那时起，黄果树瀑布就渐渐被人们认为是全国第一瀑布。','2.jpg','AF4A45FACCEB4A50911F57E2E47298982.jpg','在安顺游览气势恢弘的黄果树、瑰丽多姿的水上石林之余，我们不妨可以选择一些富有安顺地方和民族特色的工艺品，带回去赠送亲友。如著名的安顺三刀、布依地毯，以及各种蜡染制品等。安顺蜡染被誉为“东方第一染”和“蜡染之乡”同时安顺“三刀”（菜刀、剪刀、皮刀）以刀刃锋利、式样古朴美观、适用耐用为特点，是贵州省地方名特产品之一，还有傩面具、牛角梳、根雕，天麻酒和杜仲酒等。在汽车站门口和市区的很多地方都有不少小店，经营具有安顺特色的土特产和纪念品，比贵阳北京路上的店铺要便宜很多。','14.jpg','AA67425EEDB14042947D04F89582B16114.jpg','在安顺能品尝到各种正宗的黔味小吃，领略带各种大大小小的黔味风格的饭馆，提到黔味就不由自主的想到其特点：\r\n一、黔味善于辣椒，辣香是其主要的特点；\r\n二、黔味突出酸味。贵州有“三天不吃酸，走路打蹿蹿”的民谣；\r\n三、黔味的火锅自成特色，做发多样，都有其自身的风味和浓郁的地方特色；\r\n四、黔味讲究醮水。醮水的调料主要有辣椒、蒜泥、姜末、葱花、花椒等，酌情添减。而不同的菜又配备不同的醮水，各自都有讲究，花样繁多。 \r\n安顺美食白天的话在新大十字佳慧超市旁边和东街小十字，晚上的话在东街小十字和顾府街。\r\n','4.jpg','95381CCE731C4D1AA365CB7DA3B2D2A54.jpg','是'),('毕节',7,'贵州','西南','第一季度（春）, 第二季度（夏）, 第三季度（秋）, 第四季度（冬）','登山游','百花毕节','否','是','是','是','国内','毕节，地处贵州省西北部乌江、珠江发源地，有着优越的地理位置，资源富集，拥有丰富的矿产资源、水能资源和旅游资源。 被誉为“天然喀斯特地貌博物馆”，具有北亚热带季风湿润气候和喀斯特地貌。在这里冬无严寒、夏无酷暑，是人类居住的好地方，神奇秀丽的奇山、秀水、飞瀑、溶洞，以及红军长征谱写壮丽史诗的革命老区无一不诠释这里的人杰地灵；淳朴浓郁的彝族、苗族人们热情好客，你可以在这里欣赏到美景也可以在这里寻找到少数民族的独特文化，因此毕节成为少有的旅游、避暑、休闲、度假的最佳胜地。','3.jpeg','0C4569C073244F218E8597C6C31C3BDF3.jpeg','从毕节市区可乘坐公交车、出租车或驾车前往各个景区,\r\n公交：普通公交车车单一票价1元，10路为3元。\r\n出租车、汽车收费标准：起步里程3公里，起步价5元，延程收费0.7元/500米，超出10公里后司乘双方议价。毕节是个不大的城市，在市区内打车一般一至两人票价3元、三至五人票价5元，环城5元。车型以夏利、吉利居多。从长途汽车站步行到主要街道桂花路和威宁路，只需要十来分钟。其余下属县城出租车一般都是每人2元。\r\n','20089216525815426.jpg','4AA6353A8400401CAC6E7E82D03A3CF720089216525815426.jpg','织金洞长6.6公里，最宽处175米，相对高差150多米，全洞容积达500万立方米，空间宽阔，有上、中、下三层，洞中遍布石笋、石柱、石芽、钟旗等四十多种堆积物，形成千姿百态的岩溶景观。洞道纵横交错，石峰四布，流水、间歇水塘、地下湖错置其间。被誉为“岩溶瑰宝”、“溶洞奇观”。曾多次被评为“中国最美的旅游洞穴”榜首，中科院下辖的《中国国家地理》等国家级地理研究部门也给予高度赞誉，称其为“中国溶洞之王”，“黄山归来不看岳，织金洞外无洞天！”','3.jpg','4F6795C8A52F47D9AADB5CAB7D12ECEA3.jpg','毕节是贵州省下辖的地级市，位于贵州省西北部，贵州金三角之一，乌蒙山腹地，川、滇、黔之锁钥，长江珠江之屏障，东靠贵阳市、遵义市，南连安顺毕节市最热闹的地方是威宁路，一眼望去，商铺林立，商品琳琅满目。这里的威宁火腿、大方漆器、大理石工艺品、黄花菜等，都是比较有特色的东西，游客来这里旅游可选购一、二带回去赠送亲朋好友。','未命名.png','88885CD75E06479BB49C2443B68B2A99未命名.png','在毕节当地有不少美食，除了毕节市区内有毕节汤圆、毕节酸菜等特色小吃，还有大方县别具一格的骟鸡点豆腐和各类豆干、另外织金的宫保鸡、荞凉粉对于爱吃的游客来说也是不错的选择，对于威宁火腿是更是远近闻名，来到毕节必尝的美食之一，此外威宁的草海鱼包虾也极具特色毕节美食。','webwxgetmsgimg.jpg','7E68F5E06AC440B7A85646BC79D09AAFwebwxgetmsgimg.jpg','是'),('满洲里',8,'内蒙古','华北','第一季度（春）, 第四季度（冬）','亲子游, 雪乡游','满洲里之旅','是','是','否','是','国内','满洲里市位于内蒙古呼伦贝尔大草原的腹地，东依兴安岭，南濒呼伦湖，西邻蒙古国，北接俄罗斯，是一座独领中俄蒙三国风情、中西文化交融的口岸城市，素有“东亚之窗”的美誉。 满洲里市的旅游资源得天独厚，魅力无穷，被誉为“北疆明珠”。绿草如茵的呼伦贝尔大草原，辽远无际；碧波荡漾的呼伦湖，纤尘不染；巍峨耸立的国门，庄严肃穆；热情奔放的蒙古风情，雄浑厚重；承继远古文明的扎赉诺尔文化，源远流长；中西交融的城市风格，独具魅力。这一切编织成一幅幅自然生态与现代景观、远古文化与现代文明、民族文化与异域风情交融和谐的优美画面，令无数海内外游人心驰神往。','manzhouli.jpg','BCC36760DB7E4940A20E4A1DEA5AC256manzhouli.jpg','公交车\r\n满洲里的公交车一般早班车约5-6点间，收车时间约18-19点间。乘坐6路公交车可到北湖公园、国际商城、义务商贸城、套娃广场、国门等地。\r\n出租车\r\n满洲里城市不大，出租车一般不打表，市区内的话一般7-10元钱就够了，如果去远一点的地方，可以与司机讲价。打表的话是7元起步价（2公里），之后每公里1.8元。从市中心到国门大约20几块钱、到机场约30块钱、到呼伦湖景区约60元。\r\n','201245111647.jpg','EBD458A489DA4B5F8626194891FC9C31201245111647.jpg','套娃广场\r\n满洲里套娃广场是满洲里标志性旅游景区，广场集中体现了满洲里中、俄、蒙三国交界地域特色和三国风情交融的特点。\r\n俄罗斯套娃广场位于满洲里市区西部的中俄互市贸易区内、301国道的北侧，是以俄罗斯特色工艺品——套娃为主题的集观光、休闲、娱乐、餐饮、购物于一体的综合性城市旅游景区。国家4A级旅游景区。广场总面积占地54万平方米，由1个主题套娃、192个小套娃和8个功能套娃组成，异国风情浓郁。\r\n','3.jpg','59B8FC4C282B4D009C2FF0C3056B9CAB3.jpg','呼伦贝尔的民族手工艺品很有特色，比如手工打造的银器、蒙古刀、木雕制品和羊毛地毯等，带有粗犷的线条和豪迈的草原气息，是精美又实用的纪念品和装饰品。呼伦贝尔当地的食物特产种类很多，比如奶制品，牛羊肉风干制品等。当地出产野山菌，其中最著名的当数白蘑，它的产量较少，营养极其丰富。这里还有蕨菜、黄花菜等多种山野菜，富含人体所需多种营养成分，是草原著名的绿色食品。海拉尔、额尔古纳和满洲里这种规模较大的市镇购物选择比较多，可以在市区转一转，各大超市、商场都有品种丰富的特产可供选择。','webwxgetmsgimg (1).jpg','83B11E8749BB43CC92EAB94C0D734F7Dwebwxgetmsgimg (1).jpg','来到满洲里，由于它独特的地理位置使得你在欣赏异域风情的同时随时可以享受到中俄蒙三国风情的美食，既有红菜汤、馅饼、土豆鲜蘑色拉等美味的俄式大餐，又有手把肉、全羊宴、奶茶、马奶酒、奶皮子等草原饕餮荟萃的蒙餐，更有丰富的东北小炒和农家菜。如果是去呼伦湖游玩的话，一定不能错过地道的呼伦湖全鱼宴。','webwxgetmsgimg.jpg','7AE9D1717B6140B0802ECF826B3A6212webwxgetmsgimg.jpg','是'),('舟山',4,'浙江','华东','第一季度（春）, 第四季度（冬）','海岛游, 修禅游, 登山游','舟山之旅','是','是','否','是','国内','舟山群岛，宛如一串串翡翠般的珍珠，散落在东海洋面上，拥有上千处佛教文化、山海风光，海岛民俗和历史文化景观，更为迷人的是气势磅礴的瀚海浪涛，千姿百态的奇崖岩穴，宏伟典雅的名刹寺院，洁净宽阔的金沙浴场，桅林万盏的渔港夜景，纯朴浓郁的渔家风情、构成独特的海岛、海洋旅游资源，成为世人瞩目的游览、避暑、休养胜地。 ','images.jpg','96B07C4E325A4558AFD43A8A7C3AB773images.jpg','公交\r\n舟山本岛上有多条公交线路到达本岛各个角落。其中游 2、游 3 线为环定海城公交线。20、25、26、27、28、29 为定沈公交车，连接定海\r\n和普陀两大区，车程约 40 分钟。间隔时间约 10 分钟。定海城东汽车站专运定海与沈家门快线。本岛和朱家尖岛之间有观音大\r\n桥贯通，有公交车直达普陀山机场和岛内各主要景区。舟山本岛的公交多数为无人售票，需自备零钱。\r\n\r\n出租车\r\n白天乘坐出租车在 2.5 公里内的价格为 8 元，但如遇路阻 ( 车速低于每小时 12 公里时路阻等候费开始计时计费 ) 或交通信号灯等候时间超过 3分钟的，将加收等候费。此外，另收取 1 元燃油附加费。\r\n\r\n','50273499.jpg','2143CBBFC3E142988F2C5A16BA37A6BE50273499.jpg','普陀山四面环海，风光旖旎，幽幻独特，被誉为“第一人间清净地”。山石林木、寺塔崖刻、梵音涛声，皆充满佛国神秘色彩。岛上树木丰茂，古樟遍野，鸟语花香，素有“海岛植物园”之称。全山共有66种百年以上的树木1221株。除千年古樟，还有被列为国家一级保护植物我国特有的珍稀濒危物种普陀鹅耳枥。岛四周金沙绵亘、白浪环绕，渔帆竞发，青峰翠峦、银涛金沙环绕着大批古刹精舍，构成了一幅幅绚丽多姿的画卷。岩壑奇秀，磐陀石、二龟听法石、心字石、梵音洞、潮音洞、朝阳洞等。大多名胜古迹，都与观音结下了不解之缘，流传着美妙动人的传说。它们各呈奇姿，引人入胜。普陀十二景，或险峻、或幽幻、或奇特，给人以无限遐想。','6879.jpg','4632C9AD815844B3844917BA8406A5C36879.jpg','到舟山旅游，各类鲜活的海产品是您购物的首选。位于沈家门的舟山国际水产城，面积15000平方米，是舟山最大的干、鲜海产品集散地，有近千家摊位可供选购。舟山特产有普陀佛茶、普陀水仙、活海贝、石花菜、南海紫菜、金钩虾米、舟山白鲞、螟脯鲞、三矾海蛰、海带、海蜒、贻贝等。 ','webwxgetmsgimg.jpg','B03E3C4EB4814F4E86CB5CC11839AFEFwebwxgetmsgimg.jpg','舟山不仅是我国最大的渔场，也是世界著名四大渔场之一。舟山的黄鱼、带鱼、石斑鱼、锦绣龙虾及蛎、蛤、虾、蟹，还有淡菜、青蟹等，都是极具特色的海鲜名品。在饮食方面自然以海鲜为特色，烹饪的主要特点为清蒸、酱渍、盐渍、风干，生吃。主要的风味名菜有：白鲞扣本鸡、黄鱼鲞烤肉、大烤目鱼、盐焗基围虾、嵊泗螺酱、葱油海瓜子、烟熏鲳鱼、芹菜炒鳗丝等。知名的沈家门渔港是品尝舟山海鲜的最佳选择。','webwxgetmsgimg (1).jpg','F0C62F42D8E54D4AB94D284FC45E37E8webwxgetmsgimg (1).jpg','是'),('阿尔山',9,'内蒙古','华北','第一季度（春）, 第四季度（冬）','亲子游, 老年游, 雪乡游','阿尔山神秘之旅','是','是','否','是','国内','阿尔山市位于内蒙古自治区兴安盟西北部，全称“哈伦•阿尔山”，意为“热的圣水”，世界最大的温泉群已经在这里流淌了几个世纪。 阿尔山是一座植被茂密的天然氧吧，这里曾是电影《夜宴》的外景地。国家森林公园景区里包含了天池、三潭峡、杜鹃湖、石塘林等多个景点。另外海神圣泉疗养院也是一个放松身心的去处，因不同的泉水具有不同的作用，对多种疾病都有较高的疗效，因此有圣泉之称。 阿尔山绝对是理想休闲、度假、疗养的好地方。 中国温泉博物馆 中国温泉博物馆坐落于阿尔山火山温泉国家地质公园内，该博物馆集温泉神池、奇湖秀石、阿尔山大温泉群、火山、森林、草原、冰雪、湖群等多种地质景观于一身，它拥有世界内最大、可洗可饮的温泉矿泉群，全都是自然涌出，无一例人工开凿，非常奇妙。','aershan.jpeg','C7A18A33B24D419CBF539A4E7BDC32B5aershan.jpeg','出租车\r\n阿尔山的出租车起步价是5元，因为市区面积不超过2平方公里，所以基本起步价到哪里都可以。\r\n包车\r\n由于阿尔山的景点一般都离市区较远，而且还没有专门的公交或者旅游线路，所以只能包车游玩。\r\n夏利车大概是400元/天，但是坐起来不是很舒服；\r\n好一点的像捷达、奇瑞等宽一些的车大概在500元/天；\r\n但是如果要前往好森沟景区，这些车都无法进去，因为路况很差，只能越野车去，大概800元/天。\r\n公交\r\n阿尔山的市区仅有一条正街，如果只是在阿尔山市区的话公交车基本没有必要坐，步行即可。\r\n但如果去伊尔施或者飞机场，则可以在阿尔山火车站门前乘坐公交，到伊尔施是3元，飞机场是5元。中途路过五里泉。大约15分钟一趟\r\n','7df4e855ha35a319ced0a&690.jpg','62C980230E5A4818B101ED46FA0F24787df4e855ha35a319ced0a&690.jpg','内蒙古阿尔山国家森林公园位于内蒙古大兴安岭西南麓，是2000年2月22日经国家林业局正式批准成立的，总面积103149公顷，其中17公顷是人工林。浩瀚的大兴安岭林海，莽莽苍苍，碧波万顷，起伏的山峦涌翠竟秀。在这绿色的海洋里镶嵌着一颗闪亮的明珠——阿尔山国家森林公园。阿尔山国家森林公园还具有独特的北国风光，其矿泉资源得天独厚，世属罕见，举世闻名。矿泉群集饮用、洗浴、治疗于一体，被称天下奇泉。具有 “阳光、空气、绿色”三大要素。','3.jpg','C64A1B214B644BCBB7456E322E4BE3DA3.jpg','阿尔山号称是中国最大的村子、最小的城市，这里的商业纯是为阿尔山旅游开发的，物价较高。当地有木耳、蘑菇、黄花菜、牛肉干、鹿肉干、红蚂蚁以及内蒙古的奶制品。\r\n','webwxgetmsgimg (1).jpg','0422E88A8C2D49A98F7E459E1AE4B422webwxgetmsgimg (1).jpg','阿尔山的美食绝对称得上天然无公害，几乎都是就地取材。大兴安岭上的处女地阿尔山漫山遍野生长着120多种山野菜，能够规模开采的就有60多种，蕨菜等野菜味道鲜美，非常健康养生。此外，黄羊、雪兔等山珍也是美味的食材。','webwxgetmsgimg.jpg','C26FCC9DE512440AA81CE97798B50AC0webwxgetmsgimg.jpg','是'),('黄山',3,'安徽','华东','第一季度（春）, 第四季度（冬）','亲子游, 老年游, 登山游','俊美黄山','是','是','是','是','国内','黄山位于安徽省南部黄山市境内（景区由市直辖），为三山五岳中三山之一，集中国各大名山的美景于一身，尤其以奇松、怪石、云海、温泉“四绝”著称，是大自然造化中的奇迹，历来享有“五岳归来不看山，黄山归来不看岳”的美誉。黄山的美是亿万年的地质演化的产物。它先后经历了汪洋一片，沧海桑田，最后在一次强烈的造山运动中横空出世。主峰莲花峰，海拔1864.8米。山中的温泉、云谷、北海、玉屏、梦幻等景区，风光旖旎，美不胜收。它是上天在创造奇迹的时候留给我们炎黄子孙的神奇，无怪乎明代地理学家徐霞客赐予其“薄海内外，无如徽之黄山。','w53.jpg','678F4A6470514387AEA6568F5015B892w53.jpg','公交车\r\n黄 山 市 内 有 17 条 公 交 线。 空 调 公 交 在 6 月 1 日 -10 月 15 日、12 月1 日 - 次年 3 月 5 日此时间段内，票价 2 元 / 人，其他时间段均为 1 元/ 人。\r\n出租车\r\n黄山市内出租车起步价 5 元（含燃油附加费），3 公里以后为 1.5 元 / 公里，8 公里后加空贴 50%，燃油附加费 1 元。市内打车，一般不会超过 20 元。\r\n景区交通 \r\n从黄山南大门到黄山门票售票点（后山云谷寺 / 前山慈光阁）需乘“新国线”的“景交车”，“景交车”有大巴和出租车两种。大巴每 20 分钟发一班，车程约 25 分钟，车费为 13 元 / 人（单程）。出租车单程 50 元 / 车，一个出租车可乘坐四位游客；如果刚好 4 人，又不想等大巴车，乘出租车会比较划算，还可省时又舒服。\r\n','05095259.jpg','54991CB3E5D448BDB56874028D07562605095259.jpg','玉屏景区古称文殊院，是黄山的中心景区之一。玉屏景区以玉屏楼为中心，莲花峰和天都峰为主体，通常人们所说的前山，就是指的这一景区。沿途有“蓬莱三岛”、“百步云梯”、“一线天”、“新一线天”、“鳌鱼洞”等奇妙景观。这里由雄山怪石、奇松险壑、摩崖古刻、云海烟云构成景区景观的主体。此处可观迎客松、送客松、松鼠跳天都、孔雀戏莲花、姜太公钓鱼、仙人飘海、犀牛望月等景观。玉屏景区是黄山绝胜处，有俗语云：“不到文殊院，不见黄山面。”','3.jpg','A778BA64E763404E8E5B95F69E6584713.jpg','黄山千古名城，自然和文化资源丰富，其中当属毛峰茶叶和徽墨、歙砚、宣纸最为著名。黄山毛峰是全国十大名茶之一，皇家贡品，如果春游黄山，可以赶上新茶，不要错过。徽墨、歙砚、宣纸更是中国文房四宝中顶尖的两样，所有这些特产可以在市区的特产专卖店、屯溪老街、汤口镇的沿溪街购买。笔墨纸砚：歙砚、徽墨、宣纸、泾笔是古徽州的特产，垂名数百年了，建议喜好者在正规商店或专卖店购买，慎重考虑私人摊点。其中徽墨和宣纸不易作假，但歙砚和毛笔在私营处有随意开价的现象，尤其是在屯溪老街这样的前店后坊处，都是经营者自己制作，但往往吹嘘其为祖传之秘，一支寻常的毛笔常常开出数百元的高价。','webwxgetmsgimg (1).jpg','5E2D0DBBBEEE4A58B26C80DB14BE051Ewebwxgetmsgimg (1).jpg','黄山的饮食属于徽州菜系，烹调方法上擅长烧、炖、蒸、熘，讲究佐料，注重火功，提倡原汁原味，重油重色。来到黄山，有几道特色美味一定不能错过。臭鳜鱼是徽州经典名菜，最大的一个特点就是“臭”，闻着臭，吃起来却是酥香无比；徽州石鸡，黄山特产大补食品，不少游客都冲着它而来，石鸡是栖息在山涧石缝中的一种蛙类动物，适合红烧或清蒸，多吃石鸡，夏天可以不长痱子，若烹饪时保留石鸡皮，风味营养更佳。蕨菜是黄山民间常食的野菜，营养非常丰富，清炒蕨菜味道清香、鲜美润滑，有清热解毒、活血止痛、防癌强身等功效；黄山烧饼是徽州特色小吃，皮分层薄如纸，烤制后酥松油润而不腻。此外，各种用当地原产鲜笋或笋干烹调的时令菜也会令你大饱口福。\r\n','webwxgetmsgimg.jpg','5672B1B53E014FE998897745D873DF55webwxgetmsgimg.jpg','是');
/*!40000 ALTER TABLE `traveldestination_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelnote_info`
--

DROP TABLE IF EXISTS `travelnote_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelnote_info` (
  `travelNoteId` int(11) NOT NULL AUTO_INCREMENT,
  `travelNoteName` varchar(50) DEFAULT NULL,
  `travelNoteAuthor` varchar(50) DEFAULT NULL,
  `travelNoteContent` text,
  `publicTime` timestamp NULL DEFAULT NULL,
  `isTop` varchar(20) DEFAULT '否',
  `cityName` varchar(50) DEFAULT NULL,
  `travelNoteFileName` varchar(100) DEFAULT NULL,
  `travelNoteRealName` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT '未审核',
  PRIMARY KEY (`travelNoteId`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelnote_info`
--

LOCK TABLES `travelnote_info` WRITE;
/*!40000 ALTER TABLE `travelnote_info` DISABLE KEYS */;
INSERT INTO `travelnote_info` VALUES (91,'九华行之九华山','溪','<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n	如果说黄山是一幅油彩画，色彩斑斓、美不胜收，那么九华山则是一幅水墨画，质朴淡雅、水墨丹青；如果说黄山是一壶烈酒，直击味蕾、醇馥尽幽，那么九华山则是一杯清茶，抚慰心灵、情意绵绵，在皖南这片土地上黄山和九华山一文一武，一抑一扬撰写着不同的风景和文化。<span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151216/20151216103738_790.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		尽管世人眼中九华山远不及黄山声名显赫、夺人芳心，但斋心涤虑、与世无争才是九华山的真谛，长久以来它无需门庭若市却求源远流长，用独特的素雅诠释佛学文化的精髓。佛缘圣地——九华山最高海拔<span>1344</span>米，由九座山峰环绕而成，连绵起伏宛若九片莲花花瓣合拢成一朵青莲，宁静优美的绽放在皖南的土地上，独自静香却有着出淤泥而不染濯清涟而不妖的风采。正如大诗人李白笔下：“惜在九江上，遥望九华峰，天河摆绿水，秀出九芙蓉”。<span></span>\r\n	</p>\r\n<img src=\"/bupt_cua_test/attached/image/20151216/20151216103810_881.jpg\" alt=\"\" />\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		或许正因莲花向佛，当年新罗国王子金乔觉行走万里才落选此地修炼身心化身为佛，无论是这里的叮铛鸟、摇钱树或是黄精果都赋予了神奇的色彩，倾听叮铛鸟鸣叫会事事顺利，摸摸摇钱树会升官发财，尝尝黄精果会除病去灾，所以世人来这里祈福的同时寻找这三样宝物也成了必做之事！<span></span>\r\n	</p>\r\n<img src=\"/bupt_cua_test/attached/image/20151216/20151216103839_709.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216103851_465.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		九华山中共九十九座庙宇，每一座都宝象庄严香烟缭绕，早登九华山你会看到晨雾未散环绕山间，时而传来晨钟暮鼓同时夹带着僧人们诵经吟唱，置身其中心会变得静如止水，忘掉所有烦恼和忧愁，行走在通往庙宇的山间小路，两旁林木葱郁不由得会让人想起那首：“清晨入古寺，初日照高林，曲径通幽处，禅房花木深，山光悦鸟性，潭影空人心，万籁此皆寂，惟闻钟馨音”。<span></span>\r\n	</p>\r\n<img src=\"/bupt_cua_test/attached/image/20151216/20151216103915_655.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216103933_243.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216103944_557.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		当一屡屡阳光从树间穿过照在山路与庙宇间仿佛是佛光普照，让来到这里的每一个人都能得到佛的眷顾，无论你踏入的是肉身宝殿、百岁宫或是袛园寺，焚一炷薄香敬上，佛祖便会倾听你的心声完成你的心愿。<span></span>\r\n	</p>\r\n<img src=\"/bupt_cua_test/attached/image/20151216/20151216104009_371.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n	九峰环抱中有一座小镇名为九华镇，白墙灰瓦的徽派建筑排列其中，从山顶俯瞰小镇好似莲花的花心，青灰点缀，嫩蕊凝珠，清新脱俗。镇中的化城寺、放生池、九华老街都撰写着慈善孝义的佛学文化，代代相传。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151216/20151216104043_757.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216104053_346.jpg\" alt=\"\" />\r\n</p>','2015-12-16 02:41:00','否','九华山','13.jpg','7654AFDFEB0544179E25DA8BC156C172.jpg','审核通过'),(92,'九华行之大愿文化园','溪','<p>\r\n	<img src=\"/bupt_cua_test/attached/image/20151216/20151216104201_102.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; 当我们感慨古人妙手巧夺天工之时，世人却已用事实诠释了现代人的智慧；九华大愿文化园就是其中之作，原以为大愿文化园仅是个主题公园不必踏入便了解个八九不离十，其实不然，只有真正的走进去才能感受到它的壮观与伟岸，才能为现代人的智慧感到骄傲！\r\n</p>\r\n<p>\r\n	<img src=\"/bupt_cua_test/attached/image/20151216/20151216104229_148.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp;阳光洒在汉白玉的路面、牌楼和桥廊明晃晃的叫人睁不开眼睛，汉白莲花绽放在广场的中心，琉璃墙壁映衬下显得更加洁白无暇。走进佛文化交流中心的大厅，映入眼帘的是一幅平放在中央的十米长卷，上面刻满经文，流水置于经文之上潺潺流淌，发出哗哗的响声；导游讲解说这水声代表着僧人咏诵圣经，源源不断长久不衰，更为神奇的是站立在长卷的中轴线上，可透过一线门，从流水中折射出整个金玉大佛的全貌，栩栩如生活灵活现，如此巧妙的设计可谓别出心裁独具匠心。\r\n</p>\r\n<p>\r\n	<img src=\"/bupt_cua_test/attached/image/20151216/20151216104301_480.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216104310_702.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; 在文化交流中心里一点一滴都充斥着佛的气息，莲花吊顶和地面拼花上下呼应，浑然天成，室内的色彩和装饰将佛的精髓尽展无遗，其间难能可贵的是从全国各地请来的各朝各代的地藏菩萨，虽然外貌有所不同但神情和姿态相似，佛身在盘坐之时一脚盘起一脚踏地，告知世人虽已成佛但永远脚踏民间听取民声民愿，为其排忧解难。\r\n</p>\r\n<p>\r\n	<img src=\"/bupt_cua_test/attached/image/20151216/20151216104340_722.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216104348_3.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216104355_190.jpg\" alt=\"\" /><img src=\"/bupt_cua_test/attached/image/20151216/20151216104402_258.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; 走出文化交流中心便是一坛金灿灿的池水名为佛光池 ，不由得让人联想起西游记中唐僧师徒来到大雷音的情景，或许只有这金色才能够解读出佛祖的圣明，用金辉照去世人的凡俗，洗尽铅华换回纯净的心灵。每当微风袭过池面荡起金色波澜，虽风动、水动心却早已随佛变得静如止水。\r\n</p>\r\n<p>\r\n	<img src=\"/bupt_cua_test/attached/image/20151216/20151216104429_191.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		继续前行便是通往<span>99</span>米大佛山丘路，路旁虽是新树却早已郁郁匆匆，给行人带来一丝凉爽！溪边垂柳在风中不断的摇曳，好似诗人笔下：“九华山路云遮寺，清戈江村柳拂桥”这里虽然没有寺院，却有着现代的音乐喷泉，一曲飞天之舞讲述化凡为仙的神奇，喷泉喷出的雾气凝聚在大佛脚下，佛顶照射着从云间洒下的阳光好似佛韵光环，由下仰望仿佛真的来到圣佛仙境，也可化身成佛的感觉。感慨此情此景何等神奇，何等雄伟，何等感化人心的同时感谢创造这里的风水学家和建筑学家，是他们的慧眼和智慧的才造就出今天的奇景。当时过境迁之后这里也将成为佳话，成为前人留给后人永远的财富，这与佛普度众生的精神有着异曲同工之处！<span></span>\r\n	</p>\r\n</p>','2015-12-16 02:44:51','是','九华山','2.jpg','4C8B75F49A8240B99B7ED2831C2C500C.jpg','审核通过'),(94,'阿尔山的吃喝玩乐记','金金','<p class=\"MsoNormal\">\r\n	本来联航双十一抢票活动想去三亚，奈何身边刚从广东来的朋友想去阿尔山，夸得天上地下的所以我们就在最冷清的季节来到了阿尔山<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	看雪。。。。。。（气温零下二十到三十度）<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	机票<span>68+111+50</span>（机建）<span>*2</span>，往返一共<span>279</span>（双十二北京到阿尔山联航票价才<span>8</span>元，亏了，不过也很划算啦～吼吼～～以后关注联航，继续特价票玩起～～～）。<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	12月<span>4</span>日清晨<span>6:30</span>，联航，从北京南苑机场直飞阿尔山伊尔施机场。<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133457_617.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133510_143.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	在飞机上还看了个日出，越往北越寒冷，人烟越少，上午9:00到阿尔山机场。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133542_644.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	从机场出来后，天上飘着小雪，司机姐姐（我们提前联系好了包车）已经在机场等我们了，还给我们戴上了洁白的哈达，心里暖暖的，然后就开始了我们的阿尔山之旅～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133713_23.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133728_804.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133801_650.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	历经1个多小时的车程终于到达阿尔山国家森林公园，留照纪念～要撒欢的赶脚\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133839_596.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133900_881.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133933_223.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	冬日里的不冻河美得好似泼墨的画～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228134922_305.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228134933_699.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	中午在附近随便找了一家饭店，点了4个菜加主食，狍子肉、土鸡炖蘑菇、蒜黄鸡蛋和豆腐（东北的卤水豆腐超好吃～～）。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135015_668.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	下午去了传说中的阿尔山温泉，水滑滑的，而且人不多，包场了，哈哈（名副其实～～）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135206_203.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135217_713.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	去吃饭的路上，路过一座童话般的城堡，颇为惊艳，豪宅呀～ 没想到司机姐姐告诉我们这是阿尔山医院～阿尔山的建筑一到晚上就灯火通明，土豪呀，有没有～（这一晚上电费得多钱啊～哈哈）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135250_503.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135300_441.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135313_778.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	零下三十多度的天气，吃个暖暖的火锅，不能再爽啦～～～超赞。推荐当地饮料——野生山丁子，酸酸甜甜，口感不涩。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135354_644.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135415_166.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135431_511.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	吃饱喝足，回到酒店，暖气太热，买根冰棒降降温，窗外鹅毛大雪～（冰火两重天啊～哈哈）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135735_920.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135828_836.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135903_630.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	第二天，拨开云雾见日明，出太阳啦，运气还真真是特别好～吼吼～早晨酒店的自助早餐还吃到了当地的野生木耳，又厚又好吃（为此，特意问了服务员去哪里买，后来还央求司机姐姐带我们去买了好多～哈哈）。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140131_502.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140144_292.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	出发了！去看白狼峰雾松，路上偶遇动物若干～什么牛啊，羊啊的，还跟我们卖萌～哈哈\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140356_211.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140525_603.png\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	路上碰到在为冰雪节准备的雪雕正在雕刻，作品完成后一定很美～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140626_513.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140837_829.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	手机随便一拍，就是一幅美景（没有PS哦～～）。其他景点都是待一个小时就冻得跑回车里，唯独这里，太美了，足足两个多小时，冻成狗都不舍得出来！！！后来才听司机姐姐说，这雾松还真不是谁都能看到的，看来我们有缘～（是不是平时好事做的太多了～哈哈）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144143_544.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144205_231.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144248_738.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144302_621.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	中午去伊尔施镇购买野味山货(帮大家带了好多，后来到机场还费了下脑力寻思怎么分配不用托运～吼吼)，朋友推荐选择在一家铁锅炖，排骨锅真心好吃哦～推荐呢！\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144658_728.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144713_230.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144727_206.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	下午又开始飘雪，大家到滑雪场滑雪，又是包场，哈哈～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144806_843.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	玩累了，继续吃～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228145217_434.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228145231_424.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228145248_792.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	来了东北，吃顿饺子吧～味道一般～但是蚕蛹很好吃～酥酥脆脆的（害怕的朋友们不要介意哦～但是真心好吃～啧啧～）<br />\r\n马上要结束3天的阿尔山之旅了，好不舍得啊，虽然冷～但是好值～等再有特价票～还会来的哦～<br />\r\n<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>','2015-12-28 06:53:03','否','阿尔山','38.jpg','D9CF3099997B417B8796C02D9C18F7F3.jpg','审核通过'),(95,'阿尔山的吃喝玩乐记','金金','<p class=\"MsoNormal\">\r\n	本来联航双十一抢票活动想去三亚，奈何身边刚从广东来的朋友想去阿尔山，夸得天上地下的所以我们就在最冷清的季节来到了阿尔山<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	看雪。。。。。。（气温零下二十到三十度）<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	机票<span>68+111+50</span>（机建）<span>*2</span>，往返一共<span>279</span>（双十二北京到阿尔山联航票价才<span>8</span>元，亏了，不过也很划算啦～吼吼～～以后关注联航，继续特价票玩起～～～）。<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	12月<span>4</span>日清晨<span>6:30</span>，联航，从北京南苑机场直飞阿尔山伊尔施机场。<span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133457_617.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133510_143.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	在飞机上还看了个日出，越往北越寒冷，人烟越少，上午9:00到阿尔山机场。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133542_644.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	从机场出来后，天上飘着小雪，司机姐姐（我们提前联系好了包车）已经在机场等我们了，还给我们戴上了洁白的哈达，心里暖暖的，然后就开始了我们的阿尔山之旅～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133713_23.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133728_804.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133801_650.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	历经1个多小时的车程终于到达阿尔山国家森林公园，留照纪念～要撒欢的赶脚\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133839_596.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133900_881.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228133933_223.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	冬日里的不冻河美得好似泼墨的画～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228134922_305.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228134933_699.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	中午在附近随便找了一家饭店，点了4个菜加主食，狍子肉、土鸡炖蘑菇、蒜黄鸡蛋和豆腐（东北的卤水豆腐超好吃～～）。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135015_668.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	下午去了传说中的阿尔山温泉，水滑滑的，而且人不多，包场了，哈哈（名副其实～～）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135206_203.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135217_713.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	去吃饭的路上，路过一座童话般的城堡，颇为惊艳，豪宅呀～ 没想到司机姐姐告诉我们这是阿尔山医院～阿尔山的建筑一到晚上就灯火通明，土豪呀，有没有～（这一晚上电费得多钱啊～哈哈）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135250_503.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135300_441.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135313_778.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	零下三十多度的天气，吃个暖暖的火锅，不能再爽啦～～～超赞。推荐当地饮料——野生山丁子，酸酸甜甜，口感不涩。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135354_644.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135415_166.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135431_511.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	吃饱喝足，回到酒店，暖气太热，买根冰棒降降温，窗外鹅毛大雪～（冰火两重天啊～哈哈）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135735_920.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135828_836.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228135903_630.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	第二天，拨开云雾见日明，出太阳啦，运气还真真是特别好～吼吼～早晨酒店的自助早餐还吃到了当地的野生木耳，又厚又好吃（为此，特意问了服务员去哪里买，后来还央求司机姐姐带我们去买了好多～哈哈）。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140131_502.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140144_292.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	出发了！去看白狼峰雾松，路上偶遇动物若干～什么牛啊，羊啊的，还跟我们卖萌～哈哈\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140356_211.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140525_603.png\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	路上碰到在为冰雪节准备的雪雕正在雕刻，作品完成后一定很美～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140626_513.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228140837_829.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	手机随便一拍，就是一幅美景（没有PS哦～～）。其他景点都是待一个小时就冻得跑回车里，唯独这里，太美了，足足两个多小时，冻成狗都不舍得出来！！！后来才听司机姐姐说，这雾松还真不是谁都能看到的，看来我们有缘～（是不是平时好事做的太多了～哈哈）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144143_544.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144205_231.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144248_738.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144302_621.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	中午去伊尔施镇购买野味山货(帮大家带了好多，后来到机场还费了下脑力寻思怎么分配不用托运～吼吼)，朋友推荐选择在一家铁锅炖，排骨锅真心好吃哦～推荐呢！\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144658_728.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144713_230.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144727_206.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	下午又开始飘雪，大家到滑雪场滑雪，又是包场，哈哈～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228144806_843.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	玩累了，继续吃～\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228145217_434.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228145231_424.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/bupt_cua_test/attached/image/20151228/20151228145248_792.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	来了东北，吃顿饺子吧～味道一般～但是蚕蛹很好吃～酥酥脆脆的（害怕的朋友们不要介意哦～但是真心好吃～啧啧～）<br />\r\n马上要结束3天的阿尔山之旅了，好不舍得啊，虽然冷～但是好值～等再有特价票～还会来的哦～<br />\r\n<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>','2015-12-28 06:53:39','是','阿尔山','38.jpg','E5F1AD37B1224E608FB8103497C640E7.jpg','审核通过'),(96,'a','fdsa','fdsafdsafdsaf','2016-07-02 08:18:12','是','fdsa','secondarytile.png','27ED8129181C4505A30972954A71329F.png','审核通过'),(97,'a','fdsa','fdsafdsaf','2016-07-02 08:18:30','否','fdsa','secondarytile.png','9E11EE0E01BF49A3ACEF107BBF9354BE.png','审核通过'),(98,'fdsafdsa','fds','fdsafdsafdsfdsa<img src=\"/bupt_cua_test/attached/image/20160702/20160702162300_723.png\" alt=\"\" />','2016-07-02 08:23:01','是','fdsa','secondarytile.png','92B2FB4651B64FF9AEBF5B352AAA643E.png','审核通过'),(99,'yzq','yzq','范德萨范德萨<img src=\"/bupt_cua_test/attached/image/20160711/20160711085044_171.jpg\" alt=\"\" />','2016-07-11 00:50:46','否','武汉','a5c27d1ed21b0ef4038517b8dfc451da80cb3ee2.jpg','DB1327247D6C436283312E29519F6E6F.jpg','审核通过');
/*!40000 ALTER TABLE `travelnote_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelnotephoto_info`
--

DROP TABLE IF EXISTS `travelnotephoto_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelnotephoto_info` (
  `travelNotePhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `travelNotePhotoFileName` varchar(100) DEFAULT NULL,
  `travelNotePhotoRealName` varchar(150) DEFAULT NULL,
  `travelNotePhotoAuthor` varchar(50) DEFAULT NULL,
  `travelNoteName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`travelNotePhotoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelnotephoto_info`
--

LOCK TABLES `travelnotephoto_info` WRITE;
/*!40000 ALTER TABLE `travelnotephoto_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `travelnotephoto_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelnotetopphoto_info`
--

DROP TABLE IF EXISTS `travelnotetopphoto_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelnotetopphoto_info` (
  `travelnoteTopPhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `travelnoteTopPhotoFileName` varchar(255) DEFAULT NULL,
  `travelnoteTopPhotoRealName` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL,
  `isTop` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`travelnoteTopPhotoId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelnotetopphoto_info`
--

LOCK TABLES `travelnotetopphoto_info` WRITE;
/*!40000 ALTER TABLE `travelnotetopphoto_info` DISABLE KEYS */;
INSERT INTO `travelnotetopphoto_info` VALUES (32,'2.jpeg','1216B079D5EB4473B092137306D21722.jpeg','2016-6-24 12:51:06','是'),(33,'1.jpeg','621D349B9FED445E8883DD295923677A.jpeg','2016-6-24 12:51:14','是'),(34,'3.jpeg','3CAE6368CF454A489AD43F52CEBFFAE0.jpeg','2016-6-24 12:51:58','是'),(35,'4.jpeg','BF3EFBEE812B4430AB09E4C46C4DC3A3.jpeg','2016-6-24 12:52:04','是');
/*!40000 ALTER TABLE `travelnotetopphoto_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `userPasswd` varchar(10) DEFAULT NULL,
  `userMail` varchar(100) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  `verifyCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'czq','123','123',1,'1234'),(2,'fy','123',NULL,0,NULL),(3,'fy1','123',NULL,0,NULL),(4,'fy2','123',NULL,0,NULL),(5,'fy3','123',NULL,0,NULL),(6,'fy4','123',NULL,0,NULL),(7,'fy8','123',NULL,0,NULL),(8,'fy9','123',NULL,0,NULL),(9,'fya','123',NULL,0,NULL),(10,'fyb','123',NULL,0,NULL),(11,'fyc','123',NULL,0,NULL),(12,'msh','123',NULL,0,NULL);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-23 11:15:12
