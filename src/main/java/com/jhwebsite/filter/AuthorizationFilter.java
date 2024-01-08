package com.jhwebsite.filter;

import com.jhwebsite.constant.SystemConstant;
import com.jhwebsite.model.UserModel;
import com.jhwebsite.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthorizationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String url = req.getRequestURI();
        if (url.startsWith("/quan-tri")) {
            UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
            if (userModel != null) {
                if (userModel.getRole().getCode().equalsIgnoreCase(SystemConstant.ADMIN))
                    chain.doFilter(request, response);
                else if (userModel.getRole().getCode().equalsIgnoreCase(SystemConstant.USER)) {
                    SessionUtil.getInstance().removeValue(req, "USERMODEL");
                    res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_permission&alert=danger");
                }
            } else
                res.sendRedirect(req.getContextPath() + "/dang-nhap?message=not_login&alert=danger");
        } else
            chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
