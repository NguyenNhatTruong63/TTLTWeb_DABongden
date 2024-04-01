<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 01/04/2024
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="access/css/tt.css">
</head>
<body>
<jsp:include page="Layout/Header.jsp"/>
<div class="checkout">
    <span><img class="pay" src="https://cdn-icons-png.freepik.com/256/6442/6442646.png?ga=GA1.1.2079026882.1697034920&" height="100px" width="100px" alt=""></span>
    <p class="thanhtoan">THANH TOÁN</p>
    <p class="check_info">Vui lòng kiểm tra thông tin khách hàng, thông tin Giỏ hàng trước khi Thanh Toán</p>
</div>

<div class="content">
    <div class="step1">
        <h4>Bước 1: Chi tiết thanh toán </h4>
        <div class="form-group">
            <label class="control-label">Họ và tên</label>
            <input type="text" name="name" class="name1" placeholder="Họ và tên">
        </div>
        <div class="form-group">
            <label class="control-label"> Số Điện thoại </label>
            <input type="text" placeholder="Số điên thoại người nhận" name="phone" class="phone2">
        </div>
        <div class="form-group">
            <label class="control-label">Giới tính</label>
            <div>
                <select class="sex1" name="gioiTinh">
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
                    <option value=""  selected>Chọn quận huyện</option>
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
            <input type="text" placeholder="Địa chỉ" name="address" class="address2">
        </div>

        <div class="form-group">
            <label class="control-label"> Email</label>
            <input type="email" class="email2" placeholder="Email">
        </div>
    </div>
    <div class="step2">
        <h4>Bước 2: Vui lòng chọn phương thức thanh toán</h4>
        <div class="content_step2">
            <div class="text_title_step2"><p>Vui lòng chọn phương thức vận chuyển thích hợp để sử dụng cho đơn đặt hàng này.</p></div>
            <div class="expense">
                <p class="text_step2">Phí cố định</p>
                <div class="radio">
                    <label>
                        <input type="radio" name="shipping_method" class="" value="0" checked ="checked"> Giao hàng tiết kiệm: 25.000đ
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="shipping_method"  class="viettelPost" value="1"> Viettel Post: 30.000đ
                    </label>
                </div>
                <div class="payment">
                    <p>Vui lòng chọn phương thức thanh toán để sử dụng cho đơn đặt hàng này.</p>
                    <div class="radio">
                        <label>
                            <input type="radio" name="payment_method" class="" value="Cod" checked ="checked"> Thanh toán khi nhận hàng
                        </label>
                    </div>
                </div>
                <div class="note_order">
                    <p class="text_note">Thêm ghi chú đơn hàng của bạn</p>
                    <p><textarea name="comment" rows="8" class="form-control"></textarea></p>
                </div>
            </div>
        </div>
    </div>
    <div class="step3">
        <h4>Bước 3: Xác nhận đơn hàng</h4>
        <div class="info_cart">
            <div class="img_product">
                <img class="img_product1" src="access/" alt="anh">
            </div>
            <div class="info_pay">
                <span>Bóng Đèn Led Ốp Trần Panasonic 18W</span>
                <span class="number">x 1</span><br>
                <span>Giá:</span>
                <span class="price">150.000đ</span><br>
                <span class="total_price">Tổng giá sản phẩm:<span>150.000đ</span> </span><br>
                <span class="text_cost">Phí giao hàng: <span>25.000đ</span> </span>
            </div>
        </div>
        <div class="total">
            <span class="l_total"> TỔNG THANH TOÁN:</span>
            <span class="total_number">630.000đ</span>
        </div>
    </div>
    <button class="btn_dathang"><a href="#" onclick="openPopup()"> Đặt Hàng</a></button>
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
            if (this.value != "") {
                const result = data.filter(n => n.Name === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Name);
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Name === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Name);
                }
            }
        };
    }
</script>
</html>
