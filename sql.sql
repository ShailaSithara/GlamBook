/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - glambook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`glambook` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `glambook`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add artist',7,'add_artist'),
(26,'Can change artist',7,'change_artist'),
(27,'Can delete artist',7,'delete_artist'),
(28,'Can view artist',7,'view_artist'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add payment',9,'add_payment'),
(34,'Can change payment',9,'change_payment'),
(35,'Can delete payment',9,'delete_payment'),
(36,'Can view payment',9,'view_payment'),
(37,'Can add product',10,'add_product'),
(38,'Can change product',10,'change_product'),
(39,'Can delete product',10,'delete_product'),
(40,'Can view product',10,'view_product'),
(41,'Can add user',11,'add_user'),
(42,'Can change user',11,'change_user'),
(43,'Can delete user',11,'delete_user'),
(44,'Can view user',11,'view_user'),
(45,'Can add stock',12,'add_stock'),
(46,'Can change stock',12,'change_stock'),
(47,'Can delete stock',12,'delete_stock'),
(48,'Can view stock',12,'view_stock'),
(49,'Can add service',13,'add_service'),
(50,'Can change service',13,'change_service'),
(51,'Can delete service',13,'delete_service'),
(52,'Can view service',13,'view_service'),
(53,'Can add review',14,'add_review'),
(54,'Can change review',14,'change_review'),
(55,'Can delete review',14,'delete_review'),
(56,'Can view review',14,'view_review'),
(57,'Can add rental',15,'add_rental'),
(58,'Can change rental',15,'change_rental'),
(59,'Can delete rental',15,'delete_rental'),
(60,'Can view rental',15,'view_rental'),
(61,'Can add gallery',16,'add_gallery'),
(62,'Can change gallery',16,'change_gallery'),
(63,'Can delete gallery',16,'delete_gallery'),
(64,'Can view gallery',16,'view_gallery'),
(65,'Can add complaint',17,'add_complaint'),
(66,'Can change complaint',17,'change_complaint'),
(67,'Can delete complaint',17,'delete_complaint'),
(68,'Can view complaint',17,'view_complaint'),
(69,'Can add chat',18,'add_chat'),
(70,'Can change chat',18,'change_chat'),
(71,'Can delete chat',18,'delete_chat'),
(72,'Can view chat',18,'view_chat'),
(73,'Can add bookingmain',19,'add_bookingmain'),
(74,'Can change bookingmain',19,'change_bookingmain'),
(75,'Can delete bookingmain',19,'delete_bookingmain'),
(76,'Can view bookingmain',19,'view_bookingmain'),
(77,'Can add booking',20,'add_booking'),
(78,'Can change booking',20,'change_booking'),
(79,'Can delete booking',20,'delete_booking'),
(80,'Can view booking',20,'view_booking');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'myapp','artist'),
(20,'myapp','booking'),
(19,'myapp','bookingmain'),
(18,'myapp','chat'),
(17,'myapp','complaint'),
(16,'myapp','gallery'),
(8,'myapp','login'),
(9,'myapp','payment'),
(10,'myapp','product'),
(15,'myapp','rental'),
(14,'myapp','review'),
(13,'myapp','service'),
(12,'myapp','stock'),
(11,'myapp','user'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-02-07 04:27:43.171041'),
(2,'auth','0001_initial','2024-02-07 04:27:43.961544'),
(3,'admin','0001_initial','2024-02-07 04:27:44.072047'),
(4,'admin','0002_logentry_remove_auto_add','2024-02-07 04:27:44.085516'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-02-07 04:27:44.096765'),
(6,'contenttypes','0002_remove_content_type_name','2024-02-07 04:27:44.196485'),
(7,'auth','0002_alter_permission_name_max_length','2024-02-07 04:27:44.256717'),
(8,'auth','0003_alter_user_email_max_length','2024-02-07 04:27:44.309673'),
(9,'auth','0004_alter_user_username_opts','2024-02-07 04:27:44.319538'),
(10,'auth','0005_alter_user_last_login_null','2024-02-07 04:27:44.378907'),
(11,'auth','0006_require_contenttypes_0002','2024-02-07 04:27:44.384761'),
(12,'auth','0007_alter_validators_add_error_messages','2024-02-07 04:27:44.402580'),
(13,'auth','0008_alter_user_username_max_length','2024-02-07 04:27:44.506087'),
(14,'auth','0009_alter_user_last_name_max_length','2024-02-07 04:27:44.601196'),
(15,'auth','0010_alter_group_name_max_length','2024-02-07 04:27:44.692173'),
(16,'auth','0011_update_proxy_permissions','2024-02-07 04:27:44.720141'),
(17,'auth','0012_alter_user_first_name_max_length','2024-02-07 04:27:44.787457'),
(18,'myapp','0001_initial','2024-02-07 04:27:46.530443'),
(19,'sessions','0001_initial','2024-02-07 04:27:46.586327');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('75sdpbeqi4jg2vyy9lxx5isnlikeg810','eyJsaWQiOjF9:1rYK03:w2yXLZLeIMmTal_MG3vXGliNBl5um8qmMu0B4CmWEjo','2024-02-23 06:04:35.570238'),
('nkw96jq6j18ai6tyqvfaiztvh0d1qs2d','eyJsaWQiOjh9:1raBPw:KRoURd2-EnZFB3jrPydZuEllVgaeSnaKURHt5xxNRns','2024-02-28 09:19:00.086307');

/*Table structure for table `myapp_artist` */

DROP TABLE IF EXISTS `myapp_artist`;

CREATE TABLE `myapp_artist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phoneno` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Place` varchar(100) NOT NULL,
  `Post` varchar(100) NOT NULL,
  `Pin` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_artist_LOGIN_id_6e844780_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_artist_LOGIN_id_6e844780_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_artist` */

insert  into `myapp_artist`(`id`,`Name`,`Phoneno`,`Email`,`Place`,`Post`,`Pin`,`State`,`Status`,`Gender`,`Longitude`,`Latitude`,`LOGIN_id`) values 
(1,'sithara','56789','sithara@gmail.com','malappuram','malappuram','5678','kerala','approved','female','palakkad','kochi',1),
(3,'shaila','3456789','shaila@gmail.com','malappuram','malappuram','45678','tamilnadu','rejected','male','palakkad','kochi',2);

/*Table structure for table `myapp_booking` */

DROP TABLE IF EXISTS `myapp_booking`;

CREATE TABLE `myapp_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `SERVICE_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_booking_SERVICE_id_a3daa583_fk_myapp_service_id` (`SERVICE_id`),
  KEY `myapp_booking_USER_id_ae15cfb2_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_booking_USER_id_ae15cfb2_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `myapp_booking_SERVICE_id_a3daa583_fk_myapp_service_id` FOREIGN KEY (`SERVICE_id`) REFERENCES `myapp_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `myapp_booking` */

/*Table structure for table `myapp_bookingmain` */

DROP TABLE IF EXISTS `myapp_bookingmain`;

CREATE TABLE `myapp_bookingmain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Status` varchar(100) NOT NULL,
  `PRODUCT_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_bookingmain_PRODUCT_id_2fa7e68a_fk_myapp_product_id` (`PRODUCT_id`),
  KEY `myapp_bookingmain_USER_id_fada5b7a_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_bookingmain_USER_id_fada5b7a_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `myapp_bookingmain_PRODUCT_id_2fa7e68a_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_bookingmain` */

insert  into `myapp_bookingmain`(`id`,`Date`,`Status`,`PRODUCT_id`,`USER_id`) values 
(1,'2024-05-29','approved',1,1),
(2,'2024-02-14','rejected',2,1);

/*Table structure for table `myapp_chat` */

DROP TABLE IF EXISTS `myapp_chat`;

CREATE TABLE `myapp_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Msg` varchar(100) NOT NULL,
  `LOGIN1_id` bigint(20) NOT NULL,
  `LOGIN2_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_chat_LOGIN1_id_8e71b665_fk_myapp_login_id` (`LOGIN1_id`),
  KEY `myapp_chat_LOGIN2_id_26f14193_fk_myapp_login_id` (`LOGIN2_id`),
  CONSTRAINT `myapp_chat_LOGIN2_id_26f14193_fk_myapp_login_id` FOREIGN KEY (`LOGIN2_id`) REFERENCES `myapp_login` (`id`),
  CONSTRAINT `myapp_chat_LOGIN1_id_8e71b665_fk_myapp_login_id` FOREIGN KEY (`LOGIN1_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `myapp_chat` */

/*Table structure for table `myapp_complaint` */

DROP TABLE IF EXISTS `myapp_complaint`;

CREATE TABLE `myapp_complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Complaint` varchar(100) NOT NULL,
  `Reply` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaint_LOGIN_id_57f588ca_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_complaint_LOGIN_id_57f588ca_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_complaint` */

insert  into `myapp_complaint`(`id`,`Complaint`,`Reply`,`Status`,`Date`,`LOGIN_id`) values 
(1,'the product is damaged','fjff','action will take','2024-02-05',1);

/*Table structure for table `myapp_gallery` */

DROP TABLE IF EXISTS `myapp_gallery`;

CREATE TABLE `myapp_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Photo1` varchar(300) NOT NULL,
  `Photo2` varchar(300) NOT NULL,
  `Photo3` varchar(300) NOT NULL,
  `ARTIST_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_gallery_ARTIST_id_ee490a98_fk_myapp_artist_id` (`ARTIST_id`),
  CONSTRAINT `myapp_gallery_ARTIST_id_ee490a98_fk_myapp_artist_id` FOREIGN KEY (`ARTIST_id`) REFERENCES `myapp_artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `myapp_gallery` */

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`Username`,`Password`,`Type`) values 
(1,'admin@gmail.com','1','admin'),
(2,'jasi@gmail.com','9','blocked'),
(3,'Rental','7','rental'),
(4,'renu@gmail.com','56','blocked'),
(5,'anu@gmail.com','76','pending'),
(6,'jadu@gmail.com','100','rental'),
(7,'fabi@gmail.com','44','rental'),
(8,'surya@gmail.com','11','rental');

/*Table structure for table `myapp_payment` */

DROP TABLE IF EXISTS `myapp_payment`;

CREATE TABLE `myapp_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Status` varchar(100) NOT NULL,
  `Creditedfrom` varchar(100) NOT NULL,
  `Bankdetails` varchar(100) NOT NULL,
  `Amount` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_payment` */

insert  into `myapp_payment`(`id`,`Status`,`Creditedfrom`,`Bankdetails`,`Amount`,`Date`) values 
(1,'d4gty','hdfc','hdfc,valanchery','10000','2024-02-12');

/*Table structure for table `myapp_product` */

DROP TABLE IF EXISTS `myapp_product`;

CREATE TABLE `myapp_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Productname` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL,
  `RENTAL_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_product_RENTAL_id_443981ea_fk_myapp_rental_id` (`RENTAL_id`),
  CONSTRAINT `myapp_product_RENTAL_id_443981ea_fk_myapp_rental_id` FOREIGN KEY (`RENTAL_id`) REFERENCES `myapp_rental` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_product` */

insert  into `myapp_product`(`id`,`Productname`,`Price`,`RENTAL_id`) values 
(1,'ring','250',2),
(2,'bangle','300',6);

/*Table structure for table `myapp_rental` */

DROP TABLE IF EXISTS `myapp_rental`;

CREATE TABLE `myapp_rental` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phoneno` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Place` varchar(100) NOT NULL,
  `Post` varchar(100) NOT NULL,
  `Pin` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_rental_LOGIN_id_43e12c90_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_rental_LOGIN_id_43e12c90_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_rental` */

insert  into `myapp_rental`(`id`,`Name`,`Phoneno`,`Email`,`Place`,`Post`,`Pin`,`State`,`Status`,`Longitude`,`Latitude`,`LOGIN_id`) values 
(2,'glamstudio','98765432','glamstudio.@gmail.com','malappuram','malappuram','676519','kerala','approved','manjeri','valanchery',3),
(3,'renu','09876543','renu@gmail.com','kochi','kochi','698714','kerala','rejected','ernakkulam','angamali',4),
(4,'anu','9865342','anu@gmail.com','kottakkal','kottakkal','676534','kerala','approved','kuttipuram','tirur',5),
(5,'jadhu','67878988','jadu@gmail.com','purammannur','purammannur','676552','kerala','approved','thiruvegapura','vengad',6),
(6,'fabi','234567','fabi@gmail.com','vengad','vengad','234567','kerala','approved','valanchery','kolathur',7),
(7,'surya','23456','surya@gmail.com','malappuram','malappuram','3456','kerala','approved','kochi','palakkad',8);

/*Table structure for table `myapp_review` */

DROP TABLE IF EXISTS `myapp_review`;

CREATE TABLE `myapp_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Review` varchar(100) NOT NULL,
  `Rating` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_review_LOGIN_id_15ae3697_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_review_LOGIN_id_15ae3697_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_review` */

insert  into `myapp_review`(`id`,`Review`,`Rating`,`Date`,`LOGIN_id`) values 
(1,'good product','4','2024-02-12',8);

/*Table structure for table `myapp_service` */

DROP TABLE IF EXISTS `myapp_service`;

CREATE TABLE `myapp_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL,
  `ARTIST_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_service_ARTIST_id_3f9a9cee_fk_myapp_artist_id` (`ARTIST_id`),
  CONSTRAINT `myapp_service_ARTIST_id_3f9a9cee_fk_myapp_artist_id` FOREIGN KEY (`ARTIST_id`) REFERENCES `myapp_artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `myapp_service` */

/*Table structure for table `myapp_stock` */

DROP TABLE IF EXISTS `myapp_stock`;

CREATE TABLE `myapp_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Stock` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `PRODUCT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_stock_PRODUCT_id_d9814705_fk_myapp_product_id` (`PRODUCT_id`),
  CONSTRAINT `myapp_stock_PRODUCT_id_d9814705_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_stock` */

insert  into `myapp_stock`(`id`,`Stock`,`Date`,`PRODUCT_id`) values 
(5,'fabi','2024-02-07',1),
(6,'12','2024-02-08',1),
(7,'23','2024-02-09',1),
(8,'','2024-02-09',1),
(9,'','2024-02-09',1),
(10,'','2024-02-09',1),
(11,'23','2024-02-14',1);

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phoneno` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Place` varchar(100) NOT NULL,
  `Post` varchar(100) NOT NULL,
  `Pin` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` date NOT NULL,
  `Status` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`Name`,`Phoneno`,`Email`,`Place`,`Post`,`Pin`,`State`,`Gender`,`Dob`,`Status`,`LOGIN_id`) values 
(1,'jasi','876534','jasi@gmail.com','athipatta','edayur','676552','kerala','female','2002-05-23','pending',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
