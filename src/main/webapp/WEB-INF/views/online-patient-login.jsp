<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login - Hospital Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 400px;
            width: 100%;
        }

        .login-header {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            text-align: center;
            padding: 2rem;
        }

        .login-header i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: white;
        }

        .login-header h2 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .login-header p {
            opacity: 0.9;
            font-size: 0.9rem;
        }

        .login-form {
            padding: 2rem;
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

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #e74c3c;
            box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.1);
        }

        .login-btn {
            width: 100%;
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        /* Alert Messages */
        .alert {
            padding: 12px 15px;
            border-radius: 8px;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert i {
            font-size: 1.2rem;
        }

        .login-footer {
            text-align: center;
            padding: 0 2rem 2rem;
        }

        .register-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #e74c3c;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 1rem;
            padding: 8px 16px;
            border: 2px solid #e74c3c;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        .register-link:hover {
            background: #e74c3c;
            color: white;
            transform: translateY(-2px);
        }

        .home-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #666;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .home-link:hover {
            color: #e74c3c;
        }

        .back-home {
            position: absolute;
            top: 20px;
            left: 20px;
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 10px 15px;
            border-radius: 50px;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .back-home:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
        }

        .footer-divider {
            width: 50px;
            height: 1px;
            background: #e9ecef;
            margin: 1rem auto;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .login-container {
                margin: 10px;
            }
            
            .login-header {
                padding: 1.5rem;
            }
            
            .login-form {
                padding: 1.5rem;
            }

            .back-home {
                position: relative;
                top: auto;
                left: auto;
                margin-bottom: 20px;
                display: inline-flex;
            }
        }
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/home" class="back-home">
        <i class="fas fa-arrow-left"></i> Back to Home
    </a>

    <div class="login-container">
        <div class="login-header">
            <i class="fas fa-user-injured"></i>
            <h2>Patient Login</h2>
            <p>Hospital Management System</p>
        </div>

        <div class="login-form">
            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    <span>${success}</span>
                </div>
            </c:if>

            <form action="/patients/login" method="post" autocomplete="off">
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <div class="input-wrapper">
                        <i class="fas fa-phone"></i>
                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" 
                               placeholder="Enter your phone number" required autocomplete="off">
                    </div>
                </div>

                <div class="form-group">
                    <label for="aadharCardNo">Aadhar Card Number</label>
                    <div class="input-wrapper">
                        <i class="fas fa-id-card"></i>
                        <input type="text" id="aadharCardNo" name="aadharCardNo" class="form-control" 
                               placeholder="Enter your Aadhar card number" required autocomplete="off">
                    </div>
                </div>

                <button type="submit" class="login-btn">
                    <i class="fas fa-sign-in-alt"></i> Login to Patient Portal
                </button>
            </form>
        </div>

        <div class="login-footer">
            <a href="register-page" class="register-link">
                <i class="fas fa-user-plus"></i> New Patient? Register here
            </a>
            
            <div class="footer-divider"></div>
            
            <a href="${pageContext.request.contextPath}/home" class="home-link">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>