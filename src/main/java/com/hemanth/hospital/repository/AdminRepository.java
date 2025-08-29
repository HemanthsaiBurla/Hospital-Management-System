package com.hemanth.hospital.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.hemanth.hospital.models.Admin;
import java.util.Optional;

public interface AdminRepository extends JpaRepository<Admin, Long> {
    Optional<Admin> findByUsernameAndPassword(String username, String password);
}
