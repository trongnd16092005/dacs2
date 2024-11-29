<?php
require("model.php");
class sanpham extends model
{
    var $table = "sanpham";
    var $contens = "MaSP";
    function khuyenmai(){
        $query = "select * from khuyenmai ";
        require("result.php");
        return $data;
    }
    function loaisp(){
        $query = "select * from loaisanpham ";
        require("result.php");
        return $data;
    }
    function danhmuc(){
        $query = "select * from danhmuc ";
        require("result.php");
        return $data;
    }
    public function countByDanhMuc($MaDM)
{
    $query = "SELECT COUNT(*) AS count FROM sanpham WHERE MaDM = '$MaDM'";
    $result = $this->conn->query($query);
    $row = $result->fetch_assoc();
    return $row['count'];
}
}
