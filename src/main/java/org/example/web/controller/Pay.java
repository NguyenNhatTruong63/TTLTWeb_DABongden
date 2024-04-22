package org.example.web.controller;

import org.example.web.beans.Account;
import org.example.web.carts.Carts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Pay", value = "/pay")
public class Pay extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("pay_page.jsp").forward(request, response);
        Carts cart = (Carts) request.getSession().getAttribute("cart");
        Account account = (Account)request.getSession().getAttribute("account");
        if(account == null)
        {
            response.sendRedirect("login.jsp");
            return;
        }
        if(cart.getData().isEmpty()) {
            response.sendRedirect("Cart");
            return;
        } else
        {
            request.getRequestDispatcher("pay_page.jsp").forward(request, response);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.getRequestDispatcher("pay_page.jsp").forward(request, response);
    }
}