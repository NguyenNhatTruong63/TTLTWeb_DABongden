package org.example.web.controller;

import jakarta.validation.ConstraintValidatorFactory;
import org.example.web.beans.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "upload_product", value = "/upload_product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
public class upload_product extends HttpServlet {
        private String dataPath = "D:/Github/CurtainShop/src/main/webapp/data/images";

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            String productName = request.getParameter("productName");
            double productPrice = Double.valueOf(request.getParameter("productPrice"));
            String material = request.getParameter("material");
            String origin = request.getParameter("origin");
            String type = request.getParameter("type");
            int productDiscount = Integer.valueOf(request.getParameter("productDiscount"));
            String detail = request.getParameter("detail");
            int quantity = Integer.valueOf(request.getParameter("quantity"));

            ConstraintValidatorFactory ProductServices = null;
//            List<Product> productId = ProductServices.getInstance().getAll();

            Product product = new Product();
//        product.setId(productId);
//            product.setId(productId.size());
            product.setName(productName);
            product.setPrice(productPrice);
//        product.setMaterial(material);
//        product.setOrigin(origin);
//        product.setType(type);
            product.setDiscount(productDiscount);
//        product.setProductDetail(detail);
            product.setQuantity(quantity);

//            ProductServices.getInstance().getAll();

            //image

            for (Part part : request.getParts()) {
                String fileName = part.getSubmittedFileName();

                if (fileName == null)
                    continue;

                String imagePath = dataPath + "/" + productName + "_" + fileName;
                part.write(imagePath);
//
//            Gallery image = new Gallery();
//            int galleryId = GalleryService.getInstance().getLastGalleryId() + 1;
//            image.setId(galleryId);
//            image.setProductId(productId);
//            image.setImageName(productName + "_" + fileName);
//            image.setImagePath(imagePath);
//
//            GalleryService.getInstance().addImage(image);

            }

            response.sendRedirect("Admin_product-manager.jsp");


        }
}