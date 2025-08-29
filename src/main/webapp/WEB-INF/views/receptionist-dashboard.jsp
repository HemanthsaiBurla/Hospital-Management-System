<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Receptionist Dashboard - Hospital Management System</title>
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
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            text-align: center;
        }

        .welcome-text h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }

        .welcome-text p {
            opacity: 0.9;
            font-size: 1.2rem;
        }

        /* Action Buttons Section */
        .actions-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .section-title {
            font-size: 1.8rem;
            color: #2c3e50;
            margin-bottom: 2rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .action-btn {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            border: none;
            padding: 1.5rem 2rem;
            border-radius: 15px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            text-decoration: none;
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.3);
        }

        .action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(39, 174, 96, 0.4);
        }

        .action-btn.secondary {
            background: linear-gradient(135deg, #9b59b6, #8e44ad);
            box-shadow: 0 5px 15px rgba(155, 89, 182, 0.3);
        }

        .action-btn.secondary:hover {
            box-shadow: 0 8px 25px rgba(155, 89, 182, 0.4);
        }

        .action-btn i {
            font-size: 1.3rem;
        }

        /* Logout Button */
        .logout-section {
            text-align: center;
        }

        .logout-btn {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
        }

        .logout-btn:hover {
            background: linear-gradient(135deg, #c0392b, #a93226);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(231, 76, 60, 0.4);
        }

        /* Info Cards */
        .info-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .info-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            text-align: center;
            border-left: 4px solid #3498db;
        }

        .info-card h4 {
            color: #2c3e50;
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .info-card p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .welcome-text h2 {
                font-size: 2rem;
                flex-direction: column;
                gap: 10px;
            }

            .button-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .action-btn {
                padding: 1.2rem 1.5rem;
                font-size: 1rem;
            }

            .info-cards {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }

            .dashboard-header,
            .actions-section {
                padding: 1.5rem;
            }

            .welcome-text h2 {
                font-size: 1.8rem;
            }

            .section-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <div class="welcome-text">
                <h2>
                    <i class="fas fa-user-tie"></i>
                    Welcome to Receptionist Block
                </h2>
                <p>Manage patient records and hospital operations</p>
            </div>
        </div>

        <!-- Info Cards -->
        <div class="info-cards">
            <div class="info-card">
                <h4><i class="fas fa-users"></i> Patient Management</h4>
                <p>View and manage all patient records in the system</p>
            </div>
            <div class="info-card">
                <h4><i class="fas fa-user-plus"></i> New Registrations</h4>
                <p>Add new patients to the hospital management system</p>
            </div>
            <div class="info-card">
                <h4><i class="fas fa-clipboard-list"></i> Daily Operations</h4>
                <p>Handle daily receptionist tasks and patient queries</p>
            </div>
        </div>

        <!-- Actions Section -->
        <div class="actions-section">
            <h3 class="section-title">
                <i class="fas fa-tasks"></i>
                Available Actions
            </h3>
            
            <div class="button-grid">
                <button class="action-btn" onclick="window.location.href='${pageContext.request.contextPath}/receptionist/viewPatients'">
                    <i class="fas fa-users"></i>
                    View All Patients
                </button>
                
                <button class="action-btn secondary" onclick="window.location.href='${pageContext.request.contextPath}/receptionist/addPatientForm'">
                    <i class="fas fa-user-plus"></i>
                    Add Patient
                </button>
            </div>

            <div class="logout-section">
                <button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/receptionist/logout'">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </button>
            </div>
        </div>
    </div>
</body>
</html>