-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: smartex
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ceremony`
--

DROP TABLE IF EXISTS `ceremony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ceremony` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ceremony_name` varchar(255) DEFAULT NULL,
  `ceremony_date` date DEFAULT NULL,
  `ceremony_link` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceremony`
--

LOCK TABLES `ceremony` WRITE;
/*!40000 ALTER TABLE `ceremony` DISABLE KEYS */;
INSERT INTO `ceremony` VALUES (38,'Architects Address Misconceptions at Smartex 2023','2024-05-11','https://www.youtube.com/watch?v=qc2ucRJ-j0s','1716964397619c1.jpg','2024-05-29 06:33:17',1),(39,'Resounding Success at the Smartex Symposium & Expo in Delhi','2024-05-10','https://www.youtube.com/watch?v=25NW7T7gg24','1716964448476c2.jpg','2024-05-29 06:34:08',1),(40,'Exploring the Tapestry of Architecture: Sunita Kohli\'s Insightful Discourse| Sunita Kholi | Keynotes','2024-05-02','https://www.youtube.com/watch?v=3MNDEtoUVGg','1716964490244c3.jpg','2024-05-29 06:34:50',1);
/*!40000 ALTER TABLE `ceremony` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_desc` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (42,'First event','First event','First event','First event','2024-05-04','17169645580431.webp','2024-05-29 06:35:58',1),(43,'g','gf','f','fg','2024-05-11','17169645679872.webp','2024-05-29 06:36:08',1),(44,'dgf','fg','fgf','gf','2024-04-29','17169645952593.webp','2024-05-29 06:36:35',1),(45,'fg','gf','fgg','ffg','2024-05-01','17169646083794.webp','2024-05-29 06:36:48',1),(46,'fggkuy','gf','fgf','fghgfjhfgj','2024-05-09','17169646198915.webp','2024-05-29 06:37:00',1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_images`
--

DROP TABLE IF EXISTS `partner_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int DEFAULT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_images`
--

LOCK TABLES `partner_images` WRITE;
/*!40000 ALTER TABLE `partner_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alt` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (292,'smertex partners','17171358470281.jpg','2024-05-31 06:10:47',1),(293,'smertex partners','17171358470282.jpg','2024-05-31 06:10:47',1),(294,'smertex partners','17171358470293.jpg','2024-05-31 06:10:47',1),(295,'smertex partners','17171358470304.jpg','2024-05-31 06:10:47',1),(296,'smertex partners','17171358470305.jpg','2024-05-31 06:10:47',1),(297,'smertex partners','17171358470306.jpg','2024-05-31 06:10:47',1),(298,'smertex partners','17171358470327.jpg','2024-05-31 06:10:47',1),(299,'smertex partners','17171358470328.jpg','2024-05-31 06:10:47',1),(300,'smertex partners','17171358470339.jpg','2024-05-31 06:10:47',1),(301,'smertex partners','171713584703310.jpg','2024-05-31 06:10:47',1),(302,'smertex partners','171713584703411.jpg','2024-05-31 06:10:47',1),(303,'smertex partners','171713584703412.jpg','2024-05-31 06:10:47',1),(304,'smertex partners','171713584703421.jpg','2024-05-31 06:10:47',1),(305,'partners','171713589652513.jpg','2024-05-31 06:11:36',1),(306,'partners','171713589652514.jpg','2024-05-31 06:11:36',1),(307,'partners','171713589652515.jpg','2024-05-31 06:11:36',1),(308,'partners','171713589652716.jpg','2024-05-31 06:11:36',1),(309,'partners','171713589652717.jpg','2024-05-31 06:11:36',1),(310,'partners','171713589653018.jpg','2024-05-31 06:11:36',1),(311,'partners','171713589653019.jpg','2024-05-31 06:11:36',1),(312,'partners','171713589653120.jpg','2024-05-31 06:11:36',1),(313,'partners','171713589653121.jpg','2024-05-31 06:11:36',1),(314,'partners','171713589653222.jpg','2024-05-31 06:11:36',1),(315,'partners','171713589653223.jpg','2024-05-31 06:11:36',1),(316,'partners','171713589653224.jpg','2024-05-31 06:11:36',1);
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` longtext NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `blog_date` date DEFAULT NULL,
  `blog_image_title` varchar(255) DEFAULT NULL,
  `blog_links` varchar(255) DEFAULT NULL,
  `blog_by` varchar(255) DEFAULT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (168,'Dine with Designers’ Kindles Zeal Amongst the Designers in Hisar','<h1><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/Lamp%20Lighting(1).jpg\"></h1><p><br></p><p><strong>Hisar [India], December 2:&nbsp;</strong>Building Material Reporter (BMR) conducted the \'Dine with Designers’ at Hisar, prepping up for the much awaited gala event, Smartex 2024 New Delhi Edition.</p><p><br></p><p>The event took place on December 2, 2023, at the Lemon Tree Hotel Hisar, marking the celebration and success of hard work by the designers and architects of the region.&nbsp;This event marks the fourth edition of the gala symposium in the field of design and architecture.</p><p>&nbsp;</p><p><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/Brands(1).jpg\"></p><p>&nbsp;</p><p>The event was a huge success marking the presence of many distinguished architects and designers including the key industry stakeholders. The brands that showed their presence were&nbsp;<strong>VOX Building Products India Pvt. Ltd., Benchmark Lifestyle Solutions (Qualita), Ventura International Pvt. Ltd., Gujarat Guardian Limited, Purbanchal Laminates Pvt. Ltd. (Amulya Mica), Haryana Doors, Vibrant Technik, Kerakoll India Pvt. Ltd. and Home Decor.&nbsp;</strong></p><p>&nbsp;</p><p><a href=\"https://www.buildingmaterialreporter.com/news/industry-news/pm-modi-all-set-to-inaugurate-biggest-office-in-the-world-on-december-17-in-surat\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Read More: PM Modi All Set to Inaugurate Biggest Office in the World on December 17 in Surat</strong></a></p><p>&nbsp;</p><p><strong>Objective</strong></p><p><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/objective(1).jpg\"></p><p>&nbsp;</p><p>Within the domains of&nbsp;<strong>architecture and design</strong>, this event acted as a focal point for cooperation, creativity, and inspiration. Leading regional architects, designers, and consultants joined forces with top national and international brands at the event.</p><p>&nbsp;</p><p>The industry is buzzing about Dine with Designers\' success, which further demonstrates our dedication to encouraging cooperation, creativity, and inspiration in the field of architecture and design. With the motive to ignite the essence of encouragement in the&nbsp;<a href=\"https://www.buildingmaterialreporter.com/events/news-views/dine-with-designers-ignites-the-buzz-in-tier-2-3-cities\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Tier 2 and Tier 3&nbsp;</strong></a>cities, our last event in&nbsp;<a href=\"https://www.buildingmaterialreporter.com/events/news-views/bmr-celebrates-dine-with-designers-in-guwahati-connecting-all-the-dots-of-india\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Guwahati</strong></a>&nbsp;also thoroughly celebrated the designers with lauds and praises.&nbsp;</p><p>&nbsp;</p><p><a href=\"https://www.buildingmaterialreporter.com/news/industry-news/ayodhyas-ram-mandir-is-all-getting-set-to-be-open-for-the-pilgrims\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Read More: Ayodhya’s Ram Mandir Is All Getting Set to Be Open for the Pilgrims</strong></a></p><p>&nbsp;</p><p><strong>Highlights</strong></p><p><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/Highlights(1).jpg\"></p><p>&nbsp;</p><p>The team<a href=\"https://www.buildingmaterialreporter.com/events/news-views/whats-smartex\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>&nbsp;Smartex</strong></a>&nbsp;presented Lifetime achievement Award to<strong>&nbsp;Ar. Satish Kumar Singla</strong>, for his phenomenal contribution in the architectural and design world. Apart from working as a Professor &amp; Architect Advisor in former reputed platforms, his works have set grounds of motivation in the field of design.&nbsp;</p><p>&nbsp;</p><p>The awardee list also included exponential work of the individuals form the city. Some of the recipients of the honour were&nbsp;<strong>&nbsp;Ar. Sunny Garg</strong>&nbsp;and&nbsp;<strong>Ar.&nbsp;Ekta Garg, Ar. Ankit Gera, Ar. Ajayender Beniwal, Dipesh &amp; Uma, Ar. Pankaj Garhwal, Ar. Akshat Mehta</strong>&nbsp;and&nbsp;<strong>Ar. Paramvir Kumar</strong>. Also, the Smartex Prime Award went to&nbsp;<strong>&nbsp;Ar. Nitin Kumar&nbsp;</strong>and&nbsp;<strong>Ar. Shilpa Kumar</strong>&nbsp;of RS Architects for their unbeatable contribution in the field of design.&nbsp;</p><p>&nbsp;</p><p><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/Awardee(1).jpg\"></p><p><a href=\"https://www.buildingmaterialreporter.com/influencers/architect-and-design/the-change-in-the-construction-design-industry-its-getting-better\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Read More: The Change in the Construction &amp; Design Industry- It’s Getting Better</strong></a></p><p>&nbsp;</p><p><strong>Future Endeavors</strong></p><p><br></p><p><strong>Dine with Designers: Chapter Hisar&nbsp;</strong>posed to be a huge success, encouraging us to organise more such events in future. Building Material Reporter is a prominent platform that honors and recognizes exceptional work produced by individuals in a variety of industries. We are having the mega&nbsp;<strong>Smartex event in February 2024</strong>&nbsp;with lots of interactions and celebrations ahead. The brand aims to empower, inspire, and connect professionals, is essential to promoting development, creativity, and teamwork.&nbsp;</p><p><br></p><p><strong>BMR&nbsp;</strong>continues to bring together professionals, enthusiasts, and leaders in the architecture and design industry in India to collaborate, learn, and inspire, with a primary focus on creating networking opportunities.</p>','17169637850181__2_.jpg','2024-05-29 11:53:05',1,'Dine with Designers’ Kindles Zeal Amongst the Designers in Hisar','Dine with Designers’ Kindles Zeal Amongst the Designers in Hisar','Dine with Designers’ Kindles Zeal Amongst the Designers in Hisar','2023-12-13','Dine with Designers’ Kindles Zeal Amongst the Designers in Hisar',NULL,'Team','news',1),(169,'BMR celebrates \'Dine with designers\' in Guwahati, connecting all the dots of India','<h1 class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/01%20(2)(4).jpg\"></h1><p class=\"ql-align-justify\">Guwahati [India], November 4: Building Material Reporter, India’s fastest video news generator for building products, design, construction, and architecture, proudly announces the successful conclusion of the mega event \'<strong>Dine with Designers\'</strong>&nbsp;which happened on 4th November in Guwahati, Assam. This event marks the third edition of the gala symposium in the field of design and architecture.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://lh7-us.googleusercontent.com/ud8NfJjRv7vzdrK4u59HvLfIxvXG8ofk_0483oNlsl_dJVzuOy4L-G8XEzH5hl-FI_1FA-NlaQcdK820ZgNrKTH3e10-KRX6kWaTuijzr44803gkq5PReLGUjp1T8XYeRBc98dPetkJ-wsFBQrTbZAU\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">This lauding celebration have developed into a prominent forum for praising and honoring achievement in segments but all in the field of building construction, architecture and design. Dine with Designers have seen a huge success, commencing the first from&nbsp;<a href=\"https://www.buildingmaterialreporter.com/influencers/architect-and-design/smartex-delhi-2023-creates-powerful-template-for-a-bright-and-better-future\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Smartex Delhi</strong></a>, followed by&nbsp;<a href=\"https://www.buildingmaterialreporter.com/events/news-views/dine-with-designers-ignites-the-buzz-in-tier-2-3-cities\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Karnal</strong></a>&nbsp;and now in Guwahati, garnering enormous recognition and becoming a standard for excellence and creativity after two successful editions.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://lh7-us.googleusercontent.com/rNPOlmVEaQey0wVwC_vh5O7UaAY-247AsgTAr3_FBNyak4XeqZjl2Pgcw3UzyQN4U8Qjlc6iGW8iQ7irZ3-pULcY3d6dKix6Cy_GuqlYemC57CO7op7xN3YzREi1FHur6CmQw1sAcqV8jj-t734r-Mo\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">The entire agenda behind the ceremony holds to honor individuals of tier 2 and tier 3 cities ,who have demonstrated exceptional talent, creativity, and expertise in their respective fields. The stakeholders of the brand event: Title partner Haier, Powered by Alstone and Associates Partner Canon, Gujarat Guardian Ltd, VOX and Vibrant Technik were the pioneers in making the event possible. The brands showcased their new product launch, innovative materials and latest technology which were also the highlights of the event. The evening also witnessed college students from Royal Global University, JD Institute of Fashion Technology and Guwahati College of Architecture, outstanding architects from Guwahati-&nbsp;<strong>Ar. Ranjib Baruah, Ar. Pankaj Phukan, Ar. Pritam Nath, Ar. Rittick Hazarika</strong>&nbsp;are a few names to mention.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><strong>Key Highlights</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"https://lh7-us.googleusercontent.com/b-ShxHLw2IG11MmqsSiZ0rHpg2zQpV2mLZ1UTvLs0Q4tdUEwMU34yBkF522Dqd-Cr7-VAHW137deE-tZJ0tRNX0T1e8JG0Ejh2NszNRCVyyj6noi1Qcb4DNisIUbJyHIscxB66HDbz27hhI_ISvzIV4\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">The event had lamp lighting, keynote message, technical presentations, panel discussions, award ceremony and networking which embarked a platform to acknowledge, share ideas and celebrate excellence.&nbsp;<strong>Prof. Manoj Mathur</strong>, Director of Mathur &amp; Kapre Associates, was the keynote speaker for the evening. His message on sustainable design idealogies and environmental safety concerns in the construction plethora left a strong impression on the audience.&nbsp;</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://lh7-us.googleusercontent.com/AIrZ-n7gcgSH3dF88HjQGNss-SD9K9ay97Mz5ik6_8JqzMAuYVHIMSn4XqMdg58ARlzJ-Rf8fryBSG_5Tx9c7UlRbDwNZVVLuGcjvVZiIwlVaAAboALWahu7P1B3hcdR9dNEiz0ZforPJIcbGq3T2TU\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">Another important segment was the panel discussion. The first dialogue revolved around the topic “The Double edged Sword: Google and Digital Platform’s influence on Architectural Creativity &amp; Profession” with moderator being&nbsp;<strong>Ar. Pankaj Phukan</strong>, owner of Pankaj Phukan &amp; Associates. The panelists of the discussion were&nbsp;<strong>Ar. Rittick Hazarika, Ar. Amrita Sabhapandit, Ar. Aditya Garodiia, Ar. Tapobratta Dutta and Ar. Pinaki Bhattacharjee</strong>&nbsp;who shared their unique perspectives on the topic.&nbsp;</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://lh7-us.googleusercontent.com/qdi5U2xHpMiZnMW7q3a5aojxwZPDYysBIe2kE4YEoz1In_zkDxjRKqS06kXX1XN4Huv8mEk_Y9_dc06yLwZxCkKKjPnW2Q0rjziTIvCQ-1Fe_ZxP7TUGbVNCeBjb03wEfqF3P6ogLlHz0wgOrtXkCos\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">In the second round of panel discussion, architects exchanged the views on the topic: “Architect Client Dynamics: Balancing sweet and bitter for successful collaborations” with moderator being&nbsp;<strong>Ar. Amitabh Sharma</strong>, Senior Architect &amp; Founder of Akar Foundation. Ar. Ragini Goswami, Ar. Deboshish Chakraborty,&nbsp;<strong>Ar. Avinash Chirania, Ar. Ayanjeet Choudhary and Ar. Pritam Nath</strong>&nbsp;were the panelists of the discussion who shared insightful viewpoints.&nbsp;</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><strong>Awards do make the journey sweeter</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"https://lh7-us.googleusercontent.com/p8iZnPzlj13v48iNemeNfnRroyGQQWhO2Yb8iBoRKB2uAKc48mzV6aAJeriPcxep_KAmDlA8frFvzU3FkSyK-WPZh3I0h82EGlOMAmZvG-wfFylk23Xrxhol8lO7vf8TKNBUXa623O_2swpXTLD_jFo\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">In addition to these highlights, the team Smartex also presented Lifetime achievement Award to&nbsp;<strong>Ar. Biswa Datta&nbsp;</strong>who has set the bars of success with his vision to change the architectural world. Apart from this, awardee list also included outstanding individuals contributing significantly since past 3 decades and the stake holders who have significantly contributed to building construction, design and architecture sectors. Some of the awardees of the ceremony were<strong>&nbsp;Ar. Ronojoy Sen, Ar. Ramendra Nath Baishya, Ar. Arijeet Choudhary, Ar. Arup Kumar Das, Ar. Ranjib Barua &amp; Ami Ambani Barua.&nbsp;</strong></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><strong>Future Initiatives:&nbsp;</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"https://lh7-us.googleusercontent.com/QYJ8pcTF_LOhG4f-KwEB2v1FIjM0hr_E8ajfhOj3DHZlU81DueSQ3GFn6RWyp5KgU7ZSbg60kCO1YFprXC3eTNVcoKbF0y4mM2gppJ08USOJSFd1NwvSe6NC5gCphF3fAkumpZpxULbVN7J35EsQgSE\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">With this amazing success of Dine with Designers:Chapter Guwahati, our future initiatives are lined up with all the hustle and bustle. Building Material Reporter is a leading platform that recognizes and honors the outstanding work of the people across diverse industries. With a mission to inspire, connect, and empower professionals, the brand plays a pivotal role in fostering growth, innovation, and collaboration. With a major focus on creating networking opportunities, the company continues to bring together industry leaders, professionals, and enthusiasts to inspire, learn, and collaborate.</p><p><br></p>','17169638632871__1_.jpg','2024-05-29 11:54:23',1,'BMR celebrates \'Dine with designers\' in Guwahati, connecting all the dots of India','BMR celebrates \'Dine with designers\' in Guwahati, connecting all the dots of India','BMR celebrates \'Dine with designers\' in Guwahati, connecting all the dots of India','2023-11-09','BMR celebrates \'Dine with designers\' in Guwahati, connecting all the dots of India',NULL,'Team','news',1),(170,'DINE WITH DESIGNERS IGNITES THE BUZZ IN TIER-2 & -3 CITIES','<h1 class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/06%20(4).jpg\"></h1><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><strong>Building Material Reporter (BMR) takes regional route with \'Dine with Designers,\' following the resounding success of Smartex 2023 New Delhi Edition.</strong></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">Our inaugural event in Karnal, held on September 16, 2023, at the Noormahal Palace, marks the beginning of an exciting journey. This comes after the triumphant Smartex New Delhi Edition, which took place in February 2023 at the Pride Plaza Hotel, Aerocity in New Delhi.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">Dine with Designers 2023 achieved remarkable success, drawing the participation of approximately 100 distinguished architects and designers, as well as other key industry stakeholders. Additionally, prominent brands like&nbsp;<strong>Gujarat Guardian, Haier, Simpolo Ceramics, Lovely Alumatter, Sakarni Plasters, VOX,&nbsp;</strong>and<strong>&nbsp;Astravernici</strong>&nbsp;seized the opportunity to unveil their latest products and solutions on the stage.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/Dine.jpg\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">This event served as a hub for collaboration, innovation, and inspiration within the fields of architecture and design. The gathering brought together top national and international brands, renowned architects, designers, and consultants from across the region.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">The occasion was graced by the presence of esteemed individuals such as&nbsp;<strong>Ar. Nitin Rawal, Ar. Pratibha Rawal, Ar. Puneet Narang, Ar. Poonam Sethi, Ar. Jatin Khurana, Ar. Pawan Lakra, Ar. Sanjeev Kumar, Ar. Meenakshi, Ar. Mohit Chhabra, Ar. Naveen Goyal, Ar. Dalip Khurana, Ar. Tarun Gaur, Ar. Vaibhav Gogra, Ar. Paras Dhingra, Ar. Manpreet Saggu, Ar. Bhupinder Singh, Ar. Raman Lamba, Ar. Gitesh Aghi, Ar. Sanjay Gupta, Ar. Niharika Arora, Ar. Khurram Ali,&nbsp;</strong>and<strong>&nbsp;Ar. Kavita Sharma</strong>, among others.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\">The success of&nbsp;<strong>Dine with Designers</strong>&nbsp;has ignited a buzz in the building industry, further solidifying our commitment to fostering collaboration, innovation, and inspiration in the realm of architecture and design.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/03%20(10).jpg\"></p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><strong>The Objective</strong></p><p class=\"ql-align-justify\">With a platform curated by professionals, for professionals, our primary goal is to make a substantial impact within the broader built community. Thus, we are expanding the reach of&nbsp;<strong>Dine with Designers</strong>&nbsp;to address the pressing needs on a regional level. This forum also served as a vital space for policymakers, businesses, and technocrats to gain valuable exposure and access crucial information through the sharing of relevant content by industry experts.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/01%20(9).jpg\"></p><p class=\"ql-align-justify\"><strong>Key Highlights:</strong></p><p class=\"ql-align-justify\"><strong>Eminent Attendees:&nbsp;</strong>The event drew a diverse and illustrious crowd of architects, designers, and industry stalwarts, featuring not only renowned architects but also promising newcomers in the design arena. This diversity infused the event with dynamic discussions and fertile networking opportunities.</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>Product Showcases:</strong>&nbsp;Seven renowned brands&nbsp;<strong>Gujarat Guardian, Haier, Simpolo Ceramics, Lovely Alumatter, Sakarni Plasters, VOX, and Astravernici</strong>&nbsp;unveiled their cutting-edge products, encompassing groundbreaking building materials and avant-garde interior design solutions. Attendees had the privilege of immersing themselves in these innovations, exploring new products displayed over there, and engaging in enlightening dialogues with the brand representatives.&nbsp;</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/02%20(8).jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>Enlightening Keynote:&nbsp;</strong>The conference showcased a distinguished keynote speaker Ar. Rahul Tyagi who imparted his profound insights and experiences in the architecture and design sphere. His presentation titled<strong>&nbsp;‘Five Elements Of Design - Let’s Call It Green…Now!’</strong>&nbsp;sparked captivating debates and offered invaluable perspectives on the future of architecture and design.</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>Networking Galore:&nbsp;</strong>The event facilitated extensive networking opportunities through dining and chit-chatting together in an informal setting. These interactions sowed the seeds for promising collaborations and partnerships, further enhancing the event\'s overall impact.&nbsp;</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/05%20(2).jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>Future Initiatives:</strong></p><p class=\"ql-align-justify\">As we reflect on the triumph of the&nbsp;<strong>Dine with Designers<em>,</em></strong>&nbsp;our gaze is already fixed on future initiatives. We are committed to perpetuating this platform, where visionaries, professionals, and brands converge to ignite innovation and nurture creativity in the architecture and design realm.</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/04%20(4).jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>Acknowledgement</strong></p><p class=\"ql-align-justify\">Our heartfelt gratitude extends to all the architects, designers, brands, speakers, sponsors, and attendees whose unwavering support and enthusiastic participation propelled this event to unparalleled heights. Your contributions were the lifeblood of this conference, and we eagerly anticipate your continued involvement in our future endeavours as we continue to elevate the landscape of architecture and design.</p><p><br></p>','17169639165811__3_.jpg','2024-05-29 11:55:16',1,'DINE WITH DESIGNERS IGNITES THE BUZZ IN TIER-2 & -3 CITIES','DINE WITH DESIGNERS IGNITES THE BUZZ IN TIER-2 & -3 CITIES','DINE WITH DESIGNERS IGNITES THE BUZZ IN TIER-2 & -3 CITIES','2023-09-16','DINE WITH DESIGNERS IGNITES THE BUZZ IN TIER-2 & -3 CITIES',NULL,'Team','news',1),(171,'WHAT’S SMARTEX?','<h1 class=\"ql-align-justify\"><img src=\"https://www.buildingmaterialreporter.com/uploads/blogs/files/smartexlogo.png\"></h1><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><a href=\"https://www.smartex.org.in/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(241, 196, 15);\"><strong>Smartex</strong></a><strong>&nbsp;</strong>is a humble initiative by&nbsp;<strong>Building Material Reporter</strong>—India’s fastest and most reliable media house on building materials, design, architecture, emerging technologies, and associated industries--to shape India’s future and make it, and the world, a beautiful and better place to live in, through better and state-of-the-art design,&nbsp;<strong>architecture, building materials</strong>, and technology.&nbsp;</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">The mega symposium &amp; expo brings some of the finest architects, designers, builders &amp; real estate developers, product-makers, engineers, and influencers, from across the country and beyond, on a common platform, and under one roof, for a cause that affects the future of India and the entire world.</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">The first edition of&nbsp;<strong>Smartex</strong>&nbsp;was held in 2023 in February in&nbsp;<strong>Delhi</strong>. The second edition of the hugely successful event will be held on February 9-10 in Delhi.&nbsp;</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">In the first event, numerous well-known architects and designers participated, including&nbsp;<strong>Padm Shri Sunita Kohli</strong>, the Creative Head of K2 India; Ar. P.R Mehta, Ex-President Council of Architects, Design Action Group;&nbsp;<strong>Prof. Manoj Mathur</strong>, School of Planning &amp; Architecture;&nbsp;<strong>Prof. Charanjeet Singh Shah</strong>, Creative Group;&nbsp;<strong>Ar. Sushant Verma</strong>, Founding Partner &amp; Design Head-rat[LAB].</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">For the 2024 edition,&nbsp;<strong>Khan Mohammed Mustapha Khalid</strong>, the well-known architect from Bangladesh;&nbsp;<strong>Ar. Samiran Banik</strong>&nbsp;the Founder of Kolkata-based Indecorus Consultants;&nbsp;<strong>Arup Kumar Das</strong>, the famous architect and designer, and the proprietor of Design &amp; Development -- an Architectural Consultancy firm in Guwahati; and&nbsp;<strong>Prof. Soumyendu Shankar Ray</strong>, the founding director of the School of Architecture and Planning, Kalinga Institute of Industrial Technology, Bhubaneswar, Odisha; and Prof. Charanjit Singh Shah, Director,&nbsp;<strong>Creative Group</strong>, Delhi; among others, have already confirmed their participation.&nbsp;</p><p class=\"ql-align-justify\">&nbsp;</p><p class=\"ql-align-justify\"><strong>Smartex 2024</strong>&nbsp;is likely to be an equally, if not more, exciting and successful event, and open up a whole new world of endless possibilities for all stakeholders. So, save your dates! Don’t miss this event!</p><p><br></p>','1716963974876imageReadMore1.jpg','2024-05-29 11:56:14',1,'WHAT’S SMARTEX?','WHAT’S SMARTEX?','WHAT’S SMARTEX?','2023-02-01','WHAT’S SMARTEX?',NULL,'Team','news',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speakers`
--

DROP TABLE IF EXISTS `speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speakers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speaker_name` varchar(255) DEFAULT NULL,
  `speaker_order` int DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `speaker_img` longtext,
  `description` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speakers`
--

LOCK TABLES `speakers` WRITE;
/*!40000 ALTER TABLE `speakers` DISABLE KEYS */;
INSERT INTO `speakers` VALUES (60,'Ar. P R Mehta',1,'Partner, DAG Architects','1716964162413ar-pr.mehta.webp','<p><span style=\"color: rgb(33, 37, 41);\">Ar. Premendra Raj Mehta is a partner of DAG Architects since its inception in 1979 with many years of professional experiences both within and outside India. He completed his B.Arch in 1976 and PG Diploma in Architecture/Urban Design in 1979 from SPA, New Delhi. Ar. PR Mehta has represented India internationally in many forums. He has been a Jury member in many high profile projects including airport terminals in India.</span></p>','2024-05-29 06:29:22',1),(61,'Prof. Manoj Mathur',2,'SPA, New Delhi','1716964190940prof-manoj-mathur.webp','<p><span style=\"color: rgb(33, 37, 41);\">Prof. Manoj Mathur is a veteran practicing architect-designer who presently is teaching at the well-known Department of Architecture at the School of Planning and Architecture, New Delhi. He is one of the highly passionate and committed-to-his-job professionals. He has a diverse portfolio of projects in public-oriented architecture and this includes commercial, education, health-care, group housing, infrastructure and entertainment. He designs structures which are purposeful and serves the needs of the users in the best possible way.</span></p>','2024-05-29 06:29:51',1),(62,'Prof. Charanjit S Shah',3,'Founding Principal, Creative Group','1716964217188charanjit-singh-shah.webp','<p><span style=\"color: rgb(33, 37, 41);\">Prof. Charanjit S Shah established Creative Group in 1973 with a sincere approach towards Green Architecture in India. He has spearheaded some landmark sustainable projects including the most recently inaugurated Swami Vivekananda Airport at Raipur and Kamaraj Airport Terminal at Chennai. His passion for architectural education made him an honorary recipient of the Professor Design Chair from the Jamia Millia Islamia University in New Delhi.</span></p>','2024-05-29 06:30:17',1),(63,'Prof. Beni Lew',5,'Ariel University, Israel','1716964256683beni-law.webp','<p><span style=\"color: rgb(33, 37, 41);\">Dr. Beni Lew is a Professor at Ariel University and CEO of Tech-Bulls research and engineering. Until 2021, he was a scientist and the Head of the Department in the Volcani Center in Israel. Dr. Lew is well known abroad for his water and wastewater treatment research, has been granted several international prizes for his research and teaching skills and; has been invited to lecture several times in different countries (Brazil, Greece, USA and India).</span></p>','2024-05-29 06:30:57',1),(64,'Sunita Kohli',6,'President, K2INDIA','1716964298172Sunita-Kohli.webp','<p>She is a research-based interior designer, a leader in historical interior architecture and architectural restoration, and a manufacturer of fine contemporary and classical furniture. She is a member of the Advisory Committee of Rashtrapati Bhavan; a member of the General Council of the School of Planning and Architecture, Delhi and is on the Academic Advisory Board of the Sushant School of Art and Architecture, Haryana. Being the first interior designer to be conferred the Padma Shri, she is the first Indian to be invited to give an illustrated lecture at the prestigious National Building Museum in Washington DC in 2003.</p>','2024-05-29 06:31:38',1);
/*!40000 ALTER TABLE `speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upcoming_events`
--

DROP TABLE IF EXISTS `upcoming_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upcoming_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `alt` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upcoming_events`
--

LOCK TABLES `upcoming_events` WRITE;
/*!40000 ALTER TABLE `upcoming_events` DISABLE KEYS */;
INSERT INTO `upcoming_events` VALUES (24,'Upcoming Events','1716964693835upcoming-2-apr.webp','2024-05-29 06:38:14','Upcoming Events',1),(25,'sddf','1716964714987upcoming-1-apr.webp','2024-05-29 06:38:35','ffdf',1);
/*!40000 ALTER TABLE `upcoming_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sneha','sneha@gmail.com','$2a$10$PROBIIfV7tysQVCOBgHD4.WVTKNQw3VzxHwkkqHNuCuk07ObWEmhi',NULL),(2,'user','user@gmail.com','$2a$10$NiDEMuTcx.Hn2kbMlpUJMuQar1n3cggCDRElAr9QWPnKuNcpP2C0y',NULL),(3,'Nitin Pal','','$2a$10$FvL4OM8kblSdAuxgsfYRae54akbdwPswH./bTTUofssSrQHntvVYq',NULL),(4,'Nitin K Pal','nitin@ecorp.co.in','$2a$10$aTvu5VsNRy0kalr6KXrAQuLB8qhJkYJ1KD1.Wbg.LvGWRLnLEgWG.',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winners`
--

DROP TABLE IF EXISTS `winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `alt_tag` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winners`
--

LOCK TABLES `winners` WRITE;
/*!40000 ALTER TABLE `winners` DISABLE KEYS */;
INSERT INTO `winners` VALUES (28,'Winners posta','171696403903606.webp','2024-05-09','first','2024-05-29 06:27:19',1),(29,'Winners','171696405617005.webp','2024-05-10','Winners','2024-05-29 06:27:36',1),(30,'Winners','171696406828404.webp','2024-05-13','Winners','2024-05-29 06:27:48',1);
/*!40000 ALTER TABLE `winners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 11:53:58
