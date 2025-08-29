<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patient - Hospital Management System</title>
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
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(45deg, #2c5aa0, #1e3a8a);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h2 {
            font-size: 28px;
            font-weight: 300;
            margin: 0;
        }

        .form-container {
            padding: 40px;
        }

        .patient-id {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 30px;
            color: #64748b;
            font-weight: 500;
        }

        .form-section {
            margin-bottom: 30px;
        }

        .section-title {
            color: #1e40af;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 8px;
            border-bottom: 2px solid #e5e7eb;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .form-row .form-group {
            flex: 1;
            min-width: 250px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #374151;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: white;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        .medicines-container {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 20px;
        }

        .medicines-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 12px;
            margin-top: 10px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #3b82f6;
        }

        .checkbox-item label {
            margin-bottom: 0;
            font-weight: normal;
            cursor: pointer;
        }

        .submit-btn {
            background: linear-gradient(45deg, #059669, #047857);
            color: white;
            padding: 14px 32px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
            box-shadow: 0 4px 15px rgba(5, 150, 105, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(5, 150, 105, 0.4);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .doctor-only {
            background: #fef7ff;
            border: 1px solid #e879f9;
            border-radius: 8px;
            padding: 25px;
            margin-top: 20px;
        }

        .doctor-badge {
            background: #a855f7;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 15px;
            display: inline-block;
        }

        @media (max-width: 600px) {
            .form-row {
                flex-direction: column;
            }
            
            .form-container {
                padding: 20px;
            }
            
            .header {
                padding: 20px;
            }
            
            .header h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Edit Patient Record</h1>
        </div>

        <div class="form-container">
            <!-- ✅ Decide form action dynamically -->
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInDoctor}">
                    <c:set var="formAction" value="/doctor/updatePatient"/>
                </c:when>
                <c:when test="${not empty sessionScope.loggedInReceptionist}">
                    <c:set var="formAction" value="/receptionist/updatePatient"/>
                </c:when>
            </c:choose>

            <form action="${formAction}" method="post">
                <!-- Hidden Patient ID -->
                <input type="hidden" name="patientId" value="${patient.patientId}">

                <div class="patient-id">
                    <strong>Patient ID:</strong> ${patient.patientId}
                </div>

                <div class="form-section">
                    <div class="section-title">Personal Information</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text" name="name" value="${patient.name}">
                        </div>
                        <div class="form-group">
                            <label>Age:</label>
                            <input type="number" name="age" value="${patient.age}">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Gender:</label>
                            <input type="text" name="gender" value="${patient.gender}">
                        </div>
                        <div class="form-group">
                            <label>Phone Number:</label>
                            <input type="text" name="phoneNumber" value="${patient.phoneNumber}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Address:</label>
                        <input type="text" name="address" value="${patient.address}">
                    </div>

                    <div class="form-group">
                        <label>Aadhar Card No:</label>
                        <input type="text" name="aadharCardNo" value="${patient.aadharCardNo}">
                    </div>
                </div>

                <div class="form-section">
                    <div class="section-title">Billing Information</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Bill Amount:</label>
                            <input type="number" step="0.01" name="billAmount" value="${patient.billAmount}">
                        </div>
                        <div class="form-group">
                            <label>Amount Paid:</label>
                            <input type="number" step="0.01" name="amountPaid" value="${patient.amountPaid}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Balance Amount:</label>
                        <input type="number" step="0.01" name="amountBalence" value="${patient.amountBalence}">
                    </div>
                </div>

                <!-- Doctor-only editable fields -->
                <c:if test="${not empty sessionScope.loggedInDoctor}">
                    <div class="doctor-only">
                        <span class="doctor-badge">Doctor Access Only</span>
                        
                        <div class="form-group">
                            <label>Medical History:</label>
                            <textarea name="medicalHistory">${patient.medicalHistory}</textarea>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Recommendations:</label>
                                <textarea name="recommendations">${patient.recommendations}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Instructions:</label>
                                <textarea name="instructions">${patient.instructions}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Prescribed Medicines:</label>
                            <div class="medicines-container">
                                <div class="medicines-grid">
                                    <div class="checkbox-item">
                                        <input type="checkbox" name="medicines" value="Paracetamol" id="med1"
                                            <c:if test="${fn:contains(patient.medicines, 'Paracetamol')}">checked</c:if>>
                                        <label for="med1">Paracetamol</label>
                                    </div>
                                    <div class="checkbox-item">
                                        <input type="checkbox" name="medicines" value="Citrizine" id="med2"
                                            <c:if test="${fn:contains(patient.medicines, 'Citrizine')}">checked</c:if>>
                                        <label for="med2">Citrizine</label>
                                    </div>
                                    <div class="checkbox-item">
                                        <input type="checkbox" name="medicines" value="Azithromycin" id="med3"
                                            <c:if test="${fn:contains(patient.medicines, 'Azithromycin')}">checked</c:if>>
                                        <label for="med3">Azithromycin</label>
                                    </div>
                                    <div class="checkbox-item">
                                        <input type="checkbox" name="medicines" value="Pantab" id="med4"
                                            <c:if test="${fn:contains(patient.medicines, 'Pantab')}">checked</c:if>>
                                        <label for="med4">Pantab</label>
                                    </div>
                                    <div class="checkbox-item">
                                        <input type="checkbox" name="medicines" value="Amoxicillin" id="med5"
                                            <c:if test="${fn:contains(patient.medicines, 'Amoxicillin')}">checked</c:if>>
                                        <label for="med5">Amoxicillin</label>
                                    </div>
                                    <div class="checkbox-item">
                                        <input type="checkbox" name="medicines" value="Dolo-650" id="med6"
                                            <c:if test="${fn:contains(patient.medicines, 'Dolo-650')}">checked</c:if>>
                                        <label for="med6">Dolo-650</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Department:</label>
                            <select name="department">
                                <option value="Cardiology" ${patient.department == 'Cardiology' ? 'selected' : ''}>Cardiology</option>
                                <option value="ENT" ${patient.department == 'ENT' ? 'selected' : ''}>ENT</option>
                                <option value="Neurology" ${patient.department == 'Neurology' ? 'selected' : ''}>Neurology</option>
                                <option value="Orthopedics" ${patient.department == 'Orthopedics' ? 'selected' : ''}>Orthopedics</option>
                                <option value="General" ${patient.department == 'General' ? 'selected' : ''}>General</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Remarks:</label>
                            <textarea name="remarks">${patient.remarks}</textarea>
                        </div>
                    </div>
                </c:if>

                <button type="submit" class="submit-btn">Update Patient Record</button>
            </form>
        </div>
    </div>
</body>
</html>