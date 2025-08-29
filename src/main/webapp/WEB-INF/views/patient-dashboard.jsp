<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard - Hospital Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7f5fb;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        .dashboard-header {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .welcome-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-text h1 {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
        }

        .welcome-text p {
            opacity: 0.9;
            font-size: 1.1rem;
        }

        .logout-btn {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .logout-btn:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
        }

        /* Dashboard Grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        /* Patient Info Card */
        .patient-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            height: fit-content;
        }

        .patient-header {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .patient-avatar {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 2rem;
            color: white;
        }

        .patient-name {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .patient-id {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .patient-details {
            list-style: none;
        }

        .patient-details li {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #f8f9fa;
        }

        .patient-details li:last-child {
            border-bottom: none;
        }

        .patient-details i {
            width: 20px;
            color: #e74c3c;
            margin-right: 12px;
        }

        .patient-details .label {
            font-weight: 500;
            color: #2c3e50;
            min-width: 60px;
        }

        .patient-details .value {
            color: #555;
            margin-left: auto;
        }

        /* Appointments Section */
        .appointments-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .section-title {
            font-size: 1.5rem;
            color: #2c3e50;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .appointments-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }

        .appointments-table th {
            background: #34495e;
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            border-radius: 8px 8px 0 0;
        }

        .appointments-table th:first-child {
            border-radius: 8px 0 0 0;
        }

        .appointments-table th:last-child {
            border-radius: 0 8px 0 0;
        }

        .appointments-table td {
            padding: 15px 12px;
            border-bottom: 1px solid #e9ecef;
        }

        .appointments-table tbody tr:hover {
            background: #f8f9fa;
        }

        .appointments-table tbody tr:last-child td {
            border-bottom: none;
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            text-transform: uppercase;
        }

        .status-pending {
            background: #fff3cd;
            color: #856404;
        }

        .status-confirmed {
            background: #d4edda;
            color: #155724;
        }

        .status-cancelled {
            background: #f8d7da;
            color: #721c24;
        }

        .status-completed {
            background: #d1ecf1;
            color: #0c5460;
        }

        .no-appointments {
            text-align: center;
            padding: 3rem 1rem;
            color: #7f8c8d;
        }

        .no-appointments i {
            font-size: 3rem;
            color: #bdc3c7;
            margin-bottom: 1rem;
        }

        .book-appointment-btn {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .book-appointment-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.3);
        }

        /* Fee Information Card */
        .fee-info-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-top: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .fee-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .fee-item {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            padding: 1rem;
            border-radius: 10px;
            text-align: center;
            border-left: 4px solid #3498db;
        }

        .fee-item.ent {
            border-left-color: #e67e22;
        }

        .fee-item.eye {
            border-left-color: #9b59b6;
        }

        .fee-item.general {
            border-left-color: #27ae60;
        }

        .fee-item i {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: #3498db;
        }

        .fee-item.ent i {
            color: #e67e22;
        }

        .fee-item.eye i {
            color: #9b59b6;
        }

        .fee-item.general i {
            color: #27ae60;
        }

        .fee-item .department {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .fee-item .amount {
            font-size: 1.2rem;
            font-weight: 700;
            color: #e74c3c;
        }

        .important-note {
            background: linear-gradient(135deg, #fff3cd, #ffeaa7);
            padding: 1.5rem;
            border-radius: 10px;
            border-left: 4px solid #f39c12;
        }

        .important-note h4 {
            color: #d68910;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .important-note p {
            margin-bottom: 0.5rem;
            color: #7d6608;
        }

        .important-note strong {
            color: #d68910;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .welcome-section {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .welcome-text h1 {
                font-size: 1.8rem;
            }

            .fee-grid {
                grid-template-columns: 1fr;
            }

            .appointments-table {
                font-size: 0.9rem;
            }

            .appointments-table th,
            .appointments-table td {
                padding: 10px 8px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }

            .patient-card,
            .appointments-section,
            .fee-info-card {
                padding: 1.5rem;
            }

            .dashboard-header {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <div class="welcome-section">
                <div class="welcome-text">
                    <h1>Welcome, ${patient.name} 👋</h1>
                    <p>Your Health Dashboard - Hospital Management System</p>
                </div>
                <a href="${pageContext.request.contextPath}/patients/logout" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>

        <!-- Dashboard Grid -->
        <div class="dashboard-grid">
            <!-- Patient Info Card -->
            <div class="patient-card">
                <div class="patient-header">
                    <div class="patient-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <h2 class="patient-name">${patient.name}</h2>
                    <p class="patient-id">Patient ID: ${patient.patientId}</p>
                </div>
                
                <ul class="patient-details">
                    <li>
                        <i class="fas fa-user"></i>
                        <span class="label">Name:</span>
                        <span class="value">${patient.name}</span>
                    </li>
                    <li>
                        <i class="fas fa-birthday-cake"></i>
                        <span class="label">Age:</span>
                        <span class="value">${patient.age} years</span>
                    </li>
                    <li>
                        <i class="fas fa-phone"></i>
                        <span class="label">Phone:</span>
                        <span class="value">${patient.phoneNumber}</span>
                    </li>
                    <li>
                        <i class="fas fa-id-card"></i>
                        <span class="label">Aadhaar:</span>
                        <span class="value">${patient.aadharCardNo}</span>
                    </li>
                </ul>

                <!-- Book Appointment Button -->
                <form action="${pageContext.request.contextPath}/appointments/book/${patient.patientId}" method="get" style="margin-top: 1.5rem;">
                    <button type="submit" class="book-appointment-btn">
                        <i class="fas fa-calendar-plus"></i>
                        Book New Appointment
                    </button>
                </form>
            </div>

            <!-- Appointments Section -->
            <div class="appointments-section">
                <h3 class="section-title">
                    <i class="fas fa-calendar-check"></i> Your Appointments
                </h3>

                <c:if test="${not empty appointments}">
                    <table class="appointments-table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-calendar-alt"></i> Date</th>
                                <th><i class="fas fa-hospital"></i> Department</th>
                                <th><i class="fas fa-info-circle"></i> Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="a" items="${appointments}">
                                <tr>
                                    <td>${a.appointmentDate}</td>
                                    <td>${a.department}</td>
                                    <td>
                                        <span class="status-badge status-${a.status.toLowerCase()}">${a.status}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty appointments}">
                    <div class="no-appointments">
                        <i class="fas fa-calendar-times"></i>
                        <h4>No Appointments Found</h4>
                        <p>You don't have any appointments scheduled. Book your first appointment to get started!</p>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Fee Information Card -->
        <div class="fee-info-card">
            <h3 class="section-title">
                <i class="fas fa-rupee-sign"></i> Consultation Fees
            </h3>

            <div class="fee-grid">
                <div class="fee-item general">
                    <i class="fas fa-stethoscope"></i>
                    <div class="department">General Consultation</div>
                    <div class="amount">₹100</div>
                </div>
                <div class="fee-item ent">
                    <i class="fas fa-ear-listen"></i>
                    <div class="department">ENT Consultation</div>
                    <div class="amount">₹200</div>
                </div>
                <div class="fee-item eye">
                    <i class="fas fa-eye"></i>
                    <div class="department">Eye Consultation</div>
                    <div class="amount">₹300</div>
                </div>
            </div>

            <div class="important-note">
                <h4>
                    <i class="fas fa-exclamation-triangle"></i>
                    Important Information
                </h4>
                <p><strong>Please pay your bill at the receptionist</strong> for the consultation fee.</p>
                <p>Current appointment is only valid for <strong>one week</strong>.</p>
                <p>Please arrive 15 minutes before your scheduled appointment time.</p>
            </div>
        </div>
    </div>
</body>
</html>