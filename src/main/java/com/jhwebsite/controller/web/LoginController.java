package com.jhwebsite.controller.web;

import com.jhwebsite.constant.SystemConstant;
import com.jhwebsite.model.UserModel;
import com.jhwebsite.service.IUserService;
import com.jhwebsite.utils.MessageUtil;
import com.jhwebsite.utils.SessionUtil;

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
    @Inject
    private IUserService userService;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null && action.equalsIgnoreCase("logout")) {
            SessionUtil.getInstance().removeValue(request, "USERMODEL");
            response.sendRedirect(request.getContextPath() + "/trang-chu");
        } else {
            MessageUtil.showMessage(request);
            // Neu da dang nhap thi redirect ve trang thong tin nguoi dung
            if (SessionUtil.getInstance().getValue(request, "USERMODEL") != null) {
                response.sendRedirect(request.getContextPath() + "/trang-chu");
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("views/web/login.jsp");
                rd.forward(request, response);
            }
        }

    }

    private ResourceBundle bundle = ResourceBundle.getBundle("message");



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserModel userModel = userService.checkLogin(username, password, 1);
        if (userModel != null) {
            SessionUtil.getInstance().putValue(request, "USERMODEL", userModel);
            if (userModel.getRole().getCode().equalsIgnoreCase(SystemConstant.ADMIN))
                response.sendRedirect(request.getContextPath() + "/quan-tri/trang-chu");
            else if (userModel.getRole().getCode().equalsIgnoreCase(SystemConstant.USER))
                response.sendRedirect(request.getContextPath() + "/trang-chu");
        }
        // khong ton tai account
        else {
            response.sendRedirect(request.getContextPath()
                    + "/dang-nhap?message=username_password_invalid&alert=danger");
        }
    }

}

