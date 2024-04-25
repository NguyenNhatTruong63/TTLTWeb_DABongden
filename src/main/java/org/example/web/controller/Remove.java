package org.example.web.controller;

import org.example.web.carts.Carts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Remove", value = "/remove")
public class Remove extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));

        } catch (NumberFormatException e) {

        }

        HttpSession session = request.getSession();
        Carts carts = (Carts) session.getAttribute("cart");
        if (carts != null) {
            carts.remove(id);
            request.getRequestDispatcher("pay_page.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}