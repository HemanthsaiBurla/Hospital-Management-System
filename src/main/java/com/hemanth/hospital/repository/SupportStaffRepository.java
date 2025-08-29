package com.hemanth.hospital.repository;

import com.hemanth.hospital.models.SupportStaff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SupportStaffRepository extends JpaRepository<SupportStaff, Long> {
}
