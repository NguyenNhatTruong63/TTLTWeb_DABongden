package org.example.web.controller;

import org.example.web.Util.MaHoa;
import org.example.web.beans.Account;
import org.example.web.services.Dao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Dao dao = new Dao();
        Account account = dao.login(username, password);
        if(username.equals(" ") || password.equals(" ")){
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else if(account == null) {
            request.setAttribute("error", "Tên đăng nhập không chính xác");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else {
            password = String.valueOf(MaHoa.checkPassword(password, MaHoa.hashPassword(password)));
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            session.setAttribute("successMessage", "Đăng nhập thành công!");;
//            request.getRequestDispatcher("index").forward(request, response);
            response.sendRedirect("index.jsp");
        }
        response.getWriter().println("username: " + username);
        response.getWriter().println("password: " + password);

    }
}