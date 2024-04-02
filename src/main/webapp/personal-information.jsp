<%@ page import="org.example.web.services.Dao" %>
<%@ page import="org.example.web.beans.Account" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 02/04/2024
  Time: 13:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">

    <style>
        #search1 {
            margin-top: 0px;
        }

        .info_personal {
            text-align: center;
        }

        .info_personal h2 {
            text-align: center;
            margin-bottom: 5px;


        }

        .info_personal input {
            margin-top: 5px;
            font-size: 20px;
            height: 35px;
            width: 417px;
            border-radius: 5px;
            background: #E8ECEE;
            padding-left: 10px;
            margin-bottom: 7px;
        }

        .info_personal p {
            margin-top: 10px;
            margin-bottom: -20px;
            font-size: 22px;
            font-weight: bold;
        }

        .btn {
            margin-top: 20px;
        }

        .btn a {
            color: white;
            border: 2px solid black;
            background-color: #20b2aa;
            border-radius: 5px;
            padding: 10px 20px;


        }

        .btn input:hover {

        }

    </style>
</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<% Dao dao = new Dao();
    Account account = (Account) session.getAttribute("account");
    if (account == null) account = new Account();
%>
<div class="info_personal">
    <h2>THÔNG TIN CÁ NHÂN</h2>
    <p class="info_item">Tên người dùng</p><br>
    <input type="text" placeholder=" <%= account.getUserName() %>" readonly><br>
    <p class="info_item"> Điện thoại</p><br>
    <input type="text" placeholder="<%= account.getPhoneNumber() %>" readonly><br>
    <p class="info_item"> Email</p><br>
    <input type="text" placeholder="<%= account.getEmail() %>" readonly><br>

    <div class="btn">
        <a href="forgetpass.jsp">Đổi mật khẩu</a>
    </div>
</div>

<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>
