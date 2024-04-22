<%@ page import="org.example.web.carts.Carts" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="org.example.web.services.Dao" %>
<%@ page import="org.example.web.beans.Account" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 16/03/2024
  Time: 20:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Search</title>
    <link rel="stylesheet" href="access/css/index.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
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
                            <%--      định dạng số tiền--%>
                            <%
                                Locale locale = new Locale("vi", "VN");
                                NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);

                            %>
                            <%--      dựa vào mã danh mục để gọi sản phẩm--%>


                            <%--lấy từ khóa tìm kiếm hiển thị h2--%>
                                <h2 class="h2title"
                                    style="text-align: center; color: red; margin-left: -120px ">Từ khóa tìm kiếm: <%=request.getParameter("keyword") %>
                                </h2>

                                <%--  hiển thị danh sách sản phẩm--%>
                                <% Dao dao = new Dao();%>
                                <%for (Product listProduct : dao.searchbyname(request.getParameter("keyword"))) { %>
                                <tr id="section_product" class="products" style="float: left">
                                    <td class="table_image1">
                                        <a href=""><img class="image_sp1" src="<%=listProduct.getImg()%>" alt="sp1">
                                            <p class="text_dicount"><%=listProduct.getDiscount()%> <br>Giảm </p></a>
                                        <p class="text_sp1"><%=listProduct.getName()%></p>
                                        <div class="purch_price">
                                            <p class="price_sp1"><del><%=listProduct.getPrice()%></del> 105.000đ</p>
                                            <button class="purche"><a href="AddCartController?id=<%= listProduct.getId()%>" onclick="openPopup()"> Thêm vào giỏ hàng</a></button>
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
        <jsp:include page="Layout/Footer.jsp"/>
    </div>
</div>

</body>
</html>
