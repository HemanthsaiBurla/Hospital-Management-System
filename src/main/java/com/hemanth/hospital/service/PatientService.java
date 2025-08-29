package com.hemanth.hospital.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.exception.PatientNotFoundException;
import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.repository.PatientRepository;

@Service
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;
    
    
    
    
 // ✅ Login check
    public Patient loginPatient(String phoneNumber, String aadharCardNo) {
        return patientRepository.findByPhoneNumberAndAadharCardNo(phoneNumber, aadharCardNo)
                .orElse(null);
    }

    
    
    public Patient addPatient(Patient patient) {
        return patientRepository.save(patient);
    }

    // Get all patients
    public List<Patient> getAllPatients() {
//        System.out.println("Fetching all patients from service layer...");
        return patientRepository.findAll(); 
    }

    
    
    
    
    public void updateMedicineStatus(Long patientId, String status) {
        Patient patient = patientRepository.findById(patientId).orElseThrow();
        patient.setMedicineStatus(status);
        patientRepository.save(patient);
    }
    
    // Create a new patient
    public Patient createPatient(Patient patient) {
        System.out.println("Creating new patient...");
        return patientRepository.save(patient); 
    }

    // Get patient by ID
    public Patient getPatientById(Long id) {
//        System.out.println("Fetching patient with ID: " + id);
        return patientRepository.findById(id)
                .orElseThrow(() -> new PatientNotFoundException("Patients not available with ID: " + id));
    }

    // Update existing patient
    public Patient updatePatient(Long id, Patient updatedPatient) {
        System.out.println("Updating patient with ID: " + id);
        Patient patient = patientRepository.findById(id)
                .orElseThrow(() -> new PatientNotFoundException("No patient found with ID: " + id));

        patient.setName(updatedPatient.getName());
        patient.setAge(updatedPatient.getAge());
        patient.setGender(updatedPatient.getGender());

        return patientRepository.save(patient);
    }

    // Delete patient by ID
    public void deletePatient(Long id) {
        System.out.println("Deleting patient with ID: " + id);
        Patient patient = patientRepository.findById(id)
                .orElseThrow(() -> new PatientNotFoundException("Cannot delete. No patient found with ID: " + id));
        patientRepository.delete(patient);
    }
    
    

}
