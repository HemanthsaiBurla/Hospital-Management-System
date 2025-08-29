package com.hemanth.hospital.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.hemanth.hospital.models.Medicine;

public interface MedicineRepository extends JpaRepository<Medicine, Long> {
}
