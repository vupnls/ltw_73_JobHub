package com.jhwebsite.dao;

import com.jhwebsite.model.UserModel;

import java.util.List;


public interface IUserDAO {
    List<UserModel> findAllUsers();

    UserModel findOneByUsernameAndPasswordAndStatus(String username, String password, int status);

    UserModel findOneByEmailAndPasswordAndStatus(String email, String password, int status);

    Long insert(UserModel user);

    boolean update(UserModel user);

    boolean delete(long id);

    List<UserModel> findByUsernameAndEmail(String username, String email);

    UserModel findOneById(Long id);

    UserModel findOneByEmail(String email);

    boolean resetPassword(long userId, String newPassword);

    List<UserModel> findAllUsersByRole(String role);

    int getTotalUserByRole(String role);
}
