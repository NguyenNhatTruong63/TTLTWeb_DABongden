package org.example.web.controller;

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
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        Dao dao = new Dao();
        Account a = dao.login(userName, password);


        if(userName.equals(" ") || password.equals(" ")){
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if(a == null) {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            session.setAttribute("successMessage", "Đăng nhập thành công!");;
//            request.getRequestDispatcher("index").forward(request, response);
            response.sendRedirect("index.jsp");
        }
        response.getWriter().println("username: " + userName);
        response.getWriter().println("password: " + password);

//          String userName = request.getParameter("username");
//        String password = request.getParameter("password");
//        Dao dao = new Dao();
//        Account a = dao.login(userName, password);
//
//
//        if(userName.equals("") || password.equals("")){
//            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
//            request.getRequestDispatcher("formdn.jsp").forward(request, response);
//        } else if(a == null) {
//            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác");
//            request.getRequestDispatcher("formdn.jsp").forward(request, response);
//        }
//        else {
//            HttpSession session = request.getSession();
//            session.setAttribute("account", a);
//            session.setAttribute("successMessage", "Đăng nhập thành công!");;
//            request.getRequestDispatcher("index.jsp").forward(request, response);
////            response.sendRedirect("index.jsp");
//        }
//        response.getWriter().println("username: " + userName);
//        response.getWriter().println("password: " + password);
    }
}