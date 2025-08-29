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
public class Doctor {
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long doctorId;

	    private String username;
	    private String password;
	    private int age;
	    private String gender;
	    private String phoneNumber;
	    private String role = "DOCTOR"; // Default role
	    private String specialist;
	    private String experience;
	    
	    @DateTimeFormat(pattern = "yyyy-MM-dd")
	    private LocalDateTime joinDate;
    
    
}
