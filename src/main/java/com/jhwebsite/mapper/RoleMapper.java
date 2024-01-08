package com.jhwebsite.mapper;

import com.jhwebsite.model.RoleModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper implements IRowMapper<RoleModel> {
    @Override
    public RoleModel mapRow(ResultSet resultSet) {
        RoleModel model = new RoleModel();
        try{
            model.setId(resultSet.getLong("id"));
            model.setName(resultSet.getString("name"));
            model.setCode(resultSet.getString("code"));
            model.setCreatedDate((resultSet.getTimestamp("createddate")));
            model.setCreatedBy((resultSet.getString("createdby")));
            model.setModifiedDate((resultSet.getTimestamp("modifieddate")));
            model.setModifiedBy((resultSet.getString("modifiedby")));
            return model;

        }catch (SQLException throwables){
            return null;
        }
    }
}
