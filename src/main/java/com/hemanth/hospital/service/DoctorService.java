package com.hemanth.hospital.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.models.Doctor;
import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.models.Pharmacist;
import com.hemanth.hospital.models.User;
import com.hemanth.hospital.repository.DoctorRepository;
import com.hemanth.hospital.repository.PatientRepository;
import com.hemanth.hospital.repository.UserRepository;

@Service
public class DoctorService {
	

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PatientRepository patientRepository;
    
    @Autowired
    private DoctorRepository doctorRepository;

    // Validate doctor login
    public Doctor validateDoctor(String username, String password) {
        return doctorRepository.findByUsernameAndPassword(username, password)
                .orElse(null);
    }

    
    // Get all patients
    public List<Patient> getAllPatients() {
        return patientRepository.findAll();
    }

    // Add a new patient
    public Patient addPatient(Patient patient) {
        return patientRepository.save(patient);
    }

    // Delete patient by ID
    public void deletePatient(Long id) {
        patientRepository.deleteById(id);
    }

    // Get patient by ID
    public Patient getPatientById(Long id) {
        return patientRepository.findById(id).orElse(null);
    }

    // Update patient details
    public void updatePatient(Patient patient) {
        patientRepository.save(patient);
    }
    
    
    
    
    public void addDoctor(Doctor doctor) {
        doctor.setJoinDate(LocalDateTime.now());
        doctorRepository.save(doctor);
    }

    public void updateDoctor(Doctor doctor) {
        doctorRepository.save(doctor);
    }

    public void deleteDoctor(Long id) {
        doctorRepository.deleteById(id);
    }

    public List<Doctor> getAllDoctors() {
        return doctorRepository.findAll();
    }

    public Doctor getDoctorById(Long id) {
        return doctorRepository.findById(id).orElse(null);
    }
}
