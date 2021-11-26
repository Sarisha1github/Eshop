-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2021 at 06:55 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add signup_tbl', 7, 'add_signup_tbl'),
(26, 'Can change signup_tbl', 7, 'change_signup_tbl'),
(27, 'Can delete signup_tbl', 7, 'delete_signup_tbl'),
(28, 'Can view signup_tbl', 7, 'view_signup_tbl'),
(29, 'Can add admin_signup', 8, 'add_admin_signup'),
(30, 'Can change admin_signup', 8, 'change_admin_signup'),
(31, 'Can delete admin_signup', 8, 'delete_admin_signup'),
(32, 'Can view admin_signup', 8, 'view_admin_signup'),
(33, 'Can add admin_signup_tb', 8, 'add_admin_signup_tb'),
(34, 'Can change admin_signup_tb', 8, 'change_admin_signup_tb'),
(35, 'Can delete admin_signup_tb', 8, 'delete_admin_signup_tb'),
(36, 'Can view admin_signup_tb', 8, 'view_admin_signup_tb'),
(37, 'Can add product_add', 9, 'add_product_add'),
(38, 'Can change product_add', 9, 'change_product_add'),
(39, 'Can delete product_add', 9, 'delete_product_add'),
(40, 'Can view product_add', 9, 'view_product_add'),
(41, 'Can add cart_tbl', 10, 'add_cart_tbl'),
(42, 'Can change cart_tbl', 10, 'change_cart_tbl'),
(43, 'Can delete cart_tbl', 10, 'delete_cart_tbl'),
(44, 'Can view cart_tbl', 10, 'view_cart_tbl');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'shopapp', 'admin_signup_tb'),
(10, 'shopapp', 'cart_tbl'),
(9, 'shopapp', 'product_add'),
(7, 'shopapp', 'signup_tbl');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-13 07:21:13.573722'),
(2, 'auth', '0001_initial', '2021-10-13 07:21:21.944544'),
(3, 'admin', '0001_initial', '2021-10-13 07:21:23.696166'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-10-13 07:21:23.776126'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-13 07:21:23.810606'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-10-13 07:21:24.511640'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-10-13 07:21:25.260352'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-10-13 07:21:25.356390'),
(9, 'auth', '0004_alter_user_username_opts', '2021-10-13 07:21:25.397227'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-10-13 07:21:25.983817'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-10-13 07:21:26.076066'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-10-13 07:21:26.166472'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-10-13 07:21:26.278067'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-10-13 07:21:26.635508'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-10-13 07:21:26.815825'),
(16, 'auth', '0011_update_proxy_permissions', '2021-10-13 07:21:26.896516'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-10-13 07:21:27.058496'),
(18, 'sessions', '0001_initial', '2021-10-13 07:21:28.047673'),
(19, 'shopapp', '0001_initial', '2021-10-13 07:21:28.316047'),
(20, 'shopapp', '0002_admin_signup', '2021-11-05 06:13:36.751568'),
(21, 'shopapp', '0003_rename_admin_signup_admin_signup_tb', '2021-11-05 06:49:19.973655'),
(22, 'shopapp', '0004_admin_signup_tb_hpassword', '2021-11-05 06:57:34.733993'),
(23, 'shopapp', '0005_product_add', '2021-11-09 07:16:52.484295'),
(24, 'shopapp', '0006_product_add_status', '2021-11-22 05:33:39.144935'),
(25, 'shopapp', '0007_signup_tbl_status', '2021-11-23 07:14:30.474590'),
(26, 'shopapp', '0008_auto_20211124_1403', '2021-11-24 08:33:47.828283'),
(27, 'shopapp', '0009_alter_product_add_quantity', '2021-11-24 08:34:28.989313'),
(28, 'shopapp', '0010_cart_tbl_status', '2021-11-24 10:40:41.956706'),
(29, 'shopapp', '0011_alter_cart_tbl_status', '2021-11-24 10:45:57.156460');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7fs27dwdy7kmdm72gzjw6nntrltfzsb8', 'eyJuYW1lIjoic2FyaXNoYSIsImFpZCI6OH0:1mpNPH:TSXdKNUterLQUVNEn57AIiIBKeA3-1bk81sx3nCkdWY', '2021-12-07 04:27:47.631883'),
('tmozg09ftw9csndlwp9zf5tuh13cvkrj', 'eyJhaWQiOjksIm5hbWUiOiJhZG1pbiJ9:1mq7iF:b27hohvKqex11hvnK7JQCBJJj65UOjr-4ljHdY6_weM', '2021-12-09 05:54:27.944700');

-- --------------------------------------------------------

--
-- Table structure for table `shopapp_admin_signup_tb`
--

CREATE TABLE `shopapp_admin_signup_tb` (
  `id` bigint(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hpassword` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopapp_admin_signup_tb`
--

INSERT INTO `shopapp_admin_signup_tb` (`id`, `firstname`, `lastname`, `email`, `gender`, `password`, `hpassword`) VALUES
(1, 'sarisha', 'm', 'admin@gmail.com', 'on', 'admin', ''),
(2, 'sarisha', 'm', 'admin@gmail.com', 'on', 'admin', ''),
(3, 'sarisha', 'm', 'admin@gmail.com', 'on', 'admin', ''),
(4, 'sarisha', 'm', 'admin@gmail.com', 'on', 'admin', ''),
(5, 'admin', '.', '123@gmail.com', 'on', '12345', '827ccb0eea8a706c4c34a16891f84e7b'),
(6, 'sarisha', 'm', 'sarishakottila@gmail.com', 'on', '5555', '6074c6aa3488f3c2dddff2a7ca821aab'),
(7, 'prathyusha', 'k', 'prathyushapachu985@gmail.com', 'on', '1010', '1e48c4420b7073bc11916c6c1de226bb'),
(8, 'sarisha', 'v', 'sarishabajesh@gmail.om', 'female', '1111', 'b59c67bf196a4758191e42f76670ceba'),
(9, 'admin', '123', 'admin123@gmail.com', 'male', '12345', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `shopapp_cart_tbl`
--

CREATE TABLE `shopapp_cart_tbl` (
  `id` bigint(20) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `unitprice` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `pid_id` bigint(20) DEFAULT NULL,
  `userid_id` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopapp_cart_tbl`
--

INSERT INTO `shopapp_cart_tbl` (`id`, `quantity`, `total`, `unitprice`, `date`, `pid_id`, `userid_id`, `status`) VALUES
(21, '1', '1098', '999', '2021-11-25 11:06:50.176104', 1, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `shopapp_product_add`
--

CREATE TABLE `shopapp_product_add` (
  `id` bigint(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopapp_product_add`
--

INSERT INTO `shopapp_product_add` (`id`, `category`, `productname`, `price`, `image`, `description`, `status`, `quantity`) VALUES
(1, 'Men', 'shirt', '999', 'produts/shirt1.jfif', 'The by ford rich cotton shirt with perfect fit and', 'rejected', '9'),
(2, 'Women', 'kurtis', '1050', 'produts/kurtis.jfif', 'Pink Kurtas & Kurtis for Women by Jaipur Kurti', 'rejected', '10'),
(3, 'Women', 'saree', '2000', 'produts/saree.jfif', 'satin Georgette Saree in Shaded Blue Enhanced', 'rejected', '10'),
(4, 'Men', 'T shirt', '500', 'produts/tshirts.jfif', 'black color short sleev mens tshirt', 'rejected', '10'),
(5, 'Men', 'T shirt', '699', 'produts/tshirt1.jfif', 'peach color mens tshirt', 'approved', '10'),
(6, 'Women', 'T shirt', '1000', 'produts/wtshirt.jfif', 'black and red combo womens tshirt', 'approved', '10'),
(7, 'Women', 'salwar', '3000', 'produts/salwar.jfif', 'red art silk salwar suit', 'rejected', '10'),
(9, 'Men', 'shirt', '1699', 'produts/shrt.jfif', 'cotton blue checked shirt ', 'approved', '10'),
(10, 'Women', 'salwar', '999', 'produts/sall.jfif', 'white casual salwar suit', 'approved', '10'),
(11, 'Women', 'saree', '4000', 'produts/saree_FBLuxce.jfif', 'blue color silk saree', 'approved', '10'),
(12, 'Men', 'shirt', '999', 'produts/shirt.png', 'white colour pure cotton shirt', 'approved', '10'),
(13, 'Men', 'shirt', '599', 'produts/shirt1_N23yjfC.jfif', 'black and white cotton mens shirt', 'approved', '10');

-- --------------------------------------------------------

--
-- Table structure for table `shopapp_signup_tbl`
--

CREATE TABLE `shopapp_signup_tbl` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopapp_signup_tbl`
--

INSERT INTO `shopapp_signup_tbl` (`id`, `name`, `email`, `password`, `status`) VALUES
(1, 'sarisha', 'sari@gmail.com', '0000', 'approved'),
(2, 'swathi', 'swa@gmail.com', '5555', 'rejected'),
(3, 'swathi', 'swa@gmail.com', '5555', 'rejected'),
(4, 'swathi', 'swa@gmail.com', '5555', 'rejected'),
(5, 'swathi', 'swa@gmail.com', '5555', 'rejected'),
(6, 'swathi', 'swa@gmail.com', '5555', 'rejected'),
(7, 'ajay', 'ajaymanoj66@gmail.com', '12345', 'approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `shopapp_admin_signup_tb`
--
ALTER TABLE `shopapp_admin_signup_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopapp_cart_tbl`
--
ALTER TABLE `shopapp_cart_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shopapp_cart_tbl_pid_id_795c683a_fk_shopapp_product_add_id` (`pid_id`),
  ADD KEY `shopapp_cart_tbl_userid_id_c49bf897_fk_shopapp_signup_tbl_id` (`userid_id`);

--
-- Indexes for table `shopapp_product_add`
--
ALTER TABLE `shopapp_product_add`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopapp_signup_tbl`
--
ALTER TABLE `shopapp_signup_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `shopapp_admin_signup_tb`
--
ALTER TABLE `shopapp_admin_signup_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shopapp_cart_tbl`
--
ALTER TABLE `shopapp_cart_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `shopapp_product_add`
--
ALTER TABLE `shopapp_product_add`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shopapp_signup_tbl`
--
ALTER TABLE `shopapp_signup_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `shopapp_cart_tbl`
--
ALTER TABLE `shopapp_cart_tbl`
  ADD CONSTRAINT `shopapp_cart_tbl_pid_id_795c683a_fk_shopapp_product_add_id` FOREIGN KEY (`pid_id`) REFERENCES `shopapp_product_add` (`id`),
  ADD CONSTRAINT `shopapp_cart_tbl_userid_id_c49bf897_fk_shopapp_signup_tbl_id` FOREIGN KEY (`userid_id`) REFERENCES `shopapp_signup_tbl` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
