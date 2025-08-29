package com.hemanth.hospital.models;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
public class Medicine {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long medicineId;

    private String medicineName;
    private String brandName;
    private String genericName;
    private String description;
    private String dosageForm;
    private String manufacturerName;
    private String price;
    private String status;
    private String expDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime joinDate;
}
