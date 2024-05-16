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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cart</title>
    <link rel="stylesheet" href="access/css/index.css">
    <link rel="stylesheet" href="access/css/cart.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--    <script>--%>
<%--        function validateInput() {--%>
<%--            var numberInput = document.getElementById("numberInput");--%>

<%--            if (numberInput.value < 0) {--%>
<%--                numberInput.value = 0;--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
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
                            <li>
                                <div style="margin: 30px 0 0 -35px">
                                    <label>
                                        <input type="checkbox" name="checkbox" value="product1" style="width: 20px; height: 20px" onclick="handleCheckboxClick()">
                                    </label>
                                </div>
                            </li>
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
                                                <div class="product-quantity-number" id="<%=id++%>" onchange="handleQuantityChange(<%=product.getId()%>, this.innerText)"><%=cartProduct.getQuantity()%></div>
<%--                                                <div class="product-quantity-number" id= <%=id++%>><%=cartProduct.getQuantity()%></div>--%>
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
<%--                        <button class="pay_cart" type="button"><a class="card" href="pay_page.jsp">Thanh Toán</a></button>--%>
<%--                        <button class="pay_cart" type="button" onclick="handlePayment()">Thanh Toán</button>--%>
                        <button id="pay_cart" type="button">Thanh Toán</button>
                    </div>
                    <%}%>

                    <script>
                        $(document).ready(function(){
                            // Xử lý khi nhấn nút thanh toán
                            $('#pay_cart').click(function(){
                                // Lọc ra các sản phẩm đã được chọn
                                const checkedProducts = [];
                                $('input[type="checkbox"]:checked').each(function() {
                                    checkedProducts.push($(this).val());
                                });

                                // Kiểm tra xem có sản phẩm nào được chọn không
                                if (checkedProducts.length > 0) {
                                    // Chuyển hướng người dùng đến trang thanh toán và truyền danh sách các sản phẩm đã chọn
                                    window.location.href = "pay_page.jsp?products=" + encodeURIComponent(JSON.stringify(checkedProducts));
                                } else {
                                    alert("Vui lòng chọn ít nhất một sản phẩm để thanh toán.");
                                }
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
        <jsp:include page="Layout/Footer.jsp"/>
    </div>
</div>
</body>
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
<%--<script>--%>
<%--    // Hàm xử lý khi số lượng sản phẩm thay đổi--%>
<%--    function handleQuantityChange(productId, quantity) {--%>
<%--        // Lưu số lượng sản phẩm vào local storage--%>
<%--        var quantities = JSON.parse(localStorage.getItem("productQuantities")) || {};--%>
<%--        quantities[productId] = quantity;--%>
<%--        localStorage.setItem("productQuantities", JSON.stringify(quantities));--%>
<%--    }--%>

<%--    // Hàm xử lý khi chọn checkbox--%>
<%--    function handleCheckboxClick() {--%>
<%--        var checkboxes = document.getElementsByName("checkbox");--%>
<%--        var selectedProducts = [];--%>

<%--        for (var i = 0; i > checkboxes.length; i++) {--%>
<%--            if (checkboxes[i].checked) {--%>
<%--                var productId = checkboxes[i].parentNode.querySelector('.product-quantity-number').id;--%>
<%--                selectedProducts.push(productId);--%>
<%--            }--%>
<%--        }--%>

<%--        // Lưu danh sách các sản phẩm đã chọn vào local storage--%>
<%--        localStorage.setItem("selectedProducts", JSON.stringify(selectedProducts));--%>
<%--    }--%>

<%--    // Hàm xử lý khi nhấn nút thanh toán--%>
<%--    function handlePayment() {--%>
<%--        // Lấy danh sách các sản phẩm đã chọn từ local storage--%>
<%--        var selectedProducts = JSON.parse(localStorage.getItem("selectedProducts"));--%>

<%--        // Chuyển hướng người dùng đến trang thanh toán chỉ khi có ít nhất một sản phẩm được chọn--%>
<%--        if (selectedProducts && selectedProducts.length > 0) {--%>
<%--            window.location.href = "pay_page.jsp";--%>
<%--        } else {--%>
<%--            alert("Vui lòng chọn ít nhất một sản phẩm để thanh toán.");--%>
<%--        }--%>
<%--    }--%>

<%--</script>--%>
<%--<script src="JS/plus_minus.js"></script>--%>
</html>

