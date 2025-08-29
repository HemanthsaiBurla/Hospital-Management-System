package com.hemanth.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;  // Correct import
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hemanth.hospital.models.Appointment;
import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.service.AppointmentService;
import com.hemanth.hospital.service.DoctorService;
import com.hemanth.hospital.service.PatientService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/patients")
public class PatientController {

    @Autowired
    private PatientService patientService;

    @Autowired
    private DoctorService doctorService;
    
    @Autowired
    private AppointmentService  appointmentService;
    

 // Show login page
    @GetMapping("/login")
    public String showLoginPage(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies
        return "online-patient-login";
    }

 // Handle login
    @PostMapping("/login")
    public String loginPatient(@RequestParam String phoneNumber, 
                               @RequestParam String aadharCardNo, 
                               Model model) {

        Patient patient = patientService.loginPatient(phoneNumber, aadharCardNo);

        if (patient != null) {
            // fetch appointments for this patient
            List<Appointment> appointments = appointmentService.getAppointmentsByPatientId(patient.getPatientId());

            model.addAttribute("patient", patient);
            model.addAttribute("appointments", appointments);

            return "patient-dashboard";  // loads JSP with old + new appointments
        } else {
            model.addAttribute("error", "Invalid Phone Number or Aadhaar Card Number");
            System.out.println("error login");
            return "online-patient-login";
        }
    }

    
    
   
    
    
    
    
    
    
    
    
    @GetMapping("/dashboard/{id}")
    public String patientDashboard(@PathVariable Long id, Model model) {
        Patient patient = patientService.getPatientById(id);
        List<Appointment> appointments = appointmentService.getAppointmentsByPatient(id);

        model.addAttribute("patient", patient);
        model.addAttribute("appointments", appointments);

        return "patient-dashboard";
    }

    // Show registration page
    @GetMapping("/register-page")
    public String showRegisterPage() {
        return "online-patient-register"; // JSP page name
    }

    // Handle registration
    @PostMapping("/register")
    public String registerPatient(@ModelAttribute Patient patient, Model model) {
        // Check if patient already exists by Phone + Aadhaar
        Patient existing = patientService.loginPatient(patient.getPhoneNumber(), patient.getAadharCardNo());

        if (existing != null) {
            // ❌ Already exists → stay on register page with message
            model.addAttribute("error", "Try with another details, Patient already exists with this Phone & Aadhaar!");
            return "online-patient-register";
        }

        // ✅ New patient → save and redirect to login
        patientService.addPatient(patient);
        model.addAttribute("success", "Registration successful! Please login now.");
        return "online-patient-login"; 
    }
    
    
   
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/patients/login";
    }

}
