package com.hemanth.hospital.models;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "patient")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "patient_id")
    private Long patientId;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "age", nullable = false)
    private int age;

    @Column(name = "gender", nullable = false, length = 20)
    private String gender;

    @Column(name = "phone_number", nullable = false, length = 15)
    private String phoneNumber;

    @Column(name = "address", length = 255)
    private String address;

    @Column(name = "aadhar_card_no", nullable = false, unique = true, length = 12)
    private String aadharCardNo;

    @Column(name = "medical_history", columnDefinition = "TEXT")
    private String medicalHistory;

    @Column(name = "recommendations", columnDefinition = "TEXT")
    private String recommendations;

    @Column(name = "instructions", columnDefinition = "TEXT")
    private String instructions;

    @Column(name = "medicines", columnDefinition = "TEXT")
    private String medicines;

    @Column(name = "bill_amount", precision = 10, scale = 2)
    private BigDecimal billAmount;
    
    private BigDecimal amountPaid;
    private BigDecimal amountBalence;
    
    private String admissionStatus;  // admitted or outpatient or discharged
    private String appointmentType;   //online r offline by the receptionsit or user in online
    private String transactionType;   //UPI or card or cash
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String dischargeDate;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String admittedDate;
    
    private String remarks;
    private String department;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String appointmentDate;
    
    private String medicineStatus;
    public void onCreate() {
        this.visitDate = LocalDate.now(); // auto fill visit date
        if (this.medicineStatus == null) {
            this.medicineStatus = "Pending";
        }
    }
    private LocalDate visitDate;

    @PrePersist
    public void prePersist() {
        if (visitDate == null) {  // only set if not coming from form
            this.visitDate = LocalDate.now();
        }
    }
}
