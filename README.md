# 🚀 Pomodoro Task Manager (Flutter + Back4App)

## 📱 Overview

Pomodoro Task Manager is a Flutter-based mobile application that combines **task management** with a **Pomodoro timer** to improve productivity.

The app uses **Back4App (Parse Server)** as a Backend-as-a-Service (BaaS) to handle user authentication and cloud data storage without requiring a custom backend.

---

## ✨ Features

### 🔐 Authentication

* User Registration (Email-based)
* Secure Login & Logout
* Session management using Back4App

### 📋 Task Management (CRUD)

* ➕ Create tasks
* 📖 View tasks
* ✏️ Edit tasks
* 🗑️ Delete tasks
* ☑️ Mark tasks as completed

### ⏱️ Pomodoro Timer

* 25-minute focus timer
* Start & Reset functionality
* Helps improve productivity

### ☁️ Cloud Backend (Back4App)

* Tasks stored in cloud database
* User-specific task data
* Real-time persistence

---

## 🛠️ Tech Stack

| Layer        | Technology              |
| ------------ | ----------------------- |
| Frontend     | Flutter (Dart)          |
| Backend      | Back4App (Parse Server) |
| Database     | Back4App Cloud Database |
| State Mgmt   | setState (Flutter)      |
| Version Ctrl | Git & GitHub            |

---

## 🏗️ App Architecture

Flutter App ↔ Back4App (Parse Server)

* Flutter handles UI & logic
* Back4App handles authentication & database

---

## 📂 Project Structure

```
lib/
 ├── main.dart
 ├── screens/
 │    ├── login_screen.dart
 │    ├── home_screen.dart
 │    ├── add_task_screen.dart
 │
 ├── services/
 │    ├── auth_service.dart
 │    ├── task_service.dart
 │
 ├── widgets/
 │    ├── task_item.dart
 │    ├── timer_widget.dart
```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```
git clone <your-repo-link>
cd task_manager_app
```

---

### 2️⃣ Install Dependencies

```
flutter pub get
```

---

### 3️⃣ Setup Back4App

1. Create an app on Back4App
2. Go to **App Settings → Security & Keys**
3. Copy:

   * Application ID
   * Client Key

---

### 4️⃣ Configure Flutter App

Update `main.dart`:

```dart
await Parse().initialize(
  'YOUR_APP_ID',
  'https://parseapi.back4app.com/',
  clientKey: 'YOUR_CLIENT_KEY',
);
```

---

### 5️⃣ Setup Database

Create a class in Back4App:

**Class Name:** `Task`

| Field     | Type            |
| --------- | --------------- |
| title     | String          |
| completed | Boolean         |
| user      | Pointer → _User |

---

### 6️⃣ Run the App

```
flutter run
```

OR (Web):

```
flutter run -d chrome
```

---

## 📸 Screenshots

*(Add screenshots here before submission)*

* Login Screen
* Task Dashboard
* Add/Edit Task
* Timer UI

---

## 🎥 Demo Video

*https://youtu.be/wE3eQc2dEF4*

---

## 📚 Learnings

* Implemented **Backend-as-a-Service (BaaS)** using Back4App
* Integrated **user authentication** in Flutter
* Built a full **CRUD application**
* Understood **cloud database interactions**
* Developed a **cross-platform mobile app**

---

## 🚀 Future Enhancements

* Real-time updates using LiveQuery
* Task categories & priorities
* Notifications for Pomodoro sessions
* Dark mode support
* Improved state management (Provider / Riverpod)

---

## 👨‍💻 Author

**Tejas Muthya**

---

## 📄 License

This project is for academic purposes.
