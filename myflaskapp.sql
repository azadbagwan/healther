-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: myflaskapp
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `appointment_id` int(255) NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `comments` text,
  `appointments_doctors_id` int(255) DEFAULT NULL,
  `appointments_patients_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'Anup Gaikwad','Azad Bagwan','2018-12-23 19:30:00','2018-12-23 19:30:00','not much',NULL,5),(2,'Anup Gaikwad','Azad Bagwan','2018-12-23 19:30:00','2018-12-23 19:30:00','not much',NULL,5),(3,'Anup Gaikwad','Azad Bagwan','2018-12-23 19:30:00','2018-12-23 19:30:00','none',NULL,5),(4,'ADAD','sSD','2018-12-23 19:30:00','2018-12-23 19:30:00','NONE',NULL,5),(5,'jbj','fsfcs','2018-12-23 19:30:00','2018-12-23 19:30:00','none',NULL,5),(6,'Anup Gaikwad','Azad bagwan','2018-12-27 12:30:00','2018-12-27 13:00:00','Just blood pressure checkup ',NULL,5),(7,'Anup gaikwad','Mangala bagwan','2018-12-27 13:00:00','2018-12-27 13:10:00','Suffering from cold',NULL,5),(8,'Anup gaikwad','Pawan chauhan','2018-12-30 13:00:00','2018-12-30 13:15:00','Not much ',NULL,5),(9,'Anup gaikwad','Mangala ilahi bagwan','2018-12-30 19:00:00','2018-12-03 19:05:00','Suffering from cold.',NULL,5),(10,'Anup Gaikwad','pawan','2019-01-23 19:30:00','2019-01-23 20:00:00','none',NULL,11),(25,'Anup Gaikwad','pawan chauhan','2019-01-23 17:40:00','2019-01-23 18:00:00','none test',NULL,11),(31,'anup gaikwad','pawan','2019-01-23 19:40:00','2019-01-23 19:40:00','comments',NULL,11),(37,'anup gaikwad','pawan',NULL,NULL,'comments',NULL,11),(38,'Anup Gaikwad','pawan chauhan','2019-01-27 19:40:00','2019-01-27 19:45:00','none',NULL,11),(39,'anup gaikwad','pawan','2019-01-23 19:40:00','2019-01-23 19:40:00','comments',NULL,11),(40,'anup gaikwad','pawan','2019-01-23 19:40:00','2019-01-23 19:40:00','comments',NULL,11),(41,'anup gaikwad','pawan','2019-01-23 19:40:00','2019-01-23 19:40:00','comments',NULL,11),(42,'Anup Gaikwad','pawan chauhan','2019-01-23 19:40:00','2019-01-23 19:40:00','testing',NULL,11),(43,'Anup Gaikwad','pawan chauhan','2019-01-23 19:40:00','2019-01-23 19:45:00','testing',NULL,11),(44,'Anup Gaikwad','pawan chauhan','2019-01-23 19:40:00','2019-01-23 19:45:00','testing',NULL,11),(45,'Anup Gaikwad','pawan chauhan','2019-01-29 19:50:00','2019-01-29 20:05:00','testing',NULL,11),(46,'Anup Gaikwad','pawan chauhan','2019-01-23 19:40:00','2019-01-24 19:45:00','none',NULL,11),(47,'Anup Gaikwad','pawan chauhan','2019-01-24 19:50:00','2019-01-24 19:55:00','none',NULL,11),(48,'Anup Gaikwad','mangala bagwan','2019-01-26 19:40:00','2019-01-26 19:45:00','none',NULL,7),(49,'Anup Gaikwad','Azad Bagwan','2019-01-27 19:40:00','2019-01-27 19:45:00','none',NULL,11),(50,'Anup Gaikwad','Azad Bagwan','2019-01-27 19:40:00','2019-01-27 19:45:00','none',NULL,11),(51,'Anup Gaikwad','Azad Bagwan','2019-01-28 19:40:00','2019-01-28 19:45:00','none',NULL,11),(52,'Anup Gaikwad','Azad Bagwan','2019-01-30 19:40:00','2019-01-30 19:45:00','none',NULL,11),(53,'Anup Gaikwad','Azad Bagwan','2019-01-31 19:40:00','2019-01-31 19:45:00','none',NULL,11),(54,'Anup Gaikwad','Azad Bagwan','2019-01-25 19:40:00','2019-01-25 19:45:00','none',NULL,11),(55,'Anup Gaikwad','Azad Bagwan','2019-01-25 19:40:00','2019-01-25 19:45:00','none',NULL,11),(56,'Anup Gaikwad','Azad Bagwan','2019-01-25 19:40:00','2019-01-25 19:45:00','none',NULL,11),(57,'Anup Gaikwad','Azad Bagwan','2019-01-22 19:40:00','2019-01-22 19:45:00','none',NULL,11),(58,'Anup Gaikwad','Azad Bagwan','2019-01-20 19:40:00','2019-01-20 19:45:00','none',NULL,11),(59,'Anup Gaikwad','Azad Bagwan','2019-01-20 19:40:00','2019-01-20 19:45:00','none',NULL,11),(60,'Anup Gaikwad','Azad Bagwan','2019-01-20 19:40:00','2019-01-20 19:45:00','none',NULL,11),(61,'Anup gaikwad','azad bagwan','2019-01-15 19:40:00','2019-01-15 19:45:00','None',NULL,11),(62,'Anup gaikwad','azad bagwan','2019-01-15 19:40:00','2019-01-15 19:45:00','None',NULL,11),(63,'Anup gaikwad','azad bagwan','2019-01-15 19:40:00','2019-01-15 19:45:00','None',NULL,11),(64,'Anup Gaikwad ','azad bagwan','2019-01-17 12:10:00','2019-01-17 12:15:00','None',NULL,11),(65,'Anup Gaikwad','Azad Bagwan','2019-01-10 19:40:00','2019-01-10 19:45:00','none',NULL,11),(66,'Anup Gaikwad','Azad Bagwan','2019-01-16 19:30:00','2019-01-16 19:45:00','none',NULL,11),(67,'Anup Gaikwad','Azad Bagwan','2019-01-16 19:30:00','2019-01-16 19:45:00','none',NULL,11),(68,'Anup Gaikwad','Azad Bagwan','2019-01-16 19:30:00','2019-01-16 19:45:00','none',NULL,11),(69,'Anup Gaikwad','Azad Bagwan','2019-01-19 19:30:00','2019-01-19 19:45:00','none',NULL,11),(70,'Anup Gaikwad','Azad Bagwan','2019-01-19 19:30:00','2019-01-19 19:45:00','none',NULL,11),(71,'Anup Gaikwad','Azad Bagwan','2019-01-19 19:30:00','2019-01-19 19:45:00','none',NULL,11),(72,'Anup Gaikwad','Azad Bagwan','2019-01-21 19:30:00','2019-01-21 19:45:00','none',NULL,11),(73,'Anup Gaikwad','Azad Bagwan','2019-01-21 19:30:00','2019-01-21 19:45:00','none',NULL,11),(74,'Anup Gaikwad','Azad Bagwan','2019-01-21 19:30:00','2019-01-21 19:45:00','none',NULL,11),(75,'Anup Gaikwad','Azad Bagwan','2019-01-18 19:30:00','2019-01-18 19:45:00','none',NULL,11),(76,'Anup Gaikwad','pawan chauhan','2019-01-11 19:40:00','2019-01-11 19:45:00','test',NULL,11),(77,'Anup Gaikwad','pawan chauhan','2019-01-11 19:40:00','2019-01-11 19:45:00','test',NULL,11),(78,'Anup Gaikwad','pawan chauhan','2019-01-11 19:40:00','2019-01-11 19:45:00','test',NULL,11),(79,'Anup Gaikwad','pawan chauhan','2019-01-11 19:40:00','2019-01-11 19:45:00','test',NULL,11),(80,'Anup Gaikwad','pawan chauhan','2019-01-12 19:40:00','2019-01-12 19:45:00','test',NULL,11),(81,'Anup Gaikwad','pawan chauhan','2019-01-12 19:40:00','2019-01-12 19:45:00','test',NULL,11),(82,'Anup Gaikwad','pawan chauhan','2019-01-12 19:40:00','2019-01-12 19:45:00','test',NULL,11),(83,'Anup Gaikwad','pawan chauhan','2019-01-12 19:40:00','2019-01-12 19:45:00','test',NULL,11),(84,'Anup Gaikwad','pawan chauhan','2019-01-03 19:40:00','2019-01-03 19:45:00','testing',NULL,11),(85,'Anup Gaikwad','pawan chauhan','2019-01-03 19:40:00','2019-01-03 19:45:00','testing',NULL,11),(86,'Anup Gaikwad','pawan chauhan','2019-01-02 19:40:00','2019-01-02 19:45:00','testing',NULL,11),(87,'Anup Gaikwad','pawan chauhan','2019-01-04 19:40:00','2019-01-04 19:45:00','testing',NULL,11),(88,'Anup Gaikwad','pawan chauhan','2019-01-04 19:40:00','2019-01-04 19:45:00','testing',NULL,11),(89,'Anup Gaikwad','pawan chauhan','2019-01-01 19:40:00','2019-01-01 19:45:00','test',NULL,11),(90,'Anup Gaikwad','drop from table table','2019-01-05 19:40:00','2019-01-05 19:45:00','drop from table table',NULL,11),(91,'Anup Gaikwad','rohit','2019-01-07 19:40:00','2019-01-07 19:45:00','none',NULL,11),(92,'Anup Gaikwad','Azad Bagwan','2019-01-08 19:40:00','2019-01-08 19:45:00','none',NULL,11),(93,'Anup Gaikwad',' ','2019-01-08 19:40:00','2019-01-08 19:45:00','none',NULL,11),(94,'Anup Gaikwad','  ','2019-01-08 19:40:00','2019-01-08 19:45:00','none',NULL,11),(95,'Anup Gaikwad','  ','2019-01-09 19:40:00','2019-01-09 19:45:00','none',NULL,11),(96,'Anup Gaikwad','mangala bagwan','2019-01-13 19:40:00','2019-01-13 19:45:00','none',NULL,11),(97,' ','pawan chauhan','2019-01-06 19:40:00','2019-01-06 19:45:00','none',NULL,11),(98,' ','pawan chauhan','2019-01-13 19:40:00','2019-01-13 19:45:00','none',NULL,11),(99,'Anup Gaikwad','pawan chauhan','2019-02-08 19:40:00','2019-02-08 19:45:00','none',NULL,11),(100,'Anup Gaikwad','l','2019-02-08 19:40:00','2019-02-08 19:45:00','none',NULL,11),(101,'Anup Gaikwad','azad','2019-02-09 19:40:00','2019-02-09 19:45:00','none',NULL,11),(102,'Anup Gaikwad','azad','2019-02-09 19:40:00','2019-02-09 19:45:00','none',NULL,11),(103,'Anup Gaikwad','vivek','2019-02-04 19:40:00','2019-02-04 19:45:00','none',NULL,11),(104,'Anup Gaikwad','vivek','2019-02-04 19:40:00','2019-02-04 19:45:00','none',NULL,11),(105,'Anup Gaikwad','pawan chauhan','2019-03-11 19:40:00','2019-03-11 20:45:00','root canal',NULL,11),(106,'Anup Gaikwad ','rohit','2019-07-11 17:30:00','2019-07-11 18:00:00','cold',NULL,11),(107,'Anup Gaikwad ','rohit','2019-07-11 17:30:00','2019-07-11 18:00:00','cold amnd ',NULL,11),(108,'Anup Gaikwad ','rohit','2019-07-11 17:30:00','2019-07-11 18:00:00','cold amnd cough',NULL,11),(109,'Anup Gaikwad ','rohit','2019-07-11 17:30:00','2019-07-11 18:00:00','cold amnd cough',NULL,11),(110,'Anup Gaikwad ','rohit','2019-03-11 17:30:00','2019-03-11 18:00:00','cold amnd cough',NULL,11);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `body` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'first article','bob123','edited is Lorem Ipsum?  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it?  It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).  Where does it come from?  Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Where can I get some?  There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.','2018-09-16 15:55:22'),(2,'test1','bob123','its a test and i try to see if the thing works well right now. The application is for practise of a doctors crm','2018-09-16 17:19:05'),(3,'test2','bob123','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi beatae cupiditate fugit sunt ut. Ea enim facilis illo inventore itaque magnam, minima non quaerat quasi quod sapiente sed similique suscipit!','2018-09-16 17:27:09'),(4,'test3','bob123','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi beatae cupiditate fugit sunt ut. Ea enim facilis illo inventore itaque magnam, minima non quaerat quasi quod sapiente sed similique suscipit!','2018-09-16 17:27:58'),(5,'test4','bob123','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi beatae cupiditate fugit sunt ut. Ea enim facilis illo inventore itaque magnam, minima non quaerat quasi quod sapiente sed similique suscipit!','2018-09-16 17:28:50'),(6,'is a rticle test','bob123','','2018-09-16 18:31:55'),(7,'test ckeditor no min limit','bob123','','2018-09-16 18:32:22'),(8,'no ckeditor','bob123','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi beatae cupiditate fugit sunt ut. Ea enim facilis illo inventore itaque magnam, minima non quaerat quasi quod sapiente sed similique suscipit!','2018-09-16 18:38:47'),(9,'ck test with class=ckeditor','bob123','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi beatae cupiditate fugit sunt ut. Ea enim facilis illo inventore itaque magnam, minima non quaerat quasi quod sapiente sed similique suscipit!</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi beatae cupiditate fugit sunt ut. Ea enim facilis illo inventore itaque magnam, minima non quaerat quasi quod sapiente sed similique suscipit!</p>','2018-09-16 19:38:09'),(10,'patient number1','arshad','<p>Has a sicknes vg j ju j ju j j j j j j kj j j j j j j j j j j j j j j j j jh&nbsp;</p>','2018-09-27 03:31:12'),(11,'This is first patient of doctor anup.','anup123','This is a test for checking if we can turn this same app into a patient management thing for doctors.\r\nThe idea is to replace the articles by patients and then link the patients and have cases and visits of patients be tracked.\r\n\r\n\r\nthere is an opportunity to do this, the only thing we need to do is grasp the concepts of python and flask and make this possible.\r\nEventually i will make a rest API to connect to the data base.\r\nRegards, \r\nAzad bagwan.','2018-09-26 18:23:21'),(12,'insert into users','anup123','drop from table table drop from table table drop from table table drop from table table drop from table table','2019-01-27 04:44:31');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines` (
  `medicine_id` int(255) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(255) DEFAULT NULL,
  `manufacturers_name` varchar(255) DEFAULT NULL,
  `treatment_of` varchar(255) DEFAULT NULL,
  `composition` varchar(255) DEFAULT NULL,
  `medicine_entry_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'Azee 500 MG tablet','Cipla Ltd.','bacterial infections','Azithromycine','2018-12-07 14:12:22'),(2,'Ciplactin','Cipla Ltd.','Allergic disorders, Loss of appetite','Alcohol 0.263ml/5ml, Cyproheptadine 2mg, ','2018-12-08 11:46:19'),(3,'NUTROLIN-B DRY SYRUP','Cipla Ltd.','Infantile diarrhoea , Adjunct to antibiotic therapy, Acne, Aphthous stomatitis','Lactobacil sporang 40*10lakhs, Nicotinam 20mg/5ml dry syrup, Vit B-1 2mg, Vit B-2 2.5mg, Vit B-6 1.5mg, ','2018-12-08 11:48:20'),(4,'NUTROLIN-B CAPS','Cipla Ltd.','Adjunct to antibiotic therapy','Nicotinam 25mg, Vit B-1 3mg, Vit B-2 3mg, Vit B-6 1mg, ','2018-12-08 11:49:32'),(5,'NUTROLIN-B PEDTABS','Cipla Ltd.','Adjunct to antibiotic therapy','Lactobac sporang 40*10lakhs, Nicotinam 20mg dstb, Vit B-1 2mg, Vit B-2 2.5mg, Vit B-6 1.5mg, ','2018-12-08 12:06:43'),(6,'ALERGIN','Cipla Ltd.','Bronchial spasm','Ephedrine hcl 20mg, Phenobarb 15mg, Theophyline 100mg, ','2018-12-08 12:07:43'),(7,'ASTHALIN','Cipla Ltd.','Prophylax of bronchl asthma, Chronic bronchitis, Bronchospasm in bronch asthma','Salbutamol 2mg, ','2018-12-08 12:09:37'),(8,'ASTHALIN ROTOCAPS 200mcg','Cipla Ltd.','Bronchospasm in bronch asthma','Salbutamol 200mcg, ','2018-12-08 12:13:45'),(9,'ASTHALIN ROTOCAPS 200mcg +rot','Cipla Ltd.','Bronchospasm in bronch asthma','Salbutamol 200mcg, ','2018-12-08 12:22:57'),(10,'ASTHALIN SA','Cipla Ltd.','Bronchospasm in bronch asthma','Salbutamol 8mg, ','2018-12-08 12:27:00'),(11,'Nizoral 2%','update later','fungal infection, Dandruff','update later','2018-12-10 17:48:47'),(12,'A cap 10000 i.u','later','skin deseases','retinol','2018-12-16 16:47:08'),(13,'   ','  ','   ','   ','2019-01-27 04:51:17'),(14,'   ','   ','   ','   ','2019-01-27 04:51:35'),(15,'     ','     ','     ','    ','2019-01-27 04:52:07'),(16,'test latest','test man','test treat','test composition','2019-02-01 16:30:16');
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_visits`
--

DROP TABLE IF EXISTS `patient_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_visits` (
  `visit_id` int(255) NOT NULL AUTO_INCREMENT,
  `visit_issue` varchar(255) DEFAULT NULL,
  `visit_diagnosis` varchar(255) DEFAULT NULL,
  `comments` text,
  `visit_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visit_patient_id` int(255) DEFAULT NULL,
  `systolic_bloodpressure` varchar(255) DEFAULT NULL,
  `diastolic_bloodpressure` varchar(255) DEFAULT NULL,
  `total_for_visit` varchar(255) DEFAULT NULL,
  `paid_for_visit` varchar(255) DEFAULT NULL,
  `due_for_visit` varchar(255) DEFAULT NULL,
  `temperature` varchar(255) DEFAULT NULL,
  `sugar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `fk_visit_patientsid` (`visit_patient_id`),
  CONSTRAINT `fk_visit_patientsid` FOREIGN KEY (`visit_patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_visits`
--

LOCK TABLES `patient_visits` WRITE;
/*!40000 ALTER TABLE `patient_visits` DISABLE KEYS */;
INSERT INTO `patient_visits` VALUES (1,'just check up','none','empty','2018-10-13 12:20:32',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'normal checkup','patient is healthy atm','<p>asked to come back on 15th&nbsp;</p>','2018-10-13 12:26:26',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'normal checkup','patient is healthy atm','<p>asked to come back on 15th&nbsp;</p>','2018-10-13 12:27:07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'test','test','<p>test</p>','2018-10-27 13:48:30',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'test2','test2','<h2>test2</h2>','2018-10-27 13:49:23',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'test3','test3','test3','2018-10-27 13:59:06',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'this is for a test','high bp and digestion issues.','patient is prescribed gastro medicine course for 10 days, and is called back for visit on 8th of November.','2018-10-28 13:16:58',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'test','test','should be only for arshad bagwan','2018-11-11 11:40:00',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'test of pid','success','success edited111111111','2018-11-11 12:02:53',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'test of pid','pid','tada, very healthy','2018-11-11 12:03:35',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'mild cough','no need for medicines yet','told patient to take rest,\r\nand visit again in 2 days if patient didn\'t feel better\r\n','2018-11-11 20:05:07',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'cold','temperatur is high','called again for checkup later.','2018-11-25 16:48:07',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Suffering from cold','cold','not much','2018-12-07 10:09:18',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'hbybyvb','byvy','vtgvy7fvt','2018-12-09 09:51:54',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'Cold','is fine ','just need rest','2018-12-15 17:28:30',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'Fever','temperatur is high','complete the dose of medicine and take rest.\r\nvisit again in 3 days.','2018-12-22 18:05:00',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Fever','mild fever','just take rest','2018-12-22 20:41:52',5,'120','80',NULL,NULL,NULL,NULL,NULL),(18,'Cold','virul cold and cough','just need to take rest for 3 days and visit again','2018-12-22 20:51:14',5,'125','78',NULL,NULL,NULL,NULL,NULL),(19,'cough','nothing','none','2018-12-22 20:55:25',5,'123','79',NULL,NULL,NULL,NULL,NULL),(20,'periodical bp check','normal','none','2018-12-22 21:00:10',5,'120','80',NULL,NULL,NULL,NULL,NULL),(21,'periodical bp check','normal','none','2018-12-22 21:05:35',5,'120','80',NULL,NULL,NULL,NULL,NULL),(22,'periodical bp check','normal','none','2018-12-22 21:07:08',5,'120','80',NULL,NULL,NULL,NULL,NULL),(23,'periodical bp check','normal','none','2018-12-22 21:07:55',6,'120','80',NULL,NULL,NULL,NULL,NULL),(24,'bp check','ok','none','2019-01-06 21:26:45',11,'120','80',NULL,NULL,NULL,NULL,NULL),(25,'test','ok','ok','2019-01-06 21:27:39',11,'125','79',NULL,NULL,NULL,NULL,NULL),(26,'test2 ','ok','ok','2019-01-06 21:34:39',11,'138','90',NULL,NULL,NULL,NULL,NULL),(27,'test3','ok','OK','2019-01-07 00:02:10',11,'110','90',NULL,NULL,NULL,NULL,NULL),(28,'test int','ok','ok','2019-01-07 01:30:45',11,'90','73',NULL,NULL,NULL,NULL,NULL),(29,'test int check','ok','ok','2019-01-07 01:42:35',11,'130','89','1000','500','500',NULL,NULL),(30,'test of sum','ok','ok','2019-01-07 01:57:36',11,'170','94','2000','500','1500',NULL,NULL),(31,'test','ok','ok','2019-01-07 12:20:12',11,'200','30','1500','1500','0',NULL,NULL),(32,'cold','general cold','just take rest for 3 days','2019-01-09 04:25:31',11,'100','90','500','500','0',NULL,NULL),(33,'test','none','none','2019-01-10 16:07:51',11,'180','100','500','500','0',NULL,NULL),(34,'test temp','healthy','none','2019-01-17 09:04:33',11,'120','82','1000','500','500','120',NULL),(35,'test sugar','healthy','none','2019-01-17 09:11:58',11,'100','82','100','100','0','79','123'),(36,'test temp graph','healthy','none','2019-01-17 13:02:03',11,'128','79','1000','1000','0','100','109'),(37,'test sugar','healthy','none','2019-01-18 09:13:21',11,'180','77','1000','1000','0','120','72'),(38,'cold uday test','fever','take rest','2019-01-20 15:06:10',11,'155','62','300','300','0','60','60'),(39,'json test','none','none','2019-01-22 04:49:16',5,'100','100','100','100','0','100','100'),(40,'json test','none','none','2019-01-22 04:51:01',5,'100','100','100','100','0','100','100'),(41,'json test','none','none','2019-01-22 04:51:21',5,'100','100','100','100','0','100','100'),(42,'json test','none','none','2019-01-22 04:56:50',5,'100','100','100','100','0','100','100'),(43,'json test','none','none','2019-01-22 04:58:10',5,'100','100','100','100','0','100','100'),(44,'works','none','none','2019-01-22 05:01:15',5,'100','100','100','100','0','100','100'),(45,'works','none','none','2019-01-22 05:03:19',5,'100','100','100','100','0','100','100'),(46,'works','none','none','2019-01-22 05:11:41',5,'100','100','100','100','0','100','100'),(47,'cold','normal cold','take rest','2019-03-01 17:10:32',5,'300','70','300','200','100','80','200'),(48,'food lodgement','decay','called on monday','2019-03-02 18:03:53',11,'13`','9','1000','500','500','30','70'),(49,'costipation','anup','general chamnge of havbits','2019-07-11 10:09:32',11,'120','77','100','50','50','90','130'),(50,'costipation','anup','general chamnge of havbits','2019-07-11 10:09:32',11,'120','77','100','50','50','90','130');
/*!40000 ALTER TABLE `patient_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patient_id` int(255) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_age` int(11) DEFAULT NULL,
  `patient_birthdate` date DEFAULT NULL,
  `patient_email` varchar(100) DEFAULT NULL,
  `patient_phonenumber` varchar(100) DEFAULT NULL,
  `patients_known_history` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doctors_username` varchar(30) DEFAULT NULL,
  `doctors_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `fk_patients` (`doctors_user_id`),
  CONSTRAINT `fk_patients` FOREIGN KEY (`doctors_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'azad bagwa3',23,'1990-08-14','azadbagwan2@gmail.com','988377389822w','<p>not much known at the moment</p>','2018-10-05 05:29:24',NULL,1),(2,'Arshad Bagwan',30,'1988-04-19','arshadbagwan@example.com','92883472847','<p>none atm</p>','2018-10-05 07:54:07',NULL,1),(3,'lucky',13,'2013-10-17','luckyisawesome','9232322424','<p>everyone loves lucky</p>','2018-10-05 07:58:21',NULL,1),(4,'anup gaikwad',31,'1987-08-19','gaikwadhospital@example','2424243434','<p>not much for now.</p>','2018-10-05 08:04:28',NULL,1),(5,'Mangala Ilahi Bagwan',62,'1955-12-08','mangalabagwan@example.com','9234294723','healthy ','2018-10-05 08:06:25',NULL,10),(6,'ilahi babalal bagwan',62,'1955-04-16','ilahibagwan@example.com','28832472424','healthy','2018-10-05 08:11:53',NULL,10),(8,'azad bagwan',28,'1990-08-14','azadbagwan2@gmail.com','92347977','not much','2018-10-05 08:25:01',NULL,6),(9,'azad bagwan',18,'1990-08-14','azadbagwan2@gmail.com','88383828','<p>Not much is known atm</p>','2018-10-13 11:28:19',NULL,10),(10,'Arshad Bagwan',23,'1987-08-19','azadbagwan2@gmail.com','988377389822w','<p>not much</p>','2018-10-13 11:45:08',NULL,10),(11,'pawan chauhan',22,'1990-08-14','scfwsufcsfc','979797776','healthy a hole','2018-11-25 16:46:27',NULL,10),(12,'drop from table table',100,'1990-08-14','drop from table table','drop from table table','drop from table table','2019-01-27 04:46:41',NULL,10),(13,'select * from users',20,'1955-04-16','111','    ','1','2019-01-27 04:49:45',NULL,10),(14,'test j',12,'2006-02-20','example@gmail.com','575757575757','none','2019-02-02 09:53:55',NULL,10),(15,'test j',12,'2006-02-20','example@gmail.com','575757575757','none','2019-02-02 09:54:26',NULL,10),(16,'test j btn',12,'2006-02-20','example@gmail.com','575757575757','none','2019-02-02 10:08:53',NULL,10),(17,'anna',20,'1998-02-10','example@gmail.com','575757575757','none','2019-02-02 10:12:18',NULL,10);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `speciality` varchar(15) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone_num` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Azad Bagwan','azadbagwan2@gmail.com',NULL,'azbusy','$5$rounds=535000$lFyo4L/HQhtj231G$ISFXyi41H71EJQ6Fcb5KjgHVlPhGr2FVP0jEfMJ94/.','2018-09-11 16:21:03',NULL),(2,'Azad Bagwan2','azadbagwan2@gmail.com',NULL,'azbusy2','$5$rounds=535000$M5eqr3bn2zO/OOkH$6FENDR1cRkEVJDDsNnbdO.XKNdyAB/56xToodeU2lDB','2018-09-11 16:21:51',NULL),(3,'Azad Bagwan2','azadbagwan2@gmail.com',NULL,'azbusy2','$5$rounds=535000$0CwQOhVqs/i8YQm8$eA5jd2VSm.BHjs3zr43NoLyTdUNeBXXp0gdUXGzxhz1','2018-09-11 16:25:32',NULL),(4,'AZ','azadbagwan2@gmail.com',NULL,'AXAX','$5$rounds=535000$zmHWj63Tce7REynA$QnB5axOTVG4lVw/s9hm78SiWrDZU8god5X8SXOmAG5D','2018-09-11 16:28:40',NULL),(5,'AZ3','azadbagwan2@gmail.com',NULL,'AXAXbc','$5$rounds=535000$LtbrNmM3ONKyc9KM$bc7gJvU.GV7icCqUBG0NNCiYE6vRq8iAhXYp/9QkeP8','2018-09-11 16:31:49',NULL),(6,'bob123','bob234@gmail.com',NULL,'bob123','$5$rounds=535000$5OtcD0row9JRSyMI$UKWENwz3P0uWr/dfg3t3qCp40Xo3E5dHwQTkBooeRID','2018-09-14 11:07:44',NULL),(7,'Lucky','Lucky@is best.com',NULL,'Luckyrocks','$5$rounds=535000$Ge1Nx8LANAbvjpgB$TN8vJDb9lo8utM4IpNAxFaqciXSzY5kzJLZeOquxKU3','2018-09-24 23:59:49',NULL),(8,'arshad','arshad@gmail.com',NULL,'arshad','$5$rounds=535000$4wJOdjHBXyivLrsM$0ByxgkIubLGiO/4FNXk1r/CgvdaqYwDninqklZ0tKcD','2018-09-27 03:28:56',NULL),(9,'tom1234','tomisatestthing',NULL,'tom1234','$5$rounds=535000$/nLO8Az308tcQbzh$xObN6UecP4ApgUhT4hEQHSbDhsM26NwvCecFyLllSs.','2018-09-28 03:12:04',NULL),(10,'Anup','anup@example.com','homeopathy','anup123','$5$rounds=535000$JK2bAcExOiu98MRh$LlNV54TXWYLSXRNCukKzuhS3i/OYLYc7bTwg3CMYU7B','2018-09-26 18:17:19',NULL),(11,'aditya bhave','adi.bhave@example.com','nursing','adi.bhave','$5$rounds=535000$HzLcQMuvxVmUXGoM$1IyYK9mMRkn.29SLopOgTF18WE39v9Xo8GSBLDL/CeC','2018-11-11 10:59:50',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_prescription`
--

DROP TABLE IF EXISTS `visit_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_prescription` (
  `priscription_id` int(255) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) DEFAULT NULL,
  `visit_issues` varchar(255) DEFAULT NULL,
  `comments` text,
  `visit_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prescription_visit_id` int(255) DEFAULT NULL,
  `visitid` int(255) DEFAULT NULL,
  PRIMARY KEY (`priscription_id`),
  KEY `fk_visit_prescription_visit_id` (`visitid`),
  CONSTRAINT `fk_visit_prescription_visit_id` FOREIGN KEY (`visitid`) REFERENCES `patient_visits` (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_prescription`
--

LOCK TABLES `visit_prescription` WRITE;
/*!40000 ALTER TABLE `visit_prescription` DISABLE KEYS */;
INSERT INTO `visit_prescription` VALUES (1,NULL,NULL,NULL,'2018-12-05 11:57:49',NULL,9),(2,NULL,NULL,NULL,'2018-12-05 12:02:42',NULL,10),(3,NULL,NULL,NULL,'2018-12-05 13:20:58',NULL,9),(4,NULL,NULL,NULL,'2018-12-13 18:58:03',NULL,9);
/*!40000 ALTER TABLE `visit_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits_prescription`
--

DROP TABLE IF EXISTS `visits_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits_prescription` (
  `priscription_id` int(255) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(255) DEFAULT NULL,
  `dose` varchar(255) DEFAULT NULL,
  `for_days` varchar(255) DEFAULT NULL,
  `comments` text,
  `visit_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visitid` int(255) DEFAULT NULL,
  PRIMARY KEY (`priscription_id`),
  KEY `fk_visits_prescription_visit_id` (`visitid`),
  CONSTRAINT `fk_visits_prescription_visit_id` FOREIGN KEY (`visitid`) REFERENCES `patient_visits` (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits_prescription`
--

LOCK TABLES `visits_prescription` WRITE;
/*!40000 ALTER TABLE `visits_prescription` DISABLE KEYS */;
INSERT INTO `visits_prescription` VALUES (1,'NUTROLIN-B PEDTABS','3 times a day',NULL,'<p>drink lot of water and take rest.</p><p>visit in 4 days if still didn\'t feel better</p>','2018-12-13 19:25:15',9),(2,'NUTROLIN-B PEDTABS','3 times a day','','<p>drink lot of water and take rest.</p><p>visit in 4 days if still didn\'t feel better</p>','2018-12-13 19:29:56',9),(3,'ASTHALIN ROTOCAPS 200mcg','3 times a day','3','<p>drink lot of water and take rest.</p><p>visit in 4 days if still didn\'t feel better</p>','2018-12-13 19:30:31',9),(4,'ASTHALIN ROTOCAPS 200mcg','3 times a day','3','<p>drink lot of water and take rest.</p><p>visit in 4 days if still didn\'t feel better</p>','2018-12-13 19:32:35',9),(5,'Ciplactin','3 times a day','4','<p>none</p>','2018-12-15 15:09:10',9),(6,'Ciplactin','3 times a day','4','<p>none</p>','2018-12-15 15:10:52',9),(7,'ASTHALIN ROTOCAPS 200mcg','2 times a day','4','<p>none</p>','2018-12-15 16:47:21',11),(8,'ASTHALIN ROTOCAPS 200mcg','2 times a day','4','<p>none</p>','2018-12-15 16:47:31',11),(9,'ASTHALIN ROTOCAPS 200mcg','2 times a day','4','<p>none</p>','2018-12-15 16:48:24',11),(10,'NUTROLIN-B CAPS','2 times a day','4','<p>none</p>','2018-12-15 16:48:46',11),(11,'NUTROLIN-B CAPS','2 times a day','4','<p>none</p>','2018-12-15 16:48:56',11),(12,'Azee 500 MG tablet','2 times a day','4','<p>none</p>','2018-12-15 16:49:06',11),(13,'Azee 500 MG tablet','2 times a day','4','<p>none</p>','2018-12-15 16:49:59',11),(14,'Azee 500 MG tablet','2 times a day','4','<p>none</p>','2018-12-15 16:50:16',11),(15,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 16:51:57',11),(16,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 16:52:10',11),(17,'ALERGIN','2 times a day','4','<p>none</p>','2018-12-15 16:52:25',11),(18,'ALERGIN','2 times a day','4','<p>none</p>','2018-12-15 16:54:06',11),(19,'ALERGIN','2 times a day','4','<p>none</p>','2018-12-15 16:56:03',11),(20,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 16:56:37',11),(21,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 16:56:45',11),(22,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 17:09:34',11),(23,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 17:12:11',11),(24,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 17:17:51',11),(25,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 17:18:32',11),(26,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 17:21:17',11),(27,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 17:22:35',11),(28,'ASTHALIN SA','','','<p>none</p>','2018-12-15 17:25:42',11),(29,'ASTHALIN SA','','','<p>none</p>','2018-12-15 17:25:50',11),(30,'Azee 500 MG tablet','3 times a day','4','<p>just take rest</p>','2018-12-15 17:28:58',15),(31,'Azee 500 MG tablet','3 times a day','4','<p>just take rest</p>','2018-12-15 17:29:26',15),(32,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 20:01:01',15),(33,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 20:01:08',15),(34,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 20:01:16',15),(35,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 20:01:25',15),(36,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 20:01:42',15),(37,'Ciplactin','2 times a day','4','<p>none</p>','2018-12-15 20:01:47',15),(38,'NUTROLIN-B CAPS','2 times a day','4','<p>none</p>','2018-12-15 20:15:12',15),(39,'ASTHALIN ROTOCAPS 200mcg','3 times a day','4','<p>none</p>','2018-12-15 20:15:57',15),(40,'ALERGIN','2 times a day','4','<p>take rest</p>','2018-12-16 01:40:36',9),(41,'Azee 500 MG tablet','2 times a day','4','none','2018-12-16 16:39:32',9),(42,'A cap 10000 i.u','3 times a day','4','take rest','2018-12-16 16:47:55',14),(43,'Azee 500 MG tablet','3 times a day','4','take rest','2018-12-16 18:07:44',13),(44,'Azee 500 MG tablet','2 times a day','3','6','2018-12-22 18:06:03',16),(45,'Azee 500 MG tablet','3 times a day','3','<p>None</p>','2018-12-29 16:13:33',22),(46,'ASTHALIN','4 ','4','<p>just rest</p>','2018-12-30 11:12:41',23),(47,'ASTHALIN ROTOCAPS 200mcg +rot','4','4','<p>&nbsp;</p>','2018-12-30 11:19:40',23),(48,'Ciplactin','4','4','<p>&nbsp;</p>','2018-12-30 12:44:57',22),(49,'NUTROLIN-B CAPS','4','3','<p>&nbsp;</p>','2018-12-30 15:03:43',22),(50,'Azee 500 MG tablet','2 times a day','4','<p>none</p>','2019-01-09 04:21:25',24),(51,'NUTROLIN-B DRY SYRUP','2 times a day','4','<p>none</p>','2019-01-09 04:21:50',24),(52,'Azee 500 MG tablet','2 times a day','4','<p>rest</p>','2019-01-20 15:14:18',38),(53,'azee 500','3 times a day','3','<p>none</p>','2019-03-02 18:00:15',47),(54,'azee 500 ','2 times a day ','4','<p>mnomne</p>','2019-07-11 10:10:20',49),(55,'azee 500 ','2 times a day ','4','<p>mnomne</p>','2019-07-11 10:10:20',49);
/*!40000 ALTER TABLE `visits_prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-02  3:47:47
