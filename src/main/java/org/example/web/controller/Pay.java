package org.example.web.controller;

import org.example.web.beans.Account;
import org.example.web.carts.Carts;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Pay", value = "/pay")
public class git cPay extends HttpServlet {
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