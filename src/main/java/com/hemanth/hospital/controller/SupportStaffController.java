package com.hemanth.hospital.controller;

import com.hemanth.hospital.models.SupportStaff;
import com.hemanth.hospital.service.SupportStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/support-staff")
public class SupportStaffController {

    @Autowired
    private SupportStaffService supportStaffService;

    @GetMapping
    public String listStaff(Model model) {
        model.addAttribute("staffList", supportStaffService.getAllStaff());
        return "support-staff-list"; // JSP page
    }

    @GetMapping("/add")
    public String addStaffForm(Model model) {
        model.addAttribute("staff", new SupportStaff());
        return "support-staff-form";
    }

    @PostMapping("/save")
    public String saveStaff(@ModelAttribute SupportStaff staff) {
        supportStaffService.saveStaff(staff);
        return "redirect:/support-staff";
    }

    @GetMapping("/edit/{id}")
    public String editStaff(@PathVariable Long id, Model model) {
        model.addAttribute("staff", supportStaffService.getStaffById(id));
        return "support-staff-form";
    }

    @GetMapping("/delete/{id}")
    public String deleteStaff(@PathVariable Long id) {
        supportStaffService.deleteStaff(id);
        return "redirect:/support-staff";
    }
}
