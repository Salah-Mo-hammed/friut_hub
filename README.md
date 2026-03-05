# 🛍️ ShopSphere — Full-Featured E-Commerce Flutter App

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/REST%20API-Integrated-brightgreen?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/BLoC-State%20Management-blueviolet?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Clean%20Architecture-✔-orange?style=for-the-badge"/>
</p>

> A production-grade, cross-platform e-commerce mobile application built with Flutter, delivering a complete shopping experience from onboarding to post-purchase review.

---

## 📱 Screenshots

> _Coming soon — screenshots and screen recordings will be added here._

---

## ✨ Features

### 🔐 Authentication & Security
- Splash screen with onboarding flow
- Email/password registration with **email verification**
- Secure login with **JWT + refresh token** handling
- **OTP-based password reset** (6-digit code via email)

### 🛒 Shopping Experience
- Home page with featured products and promotional offers
- Product catalog with:
  - Multi-criteria **sorting** (price high→low, low→high, alphabetical)
  - Advanced **filtering** by category and attributes
  - **Server-side pagination**
- Product detail pages with image gallery
- **Favorites** — save and manage wishlist items
- **Cart management** — add, update quantity, remove items

### 💳 Checkout Flow
- Delivery information form (name, address, apartment, phone)
- Payment method selection:
  - Visa / MasterCard
  - PayPal
  - Apple Pay
  - Cash on delivery
- Order summary review before confirmation

### 📦 Orders & Post-Purchase
- Real-time **order tracking** page
- **Rating & review** submission per order
- Full order history under profile

### 👤 Profile & Account
- Change password
- Manage saved payment cards
- Add new payment methods
- Notifications center

---

## 🏗️ Architecture

The project follows **Clean Architecture** with a clear separation of layers:

```
lib/
├── core/                   # Shared utilities, constants, theme, network client
│   ├── api/                # Dio client, interceptors, token refresh logic
│   ├── errors/             # Failure classes, error handling
│   └── utils/
├── features/
│   ├── auth/
│   │   ├── data/           # Models, data sources, repository impl
│   │   ├── domain/         # Entities, use cases, repository interface
│   │   └── presentation/   # BLoC/Cubit, screens, widgets
│   ├── products/
│   ├── cart/
│   ├── checkout/
│   ├── orders/
│   ├── favorites/
│   └── profile/
└── main.dart
```

**Layer responsibilities:**
| Layer | Responsibility |
|-------|---------------|
| `data` | API calls, JSON serialization, repository implementations |
| `domain` | Business logic, use cases, abstract repository contracts |
| `presentation` | UI, BLoC/Cubit state management, screen widgets |

---

## 🔌 API Integration

The app integrates with a custom RESTful API backend supporting:

| Endpoint Category | Details |
|-------------------|---------|
| **Auth** | Register, login, email verification, token refresh |
| **Password Reset** | OTP request, OTP verify, password update |
| **Products** | List with filter/sort/pagination, detail, images |
| **Categories** | All categories, category-specific product listing |
| **Cart** | Add item, update quantity, remove, fetch cart |
| **Favorites** | Add, remove, fetch favorites list |
| **Orders** | Create order, fetch order list, order tracking |
| **Profile** | View profile, update info, manage payment cards |

> ⚠️ Admin-only endpoints (create/edit products and categories) are managed outside the mobile app.

---

## 🧰 Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter 3.x |
| Language | Dart 3.x |
| State Management | BLoC / Cubit |
| Networking | Dio |
| Dependency Injection | GetIt + Injectable |
| Navigation | Auto Route / Go Router |
| Local Storage | Shared Preferences / Flutter Secure Storage |
| Architecture | Clean Architecture |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / VS Code with Flutter extension

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/shopsphere.git
cd shopsphere

# 2. Install dependencies
flutter pub get

# 3. Run code generation (if using injectable / auto_route)
dart run build_runner build --delete-conflicting-outputs

# 4. Set up environment variables
cp .env.example .env
# Edit .env and set BASE_URL to your API endpoint

# 5. Run the app
flutter run
```

### Environment Variables

Create a `.env` file at the project root:

```env
BASE_URL=https://your-api-domain.com/api
```

---

## 📂 Project Structure Highlights

```
lib/core/api/
├── api_client.dart          # Dio instance with base options
├── auth_interceptor.dart    # Attaches Bearer token to requests
└── token_refresh_interceptor.dart  # Handles 401 → refresh → retry

lib/features/auth/
├── data/
│   ├── models/              # LoginModel, RegisterModel, UserModel
│   ├── datasources/         # AuthRemoteDataSource
│   └── repositories/        # AuthRepositoryImpl
├── domain/
│   ├── entities/            # User entity
│   ├── usecases/            # LoginUseCase, RegisterUseCase, etc.
│   └── repositories/        # AuthRepository (abstract)
└── presentation/
    ├── cubit/               # AuthCubit, AuthState
    └── screens/             # LoginScreen, RegisterScreen, OtpScreen
```

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<p align="center">Made with ❤️ by <a href="https://github.com/YOUR_USERNAME">Salah Abd Al-Atti</a></p>
