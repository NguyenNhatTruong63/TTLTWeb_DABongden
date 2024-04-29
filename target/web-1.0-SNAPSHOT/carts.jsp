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
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
        function validateInput() {
            var numberInput = document.getElementById("numberInput");

            if (numberInput.value < 0) {
                numberInput.value = 0;
            }
        }
    </script>
</head>
<body>
<div id="navbar-top" class="">
    <div class="container">
        <jsp:include page="Layout/Header.jsp"/>
        <div id="section_cart" class="#">
            <div class="container">
                <div id="cart1">
                    <div class="cart_product1">
                        <a class=order_history" href="order-history.jsp"><p class="text_order"> Lịch sử đơn hàng</p></a>
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
                        <p style="margin-left: 60px">Giỏ hàng của bạn trống. Vui lòng thêm sản phẩm vào giỏ hàng</p>
                        <%
                        } else {
//                                    int totalPriceForAllProducts = 0;
                            int id =1;
                            for (Map.Entry<Integer, CartsProduct> entry : cartItems.entrySet()) {
                                CartsProduct cartProduct = entry.getValue();
                                Product product = cartProduct.getProduct();
                        %>

                        <ul class="product1">
                            <li class="text_cart">
                                <div class="cart_product_image1">
                                    <a href="products.jsp?id_product=<%=product.getId()%>"><img class="cart_image1" src="<%=product.getImg()%>" alt="ảnh">
                                        <p class="text_dicount"><%=product.getDiscount()%> <br>Giảm </p></a>
                                </div>
                                <div class="cart_product_image2">
                                    <h1 class="text_cart1"><%=product.getName()%></h1>
                                    <p class="price_cart1"> Giá:
                                        <del><%=currencyFormatter.format(product.getPrice())%> </del> <%=currencyFormatter.format(product.salePrice())%>
                                        <button type="button" class="delete"><a href="removeCart?id=<%=product.getId()%>"><i style="color: black" class="fa-solid fa-trash"></i></a></button>
                                    </p>
                                    <form action="checkout" method="post">
                                        <div class="quantity">
                                            <div class="product-quantity">Số lượng</div>
                                            <div class="product-quantity-id">
                                                <div class="product-quantity-decrease">-</div>
                                                <div class="product-quantity-number" id= <%=id++%>><%=cartProduct.getQuantity()%></div>
<%--                                                <div class="product-quantity-number" id= <%=id++%>>1</div>--%>
                                                <div class="product-quantity-increase">+</div>
                                            </div>
                                        </div>
                                    </form>
                                    <p class="delivery">Dự kiến giao ngày: sau 3 ngày</p>
                                </div>
                            </li>
                        </ul>
                        <%}%>
                    </div>
                    <div class="button">
                        <button class="pay_cart" type="button"><a class="card" href="pay_page.jsp">Thanh Toán</a></button>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <jsp:include page="Layout/Footer.jsp"/>
    </div>
</div>

</body>
<%--<script>--%>
<%--    function plus() {--%>
<%--        let number = document.getElementById("numbera").innerHTML--%>
<%--        if (document.getElementById("plus")) {--%>
<%--            number++;--%>
<%--            document.getElementById("numbera").innerHTML = number--%>
<%--        }--%>

<%--    }--%>

<%--    function minus() {--%>
<%--        let number = document.getElementById("numbera").innerHTML--%>
<%--        if (document.getElementById("minus")) {--%>
<%--            number--;--%>
<%--            document.getElementById("numbera").innerHTML = number--%>
<%--            if (number < 0) {--%>
<%--                document.getElementById("numbera").innerHTML = 0;--%>
<%--            }--%>
<%--        }--%>

<%--    }--%>
<%--</script>--%>

<%--    function plus1() {--%>
<%--        let number = document.getElementById("numberb").innerHTML--%>
<%--        if (document.getElementById("plus1")) {--%>
<%--            number++;--%>
<%--            document.getElementById("numberb").innerHTML = number--%>
<%--        }--%>

<%--    }--%>

<%--    function minus1() {--%>
<%--        let number = document.getElementById("numberb").innerHTML--%>
<%--        if (document.getElementById("minus1")) {--%>
<%--            number--;--%>
<%--            document.getElementById("numberb").innerHTML = number--%>
<%--            if (number < 0) {--%>
<%--                document.getElementById("numberb").innerHTML = 0;--%>
<%--            }--%>
<%--        }--%>

<%--    }--%>
<%--</script>--%>
<script>
    const decreases = document.querySelectorAll(".product-quantity-decrease");
    const increases = document.querySelectorAll(".product-quantity-increase");
    decreases.forEach((decrease,index)=>{
        decrease.addEventListener("click", function (e) {
            e.preventDefault();
            const count = document.getElementById((index+1)+"");
            console.log(count);
            let currentValue = parseInt(count.textContent);
            if (currentValue >1){
                count.textContent = currentValue - 1;
            }
        });
    })


    increases.forEach((increase,index)=>{
        increase.addEventListener("click", function (e) {
            e.preventDefault();
            const count = document.getElementById((index+1)+"");
            console.log(count);
            let currentValue = parseInt(count.textContent);
            count.textContent = currentValue + 1;
        });
    })

</script>
<%--<script src="JS/plus_minus.js"></script>--%>
</html>
