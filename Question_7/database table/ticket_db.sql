-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 07:52 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kotakin`
--
CREATE DATABASE IF NOT EXISTS `kotakin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kotakin`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adjustment`
--

CREATE TABLE `tbl_adjustment` (
  `id_adjustment` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adjustment_detail`
--

CREATE TABLE `tbl_adjustment_detail` (
  `id_adjustment_detail` int(11) NOT NULL,
  `id_adjustment` varchar(50) NOT NULL,
  `id_product_varian` int(11) NOT NULL,
  `warehouse_stocks` int(11) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ballot`
--

CREATE TABLE `tbl_ballot` (
  `id` int(11) NOT NULL,
  `ballot_image` text NOT NULL,
  `ballot_name` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ballot`
--

INSERT INTO `tbl_ballot` (`id`, `ballot_image`, `ballot_name`, `created_date`) VALUES
(1, 'https://dummyimage.com/300/09f/fff.png', 'Nomine 1', '2022-03-26 03:07:59'),
(2, 'https://dummyimage.com/300/09f/fff.png', 'Nomine 2', '2022-03-26 03:07:59'),
(3, 'https://dummyimage.com/300/09f/fff.png', 'Nomine 5', '2022-03-26 03:07:59'),
(4, 'https://dummyimage.com/300/09f/fff.png', 'Nomine 4', '2022-03-26 03:07:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `banner_id` int(11) NOT NULL,
  `file_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chart`
--

CREATE TABLE `tbl_chart` (
  `id_chart` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product_header` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_confirm_payment`
--

CREATE TABLE `tbl_confirm_payment` (
  `id_order` varchar(50) NOT NULL,
  `transfer_date` date DEFAULT NULL,
  `bank_branch` varchar(50) NOT NULL,
  `bank_account_name` varchar(50) NOT NULL,
  `bank_account_number` varchar(50) NOT NULL,
  `payment_receipt` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id_faq` int(11) NOT NULL,
  `faq_title` varchar(50) NOT NULL,
  `faq_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `id_order` varchar(50) NOT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `customer_phone_number` varchar(50) DEFAULT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `order_reason` varchar(50) DEFAULT NULL,
  `order_confirmed` date DEFAULT NULL,
  `order_shipped` date DEFAULT NULL,
  `order_return` date DEFAULT NULL,
  `order_done` date DEFAULT NULL,
  `shipping_cost` int(20) DEFAULT NULL,
  `awb_number` varchar(50) DEFAULT NULL,
  `kurir` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_header`
--

CREATE TABLE `tbl_order_header` (
  `id_order` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product_header` varchar(50) NOT NULL,
  `published_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `items_number` int(20) NOT NULL,
  `purchase_total` int(50) NOT NULL,
  `order_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_header`
--

CREATE TABLE `tbl_product_header` (
  `id_product_header` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` text NOT NULL,
  `published_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_url` text NOT NULL,
  `product_price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_header`
--

INSERT INTO `tbl_product_header` (`id_product_header`, `product_name`, `product_description`, `published_date`, `file_url`, `product_price`) VALUES
(15, 'Iphoe gw ini woi', '<p>ini producct</p>', '2022-03-24 17:53:58', 'https://firebasestorage.googleapis.com/v0/b/kotakin-client.appspot.com/o/product%2F1648144436426-Capture.PNG?alt=media', 12000000),
(16, 'Iphoe 12', '<p>ini producct</p>', '2022-03-24 17:54:10', 'https://firebasestorage.googleapis.com/v0/b/kotakin-client.appspot.com/o/product%2F1648144449274-Capture.PNG?alt=media', 12000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_varian`
--

CREATE TABLE `tbl_product_varian` (
  `id_product_varian` int(11) NOT NULL,
  `id_product_header` int(11) NOT NULL,
  `varian_color` varchar(35) NOT NULL,
  `varian_price` int(20) NOT NULL,
  `varian_stocks` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_varian`
--

INSERT INTO `tbl_product_varian` (`id_product_varian`, `id_product_header`, `varian_color`, `varian_price`, `varian_stocks`) VALUES
(22, 15, 'red', 12000000, 12),
(23, 15, 'blue', 12000000, 12),
(24, 16, 'red', 12000000, 12),
(25, 16, 'blue', 12000000, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_admin_detail`
--

CREATE TABLE `tbl_purchase_admin_detail` (
  `id_purchase_detail` int(11) NOT NULL,
  `id_purchase` varchar(50) NOT NULL,
  `id_product_header` varchar(50) NOT NULL,
  `id_product_varian` varchar(50) NOT NULL,
  `qty` int(20) NOT NULL,
  `price` int(20) NOT NULL,
  `subtotal` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchase_admin_detail`
--

INSERT INTO `tbl_purchase_admin_detail` (`id_purchase_detail`, `id_purchase`, `id_product_header`, `id_product_varian`, `qty`, `price`, `subtotal`) VALUES
(12, '130203/PRCHS/XI/2022', '15', '22', 2, 12000000, 24000000),
(13, '130203/PRCHS/XI/2022', '16', '24', 2, 12000000, 24000000),
(14, '01290203/PRCHS/XI/2022', '16', '24', 2, 12000000, 24000000),
(15, '01290203/PRCHS/XI/2022', '16', '24', 2, 12000000, 24000000),
(16, '3038232/PRCHS/XI/2022', '15', '22', 2, 12000000, 24000000),
(17, '3038232/PRCHS/XI/2022', '16', '24', 2, 12000000, 24000000),
(18, '3038232/PRCHS/XI/2022', '16', '24', 2, 12000000, 24000000),
(19, '3038232/PRCHS/XI/2022', '16', '24', 2, 12000000, 24000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_admin_header`
--

CREATE TABLE `tbl_purchase_admin_header` (
  `id_purchase` varchar(50) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `total` int(50) NOT NULL,
  `shipping_cost` int(50) NOT NULL,
  `purchase_invoice` text NOT NULL,
  `purchase_date` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchase_admin_header`
--

INSERT INTO `tbl_purchase_admin_header` (`id_purchase`, `supplier`, `total`, `shipping_cost`, `purchase_invoice`, `purchase_date`, `status`) VALUES
('01290203/PRCHS/XI/2022', 'vendor 1', 48000000, 40000, 'https://firebasestorage.googleapis.com/v0/b/kotakin-client.appspot.com/o/Purchase_order%2F1648147829486-Capture.PNG?alt=media', '2022-03-12', 'return'),
('130203/PRCHS/XI/2022', 'vendor 1', 48000000, 40000, 'https://firebasestorage.googleapis.com/v0/b/kotakin-client.appspot.com/o/Purchase_order%2F1648147829486-Capture.PNG?alt=media', '2022-03-12', 'return'),
('3038232/PRCHS/XI/2022', 'vendor 1', 96000000, 40000, 'https://firebasestorage.googleapis.com/v0/b/kotakin-client.appspot.com/o/Purchase_order%2F1648155757892-Capture.PNG?alt=media', '2022-03-12', 'purchase');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_admin_return`
--

CREATE TABLE `tbl_purchase_admin_return` (
  `purchase_return_id` int(11) NOT NULL,
  `id_purchase` varchar(50) NOT NULL,
  `return_reason` varchar(50) NOT NULL,
  `approval_image_1` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchase_admin_return`
--

INSERT INTO `tbl_purchase_admin_return` (`purchase_return_id`, `id_purchase`, `return_reason`, `approval_image_1`) VALUES
(7, '130203/PRCHS/XI/2022', 'Barang nya rusak', 'https://firebasestorage.googleapis.com/v0/b/kotakin-client.appspot.com/o/Purchase_return%2F1648149745997-WhatsApp%20Image%202022-01-20%20at%2023.12.02%20(1).jpeg?alt=media'),
(8, '01290203/PRCHS/XI/2022', 'Barang nya rusak', 'https://firebasestorage.googleapis.com/v0/b/kotakin-client.appspot.com/o/Purchase_return%2F1648149812359-WhatsApp%20Image%202022-01-20%20at%2023.12.02%20(1).jpeg?alt=media');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_return`
--

CREATE TABLE `tbl_return` (
  `id_order` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `return_reason` varchar(50) DEFAULT NULL,
  `return_amount` int(20) DEFAULT NULL,
  `approval_image_1` text DEFAULT NULL,
  `approval_image_2` text DEFAULT NULL,
  `approval_image_3` text DEFAULT NULL,
  `awb_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `refund_approval_receipt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product_header` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id_users` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_adjustment`
--
ALTER TABLE `tbl_adjustment`
  ADD PRIMARY KEY (`id_adjustment`);

--
-- Indexes for table `tbl_adjustment_detail`
--
ALTER TABLE `tbl_adjustment_detail`
  ADD PRIMARY KEY (`id_adjustment_detail`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_ballot`
--
ALTER TABLE `tbl_ballot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `tbl_chart`
--
ALTER TABLE `tbl_chart`
  ADD PRIMARY KEY (`id_chart`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product_header` (`id_product_header`);

--
-- Indexes for table `tbl_confirm_payment`
--
ALTER TABLE `tbl_confirm_payment`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`id_faq`);

--
-- Indexes for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `tbl_order_header`
--
ALTER TABLE `tbl_order_header`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tbl_product_header`
--
ALTER TABLE `tbl_product_header`
  ADD PRIMARY KEY (`id_product_header`);

--
-- Indexes for table `tbl_product_varian`
--
ALTER TABLE `tbl_product_varian`
  ADD PRIMARY KEY (`id_product_varian`),
  ADD KEY `id_product_header` (`id_product_header`);

--
-- Indexes for table `tbl_purchase_admin_detail`
--
ALTER TABLE `tbl_purchase_admin_detail`
  ADD PRIMARY KEY (`id_purchase_detail`);

--
-- Indexes for table `tbl_purchase_admin_header`
--
ALTER TABLE `tbl_purchase_admin_header`
  ADD PRIMARY KEY (`id_purchase`);

--
-- Indexes for table `tbl_purchase_admin_return`
--
ALTER TABLE `tbl_purchase_admin_return`
  ADD PRIMARY KEY (`purchase_return_id`),
  ADD KEY `id_purchase` (`id_purchase`);

--
-- Indexes for table `tbl_return`
--
ALTER TABLE `tbl_return`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_adjustment_detail`
--
ALTER TABLE `tbl_adjustment_detail`
  MODIFY `id_adjustment_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ballot`
--
ALTER TABLE `tbl_ballot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_chart`
--
ALTER TABLE `tbl_chart`
  MODIFY `id_chart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `id_faq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_product_header`
--
ALTER TABLE `tbl_product_header`
  MODIFY `id_product_header` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_product_varian`
--
ALTER TABLE `tbl_product_varian`
  MODIFY `id_product_varian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_purchase_admin_detail`
--
ALTER TABLE `tbl_purchase_admin_detail`
  MODIFY `id_purchase_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_purchase_admin_return`
--
ALTER TABLE `tbl_purchase_admin_return`
  MODIFY `purchase_return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_purchase_admin_return`
--
ALTER TABLE `tbl_purchase_admin_return`
  ADD CONSTRAINT `tbl_purchase_admin_return_ibfk_1` FOREIGN KEY (`id_purchase`) REFERENCES `tbl_purchase_admin_header` (`id_purchase`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

--
-- Dumping data for table `pma__column_info`
--

INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`, `input_transformation`, `input_transformation_options`) VALUES
(1, 'kotakin', 'tbl_adjustment_detail', 'id_product_varian', '', '', '', '', '', 'warehouse_stocks'),
(2, 'kotakin', 'tbl_ballot', 'ballot_name', '', '', '', '', '', 'created_date');

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ticket\",\"table\":\"user\"},{\"db\":\"ticket\",\"table\":\"user_like\"},{\"db\":\"ticket\",\"table\":\"event\"},{\"db\":\"ticket\",\"table\":\"ticket_type\"},{\"db\":\"ticket\",\"table\":\"transaction\"},{\"db\":\"kotakin\",\"table\":\"tbl_faq\"},{\"db\":\"kotakin\",\"table\":\"tbl_ballot\"},{\"db\":\"kotakin\",\"table\":\"tbl_purchase_admin_return\"},{\"db\":\"kotakin\",\"table\":\"tbl_purchase_admin_header\"},{\"db\":\"kotakin\",\"table\":\"tbl_purchase_admin_detail\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('kotakin', 'tbl_purchase_admin_return', 'id_purchase');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'kotakin', 'tbl_product_header', '{\"sorted_col\":\"`published_date` DESC\"}', '2022-03-23 03:15:32'),
('root', 'kotakin', 'tbl_product_varian', '{\"sorted_col\":\"`id_product_header` ASC\"}', '2022-03-23 03:15:28'),
('root', 'kotakin', 'tbl_purchase_admin_detail', '{\"sorted_col\":\"`id_purchase_detail` ASC\"}', '2022-03-24 19:16:13'),
('root', 'kotakin', 'tbl_return', '{\"sorted_col\":\"`refund_approval_receipt`  DESC\"}', '2022-03-23 03:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-03-30 17:35:09', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":336}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `pustaka-api`
--
CREATE DATABASE IF NOT EXISTS `pustaka-api` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pustaka-api`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) NOT NULL,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `rating` bigint(20) DEFAULT NULL,
  `create_at` datetime(3) DEFAULT NULL,
  `update_at` datetime(3) DEFAULT NULL,
  `discount` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `price`, `rating`, `create_at`, `update_at`, `discount`) VALUES
(2, 'EKI Stark', 'ini adalah orang kaya TAMVAN dan pintar', 9999, 5, '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 25),
(3, 'Toni Stark', 'ini adalah orang kaya TAMVAN dan pintar', 9999, 5, '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 25),
(4, 'scarlet witch', 'Good Book', 30000, 4, '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 35),
(5, 'Gundam', '', 30000, 0, '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 0),
(6, 'Gundam', '', 30000, 0, '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 0),
(7, 'Gundam', 'Good Book', 30000, 4, '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 35),
(8, 'testing', 'belajar golang', 20000, 5, '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 25);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`) VALUES
(1, 'belajar golang'),
(2, 'belajar golang 2'),
(3, 'belajar golang 5');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) NOT NULL,
  `name` longtext DEFAULT NULL,
  `avatar` longtext DEFAULT NULL,
  `followers` bigint(20) DEFAULT NULL,
  `status` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `avatar`, `followers`, `status`) VALUES
(1, 'joni', 'https://testing.jpeg', 9999999, 'false'),
(2, 'joni', 'https://testing.jpeg', 9999999, 'false'),
(3, 'joni', 'https://testing.jpeg', 9999999, 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `ticket`
--
CREATE DATABASE IF NOT EXISTS `ticket` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ticket`;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `start_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `category`, `start_datetime`) VALUES
(1, 'Justin Bieber world tour', 'Audition', '2022-03-30 17:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

CREATE TABLE `ticket_type` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `ticket_name` varchar(50) NOT NULL,
  `price` decimal(50,0) NOT NULL,
  `capacity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`id`, `event_id`, `ticket_name`, `price`, `capacity`) VALUES
(1, 1, 'Justin Bieber world tour', '10000000', 2),
(3, 1, 'Justin Bieber world Tour 2022', '10000000', 3),
(4, 1, 'Justin Bieber world Tour 2022', '10000000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `user_id`, `ticket_type_id`) VALUES
(1, 1, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `user_like`
--

CREATE TABLE `user_like` (
  `user_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_like`
--

INSERT INTO `user_like` (`user_id`, `category`) VALUES
(1, 'Audition');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_type`
--
ALTER TABLE `ticket_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_like`
--
ALTER TABLE `user_like`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_type`
--
ALTER TABLE `ticket_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `tokoin`
--
CREATE DATABASE IF NOT EXISTS `tokoin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tokoin`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
