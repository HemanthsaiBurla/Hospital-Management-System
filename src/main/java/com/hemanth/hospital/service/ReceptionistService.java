package com.hemanth.hospital.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.models.Receptionist;
import com.hemanth.hospital.repository.PatientRepository;
import com.hemanth.hospital.repository.ReceptionistRepository;

@Service
public class ReceptionistService {

    @Autowired
    private ReceptionistRepository receptionistRepository;
    
    @Autowired
    private PatientRepository patientRepository;
    
    
    
 // Get all patients
    public List<Patient> getAllPatients() {
        return patientRepository.findAll();
    }
    
    
    // Add a new patient
    public Patient addPatient(Patient patient) {
        return patientRepository.save(patient);
    }
    
    
 // Get patient by ID
    public Patient getPatientById(Long id) {
        return patientRepository.findById(id).orElse(null);
    }
    
 // Update patient details
    public Patient updatePatient(Patient patient) {
        return patientRepository.save(patient);
    }

    
    
 // Delete patient by ID
    public void deletePatient(Long id) {
        patientRepository.deleteById(id);
    }
    
    
    
    
    
    

    // Receptionist login validation
    public Receptionist validateReceptionist(String username, String password) {
        return receptionistRepository.findByUsernameAndPassword(username, password)
                                     .orElse(null);
    }

    // Get all receptionists
    public List<Receptionist> getAllReceptionists() {
        return receptionistRepository.findAll();
    }

    // Add new receptionist
    public Receptionist addReceptionist(Receptionist receptionist) {
        receptionist.setJoinDate(LocalDateTime.now());
        return receptionistRepository.save(receptionist);
    }

    // Get by ID
    public Receptionist getReceptionistById(Long id) {
        return receptionistRepository.findById(id).orElse(null);
    }

    // Update receptionist
    public Receptionist updateReceptionist(Receptionist receptionist) {
        return receptionistRepository.save(receptionist);
    }

    // Delete receptionist
    public void deleteReceptionist(Long id) {
        receptionistRepository.deleteById(id);
    }
}
