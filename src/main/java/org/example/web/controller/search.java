package org.example.web.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "search", value = "/search")
public class search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // search bằng tiếng việt
        request.setCharacterEncoding("UTF-8");
        // lấy giá trị từ khóa tìm kiếm
        String search = request.getParameter("keyword");
//        Dao dao = new Dao();
//        List<Product> list = dao.searchbyname(search);
//        request.setCharacterEncoding("UTF-8");
//        request.setAttribute("product", list);
//        request.getRequestDispatcher("searchsp.jsp").forward(request, response);

//        response.sendRedirect("searchsp.jsp?keyword=" + URLEncoder.encode(search, "UTF-8"));
        request.getRequestDispatcher("search.jsp").forward(request, response);
// chuyển hướng người dùng đến trang kết quả tìm kiếm
    }
}