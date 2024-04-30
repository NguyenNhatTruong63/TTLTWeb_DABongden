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
    <title>Quản lý sản phẩm | Quản trị Admin</title>
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

<body onload="time()"   class="app sidebar-mini rtl">
<!-- Navbar-->
<jsp:include page="Layout/Admin_Bar.jsp"/>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="Admin_product-manager.jsp"><b>Danh sách sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="Admin_add_product.jsp" title="Thêm"><i class="fas fa-plus"></i>Thêm sản phẩm</a>
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
                        <tr>
                            <td>MD0837</td>
                            <td>bongden</td>
                            <td>50</td>
                            <td>nhựa</td>
                            <td>TP.HCM</td>
                            <td>1</td>
                            <td>20</td>
                            <td>40</td>
                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


<%--    <div class="row">--%>
<%--        <div class="col-md-12">--%>
<%--            <div class="tile">--%>
<%--                <div class="tile-body">--%>
<%--                    <div class="row element-button">--%>
<%--                        <div class="col-sm-2">--%>
<%--                            <a class="btn btn-add btn-sm" href="Admin_addProduct.jsp" title="Thêm"><i class="fas fa-plus"></i>Thêm sản phẩm</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <table class="table table-hover table-bordered" id="sampleTable">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th>ID</th>--%>
<%--                            <th>Tên sản phẩm</th>--%>
<%--                            <th>Giá tiền</th>--%>
<%--                            <th>Chất liệu</th>--%>
<%--                            <th>Xuất xứ</th>--%>
<%--                            <th>Loại</th>--%>
<%--                            <th>Khuyến mãi</th>--%>
<%--                            <th>Số lượng</th>--%>
<%--                            <th>Chức năng</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                                                <tr>--%>
<%--&lt;%&ndash;                                                    <td> <%= product.getId() %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <td> <%= product.getName() %> </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <td> <%= product.getPrice() %> </td>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            <td> <%= product.getMaterial() %> </td>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            <td> <%= product.getOrigin() %> </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <td> <%= product.getIdCategory() %> </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <td> <%= product.getDiscount() %> %</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <td> <%= product.getQuantity() %> </td>&ndash;%&gt;--%>
<%--                        <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"--%>
<%--                                    onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>--%>
<%--                        </button>--%>
<%--                            <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"--%>
<%--                                    data-target="#ModalUP"><i class="fas fa-edit"></i></button>--%>
<%--                        </td>--%>
<%--                        </tr>--%>

<%--&lt;%&ndash;                        <% }%>&ndash;%&gt;--%>

<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
</main>


<script src="JS/jquery-3.2.1.min.js"></script>
<script src="JS/popper.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
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
                cancelButtonText: 'Hủy bỏ',
            }).then((result) => {
                if (result.isConfirmed) {
                    row.remove();
                    Swal.fire('Đã xóa thành công!', '', 'success');
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

