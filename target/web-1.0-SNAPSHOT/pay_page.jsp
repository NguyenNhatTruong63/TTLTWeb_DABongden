<%@ page import="org.example.web.carts.Carts" %>
<%@ page import="org.example.web.carts.CartsProduct" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="org.example.web.beans.Product" %>
<%@ page import="org.example.web.services.Dao" %>
<%@ page import="org.example.web.beans.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14/03/2024
  Time: 14:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thanh toán</title>
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="access/css/pay.css">
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
<jsp:include page="Layout/Header.jsp"/>
<div class="content">
    <div class="paymeny1">
        <div class="step1">
            <div class="pay1">
                <span><img class="pay" src="https://img.freepik.com/premium-vector/3d-money-transfer-mobile-payment-financial-security-online-shopping-online-sending-money_808510-1509.jpg?w=826" alt=""></span>
                <p class="thanhtoan" style="text-align: center; font-weight: bolder; font-size: 25px">THANH TOÁN</p>
            </div>
            <h4>Bước 1: Chi tiết thanh toán </h4>
            <form action="CheckoutVerifyController" id="formCheckoutInfomation" method="post">
                <p style="color: red; margin-left: 140px; font-size: 10px"><%=error%></p>
                <div class="form-group">
                    <label class="control-label">Họ và tên</label>
                    <input type="text" title="Họ và tên phải từ 15-25 ký tự" name="name" class="name1" placeholder="Họ và tên" minlength="15" maxlength="25">
                </div>
                <div class="form-group">
                    <label class="control-label"> Số Điện thoại </label>
                    <input type="text" title="Số điện thoại 10 ký tự số" placeholder="Số điên thoại người nhận" name="phone"
                           class="phone2"  pattern="[0-9]{10}" minlength="10" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                </div>
                <div class="form-group">
                    <label class="control-label">Giới tính</label>
                    <div class="sex">
                        <select class="sex1" aria-label=".form-select-sm" name="gioiTinh">
                            <option value="nam"> Nam</option>
                            <option value="nu"> Nữ</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Tỉnh/TP</label>
                    <div class="col-sm-10">
                        <select class="form-select form-select-sm mb-3 form-control"
                                id="city" aria-label=".form-select-sm" name="tinhthanh" required>
                            <option value="" selected>Chọn tỉnh thành</option>
                        </select>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label">Quận/Huyện</label>
                    <div class="col-sm-10">
                        <select class="form-select form-select-sm mb-3 form-control"
                                id="district" aria-label=".form-select-sm" name="quanhuyen" required>
                            <option value="" selected>Chọn quận huyện</option>
                        </select>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label">Phường/Xã</label>
                    <div class="col-sm-10">
                        <select class="form-select form-select-sm form-control" id="ward"
                                aria-label=".form-select-sm" name="phuongxa" required>
                            <option value="" selected>Chọn phường xã</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">Địa chỉ cụ thể </label>
                    <input type="text" title="Số nhà, số hẻm, tên đường, tên chung cư...." name="address" class="address2" placeholder="Địa chỉ" >
                </div>

                <div class="form-group">
                    <label class="control-label"> Email</label>
                    <input type="email" title="Email phải có đuôi @gmail.com" name="email" class="email2" placeholder="Email">
                </div>
            </form>
        </div>
        <div class="step2">
            <h4>Bước 2: Vui lòng chọn phương thức thanh toán</h4>
            <div class="content_step2">
                <div class="text_title_step2"><p>Vui lòng chọn phương thức vận chuyển thích hợp để sử dụng cho đơn đặt hàng này.</p></div>
                <div class="expense">
                    <p class="text_step2">Phí cố định</p>
                    <div class="radio">
                        <label>
                            <input type="radio" name="shipping_method" class="" value="0" checked="checked"> Giao hàng tiết kiệm: 25.000đ
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="shipping_method" class="viettelPost" value="1"> Viettel Post: 25.000đ
                        </label>
                    </div>
                    <div class="payment">
                        <p>Vui lòng chọn phương thức thanh toán để sử dụng cho đơn đặt hàng này.</p>
                        <div class="radio">
                            <label>
                                <input type="radio" name="payment_method" class="" value="Cod" checked="checked"> Thanh toán khi nhận hàng
                            </label>
                        </div>
                    </div>
                    <div class="note_order">
                        <p class="text_note">Thêm ghi chú đơn hàng của bạn</p>
                        <p><textarea name="comment" rows="8" class="form-control" placeholder="Nhập ghi chú"></textarea>
                        </p>
                    </div>
                </div>
            </div>
            <hr>
            <div class="step3">
                <h4>Bước 3: Xác nhận đơn hàng</h4>
                <div class="info_cart">
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
                    <%
                        if (cartItems.isEmpty()) {
                    %>
                    <p style="width: 400px; text-align: center">Thêm sản phẩm vào giỏ hàng để tiến hành thanh toán</p>
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
<%--                    <%--%>
<%--                        Set<Integer> set = cart.getData().keySet();--%>
<%--                        int sumTotal=0;--%>
<%--                        int total=0;--%>
<%--                        for(Integer id : set){--%>
<%--                            product = dao.getProduct(id);--%>
<%--                            total= product.getPrice()*cart.getData().get(id);--%>
<%--                    %>--%>
                    <ul class="step3_pay">
                        <li class="payment_step3" style="display: flex; width: 450px; height: 120px; background-color: #999999; border-radius: 10px; margin-left: 60px">
                            <div class="img_product">
                                <img class="img_product1" src="<%=product.getImg()%>" alt="anh">
                            </div>
                            <div class="info_pay">
                                <p class="name"><%=product.getName()%> x <%=cartProduct.getQuantity()%></p>
                                <div class="price">
                                    <div>
                                        <p>Giá: <del><%=currencyFormatter.format(product.getPrice())%></del>  <%=currencyFormatter.format(product.salePrice())%></p>
                                    </div>
                                    <div>
                                        <button type="button" class="delete" style="margin: 15px 0 0 10px">
                                            <a href="remove?id=<%=product.getId()%>"><i style="color: black" class="fa-solid fa-trash"></i></a></button>
                                    </div>
                                </div>
                                <p>Tổng giá sản phẩm: <%=currencyFormatter.format((long) product.salePrice() * cartProduct.getQuantity())   %></p>
                            </div>
                        </li>
                    </ul>
                </div>
                <%}%>
                <p style="text-align: end; margin-right: 50px">Phí giao hàng: <%=currencyFormatter.format(25000)%></p>
                <%}%>
                <div class="total_order">
                    <div class="total">
<%--                        <p style="margin-top: 5px; float: right">Phí giao hàng: <%=currencyFormatter.format(25000)%></p>--%>
                        <%
                            long totalPayment = 0;
                            for (Map.Entry<Integer, CartsProduct> entry : cartItems.entrySet()) {
                                CartsProduct cartProduct = entry.getValue();
                                Product product = cartProduct.getProduct();
                                totalPayment += (long) product.salePrice() * cartProduct.getQuantity() + 25000;
                            }
                        %>
                        <p>Tổng thanh toán: <%= currencyFormatter.format(totalPayment) %></p>
                    </div>
                    <div class="button_order">
                        <button class="order" type="submit" form="formCheckoutInfomation"> Đặt Hàng</button>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>


<jsp:include page="Layout/Footer.jsp"/>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Name);
        }
        citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if (this.value !== "") {
                const result = data.filter(n => n.Name === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Name);
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Name === citis.value);
            if (this.value !== "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Name);
                }
            }
        };
    }
</script>
</html>
