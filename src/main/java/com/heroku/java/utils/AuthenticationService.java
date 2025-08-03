package com.heroku.java.utils;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
    private final DataSource dataSource;

    @Autowired
    public AuthenticationService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public boolean checkAdminPrivilege(String password) throws SQLException {
        Connection connection = dataSource.getConnection();
        final var statement = connection.createStatement();
        final var resultSet = statement.executeQuery("SELECT * FROM role WHERE permission = 'admin'");
        
        while (resultSet.next()) {
            String pwd = resultSet.getString("password");
            if (pwd.equals(password)) {
                connection.close();
                return true;
            }
        }

        connection.close();
        return false;
    }
}