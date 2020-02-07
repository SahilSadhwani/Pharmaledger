-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2020 at 06:34 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmaledger`
--

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `uid` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_contact_number` int(10) NOT NULL,
  `company_identification_number` int(11) NOT NULL,
  `company_email_id` varchar(255) NOT NULL,
  `company_city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`uid`, `company_name`, `company_address`, `company_contact_number`, `company_identification_number`, `company_email_id`, `company_city`) VALUES
(1, 'Sahil', 'Chopra court', 1234567898, 12546, 'sahil@gmail.com', 'Mumbai'),
(2, 'Dhiraj', 'Near New Era School', 1234569877, 14588, 'dhiraj@gmail.com', 'Delhi'),
(3, 'Juhi', 'Aman talkies', 987009870, 12546, 'juhi@gmail.com', 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `manufacturer_product_cost` int(11) NOT NULL,
  `wholesaler_product_cost` int(11) NOT NULL,
  `retailer_product_cost` int(11) NOT NULL,
  `image_extension` varchar(255) DEFAULT NULL,
  `product_power` int(11) NOT NULL,
  `best_before_months` int(11) NOT NULL,
  `product_contents` varchar(255) DEFAULT NULL,
  `product_supervision` varchar(255) NOT NULL DEFAULT 'No',
  `product_temp_range` int(11) DEFAULT '25',
  `product_mg` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `manufacturer_product_cost`, `wholesaler_product_cost`, `retailer_product_cost`, `image_extension`, `product_power`, `best_before_months`, `product_contents`, `product_supervision`, `product_temp_range`, `product_mg`, `manufacturer_id`) VALUES
(1, 'Metacin', 20, 22, 24, '.jpg', 400, 12, 'aspirin,etc.', 'No', 45, 25, 1),
(2, 'Crocin', 40, 43, 45, '.jpg', 400, 24, 'aspirin,etc.', 'No', 45, 30, 1),
(3, 'HH LEVO M', 39, 43, 46, '.jpg', 455, 30, 'etc.', 'no', 45, 60, 2),
(4, 'Levocitrizine', 40, 45, 55, '.jpg', 60, 24, 'etc.', 'No', 50, 45, 2),
(5, 'Combifllam', 20, 25, 30, '', 200, 8, 'aspirin', 'No', 30, 45, 1),
(6, 'catrazone', 23, 25, 30, '.jpg', 300, 12, 'abc,xyz...', 'no', 45, 35, 3),
(7, 'zenophill', 36, 38, 43, '.jpg', 50, 24, 'xyz,abc..', 'no', 50, 45, 3);

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

DROP TABLE IF EXISTS `retailer`;
CREATE TABLE IF NOT EXISTS `retailer` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL,
  `shop_address` varchar(255) NOT NULL,
  `shop_email_id` varchar(255) NOT NULL,
  `shop_telephone_no` int(10) NOT NULL,
  `gst_number` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`uid`, `shop_name`, `shop_address`, `shop_email_id`, `shop_telephone_no`, `gst_number`) VALUES
(7, 'vanita', 'near netaji', 'vani@gmail.com', 1452369870, 145236),
(8, 'rahul', 'madhav srishti', 'king@gmail.com', 1236547890, 1452369);

-- --------------------------------------------------------

--
-- Table structure for table `retailer_order`
--

DROP TABLE IF EXISTS `retailer_order`;
CREATE TABLE IF NOT EXISTS `retailer_order` (
  `retailer_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `retailer_id` int(11) NOT NULL,
  `wholesaler_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `received_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_cost` int(11) NOT NULL,
  `hashdata` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`retailer_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retailer_order`
--

INSERT INTO `retailer_order` (`retailer_order_id`, `retailer_id`, `wholesaler_id`, `product_id`, `product_quantity`, `received_date`, `total_cost`, `hashdata`, `status`) VALUES
(1, 7, 4, 1, 5, '2019-10-30 23:57:40', 110, 'd6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(3, 7, 4, 3, 5, '2019-10-30 23:58:47', 215, 'd6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(4, 7, 4, 4, 6, '2019-10-30 23:28:59', 270, '', 0),
(5, 7, 4, 3, 12, '2019-10-30 23:29:11', 516, '', 0),
(6, 7, 4, 2, 11, '2019-10-31 01:04:30', 473, '67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `phone_number`, `email`, `password`, `type`) VALUES
(1, 'Sahil', 838080686, 'sahil@gmail.com', 'sahil', 1),
(2, 'Dhiraj', 983009830, 'dhiraj@gmail.com', 'dhiraj', 1),
(3, 'Juhi', 987009870, 'juhi@gmail.com', 'juhi', 1),
(4, 'Chirag', 838018380, 'chirag@gmail.com', 'chirag', 2),
(5, 'Karan', 985009850, 'karan@gmail.com', 'karan', 2),
(6, 'Yogita', 1236547890, 'yogita@gmail.com', 'yogita', 2),
(7, 'vanita', 1236547890, 'vanita@gmail.com', 'vanita', 3),
(8, 'rahul', 1236547890, 'rahul@gmail.com', 'rahul', 3),
(9, 'Test', 12345, 'test@gmail.com', 'test', 1),
(10, 'bcd', 12345, 'bcd@gmail.com', 'bcd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler`
--

DROP TABLE IF EXISTS `wholesaler`;
CREATE TABLE IF NOT EXISTS `wholesaler` (
  `uid` int(11) NOT NULL,
  `warehouse_name` varchar(255) NOT NULL,
  `warehouse_address` varchar(255) NOT NULL,
  `warehouse_email_id` varchar(255) NOT NULL,
  `warehouse_telephone_no` int(10) NOT NULL,
  `gst_number` int(11) NOT NULL,
  `warehouse_city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wholesaler`
--

INSERT INTO `wholesaler` (`uid`, `warehouse_name`, `warehouse_address`, `warehouse_email_id`, `warehouse_telephone_no`, `gst_number`, `warehouse_city`) VALUES
(4, 'Chirag', 'Chopra court Ulhasnagar', 'chirag@gmail.com', 838018380, 231234892, 'Mumbai'),
(5, 'karan', 'khemani unr 1', 'karan7@gmail.com', 1452364569, 125478, 'Mumbai'),
(6, 'Yogita', 'near nehru chownk', 'abc@gmail.com', 1452369870, 125246, 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler_manufacturer`
--

DROP TABLE IF EXISTS `wholesaler_manufacturer`;
CREATE TABLE IF NOT EXISTS `wholesaler_manufacturer` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL,
  `wholesaler_id` int(11) NOT NULL,
  `connection_status` int(11) NOT NULL,
  PRIMARY KEY (`primary_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wholesaler_manufacturer`
--

INSERT INTO `wholesaler_manufacturer` (`primary_id`, `manufacturer_id`, `wholesaler_id`, `connection_status`) VALUES
(1, 2, 4, 1),
(2, 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler_order`
--

DROP TABLE IF EXISTS `wholesaler_order`;
CREATE TABLE IF NOT EXISTS `wholesaler_order` (
  `wholesaler_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `wholesaler_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `received_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_cost` int(11) NOT NULL DEFAULT '0',
  `hashdata` text,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`wholesaler_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wholesaler_order`
--

INSERT INTO `wholesaler_order` (`wholesaler_order_id`, `wholesaler_id`, `manufacturer_id`, `product_id`, `product_quantity`, `received_date`, `total_cost`, `hashdata`, `status`) VALUES
(1, 4, 1, 1, 12, '2019-10-31 06:45:02', 0, '2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(4, 5, 1, 2, 30, '2019-12-21 06:17:07', 0, '037645b98d50cddc52c1406290a6a40374fdced7,2ce963d900d1336826ad36c6a50168339e2cddce,28c9dc5c479d2e28fb17a88898a511c8ff8a2f72,725ad603e12131b3620a5574c0890d0f6c6f54c6,cdd037a32aecc6cc6cecd07737ef648c6b0d55aa,2bcd039044a335e7b9a68538e092e0d5f445c729,7b25456f77db425e2e149ac8242d476ff5ca3ade,4d7b510b1042e8e5c7ba04a73dcfdd69caaba91b,130e1450f89d07a4ef57d1160938b483feed6109,da77ef6f67b87bed51a87dbd4b8b6ee9ef23c9bd,5c8514e834e69cba41a823259f59263215e41374,c562921cba98741339bf758a044c2aeb9bdded60,437c1aa445f2d2a2b013187f1ea22447ecc2d288,e68355c954b4dba18f520a580f7ac594dc71dfc0,59ec4d719e310231c6c84ce3afd5ae3aa3fee686,8967116493855cf201b28a5a5140e7a207645bd9,cf7434276ab5236aeda792593448338f93fe4e4e,b5a3ca1bd1ca28c793e761e36bbbab81a9cbcad4,2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(5, 6, 3, 7, 20, '2019-10-30 15:47:20', 0, '', 0),
(29, 4, 2, 4, 50, '2019-10-31 04:34:40', 2000, 'afcc7b359011af43cf1e7218fba5a676c2afffb2,78d166290d9915b61f974c2c2614eef859cd438b,aae687d7f8d4b78c830936dda7c0225738b6a360,b7544fd477fa74fa12e53e336f320a031e4a5701,490fff43965d3bf43bb6f7d05b6299c20a08d556,e5235c91a84adf37ca0d41964df9bc26f488dbec,e7b51508b702775e7ed5e1be123615a82e21f516,7004df0441f3046d287fc99f9e35eba779537ba1,a4ff54cca69a5424ea7ce873b62e1df40953f929,21121aefda094908d6510b502f07a2c7c93954e0,a2909873dc77c4ab6c4ef98538c7bb58b16de114,cb9d0583c602de968d042df8fecfe130cebb7451,e618dbae3195276eff93280d0c8ba245b3d3f55b,c7034c6d4ed0a1d881d0de8bbaade53ddb4753ed,2ce539a4f69eff78be33e1278d14deafde064c54,9f992b20e93e9d4374e284a2c717720b63f2893f,10a6635561cdc405ea9b0ab0d41e8c22e8ad38b2,7d494a55747f1859ae7960dc187b74f566a2af0a,e4d72ebafbe81ccfc24f1ed36e646eeec335125f,f41a497931d7b938e213db99dab26ecb50b778cc,037645b98d50cddc52c1406290a6a40374fdced7,2ce963d900d1336826ad36c6a50168339e2cddce,28c9dc5c479d2e28fb17a88898a511c8ff8a2f72,725ad603e12131b3620a5574c0890d0f6c6f54c6,cdd037a32aecc6cc6cecd07737ef648c6b0d55aa,2bcd039044a335e7b9a68538e092e0d5f445c729,7b25456f77db425e2e149ac8242d476ff5ca3ade,4d7b510b1042e8e5c7ba04a73dcfdd69caaba91b,130e1450f89d07a4ef57d1160938b483feed6109,da77ef6f67b87bed51a87dbd4b8b6ee9ef23c9bd,5c8514e834e69cba41a823259f59263215e41374,c562921cba98741339bf758a044c2aeb9bdded60,437c1aa445f2d2a2b013187f1ea22447ecc2d288,e68355c954b4dba18f520a580f7ac594dc71dfc0,59ec4d719e310231c6c84ce3afd5ae3aa3fee686,8967116493855cf201b28a5a5140e7a207645bd9,cf7434276ab5236aeda792593448338f93fe4e4e,b5a3ca1bd1ca28c793e761e36bbbab81a9cbcad4,2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 0),
(30, 4, 1, 2, 66, '2020-01-30 09:14:40', 2640, 'b517868adc32ad923897597b1b2a1d797b355a90,4a81025a2777d647a8517fa079637a5145d08e51,6f90ed5439f94412ced9d9a43b1db9074f9c325b,3aaf4200790a13be6e07b843d7f34f95fa7223b4,95468ef98137fab98e5bf036a5e67a9d53948a5c,8c317980e9b3bb0257d82b0f2fb1219a91d5f611,2ff3d123db09f7fc9a8ad5ce697a113ef58ff610,49f90776811514ab2bcfa29411a48e12094a9fbb,91d94c6bf0931330321bf1779b702760edd4d0a7,f0a7c0cf6e8355b9f8095a5f7d74b5e6fd900158,c96b63eed76ecf7c9e88c9c919c42ea1e69b2cae,9234fd67e2daff87d7bdeefce194a4afd096e363,0470a1c3288fa4481da5b562a7084b876d9790cb,d95113ca5a871689f875dd7067ed0f41d89ba7c9,b5025f3e7fa259308b482b32f98d0341393afe08,d1275cfa7cff53389750992770fcfcfec69b0fd6,afcc7b359011af43cf1e7218fba5a676c2afffb2,78d166290d9915b61f974c2c2614eef859cd438b,aae687d7f8d4b78c830936dda7c0225738b6a360,b7544fd477fa74fa12e53e336f320a031e4a5701,490fff43965d3bf43bb6f7d05b6299c20a08d556,e5235c91a84adf37ca0d41964df9bc26f488dbec,e7b51508b702775e7ed5e1be123615a82e21f516,7004df0441f3046d287fc99f9e35eba779537ba1,a4ff54cca69a5424ea7ce873b62e1df40953f929,21121aefda094908d6510b502f07a2c7c93954e0,a2909873dc77c4ab6c4ef98538c7bb58b16de114,cb9d0583c602de968d042df8fecfe130cebb7451,e618dbae3195276eff93280d0c8ba245b3d3f55b,c7034c6d4ed0a1d881d0de8bbaade53ddb4753ed,2ce539a4f69eff78be33e1278d14deafde064c54,9f992b20e93e9d4374e284a2c717720b63f2893f,10a6635561cdc405ea9b0ab0d41e8c22e8ad38b2,7d494a55747f1859ae7960dc187b74f566a2af0a,e4d72ebafbe81ccfc24f1ed36e646eeec335125f,f41a497931d7b938e213db99dab26ecb50b778cc,037645b98d50cddc52c1406290a6a40374fdced7,2ce963d900d1336826ad36c6a50168339e2cddce,28c9dc5c479d2e28fb17a88898a511c8ff8a2f72,725ad603e12131b3620a5574c0890d0f6c6f54c6,cdd037a32aecc6cc6cecd07737ef648c6b0d55aa,2bcd039044a335e7b9a68538e092e0d5f445c729,7b25456f77db425e2e149ac8242d476ff5ca3ade,4d7b510b1042e8e5c7ba04a73dcfdd69caaba91b,130e1450f89d07a4ef57d1160938b483feed6109,da77ef6f67b87bed51a87dbd4b8b6ee9ef23c9bd,5c8514e834e69cba41a823259f59263215e41374,c562921cba98741339bf758a044c2aeb9bdded60,437c1aa445f2d2a2b013187f1ea22447ecc2d288,e68355c954b4dba18f520a580f7ac594dc71dfc0,59ec4d719e310231c6c84ce3afd5ae3aa3fee686,8967116493855cf201b28a5a5140e7a207645bd9,cf7434276ab5236aeda792593448338f93fe4e4e,b5a3ca1bd1ca28c793e761e36bbbab81a9cbcad4,2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(31, 4, 1, 2, 21, '2020-02-01 23:48:18', 840, 'da77ef6f67b87bed51a87dbd4b8b6ee9ef23c9bd,5c8514e834e69cba41a823259f59263215e41374,c562921cba98741339bf758a044c2aeb9bdded60,437c1aa445f2d2a2b013187f1ea22447ecc2d288,e68355c954b4dba18f520a580f7ac594dc71dfc0,59ec4d719e310231c6c84ce3afd5ae3aa3fee686,8967116493855cf201b28a5a5140e7a207645bd9,cf7434276ab5236aeda792593448338f93fe4e4e,b5a3ca1bd1ca28c793e761e36bbbab81a9cbcad4,2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(32, 4, 2, 3, 10, '2019-10-31 04:34:48', 390, '64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 0),
(33, 4, 3, 6, 10, '2019-10-30 20:35:16', 230, '', 0),
(34, 4, 1, 5, 112, '2019-10-31 00:58:59', 2240, 'acdc59c536492fbffb5f51c0f3293f81983ee86f,1486dbc1a104d238580801f5dd0e9347b1206131,41592d7b1241c921081a04092117c8a819611c8b,58e970b1c69de2d0609472aa7b447bed828f3548,67dfdc0d97d0ddba3dc34d93a8d85f293f6d8882,1617fdae06981c9f1c313de43f997b0e1c4592a2,956803cee8afc612576f0efda7d9218dba69e16f,1807654e17e1584381788e7d43d6ae040e1b9213,48a79296c33c949c05eaf9f3403c422a1b93c303,3ff036ccf8daad27c25ea7b850e009c4729ed8e4,a23cff1b089e360fab2acc33fb3bbb58aed797cc,2e1570a749fcb909a9d988171f3b6a03bfbe40c2,dc67d6830265ee301efd577f6a337c3f32d3b779,f4ff03d153a829c3ec456563169caaf75c109547,4c77f02810d50f8365f19f4d755ad4abdb60e39e,5fe73dfcbd4d924bb2e557766bac6bab6e6b2b08,00872727b754b9675be3044f2413215090c1b564,5d04eb5added1eccbef1102f29480dcd48fb8b65,20beb7936032f38c7d156c02e125f4b101bd5483,98cc5d2fb41370f14621698ad228049d1f7d743d,d1cf987e1d4f4265ba2450a2286f9738eec47426,d1e0154a356d0be5e82e052b6ba8735529266f1e,bcbbc31b09dc59857933e821335b170853330088,914d65e8ed7d5be501d14ac199e95b533e89e4f4,47efbaa9324822f9ede5cd8607c359a432a7f664,bcadef0be0867865c9e6e16ec6dafd0fec200ee5,0dd55401330f56205e592e16ce6beb20663a6f48,b3f198ced5037379960d79e3ed13016e9eb6ca75,a9adfef82bf78909287aed75d084cfbe6dce98fc,9dbf9567a66f34df490c9fb64b95ea9cc03cf9cd,ef425fb66b5103a225039e9db596b1acd265d506,b6dc375e58531ba2f87ae21154e83d50f6821362,01cf57b74b6e9f4d182aa103dba8bc0ca4b0362e,c9719b21235acb9675f622dd4ae5a1934239ea75,afed90afe0f4b308aa2a43a89b2329f47d2d2a13,1a7a3faf373bca755ef75c0b3eec20a967808aa5,3a1acebf1481a6fa63e1d93498ffc3298cead10b,92676abc8b43cc437c65543d35ad02a2c80206e7,75f57f664233277c1b930220931e4b31aa87a998,0ebb71cea3e05b1a0751f385c6e9ca0b33bf5dd5,cf9fdc4bc29a31935b2f7ee9b7a618a86eba811e,fb26622582d297fb007c2982b7f92b8a22997fa7,d6814c9206bc70b9f71bca210e44cad87ceb8489,980c95cd433a5a868f805ebee3f84b195b59a14f,5a6541a17cf42392abac67551a3a076037c3910e,f6f29cc6bd520a19cf60855c7e7f4c750bc68d13,b517868adc32ad923897597b1b2a1d797b355a90,4a81025a2777d647a8517fa079637a5145d08e51,6f90ed5439f94412ced9d9a43b1db9074f9c325b,3aaf4200790a13be6e07b843d7f34f95fa7223b4,95468ef98137fab98e5bf036a5e67a9d53948a5c,8c317980e9b3bb0257d82b0f2fb1219a91d5f611,2ff3d123db09f7fc9a8ad5ce697a113ef58ff610,49f90776811514ab2bcfa29411a48e12094a9fbb,91d94c6bf0931330321bf1779b702760edd4d0a7,f0a7c0cf6e8355b9f8095a5f7d74b5e6fd900158,c96b63eed76ecf7c9e88c9c919c42ea1e69b2cae,9234fd67e2daff87d7bdeefce194a4afd096e363,0470a1c3288fa4481da5b562a7084b876d9790cb,d95113ca5a871689f875dd7067ed0f41d89ba7c9,b5025f3e7fa259308b482b32f98d0341393afe08,d1275cfa7cff53389750992770fcfcfec69b0fd6,afcc7b359011af43cf1e7218fba5a676c2afffb2,78d166290d9915b61f974c2c2614eef859cd438b,aae687d7f8d4b78c830936dda7c0225738b6a360,b7544fd477fa74fa12e53e336f320a031e4a5701,490fff43965d3bf43bb6f7d05b6299c20a08d556,e5235c91a84adf37ca0d41964df9bc26f488dbec,e7b51508b702775e7ed5e1be123615a82e21f516,7004df0441f3046d287fc99f9e35eba779537ba1,a4ff54cca69a5424ea7ce873b62e1df40953f929,21121aefda094908d6510b502f07a2c7c93954e0,a2909873dc77c4ab6c4ef98538c7bb58b16de114,cb9d0583c602de968d042df8fecfe130cebb7451,e618dbae3195276eff93280d0c8ba245b3d3f55b,c7034c6d4ed0a1d881d0de8bbaade53ddb4753ed,2ce539a4f69eff78be33e1278d14deafde064c54,9f992b20e93e9d4374e284a2c717720b63f2893f,10a6635561cdc405ea9b0ab0d41e8c22e8ad38b2,7d494a55747f1859ae7960dc187b74f566a2af0a,e4d72ebafbe81ccfc24f1ed36e646eeec335125f,f41a497931d7b938e213db99dab26ecb50b778cc,037645b98d50cddc52c1406290a6a40374fdced7,2ce963d900d1336826ad36c6a50168339e2cddce,28c9dc5c479d2e28fb17a88898a511c8ff8a2f72,725ad603e12131b3620a5574c0890d0f6c6f54c6,cdd037a32aecc6cc6cecd07737ef648c6b0d55aa,2bcd039044a335e7b9a68538e092e0d5f445c729,7b25456f77db425e2e149ac8242d476ff5ca3ade,4d7b510b1042e8e5c7ba04a73dcfdd69caaba91b,130e1450f89d07a4ef57d1160938b483feed6109,da77ef6f67b87bed51a87dbd4b8b6ee9ef23c9bd,5c8514e834e69cba41a823259f59263215e41374,c562921cba98741339bf758a044c2aeb9bdded60,437c1aa445f2d2a2b013187f1ea22447ecc2d288,e68355c954b4dba18f520a580f7ac594dc71dfc0,59ec4d719e310231c6c84ce3afd5ae3aa3fee686,8967116493855cf201b28a5a5140e7a207645bd9,cf7434276ab5236aeda792593448338f93fe4e4e,b5a3ca1bd1ca28c793e761e36bbbab81a9cbcad4,2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(35, 4, 1, 1, 10, '2019-10-30 20:59:17', 200, '64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(36, 4, 1, 1, 3, '2019-12-21 06:36:53', 60, 'b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 3),
(37, 4, 1, 1, 13, '2019-10-31 00:13:02', 260, 'b5a3ca1bd1ca28c793e761e36bbbab81a9cbcad4,2b173659603a97cffd198e13c2b3fb0c911cecaf,67d0f7d0c6b5569b263b449172d83ee67e065643,64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(38, 4, 1, 2, 10, '2019-10-31 04:32:48', 400, '64cdeb3a27fc0c619000c3aa56d87909b5bd716b,ddf27b47a5c400632e57910b75942ab6fb07ba92,f836569e929d294f4ba6464fbe3f160fa3dcb5f0,52ed318b6ae7e71a15dd3e2887c846341ce39c3e,19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(39, 4, 1, 1, 6, '2019-10-31 01:09:29', 120, '19a52f0cb0af63bc5d7ad9fc31eb4ea5f11242c4,d6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 3),
(40, 4, 1, 2, 5, '2019-10-31 04:31:35', 200, 'd6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(41, 4, 1, 1, 5, '2019-10-31 04:40:20', 100, 'd6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 3),
(42, 4, 1, 5, 2, '2020-02-06 19:51:06', 40, 'b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(43, 4, 1, 5, 4, '2020-02-07 07:35:16', 80, '9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 0),
(45, 4, 1, 2, 5, '2020-02-07 07:46:17', 200, 'd6a94b7c9f641cb32abfc21b82424a93ff5b2b76,9c8d56eb8c22fc19f0c9a16112981db5d8a96a82,b29431651ef13d86413efdfb1c7a7cf3005e2164,b66811f405eb4570a5941bf8d31d81ad814e8d63,6ca0f79973c9470d7f5b72a2e5b01f11f85c4a39', 1),
(46, 4, 1, 5, 3, '2020-02-07 17:58:12', 60, '39e4f3e613ab2824f0f2b8e24be38a5f62fe245d,21550e2fd46de27b56cf5e7fe60a148d21d39bec,97417e1f7c1042a3bb3acfe1a72599d15c03b038', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler_products`
--

DROP TABLE IF EXISTS `wholesaler_products`;
CREATE TABLE IF NOT EXISTS `wholesaler_products` (
  `wholesaler_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wholesaler_products`
--

INSERT INTO `wholesaler_products` (`wholesaler_id`, `product_id`, `quantity`) VALUES
(4, 1, 75),
(4, 2, 21),
(4, 3, 20),
(4, 4, 50),
(4, 5, 8);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
