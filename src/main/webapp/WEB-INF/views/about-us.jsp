<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - MediCare Plus Hospital</title>
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

        /* Page Header */
        .page-header {
            background: linear-gradient(rgba(44, 62, 80, 0.9), rgba(52, 152, 219, 0.9));
            color: white;
            padding: 3rem 0;
            text-align: center;
        }

        .page-title {
            font-size: 3rem;
            margin-bottom: 0.5rem;
        }

        .page-subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        /* Back Button */
        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
            background: #e74c3c;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }

        .back-button:hover {
            background: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(231, 76, 60, 0.4);
        }

        .back-button a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Content Sections */
        .content-section {
            padding: 3rem 0;
            background: white;
            margin: 2rem 0;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .section-title {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.2rem;
            color: #2c3e50;
            position: relative;
        }

        .section-title::after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background: #e74c3c;
            margin: 1rem auto;
            border-radius: 2px;
        }

        .content-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .info-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 3px 15px rgba(0,0,0,0.06);
            border-left: 4px solid #e74c3c;
            transition: transform 0.3s ease;
        }

        .info-card:hover {
            transform: translateY(-5px);
        }

        .info-card h3 {
            color: #2c3e50;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-card i {
            color: #e74c3c;
            font-size: 1.3rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin: 2rem 0;
        }

        .stat-card {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            padding: 2rem;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(52, 152, 219, 0.3);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            font-size: 1rem;
            opacity: 0.9;
        }

        .stat-icon {
            font-size: 2rem;
            margin-bottom: 1rem;
            opacity: 0.8;
        }

        /* Mission/Vision Cards */
        .mission-vision {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
            margin: 2rem 0;
        }

        .mission-card, .vision-card {
            padding: 2rem;
            border-radius: 15px;
            text-align: center;
        }

        .mission-card {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
        }

        .vision-card {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
        }

        .mission-card h3, .vision-card h3 {
            color: white;
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }

        .mission-card i, .vision-card i {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.9;
        }

        /* Contact Info */
        .contact-info {
            background: #f8f9fa;
            padding: 2rem;
            border-radius: 12px;
            margin: 2rem 0;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .contact-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .page-title {
                font-size: 2rem;
            }
            
            .content-grid,
            .mission-vision {
                grid-template-columns: 1fr;
            }
            
            .back-button {
                position: static;
                margin: 1rem;
                display: inline-block;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 15px;
            }
            
            .section-title {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <!-- Back Button -->
    <button class="back-button">
        <a href="${pageContext.request.contextPath}/home">
            <i class="fas fa-arrow-left"></i> Go Back
        </a>
    </button>

    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <i class="fas fa-hospital-alt"></i>
                    <span class="logo-text">MediCare Plus</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1 class="page-title">About MediCare Plus</h1>
            <p class="page-subtitle">Your Trusted Healthcare Partner Since 2010</p>
        </div>
    </section>

    <!-- Hospital Statistics -->
    <section class="content-section">
        <div class="container">
            <h2 class="section-title">Our Impact in Numbers</h2>
            <div class="stats-grid">
                <div class="stat-card">
                    <i class="fas fa-user-md stat-icon"></i>
                    <div class="stat-number">150+</div>
                    <div class="stat-label">Expert Doctors</div>
                </div>
                <div class="stat-card">
                    <i class="fas fa-bed stat-icon"></i>
                    <div class="stat-number">500+</div>
                    <div class="stat-label">Hospital Beds</div>
                </div>
                <div class="stat-card">
                    <i class="fas fa-users stat-icon"></i>
                    <div class="stat-number">50,000+</div>
                    <div class="stat-label">Patients Served</div>
                </div>
                <div class="stat-card">
                    <i class="fas fa-award stat-icon"></i>
                    <div class="stat-number">15+</div>
                    <div class="stat-label">Years of Service</div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Hospital -->
    <section class="content-section">
        <div class="container">
            <h2 class="section-title">About Our Hospital</h2>
            <div class="content-grid">
                <div class="info-card">
                    <h3><i class="fas fa-hospital"></i> Our Story</h3>
                    <p>MediCare Plus was established in 2010 with a vision to provide world-class healthcare services to our community. Over the years, we have grown to become one of the most trusted healthcare institutions in the region.</p>
                </div>
                <div class="info-card">
                    <h3><i class="fas fa-stethoscope"></i> Our Services</h3>
                    <p>We offer comprehensive medical services including emergency care, surgery, cardiology, pediatrics, orthopedics, and specialized treatments with state-of-the-art medical equipment and technology.</p>
                </div>
                <div class="info-card">
                    <h3><i class="fas fa-user-friends"></i> Our Team</h3>
                    <p>Our dedicated team of highly qualified doctors, nurses, and support staff work tirelessly to ensure every patient receives personalized care and attention with compassion and professionalism.</p>
                </div>
                <div class="info-card">
                    <h3><i class="fas fa-microscope"></i> Advanced Technology</h3>
                    <p>We utilize cutting-edge medical technology and equipment to provide accurate diagnoses and effective treatments, ensuring the best possible outcomes for our patients.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission & Vision -->
    <section class="content-section">
        <div class="container">
            <h2 class="section-title">Our Mission & Vision</h2>
            <div class="mission-vision">
                <div class="mission-card">
                    <i class="fas fa-heart"></i>
                    <h3>Our Mission</h3>
                    <p>To provide exceptional healthcare services with compassion, integrity, and excellence while advancing medical knowledge and improving community health outcomes through innovative care delivery.</p>
                </div>
                <div class="vision-card">
                    <i class="fas fa-eye"></i>
                    <h3>Our Vision</h3>
                    <p>To be the leading healthcare provider in the region, recognized for our commitment to patient care, medical excellence, and community service while setting new standards in healthcare delivery.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Information -->
    <section class="content-section">
        <div class="container">
            <h2 class="section-title">Get in Touch</h2>
            <div class="contact-info">
                <div class="contact-grid">
                    <div class="contact-item">
                        <div class="contact-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div>
                            <h4>Address</h4>
                            <p>123 Healthcare Avenue<br>Medical City, State 12345</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div>
                            <h4>Phone</h4>
                            <p>General: +91 123 456 7890<br>Emergency: +91 123 456 7891</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h4>Email</h4>
                            <p>info@medicareplus.com<br>emergency@medicareplus.com</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div>
                            <h4>Hours</h4>
                            <p>24/7 Emergency Services<br>OPD: 8:00 AM - 6:00 PM</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>