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

import com.hemanth.hospital.models.Patient;
import com.hemanth.hospital.models.Pharmacist;
import com.hemanth.hospital.models.User;
import com.hemanth.hospital.service.PharmacistService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/pharmacist")	
public class PharmacistController {
	
    @Autowired
    private PharmacistService pharmacistService;

    // Show login page
    @GetMapping("/login")
    public String showLoginPage(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies
        return "pharmacist-login";
    }

    // Handle login
  @PostMapping("/login")
  public String handleLogin(@RequestParam String username,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {
      Pharmacist pharmacist = pharmacistService.validatePharmacist(username, password);
      if (pharmacist != null) {
          session.setAttribute("loggedInPharmacist", pharmacist);
          return "redirect:/pharmacist/dashboard";
      }
      model.addAttribute("error", "Invalid username or password!");
      return "pharmacist-login";
  }

//Pharmacist Dashboard
@GetMapping("/dashboard")
public String showPharmacistDashboard(
       @RequestParam(name = "filter", required = false, defaultValue = "all") String filter,
       HttpSession session,
       Model model) {

   // Check session
   if (session.getAttribute("loggedInPharmacist") == null) {
       return "redirect:/pharmacist/login";
   }

   // Handle filter
   if ("today".equalsIgnoreCase(filter)) {
       model.addAttribute("patients", pharmacistService.getTodayPatients());
       model.addAttribute("filter", "today");
   } else {
       model.addAttribute("patients", pharmacistService.getAllPatients());
       model.addAttribute("filter", "all");
   }

   return "pharmacist-dashboard"; // JSP page
}




@PostMapping("/updateMedicineStatus")
public String updateMedicineStatus(@RequestParam Long patientId,
                                   @RequestParam String medicineStatus) {
    pharmacistService.updateMedicineStatus(patientId, medicineStatus);
    return "redirect:/pharmacist/dashboard?filter=today";
}








    // View All Pharmacists (Admin-like feature)
    @GetMapping("/viewAll")
    public String viewAllPharmacists(HttpSession session, Model model) {
        if (session.getAttribute("loggedInPharmacist") == null) {
            return "redirect:/pharmacist/login";
        }
        List<Pharmacist> pharmacists = pharmacistService.getAllPharmacists();
        model.addAttribute("pharmacists", pharmacists);
        return "view-pharmacists"; // view-pharmacists.jsp
    }

    // Show Add Pharmacist Form
    @GetMapping("/addForm")
    public String addPharmacistForm(HttpSession session) {
        if (session.getAttribute("loggedInPharmacist") == null) {
            return "redirect:/pharmacist/login";
        }
        return "add-pharmacist"; // add-pharmacist.jsp
    }

    // Handle Add Pharmacist
    @PostMapping("/add")
    public String addPharmacist(@ModelAttribute Pharmacist pharmacist, HttpSession session) {
        if (session.getAttribute("loggedInPharmacist") == null) {
            return "redirect:/pharmacist/login";
        }
        pharmacistService.addPharmacist(pharmacist);
        return "redirect:/pharmacist/viewAll";
    }

    // Edit Pharmacist
    @GetMapping("/edit")
    public String editPharmacist(@RequestParam Long id, Model model, HttpSession session) {
        if (session.getAttribute("loggedInPharmacist") == null) {
            return "redirect:/pharmacist/login";
        }
        Pharmacist pharmacist = pharmacistService.getPharmacistById(id);
        model.addAttribute("pharmacist", pharmacist);
        return "edit-pharmacist"; // edit-pharmacist.jsp
    }

    @PostMapping("/update")
    public String updatePharmacist(@ModelAttribute Pharmacist pharmacist, HttpSession session) {
        if (session.getAttribute("loggedInPharmacist") == null) {
            return "redirect:/pharmacist/login";
        }
        pharmacistService.updatePharmacist(pharmacist);
        return "redirect:/pharmacist/viewAll";
    }

    // Delete Pharmacist
    @GetMapping("/delete")
    public String deletePharmacist(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInPharmacist") == null) {
            return "redirect:/pharmacist/login";
        }
        pharmacistService.deletePharmacist(id);
        return "redirect:/pharmacist/viewAll";
    }

    @PostMapping("/logout")
    public String logout2(HttpSession session) {
        session.invalidate();
        return "redirect:/dashboard"; 
    }

}
