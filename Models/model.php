<?php
require_once("connection.php");

class model
{
    var $conn;

    function __construct()
    {
        $conn_obj = new connection();
        $this->conn = $conn_obj->conn;
    }

    // Hàm lấy dữ liệu với LIMIT
    function limit($a, $b)
    {
        $a = intval($a); // Đảm bảo tham số là số nguyên
        $b = intval($b);
        $query = "SELECT * from sanpham WHERE TrangThai = 1 ORDER BY ThoiGian DESC LIMIT $a, $b";

        require "result.php";

        return $data;
    }

    // Hàm lấy tất cả danh mục
    function danhmuc()
    {
        $query = "SELECT * from DanhMuc";

        require "result.php";

        return $data;
    }

    // Hàm chi tiết danh mục (Sử dụng Prepared Statement để tránh SQL Injection)
    function chitietdanhmuc($id)
    {
        $stmt = $this->conn->prepare("SELECT d.TenDM as Ten, l.* FROM danhmuc as d, loaisanpham as l WHERE d.MaDM = l.MaDM AND d.MaDM = ?");
        $stmt->bind_param("i", $id); // "i" đại diện cho kiểu số nguyên (integer)
        $stmt->execute();
        $result = $stmt->get_result();

        $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }

    // Hàm lấy loại sản phẩm theo danh mục (Prepared Statement)
    function loaisanpham($id)
    {
        $stmt = $this->conn->prepare("SELECT d.TenDM as Ten, l.* FROM danhmuc as d, loaisanpham as l WHERE d.MaDM = l.MaDM AND d.MaDM = ?");
        $stmt->bind_param("i", $id); // "i" đại diện cho kiểu số nguyên (integer)
        $stmt->execute();
        $result = $stmt->get_result();

        $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }

    // Hàm lấy sản phẩm ngẫu nhiên
    function random($id)
    {
        $id = intval($id);
        $query = "SELECT * FROM SanPham WHERE TrangThai = 1 ORDER BY RAND() LIMIT $id";

        require "result.php";

        return $data;
    }

    // Hàm lấy banner
    function banner($a, $b)
    {
        $a = intval($a);
        $b = intval($b);
        $query = "SELECT * from Banner LIMIT $a, $b";

        require "result.php";

        return $data;
    }

    // Hàm lấy sản phẩm theo danh mục (Prepared Statement)
    function sanpham_danhmuc($a, $b, $danhmuc)
    {
        $a = intval($a);
        $b = intval($b);
        $danhmuc = intval($danhmuc);

        $query = "SELECT * from sanpham WHERE TrangThai = 1 AND MaDM = $danhmuc ORDER BY ThoiGian DESC LIMIT $a, $b";

        require "result.php";

        return $data;
    }
}
