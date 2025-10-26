# Chronic Diseases

[![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D3.9.0-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-%3E%3D3.9.0-blue.svg)](https://dart.dev/)

A cross-platform Flutter application focused on chronic disease management and health insights. This repository contains the app source, assets, and platform targets for Android, iOS, Web and desktop platforms.

## Key Features

### Core Functionality
- Symptom logging with date/time and optional notes
- Symptom trend views and simple charts for self-monitoring
- Guided health information and educational widgets
- Local notification reminders for medication/monitoring
- Onboarding and authentication flows (Sign Up, Login, Reset Password)
- Persistent local storage for sessions and user data

### UX & Accessibility
- Responsive layouts for phones, tablets and web
- Themed (light/dark) styling via centralized `AppThemes`
- Reusable UI components in `lib/core/widgets_core`
- Asset-driven icons and images for consistent branding

### Privacy & Data
- Primary storage: local device storage (no backend by default)
- Explicit note: review any added analytics, cloud sync, or push services before enabling them

## Project Structure

```
lib/
  core/
    app_color.dart
    assets.dart
    styles.dart
    user_session.dart
    utils/
    widgets_core/
  models/
    Notification/notifications.dart
    checkSymptoms/
    Login/
    SignUp/
    resetPassword/
    CreatePassword_Code/
  ui/
    screen/
    Widgets/
  app_routes.dart
  main.dart

android/ ios/ web/ windows/ macos/ linux/  # platform folders
assets/  # icons, images
fonts/
test/
```

## Getting Started

### Prerequisites
- Flutter SDK (stable channel)
- Dart (bundled with Flutter)
- For Android: Android SDK + emulator or device
- For iOS: Xcode (macOS only)

### Install dependencies

Open a terminal in the project root and run (PowerShell example for Windows):

```powershell
flutter pub get
```

### Validate environment

```powershell
flutter doctor -v
flutter --version
```

## How to run (examples)

Windows / PowerShell (recommended for local dev on Windows):

```powershell
# Run on connected Windows device or desktop
flutter run -d windows

# Run on Android emulator/device
flutter run -d android

# Run on Chrome for web
flutter run -d chrome
```

macOS / iOS (mac-only):

```bash
# iOS simulator
flutter run -d ios
```

If multiple devices are connected:

```powershell
flutter devices
flutter run -d <device_id>
```

## Building for Release

- Android (APK):

```powershell
flutter build apk --release
```

- Android (AppBundle):

```powershell
flutter build appbundle --release
```

- Web:

```powershell
flutter build web --release
```

- Windows/macOS/Linux:

```powershell
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## Assets and Fonts

Assets live under the `assets/` folder and are declared in `pubspec.yaml`. Fonts are in `fonts/`—the project currently uses Nunito-style fonts (see `fonts/`). Use `lib/core/assets.dart` for centralized asset constants.

After changing `pubspec.yaml`, run:

```powershell
flutter pub get
```

## Routing

Named routes are managed in `lib/app_routes.dart`. Use `Navigator.of(context).pushNamed(AppRoutes.someScreen)` for navigation.

## Notifications

Notification models are located in `lib/models/Notification/notifications.dart`. Platform-specific initialization is required for local/push notifications. Check plugin docs before enabling push services.

## Code Style, Linting & Testing

- Static analysis: `flutter analyze`
- Format: `dart format .`
- Unit & widget tests: `flutter test`

Example (PowerShell):

```powershell
flutter analyze
dart format .
flutter test
```

There is a basic widget test in `test/widget_test.dart` to get started.

## Development notes

- Keep widgets small and composable; shared styles belong in `lib/core/styles.dart`.
- Use constants in `lib/core/assets.dart` instead of hard-coded paths.
- The symptom logging flow and notification reminders are intentionally local-first for privacy.

## Architecture & Technical Details

- Code aims for a modular architecture: `core` + `models` + `ui` with feature folders under `models` and `ui`.
- State: simple local state management; consider Riverpod or Provider for larger-scale refactors.
- Platform integrations (notifications, local storage) live in platform folders and the appropriate platform channel wrappers.

## Roadmap (suggested)

- Short-term
  - Add optional secure cloud sync (user opt-in)
  - Improve symptom analytics UI (better charts)
  - Add export/import of logs (CSV)

- Medium-term
  - Integrate secure backend for clinician sharing (opt-in)
  - Add onboarding analytics (privacy-first)
  - Improve accessibility (a11y)

- Long-term
  - Connect with device APIs (Bluetooth glucometers, wearables) via optional plugins
  - Add multi-user / family account features

## Contributing

Please follow the project's conventions. Create issues and PRs against `main`. If you plan to contribute, add a short description of your change and include tests where relevant. If you want, add a `CONTRIBUTING.md` to document workflow and code style.

## License

Proprietary. All rights reserved unless a license is added. If you want to open-source the app, consider adding an OSI-approved license (MIT, Apache-2.0, etc.).

## Acknowledgments

- Flutter team and the Dart ecosystem
- Open-source plugin authors

---

If you'd like, I can also:
- Add badges (CI, code coverage) at the top of this file
- Add a short "How to run on Windows (PowerShell)" section with common troubleshooting steps
- Create a `README.md.bak` backup before edits


© 2025 Chronic Diseases. All rights reserved.

## Design preview

Screenshots and UI previews from the app/design system.
![logoApp](assets/logoApp.png)
![OnBoarding](<assets/Frame1.png>)
![Ai](<assets/Frame2.png>)
![HomePage](assets/Frame.png)


