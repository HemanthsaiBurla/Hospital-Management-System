<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer Contact - MediCare Plus HMS</title>
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

        /* Page Title Section */
        .page-title {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 3rem 0;
            text-align: center;
        }

        .page-title h1 {
            color: white;
            font-size: 3rem;
            margin-bottom: 0.5rem;
        }

        .page-title p {
            font-size: 1.2rem;
            opacity: 0.9;
            color: black;
            
        }

        /* Developer Profile Section */
        .developer-profile {
            padding: 4rem 0;
            background: white;
        }

        .profile-container {
            max-width: 900px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 3rem;
            align-items: start;
        }

        .profile-image {
            text-align: center;
        }

        .profile-avatar {
            width: 250px;
            height: 250px;
            background: linear-gradient(135deg, #3498db, #e74c3c);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .profile-avatar i {
            font-size: 6rem;
            color: white;
        }

        .profile-name {
            font-size: 1.8rem;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .profile-title {
            font-size: 1.2rem;
            color: #3498db;
            font-weight: 600;
        }

        .profile-info {
            background: #f8f9fa;
            padding: 2rem;
            border-radius: 15px;
        }

        .about-section h3 {
            color: #2c3e50;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .about-text {
            color: #666;
            line-height: 1.8;
            margin-bottom: 2rem;
        }

        /* Skills Section */
        .skills-section {
            margin-top: 2rem;
        }

        .skill-category {
            margin-bottom: 1.5rem;
        }

        .skill-category h4 {
            color: #2c3e50;
            margin-bottom: 0.5rem;
            font-size: 1rem;
        }

        .skill-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }

        .skill-tag {
            background: #e8f4fd;
            color: #2c3e50;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Contact Information Section */
        .contact-info {
            padding: 4rem 0;
            background: #f8f9fa;
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

        .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            max-width: 800px;
            margin: 0 auto;
        }

        .contact-card {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            text-align: center;
            transition: all 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .contact-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #3498db, #e74c3c);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
        }

        .contact-icon i {
            font-size: 2rem;
            color: white;
        }

        .contact-card h3 {
            margin-bottom: 0.5rem;
            color: #2c3e50;
        }

        .contact-card p {
            color: #666;
            margin-bottom: 1rem;
        }

        .contact-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .contact-link:hover {
            color: #e74c3c;
        }

        /* Social Media Links */
        .social-links {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        .social-link {
            width: 50px;
            height: 50px;
            background: #2c3e50;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 1.2rem;
        }

        .social-link:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .social-link.linkedin:hover { background: #0077b5; }
        .social-link.github:hover { background: #333; }
        .social-link.instagram:hover { background: #e4405f; }
        .social-link.youtube:hover { background: #ff0000; }

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
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
            
            .main-nav ul {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .page-title h1 {
                font-size: 2rem;
            }
            
            .profile-container {
                grid-template-columns: 1fr;
                text-align: center;
            }
            
            .profile-avatar {
                width: 200px;
                height: 200px;
            }
            
            .contact-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 15px;
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
                        <li><a href="${pageContext.request.contextPath}/developerContact"><i class="fas fa-phone"></i> Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Page Title Section -->
    <section class="page-title">
        <div class="container">
            <h1><i class="fas fa-user-tie"></i> Developer Contact</h1>
            <p>Meet the developer behind MediCare Plus Hospital Management System</p>
        </div>
    </section>

    <!-- Developer Profile Section -->
    <section class="developer-profile">
        <div class="container">
            <div class="profile-container">
                <div class="profile-image">
                    <div class="profile-avatar">
   <img src="${pageContext.request.contextPath}/images/Profile.jpg" 
     alt="Profile img" 
     style="width:250px; height:250px;">
                    </div>
                    <h2 class="profile-name">Hemanthsai Burla</h2>
                    <h4 class="profile-name">Full Stack Developer</h4>
                    <p class="profile-title">Java & Python Specialist</p>
                </div>
                
                <div class="profile-info">
                    <div class="about-section">
                        <h3><i class="fas fa-user"></i> About Me</h3>
                        <p class="about-text">
                            Java Full Stack Developer skilled in Core Java, Spring Boot, JSP, Servlets, Python, and SQL. 
                            Hands-on experience in building real-world projects including a hospital management system and web-based banking application and 
                            Android calculator app. Proficient in Data Structures & Algorithms (DSA), REST APIs, and front-end 
                            fundamentals. Strong coding mindset and actively contribute on GitHub and YouTube.
                        </p>
                    </div>

                    <div class="skills-section">
                        <h3><i class="fas fa-code"></i> Technical Skills</h3>
                        
                        <div class="skill-category">
                            <h4>Programming Languages & Frameworks</h4>
                            <div class="skill-tags">
                                <span class="skill-tag">Java</span>
                                <span class="skill-tag">Python</span>
                                <span class="skill-tag">Spring Boot</span>
                                <span class="skill-tag">JDBC</span>
                                <span class="skill-tag">Hibernate</span>
                                <span class="skill-tag">Servlets</span>
                                <span class="skill-tag">JSP</span>
                                <span class="skill-tag">SQL</span>
                                <span class="skill-tag">HTML</span>
                                <span class="skill-tag">CSS</span>
                                <span class="skill-tag">JavaScript</span>
                            </div>
                        </div>

                        <div class="skill-category">
                            <h4>Data Structures & Algorithms</h4>
                            <div class="skill-tags">
                                <span class="skill-tag">Arrays</span>
                                <span class="skill-tag">Linked List</span>
                                <span class="skill-tag">Stack</span>
                                <span class="skill-tag">Trees</span>
                                <span class="skill-tag">Quick Sort</span>
                                <span class="skill-tag">Merge Sort</span>
                                <span class="skill-tag">Searching</span>
                                <span class="skill-tag">Recursion</span>
                                <span class="skill-tag">Java Collections</span>
                            </div>
                        </div>

                        <div class="skill-category">
                            <h4>Databases & Tools</h4>
                            <div class="skill-tags">
                                <span class="skill-tag">MySQL</span>
                                <span class="skill-tag">PostgreSQL</span>
                                <span class="skill-tag">Eclipse EE</span>
                                <span class="skill-tag">VS Code</span>
                                <span class="skill-tag">GitHub</span>
                                <span class="skill-tag">Android Studio</span>
                                <span class="skill-tag">Postman</span>
                                <span class="skill-tag">Tomcat Server</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Information Section -->
    <section class="contact-info">
        <div class="container">
            <h2 class="section-title">Contact Information</h2>
            <div class="contact-grid">
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h3>Email</h3>
                    <p>Professional communication</p>
                    <a href="mailto:hemanthsaiburla@gmail.com" class="contact-link">
                        <i class="fas fa-paper-plane"></i> hemanthsaiburla@gmail.com
                    </a>
                </div>

                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-phone"></i>
                    </div>
                    <h3>Phone</h3>
                    <p>Direct contact for urgent queries</p>
                    <a href="tel:+919876543210" class="contact-link">
                        <i class="fas fa-phone-alt"></i> +91 824738 7557
                    </a>
                </div>

                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fab fa-linkedin"></i>
                    </div>
                    <h3>LinkedIn</h3>
                    <p>Professional networking</p>
                    <a href="https://www.linkedin.com/in/hemanthsaiburla/" target="_blank" class="contact-link">
                        <i class="fab fa-linkedin"></i> Connect on LinkedIn
                    </a>
                </div>

                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fab fa-github"></i>
                    </div>
                    <h3>GitHub</h3>
                    <p>View projects and code repositories</p>
                    <a href="https://github.com/HemanthsaiBurla" target="_blank" class="contact-link">
                        <i class="fab fa-github"></i> View GitHub Profile
                    </a>
                </div>

                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-globe"></i>
                    </div>
                    <h3>Portfolio</h3>
                    <p>Explore my complete work portfolio</p>
                    <a href="https://hemanthsaiburla.netlify.app/" target="_blank" class="contact-link">
                        <i class="fas fa-external-link-alt"></i> Visit Portfolio
                    </a>
                </div>

                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fab fa-instagram"></i>
                    </div>
                    <h3>Instagram</h3>
                    <p>Follow for tech updates and insights</p>
                    <a href="https://www.instagram.com/iamhemanthsai" target="_blank" class="contact-link">
                        <i class="fab fa-instagram"></i> Follow on Instagram
                    </a>
                </div>
            </div>

            <!-- Social Media Links -->
            <div class="social-links">
                <a href="https://www.linkedin.com/in/hemanthsaiburla/" target="_blank" class="social-link linkedin">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="https://github.com/HemanthsaiBurla" target="_blank" class="social-link github">
                    <i class="fab fa-github"></i>
                </a>
                <a href="https://www.instagram.com/iamhemanthsai" target="_blank" class="social-link instagram">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="https://www.youtube.com/@Techchintuintelugu" target="_blank" class="social-link youtube">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 MediCare Plus Hospital Management System. Developed with ❤️ by Full Stack Developer</p>
        </div>
    </footer>
</body>
</html>