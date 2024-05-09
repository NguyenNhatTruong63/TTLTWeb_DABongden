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
<%
    String error = (String) (request.getAttribute("error"));
    if (error != null) {
        request.getAttribute("error");
    } else {
        error = "";
    }
    String username = request.getParameter("username") != null ? request.getParameter("username") : "";
%>
<jsp:include page="Layout/Header.jsp"/>
<div id="session" class="">
    <div class="container">
        <form method="post" action="changePassword" id="formlogin">
            <div id="personal" class="">
                <h1>Quên mật khẩu</h1>
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
                            <input type="text" title="Tên đăng nhập 10-20 ký tự" name="username" id="name_login" placeholder="Tên đăng nhập" value="<%=username%>" minlength="10" maxlength="20">
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-key"></i>
                            <input type="password" title="Mật khẩu 6-15 ký tự bao gồm chữ in hoa, chữ thường, số, và các ký tự đặc biệt" name="newPassword" id="pass" placeholder="Nhập mật khẩu" class="" minlength="6" maxlength="15">
                            <i class="toggle-password fa-solid fa-eye-slash" style="position: relative;float: right;margin-top: -25px;margin-right: 20px; cursor: pointer" onclick="togglePasswordVisibility('pass')"></i>
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-key"></i>
                            <input type="password" title="Mật khẩu vừa nhập ở trên" name="repassword" id="pass1" placeholder="Nhập lại mật khẩu mới" maxlength="15" minlength="6">
                            <i class="toggle-password1 fa-solid fa-eye-slash" style="position: relative;float: right;margin-top: -25px;margin-right: 20px; cursor: pointer" onclick="togglePasswordVisibility1('pass1')"></i>
                        </div>
                        <div class="g-recaptcha" style="margin: 15px" data-sitekey="6Lc4rcgpAAAAACwsZRDq-vrt3Mh9VcE-Q-mKgpzS"></div>
                        <div style="color:red; margin: -15px 0 10px 15px" id="ero"></div>
                        <div class="submit">
                            <button class="submit1" type="button" onclick="checkCaptcha()"  value="">Đổi mật khẩu</button>
                        </div>
                    </div>




<%--                    <div class="infor">--%>
<%--                        <div class="err">--%>
<%--                            <p class="error1"><%=error%></p>--%>
<%--                        </div>--%>
<%--                        <div class="user">--%>
<%--                            <i class="fa-solid fa-user"></i>--%>
<%--                            <input type="text" title="Tên đăng nhập 10-20 ký tự" name="username" id="name_login" placeholder="Tên đăng nhập" value="<%=username%>" minlength="10" maxlength="20">--%>
<%--                        </div>--%>
<%--                        <div class="user">--%>
<%--                            <i class="fa-solid fa-key"></i>--%>
<%--                            <input type="password" title="Mật khẩu 6-15 ký tự bao gồm chữ in hoa, chữ thường, số, và các ký tự đặc biệt" name="newPassword" id="pass" placeholder="Nhập mật khẩu" class="" minlength="6" maxlength="15">--%>
<%--                        </div>--%>
<%--                        <div class="user">--%>
<%--                            <i class="fa-solid fa-key"></i>--%>
<%--                            <input type="password" title="Mật khẩu vừa nhập ở trên" name="repassword" class="pass1" placeholder="Nhập lại mật khẩu mới" maxlength="15" minlength="6">--%>
<%--                        </div>--%>

<%--                        <div class="g-recaptcha" style="margin: 15px" data-sitekey="6Lc4rcgpAAAAACwsZRDq-vrt3Mh9VcE-Q-mKgpzS"></div>--%>
<%--                        <div style="color:red; margin: -15px 0 10px 15px" id="ero"></div>--%>
<%--                        <div class="submit">--%>
<%--                            <button class="submit1" type="button" onclick="checkCaptcha()"  value="">Đổi mật khẩu</button>--%>
<%--                        </div>--%>
<%--&lt;%&ndash;                        <div class="submit">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <button class="submit1" type="submit" value="">Đổi mật khẩu</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                    </div>--%>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
    function checkCaptcha(){
        var  form = document.getElementById("formlogin")
        var  error = document.getElementById("ero")
        const response = grecaptcha.getResponse();
        if(response){
            form.submit();
        }else {
            error.textContent ="Vui lòng chọn recaptcha"
        }
    }
</script>
<script>
    function togglePasswordVisibility(inputId) {
        const passwordInput = document.getElementById(inputId);
        const icon = document.querySelector('.toggle-password');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.add('fa-eye');
            icon.classList.remove('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.add('fa-eye-slash');
            icon.classList.remove('fa-eye');
        }
    }
    function togglePasswordVisibility1(inputId) {
        const passwordInput = document.getElementById(inputId);
        const icon = document.querySelector('.toggle-password1');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.add('fa-eye');
            icon.classList.remove('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.add('fa-eye-slash');
            icon.classList.remove('fa-eye');
        }
    }
</script>
</body>
</html>

