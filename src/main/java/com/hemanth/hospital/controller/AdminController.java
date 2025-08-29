package com.hemanth.hospital.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hemanth.hospital.models.Appointment;
import com.hemanth.hospital.models.Doctor;
import com.hemanth.hospital.models.Nurse;
import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.models.Pharmacist;
import com.hemanth.hospital.models.Receptionist;
import com.hemanth.hospital.models.SupportStaff;
import com.hemanth.hospital.service.AdminService;
import com.hemanth.hospital.service.AppointmentService;
import com.hemanth.hospital.service.DoctorService;
import com.hemanth.hospital.service.NurseService;
import com.hemanth.hospital.service.PatientService;
import com.hemanth.hospital.service.PharmacistService;
import com.hemanth.hospital.service.ReceptionistService;
import com.hemanth.hospital.service.SupportStaffService;
import com.hemanth.hospital.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    
    @Autowired
    private DoctorService doctorService;

    @Autowired
    private UserService userService;
    
    @Autowired
    private PharmacistService pharmacistService;
    
    @Autowired
    private ReceptionistService receptionistService;
    
    @Autowired
    private PatientService patientService;
    
    @Autowired
    private NurseService nurseService;
    
    @Autowired
    private SupportStaffService supportStaffService;
    
    @Autowired
    private AppointmentService appointmentService;

    // Show login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "admin-login";
    }

    // Handle login
    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              Model model,
                              HttpSession session) {
        if (adminService.validateAdmin(username, password)) {
            session.setAttribute("loggedInAdmin", username);
            return "redirect:/admin/dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password!");
            return "admin-login";
        }
    }

    @GetMapping("/register")
    public String showAdminRegisterPage(HttpSession session) {
        // If admin is already logged in, redirect to dashboard
        if (session.getAttribute("loggedInAdmin") != null) {
            return "redirect:/admin/dashboard";
        }
        return "admin-register"; // Show register page
    }

    @PostMapping("/register")
    public String handleAdminRegister(@RequestParam String username,
                                      @RequestParam String password,
                                      Model model) {
        adminService.registerAdmin(username, password); // save as ADMIN
        model.addAttribute("success", "Admin registered successfully! Please log in.");
        return "admin-login"; // Redirect to login
    }
    
    
    
    
////////////////////////////////    
    // ADMIN DASHBOARD WITH ALL EMPS AND PATIENTS IN DASHBOARD
    
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }
     
        /////////////// View all members in a dashboard(doctors, recep,pharma,etc)
        List<Doctor> allDoctors = doctorService.getAllDoctors();
        List<Patient> allPatients = patientService.getAllPatients();
        List<Pharmacist> allPharmacists = pharmacistService.getAllPharmacists();
        List<Receptionist> allReceptionists = receptionistService.getAllReceptionists();
        List<Nurse> allNurses = nurseService.getAllNurses();
        List<SupportStaff> allStaff = supportStaffService.getAllStaff();
        List<Appointment> allAppointments = appointmentService.getAllStaff();

        // Set all the lists for tables
        model.addAttribute("doctors", allDoctors);
        model.addAttribute("patients", allPatients);
        model.addAttribute("pharmacists", allPharmacists);
        model.addAttribute("receptionists", allReceptionists);
        model.addAttribute("nurses", allNurses);
        model.addAttribute("staff", allStaff);
        model.addAttribute("appointments", allAppointments);

        /////////////// DASHBOARD STATISTICS ///////////////
        
        // Today's date for filtering
        LocalDate today = LocalDate.now();
        
        // Calculate today's appointments
        long todayAppointments = allAppointments.stream()
            .filter(appointment -> appointment.getAppointmentDate() != null && 
                    appointment.getAppointmentDate().equals(today))
            .count();
        
        // Calculate today's revenue (from patients who had appointments today)
        BigDecimal todayRevenue = allPatients.stream()
            .filter(patient -> {
                // Check if patient has appointment today
                return allAppointments.stream()
                    .anyMatch(appointment -> 
                        appointment.getPatientId() != null && 
                        appointment.getPatientId().equals(patient.getPatientId()) &&
                        appointment.getAppointmentDate() != null && 
                        appointment.getAppointmentDate().equals(today));
            })
            .map(patient -> patient.getBillAmount() != null ? patient.getBillAmount() : BigDecimal.ZERO)
            .reduce(BigDecimal.ZERO, BigDecimal::add);
        
        // Calculate total revenue
        BigDecimal totalRevenue = allPatients.stream()
            .map(patient -> patient.getBillAmount() != null ? patient.getBillAmount() : BigDecimal.ZERO)
            .reduce(BigDecimal.ZERO, BigDecimal::add);
        
        // Count totals
        int totalDoctors = allDoctors.size();
        int totalNurses = allNurses.size();
        int totalPharmacists = allPharmacists.size();
        int totalReceptionists = allReceptionists.size();
        int totalSupportStaff = allStaff.size();
        int totalPatients = allPatients.size();
        int totalAppointmentsCount = allAppointments.size();
        int totalStaff = totalDoctors + totalNurses + totalPharmacists + totalReceptionists + totalSupportStaff;

        // Add statistics to model
        model.addAttribute("todayAppointments", todayAppointments);
        model.addAttribute("todayRevenue", todayRevenue.toString());
        model.addAttribute("totalAppointments", totalAppointmentsCount);
        model.addAttribute("totalRevenue", totalRevenue.toString());
        model.addAttribute("totalPatients", totalPatients);
        model.addAttribute("totalStaff", totalStaff);
        
        // Individual staff counts
        model.addAttribute("totalDoctors", totalDoctors);
        model.addAttribute("totalNurses", totalNurses);
        model.addAttribute("totalPharmacists", totalPharmacists);
        model.addAttribute("totalReceptionists", totalReceptionists);
        model.addAttribute("totalSupportStaff", totalSupportStaff);

        return "admin-dashboard";
    }

    // Helper method to check if a date is today (keeping for future use if needed)
    private boolean isToday(LocalDate appointmentDate) {
        return appointmentDate != null && appointmentDate.equals(LocalDate.now());
    }

//////////////////////////////////

// LOGOUT ADMIN
    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login?logout=true";
    }
///////////////////////////////////

    
    // Show user registration page
    @GetMapping("/register-user")
    public String showUserRegisterPage(HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }
        return "admin-register"; 
    }

    // Handle new user registration
    @PostMapping("/register-user")
    public String handleUserRegister(@RequestParam String username,
                                     @RequestParam String password,
                                     @RequestParam String role,
                                     HttpSession session,
                                     Model model) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        userService.createUser(username, password, role);
        model.addAttribute("success", role + " registered successfully!");
        return "redirect:/admin/dashboard";
    }

   
    @GetMapping("/users")
    public String listAllUsers(Model model, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }
        model.addAttribute("users", userService.getAllUsers());
        return "users"; 
    }
    
    
    
/////////////////////////////////////    
/////    ADMIN can Manage DOCTORs
////     Add DOCTOR AND VIEW ALL DOCTORS
////     DELETE DOCTORS AND UPDATE DOCTORS
 
    @GetMapping("/manage")
    public String manageRole(@RequestParam String role, HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("role", role);

        switch (role.toUpperCase()) {   /////// GETTING ALL DOCTORS
            case "DOCTOR":
                model.addAttribute("users", doctorService.getAllDoctors());
                break;
            case "PHARMACIST":
                model.addAttribute("users", pharmacistService.getAllPharmacists());
                break;
            case "RECEPTIONIST":
                model.addAttribute("users", receptionistService.getAllReceptionists());
                break;
                
            case "NURSE":
                model.addAttribute("users", nurseService.getAllNurses());
                break;
            case "ADMIN":
              model.addAttribute("users", adminService.getAllUsers());
              break;
              
            case "SUPPORTSTAFF":
                model.addAttribute("users", supportStaffService.getAllStaff());
                break;
                
            case "APPOINTMENTS":
                model.addAttribute("users", appointmentService.getAllStaff());
                break;
        }

        return "manage-role";
    }


    @PostMapping("/addUser")
    public String addUser(@RequestParam String role,
                          @RequestParam(required = false) String username,
                          @RequestParam(required = false) String fullName,
                          @RequestParam(required = false) String password,
                          @RequestParam int age,
                          @RequestParam String gender,
                          @RequestParam String phoneNumber,
                          @RequestParam(required = false) String jobType,
                          @RequestParam(required = false) String specialist,
                          @RequestParam(required = false) String experience,
                          HttpSession session) {

        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        switch (role.toUpperCase()) {
            case "DOCTOR":
                Doctor doctor = Doctor.builder()
                        .username(username)
                        .password(password)
                        .age(age)
                        .gender(gender)
                        .phoneNumber(phoneNumber)
                        .specialist(specialist)
                        .experience(experience)
                        .role("DOCTOR")
                        .build();
                doctorService.addDoctor(doctor);
                break;

            case "PHARMACIST":
                Pharmacist pharmacist = new Pharmacist();
                pharmacist.setUsername(username);
                pharmacist.setPassword(password);
                pharmacist.setAge(age);
                pharmacist.setGender(gender);
                pharmacist.setExperience(experience);
                pharmacist.setPhoneNumber(phoneNumber);
                pharmacist.setJoinDate(LocalDateTime.now());
                pharmacistService.addPharmacist(pharmacist);
                break;

            case "RECEPTIONIST":
                Receptionist rec = new Receptionist();
                rec.setUsername(username);
                rec.setPassword(password);
                rec.setAge(age);
                rec.setGender(gender);
                rec.setExperience(experience);
                rec.setPhoneNumber(phoneNumber);
                rec.setJoinDate(LocalDateTime.now());
                receptionistService.addReceptionist(rec);
                break;

            case "NURSE":
                Nurse nurse = new Nurse();
                nurse.setUsername(username);
                nurse.setPassword(password);
                nurse.setAge(age);
                nurse.setGender(gender);
                nurse.setExperience(experience);
                nurse.setPhoneNumber(phoneNumber);
                nurse.setJoinDate(LocalDateTime.now());
                nurseService.addNurse(nurse);
                break;

            case "SUPPORTSTAFF":
                SupportStaff staff = new SupportStaff();
                staff.setFullName(fullName);
                staff.setAge(age);
                staff.setGender(gender);
                staff.setPhoneNumber(phoneNumber);
                staff.setJobType(jobType);
                staff.setJoinDate(LocalDateTime.now());
                supportStaffService.saveStaff(staff);
                break;
        }

        return "redirect:/admin/manage?role=" + role;
    }


    
    
    
    
    @PostMapping("/updateUser")
    public String updateUser(@RequestParam String role,
                             @RequestParam Long id,
                             @RequestParam(required = false) String username,
                             @RequestParam(required = false) String fullName,
                             @RequestParam(required = false) String password,
                             @RequestParam int age,
                             @RequestParam String gender,
                             @RequestParam String phoneNumber,
                             @RequestParam(required = false) String jobType,
                             @RequestParam(required = false) String specialist,
                             @RequestParam(required = false) String experience,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {

        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        try {
            switch (role.toUpperCase()) {
                case "DOCTOR":
                    Doctor updatedDoctor = Doctor.builder()
                            .doctorId(id)
                            .username(username)
                            .password(password)
                            .age(age)
                            .gender(gender)
                            .phoneNumber(phoneNumber)
                            .specialist(specialist)
                            .experience(experience)
                            .role("DOCTOR")
                            .build();
                    doctorService.updateDoctor(updatedDoctor);
                    break;

                case "PHARMACIST":
                    Pharmacist pharmacist = Pharmacist.builder()
                            .pharmacistId(id)
                            .username(username)
                            .password(password)
                            .age(age)
                            .gender(gender)
                            .experience(experience)
                            .phoneNumber(phoneNumber)
                            .joinDate(LocalDateTime.now())
                            .build();
                    pharmacistService.addPharmacist(pharmacist);
                    break;

                case "RECEPTIONIST":
                    Receptionist receptionist = Receptionist.builder()
                            .receptionistId(id)
                            .username(username)
                            .password(password)
                            .age(age)
                            .gender(gender)
                            .experience(experience)
                            .phoneNumber(phoneNumber)
                            .joinDate(LocalDateTime.now())
                            .build();
                    receptionistService.addReceptionist(receptionist);
                    break;

                case "NURSE":
                    Nurse nurse = Nurse.builder()
                            .nurseId(id)
                            .username(username)
                            .password(password)
                            .age(age)
                            .gender(gender)
                            .experience(experience)
                            .phoneNumber(phoneNumber)
                            .joinDate(LocalDateTime.now())
                            .build();
                    nurseService.addNurse(nurse);
                    break;

                case "SUPPORTSTAFF":
                    SupportStaff staff = SupportStaff.builder()
                            .staffId(id)
                            .fullName(fullName)
                            .age(age)
                            .gender(gender)
                            .phoneNumber(phoneNumber)
                            .jobType(jobType)
                            .joinDate(LocalDateTime.now())
                            .build();
                    supportStaffService.saveStaff(staff);
                    break;
            }

            redirectAttributes.addFlashAttribute("updateStatus", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("updateStatus", "failure");
        }

        return "redirect:/admin/manage?role=" + role;
    }


    
    
    
    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam String role,
                             @RequestParam Long id,
                             HttpSession session) {

        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        switch (role.toUpperCase()) {
            case "DOCTOR":
                doctorService.deleteDoctor(id);
                break;
            case "PHARMACIST":
                pharmacistService.deletePharmacist(id);  // <-- deleting the phamist form table via admin/mange-role(pharm,doc,recep)
                break;
            case "RECEPTIONIST":
                receptionistService.deleteReceptionist(id);  // <-- UNCOMMENT
                break;
                
            case "NURSE":
                nurseService.deleteNurse(id);  // <-- UNCOMMENT
                break;
                
            case "SUPPORTSTAFF":
            	supportStaffService.deleteStaff(id);  // <-- UNCOMMENT
                break;
        }

        return "redirect:/admin/manage?role=" + role;
    }


    
    

    
}