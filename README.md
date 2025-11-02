# 🏥 Healora App

A modern mobile healthcare system designed to connect **patients** and **doctors** seamlessly within a single Flutter application.  
The app enhances healthcare access through efficient communication, smart appointment booking, and AI-powered diagnosis assistance.

---

## 📱 Overview

The **Healora App** allows both **patients** and **doctors** to access their dedicated features from a single app.  
Upon login, users are redirected to their respective dashboards based on their role.

**Goal:**  
To simplify healthcare services, improve communication, and enhance diagnosis accuracy using AI.

---

## 👩‍⚕️ User Roles

### 🧑‍🤝‍🧑 Patient
- Book appointments with doctors by **specialty** and **availability**.  
- Manage and view personal **medical history**.  
- Chat securely with assigned doctors.  
- Use the **AI chatbot assistant** to describe symptoms and receive medical specialty recommendations.

### 👨‍⚕️ Doctor
- View and manage all incoming **appointment requests**.  
- Access patients’ **medical history** for informed decision-making.  
- Communicate securely with patients through real-time chat.

---

## 🧠 AI Chatbot Assistant

- Integrated using **Gemini API** via Firebase Cloud Functions.  
- Analyzes patient input and medical history to suggest the most relevant specialty for consultation.  
- Enhances diagnosis efficiency and reduces manual triage.

---

## 🧩 System Architecture

| Component | Technology |
|------------|-------------|
| **Frontend** | Flutter (Cross-platform for Android & iOS) |
| **Backend** | Firebase (Authentication, Firestore, Cloud Functions, Cloud Messaging) |
| **AI Chatbot** | Gemini API integrated with Firebase Cloud Functions |
| **State Management** | Cubit / Bloc |
| **Storage** | Firebase Storage for medical files & attachments |

---

## 🔁 Data Flow Overview

1. User logs in → identified as **Patient** or **Doctor**.  
2. Patients can book appointments or chat with doctors.  
3. Appointment details are stored in **Firestore** and reflected in the doctor’s dashboard.  
4. Both roles communicate via the **real-time chat system**.  
5. The **AI chatbot** assists patients using medical history data.  
6. Doctors can view patient data only for booked appointments.

---

## 🚀 Future Enhancements 
- Push notifications for appointments and follow-ups.  
  - Real-time alerts for:
    - New appointments  
    - Canceled or rescheduled sessions  
    - Chat messages  

---

