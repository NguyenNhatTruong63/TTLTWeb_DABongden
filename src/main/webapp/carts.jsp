<%@ page import="org.example.web.carts.Carts" %>
<%@ page import="java.util.Locale" %>
<%@ page import="org.example.web.carts.CartsProduct" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="org.example.web.beans.Product" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14/03/2024
  Time: 14:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>cart</title>
    <link rel="stylesheet" href="access/css/index.css">
    <link rel="stylesheet" href="access/css/cart.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body>
<div id="navbar-top" class="">
    <div class="container">
        <jsp:include page="Layout/Header.jsp"/>

        <div id="section_cart" class="#">
            <div class="container">
                <div id="cart1">
                    <div class="cart_product1">
                        <a class=order_history" href="#"><p class="text_order"> Lịch sử đơn hàng</p></a>
                        <%
                            Carts cart = (Carts) session.getAttribute("cart");
                            if (cart == null)
                                cart = new Carts();

                            Map<Integer, CartsProduct> cartItems = cart.getData();
                        %>

                        <%
                            Locale locale = new Locale("vi", "VN");
                            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);%>
                        <%
                            if (cartItems.isEmpty()) {
                        %>
                        <p>Giỏ hàng của bạn trống. Vui lòng thêm sản phẩm vào giỏ hàng</p>
                        <%
                        } else {
//                                    int totalPriceForAllProducts = 0;
                            for (Map.Entry<Integer, CartsProduct> entry : cartItems.entrySet()) {
                                CartsProduct cartProduct = entry.getValue();
                                Product product = cartProduct.getProduct();
                        %>

                        <ul class="product1">
                            <li class="cart_product_image1">
                                <p class="text_dicount"><%=product.getDiscount()%> <br>Giảm </p>
                                <img class="cart_image1" src="<%=product.getImg()%>" alt="">
                            </li>
                            <li class="text_cart">
                                <h1 class="text_cart1"> <%=product.getName()%></h1>
                                <p class="price_cart1">Giá: <del><%=product.getPrice()%>đ</del> 105.000đ</p>
                                <span class="delete"><i class="fa-solid fa-trash"></i></span>
                                <p class="delivery">Dự kiến giao ngày: 10/11/20023 - 12/11/2023</p>
                                <div class="add_quantity">
                                    <p class="quantity">Số Lượng</p>
                                    <button id="minus" onclick="minus()">-</button>
                                    <p id="numbera">0</p>
                                    <button id="plus" onclick="plus()">+</button>
                                </div>
                                <button class="pay_cart"><a class="card" href="pay_page.jsp">Thanh Toán</a></button>
                            </li>
                        </ul>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Layout/Footer.jsp"/>
    </div>
</div>

</body>
<%--<script>--%>
<%--    --%>
<%--    function plus1(){--%>
<%--        let number = document.getElementById("numberb").innerHTML--%>
<%--        if (document.getElementById("plus1")){--%>
<%--            number ++;--%>
<%--            document.getElementById("numberb").innerHTML = number--%>
<%--        }--%>

<%--    }--%>
<%--    function minus1(){--%>
<%--        let number = document.getElementById("numberb").innerHTML--%>
<%--        if (document.getElementById("minus1")){--%>
<%--            number --;--%>
<%--            document.getElementById("numberb").innerHTML = number--%>
<%--            if(number < 0){--%>
<%--                document.getElementById("numberb").innerHTML = 0;--%>
<%--            }--%>
<%--        }--%>

<%--    }--%>
<%--</script>--%>
<script src="JS/plus_minus.js"></script>
</html>
