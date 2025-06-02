@echo off
echo ===================================
echo ALFRED App Build Helper
echo ===================================
echo.

REM Check if Flutter is installed
where flutter >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
  echo Flutter not found in PATH!
  echo Please install Flutter first. See FLUTTER_SETUP.md for instructions.
  echo.
  pause
  exit /b 1
)

:menu
cls
echo Choose a build option:
echo.
echo 1. Install dependencies
echo 2. Build Android APK
echo 3. Build Windows App
echo 4. Run the app
echo 5. Exit
echo.

set /p choice=Enter your choice (1-5): 

if "%choice%"=="1" goto dependencies
if "%choice%"=="2" goto android
if "%choice%"=="3" goto windows
if "%choice%"=="4" goto run
if "%choice%"=="5" goto end

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto menu

:dependencies
echo.
echo Installing dependencies...
flutter pub get
echo.
echo Dependencies installed successfully.
pause
goto menu

:android
echo.
echo Building Android APK...
flutter build apk
echo.
echo Build completed. APK location:
echo %CD%\build\app\outputs\flutter-apk\app-release.apk
echo.
pause
goto menu

:windows
echo.
echo Enabling Windows desktop support...
flutter config --enable-windows-desktop
echo.
echo Building Windows app...
flutter build windows
echo.
echo Build completed. Executable location:
echo %CD%\build\windows\runner\Release\
echo.
pause
goto menu

:run
echo.
echo Running the app...
flutter run
echo.
pause
goto menu

:end
echo.
echo Thank you for using ALFRED App Builder!
exit /b 0 