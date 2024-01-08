package com.jhwebsite.controller.web;



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

@WebServlet(urlPatterns = "/dang-ky")
public class RegisterController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (SessionUtil.getInstance().getValue(request, "USERMODEL") != null)
            response.sendRedirect(request.getContextPath() + "/chinh-sua-thong-tin");
        else {
            MessageUtil.showMessage(request);
            RequestDispatcher rd = request.getRequestDispatcher("views/web/register.jsp");
            rd.forward(request, response);
        }
    }
}
