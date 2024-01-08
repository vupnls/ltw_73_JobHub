package com.jhwebsite.dao;


import com.jhwebsite.model.RoleModel;

import java.util.List;

public interface IRoleDAO {
    List<RoleModel> findAll();
    RoleModel findOneById(long id);
}
