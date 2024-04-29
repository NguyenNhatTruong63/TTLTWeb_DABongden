package org.example.web.controller;

import org.example.web.beans.Account;
import org.example.web.carts.Carts;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartController", value = "/CartController")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account)request.getSession().getAttribute("account");
        if(account == null)
        {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        String id = request.getParameter("id");
        Carts cart = (Carts)request.getSession().getAttribute("cart");
        if(id != null)
        {
            cart.update(Integer.parseInt(id), 1);
            request.getRequestDispatcher("ListProduct").forward(request, response);
        } else
        {
            request.getRequestDispatcher("carts.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account)request.getSession().getAttribute("account");
        Carts cart = (Carts)request.getSession().getAttribute("cart");
        if(account == null)
        {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        } else
        {
            String id = request.getParameter("id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.update(Integer.parseInt(id), 1);
            response.sendRedirect("/ListProduct");
            return;
        }
    }
}