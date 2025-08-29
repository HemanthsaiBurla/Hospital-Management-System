package com.hemanth.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.hemanth.hospital.models.Nurse;
import com.hemanth.hospital.service.NurseService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/nurse")
public class NurseController {

    @Autowired
    private NurseService nurseService;

    // Show login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "nurse-login"; // nurse-login.jsp
    }

    // Handle login
    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              HttpSession session,
                              Model model) {
        Nurse nurse = nurseService.validateNurse(username, password);
        if (nurse != null) {
            session.setAttribute("loggedInNurse", nurse);
            return "redirect:/nurse/dashboard";
        }
        model.addAttribute("error", "Invalid username or password!");
        return "nurse-login";
    }

    // Dashboard
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session) {
        if (session.getAttribute("loggedInNurse") == null) {
            return "redirect:/nurse/login";
        }
        return "nurse-dashboard"; // nurse-dashboard.jsp
    }

    // View all nurses
    @GetMapping("/viewAll")
    public String viewAllNurses(HttpSession session, Model model) {
        if (session.getAttribute("loggedInNurse") == null) {
            return "redirect:/nurse/login";
        }
        List<Nurse> nurses = nurseService.getAllNurses();
        model.addAttribute("nurses", nurses);
        return "view-nurses"; // view-nurses.jsp
    }

    // Show Add Form
    @GetMapping("/addForm")
    public String addNurseForm(HttpSession session) {
        if (session.getAttribute("loggedInNurse") == null) {
            return "redirect:/nurse/login";
        }
        return "add-nurse"; // add-nurse.jsp
    }

    // Handle Add
    @PostMapping("/add")
    public String addNurse(@ModelAttribute Nurse nurse, HttpSession session) {
        if (session.getAttribute("loggedInNurse") == null) {
            return "redirect:/nurse/login";
        }
        nurseService.addNurse(nurse);
        return "redirect:/nurse/viewAll";
    }

    // Edit
    @GetMapping("/edit")
    public String editNurse(@RequestParam Long id, Model model, HttpSession session) {
        if (session.getAttribute("loggedInNurse") == null) {
            return "redirect:/nurse/login";
        }
        Nurse nurse = nurseService.getNurseById(id);
        model.addAttribute("nurse", nurse);
        return "edit-nurse"; // edit-nurse.jsp
    }

    @PostMapping("/update")
    public String updateNurse(@ModelAttribute Nurse nurse, HttpSession session) {
        if (session.getAttribute("loggedInNurse") == null) {
            return "redirect:/nurse/login";
        }
        nurseService.updateNurse(nurse);
        return "redirect:/nurse/viewAll";
    }

    // Delete
    @GetMapping("/delete")
    public String deleteNurse(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInNurse") == null) {
            return "redirect:/nurse/login";
        }
        nurseService.deleteNurse(id);
        return "redirect:/nurse/viewAll";
    }

    // Logout
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/"; // Redirect to home
    }
}
