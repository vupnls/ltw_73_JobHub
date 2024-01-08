package com.jhwebsite.controller.admin;

import com.jhwebsite.model.RoleModel;
import com.jhwebsite.model.UserModel;
import com.jhwebsite.service.IRoleService;
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
import java.util.List;

@WebServlet(urlPatterns = "/quan-tri/nguoi-dung")
public class UserController extends HttpServlet {
    @Inject
    private IUserService userService;
    @Inject
    private IRoleService roleService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String url = "";
        if (id !=null) {
                    UserModel user = userService.findOneById(Long.parseLong(id));
                    request.setAttribute("user", user);
                    List<RoleModel> roles = roleService.findAll();
                    request.setAttribute("roles", roles);
                    url = "../views/admin/edituser.jsp";

        } else {
            SessionUtil.getInstance().getValue(request, "USERMODEL");
            List<UserModel> users = userService.findAllUsers();
            request.setAttribute("users", users);
            List<RoleModel> roles = roleService.findAll();
            request.setAttribute("roles", roles);
            url = "../views/admin/users.jsp";
        }
        MessageUtil.showMessage(request);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
