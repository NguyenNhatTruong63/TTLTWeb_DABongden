<%@ page import="java.util.List" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="org.example.web.services.ProductByCategoryServices" %>
<%--<%@ page import="com.curtainshop.beans.Product" %>--%>
<%--<%@ page import="com.curtainshop.database.JDBIConnector" %>--%>
<%--<%@ page import="com.curtainshop.services.ProductService" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý sản phẩm</title>
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

<body  class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header" style="background-color: #585858">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="index.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>

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

                            <a class="btn btn-add btn-sm" href="Admin_addProduct.jsp" title="Thêm"><i class="fas fa-plus"></i>
                                Thêm sản phẩm</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá tiền</th>
                            <th>Chất liệu</th>
                            <th>Xuất xứ</th>
                            <th>Loại</th>
                            <th>Khuyến mãi</th>
                            <th>Số lượng</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% List<Product> list = ProductByCategoryServices.getInstance().getAll();%>
                        <%--                        <% List<Product> list = ProductServices.getInstance().getAll(); %>--%>
                        <% for (Product product : list) { %>


                        <%--                        <% List<Product> list = com.example.do_an_bong_den.services.ProductServices.getInstance().getAll(); %>--%>
                        <%--                        <% for (Product product : list){%>--%>

                        <%--



                                                <tr>
                                                    <td> <%= product.getId() %></td>
                                                    <td> <%= product.getName() %> </td>
                                                    <td> <%= product.getPrice() %> </td>
                        <%--                            <td> <%= product.getMaterial() %> </td>--%>
                        <%--                            <td> <%= product.getOrigin() %> </td>--%>
                        <td> <%= product.getIdCategory() %> </td>
                        <td> <%= product.getDiscount() %> %</td>
                        <td> <%= product.getQuantity() %> </td>
                        <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                    onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
                        </button>
                            <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                                    data-target="#ModalUP"><i class="fas fa-edit"></i></button>
                        </td>
                        </tr>

                        <% }%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>


<script src="JS/jquery-3.2.1.min.js"></script>
<script src="JS/popper.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
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

<script>
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }
    jQuery(function () {
        jQuery(".trash").click(function () {
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
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
</script>
</body>

</html>

