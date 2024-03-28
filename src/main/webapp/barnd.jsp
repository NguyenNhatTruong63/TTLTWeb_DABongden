<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14/03/2024
  Time: 14:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>brand</title>
    <link rel="stylesheet" href="access/css/index.css">
    <link rel="stylesheet" href="access/css/cart.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body>
<div id="navbar-top" class="">
    <div class="container">
       <jsp:include page="Layout/Header.jsp"/>

        <div id="section_body_table" class="">
            <div class="container">
                <div class="box_product">
                    <div class="box_table">
                        <table class="table_product" border="0px" cellspacing="20px" cellpadding="1px" >
                            <caption class="caption"> Sản Phẩm:<p class="product_title">Bóng đèn Rạng Đông</p></caption>
                            <tr id="section_product" class="products" >
                                <td class="table_image1">
                                    <a href=""><img class="image_sp1" src="access/img/2-A70N1-12W-H.jpg" style="width: 300px; height: 300px" alt="sp1">
                                        <p class="text_dicount">30% <br>Giảm </p></a>
                                    <p class="text_sp1"> Bóng Đèn Led Rạng Đông 12W</p>
                                    <div class="purch_price">
                                        <p class="price_sp1"><del>150.000đ</del> 105.000đ</p>
                                        <button class="purche"><a href="#" onclick="openPopup()"> Thêm vào giỏ hàng</a></button>
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
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Layout/Footer.jsp"/>
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