package com.hemanth.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.models.Receptionist;
import com.hemanth.hospital.service.AppointmentService;
import com.hemanth.hospital.service.ReceptionistService;

import org.springframework.ui.Model;   // ✅ Correct Spring Model
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/receptionist")
public class ReceptionistController {

    @Autowired
    private ReceptionistService receptionistService;
    
    @Autowired
    private AppointmentService appointmentService;

    // Show login page
    @GetMapping("/login")
    public String showLoginPage(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        return "receptionist-login";
    }

    // Handle login
    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              HttpSession session,
                              Model model) {
        Receptionist receptionist = receptionistService.validateReceptionist(username, password);
        if (receptionist != null) {
            session.setAttribute("loggedInReceptionist", receptionist);
            return "redirect:/receptionist/dashboard";
        }
        model.addAttribute("error", "Invalid username or password!");
        return "receptionist-login";
    }

    // Receptionist Dashboard
    @GetMapping("/dashboard")
    public String showDashboard(@RequestParam(name = "filter", required = false, defaultValue = "today") String filter,
                                HttpSession session,
                                Model model) {
        if (session.getAttribute("loggedInReceptionist") == null) {
            return "redirect:/receptionist/login";
        }

        if ("today".equalsIgnoreCase(filter)) {
            model.addAttribute("appointments", appointmentService.getTodaysAppointments());
            model.addAttribute("filter", "today");
        } else {
            model.addAttribute("appointments", appointmentService.getAllAppointments());
            model.addAttribute("filter", "all");
        }

        return "receptionist-dashboard";
    }
    
    @GetMapping("/viewPatients")
    public String viewPatients(HttpSession session, Model model) {
        if (session.getAttribute("loggedInReceptionist") == null) {
            return "redirect:/receptionist/login";
        }
        List<Patient> patients = receptionistService.getAllPatients();
        model.addAttribute("patients", patients);
        return "view-Patients";  // reuse doctor’s JSP page
    }

 // Show Add Patient Form
    @GetMapping("/addPatientForm")
    public String addPatientForm(HttpSession session) {
        if (session.getAttribute("loggedInReceptionist") == null) {
            return "redirect:/receptionist/login";
        }
        return "add-Patient"; // add-Patient.jsp
    }
    
 // Handle Add Patient Submission
    @PostMapping("/addPatient")
    public String addPatient(@ModelAttribute Patient patient, HttpSession session) {
        if (session.getAttribute("loggedInReceptionist") == null) {
            return "redirect:/receptionist/login";
        }
        receptionistService.addPatient(patient);
        return "redirect:/receptionist/viewPatients";
    }
    
 // Edit Patient
    @GetMapping("/editPatient")
    public String editPatient(@RequestParam Long id, Model model, HttpSession session) {
        if (session.getAttribute("loggedInReceptionist") == null) {
            return "redirect:/receptionist/login";
        }
        Patient patient = receptionistService.getPatientById(id);
        model.addAttribute("patient", patient);
        return "edit-patient"; // edit-patient.jsp
    }
    
 // ✅ Update Patient (Receptionist)
    @PostMapping("/updatePatient")
    public String updatePatient(
            @ModelAttribute Patient updatedPatient,
            HttpSession session) {

        if (session.getAttribute("loggedInReceptionist") == null) {
            return "redirect:/receptionist/login";
        }

        // Fetch existing patient from DB
        Patient existingPatient = receptionistService.getPatientById(updatedPatient.getPatientId());

        if (existingPatient == null) {
            return "redirect:/receptionist/viewPatients"; // or error page
        }

        // Receptionist can only update basic info (not medical details)
        existingPatient.setName(updatedPatient.getName());
        existingPatient.setAmountBalence(updatedPatient.getAmountBalence());
        existingPatient.setAmountPaid(updatedPatient.getAmountPaid());
        existingPatient.setAge(updatedPatient.getAge());
        existingPatient.setGender(updatedPatient.getGender());
        existingPatient.setPhoneNumber(updatedPatient.getPhoneNumber());
        existingPatient.setAddress(updatedPatient.getAddress());
        existingPatient.setAadharCardNo(updatedPatient.getAadharCardNo());
        existingPatient.setBillAmount(updatedPatient.getBillAmount()); // receptionist handles billing

        // ✅ Save updated patient
        receptionistService.updatePatient(existingPatient);

        return "redirect:/receptionist/viewPatients";
    }


    // ✅ Delete Patient (Receptionist)
    @GetMapping("/deletePatient")
    public String deletePatient(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInReceptionist") == null) {
            return "redirect:/receptionist/login";
        }
        receptionistService.deletePatient(id);
        return "redirect:/receptionist/viewPatients";
    }

    // ✅ Logout (GET)
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/dashboard"; // Redirect to main dashboard
    }

    // ✅ Logout (POST) - after receptionist logs in
    @PostMapping("/logout")
    public String logout2(HttpSession session) {
        session.invalidate();
        return "redirect:/dashboard"; 
    }
    
}
