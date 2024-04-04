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
    <link href="access/css/login.css" rel="stylesheet">
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
    <style>
        .btn_dk input {
            text-decoration: none; /*bỏ gạch chân*/
            border: 3px solid black;
            border-radius: 60px;
            padding: 10px 20px;
            color: white;
            font-size: 30px;
            font-weight: bold;
            background: black;
        }

        .btn_dk input:hover {
            margin-top: 0px;
            background: white;
            color: black;
        }

        h2 {
            width: 500px;
            margin-left: -42px;
        }
        .back p, .back a {
            font-size: 20px;
            text-decoration: none;
            font-style: italic;
            margin-top: 18px;
            text-align: center;
        }
        a{
            padding: 0px 0px 0px 0px;
            background: none;
            color: mediumpurple;
            border-radius: unset;
            border: unset;
        }
    </style>
    <p style="color: white;
font-weight: bold;
font-size: 20px;
width: 500px;
height: auto;
margin-left: -50px;
margin-top: -8px;
position: absolute;
text-align: center;
border-radius: 5px;
background: red;

">
        <%= error %>
    </p>
</head>
<body>
<div id="login">
    <div class="container">
        <form method="post" action="./signup">
            <div id="login1" class="">
                <h1 class="title1">SignUP</h1>
                <div class="name_login">
                    <i class="fa-regular fa-user"></i>
                    <label for="name_login"></label><input type="text" name="username" id="name_login" placeholder="Tên đăng ký">
                </div>
                <div class="password">
                    <i class="fa-solid fa-key"></i>
                    <label for="pass"></label><input type="password" name="password" id="pass" placeholder="Nhập mật khẩu" class="">
                </div>
                <div class="password">
                    <i class="fa-solid fa-key"></i>
                    <label for="pass"></label><input type="password" name="repassword" id="pas" placeholder="Nhập lại mật khẩu" class="">
                </div>
                <div class="email">
                    <i class="fa-regular fa-envelope"></i>
                    <label for="email"></label><input type="email" name="email" id="email" placeholder="Nhập email" class="">
                </div>
                <div class="password">
                    <i class="fa-solid fa-key"></i>
                    <label for="pass"></label><input type="text" name="number" id="phone" placeholder="phone" class="">
                </div>
<%--                <div class="submit"><a href="index.html">Đăng ký</a></div>--%>
                <div class="submit"><input type="submit" value="Đăng ký"></div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
