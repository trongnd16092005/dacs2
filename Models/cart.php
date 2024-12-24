<?php
require_once("model.php");

class Cart extends Model
{
    function detail_sp($id)
    {
        $query = "SELECT * FROM SanPham WHERE MaSP = $id";
        $result = $this->conn->query($query);
        return $result->fetch_assoc();
    }

    function check_stock($id, $quantity)
    {
        $product = $this->detail_sp($id);

        // Kiểm tra sản phẩm tồn tại và số lượng yêu cầu có đủ không
        if (!$product) {
            setcookie('msg', 'Sản phẩm không tồn tại.', time() + 5);
            return false;
        }

        if ($product['Kho'] < $quantity) {
            setcookie('msg', 'Số lượng sản phẩm không đủ trong kho.', time() + 5);
            return false;
        }

        return true; // Số lượng đủ
    }

    function danhmuc()
    {
        $query = "SELECT * FROM DanhMuc";
        $result = $this->conn->query($query);
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

    function chitietdanhmuc($id)
    {
        $query = "SELECT * FROM ChiTietDanhMuc WHERE MaDM = $id";
        $result = $this->conn->query($query);
    
        if (!$result) {
            error_log("SQL Error: " . $this->conn->error . " in query: $query");
            return []; 
        }
    
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
    
}
