<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Login - Hospital Management System</title>
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
            background: linear-gradient(135deg, #27ae60, #2ecc71);
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
            border-color: #27ae60;
            box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.1);
        }

        .login-btn {
            width: 100%;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 1rem;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.4);
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

        .alert i {
            font-size: 1.2rem;
        }

        .login-footer {
            text-align: center;
            padding: 0 2rem 2rem;
        }

        .dashboard-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #666;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .dashboard-link:hover {
            color: #27ae60;
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
        }
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/home" class="back-home">
        <i class="fas fa-arrow-left"></i> Back to Home
    </a>

    <div class="login-container">
        <div class="login-header">
            <i class="fas fa-user-md"></i>
            <h2>Doctor Login</h2>
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

            <form action="${pageContext.request.contextPath}/doctor/login" method="post" autocomplete="off">
                <input type="hidden" name="role" value="DOCTOR">

                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-wrapper">
                        <i class="fas fa-user"></i>
                        <input type="text" id="username" name="username" class="form-control" 
                               placeholder="Enter your username" required autocomplete="off">
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" class="form-control" 
                               placeholder="Enter your password" required autocomplete="new-password">
                    </div>
                </div>

                <button type="submit" class="login-btn">
                    <i class="fas fa-sign-in-alt"></i> Login to Doctor Portal
                </button>
            </form>
        </div>

        <div class="login-footer">
            <a href="${pageContext.request.contextPath}/dashboard" class="dashboard-link">
                <i class="fas fa-tachometer-alt"></i> Go to Dashboard
            </a>
        </div>
    </div>
</body>
</html>