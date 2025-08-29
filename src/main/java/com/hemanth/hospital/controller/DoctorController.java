 package com.hemanth.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hemanth.hospital.models.Doctor;
import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.service.AppointmentService;
import com.hemanth.hospital.service.DoctorService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;
    
    @Autowired
    private AppointmentService appointmentService;
    
    

    // Show login page
    @GetMapping("/login")
    public String showLoginPage(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies
        return "doctor-login";
    }


    // Handle login
    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              HttpSession session,
                              Model model) {
        Doctor doctor = doctorService.validateDoctor(username, password);
        if (doctor != null) {
            session.setAttribute("loggedInDoctor", doctor);
            return "redirect:/doctor/dashboard";
        }
        model.addAttribute("error", "Invalid username or password!");
        return "doctor-login";
    }

    // Doctor Dashboard (only buttons)
    @GetMapping("/dashboard")
    public String showDoctorDashboard(
            @RequestParam(name = "filter", required = false, defaultValue = "all") String filter,
            HttpSession session,
            Model model) {
   
//      model.addAttribute("appointments", appointmentService.getTodaysAppointments());
    	
    	
        if (session.getAttribute("loggedInDoctor") == null) {
            return "redirect:/doctor/login";
        }

        if ("today".equalsIgnoreCase(filter)) {
            model.addAttribute("appointments", appointmentService.getTodaysAppointments());
            model.addAttribute("filter", "today");
        } else {
            model.addAttribute("appointments", appointmentService.getAllAppointments());
            model.addAttribute("filter", "all");
        }

        return "doctor-dashboard"; 
    }


    // View Patients
    @GetMapping("/viewPatients")
    public String viewPatients(HttpSession session, Model model) {
        if (session.getAttribute("loggedInDoctor") == null) {
            return "redirect:/doctor/login";
        }
        List<Patient> patients = doctorService.getAllPatients();
        model.addAttribute("patients", patients);
        return "view-Patients"; // view-Patients.jsp
    }

    // Show Add Patient Form
    @GetMapping("/addPatientForm")
    public String addPatientForm(HttpSession session) {
        if (session.getAttribute("loggedInDoctor") == null) {
            return "redirect:/doctor/login";
        }
        return "add-Patient"; // add-Patient.jsp
    }

    // Handle Add Patient Submission
    @PostMapping("/addPatient")
    public String addPatient(@ModelAttribute Patient patient, HttpSession session) {
        if (session.getAttribute("loggedInDoctor") == null) {
            return "redirect:/doctor/login";
        }
        doctorService.addPatient(patient);
        return "redirect:/doctor/viewPatients";
    }

    // Edit Patient
    @GetMapping("/editPatient")
    public String editPatient(@RequestParam Long id, Model model, HttpSession session) {
        if (session.getAttribute("loggedInDoctor") == null) {
            return "redirect:/doctor/login";
        }
        Patient patient = doctorService.getPatientById(id);
        model.addAttribute("patient", patient);
        return "edit-patient"; // edit-patient.jsp
    }

    @PostMapping("/updatePatient")
    public String updatePatient(
            @RequestParam Long patientId,
            @RequestParam(value = "medicines", required = false) String[] medicines,
            @ModelAttribute Patient updatedPatient,
            HttpSession session) {

        if (session.getAttribute("loggedInDoctor") == null) {
            return "redirect:/doctor/login";
        }

        // Fetch existing patient from DB
        Patient existingPatient = doctorService.getPatientById(patientId);

        if (existingPatient == null) {
            return "redirect:/doctor/viewPatients"; // or show error page
        }

        // Only update doctor-editable fields
        
        existingPatient.setName(updatedPatient.getName());
        existingPatient.setAmountBalence(updatedPatient.getAmountBalence());
        existingPatient.setAmountPaid(updatedPatient.getAmountPaid());

        existingPatient.setAge(updatedPatient.getAge());
        existingPatient.setGender(updatedPatient.getGender());
        existingPatient.setPhoneNumber(updatedPatient.getPhoneNumber());
        existingPatient.setAddress(updatedPatient.getAddress());
        existingPatient.setAadharCardNo(updatedPatient.getAadharCardNo());

        existingPatient.setMedicalHistory(updatedPatient.getMedicalHistory());
        existingPatient.setRecommendations(updatedPatient.getRecommendations());
        existingPatient.setInstructions(updatedPatient.getInstructions());
        existingPatient.setDepartment(updatedPatient.getDepartment());
        existingPatient.setRemarks(updatedPatient.getRemarks());
        existingPatient.setBillAmount(updatedPatient.getBillAmount()); // receptionist and doc handles billing


        if (medicines != null) {
            existingPatient.setMedicines(String.join(", ", medicines));
        }

        // Save updated patient
        doctorService.updatePatient(existingPatient);

        return "redirect:/doctor/viewPatients";
    }


    // Delete Patient
    @GetMapping("/deletePatient")
    public String deletePatient(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInDoctor") == null) {
            return "redirect:/doctor/login";
        }
        doctorService.deletePatient(id);
        return "redirect:/doctor/viewPatients";
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/dashboard"; // Redirect to dashboard after logout
    }
    
    
    @PostMapping("/logout")   ///////its for after login doctor in the dashboard(doctor) 
                              ///for logout and go to dashboard
    public String logout2(HttpSession session) {
        session.invalidate();
        return "redirect:/dashboard"; // Redirect to dashboard after logout
    }
}



