<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Trang chủ Admin | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="Admin_css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>
<body onload="time()" class="app sidebar-mini rtl">
<jsp:include page="Layout/Admin_Bar.jsp"/>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="Admin_add_product.jsp" title="Thêm"><i class="fas fa-plus"></i>
                                Tạo mới sản phẩm</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Tình trạng</th>
                            <th>Giá tiền</th>
                            <th>Danh mục</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr id="w3">
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td>71309005</td>
                            <td>Bóng Đèn Led Ốp Trần Panasonic 18W</td>
                            <td><img src="/img-sanpham/theresa.jpg" alt="" width="100px;"></td>
                            <td>40</td>
                            <td><span class="badge bg-success">Còn hàng</span></td>
                            <td>5.600.000 đ</td>
                            <td>Bòng Đèn Ốp Trần Led Tròn</td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" id="myFunction" title="Xóa" onclick= "myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<!--
  MODAL
-->
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                        <span class="thong-tin-thanh-toan">
                            <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
                        </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">Mã sản phẩm </label>
                        <input class="form-control" type="number" value="71309005">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên sản phẩm</label>
                        <input class="form-control" type="text" required value="Bàn ăn gỗ Theresa">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Số lượng</label>
                        <input class="form-control" type="number" required value="20">
                    </div>
                    <div class="form-group col-md-6 ">
                        <label for="exampleSelect1" class="control-label">Tình trạng sản phẩm</label>
                        <select class="form-control" id="exampleSelect1">
                            <option>Còn hàng</option>
                            <option>Hết hàng</option>
                            <option>Đang nhập hàng</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Giá bán</label>
                        <input class="form-control" type="text" value="5.600.000">
                    </div>
                </div>
                <BR>
                <a href="#" style="float: right;font-weight: 600;color: #ea0000;">Chỉnh sửa sản phẩm nâng cao</a>
                <BR>
                <BR>
                <button class="btn btn-save" type="button">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->

<!-- Essential javascripts for application to work-->
<script src="JS/jquery-3.2.1.min.js"></script>
<script src="JS/popper.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="JS/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="JS/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="JS/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="JS/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $('#sampleTable').DataTable();
    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
</script>
<script>
    $(document).ready(function() {
        $(".trash").click(function() {
            // Lấy phần tử tr (dòng) chứa nút "Xóa" được nhấp
            var row = $(this).closest("tr");
            // Hiển thị thông báo xác nhận
            Swal.fire({
                title: 'Cảnh báo',
                text: 'Bạn có chắc chắn muốn xóa sản phẩm này?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy bỏ'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng đồng ý, xóa dòng tương ứng và hiển thị thông báo xóa thành công
                    row.remove();
                    Swal.fire('Đã xóa thành công!', '', 'success');
                }
            });
        });
    });
</script>

<script>
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });
</script>
</body>

</html>
