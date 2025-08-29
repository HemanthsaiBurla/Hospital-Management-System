<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hospital Management System</title>
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
}

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        .dashboard-header {
            background: linear-gradient(135deg, #2c3e50, #3498db);
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
            background: #e74c3c;
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
            background: #c0392b;
            transform: translateY(-2px);
        }

        /* Statistics Dashboard */
        .stats-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
            transform: translate(30px, -30px);
        }

        .stat-card.appointments {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .stat-card.revenue {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .stat-card.staff {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        .stat-card.patients {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .stat-title {
            font-size: 1rem;
            font-weight: 500;
            opacity: 0.9;
        }

        .stat-icon {
            font-size: 2rem;
            opacity: 0.8;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .stat-subtitle {
            font-size: 0.9rem;
            opacity: 0.8;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .trend-up {
            color: #2ecc71;
        }

        .trend-down {
            color: #e74c3c;
        }

        /* Quick Stats Row */
        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .quick-stat {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 3px 15px rgba(0,0,0,0.08);
            border-left: 4px solid #3498db;
            transition: all 0.3s ease;
        }

        .quick-stat:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .quick-stat.doctors {
            border-left-color: #e74c3c;
        }

        .quick-stat.nurses {
            border-left-color: #9b59b6;
        }

        .quick-stat.pharmacists {
            border-left-color: #f39c12;
        }

        .quick-stat.receptionists {
            border-left-color: #1abc9c;
        }

        .quick-stat.support {
            border-left-color: #34495e;
        }

        .quick-stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .quick-stat-label {
            font-size: 0.9rem;
            color: #7f8c8d;
            font-weight: 500;
        }

        /* Manage Roles Section */
        .manage-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .section-title {
            font-size: 1.8rem;
            color: #2c3e50;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .role-buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .role-row {
            display: flex;
            gap: 1rem;
        }

        .role-btn {
            flex: 1;
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            border: none;
            padding: 15px 20px;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .role-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.3);
        }

        .role-btn.active {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
        }

        /* Dropdown Tables */
        .table-dropdown {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
            background: #f8f9fa;
            border-radius: 10px;
            margin-top: 1rem;
        }

        .table-dropdown.show {
            max-height: 600px;
            overflow: auto;
        }

        .table-container {
            padding: 1.5rem;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .data-table th {
            background: #34495e;
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .data-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            font-size: 0.9rem;
        }

        .data-table tbody tr:hover {
            background: #f8f9fa;
        }

        .data-table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Management Links */
        .management-links {
            margin: 1rem 0;
        }

        .management-links ul {
            list-style: none;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .management-links li {
            background: #ecf0f1;
            border-radius: 25px;
            padding: 8px 16px;
            transition: all 0.3s ease;
        }

        .management-links li:hover {
            background: #d5dbdb;
            transform: translateY(-2px);
        }

        .management-links a {
            text-decoration: none;
            color: #2c3e50;
            font-weight: 500;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .welcome-section {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .quick-stats {
                grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            }

            .role-buttons {
                grid-template-columns: 1fr;
            }

            .role-row {
                flex-direction: column;
            }

            .data-table {
                font-size: 0.8rem;
            }

            .data-table th,
            .data-table td {
                padding: 8px 10px;
            }
        }

        /* Status badges */
        .status-badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
            font-weight: 500;
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
    </style>
</head>
<body>
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <div class="welcome-section">
                <div class="welcome-text">
                    <h1>Welcome, ${sessionScope.loggedInAdmin} 👋</h1>
                    <p>You are now in the Admin Dashboard - Hospital Management System</p>
                </div>
                <a href="${pageContext.request.contextPath}/admin/logout" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>

        <!-- Statistics Dashboard -->
        <div class="stats-section">
            <h2 class="section-title">
                <i class="fas fa-chart-bar"></i> Dashboard Overview
            </h2>

            <!-- Main Statistics Cards -->
            <div class="stats-grid">
                <div class="stat-card appointments">
                    <div class="stat-header">
                        <div class="stat-title">Appointments Today</div>
                        <i class="fas fa-calendar-day stat-icon"></i>
                    </div>
                    <div class="stat-number">${todayAppointments != null ? todayAppointments : 0}</div>
                    <div class="stat-subtitle">
                        <i class="fas fa-arrow-up trend-up"></i>
                        Total: ${totalAppointments != null ? totalAppointments : 0} appointments
                    </div>
                </div>

                <div class="stat-card revenue">
                    <div class="stat-header">
                        <div class="stat-title">Today's Revenue</div>
                       <i class="fas fa-indian-rupee-sign stat-icon"></i>
                    </div>
                    <div class="stat-number"> ₹ ${todayRevenue != null ? todayRevenue : '0.00'}</div>
                    <div class="stat-subtitle">
                        <i class="fas fa-chart-line trend-up"></i>
                        Total Revenue:  ₹ ${totalRevenue != null ? totalRevenue : '0.00'}
                    </div>
                </div>

                <div class="stat-card patients">
                    <div class="stat-header">
                        <div class="stat-title">Total Patients</div>
                        <i class="fas fa-user-injured stat-icon"></i>
                    </div>
                    <div class="stat-number">${totalPatients != null ? totalPatients : 0}</div>
                    <div class="stat-subtitle">
                        <i class="fas fa-users"></i>
                        Registered patients
                    </div>
                </div>

                <div class="stat-card staff">
                    <div class="stat-header">
                        <div class="stat-title">Total Staff</div>
                        <i class="fas fa-users-cog stat-icon"></i>
                    </div>
                    <div class="stat-number">${totalStaff != null ? totalStaff : 0}</div>
                    <div class="stat-subtitle">
                        <i class="fas fa-user-tie"></i>
                        Active staff members
                    </div>
                </div>
            </div>

            <!-- Quick Stats Row -->
            <div class="quick-stats">
                <div class="quick-stat doctors">
                    <div class="quick-stat-number">${totalDoctors != null ? totalDoctors : 0}</div>
                    <div class="quick-stat-label">Doctors</div>
                </div>
                <div class="quick-stat nurses">
                    <div class="quick-stat-number">${totalNurses != null ? totalNurses : 0}</div>
                    <div class="quick-stat-label">Nurses</div>
                </div>
                <div class="quick-stat pharmacists">
                    <div class="quick-stat-number">${totalPharmacists != null ? totalPharmacists : 0}</div>
                    <div class="quick-stat-label">Pharmacists</div>
                </div>
                <div class="quick-stat receptionists">
                    <div class="quick-stat-number">${totalReceptionists != null ? totalReceptionists : 0}</div>
                    <div class="quick-stat-label">Receptionists</div>
                </div>
                <div class="quick-stat support">
                    <div class="quick-stat-number">${totalSupportStaff != null ? totalSupportStaff : 0}</div>
                    <div class="quick-stat-label">Support Staff</div>
                </div>
            </div>
        </div>

        <!-- Manage Roles Section -->
        <div class="manage-section">
            <h2 class="section-title">
                <i class="fas fa-users-cog"></i> Manage Roles
            </h2>

            <!-- Management Links -->
            <div class="management-links">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/admin/manage?role=DOCTOR"><i class="fas fa-user-md"></i> Manage Doctors</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manage?role=PHARMACIST"><i class="fas fa-pills"></i> Manage Pharmacists</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manage?role=RECEPTIONIST"><i class="fas fa-desktop"></i> Manage Receptionists</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manage?role=NURSE"><i class="fas fa-user-nurse"></i> Manage Nurses</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manage?role=SUPPORTSTAFF"><i class="fas fa-hands-helping"></i> Manage Support Staff</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manage?role=APPOINTMENTS"><i class="fas fa-calendar-check"></i> Manage Appointments</a></li>
                </ul>
            </div>

            <!-- Role Buttons Grid -->
            <div class="role-buttons">
                <div class="role-row">
                    <button class="role-btn" onclick="toggleTable('doctors')">
                        <i class="fas fa-user-md"></i> Doctors
                    </button>
                    <button class="role-btn" onclick="toggleTable('nurses')">
                        <i class="fas fa-user-nurse"></i> Nurses
                    </button>
                </div>
                <div class="role-row">
                    <button class="role-btn" onclick="toggleTable('receptionists')">
                        <i class="fas fa-desktop"></i> Receptionists
                    </button>
                    <button class="role-btn" onclick="toggleTable('pharmacists')">
                        <i class="fas fa-pills"></i> Pharmacists
                    </button>
                </div>
            </div>

            <!-- Additional Buttons Row -->
            <div class="role-row">
                <button class="role-btn" onclick="toggleTable('supportstaff')">
                    <i class="fas fa-hands-helping"></i> Support Staff
                </button>
                <button class="role-btn" onclick="toggleTable('appointments')">
                    <i class="fas fa-calendar-check"></i> Appointments
                </button>
                <button class="role-btn" onclick="toggleTable('patients')">
                    <i class="fas fa-user-injured"></i> Patients
                </button>
            </div>

            <!-- Dropdown Tables -->
            
            <!-- Doctors Table -->
            <div id="doctors-table" class="table-dropdown">
                <div class="table-container">
                    <h3><i class="fas fa-user-md"></i> All Registered Doctors</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th><th>Username</th><th>Age</th><th>Gender</th><th>Phone</th><th>Specialist</th><th>Experience</th><th>Join Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="d" items="${doctors}">
                                <tr>
                                    <td>${d.doctorId}</td><td>${d.username}</td><td>${d.age}</td><td>${d.gender}</td>
                                    <td>${d.phoneNumber}</td><td>${d.specialist}</td><td>${d.experience}</td><td>${d.joinDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Nurses Table -->
            <div id="nurses-table" class="table-dropdown">
                <div class="table-container">
                    <h3><i class="fas fa-user-nurse"></i> All Registered Nurses</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th><th>Username</th><th>Age</th><th>Gender</th><th>Phone</th><th>Experience</th><th>Join Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="n" items="${nurses}">
                                <tr>
                                    <td>${n.nurseId}</td><td>${n.username}</td><td>${n.age}</td>
                                    <td>${n.gender}</td><td>${n.phoneNumber}</td><td>${n.experience}</td><td>${n.joinDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Receptionists Table -->
            <div id="receptionists-table" class="table-dropdown">
                <div class="table-container">
                    <h3><i class="fas fa-desktop"></i> All Registered Receptionists</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th><th>Username</th><th>Age</th><th>Gender</th><th>Phone</th><th>Experience</th><th>Join Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="r" items="${receptionists}">
                                <tr>
                                    <td>${r.receptionistId}</td><td>${r.username}</td><td>${r.age}</td>
                                    <td>${r.gender}</td><td>${r.phoneNumber}</td><td>${r.experience}</td><td>${r.joinDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Pharmacists Table -->
            <div id="pharmacists-table" class="table-dropdown">
                <div class="table-container">
                    <h3><i class="fas fa-pills"></i> All Registered Pharmacists</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th><th>Username</th><th>Age</th><th>Gender</th><th>Phone</th><th>Experience</th><th>Join Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${pharmacists}">
                                <tr>
                                    <td>${p.pharmacistId}</td><td>${p.username}</td><td>${p.age}</td>
                                    <td>${p.gender}</td><td>${p.phoneNumber}</td><td>${p.experience}</td><td>${p.joinDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Support Staff Table -->
            <div id="supportstaff-table" class="table-dropdown">
                <div class="table-container">
                    <h3><i class="fas fa-hands-helping"></i> All Registered Support Staff</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th><th>Full Name</th><th>Age</th><th>Gender</th><th>Phone</th><th>Job Type</th><th>Join Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="s" items="${staff}">
                                <tr>
                                    <td>${s.staffId}</td><td>${s.fullName}</td><td>${s.age}</td>
                                    <td>${s.gender}</td><td>${s.phoneNumber}</td><td>${s.jobType}</td><td>${s.joinDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Appointments Table -->
            <div id="appointments-table" class="table-dropdown">
                <div class="table-container">
                    <h3><i class="fas fa-calendar-check"></i> All Appointments</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Appointment ID</th><th>Date</th><th>Consultation Type</th><th>Department</th><th>Patient ID</th><th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="a" items="${appointments}">
                                <tr>
                                    <td>${a.appointmentId}</td><td>${a.appointmentDate}</td><td>${a.consultationType}</td>
                                    <td>${a.department}</td><td>${a.patientId}</td>
                                    <td>
                                        <span class="status-badge status-${a.status.toLowerCase()}">${a.status}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Patients Table -->
            <div id="patients-table" class="table-dropdown">
                <div class="table-container">
                    <h3><i class="fas fa-user-injured"></i> All Registered Patients</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th><th>Patient Name</th><th>Age</th><th>Gender</th><th>Phone</th><th>Bill Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="patient" items="${patients}">
                                <tr>
                                    <td>${patient.patientId}</td><td>${patient.name}</td><td>${patient.age}</td>
                                    <td>${patient.gender}</td><td>${patient.phoneNumber}</td><td> ₹ ${patient.billAmount}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        let currentOpenTable = null;

        function toggleTable(tableName) {
            const tableDiv = document.getElementById(tableName + '-table');
            const allButtons = document.querySelectorAll('.role-btn');
            const currentButton = document.querySelector(`[onclick="toggleTable('${tableName}')"]`);
            
            // If clicking the same table, close it
            if (currentOpenTable === tableName) {
                tableDiv.classList.remove('show');
                currentButton.classList.remove('active');
                currentOpenTable = null;
                return;
            }
            
            // Close all tables and remove active class from all buttons
            const allTables = document.querySelectorAll('.table-dropdown');
            allTables.forEach(table => table.classList.remove('show'));
            allButtons.forEach(button => button.classList.remove('active'));
            
            // Open new table and activate button
            tableDiv.classList.add('show');
            currentButton.classList.add('active');
            currentOpenTable = tableName;
        }
    </script>
</body>
</html>