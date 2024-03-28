<%@ page import="java.util.List" %>
<%@ page import="org.example.web.db.JDBIConnector" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Led Tâm Quang</title>
    <link rel="stylesheet" href="access/css/index.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body>
<div id="navbar-top" class="">
    <div class="container">
        <jsp:include page="Layout/Header.jsp" />
<%--        slide show--%>
        <div id="image_item">
            <div class="bg_item">
                <div class="slideshow-container">
                    <div class="mySlides fade">
                        <div class="numbertext">1 / 3</div>
                        <img src="https://img.freepik.com/free-photo/glowing-light-bulb-fuels-ideas-innovation-generated-by-ai_188544-15498.jpg?t=st=1711544827~exp=1711548427~hmac=7e94cbe592aed7caec24d870697e1bea64b13ae9cc51ba73133b9f849bf14004&w=1060" style="width:100%; height: 500px" alt="slide 1">
                        <div class="text">Tia Sáng Rực Rỡ </div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext">2 / 3</div>
                        <img src="https://png.pngtree.com/thumb_back/fw800/background/20230718/pngtree-title-1-illuminated-light-bulb-shines-among-dim-incandescent-lamps-as-image_3910807.jpg" style="width:100%; height: 500px;" alt="slide 2">
                        <div class="text">Góc Nhìn Chiếu Sáng</div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext">3 / 3</div>
                        <img src="access/img/slide3.png" style="width:100%; height: 500px;" alt="slide 3">
                        <div class="text">Chiếu Sáng Bền Vững</div>
                    </div>
                </div>
                <br>
                <div style="text-align:center">
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>
        </div>
<%--        content trang chủ--%>
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
                                <td class="table_image1">
                                    <a href=""><img class="image_sp1" src="<%=product.getImg()%>" alt="sp1">
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
        <jsp:include page="Layout/Footer.jsp" />
    </div>
</div>
</body>
<script src="JS/popup-wrapper.js"></script>
<script src="JS/slideShow.js"></script>
</html>