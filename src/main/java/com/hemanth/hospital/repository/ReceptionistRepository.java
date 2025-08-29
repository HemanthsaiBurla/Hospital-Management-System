package com.hemanth.hospital.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hemanth.hospital.models.Receptionist;

public interface ReceptionistRepository extends JpaRepository<Receptionist, Long> {
    Optional<Receptionist> findByUsernameAndPassword(String username, String password);
}
