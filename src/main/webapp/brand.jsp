<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="org.example.web.services.BrandServices" %>
<%@ page import="org.example.web.db.JDBIConnector" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.web.services.ProductByBrandServices" %>
<%@ page import="org.example.web.services.Dao" %>
<%@ page import="org.example.web.beans.Category" %><%--
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
                    <%Dao dao = new Dao();%>
                    <%Category category = dao.getNameCategory(request.getParameter("id_product"));%>
                    <%Locale locale = new Locale("vi", "VN"); %>
                    <%NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale); %>
                    <%--      dựa vào mã danh mục để gọi sản phẩm--%>
                    <% ProductByBrandServices productByBrandServices = new ProductByBrandServices();%>

                    <%--lấy tên danh mục hiển thị h2--%>
                    <h2 class="h2title"
                        style="text-align: center; color: black; margin-left: -120px "><%=category.getName()%>
                    </h2>
<%--                        <h2 class="h2title"--%>
<%--                        style="text-align: center; color: red; margin-left: -120px "><%=BrandServices.getInstance().nameBrand(request.getParameter("id_name brand")) %>--%>
<%--                    </h2>--%>
                    <%--  hiển thị danh sách sản phẩm--%>
                    <%for (Product product : productByBrandServices.getListProductByBrand(request.getParameter("id_namebrand"))) { %>
                    <tr id="section_product" class="products" style="float: left; ">
                        <td class="table_image2" style="height: 300px; width: 250px; border: 1px solid black  ">
                            <a href="productDetail.jsp?id_product=<%=product.getId()%>"><img class="image_sp2" src="<%= product.getImg() %>"
                                                                                             width="270px" height="270px">
                                <p class="text_dicount"><%=  (int) (product.getDiscount() * 100) %>% <br>Giảm </p></a>
                            <p class="text_sp1"><%= product.getName() %> </p>
                            <div class="purch_price">
                                <p class="price_sp1">
                                    <del><%= currencyFormatter.format(product.getPrice()) %>
                                    </del>
                                    <%= currencyFormatter.format(product.salePrice()) %>
                                </p>
                                <button class="purche"><a href="AddCartController?id=<%= product.getId()%>" onclick="openPopup()"> Thêm vào giỏ hàng</a></button>
                                <div class="popup-wrapper" id="popup-wrapper1">
                                    <div class="popup">
                                        <span class="close" onclick="closePopup()">&times;</span>
                                        <img class="order_image" src="assart/image/logo/order_tc.jpg">
                                        <p>Đã thêm vào giỏ hàng thành công</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </table>





<%--                <table class="table_product" border="0px" cellspacing="20px" cellpadding="1px">--%>
<%--                    &lt;%&ndash;      định dạng số tiền&ndash;%&gt;--%>
<%--                    <%Locale locale = new Locale("vi", "VN");%>--%>
<%--                        <%NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);%>--%>

<%--                    &lt;%&ndash;      dựa vào mã danh mục để gọi sản phẩm&ndash;%&gt;--%>
<%--                    <% BrandServices brandServices = new BrandServices(); %>--%>
<%--                    <% ProductByBrandServices productByCategoryServices = new ProductByBrandServices();%>--%>
<%--                    &lt;%&ndash;lấy tên danh mục hiển thị h2&ndash;%&gt;--%>
<%--                    <h2 class="h2title"--%>
<%--                        style="text-align: center; color: red; margin-left: -120px "><%=brandServices.nameBrand(request.getParameter("idBrand"))%>--%>
<%--                    </h2>--%>
<%--                    &lt;%&ndash;  hiển thị danh sách sản phẩm&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <%for (Product product : productByCategoryServices.getListProductByCategory(request.getParameter("idCategory"))) { %>&ndash;%&gt;--%>
<%--                    <%JDBIConnector Dao = new JDBIConnector();%>--%>
<%--                    <%List<Product> list = Dao.getAllBrand();%>--%>
<%--                    <%for (Product product:list){%>--%>
<%--&lt;%&ndash;                     <%Dao dao = new Dao();%>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <%List<Product> list = (List<Product>) dao.getBrandProduct("");%>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <%for (Product product:list){%>&ndash;%&gt;--%>

<%--                    <tr id="section_product" class="products" style="float: left">--%>
<%--                        <td class="table_image1">--%>
<%--                            <a href="productDetail.jsp?id_product=<%=product.getId() %>"><img class="image_sp1" src="<%=product.getImg()%>" alt="sp1">--%>
<%--                                <p class="text_dicount"><%=product.getDiscount()%> <br>Giảm </p></a>--%>
<%--                            <p class="text_sp1"><%=product.getName()%></p>--%>
<%--                            <div class="purch_price">--%>
<%--                                <p class="price_sp1"><del><%= currencyFormatter.format(product.getPrice())%></del> <%= currencyFormatter.format(product.salePrice()) %></p>--%>
<%--                                <button class="purche"><a href="AddCartController?id=<%= product.getId()%>" onclick="openPopup()"> Thêm vào giỏ hàng</a></button>--%>
<%--                                <div class="popup-wrapper" id="popup-wrapper">--%>
<%--                                    <div class="popup">--%>
<%--                                        <span class="close" onclick="closePopup()">&times;</span>--%>
<%--                                        <img class="order_image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8f2KuwLvTAb00OQQc2HnhMzfGatxp54czdA&usqp=CAU" alt="">--%>
<%--                                        <p>Đã thêm vào giỏ hàng thành công</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <% } %>--%>
<%--                </table>--%>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Layout/Footer.jsp"/>
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