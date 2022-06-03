-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2022 at 01:14 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gadget_geek`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `category_id`) VALUES
('acdt', 'acer', 'dt'),
('aclt', 'acer', 'lt'),
('amdt', 'amd', 'dt'),
('apldt', 'apple', 'dt'),
('aplgg', 'apple', 'gg'),
('apll', 'apple', 'lt'),
('aplm', 'apple', 'mb'),
('aplt', 'apple', 'tl'),
('asdt', 'asus', 'dt'),
('aslt', 'asus', 'lt'),
('asm', 'asus', 'mb'),
('astl', 'asus', 'tl'),
('axsc', 'axis', 'sc'),
('aztl', 'amazon', 'tl'),
('cnavc', 'canon', 'avc'),
('cndc', 'canon', 'dc'),
('djavc', 'dji', 'avc'),
('djgg', 'dji', 'gg'),
('dldt', 'dell', 'dt'),
('dllt', 'dell', 'lt'),
('ffavc', 'fujifilm', 'avc'),
('ffdc', 'fujifilm', 'dc'),
('ggtl', 'google', 'tl'),
('gpavc', 'go pro', 'avc'),
('hpdt', 'hp', 'dt'),
('hplt', 'hp', 'lt'),
('htsc', 'hanwha techwin', 'sc'),
('httl', 'htc', 'tl'),
('hvsc', 'hikvision', 'sc'),
('hwm', 'huawei', 'mb'),
('hwtl', 'huawei', 'tl'),
('ifm', 'infinix', 'mb'),
('itdt', 'intel', 'dt'),
('lnvdt', 'lenovo', 'dt'),
('lnvlt', 'lenovo', 'lt'),
('lnvm', 'lenovo', 'mb'),
('lnvtl', 'lenovo', 'tl'),
('msdt', 'msi', 'dt'),
('msgc', 'microsoft', 'gc'),
('msgg', 'microsoft', 'gg'),
('mslt', 'msi', 'lt'),
('mstl', 'microsoft', 'tl'),
('nddt', 'nvidia', 'dt'),
('nkavc', 'nikon', 'avc'),
('nkdc', 'nikon', 'dc'),
('ntgc', 'nintendo', 'gc'),
('ntgg', 'nintendo', 'gg'),
('oplm', 'oneplus', 'mb'),
('opm', 'oppo', 'mb'),
('psavc', 'panasonic', 'avc'),
('psdc', 'panasonic', 'dc'),
('rmm', 'realme', 'mb'),
('rzlt', 'razer', 'lt'),
('snavc', 'sony', 'avc'),
('sndc', 'sony', 'dc'),
('sndt', 'sony', 'dt'),
('sngc', 'sony', 'gc'),
('sngg', 'sony', 'gg'),
('ssdt', 'samsung', 'dt'),
('ssgg', 'samsung', 'gg'),
('sslt', 'samsung', 'lt'),
('ssm', 'samsung', 'mb'),
('sstl', 'samsung', 'tl'),
('vvm', 'vivo', 'mb'),
('xmm', 'xiaomi', 'mb');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cust_idno` int(50) NOT NULL,
  `prod_id` int(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `item_total` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cust_idno`, `prod_id`, `quantity`, `item_total`) VALUES
(1, 1, 1, 70000.00),
(1, 2, 1, 83900.00);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
('avc', 'action/video camera'),
('dc', 'digital camera'),
('dt', 'desktop'),
('gc', 'gaming console'),
('gg', 'gadget'),
('lt', 'laptop'),
('mb', 'mobile'),
('sc', 'security camera'),
('tl', 'tablet');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_idno` int(50) NOT NULL,
  `fname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_idno`, `fname`, `lname`, `email`, `phone`, `password`) VALUES
(1, 'reevenn', 'beltran', 'evilmaster26@gmail.com', '09123456789', 'noe'),
(2, 'jude', 'yhnnel', 'evilmaster26@gmail.com', '12345687911', '123'),
(3, 'joshua', 'palay', 'palayjoshua@gmail.com', '09112233445', 'josh'),
(4, 'james', 'gutang', 'jamesuriel@gmail.com', '09123456789', 'uriel');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(10) NOT NULL,
  `prod_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_sold` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `category_id`, `brand_id`, `price`, `image`, `rating`, `description`, `num_sold`) VALUES
(1, 'iPhone 13 pro max', 'mb', 'aplm', '70000.00', 'product_image/iphone13promax.png', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0),
(2, 'MacBook pro', 'lt', 'apll', '83900.00', 'product_image/macbookpro.png', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0),
(3, 'iPad pro', 'tl', 'aplt', '62900.00', 'product_image/ipadpro.png', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `cust_idno` (`cust_idno`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_idno`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cust_idno`) REFERENCES `customer` (`cust_idno`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
