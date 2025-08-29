<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacist Dashboard - Hospital Management System</title>
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
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        .dashboard-header {
            background: linear-gradient(135deg, #8e44ad, #9b59b6);
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
            display: flex;
            align-items: center;
            gap: 12px;
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
            cursor: pointer;
        }

        .logout-btn:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
        }

        /* Filter Section */
        .filter-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
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

        .filter-buttons {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .filter-btn {
            background: #ecf0f1;
            color: #2c3e50;
            border: 2px solid transparent;
            padding: 12px 20px;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .filter-btn:hover,
        .filter-btn.active {
            background: #8e44ad;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(142, 68, 173, 0.3);
        }

        /* Stats Cards */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            text-align: center;
            border-left: 4px solid #8e44ad;
        }

        .stat-card.today {
            border-left-color: #e74c3c;
        }

        .stat-card.total {
            border-left-color: #27ae60;
        }

        .stat-card .number {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .stat-card .label {
            color: #7f8c8d;
            font-size: 0.9rem;
            font-weight: 500;
        }

        /* Patients Section */
        .patients-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .patients-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .showing-info {
            background: #e8f4f8;
            color: #2c3e50;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .patients-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .patients-table th {
            background: #34495e;
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .patients-table td {
            padding: 15px 12px;
            border-bottom: 1px solid #e9ecef;
            font-size: 0.9rem;
        }

        .patients-table tbody tr:hover {
            background: #f8f9fa;
        }

        .patients-table tbody tr:last-child td {
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

        .status-given {
            background: #d4edda;
            color: #155724;
        }

        .status-not-available {
            background: #f8d7da;
            color: #721c24;
        }

        .balance-pending {
            color: #e74c3c;
            font-weight: 600;
        }

        .balance-clear {
            color: #27ae60;
            font-weight: 600;
        }

        .update-form {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .status-select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 0.8rem;
            background: white;
            min-width: 120px;
        }

        .update-btn {
            background: #8e44ad;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 0.8rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .update-btn:hover {
            background: #7d3c98;
            transform: translateY(-1px);
        }

        .no-patients {
            text-align: center;
            padding: 3rem 1rem;
            color: #7f8c8d;
        }

        .no-patients i {
            font-size: 3rem;
            color: #bdc3c7;
            margin-bottom: 1rem;
        }

        .no-patients h4 {
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .welcome-section {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .welcome-text h1 {
                font-size: 1.8rem;
            }

            .filter-buttons {
                flex-direction: column;
            }

            .patients-header {
                flex-direction: column;
                align-items: stretch;
            }

            .patients-table {
                font-size: 0.8rem;
            }

            .patients-table th,
            .patients-table td {
                padding: 10px 8px;
            }

            .stats-row {
                grid-template-columns: 1fr;
            }

            .update-form {
                flex-direction: column;
                gap: 4px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }

            .dashboard-header,
            .filter-section,
            .patients-section {
                padding: 1.5rem;
            }

            .patients-table {
                font-size: 0.7rem;
            }

            .patients-table th,
            .patients-table td {
                padding: 8px 6px;
            }
        }

        /* Table responsiveness */
        .table-container {
            overflow-x: auto;
        }

        @media (max-width: 768px) {
            .table-container {
                margin: -1rem;
                padding: 1rem;
            }
        }
    </style>
    <script>
        function confirmGiven(selectElement, form) {
            const selectedValue = selectElement.value;
            if (selectedValue === "Given") {
                // Show confirmation
                const confirmAction = confirm("Are you sure you want to update status to 'Given'?");
                if (!confirmAction) {
                    // Reset to previous value if cancelled
                    selectElement.value = selectElement.getAttribute("data-prev");
                    return false;
                }
            }
            form.submit();
        }

        // Save previous value of dropdown
        function savePrevValue(selectElement) {
            selectElement.setAttribute("data-prev", selectElement.value);
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <div class="welcome-section">
                <div class="welcome-text">
                    <h1>
                        <i class="fas fa-pills"></i>
                        Welcome, ${sessionScope.loggedInPharmacist.username}
                    </h1>
                    <p>Manage patient medications and prescriptions - Hospital Management System</p>
                </div>
                <form action="${pageContext.request.contextPath}/pharmacist/logout" method="post" style="display: inline;">
                    <button type="submit" class="logout-btn">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </button>
                </form>
            </div>
        </div>

        <!-- Stats Row -->
        <div class="stats-row">
            <div class="stat-card today">
                <div class="number">
                    <c:choose>
                        <c:when test="${filter == 'today'}">${patients.size()}</c:when>
                        <c:otherwise>--</c:otherwise>
                    </c:choose>
                </div>
                <div class="label">Today's Patients</div>
            </div>
            <div class="stat-card total">
                <div class="number">
                    <c:choose>
                        <c:when test="${filter == 'all'}">${patients.size()}</c:when>
                        <c:otherwise>--</c:otherwise>
                    </c:choose>
                </div>
                <div class="label">All Patients</div>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-section">
            <h3 class="section-title">
                <i class="fas fa-filter"></i> Filter Patients
            </h3>
            <div class="filter-buttons">
                <a href="${pageContext.request.contextPath}/pharmacist/dashboard?filter=today" 
                   class="filter-btn ${filter == 'today' ? 'active' : ''}">
                    <i class="fas fa-calendar-day"></i>
                    Today's Patients
                </a>
                <a href="${pageContext.request.contextPath}/pharmacist/dashboard?filter=all" 
                   class="filter-btn ${filter == 'all' ? 'active' : ''}">
                    <i class="fas fa-calendar-alt"></i>
                    All Patients
                </a>
            </div>
        </div>

        <!-- Patients Section -->
        <div class="patients-section">
            <div class="patients-header">
                <h3 class="section-title">
                    <i class="fas fa-user-injured"></i> 
                    <c:choose>
                        <c:when test="${filter == 'all'}">All Patients</c:when>
                        <c:otherwise>Today's Patients</c:otherwise>
                    </c:choose>
                </h3>
                <div class="showing-info">
                    <i class="fas fa-info-circle"></i>
                    Showing: 
                    <c:choose>
                        <c:when test="${filter == 'all'}">all patients</c:when>
                        <c:otherwise>today's patients</c:otherwise>
                    </c:choose>
                </div>
            </div>

            <c:if test="${empty patients}">
                <div class="no-patients">
                    <i class="fas fa-user-times"></i>
                    <h4>No Patients Found</h4>
                    <p>There are no 
                        <c:choose>
                            <c:when test="${filter == 'all'}">patients</c:when>
                            <c:otherwise>patients for today</c:otherwise>
                        </c:choose>
                        to display at this time.
                    </p>
                </div>
            </c:if>

            <c:if test="${not empty patients}">
                <div class="table-container">
                    <table class="patients-table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag"></i> ID</th>
                                <th><i class="fas fa-user"></i> Name</th>
                                <th><i class="fas fa-id-card"></i> Aadhar No</th>
                                <th><i class="fas fa-pills"></i> Medicine</th>
                                <th><i class="fas fa-rupee-sign"></i> Balance Amount</th>
                                <th><i class="fas fa-calendar-alt"></i> Visit Date</th>
                                <th><i class="fas fa-info-circle"></i> Medicine Status</th>
                                <th><i class="fas fa-cogs"></i> Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${patients}">
                                <tr>
                                    <td>${p.patientId}</td>
                                    <td>${p.name}</td>
                                    <td>${p.aadharCardNo}</td>
                                    <td>${p.medicines}</td>
                                    <td>
                                        <span class="${p.amountBalence <= 0 ? 'balance-clear' : 'balance-pending'}">
                                            ₹${p.amountBalence}
                                        </span>
                                    </td>
                                    <td>${p.visitDate}</td>
                                    <td>
                                        <span class="status-badge status-${p.medicineStatus.toLowerCase().replace(' ', '-')}">${p.medicineStatus}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p.amountBalence <= 0}">
                                                <form action="${pageContext.request.contextPath}/pharmacist/updateMedicineStatus" method="post" class="update-form">
                                                    <input type="hidden" name="patientId" value="${p.patientId}" />
                                                    <select name="medicineStatus" class="status-select" onchange="savePrevValue(this)">
                                                        <option value="Pending" ${p.medicineStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                                                        <option value="Given" ${p.medicineStatus == 'Given' ? 'selected' : ''}>Given</option>
                                                        <option value="Not Available" ${p.medicineStatus == 'Not Available' ? 'selected' : ''}>Not Available</option>
                                                    </select>
                                                    <button type="button" class="update-btn" onclick="confirmGiven(this.previousElementSibling, this.form)">
                                                        <i class="fas fa-check"></i> Update
                                                    </button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="balance-pending">
                                                    <i class="fas fa-exclamation-triangle"></i>
                                                    Balance Pending - Cannot update
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>