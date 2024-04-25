<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="org.example.web.services.ProductByCategoryServices" %>
<%@ page import="org.example.web.services.CategoryServices" %>
<%@ page import="org.example.web.beans.Category" %>
<%@ page import="org.example.web.db.JDBIConnector" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 28/03/2024
  Time: 13:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Led Tâm Quang</title>
    <link rel="stylesheet" href="access/css/index.css">
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<div id="section_body" class="">
    <div class="container">
        <div class="box_product">
            <div class="box_table">
                <table class="table_product" border="0px" cellspacing="20px" cellpadding="1px">
                    <% CategoryServices categoryServices = new CategoryServices(); %>
                    <%--      định dạng số tiền--%>
                    <%
                        Locale locale = new Locale("vi", "VN");
                        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
                    %>
                    <%--      dựa vào mã danh mục để gọi sản phẩm--%>

                    <% ProductByCategoryServices productByCategoryServices = new ProductByCategoryServices();%>
                    <%--lấy tên danh mục hiển thị h2--%>
                    <h2 class="h2title"
                        style="text-align: center; color: red; margin-left: -120px "><%=categoryServices.nameCategory(request.getParameter("id_caterory")) %>
                    </h2>
                    <%--  hiển thị danh sách sản phẩm--%>
                    <%for (Product product : productByCategoryServices.getListProductByCategory(request.getParameter("id_caterory"))) { %>
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
<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>
