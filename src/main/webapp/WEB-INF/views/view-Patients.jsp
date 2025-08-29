<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Patients - Hospital Management System</title>
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
            max-width: 1600px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        .page-header {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-title h1 {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-title p {
            opacity: 0.9;
            font-size: 1rem;
        }

        .header-actions {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .header-btn {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .header-btn:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
        }

        .header-btn.add {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
        }

        .header-btn.add:hover {
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.4);
        }

        /* Search and Filter Section */
        .controls-section {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .search-bar {
            position: relative;
            max-width: 400px;
        }

        .search-bar input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e9ecef;
            border-radius: 25px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .search-bar input:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .search-bar i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        /* Patients Table */
        .patients-section {
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

        .table-container {
            overflow-x: auto;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .patients-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            min-width: 1200px;
        }

        .patients-table th {
            background: #34495e;
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 0.85rem;
            white-space: nowrap;
        }

        .patients-table th:first-child {
            border-radius: 10px 0 0 0;
        }

        .patients-table th:last-child {
            border-radius: 0 10px 0 0;
        }

        .patients-table td {
            padding: 12px;
            border-bottom: 1px solid #e9ecef;
            font-size: 0.85rem;
            vertical-align: top;
        }

        .patients-table tbody tr:hover {
            background: #f8f9fa;
        }

        .patients-table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Table cell specific styling */
        .cell-id {
            font-weight: 600;
            color: #3498db;
        }

        .cell-name {
            font-weight: 500;
            color: #2c3e50;
        }

        .cell-amount {
            font-weight: 600;
        }

        .cell-amount.positive {
            color: #27ae60;
        }

        .cell-amount.negative {
            color: #e74c3c;
        }

        .cell-amount.zero {
            color: #7f8c8d;
        }

        .cell-long-text {
            max-width: 150px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .cell-long-text:hover {
            overflow: visible;
            white-space: normal;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: relative;
            z-index: 10;
            border-radius: 5px;
            padding: 8px;
        }

        /* Action buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .action-btn.edit {
            background: #3498db;
            color: white;
        }

        .action-btn.edit:hover {
            background: #2980b9;
            transform: translateY(-1px);
        }

        .action-btn.delete {
            background: #e74c3c;
            color: white;
        }

        .action-btn.delete:hover {
            background: #c0392b;
            transform: translateY(-1px);
        }

        /* Gender badges */
        .gender-badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .gender-male {
            background: #e3f2fd;
            color: #1976d2;
        }

        .gender-female {
            background: #fce4ec;
            color: #c2185b;
        }

        .gender-other {
            background: #f3e5f5;
            color: #7b1fa2;
        }

        /* Stats summary */
        .stats-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            text-align: center;
            border-left: 4px solid #3498db;
        }

        .stat-card.patients {
            border-left-color: #3498db;
        }

        .stat-card.revenue {
            border-left-color: #27ae60;
        }

        .stat-card.pending {
            border-left-color: #e74c3c;
        }

        .stat-card .number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .stat-card .label {
            color: #7f8c8d;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Empty state */
        .no-patients {
            text-align: center;
            padding: 4rem 2rem;
            color: #7f8c8d;
        }

        .no-patients i {
            font-size: 4rem;
            color: #bdc3c7;
            margin-bottom: 1rem;
        }

        .no-patients h3 {
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .header-title h1 {
                font-size: 1.8rem;
            }

            .header-actions {
                flex-wrap: wrap;
                justify-content: center;
            }

            .patients-table th,
            .patients-table td {
                padding: 8px 6px;
                font-size: 0.75rem;
            }

            .action-buttons {
                flex-direction: column;
                gap: 0.25rem;
            }

            .stats-summary {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }

            .page-header,
            .controls-section,
            .patients-section {
                padding: 1.5rem;
            }

            .table-container {
                margin: -1rem;
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="header-content">
                <div class="header-title">
                    <h1>
                        <i class="fas fa-users"></i>
                        All Patients
                    </h1>
                    <p>Comprehensive patient records and management</p>
                </div>
                <div class="header-actions">
                    <c:choose>
                        <c:when test="${not empty loggedInDoctor}">
                            <a href="${pageContext.request.contextPath}/doctor/addPatientForm" class="header-btn add">
                                <i class="fas fa-user-plus"></i> Add Patient
                            </a>
                            <button onclick="window.location.href='${pageContext.request.contextPath}/doctor/logout'" class="header-btn">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </button>
                        </c:when>
                        <c:when test="${not empty loggedInReceptionist}">
                            <a href="${pageContext.request.contextPath}/receptionist/addPatientForm" class="header-btn add">
                                <i class="fas fa-user-plus"></i> Add Patient
                            </a>
                            <button onclick="window.location.href='${pageContext.request.contextPath}/receptionist/logout'" class="header-btn">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </button>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Stats Summary -->
        <div class="stats-summary">
            <div class="stat-card patients">
                <div class="number">${patients.size()}</div>
                <div class="label">Total Patients</div>
            </div>
            <div class="stat-card revenue">
                <div class="number">
                    <c:set var="totalRevenue" value="0" />
                    <c:forEach var="patient" items="${patients}">
                        <c:set var="totalRevenue" value="${totalRevenue + patient.amountPaid}" />
                    </c:forEach>
                    ₹${totalRevenue}
                </div>
                <div class="label">Total Revenue</div>
            </div>
            <div class="stat-card pending">
                <div class="number">
                    <c:set var="totalPending" value="0" />
                    <c:forEach var="patient" items="${patients}">
                        <c:set var="totalPending" value="${totalPending + patient.amountBalence}" />
                    </c:forEach>
                    ₹${totalPending}
                </div>
                <div class="label">Pending Amount</div>
            </div>
        </div>

        <!-- Search and Controls -->
        <div class="controls-section">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search patients by name, ID, or phone..." onkeyup="searchPatients()">
            </div>
        </div>

        <!-- Patients Table -->
        <div class="patients-section">
            <h3 class="section-title">
                <i class="fas fa-table"></i> Patient Records
            </h3>

            <c:if test="${empty patients}">
                <div class="no-patients">
                    <i class="fas fa-user-times"></i>
                    <h3>No Patients Found</h3>
                    <p>There are no patient records to display. Add your first patient to get started!</p>
                </div>
            </c:if>

            <c:if test="${not empty patients}">
                <div class="table-container">
                    <table class="patients-table" id="patientsTable">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag"></i> ID</th>
                                <th><i class="fas fa-user"></i> Name</th>
                                <th><i class="fas fa-birthday-cake"></i> Age</th>
                                <th><i class="fas fa-venus-mars"></i> Gender</th>
                                <th><i class="fas fa-phone"></i> Phone</th>
                                <th><i class="fas fa-map-marker-alt"></i> Address</th>
                                <th><i class="fas fa-id-card"></i> Aadhaar</th>
                                <th><i class="fas fa-notes-medical"></i> Medical History</th>
                                <th><i class="fas fa-clipboard-list"></i> Instructions</th>
                                <th><i class="fas fa-pills"></i> Medicines</th>
                                <th><i class="fas fa-receipt"></i> Bill Amount</th>
                                <th><i class="fas fa-credit-card"></i> Amount Paid</th>
                                <th><i class="fas fa-balance-scale"></i> Balance</th>
                                <th><i class="fas fa-cogs"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="patient" items="${patients}">
                                <tr>
                                    <td class="cell-id">${patient.patientId}</td>
                                    <td class="cell-name">${patient.name}</td>
                                    <td>${patient.age}</td>
                                    <td>
                                        <span class="gender-badge gender-${patient.gender.toLowerCase()}">${patient.gender}</span>
                                    </td>
                                    <td>${patient.phoneNumber}</td>
                                    <td class="cell-long-text">${patient.address}</td>
                                    <td>${patient.aadharCardNo}</td>
                                    <td class="cell-long-text">${patient.medicalHistory}</td>
                                    <td class="cell-long-text">${patient.instructions}</td>
                                    <td class="cell-long-text">${patient.medicines}</td>
                                    <td class="cell-amount">₹${patient.billAmount}</td>
                                    <td class="cell-amount positive">₹${patient.amountPaid}</td>
                                    <td class="cell-amount ${patient.amountBalence > 0 ? 'negative' : patient.amountBalence < 0 ? 'positive' : 'zero'}">
                                        ₹${patient.amountBalence}
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <c:choose>
                                                <c:when test="${not empty loggedInDoctor}">
                                                    <a href="/doctor/editPatient?id=${patient.patientId}" class="action-btn edit">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </a>
                                                    <a href="/doctor/deletePatient?id=${patient.patientId}" 
                                                       class="action-btn delete"
                                                       onclick="return confirm('Warning: Deleting this patient record is permanent and cannot be undone. Are you sure you want to proceed with deleting ${patient.name}?');">
                                                        <i class="fas fa-trash"></i> Delete
                                                    </a>
                                                </c:when>
                                                <c:when test="${not empty loggedInReceptionist}">
                                                    <a href="/receptionist/editPatient?id=${patient.patientId}" class="action-btn edit">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </a>
                                                    <a href="/receptionist/deletePatient?id=${patient.patientId}" 
                                                       class="action-btn delete"
                                                       onclick="return confirm('Warning: Deleting this patient record is permanent and cannot be undone. Are you sure you want to proceed with deleting ${patient.name}?');">
                                                        <i class="fas fa-trash"></i> Delete
                                                    </a>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>

    <script>
        function searchPatients() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('patientsTable');
            const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

            for (let i = 0; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName('td');
                let found = false;

                // Search in ID, Name, and Phone columns
                if (cells[0] && cells[0].textContent.toLowerCase().includes(filter)) found = true;
                if (cells[1] && cells[1].textContent.toLowerCase().includes(filter)) found = true;
                if (cells[4] && cells[4].textContent.toLowerCase().includes(filter)) found = true;

                rows[i].style.display = found ? '' : 'none';
            }
        }

        // Auto-hide long text cells on mobile
        function handleResponsiveText() {
            const longTextCells = document.querySelectorAll('.cell-long-text');
            const isMobile = window.innerWidth <= 768;

            longTextCells.forEach(cell => {
                if (isMobile) {
                    cell.style.maxWidth = '100px';
                } else {
                    cell.style.maxWidth = '150px';
                }
            });
        }

        window.addEventListener('resize', handleResponsiveText);
        document.addEventListener('DOMContentLoaded', handleResponsiveText);
    </script>
</body>
</html>