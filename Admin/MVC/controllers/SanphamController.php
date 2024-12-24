<?php
require_once("MVC/Models/sanpham.php");
class SanphamController
{
    var $sanpham_model;
    public function __construct()
    {
        $this->sanpham_model = new sanpham();
    }
    public function list()
    {
        $data = $this->sanpham_model->All();
        require_once("MVC/Views/Admin/index.php");
        // require_once("MVC/Views/posts/list.php");
    }
    public function detail()
    {
        $id = isset($_GET['id']) ? $_GET['id'] : 1;
        $data = $this->sanpham_model->find($id);
        require_once("MVC/Views/Admin/index.php");
        //require_once("MVC/Views/posts/detail.php");
    }
    public function add()
    {
        $data_km = $this->sanpham_model->khuyenmai();
        $data_lsp = $this->sanpham_model->loaisp();
        $data_dm = $this->sanpham_model->danhmuc();
        require_once("MVC/Views/Admin/index.php");
        //require_once("MVC/Views/posts/add.php");
    }
    public function store()
    {
        $target_dir = "../public/img/products/";  // thư mục chứa file upload

        $HinhAnh = "";
        $target_file = $target_dir . basename($_FILES["HinhAnh"]["name"]); // link sẽ upload file lên

        $status_upload = move_uploaded_file($_FILES["HinhAnh"]["tmp_name"], $target_file);

        if ($status_upload) { // nếu upload file không có lỗi 
            $HinhAnh =  "img/products/" . basename($_FILES["HinhAnh"]["name"]);
        }

        $TrangThai = 0;
        if (isset($_POST['TrangThai'])) {
            $TrangThai = $_POST['TrangThai'];
        }

        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $ThoiGian =  date('Y-m-d H:i:s');
        // Lấy `MaDM` từ form gửi lên
    $MaDM = $_POST['MaDM'];

    // Lấy số lượng sản phẩm hiện có trong danh mục để tạo số thứ tự
    $sanphamCount = $this->sanpham_model->countByDanhMuc($MaDM);

    // Tạo mã sản phẩm với định dạng `axxx`
    $MaSP = $MaDM . str_pad($sanphamCount + 1, 3, '0', STR_PAD_LEFT);
        $data = array(
            'MaSP' => $MaSP,
            'MaLSP' =>    $_POST['MaLSP'],
            'TenSP'  =>   $_POST['TenSP'],
            'MaDM' => $_POST['MaDM'],
            'DonGia' => $_POST['DonGia'],
            'Kho' => $_POST['Kho'],
            'HinhAnh' => $HinhAnh,
            'MaKM' =>  $_POST['MaKM'],
            'SoSao' =>  0,
            'SoDanhGia' => 0,
            'TrangThai' => $TrangThai,
            'MoTa' =>  $_POST['MoTa'],
            'ThoiGian' => $ThoiGian
        );
        foreach ($data as $key => $value) {
            if (strpos($value, "'") != false) {
                $value = str_replace("'", "\'", $value);
                $data[$key] = $value;
            }
        }

        $this->sanpham_model->store($data);
    }
    public function delete()
    {
        $id = $_GET['id'];
        $this->sanpham_model->delete($id);
    }
    public function edit()
    {
        $id = isset($_GET['id']) ? $_GET['id'] : 1;
        $data_km = $this->sanpham_model->khuyenmai();
        $data_lsp = $this->sanpham_model->loaisp();
        $data_dm = $this->sanpham_model->danhmuc();
        $data = $this->sanpham_model->find($id);
        require_once("MVC/Views/Admin/index.php");
        //require_once("MVC/Views/posts/edit.php");
    }
    public function update()
    {

        $target_dir = "../public/img/products/";  // thư mục chứa file upload

        $HinhAnh = "";
        $target_file = $target_dir . basename($_FILES["HinhAnh"]["name"]); // link sẽ upload file lên
        $status_upload = move_uploaded_file($_FILES["HinhAnh"]["tmp_name"], $target_file);
        var_dump(basename($_FILES["HinhAnh"]["name"]));
        if ($status_upload) { // nếu upload file không có lỗi 
            $HinhAnh = "img/products/" .basename($_FILES["HinhAnh"]["name"]);
        }

        $TrangThai = 0;
        if (isset($_POST['TrangThai'])) {
            $TrangThai = $_POST['TrangThai'];
        }
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $ThoiGian =  date('Y-m-d H:i:s');
        $data = array(
            'MaSP' => $_POST['MaSP'],
            'MaLSP' =>    $_POST['MaLSP'],
            'MaDM' => $_POST['MaDM'],
            'TenSP'  =>   $_POST['TenSP'],
            'DonGia' => $_POST['DonGia'],
            'Kho' => $_POST['Kho'],
            'HinhAnh' => $HinhAnh,
            'MaKM' =>  $_POST['MaKM'],
            'SoSao' =>  0,
            'SoDanhGia' => 0,
            'TrangThai' => $TrangThai,
            'MoTa' =>  $_POST['MoTa'],
            'ThoiGian' => $ThoiGian
        );
        foreach ($data as $key => $value) {
            if (strpos($value, "'") != false) {
                $value = str_replace("'", "\'", $value);
                $data[$key] = $value;
            }
        }
        if ($HinhAnh == "") {
            unset($data['HinhAnh']);
        }
        
        $this->sanpham_model->update($data);
    }
}
