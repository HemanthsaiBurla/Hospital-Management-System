package com.hemanth.hospital.models;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long appointmentId;

    private Long patientId;

    
    private LocalDate appointmentDate;

    private String department;        // ENT, Eye, General

    private String consultationType;  // New / Follow-up

    private String status;            // Booked / Completed / Cancelled
}
