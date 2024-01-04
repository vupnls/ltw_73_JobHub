package com.jhwebsite.controller.web;

import com.jhwebsite.model.UserModel;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/dang-nhap", "/thoat"})
public class LoginController extends HttpServlet {
//    @Inject
//    private ILayoutAttributeService layoutAttributeService;
//    @Inject
//    private IUserService userService;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String action = request.getParameter("action");
        this.showMessage(request);
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("views/web/login.jsp");
            rd.forward(request, resp);
        }
    }
    private ResourceBundle bundle = ResourceBundle.getBundle("message");

    public void showMessage(HttpServletRequest request) {
        String message = request.getParameter("message");
        String alert = request.getParameter("alert");
        if (message != null && alert != null) {
            String val = bundle.getString(message);
            byte[] ptext = val.getBytes(StandardCharsets.ISO_8859_1);
            String messageUTF8 = new String(ptext, StandardCharsets.UTF_8);
            request.setAttribute("message", messageUTF8);
            request.setAttribute("alert", alert);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserModel m1 = new UserModel();
        m1.setUsername(username);
        m1.setPassword(password);
        UserModel model = new UserModel();
        model.setUsername("user");
        model.setPassword("123");
        if (m1 != null) {
            if ((m1.getUsername().equals(model.getUsername())) && (m1.getPassword().equals(model.getPassword())) ){
                response.sendRedirect(request.getContextPath() + "/trang-chu");
            }
            // khong ton tai account
            else {
                response.sendRedirect(request.getContextPath()
                        + "/dang-nhap?message=username_password_invalid&alert=danger");
            }
        }

    }
}
