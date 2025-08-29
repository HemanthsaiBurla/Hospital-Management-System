package com.hemanth.hospital.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hemanth.hospital.models.User;
import com.hemanth.hospital.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // login.jsp
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              @RequestParam String role,
                              HttpSession session,
                              Model model) {
        User user = userService.validateUser(username, password);
        if (user != null && user.getRole().equalsIgnoreCase(role)) {
            session.setAttribute("loggedInUser", user);

            switch (role) {
                case "ADMIN": return "redirect:/admin/dashboard";
                case "DOCTOR": return "redirect:/doctor/dashboard";
                case "PHARMACIST": return "redirect:/pharmacist/dashboard";
                case "RECEPTIONIST": return "redirect:/receptionist/dashboard";
            }
        }
        model.addAttribute("error", "Invalid username, password, or role!");
        return role.toLowerCase() + "-login"; 
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login?logout=true";
    }
}
