<?php
require_once("Models/cart.php");

class CartController
{
    var $cart_model;

    public function __construct()
    {
        $this->cart_model = new Cart();
    }

    function list_cart()
    {
        $data_danhmuc = $this->cart_model->danhmuc();
    
        $data_chitietDM = [];
        for ($i = 1; $i <= count($data_danhmuc); $i++) {
            $chitietDM = $this->cart_model->chitietdanhmuc($i);
            if ($chitietDM === null) {
                setcookie('msg', "Không thể tải danh mục chi tiết cho ID: $i", time() + 5);
                continue;
            }
            $data_chitietDM[$i] = $chitietDM;
        }
    
        $count = 0;
        if (isset($_SESSION['sanpham'])) {
            foreach ($_SESSION['sanpham'] as $value) {
                $count += $value['ThanhTien'];
            }
        }
    
        require_once('Views/index.php');
    }
    

    function add_cart()
    {
        $id = $_GET['id'];
        $data = $this->cart_model->detail_sp($id);

        if (!$this->cart_model->check_stock($id, 1)) {
            header('Location:?act=cart');
            return;
        }

        if (isset($_SESSION['sanpham'][$id])) {
            $arr = $_SESSION['sanpham'][$id];
            $arr['SoLuong'] += 1;
            $arr['ThanhTien'] = $arr['SoLuong'] * $arr["DonGia"];
            $_SESSION['sanpham'][$id] = $arr;
        } else {
            $arr['MaSP'] = $data['MaSP'];
            $arr['TenSP'] = $data['TenSP'];
            $arr['DonGia'] = $data['DonGia'];
            $arr['SoLuong'] = 1;
            $arr['ThanhTien'] = $data['DonGia'];
            $arr['HinhAnh'] = $data['HinhAnh'];
            $_SESSION['sanpham'][$id] = $arr;
        }

        header('Location:?act=cart#dxd');
    }

    function update_cart()
    {
        $id = $_GET['id'];
        $arr = $_SESSION['sanpham'][$id];
        $new_quantity = $arr['SoLuong'] + 1;

        if (!$this->cart_model->check_stock($id, $new_quantity)) {
            header('Location:?act=cart'); 
            return;
        }

        $arr['SoLuong'] = $new_quantity;
        $arr['ThanhTien'] = $arr['SoLuong'] * $arr["DonGia"];
        $_SESSION['sanpham'][$id] = $arr;

        header('Location: ?act=cart#dxd');
    }

    function delete_cart()
    {
        $id = $_GET['id'];
        $arr = $_SESSION['sanpham'][$id];

        if ($arr['SoLuong'] == 1) {
            unset($_SESSION['sanpham'][$id]);
        } else {
            $arr['SoLuong'] -= 1;
            $arr['ThanhTien'] = $arr['SoLuong'] * $arr["DonGia"];
            $_SESSION['sanpham'][$id] = $arr;
        }

        header('Location: ?act=cart#dxd');
    }

    function deleteall_cart()
    {
        $id = $_GET['id'];
        unset($_SESSION['sanpham'][$id]);
        header('Location: ?act=cart#dxd');
    }

    function checkout_cart()
    {
        if (!isset($_SESSION['sanpham']) || empty($_SESSION['sanpham'])) {
            setcookie('msg', 'Giỏ hàng của bạn đang trống.', time() + 5);
            header('Location:?act=cart');
            return;
        }

        foreach ($_SESSION['sanpham'] as $id => $item) {
            if (!$this->cart_model->check_stock($id, $item['SoLuong'])) {
                header('Location:?act=cart'); 
                return;
            }
        }

        setcookie('msg', 'Đặt hàng thành công.', time() + 5);
        unset($_SESSION['sanpham']);
        header('Location:?act=cart');
    }
}
