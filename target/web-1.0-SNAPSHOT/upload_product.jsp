<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/29/2023
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload Product</title>
</head>
<body>
<form action="upload_product" method="post" enctype="multipart/form-data">
    <input type="number" name="id" placeholder="id"><br>
    <input type="text" name="productName" placeholder="tên sản phẩm"><br>
    <input type="text" name="productPrice" placeholder="giá bán sản phẩm"><br>
    <input type="text" name="material" placeholder="chất liệu"><br>
    <input type="text" name="origin" placeholder="xuất xứ"><br>
    <input type="text" name="detail" placeholder="mô tả sản phẩm"><br>
    <input type="number" name="quantity" placeholder="số lượng sản phẩm"><br>
    <input type="file" name="file" placeholder="product image" multiple><br>
    <input type="submit" value="upload_product"><br>
</form>
</body>
</html>

