<%@ page import="java.util.List" %>
<%@ page import="org.example.web.db.JDBIConnector" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="org.example.web.carts.Carts" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Food and Drinks</title>
    <link rel="stylesheet" href="access/css/index.css">
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
                    <input class="search1" type="search" name="search" id="search-input" placeholder="Tìm kiếm sản phẩm">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>

                <div id="nanavbar-collapse-01" class="collapse">
                    <nav id="navbar" class="navbar">
                        <ul>
                            <li><a href="index.html">Trang Chủ </a></li>
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

                            <li class="dropdown2"><a class="resume" href="#"><span class="text_resume"><img
                                    class="user1" src="https://img.freepik.com/premium-psd/user-3d-icon_642950-57.jpg?w=740">Hello</span></a>
                                <!--                            <img class="caret" src="assart/image/icon_button/caret-down.svg"></a>-->

                                <ul>
                                    <li><a href="#">Thông tin cá nhân</a></li>
                                    <li><a href="#">Lịch sử đơn hàng</a></li>
                                    <li><a href="policy.html">Chính Sách</a></li>
                                    <li><a href="login.jsp"> Đăng Nhập</a></li>
                                    <li><a href="signup.jsp">Đăng ký</a></li>
                                    <li><a href="logout">Đăng Xuất</a></li>
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
        <div id="image_item" class="">
            <div class="item_bg">
                <img class="bg_item" src="https://img.freepik.com/free-photo/glowing-light-bulb-fuels-ideas-innovation-generated-by-ai_188544-15498.jpg?t=st=1710248163~exp=1710251763~hmac=33a0ade607a80b139140ada81072fb35fabbc974a25bcf490b35dac3d7a9e90b&w=1060" alt="">
                <!--                <img class="bg_item" src="https://img.freepik.com/free-photo/glowing-filament-ignites-ideas-innovative-solutions-generated-by-ai_188544-9614.jpg?t=st=1710247215~exp=1710250815~hmac=fa254d0cbf0306e1058a5e6b553c8dcf9e1f85e8e85e53d97929d61cbb58d77a&w=1060" alt="">-->
                <!--                                <p class="text_bg"> Thắp sáng mọi nơi - Sưởi ấm mọi ngôi nhà</p>-->
            </div>
        </div>

        <div id="section_body_table" class="">
            <div class="container">
                <div class="box_product">
                    <div class="box_table">
                        <table class="table_product" border="0px" cellspacing="20px" cellpadding="1px" >
                            <caption class="caption"> Sản Phẩm Bán Chạy Nhất</caption>
                            <%JDBIConnector Dao = new JDBIConnector();%>
                            <%List<Product> list = Dao.getAllProduct();%>
                            <%for (Product product:list){%>
                            <tr id="section_product" class="products" style="float: left">
                                <td class="table_image1" style="height: 300px; width: 300px; border: solid 1px black">
                                    <a href=""><img class="image_sp1" src="<%=product.getImg()%>" style="width: 300px; height: 300px" alt="sp1">
                                        <p class="text_dicount"><%=product.getDiscount()%> <br>Giảm </p></a>
                                    <p class="text_sp1"><%=product.getName()%></p>
                                    <div class="purch_price">
                                        <p class="price_sp1"><del><%=product.getPrice()%></del> 105.000đ</p>
                                        <button class="purche"><a href="AddCartController?id=<%= product.getId()%>" onclick="openPopup()"> Thêm vào giỏ hàng</a></button>
                                        <div class="popup-wrapper" id="popup-wrapper">
                                            <div class="popup">
                                                <span class="close" onclick="closePopup()">&times;</span>
                                                <img class="order_image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8f2KuwLvTAb00OQQc2HnhMzfGatxp54czdA&usqp=CAU" alt="">
                                                <p>Đã thêm vào giỏ hàng thành công</p>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </table>
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
    function  openPopup(){
        document.getElementById("popup-wrapper").style.display = "block";
    }
    function  closePopup(){
        document.getElementById("popup-wrapper").style.display = "none";
    }
</script>
</html>