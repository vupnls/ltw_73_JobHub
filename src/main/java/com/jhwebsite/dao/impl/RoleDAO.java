package com.jhwebsite.dao.impl;

import com.jhwebsite.dao.IRoleDAO;
import com.jhwebsite.mapper.RoleMapper;
import com.jhwebsite.model.RoleModel;

import java.util.List;

public class RoleDAO extends AbstractDAO<RoleModel> implements IRoleDAO {
    @Override
    public List<RoleModel> findAll() {
        String sql = "SELECT * FROM role";
        return query(sql, new RoleMapper());
    }

    @Override
    public RoleModel findOneById(long id) {
        String sql = "SELECT * FROM role WHERE id = ?";
        List<RoleModel> roles = query(sql, new RoleMapper(), id);
        return roles.isEmpty() ? null : roles.get(0);
    }
}
