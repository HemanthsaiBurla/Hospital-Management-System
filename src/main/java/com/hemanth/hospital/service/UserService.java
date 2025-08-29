package com.hemanth.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.models.User;
import com.hemanth.hospital.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Create new user
    public User createUser(String username, String password, String role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // 🔐 TODO: encrypt in production
        user.setRole(role);
        return userRepository.save(user);
    }

    public void updateUser(Long id, String username, String password) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
        user.setUsername(username);
        if (!password.isBlank()) {
            user.setPassword(password);
        }
        userRepository.save(user);
    }
    
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    
    // Get all users
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Get users by role
    public List<User> getUsersByRole(String role) {
        return userRepository.findByRole(role);
    }
    
    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }


    // Validate user (return User object if valid)
    public User validateUser(String username, String password) {
        return userRepository.findByUsernameAndPassword(username, password)
                .orElse(null);
    }
}
