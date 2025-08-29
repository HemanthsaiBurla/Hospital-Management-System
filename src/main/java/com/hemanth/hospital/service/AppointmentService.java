package com.hemanth.hospital.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hemanth.hospital.models.Appointment;
import com.hemanth.hospital.repository.AppointmentRepository;

@Service
public class AppointmentService {

    @Autowired
    private AppointmentRepository appointmentRepository;

    // Get all appointments
    public List<Appointment> getAllAppointments() {
        return appointmentRepository.findAll();
    }

	    // Get today’s appointments
	    public List<Appointment> getTodaysAppointments() {
	        LocalDate today = LocalDate.now();
	        return appointmentRepository.findByAppointmentDate(today);
	    }

    // Add appointment (if receptionist wants to book)
    public Appointment addAppointment(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }

    // Delete appointment
    public void deleteAppointment(Long id) {
        appointmentRepository.deleteById(id);
    }

    // Update appointment
    public Appointment updateAppointment(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }

    // Get appointment by ID
    public Appointment getAppointmentById(Long id) {
        return appointmentRepository.findById(id).orElse(null);
    }

    public List<Appointment> getAllStaff() {
        return   appointmentRepository.findAll();
    }

	public List<Appointment> getAppointmentsByPatient(Long id) {
		// TODO Auto-generated method stub
		return appointmentRepository.findByPatientId(id);
	}

	public List<Appointment> getAppointmentsByPatientId(Long patientId) {
		// TODO Auto-generated method stub
		return appointmentRepository.findByPatientId(patientId);
	}

}
