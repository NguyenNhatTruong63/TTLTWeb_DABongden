<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 29/04/2024
  Time: 18:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta name="google-signin-client_id" content="539519155624-pv4spfq9mfnv4uc5otfca6lipnaeg7s5.apps.googleusercontent.com">
    <title>Title</title>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
<div class="button-google">
    <%--                                <i class="fa-brands fa-google" style="color: #FF0000"></i>--%>
    <button type="button" name="button" id="google" class="g-signin2" data-onsuccess="onSignIn" style="margin-left: 20px;border-radius: 8px;border: solid 1px black" value=""></button>
</div>

<script>
    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    }
</script>
</body>
</html>
