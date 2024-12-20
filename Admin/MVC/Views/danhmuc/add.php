<table class="table table-striped table-hover" id="dataTable" width="100%" cellspacing="0">
    <?php if (isset($_COOKIE['msg'])) { ?>
        <div class="alert alert-warning">
            <strong>Thông báo</strong> <?= $_COOKIE['msg'] ?>
        </div>
    <?php } ?>
    <form action="?mod=danhmuc&act=store" method="POST" role="form" enctype="multipart/form-data">
        <div class="form-group">
            <label for="">Mã Danh mục</label>
            <input type="text" class="form-control" id="" placeholder="" name="MaDM">
        </div>
        <div class="form-group">
            <label for="">Tên danh mục</label>
            <input type="text" class="form-control" id="" placeholder="" name="TenDM">
        </div>
        <button type="submit" class="btn btn-success">Create</button>
    </form>
</table>