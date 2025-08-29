package com.hemanth.hospital.service;

import com.hemanth.hospital.models.SupportStaff;
import com.hemanth.hospital.repository.SupportStaffRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupportStaffService {

    @Autowired
    private SupportStaffRepository supportStaffRepository;

    public List<SupportStaff> getAllStaff() {
        return supportStaffRepository.findAll();
    }

    public SupportStaff saveStaff(SupportStaff staff) {
        return supportStaffRepository.save(staff);
    }

    public SupportStaff getStaffById(Long id) {
        return supportStaffRepository.findById(id).orElse(null);
    }

    public void deleteStaff(Long id) {
        supportStaffRepository.deleteById(id);
    }
}
