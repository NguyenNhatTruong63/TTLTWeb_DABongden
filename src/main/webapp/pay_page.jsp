<%@ page import="org.example.web.carts.Carts" %>
<%@ page import="org.example.web.carts.CartsProduct" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="org.example.web.services.Dao" %>
<%@ page import="org.example.web.beans.Account" %><%--
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
    <title>Thanh Toán</title>
    <link rel="stylesheet" href="access/css/pay.css">
    <link href="access/css/index.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
    <!--  <link href="assart/order.css" rel="stylesheet">-->
    <script>
        function openPopup() {
            document.getElementById("popup-wrapper_pay").style.display = "block";
        }

        function closePopup() {
            document.getElementById("popup-wrapper_pay").style.display = "none";
        }
    </script>
    <style>
        #search1 {
            margin-top: 0px;
        }

        .button_icon {
            display: inline-block;
            float: right;
            padding-right: 30px;
            margin-top: -52px;
        }

        .fa-trash:before {
            color: black;
            margin-left: 418px;
        }

        .fa-trash {
            font-weight: 900;
            margin-top: -40px;
        }

        .cart_check_right {

            margin-top: -466px;

        }

        .btn_dathang {
            padding: 10px 10px;
            margin-top: -23px;
            float: right;
            background: #FF0000;
            color: white;
            border-radius: 6px;
            border: 2px solid #FF0000;
            margin-right: 193px;
            font-size: 25px;

        }

        .btn_dathang a {
            text-decoration: none;
            color: white;
        }

        #foot .cart_check_right {
            margin-top: 100px;
        }
    </style>
</head>
<%
    String error = (String) (request.getAttribute("error"));
    if (error != null) {
        request.getAttribute("error");
    } else {
        error = "";
    }
%>
<body>


<!--header-->
<div id="navbar-top" class="">
    <div class="container">
        <jsp:include page="Layout/Header.jsp"/>
        <!--content thanh toán-->
        <div class="checkout">
            <span><img class="pay" src="https://cdn-icons-png.freepik.com/256/6442/6442646.png?ga=GA1.1.2079026882.1697034920&" height="100px" width="100px" alt=""></span>
            <p class="thanhtoan">THANH TOÁN</p>
            <p class="check_info">Vui lòng kiểm tra thông tin khách hàng, thông tin Giỏ hàng trước khi Thanh Toán</p>
        </div>

        <div class="input_group_left">
            <form action="" method="post">
            <p style="color: red"><%=error %></p>
            <h4>ThÔNG TIN KHÁCH HÀNG</h4>
            <div class="name">
                <label >Họ tên <br><input type="text" placeholder="Họ và tên"></label>
            </div>
            <div class="gtinh">
                <label>Giới tính <br>
                    <select name="gioiTinh">
                        <option value="nam"> Nam</option>
                        <option value="nu"> Nữ</option>
                    </select>
                </label>
            </div>
            <div class="address">
                <label>Địa chỉ <br>
                    <input type="text" placeholder="Địa chỉ người nhận">
                </label>
            </div>
            <div class="phone">
                <label> Điện thoại <br>
                    <input type="text" placeholder="Số điên thoại người nhận">
                </label>
            </div>
            <div class="email">
                <label> Email <br>
                    <input type="email" placeholder="Email">
                </label>
            </div>
            </form>
        </div>

        <%
            Carts cart = (Carts) session.getAttribute("cart");
            if (cart == null)
                cart = new Carts();

            Map<Integer, CartsProduct> cartItems = cart.getData();
        %>
        <%
            Locale locale = new Locale("vi", "VN");
            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        %>

        <div class="cart_check_right">
            <h4>ĐƠN HÀNG CỦA BẠN</h4>
            <div class="info_cart">
                <div class="iii">
                    <span>SẢN PHẨM</span>
                    <span class="tong">TỔNG</span>
                </div>

                <ul>
                    <%
                        if (cartItems.isEmpty()) {
                    %>
                    <p style="width: 400px; text-align: center; margin-left: -80px">Thêm sản phẩm vào giỏ hàng
                        để tiến hành thanh toán</p>
                    <%
                    } else {
//                                    int totalPriceForAllProducts = 0;
                        for (Map.Entry<Integer, CartsProduct> entry : cartItems.entrySet()) {
                            CartsProduct cartProduct = entry.getValue();
                            Product product = cartProduct.getProduct();
                    %>
                    <%
                        // Lấy giá trị số lượng sản phẩm từ request
                        String quantity = request.getParameter("quantity");
                    %>
                    <li class="sp1">
                        <span><%=product.getName() %></span>
                        <span class="number">x <%= quantity %></span><br>
                        <span class="delete"><a href="./remove?id=<%=product.getId()%>"> <i
                                class="fa-solid fa-trash"></i></a>
                                </span>
                        <span>Giá:</span>
                        <span class="price"><%=currencyFormatter.format(product.getPrice())%></span>
                        <span class="total_price"><%=currencyFormatter.format(product.getPrice())%></span>
                    </li>
                    <%
                            }
                        }
                    %>

                </ul>
                <% if (!cartItems.isEmpty()) {%>

                <span class="l_total"> TỔNG THANH TOÁN</span>
                <%
                    for (Map.Entry<Integer, CartsProduct> entry : cartItems.entrySet()) {
                        CartsProduct cartProduct = entry.getValue();
                        Product product = cartProduct.getProduct();
                %>
                <span class="total"><%=product.getPrice()%></span>

                <% }
                } %>

            </div>
        </div>
        <button class="btn_dathang"><a href="#" onclick="openPopup()"> Đặt Hàng</a></button>
        <div class="popup-wrapper_pay" id="popup-wrapper_pay">
            <div class="popup_pay">
                <div class="header1">
                    <span class="close" onclick="closePopup()">&times;</span>
                    <img class="order_image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8f2KuwLvTAb00OQQc2HnhMzfGatxp54czdA&usqp=CAU" alt="logo cart">
                    <h1 class="order_text">Đặt Hàng Thành Công</h1>
                </div>
                <div class="thankorder">
                    <p class="text_order_tc"> Cảm ơn bạn đã đặt hàng tại <span class="text_shop" style="color: red"> Led Tâm Quang</span></p>
                </div>
                <div class="money">
                    <p class="text_order_tc"> Bạn cần chuẩn bị số tiền tương ứng:</p>
                    <p class="text_price_order">630.000</p>
                </div>
                <div class="lscart">
                    <p class="text_order_tc"> Để xem lịch sử giỏi hàng vui lòng: <a class="lk_order" href="#">xem tại đây</a></p>
                </div>
                <div class="support">
                    <p class="text_order_tc"> Để được hỗ trợ vui lòng gọi vào: <span class="sdt">0245730926 hoặc 0257190589</span></p>
                </div>
                <div class="home">
                    <p class="text_order_tc">Quay về trang chủ: <a class="lk_order1" href="index.html">Tại đây</a></p>
                </div>
            </div>
        </div>

        <!--footer-->
        <jsp:include page="Layout/Footer.jsp"/>
    </div>
</div>
</body>
</html>


