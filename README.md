# ShopSphere | Flutter-Powered eCommerce Platform

![Flutter](https://img.shields.io/badge/Flutter-3.16.0-blue?logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Enabled-yellow?logo=firebase)
![State Management](https://img.shields.io/badge/State%20Management-Provider-blueviolet)


A feature-rich e-commerce application built with Flutter and Firebase, implementing Clean Architecture principles. This project serves as a learning implementation of clean code practices, SOLID principles, and modern app development patterns.

## 🎯 Project Overview

ShopSphere is a demonstration project showcasing the implementation of Clean Architecture in a Flutter application. While not production-ready, it implements core e-commerce functionalities following best practices and modern development patterns.

## 🏗️ Architecture

The project follows Clean Architecture principles, separating the codebase into distinct layers:

### Layers
- **Domain Layer**: Contains business logic and entities
- **Data Layer**: Implements repositories and data sources
- **Presentation Layer**: Houses UI components and state management (BLoC)

### Design Patterns & Principles
- **SOLID Principles**
- **Dependency Injection** (using get_it)
- **Repository Pattern**

## ✨ Features

### 🔐 Authentication
- Dual role support (Admin/Customer)
- Email & Password authentication
- Form validation
- Secure session management

### 🛍️ Shopping Experience
- Product browsing with infinite scroll
- Category filtering
- Product details with expandable description
- Image carousel for product photos

### 🛒 Cart Management
- Add/Remove items
- Quantity adjustment
- Real-time price calculation
- Persistent cart state

### 💳 Checkout & Payment
- Address management
- Order summary
- Payment method selection
- Order confirmation

### 📦 Order Management
- Order tracking
- Order history
- Order status updates
- Order details view

### 👨‍💼 Admin Panel
- Product management (CRUD operations)
- Order management
- User management
- Analytics dashboard


## App Flow
```mermaid
graph TD
    A[User] --> B{Authentication}

    B -->|Customer| C[Browse Products]
    B -->|Admin| D[Admin Panel]

    C --> E[Product Details]
    E --> F[Add to Cart]
    F --> G[Cart Management]
    G --> H[Checkout]
    H --> I[Payment]
    I --> J[Order Confirmation]
    J --> K[Order Tracking]

    D --> L[Product Management]
    D --> M[Order Management]
    D --> N[User Management]

    L --> |CRUD| O[(Firebase)]
    M --> |Update Status| O
    N --> |Manage Roles| O

    G --> |Real-time Updates| O
    K --> |Status Updates| O
    B --> |Auth| O

    %% Color Customization
    classDef user fill:#ffcc00,stroke:#d4a017,stroke-width:2px;
    classDef auth fill:#ff6b6b,stroke:#c70039,stroke-width:2px;
    classDef customer fill:#1e90ff,stroke:#0057b7,stroke-width:2px;
    classDef admin fill:#ff1493,stroke:#b40068,stroke-width:2px;
    classDef cart fill:#32cd32,stroke:#228b22,stroke-width:2px;
    classDef order fill:#ff8c00,stroke:#cc7000,stroke-width:2px;
    classDef database fill:#8a2be2,stroke:#5a189a,stroke-width:2px;

    %% Assigning Classes
    class A,B user;
    class B auth;
    class C,E,F,G,H,I,J,K customer;
    class D,L,M,N admin;
    class F,G cart;
    class J,K order;
    class O database;


```

## 🛠️ Technical Stack

### Core
- **Flutter**: UI framework
- **Firebase**: Backend services
  - Firebase Auth
  - Cloud Firestore
  - Firebase Storage

### State Management & Architecture
- **provider**: State management
- **get_it**: Dependency injection
- **equatable**: Value equality
- **freezed**: Code generation
- **dartz**: Functional programming

### Utils
- **internet_connection_checker**: Network connectivity
- **image_picker**: Image selection
- **formz**: Form validation





## 🚀 Getting Started

1. Clone the repository
```bash
git clone https://github.com/ShishirRijal/shopsphere.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure Firebase
   - Create a new Firebase project
   - Add Android/iOS apps in Firebase console
   - Download and add configuration files
   - Enable Authentication and Firestore

4. Run the app
```bash
flutter run
```


## App Snaps
### Admin 
 <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/64bd01e5-433f-4c4e-b11e-81c874eedc57" height="550"> 
  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/e0411266-2c9c-414b-ad32-5be825d166f2" height="550">  
  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/2e9bd972-8493-42b9-8424-db49b19859f9" height="550"> 
  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/c5d7f389-2324-4df3-a6df-af2f10daaa9c" height="550"> 
  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/0023813c-74f2-4b1b-934d-97638d6b3219" height="550"> 
  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/afbca0a8-4875-4574-af27-5c28a2f34f30" height="550"> 
  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/56fdb3eb-e510-45e2-a05c-9badf36d47db" height="550"> 
  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/7ad28326-7f1e-4b38-9ea3-147c86a42492" height="550"> 


 ### Customer
 
<img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/706932c9-1d63-48b5-a1ff-fb9abf069c90" height="550"> <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/0dedf331-14e6-4149-a9c7-76477f636c16" height="550"> <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/bd5216a9-595f-4220-a1b3-24a3f58b52e3" height="550">  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/ca468f17-1bb4-42a2-8160-0d8a19470c38" height="550"> <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/d555cfca-b189-488b-bf27-72db553241fe" height="550">   <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/983ffd1d-e34b-429f-bba1-4f3d6cf53c63" height="550">   <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/0ca7b62c-04a9-405b-bd44-6114ede2127b" height="550">  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/2ba8f995-2bd1-4870-9155-f64441a6c734" height="550">  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/917e37c3-8015-419e-8438-5605c166f6f8" height="550">  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/24208ebb-1934-4819-99ef-53d66a6f02b2" height="550">  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/4a47f29d-04e9-4c63-a0be-67940ee3d4bc" height="550">  <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/601ca9af-9f2f-4b54-8cf0-fba5882244af" height="550">   <img src="https://github.com/ShishirRijal/clothing-store/assets/63596895/40622a86-276a-42d7-8bd6-8a5245f3ab10" height="550">  



## 🤝 Contributing

While this is a learning project, suggestions and discussions about architectural improvements are welcome! Feel free to:
- Open issues for discussions
- Submit PRs for improvements
- Share feedback about the architecture

## 📝 License

This project is released under the MIT License.

---
Built with ❤️ by Shishir Rijal




 

 
