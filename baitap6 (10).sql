-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 04, 2022 lúc 01:05 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `baitapnhom6`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `gen_data` ()   begin
  declare i int default 0;
  while i < 20 do
    insert into `tbl_sanpham` (`sanpham_ten`,`sanpham_giatien`,`sanpham_mota`,`danhmucsp_id`) values (concat('sản phẩm',i),20000,'...',9);
    set i = i + 1;
  end while;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `taikhoan_id` int(11) NOT NULL,
  `admin_ten` varchar(55) DEFAULT NULL,
  `admin_sdt` varchar(20) DEFAULT NULL,
  `admin_trangthai` int(11) NOT NULL,
  `admin_anh` varchar(255) DEFAULT NULL,
  `admin_diachi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `taikhoan_id`, `admin_ten`, `admin_sdt`, `admin_trangthai`, `admin_anh`, `admin_diachi`) VALUES
(19, 82, 'admin', '0988777699', 1, '/pictures/admin/19bacxiuda.jpg', 'ádasdas'),
(20, 83, NULL, NULL, 1, NULL, NULL),
(21, 84, NULL, NULL, 1, NULL, NULL),
(22, 85, 'Nhân Viên', NULL, 1, NULL, NULL),
(23, 86, 'Nhân viên', NULL, 1, NULL, NULL),
(24, 87, 'Nguyễn Đức Trung', '0988111222', 1, NULL, NULL),
(25, 90, 'Nguyễn c Trung', '0907544321', 1, NULL, NULL),
(26, 94, 'Nguyễn Đức Tr', '0907544333', 1, NULL, NULL),
(27, 95, 'Nguyễn c Trung', 'aaaaaaa', 1, NULL, NULL),
(28, 96, 'Nguyễn Phong', '0907544321', 1, NULL, NULL),
(29, 97, 'Nguyễn Phong', '0907544333', 1, NULL, NULL),
(30, 98, 'ddddđ', '0907544321', 1, NULL, NULL),
(31, 99, 'Nguyễn Phong', '0907544321', 1, NULL, NULL),
(32, 100, 'Lê V Khải', '0907544321', 1, '/pictures/admin/32anker-sac-3.jpeg', 'fffffff'),
(33, 101, 'Nguyễn Phong khải', '0907544321', 1, NULL, NULL),
(34, 102, 'Nguyễn Đức Trungssss', '-6666666666', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_capnhatsp`
--

CREATE TABLE `tbl_capnhatsp` (
  `capnhatsp_id` int(11) NOT NULL,
  `noidung` int(11) NOT NULL,
  `thoigiancapnhat` datetime NOT NULL,
  `admin_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_capnhattrangthaidonhang`
--

CREATE TABLE `tbl_capnhattrangthaidonhang` (
  `cnttdh_id` int(11) NOT NULL,
  `thoigiancapnhat` time NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `donhang_id` int(11) NOT NULL,
  `ngaycapnhat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_capnhattrangthaidonhang`
--

INSERT INTO `tbl_capnhattrangthaidonhang` (`cnttdh_id`, `thoigiancapnhat`, `noidung`, `admin_id`, `donhang_id`, `ngaycapnhat`) VALUES
(2, '10:40:52', 'Đang giao hàng', 18, 27, '2022-06-29'),
(3, '10:40:58', 'Đã xác nhận', 18, 21, '2022-06-29'),
(4, '10:41:10', 'Đang giao hàng', 18, 25, '2022-06-29'),
(5, '10:43:57', 'Đã xác nhận', 18, 31, '2022-06-29'),
(6, '10:44:10', 'Đang giao hàng', 18, 31, '2022-06-29'),
(7, '10:44:43', 'Đã giao', 18, 31, '2022-06-29'),
(8, '14:53:16', 'Đã xác nhận', 19, 33, '2022-06-30'),
(9, '14:53:50', 'Đang giao hàng', 19, 33, '2022-06-30'),
(10, '14:54:00', 'Đã giao', 19, 33, '2022-06-30'),
(11, '15:18:23', 'Đã xác nhận', 19, 37, '2022-06-30'),
(12, '15:18:26', 'Đã xác nhận', 19, 36, '2022-06-30'),
(13, '15:18:29', 'Đã xác nhận', 19, 35, '2022-06-30'),
(14, '15:18:32', 'Đã xác nhận', 19, 34, '2022-06-30'),
(15, '15:18:47', 'Đang giao hàng', 19, 37, '2022-06-30'),
(16, '15:18:54', 'Đang giao hàng', 19, 36, '2022-06-30'),
(17, '15:19:02', 'Đang giao hàng', 19, 35, '2022-06-30'),
(18, '15:19:08', 'Đang giao hàng', 19, 34, '2022-06-30'),
(19, '15:19:15', 'Đã giao', 19, 37, '2022-06-30'),
(20, '15:19:24', 'Đã giao', 19, 36, '2022-06-30'),
(21, '15:19:31', 'Đã giao', 19, 35, '2022-06-30'),
(22, '15:19:35', 'Đã giao', 19, 34, '2022-06-30'),
(23, '15:23:09', 'Đã xác nhận', 19, 38, '2022-06-20'),
(24, '15:23:13', 'Đang giao hàng', 19, 38, '2022-06-20'),
(25, '15:23:16', 'Đã giao', 19, 38, '2022-06-20'),
(26, '15:24:40', 'Đã xác nhận', 19, 39, '2022-06-20'),
(27, '15:24:44', 'Đang giao hàng', 19, 39, '2022-06-20'),
(28, '15:24:49', 'Đã giao', 19, 39, '2022-06-20'),
(29, '15:35:34', 'Đã xác nhận', 19, 43, '2022-06-21'),
(30, '15:35:37', 'Đã xác nhận', 19, 42, '2022-06-21'),
(31, '15:35:39', 'Đã xác nhận', 19, 41, '2022-06-21'),
(32, '15:35:42', 'Đã xác nhận', 19, 40, '2022-06-21'),
(33, '15:35:48', 'Đang giao hàng', 19, 43, '2022-06-21'),
(34, '15:36:42', 'Đang giao hàng', 19, 42, '2022-06-21'),
(35, '15:36:48', 'Đang giao hàng', 19, 41, '2022-06-21'),
(36, '15:36:53', 'Đang giao hàng', 19, 40, '2022-06-21'),
(37, '15:36:57', 'Đã giao', 19, 43, '2022-06-21'),
(38, '15:37:02', 'Đã giao', 19, 42, '2022-06-21'),
(39, '15:37:05', 'Đã giao', 19, 41, '2022-06-21'),
(40, '15:37:12', 'Đã giao', 19, 40, '2022-06-21'),
(41, '10:56:23', 'Đã xác nhận', 20, 44, '2022-07-01'),
(42, '10:56:28', 'Đang giao hàng', 20, 44, '2022-07-01'),
(43, '10:56:32', 'Đã giao', 20, 44, '2022-07-01'),
(44, '13:12:24', 'Đã xác nhận', 19, 51, '2022-07-01'),
(45, '13:12:27', 'Đã xác nhận', 19, 50, '2022-07-01'),
(46, '13:12:29', 'Đã xác nhận', 19, 49, '2022-07-01'),
(47, '13:12:32', 'Đã xác nhận', 19, 48, '2022-07-01'),
(48, '13:12:35', 'Đã xác nhận', 19, 47, '2022-07-01'),
(49, '13:12:37', 'Đã xác nhận', 19, 46, '2022-07-01'),
(50, '13:12:39', 'Đã xác nhận', 19, 45, '2022-07-01'),
(51, '13:12:44', 'Đang giao hàng', 19, 51, '2022-07-01'),
(52, '13:12:47', 'Đang giao hàng', 19, 50, '2022-07-01'),
(53, '13:12:50', 'Đang giao hàng', 19, 49, '2022-07-01'),
(54, '13:12:54', 'Đang giao hàng', 19, 48, '2022-07-01'),
(55, '13:12:57', 'Đã giao', 19, 51, '2022-07-01'),
(56, '13:13:01', 'Đã giao', 19, 50, '2022-07-01'),
(57, '13:13:05', 'Đã giao', 19, 49, '2022-07-01'),
(58, '13:45:07', 'Đang giao hàng', 19, 47, '2022-07-01'),
(59, '13:45:43', 'Đã giao', 32, 48, '2022-07-01'),
(60, '13:56:01', 'Đã xác nhận', 19, 52, '2022-07-01'),
(61, '13:57:09', 'Đang giao hàng', 19, 52, '2022-07-01'),
(62, '13:57:20', 'Đã giao', 19, 52, '2022-07-01'),
(63, '15:31:49', 'Đã xác nhận', 19, 57, '2022-07-04'),
(64, '16:24:08', 'Đã xác nhận', 19, 58, '2022-07-04'),
(65, '16:24:12', 'Đã xác nhận', 19, 56, '2022-07-04'),
(66, '16:24:15', 'Đã xác nhận', 19, 55, '2022-07-04'),
(67, '16:24:18', 'Đã xác nhận', 19, 54, '2022-07-04'),
(68, '16:24:26', 'Đã giao', 19, 47, '2022-07-04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_chitietdonhang`
--

CREATE TABLE `tbl_chitietdonhang` (
  `chitietdonhang_id` int(11) NOT NULL,
  `donhang_id` int(11) NOT NULL,
  `chitietdonhang_idsp` int(11) DEFAULT NULL,
  `chitietdonhang_soluongsp` int(11) NOT NULL,
  `chitietdonhang_giasp` int(11) NOT NULL,
  `chitietdonhang_tensp` varchar(255) NOT NULL,
  `ngaytao` date NOT NULL,
  `danhgia` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_chitietdonhang`
--

INSERT INTO `tbl_chitietdonhang` (`chitietdonhang_id`, `donhang_id`, `chitietdonhang_idsp`, `chitietdonhang_soluongsp`, `chitietdonhang_giasp`, `chitietdonhang_tensp`, `ngaytao`, `danhgia`) VALUES
(78, 33, 143, 1, 20000, 'Cà phê đen', '2022-06-30', 0),
(79, 33, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-06-30', 0),
(80, 33, 151, 1, 40000, 'matcha đá xay', '2022-06-30', 0),
(81, 34, 145, 1, 15000, 'Cà phê đá', '2022-06-30', 0),
(82, 34, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-06-30', 0),
(83, 34, 148, 1, 35000, 'Espresso đá', '2022-06-30', 0),
(84, 35, 145, 1, 15000, 'Cà phê đá', '2022-06-30', 0),
(85, 35, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-06-30', 0),
(86, 35, 148, 1, 35000, 'Espresso đá', '2022-06-30', 0),
(87, 36, 145, 1, 15000, 'Cà phê đá', '2022-06-30', 0),
(88, 36, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-06-30', 0),
(89, 36, 148, 1, 35000, 'Espresso đá', '2022-06-30', 0),
(90, 37, 145, 1, 15000, 'Cà phê đá', '2022-06-30', 0),
(91, 37, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-06-30', 0),
(92, 38, 151, 1, 40000, 'matcha đá xay', '2022-06-20', 0),
(93, 38, 148, 1, 35000, 'Espresso đá', '2022-06-20', 0),
(94, 39, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-06-20', 0),
(95, 39, 150, 1, 14000, 'Latte đá', '2022-06-20', 0),
(96, 39, 149, 1, 24000, 'Hồng trà Machiato', '2022-06-20', 0),
(97, 40, 145, 5, 15000, 'Cà phê đá', '2022-06-21', 0),
(98, 40, 150, 1, 14000, 'Latte đá', '2022-06-21', 0),
(99, 40, 149, 1, 24000, 'Hồng trà Machiato', '2022-06-21', 0),
(100, 41, 147, 2, 30000, 'Cookie đá xay', '2022-06-21', 0),
(101, 41, 150, 1, 14000, 'Latte đá', '2022-06-21', 0),
(102, 42, 153, 1, 32000, 'Trà đào cam sả', '2022-06-21', 0),
(103, 42, 156, 1, 30000, 'Trà sữa trân châu trắng', '2022-06-21', 0),
(104, 42, 157, 1, 12000, 'Trà ô long', '2022-06-21', 0),
(105, 42, 152, 1, 27000, 'Socolo đá', '2022-06-21', 0),
(106, 43, 146, 2, 18000, 'Cà phê sữa đá', '2022-06-21', 1),
(107, 43, 147, 1, 30000, 'Cookie đá xay', '2022-06-21', 1),
(108, 43, 149, 1, 24000, 'Hồng trà Machiato', '2022-06-21', 1),
(109, 43, 157, 1, 12000, 'Trà ô long', '2022-06-21', 0),
(110, 43, 156, 1, 30000, 'Trà sữa trân châu trắng', '2022-06-21', 0),
(111, 43, 155, 1, 21000, 'Trà hạt sen', '2022-06-21', 0),
(112, 44, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-07-01', 1),
(113, 45, 143, 1, 20000, 'Cà phê đen', '2022-07-01', 0),
(114, 46, 143, 1, 20000, 'Cà phê đen', '2022-07-01', 0),
(115, 47, 145, 1, 15000, 'Cà phê đá', '2022-07-01', 0),
(116, 47, 143, 1, 20000, 'Cà phê đen', '2022-07-01', 0),
(117, 48, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-07-01', 0),
(118, 49, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-07-01', 1),
(119, 50, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-07-01', 0),
(120, 51, 144, 8, 25000, 'Trà Sữa Trân Châu', '2022-07-01', 1),
(121, 52, 143, 1, 20000, 'Cà phê đen', '2022-07-01', 1),
(122, 52, 144, 1, 25000, 'Trà Sữa Trân Châu', '2022-07-01', 0),
(123, 52, 146, 5, 18000, 'Cà phê sữa đá', '2022-07-01', 1),
(124, 52, 147, 4, 30000, 'Cookie đá xay', '2022-07-01', 0),
(125, 52, 151, 5, 38000, 'matcha đá xay', '2022-07-01', 1),
(126, 53, 144, 2, 25000, 'Trà Sữa Trân Châu', '2022-07-04', 0),
(127, 53, 145, 2, 15000, 'Cà phê đá', '2022-07-04', 0),
(128, 54, 143, 3, 24000, 'Cà phê đen', '2022-07-04', 0),
(129, 54, 144, 3, 25000, 'Trà Sữa Trân Châu', '2022-07-04', 0),
(130, 55, 144, 5, 25000, 'Trà Sữa Trân Châu', '2022-07-04', 0),
(131, 56, 144, 7, 25000, 'Trà Sữa Trân Châu', '2022-07-04', 0),
(132, 57, 143, 15, 24000, 'Cà phê đen', '2022-07-04', 0),
(133, 58, 143, 4, 24000, 'Cà phê đen', '2022-07-04', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_danhgiasp`
--

CREATE TABLE `tbl_danhgiasp` (
  `danhgiasp_id` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `chitietdonhang_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `danhgiasp_star` int(11) NOT NULL,
  `danhgiasp_anh1` varchar(255) DEFAULT NULL,
  `danhgiasp_anh2` varchar(255) DEFAULT NULL,
  `danhgiasp_anh3` varchar(255) DEFAULT NULL,
  `ngaytao` date NOT NULL,
  `thoigiantao` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_danhgiasp`
--

INSERT INTO `tbl_danhgiasp` (`danhgiasp_id`, `khachhang_id`, `chitietdonhang_id`, `sanpham_id`, `noidung`, `danhgiasp_star`, `danhgiasp_anh1`, `danhgiasp_anh2`, `danhgiasp_anh3`, `ngaytao`, `thoigiantao`) VALUES
(3, 48, 54, 43, 'vvvvv dđ www eeeeee', 3, NULL, NULL, NULL, '2022-06-27', '13:06:27'),
(4, 48, 51, 41, 'vvvbbffffffff', 4, NULL, NULL, NULL, '2022-06-27', '13:09:26'),
(5, 48, 50, 43, 'nnnn vvvv', 5, NULL, NULL, NULL, '2022-06-27', '13:41:24'),
(6, 48, 49, 42, 'cccc', 3, NULL, NULL, NULL, '2022-06-27', '13:42:20'),
(7, 48, 61, 42, 'ccccc', 4, NULL, NULL, NULL, '2022-06-27', '13:44:11'),
(8, 36, 69, 41, 'Uống khá ngon', 4, NULL, NULL, NULL, '2022-06-29', '09:45:39'),
(9, 36, 70, 43, 'tạm tạm', 1, NULL, NULL, NULL, '2022-06-29', '09:47:03'),
(10, 51, 106, 146, 'Uống khá ngon', 4, NULL, NULL, NULL, '2022-06-21', '15:40:52'),
(11, 51, 107, 147, 'Uống khá ngon', 3, NULL, NULL, NULL, '2022-06-21', '15:41:06'),
(12, 51, 108, 149, 'Uống khá ngon', 5, '/pictures/danhgiasp/cookie đá xay.jpg', NULL, NULL, '2022-06-21', '15:41:33'),
(13, 54, 112, 144, 'ngnn', 5, '/pictures/danhgiasp/anker1.jpeg', NULL, NULL, '2022-07-01', '10:56:55'),
(14, 54, 120, 144, 'ngon, rẻ', 4, NULL, NULL, NULL, '2022-07-01', '13:54:17'),
(15, 54, 118, 144, '..............', 4, NULL, NULL, NULL, '2022-07-01', '13:54:30'),
(16, 54, 121, 143, '........Giá rẻ', 3, '/pictures/danhgiasp/ss-op-2.jpeg', NULL, NULL, '2022-07-01', '13:57:58'),
(17, 54, 123, 146, 'sản phẩm chất lượng', 0, '/pictures/danhgiasp/Screenshot (16).png', NULL, NULL, '2022-07-01', '13:58:25'),
(18, 54, 125, 151, 'tạm đc', 3, '/pictures/danhgiasp/matcha đá xay.jpg', NULL, NULL, '2022-07-01', '13:59:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_danhmucsp`
--

CREATE TABLE `tbl_danhmucsp` (
  `danhmucsp_id` int(11) NOT NULL,
  `danhmucsp_ten` varchar(55) NOT NULL,
  `danhmucsp_mota` varchar(255) DEFAULT NULL,
  `danhmucsp_trangthai` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_danhmucsp`
--

INSERT INTO `tbl_danhmucsp` (`danhmucsp_id`, `danhmucsp_ten`, `danhmucsp_mota`, `danhmucsp_trangthai`) VALUES
(1, 'cà phê', '...', 1),
(2, 'soda và mojito', '...', 1),
(3, 'trà', '...', 1),
(6, 'sinh tố', '...', 1),
(7, 'trà sữa', '...', 1),
(9, 'nước ép', '...', 1),
(99, 'khác', '...', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_diachikh`
--

CREATE TABLE `tbl_diachikh` (
  `diachikh_id` int(11) NOT NULL,
  `khuvucgh_id` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `diachichitiet` varchar(355) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_donhang`
--

CREATE TABLE `tbl_donhang` (
  `donhang_id` int(11) NOT NULL,
  `trangthaidonhang_id` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `phuongthucthanhtoan` int(11) NOT NULL,
  `tongtien` int(11) NOT NULL,
  `phivanchuyen` int(11) DEFAULT NULL,
  `ngaytao` date DEFAULT NULL,
  `thoigiantao` time NOT NULL,
  `nguoinhan_ghichu` varchar(255) DEFAULT NULL,
  `nguoigiao_ten` varchar(55) DEFAULT NULL,
  `nguoigiao_sdt` varchar(20) DEFAULT NULL,
  `thoigiangiao` int(11) DEFAULT NULL,
  `giamgia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_donhang`
--

INSERT INTO `tbl_donhang` (`donhang_id`, `trangthaidonhang_id`, `khachhang_id`, `phuongthucthanhtoan`, `tongtien`, `phivanchuyen`, `ngaytao`, `thoigiantao`, `nguoinhan_ghichu`, `nguoigiao_ten`, `nguoigiao_sdt`, `thoigiangiao`, `giamgia`) VALUES
(33, 4, 53, 1, 110000, 25000, '2022-06-30', '14:31:49', '', NULL, NULL, 5, 0),
(34, 4, 51, 1, 95000, 20000, '2022-06-30', '15:11:30', '', NULL, NULL, 30, 0),
(35, 4, 51, 1, 80000, 20000, '2022-06-30', '15:11:55', '', NULL, NULL, 30, 15000),
(36, 4, 51, 1, 95000, 20000, '2022-06-30', '15:12:57', '', NULL, NULL, 30, 0),
(37, 4, 51, 1, 60000, 20000, '2022-06-30', '15:17:11', '', NULL, NULL, 30, 0),
(38, 4, 51, 1, 95000, 20000, '2022-06-20', '15:22:18', '', NULL, NULL, 30, 0),
(39, 4, 51, 1, 83000, 20000, '2022-06-20', '15:24:19', '', NULL, NULL, 30, 0),
(40, 4, 51, 1, 133000, 20000, '2022-06-21', '15:26:39', '', NULL, NULL, 30, 0),
(41, 4, 51, 1, 94000, 20000, '2022-06-21', '15:27:14', '', NULL, NULL, 30, 0),
(42, 4, 51, 1, 121000, 20000, '2022-06-21', '15:27:49', '', NULL, NULL, 30, 0),
(43, 4, 51, 1, 173000, 20000, '2022-06-21', '15:28:21', '', NULL, NULL, 30, 0),
(44, 4, 54, 1, 30000, 10000, '2022-07-01', '10:56:05', '', 'Nguyễn Trung', '123456789', 10, 5000),
(45, 2, 54, 1, 30000, 10000, '2022-07-01', '11:34:53', '', NULL, NULL, 10, 0),
(46, 2, 54, 1, 26000, 10000, '2022-07-01', '11:36:52', '', NULL, NULL, 10, 4000),
(47, 4, 54, 1, 45000, 10000, '2022-07-01', '11:41:03', '', NULL, NULL, 10, 0),
(48, 4, 54, 1, 35000, 10000, '2022-07-01', '11:45:17', '', NULL, NULL, 10, 0),
(49, 4, 54, 1, 35000, 10000, '2022-07-01', '11:51:10', '', NULL, NULL, 10, 0),
(50, 4, 54, 1, 35000, 10000, '2022-07-01', '12:00:32', '', NULL, NULL, 10, 0),
(51, 4, 54, 1, 170000, 10000, '2022-07-01', '13:10:07', '....', NULL, NULL, 10, 40000),
(52, 4, 54, 1, 366000, 10000, '2022-07-01', '13:55:27', 'Giao nhanh', NULL, NULL, 10, 89000),
(53, 1, 54, 1, 80000, 10000, '2022-07-04', '10:18:02', '', NULL, NULL, 10, 10000),
(54, 2, 54, 1, 147000, 10000, '2022-07-04', '10:19:43', 'vvvv bbbbbbb', NULL, NULL, 10, 10000),
(55, 2, 54, 1, 135000, 10000, '2022-07-04', '10:23:30', '', NULL, NULL, 10, 0),
(56, 2, 54, 1, 185000, 10000, '2022-07-04', '10:24:35', '', NULL, NULL, 10, 0),
(57, 2, 54, 1, 370000, 10000, '2022-07-04', '13:49:36', '', NULL, NULL, 10, 0),
(58, 2, 54, 1, 121000, 25000, '2022-07-04', '15:40:32', '', NULL, NULL, 5, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_giohang`
--

CREATE TABLE `tbl_giohang` (
  `giohang_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `giohang_soluong` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_giohang`
--

INSERT INTO `tbl_giohang` (`giohang_id`, `sanpham_id`, `giohang_soluong`, `khachhang_id`) VALUES
(87, 143, 1, 53),
(88, 144, 1, 53),
(89, 151, 1, 53),
(116, 143, 1, 51),
(119, 151, 6, 55),
(120, 148, 4, 55),
(121, 153, 4, 55);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_hinhanhsp`
--

CREATE TABLE `tbl_hinhanhsp` (
  `hinhanhsp_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `hinhanhsp_ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_khachhang`
--

CREATE TABLE `tbl_khachhang` (
  `khachhang_id` int(11) NOT NULL,
  `taikhoan_id` int(11) NOT NULL,
  `khuvucgh_id` int(11) DEFAULT NULL,
  `khachhang_ten` varchar(55) DEFAULT NULL,
  `khachhang_email` varchar(55) DEFAULT NULL,
  `khachhang_sdt` varchar(20) DEFAULT NULL,
  `khachhang_anh` varchar(255) DEFAULT NULL,
  `khachhang_diachi` varchar(255) DEFAULT NULL,
  `trangthai_kh` int(11) DEFAULT 1,
  `reset_password_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_khachhang`
--

INSERT INTO `tbl_khachhang` (`khachhang_id`, `taikhoan_id`, `khuvucgh_id`, `khachhang_ten`, `khachhang_email`, `khachhang_sdt`, `khachhang_anh`, `khachhang_diachi`, `trangthai_kh`, `reset_password_token`) VALUES
(51, 81, 3, 'Khải', NULL, '0988777666', '/pictures/khachhang/51bacxiuda.jpg', 'Trung tâm việc làm', 1, NULL),
(53, 88, 4, 'Khải', NULL, '0988777666', '', 'Trung tâm việc làm', 1, NULL),
(54, 89, 10, 'Nguyễn đ Trung200', NULL, '09999111222', '/pictures/khachhang/54anker-sac-1.jpeg', 'Trường ĐHCT, đường 3/2, Cần Thơ', 1, NULL),
(55, 91, 3, 'trung', NULL, '1234567890', '', 'wwwwwww/123/123', 1, NULL),
(56, 92, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(57, 93, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_khuvucgh`
--

CREATE TABLE `tbl_khuvucgh` (
  `khuvucgh_id` int(11) NOT NULL,
  `khuvucgh_ten` varchar(255) NOT NULL,
  `khuvucgh_giatien` int(11) NOT NULL,
  `thoigiangiao` int(11) NOT NULL,
  `khuvucgh_trangthai` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_khuvucgh`
--

INSERT INTO `tbl_khuvucgh` (`khuvucgh_id`, `khuvucgh_ten`, `khuvucgh_giatien`, `thoigiangiao`, `khuvucgh_trangthai`) VALUES
(1, 'Quận 1', 15000, 15, 1),
(2, 'Quận 2', 10000, 10, 1),
(3, 'Quận 3', 20000, 30, 1),
(4, 'Quận 4', 25000, 5, 1),
(8, 'Quận 6', 22222, 23, 1),
(10, 'Quận Ninh kiều', 8000, 20, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_magiamgia`
--

CREATE TABLE `tbl_magiamgia` (
  `magiamgia_id` int(11) NOT NULL,
  `magiamgia_code` varchar(55) NOT NULL,
  `magiamgia_phantram` int(11) NOT NULL,
  `magiamgia_toida` int(11) NOT NULL,
  `magiamgia_soluong` int(11) NOT NULL,
  `magiamgia_ngayhethan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_magiamgia`
--

INSERT INTO `tbl_magiamgia` (`magiamgia_id`, `magiamgia_code`, `magiamgia_phantram`, `magiamgia_toida`, `magiamgia_soluong`, `magiamgia_ngayhethan`) VALUES
(1, 'abcdef', 44, 10000, 8, '2022-05-16'),
(2, 'qwerty', 20, 10000, 14, '2022-08-28'),
(5, 'giamgia17', 15, 20000, 9, '2022-07-09'),
(6, 'abchty206', 10, 10000, 9, '2022-07-22'),
(7, 'giamgia307', 25, 20000, 33, '2022-07-17'),
(8, 'cacaocacao', 13, 44444, 5, '2022-07-21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_phanquyen`
--

CREATE TABLE `tbl_phanquyen` (
  `taikhoan_id` int(11) NOT NULL,
  `vaitro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_phanquyen`
--

INSERT INTO `tbl_phanquyen` (`taikhoan_id`, `vaitro_id`) VALUES
(81, 25),
(82, 23),
(83, 24),
(84, 24),
(85, 24),
(86, 24),
(87, 24),
(88, 25),
(89, 25),
(90, 24),
(91, 25),
(92, 25),
(93, 25),
(94, 24),
(95, 24),
(96, 24),
(97, 24),
(98, 24),
(99, 24),
(100, 24),
(101, 24),
(102, 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_sanpham`
--

CREATE TABLE `tbl_sanpham` (
  `sanpham_id` int(11) NOT NULL,
  `sanpham_ten` varchar(55) NOT NULL,
  `sanpham_giatien` int(11) NOT NULL,
  `sanpham_mota` varchar(255) NOT NULL,
  `sanpham_anhchinh` varchar(255) DEFAULT NULL,
  `sanpham_trangthai` int(1) NOT NULL DEFAULT 1,
  `thoigiantao` time DEFAULT NULL,
  `ngaytao` date DEFAULT NULL,
  `sanpham_daban` int(11) DEFAULT 0,
  `sanpham_giacu` int(11) DEFAULT 0,
  `danhmucsp_id` int(11) NOT NULL,
  `danhgia` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_sanpham`
--

INSERT INTO `tbl_sanpham` (`sanpham_id`, `sanpham_ten`, `sanpham_giatien`, `sanpham_mota`, `sanpham_anhchinh`, `sanpham_trangthai`, `thoigiantao`, `ngaytao`, `sanpham_daban`, `sanpham_giacu`, `danhmucsp_id`, `danhgia`) VALUES
(143, 'Cà phê đen', 24000, 'Cà phê đen đá', '/pictures/sanpham/1473bacxiuda.jpg', 1, NULL, NULL, 1, 0, 1, 0),
(144, 'Trà Sữa Trân Châu', 25000, 'Trà sữa trân châu', '/pictures/sanpham/2869Trà sữa trân châu.jpg', 1, NULL, NULL, 19, 0, 3, 4.3),
(145, 'Cà phê đá', 15000, 'Cà phê đen đá', '/pictures/sanpham/441cafeda.jpg', 1, NULL, NULL, 10, 0, 1, 0),
(146, 'Cà phê sữa đá', 18000, 'Cà phê sữa đá', '/pictures/sanpham/9918cafesuada.jpg', 1, NULL, NULL, 7, 0, 1, 2),
(147, 'Cookie đá xay', 30000, 'Cookie đá xay', '/pictures/sanpham/1527cookie đá xay.jpg', 1, NULL, NULL, 7, 0, 6, 3),
(148, 'Espresso đá', 35000, 'Espresso đá', '/pictures/sanpham/232Espresso_da.jpg', 1, NULL, NULL, 0, 0, 9, 0),
(149, 'Hồng trà Machiato', 24000, 'Hồng trà Machiato được làm từ trà Machiato', '/pictures/sanpham/4575Hồng trà Machiato.jpg', 1, NULL, NULL, 3, 0, 3, 5),
(150, 'Latte đá', 14000, 'Latte đá là thức uống hàng đầu', '/pictures/sanpham/3302Latte_da.jpg', 1, NULL, NULL, 0, 0, 2, 0),
(151, 'matcha đá xay', 38000, 'matcha đá xay thơm ngon ', '/pictures/sanpham/540matcha đá xay.jpg', 1, NULL, NULL, 5, 0, 6, 3),
(152, 'Socolo đá', 27000, 'Socola đá được làm từ socola nguyên chất ', '/pictures/sanpham/8168socala đá.jpg', 1, NULL, NULL, 1, 0, 99, 0),
(153, 'Trà đào cam sả', 32000, 'Trà đào cam sả được làm từ đào', '/pictures/sanpham/6413Trà đà cam sả.jpg', 1, NULL, NULL, 1, 0, 3, 0),
(154, 'Trà đen machiato', 17000, 'Trà đen machiato', '/pictures/sanpham/5304Trà đen machiato (1).jpg', 1, NULL, NULL, 0, 0, 3, 0),
(155, 'Trà hạt sen', 21000, 'Thức uống bổ dưỡng làm từ hạt sen', '/pictures/sanpham/7520Tra hat sen.jpg', 1, NULL, NULL, 1, 0, 3, 0),
(156, 'Trà sữa trân châu trắng', 30000, 'Thức uống giải khát mùa hè', '/pictures/sanpham/2946Trà sữa trân châu trắng.jpg', 1, NULL, NULL, 2, 0, 7, 0),
(157, 'Trà ô long', 12000, 'Thức uống giải khát mùa hè', '/pictures/sanpham/86TraOlong nhan hat chia.jpg', 1, NULL, NULL, 2, 0, 3, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_taikhoan`
--

CREATE TABLE `tbl_taikhoan` (
  `taikhoan_id` int(11) NOT NULL,
  `taikhoan` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `taikhoan_trangthai` int(1) DEFAULT 1,
  `thoigiantao` time DEFAULT NULL,
  `ngaytao` date DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `email` varchar(55) NOT NULL,
  `token_ngaytao` date DEFAULT '2015-05-05',
  `reset_token_solan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_taikhoan`
--

INSERT INTO `tbl_taikhoan` (`taikhoan_id`, `taikhoan`, `matkhau`, `taikhoan_trangthai`, `thoigiantao`, `ngaytao`, `reset_password_token`, `email`, `token_ngaytao`, `reset_token_solan`) VALUES
(81, 'lvkhai', '{bcrypt}$2a$10$o9nBCi3UuFyxdNHBm4eRxObn6CYmjkpyHZDXV7r.WpXA.BoS7sFgO', NULL, '09:12:10', '2022-06-30', NULL, 'vietkhaile99@gmail.com', NULL, 0),
(82, 'admin', '{bcrypt}$2a$10$3sbZSv.hjUJQ1TsfDtpfAONGt2voFTnSRk7M59US3CCq.jBjGrN4C', NULL, '09:25:34', '2022-06-30', NULL, 'admin@gmail.com', NULL, 0),
(83, 'nhanvien01', '{bcrypt}$2a$10$qTAJ7aaadBE6RJvhdJL0suzY3aGTMDKKmy6JowRXqangDb8vYAt9C', NULL, '09:56:23', '2022-06-30', NULL, '', NULL, 0),
(84, 'nhanvien02', '{bcrypt}$2a$10$3Fcil7ogtyXR9gKUJuxyH.3Llm9Yj9HKb002RmAVyX53CUe9jr4Ju', NULL, '10:11:02', '2022-06-30', NULL, '', NULL, 0),
(85, 'nhavien03', '{bcrypt}$2a$10$EYlKOIr782rdToXDs3B15uaSQwMa84ex82goVfGNdRQZM75/2VSwG', NULL, '10:17:07', '2022-06-30', NULL, 'nhanvien@gmail.com', NULL, 0),
(86, 'nhanvien0122', '{bcrypt}$2a$10$986YaK1VYja7XIDyzGM5jOnkegOH/x4VNr5FZS2jR0ZMI6WlGOmli', NULL, '10:29:58', '2022-06-30', NULL, 'nhanvien0122@gmail.com', NULL, 0),
(87, 'trung0012', '{bcrypt}$2a$10$fBnxNClmMNS8wyBxVNAtdeOSItanrWxCkt7BDGXY1iHsECj9HO4ai', NULL, '14:25:26', '2022-06-30', NULL, 'trungnguyen@gmail.com', NULL, 0),
(88, 'lvkhai99', '{bcrypt}$2a$10$D/vohoFpk2Ec/YLp4Gyyb.KId1j642xoh6LhBUgDTVGDCBQorFcne', NULL, '14:27:43', '2022-06-30', NULL, 'khai@1234gmail.com', NULL, 0),
(89, 'dtrung200', '{bcrypt}$2a$10$tI9YUXTcxnpQEGABSAj4wu9PidEUQPCPJPYaFtdZoBED0qzhFGlpS', NULL, '07:12:53', '2022-07-01', 'o09OqZPvXFOynPv3okbq0zv2YiJIUJ', 'ngntrung12520@gmail.com', '2022-07-04', 4),
(90, 'nvtrung', '{bcrypt}$2a$10$WsDqFtYvUl6/aZBBerOr3erzwTPBuG1WoHhK7WNe6GjmxdZ24GnGi', NULL, '08:23:43', '2022-07-01', NULL, 'trung@gmail.com', NULL, 0),
(91, 'trung123456', '{bcrypt}$2a$10$BYhMHRGcBHOZU91cGghO5eUXCUAJHRxoX3hgJ9axL8Xx6enDPz0bG', NULL, '08:38:06', '2022-07-01', NULL, 'ddddsssssS@gmail.com', NULL, 0),
(92, 'trung666', '{bcrypt}$2a$10$9TEtdHoarTu/IOA.W63KXuz5/Ghcv1E66e/cInl.bVls96SSsGTVS', NULL, '10:15:54', '2022-07-01', NULL, 'nnnn@gmail.com', NULL, 0),
(93, 'abc123', '{bcrypt}$2a$10$6LqU5FfjEAz4oOGFXOPKTuK9R5YUC6b48pTbD8.mDWQDjFeHiq9kW', NULL, '10:16:47', '2022-07-01', NULL, 'nguyenphong@gmail.com', NULL, 0),
(94, 'nhanvien100', '{bcrypt}$2a$10$AkAYNNvGPC6Y/MuisedziuqSGnc2r8FclZO37.175HfbFtsLs3lS6', NULL, '13:20:32', '2022-07-01', NULL, 'mmmm@gmail.com', NULL, 0),
(95, 'nhanvien200', '{bcrypt}$2a$10$TjR1MQJuubD7a6KrS9r5o.K33rSK6af1/qm4rhJEW7FJPnxk1PoqW', NULL, '13:21:02', '2022-07-01', NULL, 'trung123455@gmail.com', NULL, 0),
(96, 'nhanvien999', '{bcrypt}$2a$10$lzNnY2yfYZMbLo8pCFwbG.anPhPaxJIGFLk07U99Q//KJQtgdJ7Sm', NULL, '13:25:11', '2022-07-01', NULL, 'nguyenphongxxxx@gmail.com', NULL, 0),
(97, 'nhanvientrung3', '{bcrypt}$2a$10$FBWlFpTIFQCtGnIJCfc5V.TNzL4PFjA25/MEji4PU8Yrg.IDjkhtG', NULL, '13:29:18', '2022-07-01', NULL, 'nguyenphong3344@gmail.com', NULL, 0),
(98, 'nnnnnn', '{bcrypt}$2a$10$scIQ770WPphLZghlxE63FOVHg/SufNEFR9iaEEDmTfRw.nblxaS8e', NULL, '13:31:48', '2022-07-01', NULL, 'ddd@gmail.com', NULL, 0),
(99, 'nvabc1', '{bcrypt}$2a$10$vhd8Hd9hwtgKVhF/R7rKJ.QZDym8mwXTzQou3KLQfa5UIX4ZafHn6', NULL, '13:34:17', '2022-07-01', NULL, 'naaaaguyenphong@gmail.com', NULL, 0),
(100, 'nvkhai1', '{bcrypt}$2a$10$nPO7fozf7ZrlA.tC6f.X6uW3ybzoMk3h5OlA514MsEEk5r8RnQSK6', NULL, '13:37:02', '2022-07-01', NULL, 'khai1234@gmail.com', NULL, 0),
(101, 'nvkhai2', '{bcrypt}$2a$10$SWNrdMEaP9dhnW7zv9cB0OBCFMJOCNdADIigJfEMt2mpMHMPrBxuG', NULL, '15:29:51', '2022-07-01', NULL, 'nguyenphongzzz@gmail.com', NULL, 0),
(102, 'ndtrung4444', '{bcrypt}$2a$10$ImT3PkOFEv.nzD4xQh8MD.xVzysCf1I1aEx7onr3BV9rtBlYhzoO.', NULL, '16:08:22', '2022-07-01', NULL, 'nnnnsssss@gmail.com', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_trangthaidonhang`
--

CREATE TABLE `tbl_trangthaidonhang` (
  `trangthaidonhang_id` int(11) NOT NULL,
  `trangthaidonhang_ten` varchar(255) NOT NULL,
  `ghichu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_trangthaidonhang`
--

INSERT INTO `tbl_trangthaidonhang` (`trangthaidonhang_id`, `trangthaidonhang_ten`, `ghichu`) VALUES
(1, 'chờ xác nhận', 'chờ xác nhận: khách hàng có thể cập nhật số lượng sản phẩm, hủy đơn hàng'),
(2, 'đã xác nhận', 'cửa hàng đang chuẩn bị sản phẩm và giao hàng'),
(3, 'đang giao hàng', NULL),
(4, 'đã giao hàng - hoàn thành đơn hàng', NULL),
(99, 'hủy đơn hàng', 'hủy đơn hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_vaitro`
--

CREATE TABLE `tbl_vaitro` (
  `vaitro_id` int(11) NOT NULL,
  `vaitro_ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_vaitro`
--

INSERT INTO `tbl_vaitro` (`vaitro_id`, `vaitro_ten`) VALUES
(23, 'ROLE_ADMIN'),
(24, 'ROLE_NHANVIEN'),
(25, 'ROLE_KHACHHANG');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_vanchuyendh`
--

CREATE TABLE `tbl_vanchuyendh` (
  `vanchuyendh_id` int(11) NOT NULL,
  `nguoigiaohang_ten` varchar(55) DEFAULT NULL,
  `nguoigiaohang_sdt` varchar(55) DEFAULT NULL,
  `nguoinhan_ten` varchar(55) NOT NULL,
  `nguoinhan_diachi` varchar(255) NOT NULL,
  `nguoinhan_sdt` int(11) NOT NULL,
  `nguoinhan_email` varchar(55) NOT NULL,
  `nguoinhan_ghichu` varchar(255) NOT NULL,
  `donhang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `taikhoan_id` (`taikhoan_id`),
  ADD KEY `fk_admin_tk` (`taikhoan_id`);

--
-- Chỉ mục cho bảng `tbl_capnhatsp`
--
ALTER TABLE `tbl_capnhatsp`
  ADD PRIMARY KEY (`capnhatsp_id`);

--
-- Chỉ mục cho bảng `tbl_capnhattrangthaidonhang`
--
ALTER TABLE `tbl_capnhattrangthaidonhang`
  ADD PRIMARY KEY (`cnttdh_id`);

--
-- Chỉ mục cho bảng `tbl_chitietdonhang`
--
ALTER TABLE `tbl_chitietdonhang`
  ADD PRIMARY KEY (`chitietdonhang_id`),
  ADD KEY `chitietdonhang_idsp` (`chitietdonhang_idsp`);

--
-- Chỉ mục cho bảng `tbl_danhgiasp`
--
ALTER TABLE `tbl_danhgiasp`
  ADD PRIMARY KEY (`danhgiasp_id`);

--
-- Chỉ mục cho bảng `tbl_danhmucsp`
--
ALTER TABLE `tbl_danhmucsp`
  ADD PRIMARY KEY (`danhmucsp_id`);

--
-- Chỉ mục cho bảng `tbl_diachikh`
--
ALTER TABLE `tbl_diachikh`
  ADD PRIMARY KEY (`diachikh_id`),
  ADD KEY `fk_diachikh` (`khuvucgh_id`),
  ADD KEY `fk_diachikh_kh` (`khachhang_id`);

--
-- Chỉ mục cho bảng `tbl_donhang`
--
ALTER TABLE `tbl_donhang`
  ADD PRIMARY KEY (`donhang_id`),
  ADD KEY `fk_donhang_kh` (`khachhang_id`),
  ADD KEY `fk_vanchuyen_ttdh` (`trangthaidonhang_id`);

--
-- Chỉ mục cho bảng `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  ADD PRIMARY KEY (`giohang_id`),
  ADD KEY `fk_giohang_kh` (`khachhang_id`),
  ADD KEY `fk_giohang_sp` (`sanpham_id`);

--
-- Chỉ mục cho bảng `tbl_hinhanhsp`
--
ALTER TABLE `tbl_hinhanhsp`
  ADD PRIMARY KEY (`hinhanhsp_id`),
  ADD KEY `fk_hinhanhsp_sp` (`sanpham_id`);

--
-- Chỉ mục cho bảng `tbl_khachhang`
--
ALTER TABLE `tbl_khachhang`
  ADD PRIMARY KEY (`khachhang_id`),
  ADD UNIQUE KEY `taikhoan_id_2` (`taikhoan_id`),
  ADD KEY `taikhoan_id` (`taikhoan_id`),
  ADD KEY `khuvucgh_id` (`khuvucgh_id`);

--
-- Chỉ mục cho bảng `tbl_khuvucgh`
--
ALTER TABLE `tbl_khuvucgh`
  ADD PRIMARY KEY (`khuvucgh_id`);

--
-- Chỉ mục cho bảng `tbl_magiamgia`
--
ALTER TABLE `tbl_magiamgia`
  ADD PRIMARY KEY (`magiamgia_id`);

--
-- Chỉ mục cho bảng `tbl_phanquyen`
--
ALTER TABLE `tbl_phanquyen`
  ADD KEY `taikhoan_id` (`taikhoan_id`),
  ADD KEY `FKgi9f9iq7d2dbepb3r17yiivfa` (`vaitro_id`);

--
-- Chỉ mục cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD PRIMARY KEY (`sanpham_id`),
  ADD KEY `fk_sanpham_dmsp` (`danhmucsp_id`);

--
-- Chỉ mục cho bảng `tbl_taikhoan`
--
ALTER TABLE `tbl_taikhoan`
  ADD PRIMARY KEY (`taikhoan_id`),
  ADD UNIQUE KEY `taikhoan` (`taikhoan`),
  ADD UNIQUE KEY `taikhoan_2` (`taikhoan`);

--
-- Chỉ mục cho bảng `tbl_trangthaidonhang`
--
ALTER TABLE `tbl_trangthaidonhang`
  ADD PRIMARY KEY (`trangthaidonhang_id`);

--
-- Chỉ mục cho bảng `tbl_vaitro`
--
ALTER TABLE `tbl_vaitro`
  ADD PRIMARY KEY (`vaitro_id`);

--
-- Chỉ mục cho bảng `tbl_vanchuyendh`
--
ALTER TABLE `tbl_vanchuyendh`
  ADD PRIMARY KEY (`vanchuyendh_id`),
  ADD UNIQUE KEY `donhang_id` (`donhang_id`),
  ADD KEY `fk_vanchuyen_dh` (`donhang_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `tbl_capnhatsp`
--
ALTER TABLE `tbl_capnhatsp`
  MODIFY `capnhatsp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_capnhattrangthaidonhang`
--
ALTER TABLE `tbl_capnhattrangthaidonhang`
  MODIFY `cnttdh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `tbl_chitietdonhang`
--
ALTER TABLE `tbl_chitietdonhang`
  MODIFY `chitietdonhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT cho bảng `tbl_danhgiasp`
--
ALTER TABLE `tbl_danhgiasp`
  MODIFY `danhgiasp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tbl_danhmucsp`
--
ALTER TABLE `tbl_danhmucsp`
  MODIFY `danhmucsp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `tbl_diachikh`
--
ALTER TABLE `tbl_diachikh`
  MODIFY `diachikh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_donhang`
--
ALTER TABLE `tbl_donhang`
  MODIFY `donhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  MODIFY `giohang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT cho bảng `tbl_hinhanhsp`
--
ALTER TABLE `tbl_hinhanhsp`
  MODIFY `hinhanhsp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_khachhang`
--
ALTER TABLE `tbl_khachhang`
  MODIFY `khachhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `tbl_khuvucgh`
--
ALTER TABLE `tbl_khuvucgh`
  MODIFY `khuvucgh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tbl_magiamgia`
--
ALTER TABLE `tbl_magiamgia`
  MODIFY `magiamgia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  MODIFY `sanpham_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT cho bảng `tbl_taikhoan`
--
ALTER TABLE `tbl_taikhoan`
  MODIFY `taikhoan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `tbl_vaitro`
--
ALTER TABLE `tbl_vaitro`
  MODIFY `vaitro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT cho bảng `tbl_vanchuyendh`
--
ALTER TABLE `tbl_vanchuyendh`
  MODIFY `vanchuyendh_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD CONSTRAINT `fk_admin_tk` FOREIGN KEY (`taikhoan_id`) REFERENCES `tbl_taikhoan` (`taikhoan_id`);

--
-- Các ràng buộc cho bảng `tbl_chitietdonhang`
--
ALTER TABLE `tbl_chitietdonhang`
  ADD CONSTRAINT `tbl_chitietdonhang_ibfk_1` FOREIGN KEY (`chitietdonhang_idsp`) REFERENCES `tbl_sanpham` (`sanpham_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Các ràng buộc cho bảng `tbl_diachikh`
--
ALTER TABLE `tbl_diachikh`
  ADD CONSTRAINT `fk_diachikh` FOREIGN KEY (`khuvucgh_id`) REFERENCES `tbl_khuvucgh` (`khuvucgh_id`),
  ADD CONSTRAINT `fk_diachikh_kh` FOREIGN KEY (`khachhang_id`) REFERENCES `tbl_khachhang` (`khachhang_id`);

--
-- Các ràng buộc cho bảng `tbl_donhang`
--
ALTER TABLE `tbl_donhang`
  ADD CONSTRAINT `fk_donhang_kh` FOREIGN KEY (`khachhang_id`) REFERENCES `tbl_khachhang` (`khachhang_id`),
  ADD CONSTRAINT `fk_vanchuyen_ttdh` FOREIGN KEY (`trangthaidonhang_id`) REFERENCES `tbl_trangthaidonhang` (`trangthaidonhang_id`);

--
-- Các ràng buộc cho bảng `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  ADD CONSTRAINT `FKdkesxt5nw85miaclstbh0r8jl` FOREIGN KEY (`sanpham_id`) REFERENCES `tbl_sanpham` (`sanpham_id`),
  ADD CONSTRAINT `fk_giohang_kh` FOREIGN KEY (`khachhang_id`) REFERENCES `tbl_khachhang` (`khachhang_id`),
  ADD CONSTRAINT `fk_giohang_sp` FOREIGN KEY (`sanpham_id`) REFERENCES `tbl_sanpham` (`sanpham_id`);

--
-- Các ràng buộc cho bảng `tbl_hinhanhsp`
--
ALTER TABLE `tbl_hinhanhsp`
  ADD CONSTRAINT `fk_hinhanhsp_sp` FOREIGN KEY (`sanpham_id`) REFERENCES `tbl_sanpham` (`sanpham_id`);

--
-- Các ràng buộc cho bảng `tbl_khachhang`
--
ALTER TABLE `tbl_khachhang`
  ADD CONSTRAINT `tbl_khachhang_ibfk_1` FOREIGN KEY (`taikhoan_id`) REFERENCES `tbl_taikhoan` (`taikhoan_id`),
  ADD CONSTRAINT `tbl_khachhang_ibfk_2` FOREIGN KEY (`khuvucgh_id`) REFERENCES `tbl_khuvucgh` (`khuvucgh_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Các ràng buộc cho bảng `tbl_phanquyen`
--
ALTER TABLE `tbl_phanquyen`
  ADD CONSTRAINT `FK14st4s4n5dae2lj8jqs48rhd4` FOREIGN KEY (`taikhoan_id`) REFERENCES `tbl_taikhoan` (`taikhoan_id`),
  ADD CONSTRAINT `FKgi9f9iq7d2dbepb3r17yiivfa` FOREIGN KEY (`vaitro_id`) REFERENCES `tbl_vaitro` (`vaitro_id`),
  ADD CONSTRAINT `tbl_phanquyen_ibfk_1` FOREIGN KEY (`taikhoan_id`) REFERENCES `tbl_taikhoan` (`taikhoan_id`);

--
-- Các ràng buộc cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD CONSTRAINT `tbl_sanpham_ibfk_1` FOREIGN KEY (`danhmucsp_id`) REFERENCES `tbl_danhmucsp` (`danhmucsp_id`);

--
-- Các ràng buộc cho bảng `tbl_vanchuyendh`
--
ALTER TABLE `tbl_vanchuyendh`
  ADD CONSTRAINT `fk_vanchuyen_dh` FOREIGN KEY (`donhang_id`) REFERENCES `tbl_donhang` (`donhang_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
