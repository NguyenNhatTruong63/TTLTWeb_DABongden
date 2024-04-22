<%@ page import="java.util.List" %>
<%@ page import="org.example.web.db.JDBIConnector" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Led Tâm Quang</title>
    <link rel="stylesheet" href="access/css/index.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
    <script>
        function  openPopup(){
            document.getElementById("popup-wrapper").style.display = "block";
        }
        function  closePopup(){
            document.getElementById("popup-wrapper").style.display = "none";
        }
    </script>
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
                        <img src="https://lh5.googleusercontent.com/GBUP_-MmtFCRhZIgjgb0sB89g_lq8xlvX7AG4bfnfrZt7o39g5rE8wtKDyjnoWGMTAKzgLxY5qZ3zvqi4HECftAypzemNXDZoBz03c9rYhUWYdRrYzTGPiVY4UyN0eQDSnrmr9Djf_kWQhLTfOhz3woJfSc5c8ZyujAnFPdwUpRG7KqTNZqWbIeQzA" style="width:100%; height: 500px" alt="slide 1">
                        <div class="text">Tia Sáng Rực Rỡ </div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext">2 / 3</div>
                        <img src="https://diennuockhanhtrung.com/wp-content/uploads/2021/05/bong-den-tiet-kiem-dien-1-1.jpg" style="width:100%; height: 500px;" alt="slide 2">
                        <div class="text">Góc Nhìn Chiếu Sáng</div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext">3 / 3</div>
                        <img src="https://denledphilips.com/bong-den-led-philips-hutraco.png" style="width:100%; height: 500px;" alt="slide 3">
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
                            <%JDBIConnector jdbiConnector = new JDBIConnector();%>
                            <%List<Product> list = jdbiConnector.getAllProduct();%>
                            <%for (Product product:list){%>
                            <%Locale locale = new Locale("vi", "VN");%>
                            <%NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);%>

                            <tr id="section_product" class="products" style="float: left">
                                <td class="table_image1">
                                    <a href="products.jsp?id_product=<%=product.getId()%>"><img class="image_sp1" src="<%=product.getImg()%>" alt="sp1">
                                        <p class="text_dicount"><%=product.getDiscount()%> <br>Giảm </p></a>
                                    <p class="text_sp1"><%=product.getName()%></p>
                                    <div class="purch_price">
                                        <p class="price_sp1"><del><%=currencyFormatter.format(product.getPrice())%></del> <%=currencyFormatter.format(product.salePrice())%></p>
                                        <button class="purche"><a href="AddCartController?id=<%= product.getId()%>" onclick="openPopup()"> Thêm vào giỏ hàng</a></button>
                                        <div class="popup-wrapper" id="popup-wrapper">
                                            <div class="popup">
                                                <span class="close" onclick="closePopup()">&times;</span>
                                                <img class="order_image" src="access/imgLogo/cast.jpg" alt="logo_cart">
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
<script src="JS/slideShow.js"></script>

</html>