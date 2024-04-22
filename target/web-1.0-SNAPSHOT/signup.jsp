<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14/03/2024
  Time: 14:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    <link rel="stylesheet" href="access/css/personal.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
    <%
        String error = (String) (request.getAttribute("error"));
        if (error != null) {
            request.getAttribute("error");
        } else {
            error = "";
        }
        String userName = request.getParameter("username") != null ? request.getParameter("username") : "";
    %>
</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<div id="session">
    <div class="container">
        <form method="post" action="signup">
            <div id="personal" class="">
                <h1>SignUP</h1>
                <div class="content">
                    <div class="image">
                        <img class="img" src="https://img.freepik.com/premium-photo/yellow-light-bulb_172429-638.jpg?w=360" alt="ảnh">
                    </div>
                    <div class="infor">
                        <div class="err">
                            <p class="error1"><%=error%></p>
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-user"></i>
                            <label for="name_login"></label><input type="text" name="username" id="name_login" placeholder="Tên đăng ký">
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-key"></i>
                            <label for="pass"></label><input type="password" name="password" id="pass" placeholder="Nhập mật khẩu" class="">
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-phone"></i>
                            <label for="pass"></label><input type="text" name="phoneNumber" id="phone" placeholder="Nhập số điện thoại" class="">
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-envelope"></i>
                            <label for="email"></label><input type="email" name="email" id="email" placeholder="Nhập email" class="">
                        </div>
                        <div class="submit">
                            <button class="submit1" type="submit" name="submit" value="">Đăng ký</button>
                        </div>
                        <p>Nếu bạn đã có tài khoản vui lòng <a href="login.jsp" style="color: red">Đăng Nhập</a></p>
<%--                        <div class="submit"><input type="submit" value="Đăng ký"></div>--%>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>
