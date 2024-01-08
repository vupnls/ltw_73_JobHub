package com.jhwebsite.dao.impl;

import com.jhwebsite.dao.IGenericDAO;
import com.jhwebsite.db.ConnectionDB;
import com.jhwebsite.mapper.IRowMapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AbstractDAO<T> implements IGenericDAO<T> {

    @Override
    public <T> List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters) {
        List<T> result = new ArrayList<T>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = ConnectionDB.getConnection();
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);

            resultSet = statement.executeQuery();
            while (resultSet.next())
                result.add(rowMapper.mapRow(resultSet));
        } catch (SQLException throwables) {
            return null;
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public boolean update(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        int row = 0;
        try {
            connection = ConnectionDB.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);
            row = statement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                        return false;
                } catch (SQLException e1) {
                    e.printStackTrace();
                }
            }
        } finally {
            try {
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
        return row > 0 ? true : false;
    }

    @Override
    public Long insert(String sql, Object... parameters) {
        Long id = null;
        ResultSet resultSet = null;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = ConnectionDB.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            setParameters(statement, parameters);
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next())
                id = resultSet.getLong(1);
            connection.commit();
            return id;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e.printStackTrace();
                }
            }
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
        return null;
    }

    private void setParameters(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Long)
                    statement.setLong(index, (Long) parameter);
                else if (parameter instanceof String)
                    statement.setString(index, (String) parameter);
                else if (parameter instanceof Integer)
                    statement.setInt(index, (Integer) parameter);
                else if (parameter instanceof Timestamp)
                    statement.setTimestamp(index, (Timestamp) parameter);
                else if (parameter == null)
                    statement.setTimestamp(index, null);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return;
        }
    }

    @Override
    public int count(String sql, Object... parameters) {
        ResultSet resultSet = null;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            int count = 0;
            connection = ConnectionDB.getConnection();
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            return count;
        } catch (SQLException e) {
            return 0;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e2) {
                return 0;
            }
        }
    }
}
