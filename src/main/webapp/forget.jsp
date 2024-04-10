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
    <link rel="stylesheet" href="access/css/personal.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">

</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<div id="session" class="">
    <div class="container">
        <form method="" action="">
            <div id="personal">
                <h1>Quên mật khẩu</h1>
                <div class="content">
                    <div class="image">
                        <img class="img" src="https://img.freepik.com/premium-photo/yellow-light-bulb_172429-638.jpg?w=360" alt="ảnh">
                    </div>
                    <div class="infor">
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
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>

