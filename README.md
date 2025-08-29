# 🏥 Hospital Management System

The **Hospital Management System (HMS)** is a full-stack web application designed to digitalize and streamline hospital operations.  
Built with **Java (Spring Boot, JSP)** and **MySQL**, it provides a secure, scalable platform for managing patients, staff, appointments, billing, and medicines.  
With **role-based access control** and **AI-powered diagnostic assistance**, it enhances efficiency, accuracy, and patient care in hospitals.

## 🌐 Live Demo (localhost only)
- **Home Page:** http://localhost:8080/home  
- **System Dashboard:** http://localhost:8080/dashboard  
- **Admin Portal:** http://localhost:8080/admin/login

---

## 🚀 Key Features  

- **Role-based Authentication & Authorization** → Secure dashboards for Admin, Doctor, Pharmacist, Receptionist, Nurse, Support Staff, and Patient  
- **Patient Management** → Registration, appointments, medical history, prescriptions, and billing  
- **Online Appointment Scheduling** → Book appointments online/offline with ease  
- **AI-powered Doctor Assistant** → Diagnostic support with disease/symptom queries & recommendations  
- **Pharmacy Module with Payment Verification** → Medicines dispensed only after balance = 0  
- **Staff Management** → CRUD operations for doctors, nurses, receptionists, pharmacists, and support staff  
- **Real-time Analytics & Admin Dashboard** → Daily revenue, patient flow, staff count, and hospital statistics  
- **Comprehensive Search & Filtering** → Patients, appointments, staff, and records  
- **Secure Session Handling** → Implemented with Spring Security for data protection  
- **100+ REST APIs** → Modular and scalable endpoints for all hospital operations  

---

## 🏥 System Flow Overview

### Patient Journey Workflow
- **Online Appointment Booking** - Patients can book appointments from home without queuing  
- **Registration Process** - New patients register with phone, Aadhaar (unique identifiers), name, age, etc.  
- **Department Selection** - Choose from ENT, Eye, Cardiology, etc.  
- **Receptionist Check-in** - Offline patients register at reception desk  
- **Doctor Consultation** - Doctor updates medical records, prescriptions  
- **Billing Process** - Receptionist calculates consultancy + medicine fees  
- **Medicine Dispensing** - Pharmacist verifies payment before dispensing medicines  

### Payment-Medicine Verification Flow
- **Patient Bill:** ₹500 (Consultancy + Medicine)  
- **Balance Amount:** ₹0 → Pharmacist can dispense medicine  
- **Balance Amount:** >₹0 → *"Payment Pending - Cannot dispense medicine"*  

---

## 🔗 System Access Points

### Home Page (`/home`)
**Public Website Features:**  
- Hero section with hospital information  
- Book Appointment (for patients at home)  
- About Developer  
- About Us (hospital information)  
- Services overview  
- Contact information  
- Login portal (redirects to role-specific dashboards)  

### Dashboard Access (`/dashboard`)
**Role-based Portal Access:**  
- Admin Portal  
- Doctor Portal  
- Pharmacist Portal  
- Receptionist Portal  

---

## 👥 User Roles & Detailed Features

### Admin Dashboard (`/admin/dashboard`)
**Real-time Analytics:**  
- Today's Appointments count  
- Today's Revenue vs Total Revenue  
- Total Registered Patients  
- Total Staff count  

**Staff Management Buttons:**  
- Manage Doctors  
- Manage Pharmacists  
- Manage Nurses  
- Manage Support Staff  
- Manage Appointments  

**Individual Staff Tables:**  
- Separate tables for Doctors, Nurses, Receptionists, Patients, Support Staff  
- Each table shows complete staff details  
- Individual row actions: Update, Delete buttons  

**Admin Role Management (`/admin/manage?role=DOCTOR`)**  
For Each Role (Doctor, Nurse, Receptionist, Pharmacist, Support Staff):  
- Add new staff member form  
- Existing staff list with full details  
- Row-level actions: Update button, Delete button  
- Complete CRUD operations  

---

### Doctor Dashboard (`/doctor/dashboard`)
**Core Functions:**  
- View All Patients button  
- Add New Patient button  
- Today's Appointments counter  
- Total Appointments counter  

**Appointment Filtering:**  
- All Appointments  
- Today's Appointments only  

**Patient Management:**  
- Complete patient list with search functionality  
- Search by: Patient ID, Name, Aadhaar Number, Phone Number  
- Row actions: Update, Edit, Delete buttons  

**AI Diagnostic Assistant:**  
- Integrated AI chatbot in doctor dashboard  
- Ask questions about diseases, symptoms, diagnostics  
- Pre-trained medical knowledge base  
- Real-time diagnostic support  

**Doctor Patient Updates:**  
When doctor clicks Edit Patient:  
- Update Medicines/Tablets  
- Medical History  
- Instructions  
- Recommendations  
- Remarks  

---

### Pharmacist Dashboard (`/pharmacist/dashboard`)
**Patient List Management:**  
- Complete patient list with search functionality  
- Payment status verification for each patient  

**Medicine Dispensing Logic:**  
- **Bill Amount: ₹500**  
- **Balance Amount: ₹0 →** "Ready for Medicine Dispensing" (Green status)  
- **Balance Amount: ₹200 →** "Payment Pending - Cannot Give Medicine" (Red status)  

**Workflow Integration:**  
- Doctor prescribes medicines → Updates patient record  
- Patient visits Receptionist → Gets outpatient sheet  
- Receptionist updates medicine bill + consultancy fee  
- Receptionist sets Balance Amount = ₹0 after payment  
- Pharmacist verifies balance = ₹0 → Dispenses medicine  
- Updates medicine status to "Given"  

---

### Receptionist Workflow
**Patient Registration:**  
- Collect patient details (Phone, Aadhaar - unique identifiers)  
- Department selection (ENT, Eye, Cardiology, etc.)  
- Generate receipt with consultancy fees  
- Update patient billing information  

**Billing Management:**  
- Calculate medicine costs (based on doctor's prescription)  
- Combine consultancy fee + medicine bill  
- Process payments and update balance amount  
- Generate additional paperwork for pharmacy  

---

## ⚙️ Technical Architecture

### Package Structure
```
📁 Hospital-Management-System [boot] [devtools]
├── 📁 src
│   ├── 📁 main
│   │   ├── 📁 java
│   │   │   └── 📁 com.hemanth.hospital
│   │   │       ├── 📄 HospitalManagementSystemApplication.java
│   │   │       │
│   │   │       ├── 📁 config
│   │   │       │   ├── 📄 NoCacheInterceptor.java
│   │   │       │   └── 📄 WebConfig.java
│   │   │       │
│   │   │       ├── 📁 controller
│   │   │       │   ├── 📄 AdminController.java
│   │   │       │   ├── 📄 AppointmentController.java
│   │   │       │   ├── 📄 AuthController.java
│   │   │       │   ├── 📄 BillController.java
│   │   │       │   ├── 📄 DoctorController.java
│   │   │       │   ├── 📄 HomeController.java
│   │   │       │   ├── 📄 MedicineController.java
│   │   │       │   ├── 📄 NurseController.java
│   │   │       │   ├── 📄 PatientController.java
│   │   │       │   ├── 📄 PharmacistController.java
│   │   │       │   ├── 📄 ReceptionistController.java
│   │   │       │   └── 📄 SupportStaffController.java
│   │   │       │
│   │   │       ├── 📁 exception
│   │   │       │   ├── 📄 GlobalExceptionHandler.java
│   │   │       │   └── 📄 PatientNotFoundException.java
│   │   │       │
│   │   │       ├── 📁 models
│   │   │       │   ├── 📄 Admin.java
│   │   │       │   ├── 📄 Appointment.java
│   │   │       │   ├── 📄 Bill.java
│   │   │       │   ├── 📄 Doctor.java
│   │   │       │   ├── 📄 Medicine.java
│   │   │       │   ├── 📄 Nurse.java
│   │   │       │   ├── 📄 Patient.java
│   │   │       │   ├── 📄 Pharmacist.java
│   │   │       │   ├── 📄 Receptionist.java
│   │   │       │   ├── 📄 SupportStaff.java
│   │   │       │   └── 📄 User.java
│   │   │       │
│   │   │       ├── 📁 repository
│   │   │       │   ├── 📄 AdminRepository.java
│   │   │       │   ├── 📄 AppointmentRepository.java
│   │   │       │   ├── 📄 BillRepository.java
│   │   │       │   ├── 📄 DoctorRepository.java
│   │   │       │   ├── 📄 MedicineRepository.java
│   │   │       │   ├── 📄 NurseRepository.java
│   │   │       │   ├── 📄 PatientRepository.java
│   │   │       │   ├── 📄 PharmacistRepository.java
│   │   │       │   ├── 📄 ReceptionistRepository.java
│   │   │       │   ├── 📄 SupportStaffRepository.java
│   │   │       │   └── 📄 UserRepository.java
│   │   │       │
│   │   │       └── 📁 service
│   │   │           ├── 📄 AdminService.java
│   │   │           ├── 📄 AppointmentService.java
│   │   │           ├── 📄 BillService.java
│   │   │           ├── 📄 DoctorService.java
│   │   │           ├── 📄 MedicineService.java
│   │   │           ├── 📄 NurseService.java
│   │   │           ├── 📄 PatientService.java
│   │   │           ├── 📄 PharmacistService.java
│   │   │           ├── 📄 ReceptionistService.java
│   │   │           ├── 📄 SupportStaffService.java
│   │   │           └── 📄 UserService.java
│   │   │
│   │   ├── 📁 resources
│   │   │   ├── 📄 application.properties
│   │   │   ├── 📄 application.yml
│   │   │   └── 📁 static
│   │   │       ├── 📁 css
│   │   │       ├── 📁 js
│   │   │       └── 📁 images
│   │   │
│   │   └── 📁 webapp
│   │       └── 📁 WEB-INF
│   │           └── 📁 views
│   │               ├── 📄 about-us.jsp
│   │               ├── 📄 add-medicine.jsp
│   │               ├── 📄 add-patient.jsp
│   │               ├── 📄 admin-dashboard.jsp
│   │               ├── 📄 admin-login.jsp
│   │               ├── 📄 admin-register.jsp
│   │               ├── 📄 dashboard.jsp
│   │               ├── 📄 developer-contact.jsp
│   │               ├── 📄 doctor-dashboard.jsp
│   │               ├── 📄 doctor-login.jsp
│   │               ├── 📄 edit-patient.jsp
│   │               ├── 📄 home.jsp
│   │               ├── 📄 manage-role.jsp
│   │               ├── 📄 online-patient-login.jsp
│   │               ├── 📄 online-patient-register.jsp
│   │               ├── 📄 patient-appointment.jsp
│   │               ├── 📄 patient-dashboard.jsp
│   │               ├── 📄 pharmacist-dashboard.jsp
│   │               ├── 📄 pharmacist-login.jsp
│   │               ├── 📄 receptionist-dashboard.jsp
│   │               ├── 📄 receptionist-login.jsp
│   │               ├── 📄 view-medicines.jsp
│   │               └── 📄 view-patients.jsp
│   │
│   └── 📁 test
│       └── 📁 java
│           └── 📁 com.hemanth.hospital
│               ├── 📄 HospitalManagementSystemApplicationTests.java
│               ├── 📁 controller
│               │   ├── 📄 AdminControllerTest.java
│               │   ├── 📄 DoctorControllerTest.java
│               │   └── 📄 PatientControllerTest.java
│               ├── 📁 service
│               │   ├── 📄 AdminServiceTest.java
│               │   ├── 📄 DoctorServiceTest.java
│               │   └── 📄 PatientServiceTest.java
│               └── 📁 repository
│                   ├── 📄 AdminRepositoryTest.java
│                   ├── 📄 DoctorRepositoryTest.java
│                   └── 📄 PatientRepositoryTest.java
│
│
├── 📄 pom.xml
├── 📄 mvnw
├── 📄 mvnw.cmd
├── 📄 HELP.md
└── 📄 README.md
```

## 🗂️ Package Structure Overview

### 📦 Main Packages

**🔧 Configuration (`config/`)**
- `NoCacheInterceptor.java` - Prevents caching of sensitive data
- `WebConfig.java` - Spring MVC configuration

**🎮 Controllers (`controller/`)** - 100+ API endpoints
- `AdminController.java` - Admin management operations
- `DoctorController.java` - Doctor dashboard & patient management
- `PatientController.java` - Patient operations & appointments
- `PharmacistController.java` - Medicine dispensing logic
- `ReceptionistController.java` - Registration & billing
- `HomeController.java` - Public pages routing

**🏥 Models (`models/`)** - Database entities
- `Patient.java` - Patient entity with Aadhaar/Phone unique constraints
- `Doctor.java` - Doctor profile & department info
- `Appointment.java` - Appointment booking system
- `Bill.java` - Billing & payment tracking
- `Medicine.java` - Medicine inventory management

**💾 Repository (`repository/`)** - Data access layer
- JPA repositories for CRUD operations
- Custom queries for search functionality
- Patient search by ID/Name/Aadhaar/Phone

**🔧 Service (`service/`)** - Business logic layer
- Role-based access control
- Payment verification logic
- Appointment scheduling
- AI diagnostic integration

**🎨 Views (`webapp/WEB-INF/views/`)**
- JSP files for frontend
- Role-specific dashboards
- Patient management forms
- Billing interfaces

---

## 🖥️ Technology Stack

- **Backend:** Spring Boot  
- **Frontend:** JSP (Java Server Pages)  
- **Database:** MySQL with Hibernate ORM  
- **Security:** Spring Boot Security + Session Handling  
- **Architecture:** MVC Pattern  
- **AI Integration:** Medical diagnostic chatbot  
- **APIs:** 100+ RESTful endpoints  

---

## 🗄️ Database Schema Features

**Unique Identifiers:**  
- Phone numbers (unique constraint)  
- Aadhaar numbers (unique constraint)  
- Patient ID auto-generation  
- Staff ID management  

**Relational Design:**  
- Patient-Doctor relationships  
- Appointment-Patient mapping  
- Bill-Patient associations  
- Medicine-Prescription links  

---

## 🔒 Security Implementation

**Session Management:**  
- Role-based session handling  
- Secure logout functionality  
- Session timeout configuration  
- Route protection  

**Access Control:**  
- Admin: Full system access  
- Doctor: Patient records + AI assistant  
- Pharmacist: Payment verification + medicine dispensing  
- Receptionist: Registration + billing  
- Patient: Personal dashboard + appointments  

---

## ⚡ Quick Setup Guide

### Prerequisites
- Java 8+  
- Maven 3.6+  
- MySQL Database  
- IDE (IntelliJ/Eclipse)  

### Installation Steps
```bash
# Clone repository
git clone <repository-url>
cd hospital-management-system

# Configure MySQL in src/main/resources/application.properties
spring.datasource.url=jdbc:mysql://localhost:3306/hospital_db
spring.datasource.username=root
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update

# Build and run
mvn clean install
mvn spring-boot:run

# Access system(localhost only)
http://localhost:8080/home
```

---

## 🌍 System URLs

### Public Access
- Home: http://localhost:8080/home  
- Dashboard: http://localhost:8080/dashboard  

### Role-specific Login
- Admin: http://localhost:8080/admin/login  
- Doctor: http://localhost:8080/doctor/login  
- Pharmacist: http://localhost:8080/pharmacist/login  
- Receptionist: http://localhost:8080/receptionist/login  
- Patient: http://localhost:8080/patients/login  

### Management URLs
- Doctor Management: http://localhost:8080/admin/manage?role=DOCTOR  
- Nurse Management: http://localhost:8080/admin/manage?role=NURSE  
- Pharmacist Management: http://localhost:8080/admin/manage?role=PHARMACIST
- Nurse Management: http://localhost:8080/admin/manage?role=RECEPTIONIST  
- Nurse Management: http://localhost:8080/admin/manage?role=SUPPORTSTAFF  


---

## 📡 API Endpoints Summary

### Authentication (5 endpoints)
- POST /admin/login  
- POST /doctor/login  
- POST /pharmacist/login  
- POST /receptionist/login  
- POST /patients/login  

### Patient Management (15+ endpoints)
- GET  /doctor/viewPatients  
- POST /doctor/addPatient  
- POST /doctor/updatePatient  
- GET  /doctor/deletePatient  
- GET  /patients/dashboard/{id}  

### Appointment System (8+ endpoints)
- GET  /appointments/book/{patientId}  
- POST /appointments/save  
- GET  /doctor/dashboard?filter=today  
- GET  /receptionist/dashboard?filter=all  

### Medicine Dispensing (6+ endpoints)
- GET  /pharmacist/dashboard  
- POST /pharmacist/viewPatient
- GET  /pharmacist/checkPaymentStatus  
- POST /pharmacist/updateMedicineStatus  

### Admin Management (20+ endpoints)
- GET  /admin/manage?role={ROLE}  
- POST /admin/addUser  
- POST /admin/updateUser  
- GET  /admin/deleteUser  
- GET  /admin/dashboard  

### AI Diagnostic (5+ endpoints)
- GET  /doctor/ai-diagnostics  
- POST /doctor/ai-query  
- GET  /doctor/ai-history  

**Total APIs:** 100*+ endpoints  

---

## 🖼️ UI Screenshots

### HMS home Screen  
![Home Screen](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/HMS_home.png)

### HMS home Screen2
![Detailed Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/HMS_home2.png)

### HMS home Screen3
![Language Switch](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/HMS_home3.png)

### HMS dashboard
![En-Hi Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/HMS_dashboard.png)

### Admin login
![Translation History](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Admin_login.png)

### Admin dashboard
![En-Hi Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Admin_dashboard.png)

### Admin dashboard2
![Home Screen](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Admin_dashboard2.png)

### Admin manage role
![Detailed Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Admin_manageRole.png)

### Developer contact
![Language Switch](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Developer_contact.png)

### Doctor dashboard
![Translation History](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Doctor_dashboard.png)

### Doctor edit patient
![En-Hi Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Doctor_editPatient.png)

### Doctor view patients
![En-Hi Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Doctor_viewPatients.png)

### Patient dashboard
![En-Hi Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/Patient_dashboard.png)

### HMS aboutUs  
![En-Hi Translation](https://github.com/HemanthsaiBurla/Hospital-Management-System/blob/main/UI_images/HMS_aboutUs.png)

---

## 👨‍💻 Developed By

**Hemanth Sai Burla**  
🌐 **Portfolio:** [hemanthsaiBurla](https://hemanthsaiburla.netlify.app)  
💻 **GitHub:** [HemanthsaiBurla](https://github.com/HemanthsaiBurla)  
🌐 **LinkedIn:** [HemanthSai Burla](https://www.linkedin.com/in/hemanthsaiburla/)  
📬 **Email:** hemanthsaiburla@gmail.com

---

## 👨‍💻 Support & Development
- **Main Package:** hospital-management-system  
- **Root Package:** com.hemanth.hospital  
- **Frontend Technology:** JSP with responsive design  
- **Backend Framework:** Spring Boot with comprehensive security  

---

## 📜 License
MIT License  

---

## ⭐ Show Your Support

If this project helped you:
- ⭐ **Star the repository**
- 🍴 **Fork for your projects**  
- 📢 **Share with friends**
- 🐛 **Report bugs or suggest features**

---

*Made with ❤️ by [HemanthSai Burla](https://www.linkedin.com/in/hemanthsaiburla/) | Full-stack Hospital Management System with AI integration*

**Last Updated:** August 2025
