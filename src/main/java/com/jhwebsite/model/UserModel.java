package com.jhwebsite.model;


import java.sql.Timestamp;

public class UserModel extends AbstractModel {
    private String fullname;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String avatar;
    private long roleId;
//    private RoleModel role;
    private int status;
    private String keycode;
    private Timestamp keytime;

    public UserModel() {
    }

//    public UploadFileModel getUploadFile() {
//        return uploadFile;
//    }

//    public void setUploadFile(UploadFileModel uploadFile) {
//        this.uploadFile = uploadFile;
//    }

    public long getRoleId() {
        return roleId;
    }

    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

//    public RoleModel getRole() {
//        return role;
//    }

//    public void setRole(RoleModel role) {
//        this.role = role;
//    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getKeycode() {
        return keycode;
    }

    public void setKeycode(String keycode) {
        this.keycode = keycode;
    }

    public Timestamp getKeytime() {
        return keytime;
    }

    public void setKeytime(Timestamp keytime) {
        this.keytime = keytime;
    }
}
