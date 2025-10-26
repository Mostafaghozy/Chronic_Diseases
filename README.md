# Chronic Diseases (Flutter)

A cross-platform Flutter application for managing chronic diseases such as Diabetes by tracking health metrics (e.g., glucose, blood pressure, weight), scheduling and managing appointments, logging symptoms, and receiving actionable notifications and insights. The app provides user onboarding, authentication, symptom logging, notifications, and guided health information. It is structured with a clean separation of core utilities, UI, models, and platform targets, following Clean Architecture and Bloc for state management, and integrates with a REST API for data.

## Table of Contents
- Features
- Use Cases and Personas
- Domains and Data Model
- Architecture and Data Flow
- Project Structure
- Tech Stack
- Getting Started
- Running the App
- Building for Release
- Assets and Fonts
- Routing
- Notifications
- State Management Conventions
- Error Handling and Offline Strategy
- Security and Privacy
- Roadmap
- Code Style and Linting
- Testing
- Troubleshooting

## Features
- Manage chronic diseases (e.g., Diabetes) with tracked metrics: glucose, blood pressure, weight, medication adherence
- Appointments management: schedule, reminders, and follow-ups
- Logging symptoms and viewing trends/charts over time (e.g., 7/30/90-day views)
- Personalized reminders for meds, check-ups, and tasks
- Educational content and tips surfaced contextually
- Multi-platform support: Android, iOS, Web, Windows, macOS, Linux
- Onboarding and authentication flows (Sign Up, Login, Reset Password, Create Password Code)
- Centralized theming and responsive UI
- Clean Architecture + Bloc state management
- REST API integration to sync across devices

## Project Structure
The project follows a modular structure. Key directories:

- lib/
  - core/
    - utils/: Core utilities/helpers
    - widgets_core/: Reusable core widgets
    - app_color.dart: Central color palette
    - assets.dart: Asset path constants
    - styles.dart: Text and theme styles
    - user_session.dart: User session management helpers
  - models/
    - Notification/notifications.dart: Notification data models
    - checkSymptoms/, Login/, SignUp/, resetPassword/, CreatePassword_Code/: Feature-related models
  - ui/
    - screen/: App screens
    - Widgets/: Reusable feature widgets
  - app_routes.dart: Central route configuration
  - main.dart: App entry point

Platform folders and configuration also exist for android/, ios/, web/, windows/, macos/, linux/.

## Use Cases and Personas
- Patient: track daily metrics (glucose, BP), receive reminders, log symptoms, and keep appointments organized.
- Caregiver: review trends and reminders to support patient adherence.
- Clinician (future): review summarized metrics and adherence for remote monitoring.

## Domains and Data Model
- Metrics: glucose readings, blood pressure, weight, heart rate
- Medications: name, dosage, schedule, adherence logs
- Appointments: date/time, location/provider, notes, reminders
- Symptoms: type, severity, notes, attachments (optional)
- Notifications: local reminders, push (optional)

Note: Data model types are expressed as Dart entities (domain layer) mapped to DTOs (data layer) for REST.

## Architecture and Data Flow
- Presentation: Widgets -> Bloc/Cubit -> UI states
- Domain: UseCases (interactors) operating on Entities/Value Objects
- Data: Repositories -> Data Sources (REST API, local cache)
- Cross-cutting: error handling, logging, configuration

Flow example (Add glucose reading):
Widget -> Bloc Event (AddReading) -> UseCase (AddReadingUseCase) -> Repository.addReading -> RemoteDataSource.post -> Bloc emits Loading/Success/Error -> UI updates

## Tech Stack
- Flutter (Dart)
- Bloc (flutter_bloc) for state management
- Clean Architecture (domain, data, presentation layers)
- REST API integration (e.g., via http/dio)
- Material Design components
- Custom fonts and assets

Dependencies are defined in pubspec.yaml. Use Flutter stable channel unless otherwise specified.

## Getting Started
1. Prerequisites
   - Flutter SDK installed and configured
   - Dart SDK (bundled with Flutter)
   - Platform toolchains as needed (Android Studio/Xcode, etc.)

2. Clone and install dependencies
   - Open the project directory
   - Fetch packages:
     flutter pub get

3. Recommended: Run Flutter doctor and fix any issues
     flutter doctor -v

## Running the App
Run on any connected device/emulator or in the browser.

- Android:
  flutter run -d android

- iOS (requires macOS + Xcode):
  flutter run -d ios

- Web:
  flutter run -d chrome

- Windows:
  flutter run -d windows

- macOS:
  flutter run -d macos

- Linux:
  flutter run -d linux

If multiple devices are connected:
  flutter devices
  flutter run -d <device_id>

## Building for Release
- Android (APK):
  flutter build apk --release

- Android (AppBundle):
  flutter build appbundle --release

- iOS:
  flutter build ios --release
  Then use Xcode Organizer for App Store distribution.

- Web:
  flutter build web --release
  Outputs to build/web.

- Windows:
  flutter build windows --release

- macOS:
  flutter build macos --release

- Linux:
  flutter build linux --release

Refer to platform-specific signing guidelines (keystore for Android, provisioning profiles for iOS).

## Assets and Fonts
Assets are located under assets/ and fonts/ and declared in pubspec.yaml. Examples include:
- assets/icons/... (SVGs and PNGs)
- assets/images/...
- fonts/Nunito-*.ttf

To reference assets in code, use centralized constants in lib/core/assets.dart where available. Example:
  Image.asset(Assets.images.heartLogo)

Ensure you run:
  flutter pub get
after modifying pubspec.yaml.

## Routing
Routes are centralized in lib/app_routes.dart. Use named routes for navigation to keep transitions consistent and decoupled from widget implementations.

Example:
  Navigator.of(context).pushNamed(AppRoutes.someScreen)

## Notifications
Notification models are in lib/models/Notification/notifications.dart. Platform integration for displaying notifications may require additional plugins and platform-specific setup. Verify permissions and initialization when adding local or push notifications.

## State Management Conventions
- Use Cubit for simple, localized state; use Bloc for multi-event flows
- States are immutable; prefer sealed classes/patterns via union-like classes
- Side-effects isolated in use cases and repositories; avoid business logic in Widgets

## Error Handling and Offline Strategy
- Errors propagated as domain-level failures (e.g., NetworkFailure, ValidationFailure)
- Show user-friendly messages with retry where applicable
- Optional: cache recent metrics and appointments locally for read-only offline mode
- Debounce/batch writes and sync when connectivity is restored

## Security and Privacy
- Store auth tokens securely (Keychain/Keystore/secure storage)
- Use HTTPS for all API traffic; avoid logging PII
- Consider anonymized analytics; obtain consent where required
- Follow least-privilege for permissions (notifications, storage)

## Roadmap
- Charts for metrics trends with export/share
- Push notifications integration and cloud sync
- Clinician dashboard integration
- Localization and accessibility enhancements
- Dark mode and theming polish

## Code Style and Linting
This project includes analysis_options.yaml. Follow Dart/Flutter best practices:
- Use const where possible
- Keep widgets small and composable
- Place shared styles in styles.dart

Run static analysis:
  flutter analyze

Format code:
  dart format .

## Testing
Unit and widget tests belong in test/. A default widget test exists:
- test/widget_test.dart

Run tests:
  flutter test

## Troubleshooting
- Assets not found: Confirm paths in pubspec.yaml and run flutter pub get.
- iOS build issues: Run pod install in ios/ (on macOS) and open the workspace:
    cd ios && pod install && cd -
- Web CORS or cache issues: Try flutter run -d chrome --web-renderer html and clear cache.
- Android build fails: Ensure a valid Android SDK/NDK is installed and JAVA_HOME set.

## License
Proprietary. All rights reserved unless a license is added.