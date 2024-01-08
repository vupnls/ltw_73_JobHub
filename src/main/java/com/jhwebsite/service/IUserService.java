package com.jhwebsite.service;

import com.jhwebsite.model.UserModel;

import java.util.List;

public interface IUserService {

    List<UserModel> findAllUsers();

    UserModel checkLogin(String usernameOrEmail, String password, int status);

    UserModel findOneById(Long id);

    UserModel insert(UserModel user);

    UserModel update(UserModel user);

    boolean delete(long [] ids, UserModel userSession);

    UserModel findOneByEmail(String email);

    UserModel resetPassword(long userId, String currentPassword, String newPassword);

    List<UserModel> findAllUsersByRole(String role);

    int getTotalUserByRole(String role);
}
