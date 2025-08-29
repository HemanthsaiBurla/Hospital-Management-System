<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration - Hospital Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        
        body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url('https://www.transparenttextures.com/patterns/white-wall-3.png'), 
                linear-gradient(to right, #dfe9f3, #ffffff);
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
    color: #333;
    line-height: 1.6;
    padding: 20px;
    
     display: flex;
            align-items: center;
            justify-content: center;
}
        
        
        

        

        .registration-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 600px;
            width: 100%;
            max-height: 90vh;
            overflow-y: auto;
        }

        .registration-header {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            text-align: center;
            padding: 2rem;
        }

        .registration-header i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: white;
        }

        .registration-header h2 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .registration-header p {
            opacity: 0.9;
            font-size: 0.9rem;
        }

        .registration-form {
            padding: 2rem;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 500;
            font-size: 0.95rem;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 15px;
            top: 15px;
            color: #666;
            z-index: 2;
        }

        .form-control,
        .form-select,
        .form-textarea {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
            font-family: inherit;
        }

        .form-textarea {
            min-height: 100px;
            resize: vertical;
            padding-top: 15px;
        }

        .form-control:focus,
        .form-select:focus,
        .form-textarea:focus {
            outline: none;
            border-color: #27ae60;
            box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.1);
        }

        .form-select {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6,9 12,15 18,9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
            padding-right: 40px;
        }

        .gender-options {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            margin-top: 0.5rem;
        }

        .gender-option {
            position: relative;
        }

        .gender-radio {
            display: none;
        }

        .gender-label {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            font-size: 0.9rem;
            font-weight: 500;
            background: white;
        }

        .gender-radio:checked + .gender-label {
            border-color: #27ae60;
            background: #27ae60;
            color: white;
        }

        .register-btn {
            width: 100%;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 1rem;
        }

        .register-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(39, 174, 96, 0.4);
        }

        .register-btn:active {
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

        .registration-footer {
            text-align: center;
            padding: 0 2rem 2rem;
        }

        .login-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #27ae60;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            padding: 8px 16px;
            border: 2px solid #27ae60;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        .login-link:hover {
            background: #27ae60;
            color: white;
            transform: translateY(-2px);
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

        .form-info {
            background: #e8f5e8;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-info i {
            color: #27ae60;
            font-size: 1.2rem;
        }

        .form-info p {
            margin: 0;
            font-size: 0.9rem;
            color: #2c3e50;
        }

        /* Input validation styles */
        .form-control:invalid,
        .form-select:invalid {
            border-color: #e74c3c;
        }

        .form-control:valid,
        .form-select:valid {
            border-color: #27ae60;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .registration-container {
                margin: 10px;
                max-height: 95vh;
            }
            
            .registration-header {
                padding: 1.5rem;
            }
            
            .registration-form {
                padding: 1.5rem;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .gender-options {
                grid-template-columns: 1fr;
            }

            .back-home {
                position: relative;
                top: auto;
                left: auto;
                margin-bottom: 20px;
                display: inline-flex;
            }
        }

        @media (max-width: 480px) {
            .gender-options {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/home" class="back-home">
        <i class="fas fa-arrow-left"></i> Back to Home
    </a>

    <div class="registration-container">
        <div class="registration-header">
            <i class="fas fa-user-plus"></i>
            <h2>Patient Registration</h2>
            <p>Join our hospital management system</p>
        </div>

        <div class="registration-form">
            <div class="form-info">
                <i class="fas fa-info-circle"></i>
                <p>Please fill in all required fields to complete your registration.</p>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <form action="register" method="post" autocomplete="off">
                <div class="form-row">
                    <div class="form-group">
                        <label for="name">Full Name *</label>
                        <div class="input-wrapper">
                            <i class="fas fa-user"></i>
                            <input type="text" id="name" name="name" class="form-control" 
                                   placeholder="Enter your full name" required autocomplete="off">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="age">Age *</label>
                        <div class="input-wrapper">
                            <i class="fas fa-birthday-cake"></i>
                            <input type="number" id="age" name="age" class="form-control" 
                                   placeholder="Enter your age" min="1" max="120" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Gender *</label>
                    <div class="gender-options">
                        <div class="gender-option">
                            <input type="radio" id="male" name="gender" value="Male" class="gender-radio" required>
                            <label for="male" class="gender-label">
                                <i class="fas fa-mars"></i>
                                Male
                            </label>
                        </div>
                        <div class="gender-option">
                            <input type="radio" id="female" name="gender" value="Female" class="gender-radio" required>
                            <label for="female" class="gender-label">
                                <i class="fas fa-venus"></i>
                                Female
                            </label>
                        </div>
                        <div class="gender-option">
                            <input type="radio" id="other" name="gender" value="Other" class="gender-radio" required>
                            <label for="other" class="gender-label">
                                <i class="fas fa-genderless"></i>
                                Other
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number *</label>
                        <div class="input-wrapper">
                            <i class="fas fa-phone"></i>
                            <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" 
                                   placeholder="Enter phone number" required pattern="[0-9]{10}" 
                                   title="Please enter a 10-digit phone number">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="aadharCardNo">Aadhar Card Number *</label>
                        <div class="input-wrapper">
                            <i class="fas fa-id-card"></i>
                            <input type="text" id="aadharCardNo" name="aadharCardNo" class="form-control" 
                                   placeholder="Enter 12-digit Aadhar number" required maxlength="12" 
                                   pattern="[0-9]{12}" title="Please enter a 12-digit Aadhar number">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <div class="input-wrapper">
                        <i class="fas fa-map-marker-alt"></i>
                        <textarea id="address" name="address" class="form-textarea" 
                                  placeholder="Enter your complete address (optional)"></textarea>
                    </div>
                </div>

                <button type="submit" class="register-btn">
                    <i class="fas fa-user-check"></i>
                    Register Patient
                </button>
            </form>
        </div>

        <div class="registration-footer">
            <a href="/patients/login" class="login-link">
                <i class="fas fa-sign-in-alt"></i> Already have an account? Login
            </a>
        </div>
    </div>

    <script>
        // Phone number formatting
        document.getElementById('phoneNumber').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 10) value = value.slice(0, 10);
            e.target.value = value;
        });

        // Aadhar number formatting
        document.getElementById('aadharCardNo').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 12) value = value.slice(0, 12);
            e.target.value = value;
        });

        // Form validation feedback
        document.querySelectorAll('input[required]').forEach(input => {
            input.addEventListener('blur', function() {
                if (this.validity.valid) {
                    this.style.borderColor = '#27ae60';
                } else {
                    this.style.borderColor = '#e74c3c';
                }
            });
        });
    </script>
</body>
</html>