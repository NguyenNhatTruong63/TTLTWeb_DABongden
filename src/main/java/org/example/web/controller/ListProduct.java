package org.example.web.controller;

import org.example.web.services.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ListProduct", value = "/ListProduct")
public class ListProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dao dao = new Dao();
        int count = dao.getTotalPage();
        int endPage = count/3;
        if(count % 3 != 0){
            endPage++;
        }
        request.setAttribute("endP", endPage);
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }
}