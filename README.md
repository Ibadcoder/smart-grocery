# Smart Grocery 🛒

A multi-screen mock-data grocery assistant prototype built with Flutter.

## 📱 About the Project
**Smart Grocery** is a 9-screen Flutter UI prototype featuring an onboarding workflow, home dashboard, smart checklist, item management modals, barcode scanner UI, analytics/insights, and profile settings.

## ✨ Features & Architecture
* **Material 3 Design:** Styled with a custom color scheme (Primary Green `#3A6758`), custom typography (*Plus Jakarta Sans*), and reusable design tokens (`AppSpacing`, `AppRadius`).
* **Navigation Shell:** Tab navigation using `IndexedStack` (Home, List, Insights, Profile) paired with full-screen action dialogs (Scan, Add/Edit).
* **Modular Structure:** Clean UI separation under `lib/screens/` and reusable widgets (`BorderedCard`, `AppBottomNav`) under `lib/widgets/`.

## 🛠️ Tech Stack
* **Framework:** Flutter `3.44.9` / Dart `3.12.2`
* **Fonts & Icons:** `google_fonts`, `cupertino_icons`
* **Linter:** `flutter_lints ^6.0.0`

## Getting Started

You need Flutter with Dart 3.11.5 or newer.

### Setup & Execution
1. **Clone the repository:**
```bash
git clone https://github.com/YOUR_USERNAME/smart_grocery.git
cd smart_grocery
flutter pub get
flutter run
```


Don't forget to ⭐ the repository.

