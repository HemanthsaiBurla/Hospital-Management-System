<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare Plus - Hospital Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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

        /* Header */
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

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(44, 62, 80, 0.8), rgba(52, 152, 219, 0.8)),
                       linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4rem 0;
            text-align: center;
        }

        .hero-title {
            font-size: 3rem;
            margin-bottom: 1rem;
            font-weight: 700;
        }

        .highlight {
            color: #e74c3c;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero-subtitle {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        /* Role Selection Section */
        .role-selection {
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

        .role-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            margin-top: 2rem;
        }

        .role-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            border: 1px solid #e9ecef;
        }

        .role-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .role-card h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        .role-card p {
            margin-bottom: 1.5rem;
            color: #666;
        }

        .role-card a {
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

        .role-card a:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        /* Emergency Section */
        .emergency-contact {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            padding: 2rem 0;
            text-align: center;
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
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .emergency-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,255,255,0.3);
        }

        /* Footer */
        .footer {
            background: #2c3e50;
            color: white;
            padding: 2rem 0;
            text-align: center;
        }

        .footer p {
            color: #bdc3c7;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .role-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2rem;
            }
            
            .role-container {
                grid-template-columns: 1fr;
            }
            
            .section-title {
                font-size: 2rem;
            }
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
         .main-nav ul {
            display: flex;
            list-style: none;
            gap: 2rem;
            align-items: center;
        }
        
        .main-nav ul {
                flex-wrap: wrap;
                justify-content: center;
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
                        <li><a href="${pageContext.request.contextPath}/developerContact"><i class="fas fa-phone"></i> Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1 class="hero-title">
                Welcome to <span class="highlight">Hospital Management System</span>
            </h1>
            <p class="hero-subtitle">
                Advanced Healthcare Management - Select your role to continue
            </p>
        </div>
    </section>

    <!-- Role Selection Section -->
    <section class="role-selection">
        <div class="container">
            <h2 class="section-title">Access Portal</h2>
            <div class="role-container">
                <div class="role-card">
                    <h2>👨‍💼 Admin</h2>
                    <p>Manage hospital operations, user accounts, and system administration.</p>
                    <a href="${pageContext.request.contextPath}/admin/login">
                        <i class="fas fa-sign-in-alt"></i> Go to Login
                    </a>
                </div>
                
                <div class="role-card">
                    <h2>👨‍⚕️ Doctor</h2>
                    <p>Access patient records, appointments, and medical management tools.</p>
                    <a href="${pageContext.request.contextPath}/doctor/login">
                        <i class="fas fa-sign-in-alt"></i> Go to Login
                    </a>
                </div>
                
                <div class="role-card">
                    <h2>💊 Pharmacist</h2>
                    <p>Manage medicines, inventory, and pharmaceutical operations.</p>
                    <a href="${pageContext.request.contextPath}/pharmacist/login">
                        <i class="fas fa-sign-in-alt"></i> Go to Login
                    </a>
                </div>
                
                <div class="role-card">
                    <h2>👩‍💼 Receptionist</h2>
                    <p>Register patients, manage billing, and handle front desk operations.</p>
                    <a href="${pageContext.request.contextPath}/receptionist/login">
                        <i class="fas fa-sign-in-alt"></i> Go to Login
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Emergency Contact Section -->
    <section class="emergency-contact">
        <div class="container">
            <h2><i class="fas fa-ambulance"></i> Emergency Services</h2>
            <p>24/7 Emergency care available. For immediate medical assistance, contact our emergency hotline.</p>
            <a href="tel:+108" class="emergency-btn">
                <i class="fas fa-phone"></i> Emergency: 108
            </a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Hospital Management System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>