package com.hemanth.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.models.Admin;
import com.hemanth.hospital.models.User;
import com.hemanth.hospital.repository.AdminRepository;
import com.hemanth.hospital.repository.UserRepository;

@Service
public class AdminService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AdminRepository adminRepository;

    public boolean validateAdmin(String username, String password) {
        return adminRepository.findByUsernameAndPassword(username, password).isPresent();
    }

    public void registerAdmin(String username, String password) {
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        admin.setRole_Main("ADMIN"); // Always ADMIN

        adminRepository.save(admin);
    }

    public void registerUser(String username, String password, String role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        userRepository.save(user);
    }

    public List<Admin> getAllUsers() {
        return adminRepository.findAll();
    }
    

    
    
}
