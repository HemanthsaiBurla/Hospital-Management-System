package com.hemanth.hospital.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(new NoCacheInterceptor())
	            .addPathPatterns(
	                "/admin/**", 
	                "/doctor/**", 
	                "/pharmacist/**", 
	                "/receptionist/**",
	                "/patient/**"
	            )
	            .excludePathPatterns(
	                // Public pages
	                "/home", 
	                "/about", 
	                "/contact", 

	                // Login & logout pages
	                "/admin/login", 
	                "/admin/logout", 
	                "/doctor/login", 
	                "/doctor/logout",
	                "/pharmacist/login", 
	                "/pharmacist/logout", 
	                "/receptionist/login",
	                "/receptionist/logout",
	                
	                "/patients/login", 
	                "/patients/logout",

	                // Static resources
	                "/css/**",
	                "/js/**",
	                "/images/**"
	            );
	}

}
