package com.jhwebsite.service.impl;

import com.jhwebsite.dao.IRoleDAO;
import com.jhwebsite.model.RoleModel;
import com.jhwebsite.service.IRoleService;

import javax.inject.Inject;
import java.util.List;

public class RoleService implements IRoleService {
    @Inject
    private IRoleDAO roleDAO;
    @Override
    public List<RoleModel> findAll() {
        return roleDAO.findAll();
    }

    @Override
    public RoleModel findOneById(long id) {
        return roleDAO.findOneById(id);
    }
}
