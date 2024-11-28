<?php
$result = $this->conn->query($query);

$data = array();

// Kiểm tra xem truy vấn có thành công không
if ($result === false) {
    // In ra lỗi chi tiết nếu truy vấn thất bại
    die("Query failed: " . $this->conn->error);
}

// Nếu thành công, xử lý kết quả
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}
?>
