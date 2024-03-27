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
        <div id="logo">
            <div class="logo1">
                <img class="img-logo" src="https://img.freepik.com/premium-psd/3d-business-pack-creative-idea_505787-314.jpg?w=740" alt="">
                <p class="sub-title">Led Tâm Quang</p>
                <div class="search">
                    <form action="./search" method="get">
                        <div><input class="search1" type="search" name="keyword" id="search-input" placeholder="Tìm kiếm sản phẩm"></div>
                        <div><button type="submit" value="" class="icon_search"><i class="fa-solid fa-magnifying-glass"></i></button></div>
                    </form>
                </div>

                <div id="nanavbar-collapse-01" class="collapse">
                    <nav id="navbar" class="navbar">
                        <ul>
                            <li><a href="index.jsp">Trang Chủ </a></li>
                            <li class="dropdown1"><a href="#"><span>Thương Hiệu</span><i class="fa-solid fa-caret-down"
                                                                                         style="color: white"></i>
                                <!--                                <img class="caret" src="assart/image/icon_button/caret-down.svg">-->
                            </a>
                                <ul>
                                    <li><a href="#">Rạng Đông</a></li>
                                    <li><a href="#">PHILIPS</a></li>
                                    <li><a href="#">OSRAM</a></li>
                                    <li><a href="#">Điện Quang</a></li>
                                    <li><a href="#">Duhal</a></li>
                                    <li><a href="#">Panasonic</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#"><span>Sản Phẩm</span> <i class="fa-solid fa-caret-down"
                                                                                      style="color: white"></i> </a>
                                <ul>
                                    <li class="dropdown"><a href="#"><span>Bóng Đèn Buld</span> <i
                                            class="fa-solid fa-caret-right"></i></a>
                                        <ul>
                                            <li><a href="#">Bóng Đèn Buld Led Tròn</a></li>
                                            <li><a href="#">Bóng Đèn Buld Led Trụ</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#"><span>Bóng Đèn Led Tuýp</span> <i
                                            class="fa-solid fa-caret-right"></i></a>
                                        <ul>
                                            <li><a href="#">Bóng Đèn Tuýp Led T5</a></li>
                                            <li><a href="#">Bóng Đèn Tuýp Led T8</a></li>
                                            <li><a href="#">Bóng Đèn Tuýp Led Bán Nguyệt</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#"><span>Bóng Đèn Âm Trần</span><i
                                            class="fa-solid fa-caret-right"></i></a>
                                        <ul>
                                            <li><a href="#">Bóng Đèn Âm Trần Led Tròn</a></li>
                                            <li><a href="#">Bóng Đèn Âm Trần Led Vuông</a></li>
                                            <li><a href="#">Bóng Đèn Âm Trần Led Viền</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#"><span>Bóng Đèn Ốp Trần</span><i
                                            class="fa-solid fa-caret-right"></i></a>
                                        <ul>
                                            <li><a href="#">Bóng Đèn Ốp Trần Led Tròn</a></li>
                                            <li><a href="#">Bóng Đèn Ốp Trần Led Vuông</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#"><span>Bóng Đèn Led Cảm Ứng</span><i
                                            class="fa-solid fa-caret-right"></i></a>
                                        <ul>
                                            <li><a href="#">Bóng Đèn Led Ốp Trần</a></li>
                                            <li><a href="#">Bóng Đèn Led Âm Trần</a></li>
                                            <li><a href="#">Bóng Đèn Led Hồng Ngoại</a></li>
                                            <li><a href="#">Bóng Đèn Led Sân Vườn</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#"><span>Bóng Đèn Sợi Đốt</span><i
                                            class="fa-solid fa-caret-right"></i></a>
                                        <ul>
                                            <li><a href="#">Bóng Đèn Sợi Đốt Halogen</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="./AddCartController">
                                <%Carts carts = (Carts) session.getAttribute("cart");
                                    if (carts == null) carts = new Carts();
                                %>
                                <img class="cart1" src="https://cdn-icons-png.freepik.com/256/2838/2838895.png?ga=GA1.1.2079026882.1697034920&" alt="">
                                <p class="text_cart"><%=carts.getTotal()%></p>
                            </a></li>
                            <% Dao dao = new Dao();
                                Account account = (Account) session.getAttribute("account");
                                if (account == null) account = new Account();
                            %>


                            <li class="dropdown2"><a class="resume" href="#"><span class="text_resume"><img
                                    class="user1" src="https://img.freepik.com/premium-psd/user-3d-icon_642950-57.jpg?w=740">Hello  <% if (session.getAttribute("account") != null) { %>
                                <%=account.getUserName() %>
                                <% } %> </span></a>
                                <ul>
                                    <% if (session.getAttribute("account") != null) { %>
                                    <li><a href="ttcn.jsp?id_user=<%= account.getId() %>">Thông tin cá nhân</a></li>
                                    <li><a href="#">Lịch sử đơn hàng</a></li>
                                    <% } %>

                                    <% if (session.getAttribute("account") == null) {%>
                                    <li><a href="login.jsp"> Đăng Nhập</a></li>
                                    <li><a href="signup.jsp">Đăng Ký</a></li>
                                    <% } %>
                                    <li><a href="policy.jsp">Chính Sách</a></li>
                                    <% if (session.getAttribute("account") != null) { %>
                                    <li><a href="logout">Đăng Xuất</a></li>
                                    <% } %>

                                </ul>
                            </li>

                            <li>
                                <span class="notify"><i class="fa-regular fa-bell fa-beat-fade fa-sm"
                                                        style="color: white"></i> </span>
                            </li>
                        </ul>
                    </nav><!-- .navbar -->
                </div>
            </div>
        </div>
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

<%--        <%--%>
<%--            Carts cart = (Carts) session.getAttribute("cart");--%>
<%--            if (cart == null)--%>
<%--                cart = new Carts();--%>

<%--            Map<Integer, CartsProduct> cartItems = cart.getData();--%>
<%--        %>--%>
<%--        <%--%>
<%--            Locale locale = new Locale("vi", "VN");--%>
<%--            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);--%>
<%--        %>--%>

<%--        <div class="cart_check_right">--%>
<%--            <h4>ĐƠN HÀNG CỦA BẠN</h4>--%>
<%--            <div class="info_cart">--%>
<%--                <div class="iii">--%>
<%--                    <span>SẢN PHẨM</span>--%>
<%--                    <span class="tong">TỔNG</span>--%>
<%--                </div>--%>
<%--                <ul>--%>
<%--                    <%--%>
<%--                        if (cartItems.isEmpty()) {--%>
<%--                    %>--%>
<%--                    <p style="width: 400px; text-align: center; margin-left: -80px">Thêm sản phẩm vào giỏ hàng--%>
<%--                        để tiến hành thanh toán</p>--%>
<%--                    <%--%>
<%--                    } else {--%>
<%--//                                    int totalPriceForAllProducts = 0;--%>
<%--                        for (Map.Entry<Integer, CartsProduct> entry : cartItems.entrySet()) {--%>
<%--                            CartsProduct cartProduct = entry.getValue();--%>
<%--                            Product product = cartProduct.getProduct();--%>
<%--                    %>--%>
<%--                    <%--%>
<%--                        // Lấy giá trị số lượng sản phẩm từ request--%>
<%--                        String quantity = request.getParameter("quantity");--%>
<%--                    %>--%>

<%--                    <li class="sp1">--%>
<%--                        <span><%=product.getName()%></span>--%>
<%--                        <span class="number"><%= quantity%></span><br>--%>
<%--                        <span>Giá:</span>--%>
<%--                        <span class="price">150.000đ</span>--%>
<%--                        <span class="total_price">150.000đ</span>--%>
<%--                    </li>--%>
<%--                    <li class="sp2">--%>
<%--                        <span>Đèn led âm trần Rạng Đông 16w D AT04L 155/16W </span>--%>
<%--                        <span class="number">x 2</span><br>--%>
<%--                        <span>Giá:</span>--%>
<%--                        <span class="price"><%=currencyFormatter.format(product.getPrice())%></span>--%>
<%--                        <span class="total_price"><%=currencyFormatter.format(product.getPrice())%></span>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <% if (!cartItems.isEmpty()) {%>--%>

<%--                <span class="l_total"> TỔNG THANH TOÁN</span>--%>
<%--                <%--%>
<%--                    for (Map.Entry<Integer, CartsProduct> entry : cartItems.entrySet()) {--%>
<%--                        CartsProduct cartProduct = entry.getValue();--%>
<%--                        Product product = cartProduct.getProduct();--%>
<%--                %>--%>
<%--                <span class="total"><%=product.getPrice()%></span>--%>

<%--                <% }--%>
<%--                } %>--%>

<%--&lt;%&ndash;                <span class="l_total"> TỔNG THANH TOÁN</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="total">630.000đ</span>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </div>--%>

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
        <div id="foot" class="">
            <div class="container">
                <div class="foot_alpha">
                    <img class="logo_flash_foot"
                         src="https://img.freepik.com/premium-psd/3d-business-pack-creative-idea_505787-314.jpg?w=740"
                         alt="">
                    <p class="text_foot">Led Tâm Quang</p>
                </div>
                <div class="foot_contact">
                    <ul class="contact">
                        <li class="text_contact"> Liên Hệ</li>
                        <li class="text_contact_email"> Email:<p class="email_contact">flashbulb01@gmail.com</p></li>
                        <li class="text_contact_telephone"> Điện Thoại:<p class="telephone_contact">0245730926 -
                            0257190589 </p></li>
                        <li class="text_policy"><a href="policy.html">Chính Sách</a></li>
                    </ul>
                </div>
                <div class="foot_address">
                    <p class="text_address1">Địa Chỉ:</p>
                    <p class="text_address"> 63 Khu Phố 6 Phường Linh Trung Thành Phố Thủ Đức TP.HCM</p>
                </div>
                <div class="foot_social">
                    <ul class="social">
                        <li class="text_social"> Liên Hệ Với Chúng Tôi</li>
                        <li class="social_icon"><a href="https://www.facebook.com/">
                            <img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/5968/5968764.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_facebook"></a></li>
                        <li class="social_icon"><a href="https://twitter.com/i/flow/login">
                            <img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/12942/12942278.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_twitter"></a></li>
                        <li class="social_icon"><a href="https://www.instagram.com/accounts/login/">
                            <img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/2111/2111463.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_instagram"></a></li>
                        <li class="social_icon"><a href="https://www.google.com/intl/vi/gmail/about/">
                            <img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/732/732200.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_email"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


