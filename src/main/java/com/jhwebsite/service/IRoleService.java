package com.jhwebsite.service;

import com.jhwebsite.model.RoleModel;

import java.util.List;

public interface IRoleService {
    List<RoleModel> findAll();
    RoleModel findOneById(long id);
}
