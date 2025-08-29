<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard - Hospital Management System</title>
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
            background: linear-gradient(135deg, #27ae60, #2ecc71);
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

        /* Quick Actions Section */
        .quick-actions {
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

        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }

        .action-btn {
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
            text-decoration: none;
        }

        .action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.3);
        }

        .action-btn.add-patient {
            background: linear-gradient(135deg, #e67e22, #d35400);
        }

        .action-btn.add-patient:hover {
            box-shadow: 0 8px 25px rgba(230, 126, 34, 0.3);
        }

        /* Filter Section */
        .filter-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
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
        }

        .filter-btn:hover,
        .filter-btn.active {
            background: #27ae60;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.3);
        }

        /* Appointments Section */
        .appointments-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .appointments-header {
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

        .appointments-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .appointments-table th {
            background: #34495e;
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .appointments-table td {
            padding: 15px 12px;
            border-bottom: 1px solid #e9ecef;
            font-size: 0.9rem;
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

        .no-appointments h4 {
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        /* Stats Cards */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
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

        /* CHATBOT STYLES */
        .chatbot-toggle {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            font-size: 24px;
            box-shadow: 0 4px 20px rgba(39, 174, 96, 0.3);
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .chatbot-toggle:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 25px rgba(39, 174, 96, 0.4);
        }

        .chatbot-container {
            position: fixed;
            bottom: 100px;
            right: 30px;
            width: 380px;
            height: 500px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            z-index: 999;
            display: none;
            flex-direction: column;
            overflow: hidden;
            border: 1px solid #e0e6ed;
        }

        .chatbot-header {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
        }

        .chatbot-header h3 {
            margin: 0;
            font-size: 1.2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .chatbot-close {
            position: absolute;
            top: 15px;
            right: 15px;
            background: none;
            border: none;
            color: white;
            font-size: 20px;
            cursor: pointer;
            padding: 5px;
            border-radius: 50%;
            transition: background-color 0.3s ease;
        }

        .chatbot-close:hover {
            background: rgba(255,255,255,0.2);
        }

        .chat-messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 15px;
            background: #f8f9fa;
        }

        .message {
            max-width: 80%;
            padding: 12px 16px;
            border-radius: 18px;
            font-size: 0.9rem;
            line-height: 1.4;
            word-wrap: break-word;
        }

        .message.bot {
            background: #e8f4f8;
            color: #2c3e50;
            align-self: flex-start;
            border-bottom-left-radius: 6px;
        }

        .message.user {
            background: #27ae60;
            color: white;
            align-self: flex-end;
            border-bottom-right-radius: 6px;
        }

        .message.typing {
            background: #e8f4f8;
            color: #7f8c8d;
            align-self: flex-start;
            font-style: italic;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.6; }
        }

        .chat-input-container {
            padding: 20px;
            border-top: 1px solid #e0e6ed;
            background: white;
        }

        .chat-input-wrapper {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .chat-input {
            flex: 1;
            padding: 12px 16px;
            border: 2px solid #e0e6ed;
            border-radius: 25px;
            outline: none;
            font-size: 0.9rem;
            transition: border-color 0.3s ease;
        }

        .chat-input:focus {
            border-color: #27ae60;
        }

        .chat-send {
            background: #27ae60;
            color: white;
            border: none;
            width: 44px;
            height: 44px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .chat-send:hover {
            background: #229954;
            transform: scale(1.05);
        }

        .chat-send:disabled {
            background: #bdc3c7;
            cursor: not-allowed;
            transform: none;
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

            .action-buttons {
                grid-template-columns: 1fr;
            }

            .filter-buttons {
                flex-direction: column;
            }

            .appointments-header {
                flex-direction: column;
                align-items: stretch;
            }

            .appointments-table {
                font-size: 0.8rem;
            }

            .appointments-table th,
            .appointments-table td {
                padding: 10px 8px;
            }

            .stats-row {
                grid-template-columns: 1fr;
            }

            /* Chatbot responsive */
            .chatbot-container {
                width: 320px;
                right: 20px;
                bottom: 90px;
                height: 450px;
            }

            .chatbot-toggle {
                right: 20px;
                width: 50px;
                height: 50px;
                font-size: 20px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }

            .dashboard-header,
            .quick-actions,
            .filter-section,
            .appointments-section {
                padding: 1.5rem;
            }

            .appointments-table {
                font-size: 0.7rem;
            }

            .appointments-table th,
            .appointments-table td {
                padding: 8px 6px;
            }

            /* Chatbot mobile */
            .chatbot-container {
                width: calc(100vw - 20px);
                right: 10px;
                left: 10px;
                bottom: 80px;
                height: 400px;
            }

            .chatbot-toggle {
                right: 15px;
                bottom: 20px;
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

        /* Custom scrollbar for chat */
        .chat-messages::-webkit-scrollbar {
            width: 6px;
        }

        .chat-messages::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .chat-messages::-webkit-scrollbar-thumb {
            background: #bdc3c7;
            border-radius: 10px;
        }

        .chat-messages::-webkit-scrollbar-thumb:hover {
            background: #95a5a6;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <div class="welcome-section">
                <div class="welcome-text">
                    <h1>
                        <i class="fas fa-user-md"></i>
                        Welcome, Doctor
                    </h1>
                    <p>Manage your patients and appointments - Hospital Management System</p>
                </div>
                <form action="/doctor/logout" method="post" style="display: inline;">
                    <button type="submit" class="logout-btn">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </button>
                </form>
            </div>
        </div>

        <!-- Quick Actions Section -->
        <div class="quick-actions">
            <h3 class="section-title">
                <i class="fas fa-bolt"></i> Quick Actions
            </h3>
            <div class="action-buttons">
                <button class="action-btn" onclick="window.location.href='/doctor/viewPatients'">
                    <i class="fas fa-users"></i>
                    View All Patients
                </button>
                <button class="action-btn add-patient" onclick="window.location.href='/doctor/addPatientForm'">
                    <i class="fas fa-user-plus"></i>
                    Add New Patient
                </button>
            </div>
        </div>

        <!-- Stats Row -->
        <div class="stats-row">
            <div class="stat-card today">
                <div class="number">
                    <c:choose>
                        <c:when test="${filter == 'today'}">${appointments.size()}</c:when>
                        <c:otherwise>--</c:otherwise>
                    </c:choose>
                </div>
                <div class="label">Today's Appointments</div>
            </div>
            <div class="stat-card total">
                <div class="number">
                    <c:choose>
                        <c:when test="${filter == 'all'}">${appointments.size()}</c:when>
                        <c:otherwise>--</c:otherwise>
                    </c:choose>
                </div>
                <div class="label">Total Appointments</div>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-section">
            <h3 class="section-title">
                <i class="fas fa-filter"></i> Filter Appointments
            </h3>
            <form action="dashboard" method="get">
                <div class="filter-buttons">
                    <button type="submit" name="filter" value="all" 
                            class="filter-btn ${filter == 'all' ? 'active' : ''}">
                        <i class="fas fa-calendar-alt"></i>
                        All Appointments
                    </button>
                    <button type="submit" name="filter" value="today" 
                            class="filter-btn ${filter == 'today' ? 'active' : ''}">
                        <i class="fas fa-calendar-day"></i>
                        Today's Appointments
                    </button>
                </div>
            </form>
        </div>

        <!-- Appointments Section -->
        <div class="appointments-section">
            <div class="appointments-header">
                <h3 class="section-title">
                    <i class="fas fa-calendar-check"></i> Appointments
                </h3>
                <div class="showing-info">
                    <i class="fas fa-info-circle"></i>
                    Showing: ${filter} appointments
                </div>
            </div>

            <c:if test="${empty appointments}">
                <div class="no-appointments">
                    <i class="fas fa-calendar-times"></i>
                    <h4>No Appointments Found</h4>
                    <p>There are no ${filter} appointments to display at this time.</p>
                </div>
            </c:if>

            <c:if test="${not empty appointments}">
                <div class="table-container">
                    <table class="appointments-table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag"></i> ID</th>
                                <th><i class="fas fa-calendar-alt"></i> Date</th>
                                <th><i class="fas fa-stethoscope"></i> Consultation</th>
                                <th><i class="fas fa-hospital"></i> Department</th>
                                <th><i class="fas fa-user"></i> Patient ID</th>
                                <th><i class="fas fa-info-circle"></i> Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="appt" items="${appointments}">
                                <tr>
                                    <td>${appt.appointmentId}</td>
                                    <td>${appt.appointmentDate}</td>
                                    <td>${appt.consultationType}</td>
                                    <td>${appt.department}</td>
                                    <td>${appt.patientId}</td>
                                    <td>
                                        <span class="status-badge status-${appt.status.toLowerCase()}">${appt.status}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>

    <!-- CHATBOT -->
    <button class="chatbot-toggle" id="chatbotToggle">
        <i class="fas fa-robot"></i>
    </button>

    <div class="chatbot-container" id="chatbotContainer">
        <div class="chatbot-header">
            <h3><i class="fas fa-robot"></i> Medical Assistant</h3>
            <button class="chatbot-close" id="chatbotClose">
                <i class="fas fa-times"></i>
            </button>
        </div>
        
        <div class="chat-messages" id="chatMessages">
            <div class="message bot">
                Hey Doc! May I help you out? I can assist you with medical queries, medication recommendations, and general health information.
            </div>
        </div>
        
        <div class="chat-input-container">
            <div class="chat-input-wrapper">
                <input type="text" class="chat-input" id="chatInput" placeholder="Ask me about medications, symptoms, treatments..." maxlength="500">
                <button class="chat-send" id="chatSend">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </div>
    </div>

    <script>
        class MedicalChatbot {
            constructor() {
                this.chatbotToggle = document.getElementById('chatbotToggle');
                this.chatbotContainer = document.getElementById('chatbotContainer');
                this.chatbotClose = document.getElementById('chatbotClose');
                this.chatMessages = document.getElementById('chatMessages');
                this.chatInput = document.getElementById('chatInput');
                this.chatSend = document.getElementById('chatSend');
                this.isTyping = false;

                this.initEventListeners();
            }

            initEventListeners() {
                this.chatbotToggle.addEventListener('click', () => this.toggleChatbot());
                this.chatbotClose.addEventListener('click', () => this.closeChatbot());
                this.chatSend.addEventListener('click', () => this.sendMessage());
                this.chatInput.addEventListener('keypress', (e) => {
                    if (e.key === 'Enter') {
                        this.sendMessage();
                    }
                });
            }

            toggleChatbot() {
                const isVisible = this.chatbotContainer.style.display === 'flex';
                this.chatbotContainer.style.display = isVisible ? 'none' : 'flex';
                
                if (!isVisible) {
                    this.chatInput.focus();
                    this.scrollToBottom();
                }
            }

            closeChatbot() {
                this.chatbotContainer.style.display = 'none';
            }

            async sendMessage() {
                const message = this.chatInput.value.trim();
                if (!message || this.isTyping) return;

                // Add user message
                this.addMessage(message, 'user');
                this.chatInput.value = '';
                this.chatSend.disabled = true;

                // Show typing indicator
                this.showTyping();

                try {
                    // Get bot response
                    const response = await this.getBotResponse(message);
                    this.hideTyping();
                    this.addMessage(response, 'bot');
                } catch (error) {
                    this.hideTyping();
                    this.addMessage('Sorry, I encountered an error. Please try again later.', 'bot');
                    console.error('Chatbot error:', error);
                }

                this.chatSend.disabled = false;
                this.chatInput.focus();
            }

            addMessage(text, sender) {
                const messageDiv = document.createElement('div');
                messageDiv.className = 'message ' + sender;
                messageDiv.textContent = text;
                
                this.chatMessages.appendChild(messageDiv);
                this.scrollToBottom();
            }

            showTyping() {
                this.isTyping = true;
                const typingDiv = document.createElement('div');
                typingDiv.className = 'message typing';
                typingDiv.id = 'typing-indicator';
                typingDiv.textContent = 'Assistant is typing...';
                
                this.chatMessages.appendChild(typingDiv);
                this.scrollToBottom();
            }

            hideTyping() {
                this.isTyping = false;
                const typingIndicator = document.getElementById('typing-indicator');
                if (typingIndicator) {
                    typingIndicator.remove();
                }
            }

            scrollToBottom() {
                this.chatMessages.scrollTop = this.chatMessages.scrollHeight;
            }

            async getBotResponse(userMessage) {
                const message = userMessage.toLowerCase();
                
                // Try to get Wikipedia search results for better responses
                try {
                    const searchResponse = await this.searchWikipedia(userMessage);
                    if (searchResponse) {
                        return searchResponse;
                    }
                } catch (error) {
                    console.log('Search failed, falling back to local knowledge:', error);
                }
                
                // Fallback to local medical knowledge base
                return this.getLocalMedicalResponse(message);
            }

            async searchWikipedia(query) {
                try {
                    // Add medical terms to improve search
                    const medicalQuery = query + " medicine medical treatment";
                    // Use string concatenation instead of template literals to avoid JSP EL conflicts
                    const searchUrl = "https://en.wikipedia.org/api/rest_v1/page/summary/" + encodeURIComponent(medicalQuery);
                    
                    const response = await fetch(searchUrl);
                    if (response.ok) {
                        const data = await response.json();
                        if (data.extract && data.extract.length > 50) {
                            const extract = data.extract.substring(0, 400);
                            return "Based on medical literature: " + extract + "...\n\nSource: Wikipedia Medical Information\nPlease verify with current medical guidelines and consider individual patient factors.";
                        }
                    }
                } catch (error) {
                    console.error('Wikipedia search failed:', error);
                }
                return null;
            }

            getLocalMedicalResponse(message) {
                // Comprehensive local medical knowledge base
                if (this.containsAny(message, ['headache', 'head pain', 'migraine'])) {
                    return "For headaches: Consider acetaminophen (500-1000mg) or ibuprofen (400-600mg). For migraines, triptans like sumatriptan may be effective. Always assess for underlying causes and contraindications. Recommend rest, hydration, and follow-up if persistent.";
                }
                
                if (this.containsAny(message, ['fever', 'temperature', 'pyrexia'])) {
                    return "For fever management: Acetaminophen 650-1000mg q6h or ibuprofen 400-600mg q8h. Monitor temperature, ensure hydration. Investigate underlying cause if >101.3°F (38.5°C) persists >3 days or if patient appears toxic.";
                }
                
                if (this.containsAny(message, ['cough', 'coughing'])) {
                    return "For cough: Dry cough - dextromethorphan 15-30mg q4-6h. Productive cough - guaifenesin 200-400mg q4h with increased fluids. Consider underlying causes (viral, bacterial, allergic). Refer if persistent >2 weeks.";
                }
                
                if (this.containsAny(message, ['hypertension', 'high blood pressure', 'bp'])) {
                    return "Hypertension management: First-line: ACE inhibitors (lisinopril 10-20mg), ARBs (losartan 50-100mg), thiazide diuretics (HCTZ 25-50mg), or calcium channel blockers (amlodipine 5-10mg). Target <140/90 or <130/80 for high-risk patients.";
                }
                
                if (this.containsAny(message, ['diabetes', 'blood sugar', 'glucose'])) {
                    return "Type 2 diabetes: Start with metformin 500-1000mg BID with meals. Add sulfonylureas, SGLT2 inhibitors, or insulin as needed. Monitor HbA1c q3-6 months. Target HbA1c <7% for most adults. Consider lifestyle modifications.";
                }
                
                if (this.containsAny(message, ['antibiotic', 'infection', 'bacterial'])) {
                    return "Common antibiotics: UTI - trimethoprim/sulfamethoxazole or nitrofurantoin. Skin infections - cephalexin or clindamycin. Respiratory - amoxicillin or azithromycin. Always consider culture/sensitivity and local resistance patterns.";
                }
                
                if (this.containsAny(message, ['anxiety', 'panic', 'stress'])) {
                    return "Anxiety management: Non-pharmacological: CBT, relaxation techniques. Pharmacological: SSRIs (sertraline 50-200mg), benzodiazepines for short-term (lorazepam 0.5-2mg). Avoid long-term benzodiazepine use due to dependence risk.";
                }
                
                if (this.containsAny(message, ['depression', 'mood', 'sad'])) {
                    return "Depression treatment: First-line SSRIs (sertraline 50-200mg, escitalopram 10-20mg) or SNRIs (venlafaxine 75-225mg). Consider psychotherapy. Monitor for suicidal ideation, especially in first 4-6 weeks of treatment.";
                }
                
                if (this.containsAny(message, ['pain', 'analgesic', 'painkiller'])) {
                    return "Pain management: Mild pain - acetaminophen 650-1000mg q6h. Moderate pain - ibuprofen 400-800mg q8h or naproxen 220-440mg q12h. Severe pain may require opioids (use cautiously). Consider topical options for localized pain.";
                }
                
                if (this.containsAny(message, ['allergy', 'allergic', 'antihistamine'])) {
                    return "Allergy treatment: Antihistamines - loratadine 10mg daily, cetirizine 10mg daily, or diphenhydramine 25-50mg q6h. For severe reactions, consider corticosteroids. Epinephrine for anaphylaxis. Identify and avoid triggers.";
                }
                
                if (this.containsAny(message, ['asthma', 'wheeze', 'breathing'])) {
                    return "Asthma management: Quick relief - albuterol inhaler 2 puffs q4-6h PRN. Long-term control - inhaled corticosteroids (fluticasone, budesonide). Severe exacerbations may require oral prednisone. Monitor peak flow, avoid triggers.";
                }
                
                if (this.containsAny(message, ['nausea', 'vomiting', 'antiemetic'])) {
                    return "Nausea/vomiting: Ondansetron 4-8mg q8h, metoclopramide 10mg q6h, or promethazine 12.5-25mg q4-6h. Consider IV fluids for dehydration. Investigate underlying causes if persistent.";
                }
                
                if (this.containsAny(message, ['insomnia', 'sleep', 'sleeping'])) {
                    return "Sleep disorders: Sleep hygiene first. Short-term: zolpidem 5-10mg, eszopiclone 1-3mg at bedtime. Avoid long-term use. Consider melatonin 1-3mg. Address underlying anxiety/depression if present.";
                }
                
                if (this.containsAny(message, ['dosage', 'dose', 'how much'])) {
                    return "Always verify dosages based on patient weight, age, kidney/liver function, and other medications. Check drug interactions. Start with lowest effective dose and titrate as needed. Consult current prescribing information.";
                }
                
                if (this.containsAny(message, ['side effects', 'adverse', 'reactions'])) {
                    return "Monitor for common side effects and drug interactions. Educate patients on what to watch for. Report serious adverse events. Consider patient allergies and contraindications before prescribing.";
                }
                
                if (this.containsAny(message, ['heart', 'cardiac', 'chest pain'])) {
                    return "Cardiac assessment: For chest pain, rule out MI with ECG, troponins. Angina management: nitroglycerin SL, beta-blockers, ACE inhibitors. Heart failure: diuretics, ACE inhibitors, beta-blockers. Always consider emergency referral for acute symptoms.";
                }
                
                if (this.containsAny(message, ['cholesterol', 'lipids', 'statin'])) {
                    return "Lipid management: Statins first-line (atorvastatin 20-80mg, simvastatin 20-40mg). Target LDL <100 mg/dL (or <70 for high risk). Monitor liver function. Consider ezetimibe or PCSK9 inhibitors if statins inadequate.";
                }
                
                if (this.containsAny(message, ['thyroid', 'hypothyroid', 'hyperthyroid'])) {
                    return "Thyroid disorders: Hypothyroid - levothyroxine 25-100mcg daily, adjust based on TSH. Hyperthyroid - methimazole or propylthiouracil, beta-blockers for symptoms. Monitor TSH, T3, T4 levels regularly.";
                }
                
                if (this.containsAny(message, ['pneumonia', 'lung infection'])) {
                    return "Pneumonia treatment: Community-acquired: amoxicillin/clavulanate or macrolides. Hospitalized: ceftriaxone + azithromycin. Consider atypical coverage. Duration typically 5-7 days. Monitor for complications.";
                }
                
                if (this.containsAny(message, ['uti', 'urinary tract infection', 'bladder infection'])) {
                    return "UTI treatment: Uncomplicated: trimethoprim/sulfamethoxazole 3 days, nitrofurantoin 5 days, or fosfomycin single dose. Complicated/pyelonephritis: ciprofloxacin 7-14 days. Always get culture in recurrent cases.";
                }
                
                if (this.containsAny(message, ['diarrhea', 'gastroenteritis'])) {
                    return "Diarrhea management: Supportive care with fluids/electrolytes primary. Loperamide for symptomatic relief if no fever/blood. Antibiotics only if bacterial (ciprofloxacin or azithromycin). Consider C. diff if recent antibiotic use.";
                }
                
                if (this.containsAny(message, ['constipation'])) {
                    return "Constipation treatment: Lifestyle first (fiber, fluids, exercise). Medications: polyethylene glycol, docusate sodium, senna. For chronic: lubiprostone or linaclotide. Rule out obstruction in severe cases.";
                }
                
                if (this.containsAny(message, ['rash', 'skin', 'dermatitis'])) {
                    return "Skin conditions: Eczema/dermatitis - topical corticosteroids (hydrocortisone 1%, triamcinolone 0.1%). Fungal - antifungals (clotrimazole, terbinafine). Bacterial - topical mupirocin or oral antibiotics. Moisturize regularly.";
                }
                
                if (this.containsAny(message, ['acne'])) {
                    return "Acne treatment: Mild - topical retinoids (tretinoin, adapalene) + benzoyl peroxide. Moderate - add topical antibiotics (clindamycin). Severe - oral antibiotics (doxycycline, minocycline) or isotretinoin for resistant cases.";
                }
                
                if (this.containsAny(message, ['joint pain', 'arthritis'])) {
                    return "Joint pain/arthritis: NSAIDs first-line (ibuprofen, naproxen) if no contraindications. Topical options for localized pain. Rheumatoid arthritis may need DMARDs (methotrexate). Physical therapy important for mobility.";
                }
                
                if (this.containsAny(message, ['back pain'])) {
                    return "Back pain management: Acute - NSAIDs, muscle relaxants (cyclobenzaprine) short-term, maintain activity. Chronic - consider gabapentin for neuropathic component. Physical therapy, avoid prolonged bed rest. Red flags warrant immediate evaluation.";
                }
                
                if (this.containsAny(message, ['vitamin', 'deficiency'])) {
                    return "Common deficiencies: Vitamin D - 1000-4000 IU daily. B12 - 1000mcg daily or monthly injections. Iron deficiency - ferrous sulfate 325mg daily with vitamin C. Always confirm with labs before supplementing.";
                }
                
                if (this.containsAny(message, ['birth control', 'contraception'])) {
                    return "Contraception options: Combined OCPs, progestin-only pills, IUDs (hormonal/copper), implants, injections. Consider patient factors: age, smoking, clot risk, menstrual issues. Counsel on effectiveness and side effects.";
                }
                
                if (this.containsAny(message, ['pregnancy', 'prenatal'])) {
                    return "Prenatal care: Folic acid 400-800mcg daily, prenatal vitamins. Avoid teratogens (alcohol, certain medications). Regular monitoring: BP, weight, urine protein, fetal heart rate. Screen for gestational diabetes, Group B strep.";
                }
                
                if (this.containsAny(message, ['menopause', 'hormone therapy'])) {
                    return "Menopause management: Lifestyle modifications first. Hormone therapy for moderate-severe symptoms (lowest dose, shortest duration). Non-hormonal options: SSRIs, gabapentin, clonidine for hot flashes. Regular bone density screening.";
                }
                
                if (this.containsAny(message, ['pediatric', 'children', 'infant'])) {
                    return "Pediatric considerations: Weight-based dosing crucial. Fever management: acetaminophen (10-15mg/kg) or ibuprofen >6 months (5-10mg/kg). Avoid aspirin <18 years. Different drug metabolism and contraindications in children.";
                }
                
                if (this.containsAny(message, ['elderly', 'geriatric'])) {
                    return "Geriatric care: Start low, go slow with medications. Beers Criteria for inappropriate drugs. High fall risk - review sedating medications. Multiple comorbidities require careful drug interaction monitoring. Consider polypharmacy effects.";
                }
                
                if (this.containsAny(message, ['vaccine', 'immunization'])) {
                    return "Vaccinations: Annual flu vaccine for all >6 months. COVID-19 per current guidelines. Adults: Tdap every 10 years, pneumococcal, shingles >50. Travel vaccines as indicated. Check contraindications and timing.";
                }
                
                if (this.containsAny(message, ['smoking', 'tobacco', 'cessation'])) {
                    return "Smoking cessation: Counseling + pharmacotherapy most effective. Nicotine replacement therapy, varenicline (Chantix), or bupropion (Zyban). Counsel on quit date, triggers, support systems. Multiple attempts often needed.";
                }
                
                if (this.containsAny(message, ['alcohol', 'drinking'])) {
                    return "Alcohol use: Screen with AUDIT questionnaire. Moderate drinking: ≤1 drink/day women, ≤2 men. Withdrawal management may need benzodiazepines, thiamine. Consider naltrexone, acamprosate for dependence treatment.";
                }
                
                if (this.containsAny(message, ['hello', 'hi', 'hey', 'help'])) {
                    return "Hello Doctor! I'm here to help with medical queries. You can ask me about medications, treatments, dosages, common conditions, or general medical information. How can I assist you today?";
                }
                
                if (this.containsAny(message, ['thank', 'thanks'])) {
                    return "You're welcome, Doctor! I'm here whenever you need medical assistance. Feel free to ask me anything else!";
                }
                
                // Default response for unrecognized queries
                return "I understand you're asking about a medical topic. While I can provide general medical information about common conditions and treatments, please remember to always verify information with current medical literature and consider individual patient factors. Could you be more specific about what you'd like to know?";
            }

            containsAny(text, keywords) {
                return keywords.some(keyword => text.includes(keyword));
            }
        }

        // Initialize chatbot when page loads
        document.addEventListener('DOMContentLoaded', function() {
            new MedicalChatbot();
        });
    </script>
</body>
</html>