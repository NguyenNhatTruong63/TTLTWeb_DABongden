package org.example.web.controller;
import org.example.web.beans.Account;
import org.example.web.beans.Orders;
import org.example.web.services.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckoutVerifyController", value = "/CheckoutVerifyController")
public class CheckoutVerifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fullname = request.getParameter("name");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String quantity = request.getParameter("quantity");
        String emailPattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        String phonePattern = "^\\d{10}$";


        Account account = (Account) session.getAttribute("account");
        Dao dao = new Dao();
        if (account == null) {
            request.setAttribute("error", "Hãy đăng nhập trước khi thanh toán");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else if ((fullname.equals(" ") && address.equals(" ") && phoneNumber.equals(" ") && email.equals(" "))) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("pay_page.jsp").forward(request, response);


        } else if (!email.matches(emailPattern)) {
            request.setAttribute("error", "Email không hợp lệ phải bao gồm @gmail.com");
            request.getRequestDispatcher("pay_page.jsp").forward(request, response);

        } else if (!phoneNumber.matches(phonePattern)) {
            request.setAttribute("error", "Số điện thoại không hợp lệ phải có 10 số");
            request.getRequestDispatcher("pay_page").forward(request, response);

        } else {
            Orders orders = dao.order(account.getId(), fullname, address, phoneNumber, email);
//            Orders order = dao.order(account.getId(), name, address, phone, email);
            request.setAttribute("error", "Thanh toán thành công");
            request.getRequestDispatcher("pay_page.jsp").forward(request, response);


        }

        // Forward to your JSP page

    }
}