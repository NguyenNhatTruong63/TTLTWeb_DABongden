package org.example.web.controller;

import org.example.web.beans.Account;
import org.example.web.services.Dao;

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
        Dao dao = new Dao();
        List<Account> accountList = dao.getAccountList();
        request.setAttribute("accountList", accountList);
        request.getRequestDispatcher("Admin_user_manager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}