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
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="539519155624-pv4spfq9mfnv4uc5otfca6lipnaeg7s5.apps.googleusercontent.com">
    <title>Login</title>
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="access/css/personal.css">
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
        <form action="login" method="post" id="formlogin">
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
                        <div class="user12">
                            <i class="fa-solid fa-user"></i>
                            <input type="text" title="Tên đăng nhập 10-20 ký tự" name="username" id="name_login" placeholder="Tên đăng nhập" value="<%=username%>" minlength="10" maxlength="20">
                        </div>
                        <div class="user12">
                            <i class="fa-solid fa-key"></i>
                            <input type="password" title="Mật khẩu 6-15 ký tự bao gồm chữ in hoa, chữ thường, số, và các ký tự đặc biệt" name="password" id="pass" placeholder="Nhập mật khẩu" class="" minlength="6" maxlength="15">
                            <i class="toggle-password fa-solid fa-eye-slash" style="position: relative;float: right;margin-top: -25px;margin-right: 20px; cursor: pointer" onclick="togglePasswordVisibility('pass')"></i>
                        </div>
                        <div class="g-recaptcha" style="margin: 15px" data-sitekey="6Lc4rcgpAAAAACwsZRDq-vrt3Mh9VcE-Q-mKgpzS"></div>
                        <div style="color:red; margin: -15px 0 10px 15px" id="ero"></div>
                        <div class="submit">
                            <button class="submit1" type="submit" onclick="checkCaptcha()"  value="">Đăng nhập</button>
                        </div>
                        <p style="text-align: center">Hoặc đăng nhập với</p>
                        <div class="button-facebook-google">
                            <div class="button-facebook" style="margin-left: 20px">
                                <i class="fa-brands fa-facebook" style="color: blue"></i>
                                <button type="button" name="button" id="facebook" class="" value="">Facebook</button>
                            </div>
                            <div class="button-google">
                                <%--                                <i class="fa-brands fa-google" style="color: #FF0000"></i>--%>
                                <button type="button" name="button" id="google" class="g-signin2" data-onsuccess="onSignIn" style="margin-left: 20px;border-radius: 8px;border: solid 1px black" value=""></button>
                            </div>

                        </div>
                        <div class="forget">
                            <a href="forget.jsp"><p class="title_forget" style="text-align: center; color: black">Quên mật khẩu</p></a>
                        </div>
                        <p style="text-align: center">Nếu bạn chưa có tài khoản, vui lòng <a class="signup0" style="color: red" href="signup.jsp">Đăng ký</a></p>
                    </div>
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
</script>
<script>
    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    }
</script>
<%--<script>--%>
<%--    function onSignIn(googleUser) {--%>
<%--        // Lấy thông tin người dùng từ tài khoản Google--%>
<%--        var profile = googleUser.getBasicProfile();--%>
<%--        var id_token = googleUser.getAuthResponse().id_token;--%>

<%--        // Gửi yêu cầu đăng ký thành công qua AJAX--%>
<%--        const xhr = new XMLHttpRequest();--%>
<%--        xhr.open('POST', "signup"); // Thay thế '/signup' bằng URL của endpoint xử lý đăng ký trên máy chủ của bạn--%>
<%--        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');--%>
<%--        xhr.onload = function() {--%>
<%--            if (xhr.status === 200) {--%>
<%--                // Đăng ký thành công, xử lý phản hồi--%>
<%--                var response = JSON.parse(xhr.responseText);--%>
<%--                if (response.success) {--%>
<%--                    // Đăng ký thành công, thực hiện các hành động cần thiết--%>
<%--                    console.log('Đăng ký thành công');--%>
<%--                    window.location.href = 'index.jsp'; // Chuyển hướng đến trang đăng ký thành công--%>
<%--                } else {--%>
<%--                    // Đăng ký không thành công, xử lý lỗi--%>
<%--                    console.error('Đăng ký không thành công:', response.error);--%>
<%--                    document.getElementById('ero').textContent = response.error; // Hiển thị thông báo lỗi--%>
<%--                }--%>
<%--            } else {--%>
<%--                // Xử lý lỗi từ máy chủ--%>
<%--                console.error('Đã xảy ra lỗi khi gửi yêu cầu đăng ký:', xhr.statusText);--%>
<%--            }--%>
<%--        };--%>
<%--        xhr.send('id_token=' + id_token); // Gửi mã thông tin của tài khoản Google đến máy chủ--%>
<%--    }--%>

<%--</script>--%>
</body>
</html>


