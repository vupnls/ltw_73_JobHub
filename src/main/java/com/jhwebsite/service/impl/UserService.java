package com.jhwebsite.service.impl;

import com.jhwebsite.dao.IUserDAO;
import com.jhwebsite.model.UserModel;
import com.jhwebsite.service.IUserService;
//import com.jhwebsite.utils.MD5Hashing;
import com.jhwebsite.service.IUserService;
import com.jhwebsite.utils.MD5Hashing;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class UserService implements IUserService {

    @Inject
    private IUserDAO userDAO;

    @Override
    public List<UserModel> findAllUsers() {
        return userDAO.findAllUsers();
    }

    @Override
    public UserModel checkLogin(String usernameOrEmail, String password, int status) {
        password = MD5Hashing.hash(password);
        UserModel user = userDAO.findOneByUsernameAndPasswordAndStatus(usernameOrEmail, password, status);
        if (user != null)
            return user;
        user = userDAO.findOneByEmailAndPasswordAndStatus(usernameOrEmail, password, status);
        return user;
    }

    @Override
    public UserModel findOneById(Long id) {
        return userDAO.findOneById(id);
    }

    @Override
    public UserModel insert(UserModel user) {
        List<UserModel> temp = userDAO.findByUsernameAndEmail(user.getUsername(), user.getEmail());
        if (temp.isEmpty()) {
            user.setCreatedDate(new Timestamp(System.currentTimeMillis()));
//             hash password to MD5
            user.setPassword(MD5Hashing.hash(user.getPassword()));
            Long id = userDAO.insert(user);
            return userDAO.findOneById(id);
        }
        return null;
    }

    @Override
    public UserModel update(UserModel user) {
        List<UserModel> temp = userDAO.findByUsernameAndEmail(user.getUsername(), user.getEmail());
        if (temp.size() > 1) {
            return null;
        } else if (temp.size() == 1)
            if (temp.get(0).getId() != user.getId())
                return null; // neu tim dc 1 user thi check xem neu khong phai la user hien tai dang chinh sua thi return null

        UserModel oldUser = userDAO.findOneById(user.getId());
        if (oldUser != null) {
            user.setCreatedDate(oldUser.getCreatedDate());
            user.setCreatedBy(oldUser.getCreatedBy());
            user.setModifiedDate(new Timestamp(System.currentTimeMillis()));
            if (userDAO.update(user))
                return userDAO.findOneById(user.getId());
        }
        return null;
    }

    @Override
    public boolean delete(long[] ids, UserModel userSession) {
        for (long id : ids) {
            if (id == userSession.getId() || !userDAO.delete(id))
                return false;
        }
        return true;
    }

    @Override
    public UserModel findOneByEmail(String email) {
        return userDAO.findOneByEmail(email);
    }

    @Override
    public UserModel resetPassword(long userId, String currentPassword, String newPassword) {
        UserModel user = userDAO.findOneById(userId);
//        currentPassword = MD5Hashing.hash(currentPassword);
        if (user == null || !user.getPassword().equals(currentPassword))
            return null;
//        newPassword = MD5Hashing.hash(newPassword);
        if (userDAO.resetPassword(userId, newPassword))
            return userDAO.findOneById(userId);
        return null;
    }

    @Override
    public List<UserModel> findAllUsersByRole(String role) {
        return userDAO.findAllUsersByRole(role);
    }

    @Override
    public int getTotalUserByRole(String role) {
        return userDAO.getTotalUserByRole(role);
    }
}
