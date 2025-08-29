package com.hemanth.hospital.controller;

import com.hemanth.hospital.models.Appointment;
import com.hemanth.hospital.service.AppointmentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/appointments")
public class AppointmentController {

    private final AppointmentService service;

    public AppointmentController(AppointmentService service) {
        this.service = service;
    }

    // Show booking form
    @GetMapping("/book/{patientId}")
    public String bookAppointmentPage(@PathVariable Long patientId, Model model) {
        model.addAttribute("patientId", patientId);
        return "patient-appointment";
    }

    // Save appointment
    @PostMapping("/save")
    public String saveAppointment(@RequestParam Long patientId,
                                  @RequestParam String department,
                                  @RequestParam String consultationType,
                                  @RequestParam String appointmentDate) {

        Appointment appointment = new Appointment();
        appointment.setPatientId(patientId);
        appointment.setDepartment(department);
        appointment.setConsultationType(consultationType);
        appointment.setAppointmentDate(LocalDate.parse(appointmentDate));
        appointment.setStatus("Booked");  // default when new booking

        service.addAppointment(appointment);

        return "redirect:/patients/dashboard/" + patientId;
    }
}
