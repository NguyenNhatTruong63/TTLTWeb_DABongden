<%@ page import="org.example.web.beans.Warehoue" %>
<%@ page import="org.example.web.services.WarehoueDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 10/05/2024
  Time: 19:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý nhà kho || Admin</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<!-- Navbar-->
<jsp:include page="Layout/Admin_Bar.jsp"/>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Quản lý kho</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <%--    <% List<Orders> list = (List<Orders>) request.getAttribute("listorder"); %>--%>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <%--                    <%List<Orders> ordersList = (List<Orders>) request.getAttribute("listorder");%>--%>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ngày</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng nhập</th>
                            <th>Số lượng bán</th>
                            <th>Số lượng tồn kho</th>
                            <th>Giá nhập</th>
                            <th>Giá bán</th>
                            <th>Tình trạng</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%WarehoueDao dao = new WarehoueDao();%>
                        <%List<Warehoue> list = dao.findAll();%>
                        <%for (Warehoue warehoue: list ){%>
                        <tr>
                            <td><%=warehoue.getId()%></td>
                            <td><%=warehoue.getSoluong()%></td>
                            <td><%=warehoue.getName()%></td>
                            <td><%=warehoue.getSoluongnhap()%></td>
                            <td><%=warehoue.getSoluongban()%></td>
                            <td><%=warehoue.slton()%></td>
                            <td><%=warehoue.getGianhap()%></td>
                            <td><%=warehoue.getGiaban()%></td>
                            <td><%=warehoue.getGiatonkho()%></td>
                            <td>
                                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button>
                            </td>
                        </tr>
                        <%}%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
