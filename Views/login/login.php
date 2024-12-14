<!-- login content section start -->
<section class="pages login-page section-padding">
  <div class="container">
    <div class="form-wrapper">
      <!-- Form Đăng Nhập -->
      <div class="form-container" id="dangnhap">
        <div class="main-input padding60">
          <div class="log-title">
            <h3><strong>Đăng nhập</strong></h3>
          </div>
          <div class="login-text">
            <div class="custom-input">
              <?php if (isset($_COOKIE['msg1'])) { ?>
                <div class="alert alert-success">
                  <strong>Thông báo</strong> <?= $_COOKIE['msg1'] ?>
                </div>
              <?php } ?>
              <form action="?act=taikhoan&xuli=dangnhap" method="post" id="form1">
                <input type="text" name="taikhoan" placeholder="Tài khoản" required />
                <input type="password" name="matkhau" placeholder="Mật khẩu" required />
                <a class="forget" href="#">Quên mật khẩu?</a>
                <a class="register" href="#" onclick="showRegister()">Đăng ký</a>
                <div class="submit-text">
                  <button name="submit" type="submit" form="form1">Đăng nhập</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- Form Đăng Ký -->
      <div class="form-container" id="dangky" style="display: none;">
        <div class="main-input padding60 new-customer">
          <div class="log-title">
            <h3><strong>Đăng ký</strong></h3>
          </div>
          <?php if (isset($_COOKIE['msg'])) { ?>
            <div class="alert alert-success">
              <strong>Thông báo</strong> <?= $_COOKIE['msg'] ?>
            </div>
          <?php } ?>
          <div class="custom-input">
            <form action="?act=taikhoan&xuli=dangky" method="post" id="form2">
              <input type="text" name="Ho" placeholder="Họ.." required />
              <input type="text" name="Ten" placeholder="Tên.." required />
              <input type="text" name="TaiKhoan" placeholder="Tên tài khoản đăng nhập.." required minlength="6" />
              <input type="email" name="Email" placeholder="Địa chỉ Email.." required />
              <input type="text" name="SĐT" placeholder="Số điện thoại.." required pattern="[0-9]+" minlength="10" />
              <input type="password" name="MatKhau" placeholder="Mật khẩu" minlength="6" required />
              <input type="password" name="check_password" placeholder="Xác nhận mật khẩu" minlength="6" required />
              <a href="#" onclick="showLogin()">Đăng nhập</a>
              <div class="submit-text coupon">
                <button type="submit" form="form2">Đăng ký</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- login content section end -->

<script>
  function showRegister() {
    document.getElementById('dangnhap').style.display = 'none';
    document.getElementById('dangky').style.display = 'block';
  }

  function showLogin() {
    document.getElementById('dangnhap').style.display = 'block';
    document.getElementById('dangky').style.display = 'none';
  }
</script>

<style>
  .pages.login-page {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f2f4f8;
    margin: auto;
    padding-top: 80px;
  }

  .form-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
  }

  .form-container {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    transition: opacity 0.3s ease, visibility 0.3s ease;
  }

  #dangnhap {
    visibility: visible;
    opacity: 1;
  }

  #dangky {
    visibility: hidden;
    opacity: 0;
  }

  #dangnhap[style*="display: block"],
  #dangky[style*="display: block"] {
    visibility: visible;
    opacity: 1;
  }

  /* Đã giảm kích thước form */
  .main-input {
    background: #ffffff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    padding: 30px; /* Giảm padding */
    text-align: center;
    width: 100%;
    max-width: 400px; /* Giảm chiều rộng tối đa */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-sizing: border-box;
    margin: 250px auto ;
    z-index: 10;
  }

  .main-input:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
  }

  .log-title h3 {
    font-size: 20px; /* Giảm kích thước tiêu đề */
    color: #333;
    margin-bottom: 20px;
    text-transform: uppercase;
    font-weight: bold;
  }

  .custom-input input {
    width: 100%;
    padding: 8px 12px; /* Giảm padding */
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    color: #555;
  }

  .custom-input input:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    outline: none;
  }

  .custom-input a {
    color: #007bff;
    font-size: 14px;
    text-decoration: none;
    margin-bottom: 15px;
    display: inline-block;
  }

  .custom-input a:hover {
    text-decoration: underline;
  }

  .submit-text button {
    width: 100%;
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 18px; /* Giảm padding */
    border-radius: 5px;
    font-size: 14px; /* Giảm kích thước nút */
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .submit-text button:hover {
    background-color: #0056b3;
  }

  .alert {
    padding: 8px 16px;
    margin-bottom: 15px;
    border: 1px solid transparent;
    border-radius: 5px;
  }

  .alert-success {
    background-color: #d4edda;
    color: #155724;
    border-color: #c3e6cb;
  }

  .alert-success strong {
    font-weight: bold;
  }
</style>
