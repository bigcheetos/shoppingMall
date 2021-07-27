/*
SQLyog Community v13.0.0 (64 bit)
MySQL - 8.0.23 : Database - foodmall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`foodmall` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `foodmall`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `ad_seq` int NOT NULL,
  `mem_lev` varchar(10) DEFAULT NULL,
  `ad_id` varchar(20) NOT NULL,
  `ad_pw` varchar(20) NOT NULL,
  `ad_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ad_email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ad_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ad_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin` */

insert  into `admin`(`ad_seq`,`mem_lev`,`ad_id`,`ad_pw`,`ad_name`,`ad_email`,`ad_phone`) values 
(1,'a','admin','0000','관리자','bidt@bidt.com','0156811');

/*Table structure for table `applystore` */

DROP TABLE IF EXISTS `applystore`;

CREATE TABLE `applystore` (
  `store_seq` int NOT NULL,
  `store_name` varchar(10) NOT NULL,
  `business_digit` varchar(20) DEFAULT NULL,
  `store_phone` varchar(20) NOT NULL,
  `store_add` varchar(20) NOT NULL,
  PRIMARY KEY (`store_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `applystore` */

/*Table structure for table `calculation` */

DROP TABLE IF EXISTS `calculation`;

CREATE TABLE `calculation` (
  `cal_seq` int NOT NULL,
  `cal_amt` varchar(50) DEFAULT NULL,
  `cal_date` datetime DEFAULT NULL,
  `cal_mth` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cal_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `calculation` */

/*Table structure for table `claim` */

DROP TABLE IF EXISTS `claim`;

CREATE TABLE `claim` (
  `claim_seq` int NOT NULL,
  `claim_clsf` int NOT NULL,
  `claim_content` varchar(50) NOT NULL,
  `claim_mem` varchar(10) NOT NULL,
  `claim_ck` int NOT NULL,
  `claim_feedback` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`claim_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `claim` */

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `coupon_seq` int NOT NULL,
  `coupon_name` varchar(10) NOT NULL,
  `coupon_period` varchar(10) NOT NULL,
  `coupon_img` varchar(50) NOT NULL,
  `coupon_mem` varchar(10) NOT NULL,
  `coupon_date` datetime DEFAULT NULL,
  PRIMARY KEY (`coupon_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon` */

/*Table structure for table `crmboard` */

DROP TABLE IF EXISTS `crmboard`;

CREATE TABLE `crmboard` (
  `crmBoard_seq` int NOT NULL,
  `crmBoard_title` varchar(10) NOT NULL,
  `crmBoard_content` varchar(50) NOT NULL,
  `crmBoard_name` varchar(10) NOT NULL,
  `crmBoard_date` datetime NOT NULL,
  `crmBoard_re` varchar(50) DEFAULT NULL,
  `crmBoard_reDate` datetime DEFAULT NULL,
  PRIMARY KEY (`crmBoard_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `crmboard` */

/*Table structure for table `delivery` */

DROP TABLE IF EXISTS `delivery`;

CREATE TABLE `delivery` (
  `del_seq` int NOT NULL,
  `del_product` varchar(20) DEFAULT NULL,
  `del_start` datetime DEFAULT NULL,
  `del_eta` varchar(10) DEFAULT NULL,
  `del_arr` datetime DEFAULT NULL,
  `del_com` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`del_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `delivery` */

/*Table structure for table `eventboard` */

DROP TABLE IF EXISTS `eventboard`;

CREATE TABLE `eventboard` (
  `event_seq` int NOT NULL,
  `event_title` varchar(20) NOT NULL,
  `event_content` varchar(50) NOT NULL,
  `event_img` varchar(10) DEFAULT NULL,
  `event_period` varchar(20) NOT NULL,
  `event_winner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `eventboard` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `mem_seq` int NOT NULL AUTO_INCREMENT,
  `emailId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mem_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mem_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mem_add` varchar(50) DEFAULT NULL,
  `email_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_confirm` tinyint DEFAULT NULL,
  `email_date` datetime DEFAULT NULL,
  `mem_lev` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `regDate` datetime NOT NULL,
  `mem_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mem_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`mem_seq`,`emailId`,`password`,`mem_name`,`mem_status`,`mem_add`,`email_key`,`email_confirm`,`email_date`,`mem_lev`,`regDate`,`mem_number`) values 
(1,'guest','bidt1234!@','울트라','bidt','seoul',NULL,NULL,NULL,'m','2021-06-22 17:06:24',NULL),
(2,'admin','0000','관리자','admin@1234.com',NULL,NULL,NULL,NULL,'a','2021-07-19 15:10:42',NULL);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `notice_seq` int NOT NULL,
  `notice_title` varchar(10) NOT NULL,
  `notice_content` varchar(50) NOT NULL,
  `notice_name` varchar(10) NOT NULL,
  `notice_date` datetime NOT NULL,
  PRIMARY KEY (`notice_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `notice` */

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `order_seq` int NOT NULL,
  `order_pro` varchar(20) DEFAULT NULL,
  `order_amt` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_name` varchar(10) DEFAULT NULL,
  `order_phone` varchar(20) DEFAULT NULL,
  `order_note` varchar(50) DEFAULT NULL,
  `order_add` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orderlist` */

/*Table structure for table `ordermanage` */

DROP TABLE IF EXISTS `ordermanage`;

CREATE TABLE `ordermanage` (
  `order_seq` int NOT NULL,
  `order_quantity` varchar(20) NOT NULL,
  `order_date` datetime NOT NULL,
  `mem_name` varchar(20) NOT NULL,
  `order_note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ordermanage` */

/*Table structure for table `productlist` */

DROP TABLE IF EXISTS `productlist`;

CREATE TABLE `productlist` (
  `pro_seq` int NOT NULL,
  `pro_name` varchar(10) NOT NULL,
  `pro_detail` varchar(50) NOT NULL,
  `pro_img` varchar(50) DEFAULT NULL,
  `stock_state` varchar(50) DEFAULT NULL,
  `sup_name` varchar(10) NOT NULL,
  PRIMARY KEY (`pro_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `productlist` */

/*Table structure for table `scmboard` */

DROP TABLE IF EXISTS `scmboard`;

CREATE TABLE `scmboard` (
  `scmBoard_seq` int NOT NULL,
  `scmBoard_title` varchar(10) NOT NULL,
  `scmBoard_content` varchar(50) NOT NULL,
  `scmBoard_name` varchar(20) NOT NULL,
  `scmBoard_date` datetime NOT NULL,
  PRIMARY KEY (`scmBoard_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `scmboard` */

/*Table structure for table `specification` */

DROP TABLE IF EXISTS `specification`;

CREATE TABLE `specification` (
  `speci_seq` int NOT NULL,
  `speci_img` varchar(10) DEFAULT NULL,
  `speci_date` datetime DEFAULT NULL,
  `speci_sup` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`speci_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `specification` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `stock_seq` int NOT NULL,
  `stock_product` varchar(50) DEFAULT NULL,
  `stock_amt` int DEFAULT NULL,
  `stock_inDate` datetime DEFAULT NULL,
  `stock_outDate` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `stock` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `sup_seq` int NOT NULL,
  `sup_name` varchar(10) NOT NULL,
  `sup_detail` varchar(50) DEFAULT NULL,
  `sup_business_img` varchar(50) DEFAULT NULL,
  `sup_cal_ck` varchar(50) DEFAULT NULL,
  `sup_cal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sup_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `supplier` */

/*Table structure for table `supply` */

DROP TABLE IF EXISTS `supply`;

CREATE TABLE `supply` (
  `supply_seq` int NOT NULL,
  `supply_item` varchar(20) DEFAULT NULL,
  `supply_date` datetime DEFAULT NULL,
  `supply_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`supply_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `supply` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
