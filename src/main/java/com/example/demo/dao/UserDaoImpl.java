package com.example.demo.dao;

import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public boolean authenticateUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        List<User> users = jdbcTemplate.query(query, new Object[]{username, password}, this::mapRowToUser);
        return !users.isEmpty();
    }

    @Override
    public boolean createUser(User newUser) {
        String query = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(query, newUser.getUsername(), newUser.getPassword(), newUser.getEmail(), newUser.getRole()) > 0;
    }

    @Override
    public User getUser(String username) {
        String query = "SELECT * FROM users WHERE username = ?";
        List<User> users = jdbcTemplate.query(query, new Object[]{username}, this::mapRowToUser);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public boolean updateUser(User updatedUser) {
        String query = "UPDATE users SET password = ?, email = ?, role = ? WHERE username = ?";
        return jdbcTemplate.update(query, updatedUser.getPassword(), updatedUser.getEmail(), updatedUser.getRole(), updatedUser.getUsername()) > 0;
    }

    @Override
    public boolean deleteUser(String username) {
        String query = "DELETE FROM users WHERE username = ?";
        return jdbcTemplate.update(query, username) > 0;
    }

    @Override
    public List<User> getAllUsers() {
        String query = "SELECT * FROM users";
        return jdbcTemplate.query(query, this::mapRowToUser);
    }

    @Override
    public User getUserByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        List<User> users = jdbcTemplate.query(query, new Object[]{email}, this::mapRowToUser);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public boolean registerUser(String username, String password, String email) {
        String query = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(query, username, password, email, "student") > 0;
    }

    private User mapRowToUser(ResultSet rs, int rowNum) throws SQLException {
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("email"),
                rs.getString("role")
        );
    }
}