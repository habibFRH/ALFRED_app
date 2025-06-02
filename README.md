# ALFRED App

ALFRED is a multi-role organizational management system built with Flutter. It provides specialized interfaces for business owners, department heads, employees, and citizens to streamline organizational processes.

## Latest Release

The first version (v0.1.0) of ALFRED is now available! You can download the Android APK from our GitHub releases or build it yourself following the instructions below.

## Features

### For Business Owners

- Manage announcements and company-wide communications
- Track employee attendance
- Review and address complaints
- Request loans
- Schedule and manage training programs
- Monitor workplace stress assessments
- Access personalized dashboard

### For Department Heads

- Departmental management features
- Staff oversight tools
- Resource allocation

### For Employees

- View company announcements
- Access personal workspace
- Submit forms and requests

### For Citizens

- Submit job or internship applications
- File complaints or suggestions to registered organizations

## Getting Started

### Prerequisites

- Flutter SDK 3.3.4 or higher
- Dart SDK
- Android Studio or VS Code with Flutter extensions

> **Need to install Flutter?** See our [Flutter Setup Guide](FLUTTER_SETUP.md) for detailed instructions.

### Installation

1. Clone the repository

   ```
   git clone <repository-url>
   ```

2. Navigate to the project directory

   ```
   cd ALFRED_app
   ```

3. Install dependencies

   ```
   flutter pub get
   ```

4. Run the app

   ```
   flutter run
   ```

### Easy Build Helper (Windows)

For Windows users, we've included a build helper script. Simply run:

```
build_app.bat
```

This interactive script provides options to:

- Install dependencies
- Build Android APK
- Build Windows app
- Run the app in development mode

## Build and Distribution

### Building for Android

1. Generate an Android APK:

   ```
   flutter build apk
   ```

   This will create an APK file at `build/app/outputs/flutter-apk/app-release.apk`

2. Generate an Android App Bundle (for Play Store):

   ```
   flutter build appbundle
   ```

   This will create a bundle at `build/app/outputs/bundle/release/app-release.aab`

### Building for iOS

1. Generate an iOS release build:

   ```
   flutter build ios
   ```

   Then open the Xcode project in the `ios/` folder to archive and distribute.

### Building for Windows

1. Ensure you have the Windows development dependencies:

   ```
   flutter config --enable-windows-desktop
   ```

2. Build the Windows executable:

   ```
   flutter build windows
   ```

   This will create the executable at `build/windows/runner/Release/`

### Building for macOS

1. Enable macOS desktop support:

   ```
   flutter config --enable-macos-desktop
   ```

2. Build the macOS app:

   ```
   flutter build macos
   ```

   This will create the app at `build/macos/Build/Products/Release/`

### Building for Linux

1. Enable Linux desktop support:

   ```
   flutter config --enable-linux-desktop
   ```

2. Build the Linux app:

   ```
   flutter build linux
   ```

   This will create the app at `build/linux/x64/release/bundle/`

### Download Links

Once you've built the app for your desired platforms, you can host the binaries in a release section of your repository or use a file hosting service. Add the download links below:

- [Download for Android (APK)](https://github.com/habibFRH/ALFRED_app/releases/download/v0.1.0/app-release.apk) - Version 0.1.0
- [Download for Windows](link-to-hosted-windows-exe)
- [Download for macOS](link-to-hosted-macos-app)
- [Download for Linux](link-to-hosted-linux-app)

> **Note:** The Android APK is also available in the repository at `releases/v0.1.0/app-release.apk` or at `build/app/outputs/flutter-apk/app-release.apk` if you've built it locally.

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── splash_screen.dart        # Initial loading screen
├── stepper_page.dart         # User role selection
├── owner/                    # Business owner interfaces
├── employee/                 # Employee interfaces
├── citizen/                  # Citizen interfaces
└── Head dep/                 # Department head interfaces
```

## Technologies Used

- Flutter
- Dart
- Material Design

## Dependencies

- file_picker: ^5.2.5
- intl: ^0.20.2
- flutter_launcher_icons: ^0.13.1
- flutter_native_splash: ^2.3.6

## Screenshots

[Add screenshots here]

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[Add license information]

## Contact

[Add contact information]
