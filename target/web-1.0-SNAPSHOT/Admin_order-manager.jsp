<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý đơn hàng</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
<%--    <link rel="stylesheet" type="text/css" href="../css/admin/main.css">--%>
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

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header" style="background-color: #585858">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="Admin_index.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>

        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar" style="background-color: #585858">
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="Admin_user_manager.jsp"><i class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Quản lý người dùng</span></a></li>
        <li><a class="app-menu__item" href="Admin_product-manager.jsp"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
        </li>
        <li><a class="app-menu__item" href="Admin_order-manager.jsp"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>
    </ul>
</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="products.html" title="Thêm"><i class="fas fa-plus"></i>
                                Tạo mới đơn hàng</a>
                        </div>
                        <!--                <div class="col-sm-2">-->
                        <!--                  <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập" onclick="myFunction(this)"><i-->
                        <!--                      class="fas fa-file-upload"></i> Tải từ file</a>-->
                        <!--                </div>-->

                        <!--                <div class="col-sm-2">-->
                        <!--                  <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i-->
                        <!--                      class="fas fa-print"></i> In dữ liệu</a>-->
                        <!--                </div>-->
                        <!--                <div class="col-sm-2">-->
                        <!--                  <a class="btn btn-delete btn-sm print-file js-textareacopybtn" type="button" title="Sao chép"><i-->
                        <!--                      class="fas fa-copy"></i> Sao chép</a>-->
                        <!--                </div>-->

                        <!--                <div class="col-sm-2">-->
                        <!--                  <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất Excel</a>-->
                        <!--                </div>-->
                        <!--                <div class="col-sm-2">-->
                        <!--                  <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)"><i-->
                        <!--                      class="fas fa-file-pdf"></i> Xuất PDF</a>-->
                        <!--                </div>-->
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>ID đơn hàng</th>
                            <th>Khách hàng</th>
                            <th>Đơn hàng</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Tình trạng</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>MD0837</td>
                            <td>Triệu Thanh Phú</td>
                            <td>Đèn LED Âm Trần KingLED | Đèn LED KingLED Chính Hãng, Đèn Dây Tóc Điện Quang 60W</td>
                            <td>2</td>
                            <td>264.000 đ</td>
                            <td><span class="badge bg-success">Hoàn thành</span></td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button></td>
                        </tr>
                        <tr>

                            <td>MĐ8265</td>
                            <td>Nguyễn Thị Ngọc Cẩm</td>
                            <td>Bóng Đèn Led Bulb Rạng Đông Cảm Biến 7W</td>
                            <td>1</td>
                            <td>88.000 đ</td>
                            <td><span class="badge bg-success">Hoàn thành</span></td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button></td>
                        </tr>
                        <tr>

                            <td>MT9835</td>
                            <td>Đặng Hoàng Phúc</td>
                            <td>Bóng Đèn LED Bulb Trụ Nhôm Đúc Led Osram 20W</td>
                            <td>3 </td>
                            <td>138.000 đ</td>
                            <td><span class="badge bg-success">Hoàn thành</span></td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button></td>
                        </tr>
                        <tr>

                            <td>ER3835</td>
                            <td>Nguyễn Thị Mỹ Yến</td>
                            <td>Bóng đèn Led Buld Trụ Rạng Đông</td>
                            <td>1 </td>
                            <td>98.000 đ</td>
                            <td><span class="badge bg-info">Chờ thanh toán</span></td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button></td>
                        </tr>
                        <tr>

                            <td>AL3947</td>
                            <td>Phạm Thị Ngọc</td>
                            <td>Bóng Led Bulb Rạng Đông 20W</td>
                            <td>2 </td>
                            <td>128.000 đ</td>
                            <td><span class="badge bg-warning">Đang giao hàng</span></td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button></td>
                        </tr>
                        <tr>

                            <td>QY8723</td>
                            <td>Ngô Thái An</td>
                            <td>Bóng đèn Led Ốp Trần Rạng Đông 12W</td>
                            <td>1 </td>
                            <td>105.000 đ</td>
                            <td><span class="badge bg-danger">Đã hủy</span></td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Essential javascripts for application to work-->
<script src="JS/jquery-3.2.1.min.js"></script>
<script src="JS/popper.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="jquery.table2excel.js"></script>
<script src="JS/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="JS/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="JS/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="JS/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script>
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }
    jQuery(function () {
        jQuery(".trash").click(function () {
            swal({
                title: "Cảnh báo",

                text: "Bạn có chắc chắn là muốn xóa đơn hàng này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            })
                .then((willDelete) => {
                    if (willDelete) {
                        swal("Đã xóa thành công.!", {

                        });
                    }
                });
        });
    });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });

    //EXCEL
    // $(document).ready(function () {
    //   $('#').DataTable({

    //     dom: 'Bfrtip',
    //     "buttons": [
    //       'excel'
    //     ]
    //   });
    // });


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
    //In dữ liệu
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('sampleTable');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


    //Modal
    $("#show-emp").on("click", function () {
        $("#ModalUP").modal({ backdrop: false, keyboard: false })
    });
</script>
</body>

</html>

