package com.hemanth.hospital.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.models.Nurse;
import com.hemanth.hospital.repository.NurseRepository;

@Service
public class NurseService {

    @Autowired
    private NurseRepository nurseRepository;

    // Validate nurse login
    public Nurse validateNurse(String username, String password) {
        return nurseRepository.findByUsernameAndPassword(username, password)
                .orElse(null);
    }

    // Get all nurses
    public List<Nurse> getAllNurses() {
        return nurseRepository.findAll();
    }

    // Add a new nurse
    public Nurse addNurse(Nurse nurse) {
        nurse.setJoinDate(LocalDateTime.now());
        return nurseRepository.save(nurse);
    }

    // Delete nurse by ID
    public void deleteNurse(Long id) {
        nurseRepository.deleteById(id);
    }

    // Get nurse by ID
    public Nurse getNurseById(Long id) {
        return nurseRepository.findById(id).orElse(null);
    }

    // Update nurse details
    public void updateNurse(Nurse nurse) {
        nurseRepository.save(nurse);
    }
}
