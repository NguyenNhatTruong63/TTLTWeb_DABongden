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
    <title>Forget</title>
    <link href="access/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body>
<div id="login">
    <div class="container">
        <form action="" method="">
            <div id="login1" class="">
                <h1 class="title1">Quên mật khẩu</h1>
                <div class="name_login">
                    <i class="fa-regular fa-user"></i>
                    <label for="name_login"></label><input type="text" name="name_login" id="name_login" placeholder="Tên đăng nhập">
                </div>
                <div class="password">
                    <i class="fa-solid fa-key"></i>
                    <label for="pass"></label><input type="password" name="password" id="pass" placeholder="Nhập mật khẩu" class="">
                </div>
                <div class="password1">
                    <i class="fa-solid fa-key"></i>
                    <label for="pass1"></label><input type="password" name="password" id="pass1" placeholder="Nhập lại mật khẩu" class="">
                </div>
                <div class="submit">
                    <a href="index.jsp">Đăng Nhập</a>
                </div>
            </div>
        </form>
    </div>

</div>

</body>
</html>
