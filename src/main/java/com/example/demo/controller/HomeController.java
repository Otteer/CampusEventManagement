package com.example.demo.controller;

import com.example.demo.dao.UserDao;
import com.example.demo.model.User;
import com.example.demo.model.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    private final UserDao userDao;
    private final UserSession userSession;

    @Autowired
    public HomeController(UserDao userDao, UserSession userSession) {
        this.userDao = userDao;
        this.userSession = userSession;
    }

    @GetMapping("/")
    public String home() {
        return "login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session) {
        if (userDao.authenticateUser(username, password)) {
            User user = userDao.getUser(username);
            session.setAttribute("user", user);
            return "redirect:/events";
        } else {
            return "redirect:/login?error=invalid username or password";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/register")
    public String showRegistrationForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("email") String email,
                           @RequestParam("role") String role) {
        User user = new User(null, username, password, email, role);
        if (userDao.createUser(user)) {
            return "redirect:/login";
        } else {
            return "redirect:/register?error=true";
        }
    }
}