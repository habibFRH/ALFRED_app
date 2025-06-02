# Flutter Setup Guide for Windows

This guide will help you install Flutter on your Windows system and build the ALFRED app.

## Step 1: Install Flutter SDK

1. Download Flutter SDK from [Flutter's official website](https://docs.flutter.dev/get-started/install/windows)

   - Download the latest stable release ZIP file

2. Extract the ZIP file to a location on your computer (e.g., `C:\src\flutter`)

   - Avoid locations that require elevated privileges (like Program Files)
   - Avoid spaces in the path

3. Update your PATH:
   - In Windows Search, type 'environment variables' and select "Edit the system environment variables"
   - Click "Environment Variables"
   - Under "User variables", find and select "Path"
   - Click "Edit"
   - Click "New" and add the path to the Flutter SDK's bin directory (e.g., `C:\src\flutter\bin`)
   - Click "OK" to save

## Step 2: Install Development Tools

1. Install Git for Windows (if not already installed):

   - Download from [git-scm.com](https://git-scm.com/download/win)
   - Follow the installation wizard

2. Install Android Studio:

   - Download from [developer.android.com](https://developer.android.com/studio)
   - Follow the installation wizard
   - During setup, make sure to install:
     - Android SDK
     - Android SDK Command-line Tools
     - Android SDK Build-Tools
     - Android Emulator

3. Configure Android Studio:
   - Open Android Studio
   - Go to Plugins → Marketplace
   - Search for and install the "Flutter" plugin
   - Restart Android Studio when prompted

## Step 3: Verify Installation

1. Open a new Command Prompt or PowerShell window
2. Run `flutter doctor`
3. Follow any additional instructions provided by `flutter doctor` to complete setup

## Step 4: Build the ALFRED App

Once Flutter is properly installed, you can build the app:

1. Navigate to the ALFRED_app directory:

   ```
   cd path\to\ALFRED_app
   ```

2. Get dependencies:

   ```
   flutter pub get
   ```

3. Build for Android:

   ```
   flutter build apk
   ```

   The APK will be created at `build\app\outputs\flutter-apk\app-release.apk`

4. Build for Windows:
   ```
   flutter config --enable-windows-desktop
   flutter build windows
   ```
   The Windows executable will be at `build\windows\runner\Release\`

## Step 5: Distribute the App

After building:

1. Create a GitHub release:

   - Go to your repository on GitHub
   - Click on "Releases" on the right side
   - Click "Create a new release"
   - Upload your built files (APK, Windows EXE, etc.)
   - Publish the release

2. Update the README.md with links to your release

## Troubleshooting

If you encounter issues:

1. Run `flutter doctor -v` for detailed diagnostics
2. Ensure your PATH is correctly set
3. Make sure you have the latest Flutter SDK
4. Check [Flutter's troubleshooting guide](https://docs.flutter.dev/testing/common-errors)
