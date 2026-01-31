# 📱 Tech Store - E-Commerce Flutter App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/State%20Management-Provider-7952B3?style=for-the-badge)

A modern, fully functional E-Commerce application built with Flutter. The app simulates a real-world shopping experience for electronics, featuring a clean UI, robust state management, and seamless API integration.

---

## 📸 Screenshots

### 🔐 Onboarding & Authentication
| Splash Screen | Login | Register |
|:---:|:---:|:---:|
| <img src="![alt text](image.png)" width="200"/> | <img src="![alt text](image-1.png)" width="200"/> | <img src="![alt text](image-2.png)" width="200"/> |

### 🛍️ Main App Flow
| Home (Dark) | Product Details | Cart Screen |
|:---:|:---:|:---:|
| <img src="![alt text](image-3.png)" width="200"/> | <img src="![alt text](image-4.png)" width="200"/> | <img src="![alt text](image-5.png)" width="200"/> |

### 👤 User & Settings
| Profile | Settings (Light) |
|:---:|:---:|
| <img src="![alt text](image-6.png)" width="200"/> | <img src="![alt text](image-7.png)" width="200"/> |



---

## ✨ Features

- **🎨 Modern UI/UX:**
  - **Complete Flow:** Splash -> Login -> Home.
  - Sleek design with **Dark/Light Theme** support.
  - Responsive layouts using custom widgets.
  
- **🌍 Localization:**
  - Full support for **Arabic (RTL)** and **English (LTR)**.
  - Persisted language preferences.

- **🛍️ Product Management:**
  - Fetch products from remote API (**FakeStoreAPI**).
  - Browse categories (Laptops, Phones, etc.).
  - View detailed product information.

- **🛒 Smart Cart System:**
  - Add/Remove items.
  - Increment/Decrement quantities.
  - Real-time total price calculation.
  - State persistence.

- **🔌 Network Layer:**
  - Clean API handling using **Dio**.
  - Error handling and logging with **Pretty Dio Logger**.

---

## 🛠️ Tech Stack & Architecture

The project follows a **Feature-Based Architecture** to ensure scalability and maintainability.

- **Framework:** Flutter (Dart)
- **State Management:** Provider
- **Networking:** Dio
- **Local Storage:** Shared Preferences (for Theme & Locale)
- **Architecture:** MVVM (Model-View-ViewModel) pattern adapted with Provider.

### 📂 Folder Structure
```text
lib/
├── core/
│   ├── constants/
│   ├── theme/          # App Theme (Colors, TextStyles)
│   ├── widgets/        # Reusable Widgets (Buttons, Fields)
│   └── providers/      # Global Providers (Settings)
├── features/
│   ├── auth/           # Login & Register Logic
│   ├── home/           # Home Screen & Logic
│   ├── cart/           # Cart Logic & UI
│   └── product_details/# Details Screen
├── l10n/               # Localization Files (.arb)
└── main.dart