package com.hemanth.hospital.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hemanth.hospital.models.Bill;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {

}
