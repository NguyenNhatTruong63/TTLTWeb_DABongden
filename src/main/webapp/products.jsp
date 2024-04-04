<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 01/04/2024
  Time: 12:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
    <link rel="stylesheet" href="access/css/product.css">
<%--    <link rel="stylesheet" href="access/css/products.css">--%>
</head>
<body>
<jsp:include page="Layout/Header.jsp"/>

<div id="product_detail" class="">
  <div class="container">
    <div class="detail_product">
      <div class="product_alpha">
        <a><img class="alpha_img" src="https://rangdong.com.vn/uploads/product/LED/LED_Bulb/A45R-1W/1-%20A45R-1W.jpg" alt=""><p class="text_dicount">30% <br>Giảm </p></a>
      </div>
      <div class="product_omega">
        <div class="product_title">
          <h1 class="text_detail_product">Bóng Đèn Led Ốp Trần Panasonic 18W</h1>
          <p class="price_detail_product">Giá:<del>150000đ</del> 105.000đ</p>
          <p class="firm">Hãng: Panasonic</p>
        </div>
        <%--                        <hr>--%>
        <div class="product_content">
          <div class="product_content1">
            <p class="wattage">Công Suất: <span class="wattage_W">18W</span></p>
            <p class="voltage">Điện Áp: <span class="voltage1">220V/50HZ</span></p><br>
            <p class="r1" >Đường Kính lỗ khoét trần:<span>110mm</span></p>
          </div>
          <div class="product_content2">
            <p class="luminous_flux">Quang Thông: <span
                    class="luminous_flux"> 1300lm; CRI: 80</span></p>
            <p class="longevity">Tuổi Thọ: <span class="age">30.000 giờ</span> </p>
            <p class="longevity">Vật liệu: <span class="age">Nhựa</span></p>
          </div>
        </div>
        <div class="product_content_foot">
          <p class="warranty_detail">Bảo hành chính hãng <span>24 tháng</span></p>
          <p class="contact_detail"> Liên hệ với chúng tôi để biết thêm thông tin: <span class="phone">0245730926 - 0257190589</span></p>
          <div class="told">
            <button id="minus" onclick="minus()">-</button>
            <p id="numbera">0</p>
            <button id="plus" onclick="plus()">+</button>
            <a href="cart.html"><input type="button" name="button" id="button_cart"
                                       value="Thêm vào giỏ hàng" class="text_cart_detail"></a>
          </div>
        </div>

      </div>
    </div>

    <div id="section_detail" class="">
      <div class="container">
        <div class="detail_infor1">
          <!--                  <h2 class="text_title">Sản Phẩm Đèn Led ốp trần nổi Panasonic 18W</h2>-->
          <p class="text_infor">
            Mức độ hoàn thiện tỉ mỉ, Sử dụng vật liệu chất lượng cao, mang đến nét sang trọng, hiện đại.<br>
            Chỉ số truyền màu CRI cao, cho màu sắc gần với ánh sáng tự nhiên nhất, tối ưu cho mắt.<br>
            Công suất thấp sản sinh ra lượng quang thông ánh sáng lớn, rất tiết kiệm điện so với đèn thông thường.<br>
            Chíp led được sản xuất độc quyền công nghệ nhật bản, cho tuổi thọ cao, không gây ra những lỗi vặt như nháy đèn, chập chờ.<br>
            Đèn ốp trần cao cấp số 1 về chất lượng ở Việt Nam.
          </p>
          <div class="detail_icon1">
            <div class="longevity">
              <p class="text_detail">Tuổi thọ cao</p>
              <p class="text_content_detail">Tuổi thọ cao 30000 giờ, độ tin cậy cao, không hạn
                chế số lần bật/tắt<br>
                Cao gấp 2-3 lần so với đèn compact</p>
            </div>
            <img class="icon_detail1" src="https://rangdong.com.vn/uploads/images/Icon/icon_Tuoithocao.png">
          </div>
          <div class="detail_icon2">
            <div class="voltage">
              <p class="text_detail">Dải điện áp hoạt động rộng <br> Tương thích điện từ
                trường EMC/EMI</p>
              <p class="text_content_detail">Đèn LED Downlight có dải điện áp rộng (150-250V).<br>
                Ánh sáng và công suất không thay đổi khi điện áp lưới thay đổi. </p>
              <p class="text_content_detail"> Tương thích điện từ trường không gây ra hiện
                tượng nhiễu cho sản phẩm điện tử
            </div>
            <div class="img">
              <img class="icon_detail2" src="https://rangdong.com.vn/uploads/images/Icon/icon_dientutruong.png">
            </div>

          </div>
          <div class="detail_icon3">
            <div class="cri">
              <p class="text_detail">Hệ số trả màu (CRI > 80)</p>
              <p class="text_content_detail"> Hệ số trả màu cao (CRI ≥ 80), ánh sáng trung
                thực tự nhiên </p>
              <p class="text_content_detail"> Đáp ứng tiêu chuẩn chiếu sáng Việt Nam TCVN
                7114: 2008</p>
            </div>
            <img class="icon_detail3" src="https://rangdong.com.vn/uploads/images/Icon/icon_tcvn.png">
          </div>

          <div class="detail_icon4">
            <div class="environment">
              <p class="text_detail">Thân thiện môi trường</p>
              <p class="text_content_detail">Không chứa thủy ngân và hóa chất độc hại.<br> Không
                phát ra tia tử ngoại.<br> An toàn cho người sử dụng</p>
            </div>
            <img class="icon_detail4" src="https://rangdong.com.vn/uploads/images/Icon/icon_thanthienmoitruong.png">
          </div>

          <div class="detail_icon5">
            <div class="application">
              <p class="text_detail">Ứng Dụng</p>
              <p class="text_content_detail"> Chiếu sáng hộ gia đình, căn hộ: phòng ngủ, phòng
                bếp….</p>
              <p class="text_content_detail"> Chiếu sáng khu văn phòng: Phòng họp, hành lang,
                tiền sảnh…</p>
              <p class="text_content_detail"> Chiếu sáng trung tâm thương mại, siêu thị: Sảnh,
                khu mua bán chung…</p>
            </div>
            <img class="icon_detail5" src="https://rangdong.com.vn/uploads/images/Icon/icon_ungdung.png" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>