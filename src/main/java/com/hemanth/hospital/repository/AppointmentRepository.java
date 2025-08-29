package com.hemanth.hospital.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hemanth.hospital.models.Appointment;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long>{
    List<Appointment> findByPatientId(Long patientId);
    List<Appointment> findByAppointmentDate(LocalDate appointmentDate);
}
