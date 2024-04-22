<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14/03/2024
  Time: 14:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="access/css/personal.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
    <%
        String error = (String)(request.getAttribute("error"));
        if(error != null) {
            request.getAttribute("error");
        } else {
            error = "";
        }
        String username = request.getParameter("username") != null ? request.getParameter("username") : "";
    %>
</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<div id="session" class="">
    <div class="container">
        <form action="login" method="post">
            <div id="personal" class="">
                <h1>Login</h1>
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
                            <input type="text" name="username" id="name_login" placeholder="Tên đăng nhập" value="<%=username%>">
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-key"></i>
                            <input type="password" name="password" id="pass" placeholder="Nhập mật khẩu" class="">
                        </div>
                        <div class="forget">
                            <a href="forget.jsp"><p class="title_forget">Quên mật khẩu</p></a>
                        </div>
                        <div class="society6" style="width: 250px;height: 30px;margin: 40px 0 0 30px ;text-align: center;padding-left: 50px;">
                            <a class="" href="https://www.facebook.com/"><img src="https://cdn-icons-png.freepik.com/256/5968/5968764.png?ga=GA1.1.2079026882.1697034920&" style="width: 30px; height: 30px;" alt=""></a>
                            <a class="" href="https://www.google.com/intl/vi/gmail/about/"><img src="https://cdn-icons-png.freepik.com/256/300/300221.png?ga=GA1.1.2079026882.1697034920&" alt="" style="width: 30px; height: 30px;"></a>
                        </div>
                        <div class="submit">
                            <button class="submit1" type="submit" value="">Đăng nhập</button>
<%--                            <input type="submit" value="Đăng nhập">--%>
                        </div>
                        <p style="text-align: center">Nếu bạn chưa có tài khoản, vui lòng <a class="signup0" style="color: red" href="signup.jsp">Đăng ký</a></p>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>
