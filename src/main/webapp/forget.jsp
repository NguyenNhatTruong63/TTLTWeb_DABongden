
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
    <title>Quên mật Khẩu</title>
    <link rel="stylesheet" href="access/css/forgetpass.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">

</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<div id="session" class="">
    <div class="container">
        <img style="width: 1250px; height: 650px" src="https://img.freepik.com/free-photo/light-bulb-with-water-inside_1232-2108.jpg?t=st=1712065223~exp=1712068823~hmac=c8a2474167897521e8143b368bc8d312870c43535383163e401510fbd6a58733&w=900">
        <div class="from">
            <form method="" action="">
                <h1>Quên mật khẩu</h1>
                <div class="user">
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="name" class="name" placeholder="Tên đăng nhập">
                </div>
                <div class="user">
                    <i class="fa-solid fa-key"></i>
                    <input type="password" name="password" class="pass" placeholder="Mật khẩu mới ">
                </div>
                <div class="user">
                    <i class="fa-solid fa-key"></i>
                    <input type="password" name="password" class="pass1" placeholder="Nhập lại mật khẩu mới">
                </div>
                <div class="submit">
                    <button class="submit1" type="submit" value="">Đổi mật khẩu</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>

