package com.example.demo.dao;

import com.example.demo.model.User;

import java.util.List;

public interface UserDao {
    boolean authenticateUser(String username, String password);
    boolean createUser(User user);
    User getUser(String username);
    boolean updateUser(User user);
    boolean deleteUser(String username);
    List<User> getAllUsers();
    User getUserByEmail(String email);
    boolean registerUser(String username, String password, String email);
}