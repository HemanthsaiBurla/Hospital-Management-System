<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage ${role}s - Hospital Management System</title>
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
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        .page-header {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .page-header h1 {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .page-header .icon {
            width: 50px;
            height: 50px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .back-link {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 10px 20px;
            border-radius: 25px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }

        .back-link:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
        }

        /* Add Form Section */
        .add-section {
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

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            font-weight: 600;
            color: #2c3e50;
        }

        .form-control {
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .add-btn {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.4);
        }

        /* Table Section */
        .table-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .table-container {
            overflow-x: auto;
            margin-top: 1rem;
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
            padding: 12px 10px;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
            white-space: nowrap;
        }

        .data-table td {
            padding: 8px;
            border-bottom: 1px solid #e9ecef;
            font-size: 0.9rem;
            vertical-align: middle;
        }

        .data-table tbody tr:hover {
            background: #f8f9fa;
        }

        .data-table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Form controls in table */
        .table-input {
            padding: 6px 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 0.85rem;
            width: 100%;
            min-width: 80px;
        }

        .table-select {
            padding: 6px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 0.85rem;
            width: 100%;
            min-width: 80px;
        }

        .update-btn {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 0.8rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .update-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 3px 8px rgba(52, 152, 219, 0.3);
        }

        .delete-link {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.8rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .delete-link:hover {
            transform: translateY(-1px);
            box-shadow: 0 3px 8px rgba(231, 76, 60, 0.3);
        }

        /* Status badges */
        .status-badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
            font-weight: 500;
            white-space: nowrap;
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

        .status-scheduled {
            background: #cce7ff;
            color: #004085;
        }

        .status-completed {
            background: #d1ecf1;
            color: #0c5460;
        }

        /* Alert Messages */
        .alert {
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .data-table {
                font-size: 0.8rem;
            }
            
            .data-table th,
            .data-table td {
                padding: 6px 4px;
            }
        }

        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent, #e9ecef, transparent);
            margin: 2rem 0;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>
                <div class="icon">
                    <c:choose>
                        <c:when test="${role == 'DOCTOR'}"><i class="fas fa-user-md"></i></c:when>
                        <c:when test="${role == 'PHARMACIST'}"><i class="fas fa-pills"></i></c:when>
                        <c:when test="${role == 'RECEPTIONIST'}"><i class="fas fa-desktop"></i></c:when>
                        <c:when test="${role == 'NURSE'}"><i class="fas fa-user-nurse"></i></c:when>
                        <c:when test="${role == 'SUPPORTSTAFF'}"><i class="fas fa-hands-helping"></i></c:when>
                        <c:when test="${role == 'APPOINTMENTS'}"><i class="fas fa-calendar-check"></i></c:when>
                        <c:otherwise><i class="fas fa-users"></i></c:otherwise>
                    </c:choose>
                </div>
                Manage ${role}s
            </h1>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-link">
                <i class="fas fa-arrow-left"></i> Back to Admin Dashboard
            </a>
        </div>

        <!-- Add Form Section -->
        <c:if test="${role == 'DOCTOR' || role == 'PHARMACIST' || role == 'RECEPTIONIST' || role == 'NURSE'}">
            <div class="add-section">
                <h2 class="section-title">
                    <i class="fas fa-user-plus"></i> Add ${role}
                </h2>
                <form action="${pageContext.request.contextPath}/admin/addUser" method="post">
                    <input type="hidden" name="role" value="${role}">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="number" id="age" name="age" class="form-control" min="18" max="80" required>
                        </div>
                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <select id="gender" name="gender" class="form-control" required>
                                <option value="">Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" pattern="[0-9]{10}">
                        </div>
                        <c:if test="${role == 'DOCTOR'}">
                            <div class="form-group">
                                <label for="specialist">Specialist</label>
                                <input type="text" id="specialist" name="specialist" class="form-control">
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="experience">Experience</label>
                            <input type="text" id="experience" name="experience" class="form-control" placeholder="e.g., 5 years">
                        </div>
                    </div>
                    <button type="submit" class="add-btn">
                        <i class="fas fa-plus"></i> Add ${role}
                    </button>
                </form>
            </div>
            <hr class="divider">
        </c:if>

        <!-- Support Staff Add Form -->
        <c:if test="${role == 'SUPPORTSTAFF'}">
            <div class="add-section">
                <h2 class="section-title">
                    <i class="fas fa-user-plus"></i> Add Support Staff
                </h2>
                <form action="${pageContext.request.contextPath}/admin/addUser" method="post">
                    <input type="hidden" name="role" value="SUPPORTSTAFF">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="number" id="age" name="age" class="form-control" min="18" max="65" required>
                        </div>
                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <select id="gender" name="gender" class="form-control" required>
                                <option value="">Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" pattern="[0-9]{10}">
                        </div>
                        <div class="form-group">
                            <label for="jobType">Job Type</label>
                            <select id="jobType" name="jobType" class="form-control" required>
                                <option value="">Select Job Type</option>
                                <option value="Sweeper">Sweeper</option>
                                <option value="Ward Boy">Ward Boy</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="add-btn">
                        <i class="fas fa-plus"></i> Add Support Staff
                    </button>
                </form>
            </div>
            <hr class="divider">
        </c:if>

        <!-- Existing Users/Appointments Table -->
        <c:if test="${not empty users}">
            <div class="table-section">
                <h2 class="section-title">
                    <i class="fas fa-table"></i> Existing ${role}s
                </h2>
                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <c:if test="${role == 'APPOINTMENTS'}">
                                    <th>Appointment ID</th>
                                    <th>Date</th>
                                    <th>Consultation Type</th>
                                    <th>Department</th>
                                    <th>Patient ID</th>
                                    <th>Status</th>
                                </c:if>
                                
                                <c:if test="${role != 'APPOINTMENTS'}">
                                    <th>ID</th>
                                    <c:if test="${role != 'SUPPORTSTAFF'}">
                                        <th>Username</th>
                                    </c:if>
                                    <c:if test="${role == 'SUPPORTSTAFF'}">
                                        <th>Full Name</th>
                                    </c:if>
                                    <th>Age</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <c:if test="${role == 'SUPPORTSTAFF'}">
                                        <th>Job Type</th>
                                    </c:if>
                                    <c:if test="${role == 'DOCTOR'}">
                                        <th>Specialist</th>
                                    </c:if>
                                    <c:if test="${role == 'DOCTOR' || role == 'PHARMACIST' || role == 'RECEPTIONIST' || role == 'NURSE'}">
                                        <th>Experience</th>
                                    </c:if>
                                    <th>Join Date</th>
                                    <th>New Password</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <c:if test="${role == 'APPOINTMENTS'}">
                                        <td>${user.appointmentId}</td>
                                        <td>${user.appointmentDate}</td>
                                        <td>${user.consultationType}</td>
                                        <td>${user.department}</td>
                                        <td>${user.patientId}</td>
                                        <td>
                                            <span class="status-badge status-${user.status.toLowerCase()}">${user.status}</span>
                                        </td>
                                    </c:if>
                                    
                                    <c:if test="${role != 'APPOINTMENTS'}">
                                        <td>
                                            <c:choose>
                                                <c:when test="${role == 'DOCTOR'}">${user.doctorId}</c:when>
                                                <c:when test="${role == 'PHARMACIST'}">${user.pharmacistId}</c:when>
                                                <c:when test="${role == 'RECEPTIONIST'}">${user.receptionistId}</c:when>
                                                <c:when test="${role == 'NURSE'}">${user.nurseId}</c:when>
                                                <c:when test="${role == 'SUPPORTSTAFF'}">${user.staffId}</c:when>
                                            </c:choose>
                                        </td>

                                        <form action="${pageContext.request.contextPath}/admin/updateUser" method="post" style="display: contents;">
                                            <input type="hidden" name="role" value="${role}">
                                            <input type="hidden" name="id"
                                                value="<c:choose>
                                                          <c:when test='${role == "DOCTOR"}'>${user.doctorId}</c:when>
                                                          <c:when test='${role == "PHARMACIST"}'>${user.pharmacistId}</c:when>
                                                          <c:when test='${role == "RECEPTIONIST"}'>${user.receptionistId}</c:when>
                                                          <c:when test='${role == "NURSE"}'>${user.nurseId}</c:when>
                                                          <c:when test='${role == "SUPPORTSTAFF"}'>${user.staffId}</c:when>
                                                      </c:choose>">

                                            <c:if test="${role == 'SUPPORTSTAFF'}">
                                                <td><input type="text" name="fullName" value="${user.fullName}" class="table-input"></td>
                                            </c:if>
                                            <c:if test="${role != 'SUPPORTSTAFF'}">
                                                <td><input type="text" name="username" value="${user.username}" class="table-input"></td>
                                            </c:if>

                                            <td><input type="number" name="age" value="${user.age}" class="table-input" min="18" max="80" required></td>
                                            <td>
                                                <select name="gender" class="table-select" required>
                                                    <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                                                    <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                                                </select>
                                            </td>
                                            <td><input type="text" name="phoneNumber" value="${user.phoneNumber}" class="table-input"></td>

                                            <c:if test="${role == 'SUPPORTSTAFF'}">
                                                <td>
                                                    <select name="jobType" class="table-select" required>
                                                        <option value="Sweeper" ${user.jobType == 'Sweeper' ? 'selected' : ''}>Sweeper</option>
                                                        <option value="Ward Boy" ${user.jobType == 'Ward Boy' ? 'selected' : ''}>Ward Boy</option>
                                                    </select>
                                                </td>
                                            </c:if>

                                            <c:if test="${role == 'DOCTOR'}">
                                                <td><input type="text" name="specialist" value="${user.specialist}" class="table-input"></td>
                                            </c:if>
                                            <c:if test="${role == 'DOCTOR' || role == 'PHARMACIST' || role == 'RECEPTIONIST' || role == 'NURSE'}">
                                                <td><input type="text" name="experience" value="${user.experience}" class="table-input"></td>
                                            </c:if>

                                            <td>${user.joinDate}</td>
                                            <td><input type="password" name="password" placeholder="New password" class="table-input"></td>
                                            <td><button type="submit" class="update-btn">Update</button></td>
                                        </form>

                                        <td>
                                            <c:choose>
                                                <c:when test="${role == 'DOCTOR'}">
                                                    <c:set var="userId" value="${user.doctorId}" />
                                                </c:when>
                                                <c:when test="${role == 'PHARMACIST'}">
                                                    <c:set var="userId" value="${user.pharmacistId}" />
                                                </c:when>
                                                <c:when test="${role == 'RECEPTIONIST'}">
                                                    <c:set var="userId" value="${user.receptionistId}" />
                                                </c:when>
                                                <c:when test="${role == 'NURSE'}">
                                                    <c:set var="userId" value="${user.nurseId}" />
                                                </c:when>
                                                <c:when test="${role == 'SUPPORTSTAFF'}">
                                                    <c:set var="userId" value="${user.staffId}" />
                                                </c:when>
                                            </c:choose>
                                            <a href="${pageContext.request.contextPath}/admin/deleteUser?role=${role}&id=${userId}"
                                               onclick="return confirm('Are you sure you want to delete this ${role}?');" class="delete-link">
                                                <i class="fas fa-trash"></i> Delete
                                            </a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
    </div>

    <c:if test="${not empty updateStatus}">
        <script>
            var status = '${updateStatus}';
            if (status === 'success') {
                // Create success alert
                var alertDiv = document.createElement('div');
                alertDiv.className = 'alert alert-success';
                alertDiv.innerHTML = '<i class="fas fa-check-circle"></i><span>Update successful!</span>';
                document.querySelector('.container').insertBefore(alertDiv, document.querySelector('.page-header').nextSibling);
                
                // Remove alert after 5 seconds
                setTimeout(function() {
                    alertDiv.remove();
                }, 5000);
            } else {
                // Create error alert
                var alertDiv = document.createElement('div');
                alertDiv.className = 'alert alert-error';
                alertDiv.innerHTML = '<i class="fas fa-exclamation-triangle"></i><span>Update failed. Please try again.</span>';
                document.querySelector('.container').insertBefore(alertDiv, document.querySelector('.page-header').nextSibling);
                
                // Remove alert after 5 seconds
                setTimeout(function() {
                    alertDiv.remove();
                }, 5000);
            }
        </script>
    </c:if>
</body>
</html>