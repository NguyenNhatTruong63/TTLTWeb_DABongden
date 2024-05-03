<%--<%@ page import="com.curtainshop.beans.User" %>--%>
<%--<%@ page import="com.curtainshop.services.UserService" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="org.example.web.beans.Account" %>
<%@ page import="org.example.web.beans.Order" %>
<%@ page import="org.example.web.services.Dao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý người dùng | Quản trị Admin</title>
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

<body onload="time()"  class="app sidebar-mini rtl">
<jsp:include page="Layout/Admin_Bar.jsp"/>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách Khách Hàng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>ID khách hàng</th>
                            <th>Họ và tên</th>
                            <th>Email</th>
                            <th>Số điê thoại</th>
                            <th>Địa chỉ</th>
                            <th>Vai trò</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%Dao dao = new Dao();%>
                        <%List<Account> accountList = dao.getAccountList();%>
                        <%for(Account account : accountList) { %>
                        <tr>
                            <td><%=account.getId()%></td>
                            <td><%=account.getUserName()%></td>
                            <td><%=account.getEmail()%></td>
                            <td><%=account.getPhoneNumber()%></td>
                            <td><%=account.getUserName()%></td>
                            <td><%=account.getIdRole()%></td>
                            <td>
                                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i
                                        class="fas fa-trash-alt"></i></button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i
                                        class="fa fa-edit"></i></button>
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


<!-- Essential javascripts for application to work-->
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

