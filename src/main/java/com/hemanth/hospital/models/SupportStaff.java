package com.hemanth.hospital.models;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SupportStaff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long staffId;

    private String fullName;

    private int age;

    private String gender;

    private String phoneNumber;

    private String jobType; // SWEEPER, WARD_BOY, etc.

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime joinDate;
}
