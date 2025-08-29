<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare Plus - Hospital Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        /* HMS Common Stylesheet - Professional Hospital Management System */
        
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            font-size: 16px;
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Typography */
        h1, h2, h3, h4, h5, h6 {
            font-weight: 600;
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        h1 { font-size: 2.5rem; }
        h2 { font-size: 2rem; }
        h3 { font-size: 1.5rem; }

        p {
            margin-bottom: 1rem;
            color: #666;
        }

        /* Header Styles */
        .header {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.8rem;
            font-weight: 700;
        }

        .logo i {
            font-size: 2rem;
            color: #e74c3c;
        }

        .logo-text {
            color: white;
        }

        .main-nav ul {
            display: flex;
            list-style: none;
            gap: 2rem;
            align-items: center;
        }

        .main-nav a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .main-nav a:hover {
            background: rgba(255,255,255,0.1);
            transform: translateY(-2px);
        }

        .login-btn {
            background: #e74c3c !important;
            color: white !important;
        }

        .login-btn:hover {
            background: #c0392b !important;
            transform: translateY(-2px);
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(44, 62, 80, 0.8), rgba(52, 152, 219, 0.8)), 
                        linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            background-size: cover;
            background-position: center;
            color: white;
            padding: 4rem 0;
            text-align: center;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
        }

        .hero-title {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            font-weight: 700;
        }

        .highlight {
            color: #e74c3c;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero-subtitle {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .hero-stats {
            display: flex;
            justify-content: center;
            gap: 3rem;
            margin: 3rem 0;
        }

        .stat-item {
            text-align: center;
        }

        .stat-item i {
            font-size: 3rem;
            color: #e74c3c;
            margin-bottom: 0.5rem;
        }

        .stat-number {
            display: block;
            font-size: 2.5rem;
            font-weight: 700;
            color: white;
        }

        .stat-label {
            font-size: 1rem;
            opacity: 0.8;
        }

        .hero-actions {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        /* Button Styles */
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 1rem 2rem;
            border: none;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn-primary {
            background: #e74c3c;
            color: white;
        }

        .btn-primary:hover {
            background: #c0392b;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-secondary:hover {
            background: white;
            color: #2c3e50;
            transform: translateY(-3px);
        }

        /* Quick Access Section */
        .quick-access {
            padding: 4rem 0;
            background: white;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2.5rem;
            color: #2c3e50;
            position: relative;
        }

        .section-title::after {
            content: '';
            display: block;
            width: 80px;
            height: 4px;
            background: #e74c3c;
            margin: 1rem auto;
            border-radius: 2px;
        }

        .access-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .access-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            border: 1px solid #e9ecef;
        }

        .access-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .access-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #3498db, #e74c3c);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
        }

        .access-icon i {
            font-size: 2rem;
            color: white;
        }

        .access-card h3 {
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        .access-card p {
            margin-bottom: 1.5rem;
            color: #666;
        }

        .card-btn {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .card-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        /* Services Section */
        .services {
            padding: 4rem 0;
            background: #f8f9fa;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .service-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .service-image {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .service-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .service-card:hover .service-image img {
            transform: scale(1.1);
        }

        .service-overlay {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            background: rgba(231, 76, 60, 0.9);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .service-overlay i {
            color: white;
            font-size: 1.5rem;
        }

        .service-content {
            padding: 2rem;
        }

        .service-content h3 {
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        .service-content p {
            margin-bottom: 1.5rem;
            color: #666;
        }

        .service-features {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .feature-tag {
            background: #e8f4fd;
            color: #2c3e50;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Emergency Contact Section */
        .emergency-contact {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            padding: 3rem 0;
        }

        .emergency-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 2rem;
        }

        .emergency-info h2 {
            color: white;
            margin-bottom: 1rem;
        }

        .emergency-info h2 i {
            margin-right: 1rem;
        }

        .emergency-btn {
            background: white;
            color: #e74c3c;
            padding: 1rem 2rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .emergency-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,255,255,0.3);
        }

        /* Footer */
        .footer {
            background: #2c3e50;
            color: white;
            padding: 3rem 0 1rem;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .footer-logo i {
            font-size: 1.8rem;
            color: #e74c3c;
        }

        .footer-section h4 {
            color: white;
            margin-bottom: 1rem;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.5rem;
        }

        .footer-section a {
            color: #bdc3c7;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section a:hover {
            color: white;
        }

        .contact-info p {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 0.5rem;
            color: #bdc3c7;
        }

        .contact-info i {
            width: 20px;
            color: #e74c3c;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid #34495e;
            color: #bdc3c7;
        }

        /* Form Styles (for login/registration pages) */
        .form-container {
            max-width: 500px;
            margin: 2rem auto;
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #3498db;
        }

        .form-btn {
            width: 100%;
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            padding: 0.75rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        /* Alert/Message Styles */
        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-info {
            background: #cce7ff;
            color: #004085;
            border: 1px solid #b3d7ff;
        }

        /* Table Styles (for data display) */
        .table-container {
            overflow-x: auto;
            margin: 2rem 0;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
        }

        .table th {
            background: #f8f9fa;
            font-weight: 600;
            color: #2c3e50;
        }

        .table tbody tr:hover {
            background: #f8f9fa;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
            
            .main-nav ul {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-stats {
                flex-direction: column;
                gap: 1.5rem;
            }
            
            .hero-actions {
                flex-direction: column;
                align-items: center;
            }
            
            .emergency-content {
                flex-direction: column;
                text-align: center;
            }
            
            .access-grid,
            .services-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 15px;
            }
            
            .hero-title {
                font-size: 2rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <i class="fas fa-hospital-alt"></i>
                    <span class="logo-text">MediCare Plus</span>
                </div>
                <nav class="main-nav">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/aboutUs"><i class="fas fa-info-circle"></i> About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-stethoscope"></i> Services</a></li>
                        <li><a href="${pageContext.request.contextPath}/developerContact"><i class="fas fa-phone"></i>Developer Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/dashboard" class="login-btn"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">
                    Welcome to <span class="highlight">MediCare Plus</span>
                </h1>
                <p class="hero-subtitle">
                    Advanced Hospital Management System - Providing Excellence in Healthcare
                </p>
                <div class="hero-stats">
                    <div class="stat-item">
                        <i class="fas fa-user-md"></i>
                        <span class="stat-number">150+</span>
                        <span class="stat-label">Expert Doctors</span>
                    </div>
                    <div class="stat-item">
                        <i class="fas fa-bed"></i>
                        <span class="stat-number">500+</span>
                        <span class="stat-label">Hospital Beds</span>
                    </div>
                    <div class="stat-item">
                        <i class="fas fa-ambulance"></i>
                        <span class="stat-number">24/7</span>
                        <span class="stat-label">Emergency Care</span>
                    </div>
                </div>
                <div class="hero-actions">
                    <a href="${pageContext.request.contextPath}/patients/login" class="btn btn-primary">
                        <i class="fas fa-calendar-check"></i> Book Appointment
                    </a>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
                        <i class="fas fa-exclamation-triangle"></i> Emergency
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Access Section -->
    <section class="quick-access">
        <div class="container">
            <h2 class="section-title">Quick Access Portal</h2>
            <div class="access-grid">
                <div class="access-card">
                    <div class="access-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <h3>Patient Portal(Appointment)</h3>
                    <p>Book appointments, view medical records, and manage your healthcare online.</p>
                    <a href="${pageContext.request.contextPath}/patients/login" class="card-btn">
                        Access Portal <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
                
                <div class="access-card">
                    <div class="access-icon">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3>Doctor Login</h3>
                    <p>Access patient records, manage schedules, and update treatment plans.</p>
                    <a href="${pageContext.request.contextPath}/doctor/login" class="card-btn">
                        Doctor Portal <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
                
                <div class="access-card">
                    <div class="access-icon">
                   <i class="fas fa-bell-concierge"></i>    
                    </div>
                    <h3>Receptionist Login</h3>
                    <p>Manage patient registrations, appointments, and front desk operations.</p>
                    <a href="${pageContext.request.contextPath}/receptionist/login" class="card-btn">
                        Receptionist Portal <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
                
                <div class="access-card">
                    <div class="access-icon">
                        <i class="fas fa-pills"></i>
                    </div>
                    <h3>Pharmacist Login</h3>
                    <p>Manage prescriptions, medicine inventory, and pharmacy operations.</p>
                    <a href="${pageContext.request.contextPath}/pharmacist/login" class="card-btn">
                        Pharmacist Portal <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
                
                <div class="access-card">
                    <div class="access-icon">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <h3>Admin Panel</h3>
                    <p>System administration, user management, and hospital operations.</p>
                    <a href="${pageContext.request.contextPath}/admin/login" class="card-btn">
                        Admin Panel <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section -->
    <section class="services">
        <div class="container">
            <h2 class="section-title">Our Healthcare Services</h2>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-image">
                        <img src="${pageContext.request.contextPath}/images/doctors_Home.jpg" alt="Expert Doctors">
                        <div class="service-overlay">
                            <i class="fas fa-user-md"></i>
                        </div>
                    </div>
                    <div class="service-content">
                        <h3>Expert Medical Team</h3>
                        <p>Our highly qualified doctors and specialists provide comprehensive medical care with years of experience and expertise in various medical fields.</p>
                        <div class="service-features">
                            <span class="feature-tag">Specialized Care</span>
                            <span class="feature-tag">24/7 Available</span>
                        </div>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-image">
                        <img src="${pageContext.request.contextPath}/images/nurse_Home.png" alt="Professional Nursing">
                        <div class="service-overlay">
                            <i class="fas fa-user-nurse"></i>
                        </div>
                    </div>
                    <div class="service-content">
                        <h3>Professional Nursing Care</h3>
                        <p>Our dedicated nursing staff provides compassionate patient care, ensuring comfort and proper medical attention around the clock.</p>
                        <div class="service-features">
                            <span class="feature-tag">Compassionate Care</span>
                            <span class="feature-tag">Expert Staff</span>
                        </div>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-image">
                        <img src="${pageContext.request.contextPath}/images/medicine_Home.jpg" alt="Pharmacy Services">
                        <div class="service-overlay">
                            <i class="fas fa-pills"></i>
                        </div>
                    </div>
                    <div class="service-content">
                        <h3>Advanced Pharmacy</h3>
                        <p>Complete pharmaceutical services with a wide range of medicines, proper storage, and expert consultation for medication management.</p>
                        <div class="service-features">
                            <span class="feature-tag">Quality Medicines</span>
                            <span class="feature-tag">Expert Guidance</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Emergency Contact Section -->
    <section class="emergency-contact">
        <div class="container">
            <div class="emergency-content">
                <div class="emergency-info">
                    <h2><i class="fas fa-ambulance"></i> Emergency Services</h2>
				<p style="color:black;">24/7 Emergency care available. For immediate medical assistance, contact our emergency hotline.</p>
                </div>
                <div class="emergency-number">
                    <a href="tel:108" class="emergency-btn">
                        <i class="fas fa-phone"></i> Call Emergency: 108
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <div class="footer-logo">
                        <i class="fas fa-hospital-alt"></i>
                        <span>MediCare Plus</span>
                    </div>
                    <p>Providing excellence in healthcare with advanced technology and compassionate care for all patients.</p>
                </div>
                
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/aboutUs">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/home">Services</a></li>
                        <li><a href="${pageContext.request.contextPath}/developerContact">Developer Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/home">Careers</a></li>
                    </ul>
                </div>
                
                <div class="footer-section">
                    <h4>Contact Info</h4>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt"></i> 123 Healthcare Ave, Medical City</p>
                        <p><i class="fas fa-phone"></i> +91 123 456 7890</p>
                        <p><i class="fas fa-envelope"></i> info@medicareplus.com</p>
                    </div>
                </div>
                
                <div class="footer-section">
                    <h4>Developer</h4>
                    <p><a href="${pageContext.request.contextPath}/developerContact">Contact Developer</a></p>
                    <p>Hospital Management System v2.0</p>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2024 MediCare Plus Hospital Management System. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>