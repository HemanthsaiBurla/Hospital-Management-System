package com.hemanth.hospital.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hemanth.hospital.models.Nurse;

@Repository
public interface NurseRepository extends JpaRepository<Nurse, Long> {
    Optional<Nurse> findByUsernameAndPassword(String username, String password);
}
