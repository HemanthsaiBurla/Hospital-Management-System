package com.hemanth.hospital.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hemanth.hospital.models.Pharmacist;

@Repository
public interface PharmacistRepository extends JpaRepository<Pharmacist, Long> {
    Optional<Pharmacist> findByUsernameAndPassword(String username, String password);
}

