-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 29, 2024 lúc 10:46 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `HinhAnh`) VALUES
(3, 'img/banners/bn1.jpg'),
(4, 'img/banners/bn2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MaHD` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `DonGia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`MaHD`, `MaSP`, `SoLuong`, `DonGia`) VALUES
(1, 2007, 1, 599000.00),
(2, 2007, 1, 599000.00),
(2, 2013, 1, 490000.00),
(3, 1015, 1, 19000.00),
(3, 2007, 1, 599000.00),
(3, 2013, 1, 490000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `MaDM` int(11) NOT NULL,
  `TenDM` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`MaDM`, `TenDM`) VALUES
(1, 'Thực phẩm & Đồ uống'),
(2, 'Thời trang & Phụ kiện'),
(3, 'Điện tử & Công nghệ'),
(4, 'Đồ gia dụng & Nội thất'),
(5, 'Sách & Văn phòng phẩm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `MaND` int(11) DEFAULT NULL,
  `NgayLap` timestamp NULL DEFAULT current_timestamp(),
  `NguoiNhan` varchar(100) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `DiaChi` text DEFAULT NULL,
  `PhuongThucTT` enum('TienMat','ChuyenKhoan') DEFAULT NULL,
  `TongTien` decimal(15,2) DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaND`, `NgayLap`, `NguoiNhan`, `SDT`, `DiaChi`, `PhuongThucTT`, `TongTien`, `TrangThai`) VALUES
(1, 14, '2024-11-29 21:37:30', 'Nguyễn Trọng', '0123456789', 'Hue', NULL, 599000.00, 1),
(2, 2, '2024-11-29 21:44:39', 'Nguyễn Triệu', '01222222', 'Hue', NULL, 1089000.00, 0),
(3, 2, '2024-11-29 21:45:17', 'Nguyễn Triệu', '01222222', 'Hue', NULL, 1108000.00, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `MaKM` int(11) NOT NULL,
  `TenKM` varchar(50) DEFAULT NULL,
  `LoaiKM` enum('PhanTram','TienMat') DEFAULT NULL,
  `GiaTriKM` decimal(10,2) DEFAULT NULL,
  `NgayBD` date DEFAULT NULL,
  `TrangThai` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khuyenmai`
--

INSERT INTO `khuyenmai` (`MaKM`, `TenKM`, `LoaiKM`, `GiaTriKM`, `NgayBD`, `TrangThai`) VALUES
(1, 'Không khuyến mãi', 'TienMat', 0.00, '2024-11-01', 'Active'),
(2, 'mmyy', 'PhanTram', 10.00, '2024-11-01', 'Active'),
(3, 'daihagia', 'TienMat', 10000.00, '2024-11-01', 'Active'),
(4, 'sieusale', 'PhanTram', 10.00, '2024-11-01', 'Active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLSP` int(11) NOT NULL,
  `TenLSP` varchar(50) DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `Mota` varchar(2000) DEFAULT NULL,
  `MaDM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLSP`, `TenLSP`, `HinhAnh`, `Mota`, `MaDM`) VALUES
(101, 'Đồ uống', '/img/products/1/1001.jpg\n', 'y', 1),
(102, 'Đồ ăn vặt', '/img/products/1/1006.jpg', 'y', 1),
(103, 'Thực phẩm', '/img/products/1/1011.jpg\n', 'y', 1),
(201, 'Thời trang nam', '/img/products/2/2001.jpg\r\n', 'y', 2),
(202, 'Thời trang nữ', '/img/products/2/2006.jpg\r\n', 'y', 2),
(203, 'Thời trang trẻ em', '/img/products/2/2011.jpg\r\n', 'y', 2),
(301, 'Điện thoại', '/img/products/3/3001.jpg\r\n', 'y', 3),
(302, 'Laptop', '/img/products/3/3006.jpg\r\n', 'y', 3),
(303, 'Linh kiện điện tử', '/img/products/3/3011.jpg\r\n', 'y', 3),
(401, 'Đồ gia dụng', '/img/products/4/4001.jpg\r\n', 'y', 4),
(402, 'Vật dụng nhà bếp', '/img/products/4/4006.jpg\r\n', 'y', 4),
(403, 'Nội thất', '/img/products/4/4011.jpg\r\n', 'y', 4),
(501, 'Sách', '/img/products/5/5001.jpg\r\n', 'y', 5),
(502, 'Văn phòng phẩm', '/img/products/5/5006.jpg\r\n', 'y', 5),
(503, 'Dụng cụ học tập', '/img/products/5/5011.jpg\r\n', 'y', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MaND` int(11) NOT NULL,
  `Ho` varchar(50) DEFAULT NULL,
  `Ten` varchar(50) DEFAULT NULL,
  `GioiTinh` enum('Nam','Nu') DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DiaChi` text DEFAULT NULL,
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(255) DEFAULT NULL,
  `MaQuyen` int(11) DEFAULT NULL,
  `TrangThai` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`MaND`, `Ho`, `Ten`, `GioiTinh`, `SDT`, `Email`, `DiaChi`, `TaiKhoan`, `MatKhau`, `MaQuyen`, `TrangThai`) VALUES
(2, 'Nguyễn', 'Triệu', 'Nam', '01222222', 'trongnd.23itb@vku.udn.vn', 'Hue', 'qaz', '4eae18cf9e54a0f62b44176d074cbe2f', 3, 1),
(13, 'Nguyễn', 'Trọng', 'Nam', '1234567', 'trongnd.23itb@vku.udn.vn', 'Hue', 'qwe', '09cd426c5c8c1d706d88157c4f4061ff', 1, 1),
(14, 'Nguyễn', 'Trọng', '', '0123456789', 'trongnd.23itb@vku.udn.vn', '', 'qazqaz', '09cd426c5c8c1d706d88157c4f4061ff', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanquyen`
--

CREATE TABLE `phanquyen` (
  `MaQuyen` int(11) NOT NULL,
  `TenQuyen` varchar(50) DEFAULT NULL,
  `ChiTietQuyen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phanquyen`
--

INSERT INTO `phanquyen` (`MaQuyen`, `TenQuyen`, `ChiTietQuyen`) VALUES
(1, 'Customer', 'Khách hàng có tài khoản'),
(2, 'Admin', 'Quản trị viên'),
(3, 'Personnel', 'Nhân Viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `MaLSP` int(11) DEFAULT NULL,
  `MaDM` int(11) DEFAULT NULL,
  `TenSP` varchar(100) DEFAULT NULL,
  `DonGia` decimal(10,2) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `MaKM` int(11) DEFAULT NULL,
  `SoSao` decimal(3,2) DEFAULT NULL,
  `SoDanhGia` int(11) DEFAULT NULL,
  `TrangThai` int(11) NOT NULL DEFAULT 1,
  `MoTa` text DEFAULT NULL,
  `ThoiGian` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `MaLSP`, `MaDM`, `TenSP`, `DonGia`, `SoLuong`, `HinhAnh`, `MaKM`, `SoSao`, `SoDanhGia`, `TrangThai`, `MoTa`, `ThoiGian`) VALUES
(1001, 101, 1, 'Pepsi 6 lon', 55000.00, 12, '/img/products/1/1001.jpg\r\n', 1, 5.00, 12, 1, 'hot', '2024-10-31 19:58:32'),
(1002, 101, 1, 'Nutri Boost 6 chai', 55000.00, 12, '/img/products/1/1002.jpg', 1, 5.00, 12, 1, 'hot', '2024-10-31 19:58:32'),
(1003, 101, 1, '1 thùng Milo', 190000.00, 12, '/img/products/1/1003.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 20:04:06'),
(1004, 101, 1, 'Nước yến Sannest 8 lọ', 90000.00, 12, '/img/products/1/1004.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 20:04:06'),
(1005, 101, 1, '1 thùng Aquafina', 90000.00, 12, '/img/products/1/1005.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 20:04:06'),
(1006, 102, 1, 'Lương khô(1 túi)', 45000.00, 12, '/img/products/1/1006.jpg', 1, 5.00, 12, 1, 'hot', '2024-10-31 20:10:57'),
(1007, 102, 1, 'Snack Lays(Lon)', 19000.00, 24, '/img/products/1/1007.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 20:14:18'),
(1008, 102, 1, 'Kẹo dẻo ChupaChups', 20000.00, 12, '/img/products/1/1008.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 20:15:08'),
(1009, 102, 1, 'Khô gà', 199000.00, 12, '/img/products/1/1009.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 20:15:08'),
(1010, 102, 1, 'Mít sấy Vinamit', 86000.00, 12, '/img/products/1/1010.jpg', 4, 4.00, 12, 1, 'hot', '2024-10-31 20:19:49'),
(1011, 103, 1, 'Túi gạo Ngọc Trời(5kg)', 125000.00, 12, '/img/products/1/1011.jpg\r\n', 2, 5.00, 12, 1, 'hot', '2024-10-31 20:22:28'),
(1012, 103, 1, 'Thịt hộp áp chảo', 50000.00, 12, '/img/products/1/1012.jpg\r\n', 2, 3.00, 12, 1, 'hot', '2024-10-31 20:22:28'),
(1013, 103, 1, 'Túi gạo lứt ', 159000.00, 12, '/img/products/1/1013.jpg\r\n', 1, 5.00, 12, 1, 'hot', '2024-10-31 20:26:46'),
(1014, 103, 1, '1 thùng mì Hảo Hảo', 89000.00, 12, '/img/products/1/1014.jpg\r\n', 1, 4.00, 12, 1, 'hot', '2024-10-31 20:26:46'),
(1015, 103, 1, 'Lon cá ngừ', 19000.00, 12, '/img/products/1/1015.jpg\r\n', 1, 4.00, 12, 1, 'hot', '2024-10-31 20:26:46'),
(1016, 101, 1, 'x', 12.00, 12, 'img/products/bn1.jpg', 1, 0.00, 0, 0, '<p>x</p>', '2024-11-29 19:35:17'),
(2001, 201, 2, 'Áo polo', 129000.00, 12, '/img/products/2/2001.jpg', 2, 5.00, 12, 1, 'hot', '2024-11-01 01:40:31'),
(2002, 201, 2, 'Áo khoác gió', 249000.00, 12, '/img/products/2/2002.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:40:31'),
(2003, 201, 2, 'Quần kaki', 190000.00, 12, '/img/products/2/2003.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:44:34'),
(2004, 201, 2, 'Gìay sneeker Nam', 490000.00, 12, '/img/products/2/2004.jpg', 4, 5.00, 12, 1, 'hot', '2024-10-31 18:44:34'),
(2005, 201, 2, 'Ví Nam da cao cấp', 390000.00, 12, '/img/products/2/2005.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:44:34'),
(2006, 202, 2, 'Túi xách nữ', 690000.00, 12, '/img/products/2/2006.jpg', 2, 3.00, 12, 1, 'hot', '2024-10-31 18:50:12'),
(2007, 202, 2, 'Váy đen trễ vai', 599000.00, 12, '/img/products/2/2007.jpg', 3, 4.00, 12, 1, 'hot', '2024-11-01 18:50:12'),
(2008, 202, 2, 'Đồng hồ nữ Daisy', 1290000.00, 12, '/img/products/2/2008.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 18:52:52'),
(2009, 202, 2, 'Guốc nữ cao cấp', 3900000.00, 12, '/img/products/2/2009.jpg', 3, 3.00, 12, 1, 'hot', '2024-10-31 18:52:52'),
(2010, 202, 2, 'Chân váy', 690000.00, 12, '/img/products/2/2010.jpg', 2, 4.00, 12, 1, 'hot', '2024-10-31 18:52:52'),
(2011, 203, 2, 'Đồ ngủ cho bé', 290000.00, 12, '/img/products/2/2011.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 19:01:38'),
(2012, 203, 2, 'Combo cho bé', 490000.00, 12, '/img/products/2/2012.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 19:01:38'),
(2013, 203, 2, 'Thời trang mùa hè cho bé', 490000.00, 12, '/img/products/2/2013.jpg', 3, 5.00, 12, 1, 'hot', '2024-11-27 19:12:58'),
(2014, 203, 2, 'Thời trang mùa đông cho bé', 690000.00, 12, '/img/products/2/2014.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 19:06:38'),
(2015, 203, 2, 'Thời trang cho bé sơ sinh', 490000.00, 12, '/img/products/2/2015.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 19:06:38'),
(3001, 301, 3, 'Iphone 16', 34000000.00, 12, '/img/products/3/3001.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:10:10'),
(3002, 301, 3, 'Samsung Z Flip 6', 36000000.00, 12, '/img/products/3/3002.jpg', 2, 4.00, 12, 1, 'hot', '2024-10-31 18:10:10'),
(3003, 301, 3, 'OPPO Reno 6', 18000000.00, 12, '/img/products/3/3003.jpg', 4, 4.00, 12, 1, 'hot', '2024-10-31 18:13:23'),
(3004, 301, 3, 'Xiaomi Redmi Note 11', 25000000.00, 12, '/img/products/3/3004.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:13:23'),
(3005, 301, 3, 'Red Magic 10 Pro', 38000000.00, 12, '/img/products/3/3005.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:13:23'),
(3006, 302, 3, 'Lenovo Legion 5 Pro', 44990000.00, 12, '/img/products/3/3006.jpg', NULL, NULL, NULL, 1, 'hot', '2024-10-31 18:21:29'),
(3007, 302, 3, 'DELL Vostro 3490', 7000000.00, 12, '/img/products/3/3007.jpg', 2, 5.00, 12, 1, 'hot', '2024-10-31 18:21:29'),
(3008, 302, 3, 'MacBook Air M1', 199000.00, 12, '/img/products/3/3008.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 18:25:05'),
(3009, 302, 3, 'ASUS TUF Gaming', 200000.00, 12, '/img/products/3/3009.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:25:05'),
(3010, 302, 3, 'ACER Predator', 39990000.00, 12, '/img/products/3/3010.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:25:05'),
(3011, 303, 3, 'Sạc Laptop DELL\r\n', 199000.00, 12, '/img/products/3/3011.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:34:23'),
(3012, 303, 3, 'Sạc dự phòng', 199000.00, 12, '/img/products/3/3012.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 18:34:23'),
(3013, 303, 3, 'Airpods Pro 2 ', 9990000.00, 12, '/img/products/3/3013.jpg', 2, 5.00, 12, 1, 'hot', '2024-10-31 18:36:33'),
(3014, 303, 3, 'Chuột không dây', 390000.00, 12, '/img/products/3/3014.jpg', 2, 4.00, 12, 1, 'hot', '2024-10-31 18:36:33'),
(3015, 303, 3, 'USB', 99000.00, 12, '/img/products/3/3015.jpg', 2, 5.00, 12, 1, 'hot', '2024-10-31 18:36:33'),
(4001, 401, 4, 'Nồi cơm điện', 450000.00, 12, '/img/products/4/4001.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 17:40:39'),
(4002, 401, 4, 'Máy xay sinh tố', 450000.00, 12, '/img/products/4/4002.jpg', 2, 3.00, 12, 1, 'hot', '2024-10-31 17:43:55'),
(4003, 401, 4, 'Ấm đun nước siêu tốc', 199000.00, 12, '/img/products/4/4003.jpg', 2, 4.00, 12, 1, 'hot', '2024-10-31 17:43:55'),
(4004, 401, 4, 'Bộ nồi chảo chống dính', 599000.00, 12, '/img/products/4/4004.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 17:43:55'),
(4005, 401, 4, 'Ấm pha trà giữ nhiệt', 399000.00, 12, '/img/products/4/4005.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 17:43:55'),
(4006, 402, 4, 'Bộ dao 6 món', 499000.00, 12, '/img/products/4/4006.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 17:53:20'),
(4007, 402, 4, 'Bộ bát đĩa', 390000.00, 12, '/img/products/4/4007.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 17:53:20'),
(4008, 402, 4, 'Bộ ấm chén', 350000.00, 12, '/img/products/4/4008.jpg', 1, 3.50, 12, 1, 'hot', '2024-10-31 17:55:35'),
(4009, 402, 4, 'Kệ bếp đa năng', 290000.00, 12, 'hot', 3, 4.00, 12, 1, 'hot', '2024-10-31 17:55:35'),
(4010, 402, 4, 'Thớt gỗ', 99000.00, 12, '/img/products/4/4010.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 17:55:35'),
(4011, 403, 4, 'Tủ quần áo', 9000000.00, 12, '/img/products/4/4011.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 17:59:44'),
(4012, 403, 4, 'Lọ lục bình gỗ', 900000.00, 12, '/img/products/4/4012.jpg', 2, 4.00, 12, 1, 'hot', '2024-10-31 17:59:44'),
(4013, 403, 4, 'Bộ sofa gỗ', 12000000.00, 5, '/img/products/4/4013.jpg', 1, 5.00, 3, 1, 'hot', '2024-10-31 18:04:25'),
(4014, 403, 4, 'Bộ bàn ghế ăn', 10000000.00, 3, '/img/products/4/4014.jpg', 1, 4.00, 2, 1, 'hot', '2024-10-31 18:04:25'),
(4015, 403, 4, 'Giá trang trí treo tường', 5000000.00, 12, '/img/products/4/4015.jpg', 2, 5.00, 12, 1, 'hot', '2024-10-31 18:04:25'),
(5001, 501, 5, 'Huyền thoại Ai Cập cổ', 125000.00, 12, '/img/products/5/5001.jpg', 2, 4.00, 12, 1, 'hot', '2024-10-31 17:05:17'),
(5002, 501, 5, 'The SECRET', 250000.00, 12, '/img/products/5/5002.jpg', 1, 5.00, 12, 1, 'hot', '2024-10-31 17:10:49'),
(5003, 501, 5, 'Trống Đồng', 75000.00, 12, '/img/products/5/5003.jpg', 1, 3.50, 12, 1, 'hot', '2024-10-31 17:10:49'),
(5004, 501, 5, 'The story off a lonely old man', 200000.00, 12, '/img/products/5/5004.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 17:10:49'),
(5005, 501, 5, 'Brain storm is on', 400000.00, 12, '/img/products/5/5005.jpg', 2, 5.00, 12, 1, 'hot', '2024-10-31 17:10:49'),
(5006, 502, 5, 'Giấy in văn phòng', 100000.00, 12, '/img/products/5/5006.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 17:22:22'),
(5007, 502, 5, 'Bìa hồ sơ', 10000.00, 12, '/img/products/5/5007.jpg', 1, 5.00, 12, 1, 'hot', '2024-10-31 17:22:22'),
(5008, 502, 5, 'Sổ danh thiếp', 50000.00, 12, '/img/products/5/5008.jpg', 1, 3.50, 12, 1, 'hot', '2024-10-31 17:22:22'),
(5009, 502, 5, 'Khay mực dấu', 80000.00, 12, '/img/products/5/5009.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 17:22:22'),
(5010, 502, 5, 'Bấm kim', 40000.00, 12, '/img/products/5/5010.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 17:22:22'),
(5011, 503, 5, 'Combo dụng cụ học tập', 180000.00, 12, '/img/products/5/5011.jpg', 1, 4.00, 12, 1, 'hot', '2024-10-31 17:30:48'),
(5012, 503, 5, 'Balo cho bé', 120000.00, 12, '/img/products/5/5012.jpg', 1, 5.00, 12, 1, 'hot', '2024-10-31 17:33:42'),
(5013, 503, 5, 'Bộ 150 màu cho bé', 350000.00, NULL, '/img/products/5/5013.jpg', 3, 5.00, 12, 1, 'hot', '2024-10-31 17:33:42'),
(5014, 503, 5, 'Tập vở học sinh', 90000.00, 12, '/img/products/5/5014.jpg', 3, 4.00, 12, 1, 'hot', '2024-10-31 17:33:42'),
(5015, 503, 5, 'Nhãn vở bộ môn', 20000.00, 12, '/img/products/5/5015.jpg', 1, 5.00, 12, 1, 'hot', '2024-10-31 17:33:42');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`MaHD`,`MaSP`),
  ADD KEY `chitiethoadon_ibfk_2` (`MaSP`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`MaDM`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`),
  ADD KEY `MaND` (`MaND`);

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`MaKM`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLSP`),
  ADD KEY `MaDM` (`MaDM`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MaND`),
  ADD UNIQUE KEY `TaiKhoan` (`TaiKhoan`),
  ADD KEY `MaQuyen` (`MaQuyen`);

--
-- Chỉ mục cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`MaQuyen`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaLSP` (`MaLSP`),
  ADD KEY `MaDM` (`MaDM`),
  ADD KEY `MaKM` (`MaKM`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `MaDM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `MaKM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MaND` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  MODIFY `MaQuyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5019;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaND`) REFERENCES `nguoidung` (`MaND`);

--
-- Các ràng buộc cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD CONSTRAINT `loaisanpham_ibfk_1` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc` (`MaDM`);

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`MaQuyen`) REFERENCES `phanquyen` (`MaQuyen`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaLSP`) REFERENCES `loaisanpham` (`MaLSP`),
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc` (`MaDM`),
  ADD CONSTRAINT `sanpham_ibfk_3` FOREIGN KEY (`MaKM`) REFERENCES `khuyenmai` (`MaKM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
