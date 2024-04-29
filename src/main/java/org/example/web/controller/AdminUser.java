package org.example.web.controller;

import org.example.web.beans.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminUser", value = "/AdminUser")
public class AdminUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("id");
//        try {
//            UserService user = new UserService();
//            Account account = user.findAccount(username);
//            System.out.println(account.getEnable());
//            request.setAttribute("account", account);
//            request.setAttribute("listorder", listorder);
//            request.getRequestDispatcher("AdminUser.jsp").forward(request, response);
//        } catch (SQLException | ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}