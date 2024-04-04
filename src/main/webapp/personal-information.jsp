<%@ page import="org.example.web.services.Dao" %>
<%@ page import="org.example.web.beans.Account" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 02/04/2024
  Time: 13:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <link rel="stylesheet" href="access/css/forgetpass.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">

</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<% Dao dao = new Dao();
    Account account = (Account) session.getAttribute("account");
    if (account == null) account = new Account();
%>
<div id="session" class="">
    <div class="container">
        <img style="width: 1250px; height: 650px" src="https://img.freepik.com/free-photo/light-bulb-with-water-inside_1232-2108.jpg?t=st=1712065223~exp=1712068823~hmac=c8a2474167897521e8143b368bc8d312870c43535383163e401510fbd6a58733&w=900">
        <div class="from">
            <form method="" action="">
                <h1>Thông tin cá nhân</h1>
                <div class="user">
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="name" class="name" placeholder="<%= account.getUserName() %>" readonly>
                </div>
                <div class="user">
                    <i class="fa-solid fa-phone-volume"></i>
                    <input type="text" name="phone" class="phone" placeholder="<%= account.getPhoneNumber() %>" readonly>
                </div>
                <div class="user">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="email" name="email" class="email" placeholder="<%= account.getEmail() %>" readonly>
                </div>
                <div class="user">
                    <i class="fa-solid fa-location-dot"></i>
                    <input type="text" name="address" class="address" placeholder="Địa chỉ">
                </div>
<%--                <div class="submit">--%>
<%--                   <a class="submit1" href="change_pass.jsp">Đổi mật khẩu</a>--%>
<%--                </div>--%>
                <div class="submit">
                    <button class="submit1" style="background: white; border: solid 1px black" type="submit" value=""><a style="color: black" href="change_pass.jsp">Đổi mật khẩu</a></button>
                </div>            </form>
        </div>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>

