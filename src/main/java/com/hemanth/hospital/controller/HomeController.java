package com.hemanth.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping({"home", "/home/"})

    public String home() {
        return "home";  // loads /WEB-INF/views/home.jsp
    }

    @GetMapping("dashboard")
    public String dashboard() {
        return "dashboard";  // loads /WEB-INF/views/dashboard.jsp
    }

    @GetMapping("aboutUs")
    public String aboutUs() {
        return "about-us";  
    }

    @GetMapping("developerContact")
    public String developerContact() {
        return "developer-contact";  
    }
    
    @GetMapping("onlinePatientAppointment")
    public String onlinePatientAppointment() {
        return "online-patient-appointment";  
    }
}
