package com.hemanth.hospital.controller;

import com.hemanth.hospital.models.Medicine;
import com.hemanth.hospital.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/pharmacist/medicines")
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

    @GetMapping
    public String listMedicines(Model model) {
        model.addAttribute("medicines", medicineService.getAllMedicines());
        return "medicines"; // JSP page
    }

    @GetMapping("/add")
    public String addMedicineForm(Model model) {
        model.addAttribute("medicine", new Medicine());
        return "add-medicine"; // JSP page
    }

    @PostMapping("/add")
    public String addMedicine(@ModelAttribute Medicine medicine) {
//        medicine.setJoinDate(LocalDateTime.now());
        medicineService.addMedicine(medicine);
        return "redirect:/pharmacist/medicines";
    }

    @GetMapping("/edit/{id}")
    public String editMedicineForm(@PathVariable Long id, Model model) {
        Medicine medicine = medicineService.getMedicineById(id);
        model.addAttribute("medicine", medicine);
        return "edit-medicine"; // JSP page
    }

    @PostMapping("/edit")
    public String editMedicine(@ModelAttribute Medicine medicine) {
        medicineService.updateMedicine(medicine);
        return "redirect:/pharmacist/medicines";
    }

    @GetMapping("/delete/{id}")
    public String deleteMedicine(@PathVariable Long id) {
        medicineService.deleteMedicine(id);
        return "redirect:/pharmacist/medicines";
    }
}
