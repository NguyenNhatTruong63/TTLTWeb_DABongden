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
        <div id="logo">
            <div class="logo1">
                <img class="img-logo" src="https://img.freepik.com/premium-psd/3d-business-pack-creative-idea_505787-314.jpg?w=740" alt="">
                <p class="sub-title">Led Tâm Quang</p>
                <div class="search">
                    <input class="search1" type="search" name="search" id="search-input"
                           placeholder="Tìm kiếm sản phẩm">
                    <i class="fa-solid fa-magnifying-glass"></i>
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

                            <li class="dropdown2"><a class="resume" href="#"><span class="text_resume">
<!--                                <img class="user1" src="access/img/logo/user.jpg">Hello</span></a>-->
                                <img class="user1" src="https://img.freepik.com/premium-psd/user-3d-icon_642950-57.jpg?w=740" alt=""> Hello</span></a>
                                <!--                            <img class="caret" src="assart/image/icon_button/caret-down.svg"></a>-->
                                <ul>
                                    <li><a href="#">Thông tin cá nhân</a></li>
                                    <li><a href="#">Lịch sử đơn hàng</a></li>
                                    <li><a href="policy.html">Chính Sách</a></li>
                                    <li><a href="login.html"> Đăng Nhập</a></li>
                                    <li><a href="signup.html">Đăng ký</a></li>
                                    <li><a href="index.html">Đăng Xuất</a></li>
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
                                <button class="pay_cart"><a class="card" href="pay_page.html">Thanh Toán</a></button>
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

        <div id="foot" class="">
            <div class="container">
                <div class="foot_alpha">
                    <img class="logo_flash_foot" src="https://img.freepik.com/premium-psd/3d-business-pack-creative-idea_505787-314.jpg?w=740" alt="">
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
                        <li class="social_icon"><a href="https://www.facebook.com/"> <img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/5968/5968764.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_facebook"></a></li>
                        <li class="social_icon"><a href="https://twitter.com/i/flow/login"><img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/12942/12942278.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_twitter"></a></li>
                        <li class="social_icon"><a href="https://www.instagram.com/accounts/login/"><img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/2111/2111463.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_instagram"></a></li>
                        <li class="social_icon"><a href="https://www.google.com/intl/vi/gmail/about/"><img class="icon_foot" src="https://cdn-icons-png.freepik.com/256/732/732200.png?ga=GA1.1.2079026882.1697034920&" style="width: 35px; height: 35px" alt="link_email"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    function plus(){
        let number = document.getElementById("numbera").innerHTML
        if (document.getElementById("plus")){
            number ++;
            document.getElementById("numbera").innerHTML = number
        }

    }
    function minus(){
        let number = document.getElementById("numbera").innerHTML
        if (document.getElementById("minus")){
            number --;
            document.getElementById("numbera").innerHTML = number
            if(number < 0){
                document.getElementById("numbera").innerHTML = 0;
            }
        }

    }
    function plus1(){
        let number = document.getElementById("numberb").innerHTML
        if (document.getElementById("plus1")){
            number ++;
            document.getElementById("numberb").innerHTML = number
        }

    }
    function minus1(){
        let number = document.getElementById("numberb").innerHTML
        if (document.getElementById("minus1")){
            number --;
            document.getElementById("numberb").innerHTML = number
            if(number < 0){
                document.getElementById("numberb").innerHTML = 0;
            }
        }

    }
</script>
</html>
