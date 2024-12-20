<table class="table table-striped table-hover" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>Field</th>
            <th>Value</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>ID</td>
            <td><?= $data['id'] ?></td>
        </tr>
        <tr>
            <td>Hình Ảnh</td>
            <td><img src="../public/<?=$data['HinhAnh']?>" height="400px"></td>
        </tr>
    </tbody>
</table>