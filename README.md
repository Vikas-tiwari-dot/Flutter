

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Student Dashboard App

A simple Flutter app made as a practice project. It shows a basic student dashboard with attendance tracking and profile info.

---

## What this app does

- Shows a home screen with task progress and today's classes
- Tracks attendance and shows percentage
- Has a profile screen with student details
- Uses a bottom navigation bar to switch between screens

---

## Screens

**Home**
- Greeting with student name
- Task counter with a progress bar
- Quick stats like CGPA, attendance, assignments
- List of today's classes

**Attendance**
- Shows attendance percentage
- Turns green if above 75%, red if below
- Buttons to add present or absent
- Subject-wise attendance bars

**Profile**
- Student avatar with initials
- All details like roll number, branch, email, CGPA

---

## Concepts used

- StatelessWidget and StatefulWidget
- setState() for updating UI
- MaterialApp, Scaffold, AppBar
- Column, Row, Container, Text, ElevatedButton
- BottomNavigationBar
- SizedBox for spacing
- TextStyle for styling text
- FractionallySizedBox for progress bars

---

## How to run

Make sure Flutter is installed on your system.

```
flutter pub get
flutter run
```

No extra packages are needed. Only the default Flutter SDK is used.

---

## Project structure

```
lib/
└── main.dart    (all code is here)
```

---

## Screenshots

> Run the app on an emulator or device to see the UI.

---

## Made with

- Flutter
- Dart
