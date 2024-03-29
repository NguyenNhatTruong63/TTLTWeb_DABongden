<%@ page import="org.example.web.carts.Carts" %>
<%@ page import="org.example.web.services.Dao" %>
<%@ page import="org.example.web.beans.Account" %>
<%@ page import="org.example.web.services.CategoryServices" %>
<%@ page import="org.example.web.beans.Category" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 27/03/2024
  Time: 21:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

                    <li class="dropdown"><a href="#"><span>Sản Phẩm</span> <i class="fa-solid fa-caret-down" style="color: white"></i> </a>
                        <% CategoryServices categoryServices = new CategoryServices(); %>
                        <ul><% for (Category category : categoryServices.getCategoryList()) { %>
                            <li class="dropdown"><a href="product_Category.jsp?id_caterory=<%=category.getId()%>"><span><%= category.getName() %></span></a></li>
                            <% } %>
<%--                            <li class="dropdown"><a href="#"><span>Bóng Đèn Buld</span> <i--%>
<%--                                    class="fa-solid fa-caret-right"></i></a>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="#">Bóng Đèn Buld Led Tròn</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Buld Led Trụ</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown"><a href="#"><span>Bóng Đèn Led Tuýp</span> <i--%>
<%--                                    class="fa-solid fa-caret-right"></i></a>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="#">Bóng Đèn Tuýp Led T5</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Tuýp Led T8</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Tuýp Led Bán Nguyệt</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown"><a href="#"><span>Bóng Đèn Âm Trần</span><i--%>
<%--                                    class="fa-solid fa-caret-right"></i></a>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="#">Bóng Đèn Âm Trần Led Tròn</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Âm Trần Led Vuông</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Âm Trần Led Viền</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown"><a href="#"><span>Bóng Đèn Ốp Trần</span><i--%>
<%--                                    class="fa-solid fa-caret-right"></i></a>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="#">Bóng Đèn Ốp Trần Led Tròn</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Ốp Trần Led Vuông</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown"><a href="#"><span>Bóng Đèn Led Cảm Ứng</span><i--%>
<%--                                    class="fa-solid fa-caret-right"></i></a>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="#">Bóng Đèn Led Ốp Trần</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Led Âm Trần</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Led Hồng Ngoại</a></li>--%>
<%--                                    <li><a href="#">Bóng Đèn Led Sân Vườn</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li class="dropdown"><a href="#"><span>Bóng Đèn Sợi Đốt</span><i--%>
<%--                                    class="fa-solid fa-caret-right"></i></a>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="#">Bóng Đèn Sợi Đốt Halogen</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
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
