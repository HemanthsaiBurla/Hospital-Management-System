package com.hemanth.hospital.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.models.Pharmacist;
import com.hemanth.hospital.repository.PatientRepository;
import com.hemanth.hospital.repository.PharmacistRepository;
import com.hemanth.hospital.repository.UserRepository;

@Service
public class PharmacistService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PharmacistRepository pharmacistRepository;
    
    @Autowired
    private PatientRepository patientRepository;

    // Validate pharmacist login
    public Pharmacist validatePharmacist(String username, String password) {
        return pharmacistRepository.findByUsernameAndPassword(username, password)
                .orElse(null);
    }


    // Get all pharmacists
    public List<Pharmacist> getAllPharmacists() {
        return pharmacistRepository.findAll();
    }

    // Add a new pharmacist
    public Pharmacist addPharmacist(Pharmacist pharmacist) {
        pharmacist.setJoinDate(LocalDateTime.now());
        return pharmacistRepository.save(pharmacist);
    }

    // Delete pharmacist by ID
    public void deletePharmacist(Long id) {
        pharmacistRepository.deleteById(id);
    }

    // Get pharmacist by ID
    public Pharmacist getPharmacistById(Long id) {
        return pharmacistRepository.findById(id).orElse(null);
    }

    // Update pharmacist details
    public void updatePharmacist(Pharmacist pharmacist) {
        pharmacistRepository.save(pharmacist);
    }


	public List<Patient> getAllPatients() {
        return patientRepository.findAll();
	}


	
	public List<Patient> getTodayPatients() {
	    LocalDate today = LocalDate.now();
	    return patientRepository.findByVisitDate(today);
	}

	// Update medicine status
    public void updateMedicineStatus(Long patientId, String status) {
        Patient patient = patientRepository.findById(patientId).orElseThrow();
        patient.setMedicineStatus(status);
        patientRepository.save(patient);
    }

	
}
