<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 02/04/2024
  Time: 13:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin giao hàng</title>
    <link rel="stylesheet" href="Layout/header.css">
    <link rel="stylesheet" href="Layout/footer.css">
</head>
<body>
<jsp:include page="Layout/Header.jsp"/>

<div id="content" class="col-sm-9" style="margin:0 20px">
    <h1>THÔNG TIN GIAO HÀNG</h1>
    <h3>1.Giao hàng nhanh</h3>
    <p>Giao nhanh là hình thức giao hàng trong vòng một (01) hoặc hai (02) ngày kể từ khi đặt hàng. Đơn hàng
        giao nhanh sẽ được ưu tiên vận chuyển, cho phép khách hàng nhận hàng nhanh hơn so với giao hàng tiêu
        chuẩn.
    </p>
    <h3>2.Giao hàng toàn quốc</h3>
    <p>- Chúng tôi có đội ngũ nhân viên giao hàng toàn quốc tại 64 tỉnh thành trên cả nước với nhiều năm
        kinh nghiệm cũng như là xử lý cách tình huống nhanh để phúc vụ quý khách tốt nhất.
        <br>
        - Chúng tôi cam kết rằng trong quá trình vận chuyển sẽ đảm bảo an toàn cho hàng hóa của quý khách
        trong quá trình vận chuyển.

    </p>
    <h3>3.Đóng gói</h3>
    <p>- Quy định về đóng gói hàng hóa
        <br>
        + Tất cả các bưu kiện đều phải đóng gói sẵn sàng trước khi vận chuyển, được niêm phong bởi Người
        Bán. Đơn vị vận chuyển sẽ chỉ chịu trách nhiệm vận chuyển hàng hóa theo nguyên tắc “nguyên đai,
        nguyên kiện”, và sẽ không chịu trách nhiệm với nội dung hàng hóa bên trong nếu sản phẩm được giao
        tới tay Người Mua/hoàn về tay Người Bán trong tình trạng còn nguyên niêm phong và bao bì không bị
        rách/vỡ/ướt/móp méo.
        <br>
        - Trên bao bì tất cả các bưu kiện đều phải có thông tin:
        <br>
        + Thông tin Người nhận, bao gồm: Tên người nhận, số điện thoại và địa chỉ người nhận
        <br>
        + Mã vận đơn của đơn hàng
        <br>
        + Ghi chú hàng không vận chuyển được bằng đường hàng không (nếu có ít nhất 01 sản phẩm trong bưu
        kiện nằm trong nhóm sản phẩm không thể vận chuyển bằng đường hàng không)
        <br>
        - Đơn vị vận chuyển có quyền bóc mở bưu kiện để kiểm tra nội dung hàng hóa trong trường hợp nghi ngờ
        Người bán gửi sản phẩm không hỗ trợ vận chuyển hoặc có hành vi gửi hộp rỗng không chứa hàng
    </p>
</div>
<jsp:include page="Layout/Footer.jsp"/>
</body>
</html>
