package com.jhwebsite.controller.admin.api;

import com.jhwebsite.constant.SystemConstant;
import com.jhwebsite.mail.MailMessage;
import com.jhwebsite.mail.MailUtils;
import com.jhwebsite.model.UserModel;
import com.jhwebsite.service.IUserService;
import com.jhwebsite.utils.MD5Hashing;
import com.jhwebsite.utils.SessionUtil;
import com.jhwebsite.utils.UploadFileUtil;
import org.codehaus.jackson.map.ObjectMapper;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Base64;

@WebServlet(urlPatterns = "/api-admin-user")
public class UserAPI extends HttpServlet {
    @Inject
    private IUserService userService;
    @Inject
    private UploadFileUtil uploadFile;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF8");
        response.setContentType("application/json");
        UserModel userModel = mapper.readValue(request.getInputStream(), UserModel.class);
        UserModel userSession = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
        String avatarPath = SystemConstant.AVATAR_DEFAULT;
        if (userModel.getUploadFile().getBase64() != null) {
            byte[] decodeBase64 = Base64.getDecoder().decode(userModel.getUploadFile().getBase64().getBytes()); // convert base64 ve mang byte[]
            String path = request.getServletContext().getRealPath(File.separator) + SystemConstant.AVATAR_DIR;
            uploadFile.writeOrUpdate(decodeBase64, path + userModel.getUploadFile().getName());
            avatarPath = SystemConstant.AVATAR_DIR + userModel.getUploadFile().getName();
        }
        userModel.setAvatar(avatarPath);
        userModel.setCreatedBy(userSession.getUsername());
        userModel = userService.insert(userModel);
        if (userModel != null) {
            if (userModel.getRoleId() == 1) {
                MailUtils.sendMail(userModel.getEmail(), "Thư chào mừng", MailMessage.getWelcomeAdmin(userModel.getFullname()));
            } else {
                MailUtils.sendMail(userModel.getEmail(), "Thư chào mừng", MailMessage.getWelcome(userModel.getFullname()));
            }
        }
        mapper.writeValue(response.getOutputStream(), userModel);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF8");
        response.setContentType("application/json");
        UserModel userModel = mapper.readValue(request.getInputStream(), UserModel.class);
        UserModel userOld = userService.findOneById(userModel.getId());
        UserModel userSession = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
        userModel.setModifiedBy(userSession.getUsername());



        //xử lý với userSession thay đổi thông tin
        if (userModel.getId() == userSession.getId()) {
            //nếu user đang hoạt động chỉnh trạng thái hoạt động về 0 hoặc quyền mình về 2(thành vien)
            if (userModel.getStatus() == 0 || userModel.getRoleId() == 2) {
                mapper.writeValue(response.getOutputStream(), "");
                return;
            }
            if (!MD5Hashing.hash(userModel.getPassword()).equals(userOld.getPassword()) && !userModel.getPassword().equals(userOld.getPassword())) {
                String passNew = MD5Hashing.hash(userModel.getPassword());
                String avatarPath = userOld.getAvatar(); //lấy hình cũ nếu không có hình mới
                if (userModel.getUploadFile().getBase64() != null) {
                    byte[] decodeBase64 = Base64.getDecoder().decode(userModel.getUploadFile().getBase64().getBytes()); // convert base64 ve mang byte[]
                    String path = request.getServletContext().getRealPath(File.separator) + SystemConstant.AVATAR_DIR;
                    uploadFile.writeOrUpdate(decodeBase64, path + userModel.getUploadFile().getName());
                    avatarPath = SystemConstant.AVATAR_DIR + userModel.getUploadFile().getName();
                    //lấy hình mới
                }
                userModel.setAvatar(avatarPath);
                userModel.setPassword(passNew);
                userModel = userService.update(userModel);
                if (userModel != null) {
                    SessionUtil.getInstance().removeValue(request, "USERMODEL");
                    mapper.writeValue(response.getOutputStream(), "updatepass");
                } else
                    mapper.writeValue(response.getOutputStream(), userModel);
                return;
            }
        }
        //với những user khác nếu thay đổi mật khẩu
        if (!MD5Hashing.hash(userModel.getPassword()).equals(userOld.getPassword()) && !userModel.getPassword().equals(userOld.getPassword())) {
            String passNew = MD5Hashing.hash(userModel.getPassword());
            userModel.setPassword(passNew);
        }
        //mật khẩu trùng
        if (MD5Hashing.hash(userModel.getPassword()).equals(userOld.getPassword())) {
            mapper.writeValue(response.getOutputStream(), "overlappass");
            return;
        }
        //update hinh
        String avatarPath = userOld.getAvatar(); //lấy hình cũ nếu không có hình mới
        if (userModel.getUploadFile().getBase64() != null) {
            byte[] decodeBase64 = Base64.getDecoder().decode(userModel.getUploadFile().getBase64().getBytes()); // convert base64 ve mang byte[]
            String path = request.getServletContext().getRealPath(File.separator) + SystemConstant.AVATAR_DIR;
            uploadFile.writeOrUpdate(decodeBase64, path + userModel.getUploadFile().getName());
            avatarPath = SystemConstant.AVATAR_DIR + userModel.getUploadFile().getName();
            //lấy hình mới
        }
        userModel.setAvatar(avatarPath);
        //update cho những người dùng khác userSession
        userModel = userService.update(userModel);
        mapper.writeValue(response.getOutputStream(), userModel);
        //chỉnh sửa chính tk của mình
        if (userModel.getId() == userSession.getId())
            SessionUtil.getInstance().putValue(request, "USERMODEL", userModel);

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF8");
        response.setContentType("application/json");
        UserModel userModel = mapper.readValue(request.getInputStream(), UserModel.class);
        UserModel userSession = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
        boolean result = userService.delete(userModel.getIds(), userSession);
        mapper.writeValue(response.getOutputStream(), result);
    }
}
