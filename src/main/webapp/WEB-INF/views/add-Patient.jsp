<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Patient - Hospital Management System</title>
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
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2rem;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }

        .form-section {
            margin-bottom: 20px;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
        }

        .form-group.full-width {
            width: 100%;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #2c3e50;
            font-size: 0.95rem;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            background: #fff;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        select {
            cursor: pointer;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
            font-family: inherit;
        }

        .medicines-section {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
        }

        .medicines-section h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            font-size: 1.1rem;
        }

        .medicines-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 10px;
        }

        .medicine-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px;
            background: white;
            border-radius: 6px;
            border: 1px solid #dee2e6;
        }

        .medicine-item input[type="checkbox"] {
            width: auto;
            transform: scale(1.2);
            accent-color: #3498db;
        }

        .medicine-item label {
            margin: 0;
            font-weight: normal;
            cursor: pointer;
            flex: 1;
        }

        .billing-section {
            background: #e8f5e8;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            border-left: 4px solid #27ae60;
        }

        .billing-section h3 {
            margin-bottom: 15px;
            color: #27ae60;
            font-size: 1.1rem;
        }

        button {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 20px;
        }

        button:hover {
            background: linear-gradient(135deg, #2980b9, #21618c);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .doctor-only {
            background: #fff3cd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            border-left: 4px solid #f39c12;
        }

        .doctor-only h3 {
            margin-bottom: 15px;
            color: #f39c12;
            font-size: 1.1rem;
        }

        .required {
            color: #e74c3c;
        }

        /* Role-specific styling */
        .role-indicator {
            background: #3498db;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 20px;
            display: inline-block;
        }

        .doctor-role {
            background: #27ae60;
        }

        .receptionist-role {
            background: #9b59b6;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 10px;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .medicines-grid {
                grid-template-columns: 1fr;
            }
            
            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Patient</h1>

        <c:choose>
            <c:when test="${not empty loggedInDoctor}">
                <div class="role-indicator doctor-role">Doctor Dashboard</div>
                
                <form action="${pageContext.request.contextPath}/doctor/addPatient" method="post">
                    <!-- Basic Information Section -->
                    <div class="form-section">
                        <div class="form-row">
                            <div class="form-group">
                                <label>Name <span class="required">*</span></label>
                                <input type="text" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Age <span class="required">*</span></label>
                                <input type="number" name="age" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="gender">Gender <span class="required">*</span></label>
                                <select id="gender" name="gender" required>
                                    <option value="">Select gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                    <option value="prefer-not-to-say">Prefer not to say</option>
                                </select>
                            </div>
                            <div class="form-group">
    <label>Phone Number <span class="required">*</span></label>
    <input type="text" name="phoneNumber"
           pattern="\d{10}"
           maxlength="10"
           minlength="10"
           title="Phone number must be exactly 10 digits"
           required>
    </div>

                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="address">
                            </div>
                            <div class="form-group">
    <label>Aadhar Card No <span class="required">*</span></label>
    <input type="text" name="aadharCardNo" 
           pattern="\d{12}" 
           maxlength="12" 
           minlength="12" 
           title="Aadhar number must be exactly 12 digits" 
           required>
      </div>

                        </div>

                        <div class="form-group">
                            <label>Department</label>
                            <select name="department">
                                <option value="Cardiology">Cardiology</option>
                                <option value="ENT">ENT</option>
                                <option value="Neurology">Neurology</option>
                                <option value="Orthopedics">Orthopedics</option>
                                <option value="General">General</option>
                            </select>
                        </div>
                    </div>

                    <!-- Doctor-only Medical Information -->
                    <div class="doctor-only">
                        <h3>Medical Information</h3>
                        
                        <div class="form-group">
                            <label>Medical History</label>
                            <textarea name="medicalHistory" placeholder="Enter patient's medical history..."></textarea>
                        </div>

                        <div class="form-group">
                            <label>Recommendations</label>
                            <textarea name="recommendations" placeholder="Enter medical recommendations..."></textarea>
                        </div>

                        <div class="form-group">
                            <label>Instructions</label>
                            <textarea name="instructions" placeholder="Enter care instructions..."></textarea>
                        </div>
                    </div>

                    <!-- Medicines Section -->
                    <div class="medicines-section">
                        <h3>Prescribed Medicines</h3>
                        <div class="medicines-grid">
                            <div class="medicine-item">
                                <input type="checkbox" name="medicines" value="Paracetamol" id="med1"
                                    <c:if test="${fn:contains(patient.medicines, 'Paracetamol')}">checked</c:if>>
                                <label for="med1">Paracetamol</label>
                            </div>
                            <div class="medicine-item">
                                <input type="checkbox" name="medicines" value="Citrizine" id="med2"
                                    <c:if test="${fn:contains(patient.medicines, 'Citrizine')}">checked</c:if>>
                                <label for="med2">Citrizine</label>
                            </div>
                            <div class="medicine-item">
                                <input type="checkbox" name="medicines" value="Azithromycin" id="med3"
                                    <c:if test="${fn:contains(patient.medicines, 'Azithromycin')}">checked</c:if>>
                                <label for="med3">Azithromycin</label>
                            </div>
                            <div class="medicine-item">
                                <input type="checkbox" name="medicines" value="Pantab" id="med4"
                                    <c:if test="${fn:contains(patient.medicines, 'Pantab')}">checked</c:if>>
                                <label for="med4">Pantab</label>
                            </div>
                            <div class="medicine-item">
                                <input type="checkbox" name="medicines" value="Amoxicillin" id="med5"
                                    <c:if test="${fn:contains(patient.medicines, 'Amoxicillin')}">checked</c:if>>
                                <label for="med5">Amoxicillin</label>
                            </div>
                            <div class="medicine-item">
                                <input type="checkbox" name="medicines" value="Dolo-650" id="med6"
                                    <c:if test="${fn:contains(patient.medicines, 'Dolo-650')}">checked</c:if>>
                                <label for="med6">Dolo-650</label>
                            </div>
                        </div>
                    </div>

                    <!-- Billing Section -->
                    <div class="billing-section">
                        <h3>Billing Information</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Bill Amount</label>
                                <input type="number" step="0.01" name="billAmount" placeholder="0.00">
                            </div>
                            <div class="form-group">
                                <label>Amount Paid</label>
                                <input type="number" step="0.01" name="amountPaid" placeholder="0.00">
                            </div>
                            <div class="form-group">
                                <label>Amount Balance</label>
                                <input type="number" step="0.01" name="amountBalence" placeholder="0.00">
                            </div>
                        </div>
                    </div>

                    <button type="submit">Add Patient</button>
                </form>
            </c:when>

            <c:when test="${not empty loggedInReceptionist}">
                <div class="role-indicator receptionist-role">Receptionist Dashboard</div>
                
                <form action="${pageContext.request.contextPath}/receptionist/addPatient" method="post">
                    <!-- Basic Information Section -->
                    <div class="form-section">
                        <div class="form-row">
                            <div class="form-group">
                                <label>Name <span class="required">*</span></label>
                                <input type="text" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Age <span class="required">*</span></label>
                                <input type="number" name="age" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="gender-rec">Gender <span class="required">*</span></label>
                                <select id="gender-rec" name="gender" required>
                                    <option value="">Select gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                    <option value="prefer-not-to-say">Prefer not to say</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Phone Number <span class="required">*</span></label>
                                <input type="text" name="phoneNumber" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="address">
                            </div>
                            <div class="form-group">
                                <label>Aadhar Card No <span class="required">*</span></label>
                                <input type="text" name="aadharCardNo" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Department</label>
                            <select name="department">
                                <option value="Cardiology">Cardiology</option>
                                <option value="ENT">ENT</option>
                                <option value="Neurology">Neurology</option>
                                <option value="Orthopedics">Orthopedics</option>
                                <option value="General">General</option>
                            </select>
                        </div>
                    </div>

                    <!-- Billing Section -->
                    <div class="billing-section">
                        <h3>Billing Information</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Bill Amount</label>
                                <input type="number" step="0.01" name="billAmount" placeholder="0.00">
                            </div>
                            <div class="form-group">
                                <label>Amount Paid</label>
                                <input type="number" step="0.01" name="amountPaid" placeholder="0.00">
                            </div>
                            <div class="form-group">
                                <label>Amount Balance</label>
                                <input type="number" step="0.01" name="amountBalence" placeholder="0.00">
                            </div>
                        </div>
                    </div>

                    <button type="submit">Add Patient</button>
                </form>
            </c:when>
        </c:choose>
    </div>
</body>
</html>