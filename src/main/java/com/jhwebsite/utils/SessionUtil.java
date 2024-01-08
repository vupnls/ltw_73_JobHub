package com.jhwebsite.utils;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {
    private static SessionUtil sessionUtil = null;

    private SessionUtil() {

    }

    public static SessionUtil getInstance() {
        if (sessionUtil == null)
            sessionUtil = new SessionUtil();
        return sessionUtil;
    }

    // duy tri doi tuong
    public void putValue(HttpServletRequest request, String key, Object value) {
        request.getSession().setAttribute(key, value);
    }

    // lay thong tin cua doi tuong
    public Object getValue(HttpServletRequest request, String key) {

        return request.getSession().getAttribute(key);
    }

    // xoa doi tuong khoi session
    public void removeValue(HttpServletRequest request, String key) {
        request.getSession().removeAttribute(key);
    }
}
