package com.jhwebsite.controller.admin;

import com.jhwebsite.constant.SystemConstant;
import com.jhwebsite.model.UserModel;

import com.jhwebsite.service.IUserService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/quan-tri/trang-chu")
public class HomeController extends HttpServlet {

    @Inject
    private IUserService userService;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<UserModel> admins = userService.findAllUsersByRole(SystemConstant.ADMIN);
        int totalUser = userService.getTotalUserByRole(SystemConstant.USER);
//        int totalProductActive = productService.getTotalItemsByStatus(1);
//        int totalOrders = orderService.getTotalOrders();
//        long revenue = orderService.getRevenue();

        request.setAttribute("totalUsers",totalUser);
//        request.setAttribute("totalOrders",totalOrders);
//        request.setAttribute("totalProductActive",totalProductActive);
        request.setAttribute("admins",admins);
//        request.setAttribute("revenue",revenue);
        RequestDispatcher rd = request.getRequestDispatcher("../views/admin/home.jsp");
        rd.forward(request, response);
    }
}
