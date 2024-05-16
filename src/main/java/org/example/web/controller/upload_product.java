package org.example.web.controller;

import jakarta.validation.ConstraintValidatorFactory;
import org.example.web.beans.Product;
import org.example.web.services.Dao;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.SQLException;

@WebServlet(name = "upload_product", value = "/upload_product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
public class upload_product extends HttpServlet {
//        private String dataPath = "D:/Laptrinhweb/TTLTWeb_BD/src/main/webapp/Image";
        private final String dataPath = "D:\\Laptrinhweb\\TTLTWeb_BD\\src\\main\\webapp\\Image";

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            request.setCharacterEncoding("UTF-8");
//            Part filePart = request.getPart("file");
//            String fileName = filePart.getSubmittedFileName();
//            ServletContext servletContext = getServletContext();
//            File root = new File(servletContext.getRealPath("/")+"data/");
//            Field root = new File(servletContext.getRealPath("/")+"data/");

            Dao dao = new Dao();
            int id = 0;
            String name = request.getParameter("name");
//            double category = Double.parseDouble(request.getParameter("category"));
            String brand = request.getParameter("brand");
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount"));
            double quantity = Double.parseDouble(request.getParameter("quantity"));
            double status = Double.parseDouble(request.getParameter("status"));
            String detail = request.getParameter("detail");
            dao.insertProduct(id, name, price, discount, quantity, status);
            response.sendRedirect("AdminListProduct");


//            public String uploadImage() throws IOException {
//                if (filePart!=null&&!filePart.getSubmittedFileName().equals("")) {
//                    InputStream fileContent = filePart.getInputStream();
//                    File file = new File("D:\\TMDT\\TMDT\\src\\main\\webapp\\Image\\Image\\"+filePart.getSubmittedFileName());
//                    FileOutputStream out = new FileOutputStream(file);
//                    File file2 = new File("D:\\TMDT\\TMDT\\target\\WebC\\Image\\Image\\"+filePart.getSubmittedFileName());
//                    FileOutputStream out2 = new FileOutputStream(file2);
//                    int i;
//                    byte[] arr = new byte[1024];
//                    while ((i=fileContent.read(arr))!=-1) {
//                        out.write(arr);
//                        out2.write(arr);
//                    }
//                    out.close();
//                    out2.close();
//                    return "Image/"+filePart.getSubmittedFileName();
//                }
//                return null;
//            }






//            response.sendRedirect("index.jsp");


        }
}