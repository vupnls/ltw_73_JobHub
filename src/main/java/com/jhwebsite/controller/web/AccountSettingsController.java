package com.jhwebsite.controller.web;

import com.jhwebsite.model.UserModel;
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

@WebServlet(urlPatterns = "/chinh-sua-thong-tin")
public class AccountSettingsController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        layoutAttributeService.setHeaderWeb(request);
//        layoutAttributeService.setFooterWeb(request);
        UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
        MessageUtil.showMessage(request);
        if (user != null) {
            request.setAttribute("user", user);
            RequestDispatcher rd = request.getRequestDispatcher("views/web/accountsettings.jsp");
            rd.forward(request, response);
        } else
            response.sendRedirect(request.getContextPath()
                    + "/dang-nhap?message=not_login&alert=danger");
    }
}
