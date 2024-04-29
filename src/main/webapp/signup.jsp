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
    <meta name="google-signin-client_id" content="588971069034-2223dffri7rruaqovf4n9vk5hnf6u28s.apps.googleusercontent.com">
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
        <form method="post" action="signup" id="formlogin">
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
                            <label for="name_login"></label><input type="text" title="Tên đăng ký 10-20 ký tự" name="username" id="name_login" placeholder="Tên đăng ký" minlength="10" maxlength="20">
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-key"></i>
                            <label for="pass"></label><input type="password" title="Mật khẩu 6-15 ký tự bao gồm chữ in hoa, chữ thường, số, và các ký tự đặc biệt" name="password" id="pass" placeholder="Nhập mật khẩu" class="" minlength="6" maxlength="15">
                            <i class="toggle-password fa-solid fa-eye-slash" style="position: relative;float: right;margin-top: -25px;margin-right: 20px; cursor: pointer" onclick="togglePasswordVisibility('pass')"></i>
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-phone"></i>
                            <label for="pass"></label><input type="text" title="Số điện thoại 10 ký tự số" name="phoneNumber" id="phone" placeholder="Nhập số điện thoại"
                                                             class="" pattern="[0-9]{10}" minlength="10" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="user">
                            <i class="fa-solid fa-envelope"></i>
                            <label for="email"></label><input type="email" title="Email phải có đuôi @gmail.com" name="email" id="email" placeholder="Nhập email" class="">
                        </div>
                        <div class="g-recaptcha" style="margin: 15px" data-sitekey="6Lc4rcgpAAAAACwsZRDq-vrt3Mh9VcE-Q-mKgpzS"></div>
                        <div style="color:red; margin: -15px 0 10px 15px" id="ero"></div>
                        <div class="submit">
                            <button class="submit1" type="submit" name="submit" onclick="checkCaptcha()"  value="">Đăng ký</button>
                        </div>
                        <p style="text-align: center">Hoặc đăng nhập với</p>
                        <div class="button-facebook-google">
                            <div class="button-facebook" style="margin-left: 50px">
                                <i class="fa-brands fa-facebook" style="color: blue"></i>
                                <button type="button" name="button" id="facebook" class="" value="">Facebook</button>
                            </div>
                            <div class="button-google">
                                <button type="button" name="button" id="google" class="g-signin2" data-onsuccess="onSignIn" style="margin-left: 20px;border-radius: 8px;border: solid 1px black" value=""></button>
                            </div>
                        </div>
                        <p>Nếu bạn đã có tài khoản vui lòng <a href="login.jsp" style="color: red">Đăng Nhập</a></p>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
</body>
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
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
        // Lấy thông tin người dùng từ tài khoản Google
        var profile = googleUser.getBasicProfile();
        var id_token = googleUser.getAuthResponse().id_token;

        // Gửi yêu cầu đăng ký thành công qua AJAX
        const xhr = new XMLHttpRequest();
        xhr.open('POST', "signup"); // Thay thế '/signup' bằng URL của endpoint xử lý đăng ký trên máy chủ của bạn
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                // Đăng ký thành công, xử lý phản hồi
                var response = JSON.parse(xhr.responseText);
                if (response.success) {
                    // Đăng ký thành công, thực hiện các hành động cần thiết
                    console.log('Đăng ký thành công');
                    window.location.href = 'index.jsp'; // Chuyển hướng đến trang đăng ký thành công
                } else {
                    // Đăng ký không thành công, xử lý lỗi
                    console.error('Đăng ký không thành công:', response.error);
                    document.getElementById('ero').textContent = response.error; // Hiển thị thông báo lỗi
                }
            } else {
                // Xử lý lỗi từ máy chủ
                console.error('Đã xảy ra lỗi khi gửi yêu cầu đăng ký:', xhr.statusText);
            }
        };
        xhr.send('id_token=' + id_token); // Gửi mã thông tin của tài khoản Google đến máy chủ
    }

</script>
</html>
