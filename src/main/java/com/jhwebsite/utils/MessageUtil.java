package com.jhwebsite.utils;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.util.ResourceBundle;

public class MessageUtil {
    private static ResourceBundle bundle = ResourceBundle.getBundle("message");

    public static void showMessage(HttpServletRequest request) {
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
}
