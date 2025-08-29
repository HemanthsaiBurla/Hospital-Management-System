<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment - Hospital Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #3498db 0%, #2c3e50 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .booking-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 500px;
            width: 100%;
        }

        .booking-header {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            text-align: center;
            padding: 2rem;
        }

        .booking-header i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: white;
        }

        .booking-header h2 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .booking-header p {
            opacity: 0.9;
            font-size: 0.9rem;
        }

        .booking-form {
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
            font-size: 0.95rem;
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
            z-index: 2;
        }

        .form-control,
        .form-select {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
        }

        .form-control:focus,
        .form-select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .form-select {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6,9 12,15 18,9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
        }

        .department-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 10px;
            margin-top: 0.5rem;
        }

        .department-option {
            position: relative;
        }

        .department-radio {
            display: none;
        }

        .department-label {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px 10px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .department-label i {
            font-size: 1.5rem;
            margin-bottom: 5px;
            color: #666;
        }

        .department-radio:checked + .department-label {
            border-color: #3498db;
            background: #f8f9fa;
            color: #3498db;
        }

        .department-radio:checked + .department-label i {
            color: #3498db;
        }

        .consultation-options {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: 0.5rem;
        }

        .consultation-option {
            position: relative;
        }

        .consultation-radio {
            display: none;
        }

        .consultation-label {
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
        }

        .consultation-radio:checked + .consultation-label {
            border-color: #3498db;
            background: #3498db;
            color: white;
        }

        .book-btn {
            width: 100%;
            background: linear-gradient(135deg, #3498db, #2c3e50);
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

        .book-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.4);
        }

        .book-btn:active {
            transform: translateY(0);
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
            background: #e8f4f8;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-info i {
            color: #3498db;
            font-size: 1.2rem;
        }

        .form-info p {
            margin: 0;
            font-size: 0.9rem;
            color: #2c3e50;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .booking-container {
                margin: 10px;
            }
            
            .booking-header {
                padding: 1.5rem;
            }
            
            .booking-form {
                padding: 1.5rem;
            }

            .department-grid {
                grid-template-columns: 1fr;
            }

            .consultation-options {
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
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/home" class="back-home">
        <i class="fas fa-arrow-left"></i> Back to Home
    </a>

    <div class="booking-container">
        <div class="booking-header">
            <i class="fas fa-calendar-plus"></i>
            <h2>Book Appointment</h2>
            <p>Schedule your consultation with our specialists</p>
        </div>

        <div class="booking-form">
            <div class="form-info">
                <i class="fas fa-info-circle"></i>
                <p>Please select your preferred department, consultation type, and appointment date.</p>
            </div>

            <form action="${pageContext.request.contextPath}/appointments/save" method="post">
                <input type="hidden" name="patientId" value="${patientId}" />

                <div class="form-group">
                    <label>Select Department</label>
                    <div class="department-grid">
                        <div class="department-option">
                            <input type="radio" id="ent" name="department" value="ENT" class="department-radio" checked>
                            <label for="ent" class="department-label">
                                <i class="fas fa-ear-listen"></i>
                                ENT
                            </label>
                        </div>
                        <div class="department-option">
                            <input type="radio" id="eye" name="department" value="Eye" class="department-radio">
                            <label for="eye" class="department-label">
                                <i class="fas fa-eye"></i>
                                Eye
                            </label>
                        </div>
                        <div class="department-option">
                            <input type="radio" id="general" name="department" value="General" class="department-radio">
                            <label for="general" class="department-label">
                                <i class="fas fa-stethoscope"></i>
                                General
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Consultation Type</label>
                    <div class="consultation-options">
                        <div class="consultation-option">
                            <input type="radio" id="new" name="consultationType" value="New" class="consultation-radio" checked>
                            <label for="new" class="consultation-label">
                                <i class="fas fa-plus-circle"></i>
                                New
                            </label>
                        </div>
                        <div class="consultation-option">
                            <input type="radio" id="followup" name="consultationType" value="Follow-up" class="consultation-radio">
                            <label for="followup" class="consultation-label">
                                <i class="fas fa-redo-alt"></i>
                                Follow-up
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="appointmentDate">Appointment Date</label>
                    <div class="input-wrapper">
                        <i class="fas fa-calendar-alt"></i>
                        <input type="date" id="appointmentDate" name="appointmentDate" class="form-control" required>
                    </div>
                </div>

                <button type="submit" class="book-btn">
                    <i class="fas fa-calendar-check"></i>
                    Book Appointment
                </button>
            </form>
        </div>
    </div>

    <script>
        // Set minimum date to today
        document.addEventListener('DOMContentLoaded', function() {
            const dateInput = document.getElementById('appointmentDate');
            const today = new Date().toISOString().split('T')[0];
            dateInput.setAttribute('min', today);
        });
    </script>
</body>
</html>