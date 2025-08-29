package com.hemanth.hospital.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hemanth.hospital.models.Appointment;
import com.hemanth.hospital.models.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
    Optional<Patient> findByPhoneNumberAndAadharCardNo(String phoneNumber, String aadharCardNo);

    List<Patient> findByVisitDate(LocalDate visitDate);




}
