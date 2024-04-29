package org.example.web.controller;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.protobuf.DoubleValue;
import org.example.web.Util.MaHoa;
import org.example.web.beans.Account;
import org.example.web.mail.Mail;
import org.example.web.services.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;

@WebServlet(name = "Signup", value = "/signup")
public class Signup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String emailPattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        String phonePattern = "^\\d{10}$";
        Mail mail = new Mail();
        String subject = " Shop LED Tâm Quang";
        String mess = "Bạn đã đăng ký tài khoản thành công!";


        Dao dao = new Dao();
        Account accountExist = dao.checkAccountExit(username);
        if (username.equals(" ") || password.equals(" ") || email.equals(" ") || phoneNumber.equals(" ")) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
//            response.sendRedirect("signup.jsp");

        } else if (accountExist != null) {
            request.setAttribute("error", "Tên đăng nhập đã tồn tại");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
//            response.sendRedirect("signup.jsp");

        } else if (!phoneNumber.matches(phonePattern)) {
            request.setAttribute("error", "Số điện thoại không hợp lệ phải có 10 số");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
//            response.sendRedirect("signup.jsp");
        } else if (!email.matches(emailPattern)) {
            request.setAttribute("error", "Email không hợp lệ phải bao gồm @gmail.com");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
//            response.sendRedirect("signup.jsp");
        } else {
            password = MaHoa.hashPassword(password);
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat dateFormatSendMail = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
//            MaHoa.sendEmail(acountNew.getUsername(), privateKey, dateFormatSendMail.format(now));
            dao.signup(username, password, email, phoneNumber);
            Mail.sendMail(email, subject, mess);
            request.setAttribute("error", "Đăng ký thành công");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    }
}

//        else {
////            password = MaHoa.toSHA1(password);
//            dao.signup(username, password, email, phoneNumber);
//            request.setAttribute("error", "Đăng ký thành công");
//            request.getRequestDispatcher("formdn.jsp").forward(request, response);
////        String phone = request.getParameter("phone");
////        String address = request.getParameter("address");
//            if (!password.equals(repassword)) {
////            response.sendRedirect("signup.jsp");
//                request.setAttribute("error", "Vui lòng nhập lại password");
//                request.getRequestDispatcher("formdn.jsp").forward(request, response);
////            response.sendRedirect("formdn.jsp");
//            }
//            else {
////                password = MaHoa.toSHA1(password);
////            Dao dao = new Dao();
//                Account account = dao.checkAccountExit(username);
//                if (account == null) {
//                    dao.signup(username, password, email, phoneNumber);
////                    dao.signup(username, password, repassword, email);
//                    response.sendRedirect("index.jsp");
////                    password = MaHoa.toSHA1(password);
//                    request.setAttribute("error", "Tài khoản đã tồn tại");
//                    request.getRequestDispatcher("signup.jsp").forward(request, response);
//                } else if (accountExist != null) {
//                    request.setAttribute("error", "Tài khoản đã tồn tại");
//                    request.getRequestDispatcher("signup.jsp").forward(request, response);
//                } else if (!email.matches(emailPattern)) {
//                    request.setAttribute("error", "Email không hợp lệ");
//                    request.getRequestDispatcher("signup.jsp").forward(request, response);
//                    return;
//                } else if (!phoneNumber.matches(phonePattern)) {
//                    request.setAttribute("error", "Số điện thoại không hợp lệ");
//                    request.getRequestDispatcher("signup.jsp").forward(request, response);
//
//                } else {
//                    dao.signup(username, password, email, phoneNumber);
//                    request.setAttribute("error", "Đăng ký thành công");
//                    request.getRequestDispatcher("index.jsp").forward(request, response);
//
//                }
//
//            }
//
//
//        }

//    }
//}
