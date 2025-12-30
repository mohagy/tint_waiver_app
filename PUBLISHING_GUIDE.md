# Publishing Guide - Tint Waiver Application

This guide covers how to publish your Flutter application to different platforms.

## Prerequisites

1. Update version number in `pubspec.yaml`:
   ```yaml
   version: 1.0.0+1  # Format: version+buildNumber
   ```

2. Update app metadata:
   - Update `description` in `pubspec.yaml`
   - Update `web/index.html` title and meta tags
   - Update `web/manifest.json` name and description

---

## 🌐 Option 1: Publish as Web App (Easiest)

### Build for Web

```bash
# Navigate to project directory
cd tint_waiver_app

# Build for web (production)
flutter build web --release
```

### Deploy to XAMPP

1. **Copy build files:**
   ```bash
   # The build output is in: build/web/
   # Copy all files from build/web/ to your XAMPP htdocs directory
   ```

2. **For XAMPP:**
   - Copy `build/web/*` to `C:\xampp2\htdocs\tint_waiver_app\` (or your desired folder)
   - Access via: `http://localhost/tint_waiver_app/`

### Deploy to Production Web Server

**Option A: Traditional Web Hosting**
- Upload all files from `build/web/` to your web server
- Ensure your server supports:
  - Static file serving
  - HTTPS (recommended)
  - Proper MIME types for `.wasm` files

**Option B: Firebase Hosting**
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Initialize (if not already)
firebase init hosting

# Deploy
flutter build web --release
firebase deploy
```

**Option C: GitHub Pages**
```bash
flutter build web --release --base-href "/tint_waiver_app/"

# Then push build/web/ to gh-pages branch
```

**Option D: Netlify/Vercel**
- Connect your GitHub repo
- Set build command: `flutter build web --release`
- Set publish directory: `build/web`

---

## 📱 Option 2: Publish to Google Play Store (Android)

### Step 1: Prepare for Release

1. **Update app information:**
   - Edit `android/app/src/main/AndroidManifest.xml`
   - Set proper package name, app name, permissions

2. **Create a keystore:**
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

3. **Create key.properties file:**
   Create `android/key.properties`:
   ```properties
   storePassword=<your-password>
   keyPassword=<your-password>
   keyAlias=upload
   storeFile=<path-to-keystore>
   ```

4. **Update build.gradle:**
   - Edit `android/app/build.gradle.kts` to reference key.properties

### Step 2: Build Release APK/AAB

```bash
# Build App Bundle (recommended for Play Store)
flutter build appbundle --release

# OR Build APK (for direct distribution)
flutter build apk --release
```

Output location:
- AAB: `build/app/outputs/bundle/release/app-release.aab`
- APK: `build/app/outputs/flutter-apk/app-release.apk`

### Step 3: Upload to Google Play Console

1. Go to [Google Play Console](https://play.google.com/console)
2. Create new app or select existing
3. Upload the `.aab` file
4. Fill in store listing, content rating, pricing
5. Submit for review

---

## 🍎 Option 3: Publish to Apple App Store (iOS)

### Prerequisites
- Mac computer
- Apple Developer Account ($99/year)
- Xcode installed

### Step 1: Configure Xcode

1. Open `ios/Runner.xcworkspace` in Xcode
2. Set Bundle Identifier (unique)
3. Configure signing & capabilities
4. Set version and build number

### Step 2: Build for Release

```bash
# Build iOS app
flutter build ios --release
```

### Step 3: Archive and Upload

1. Open Xcode
2. Product → Archive
3. Distribute App → App Store Connect
4. Follow the upload wizard

### Step 4: Submit to App Store

1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Create new app
3. Fill in app information
4. Submit for review

---

## 🪟 Option 4: Publish to Microsoft Store (Windows)

### Step 1: Build Windows App

```bash
flutter build windows --release
```

### Step 2: Create MSIX Package

1. Install [Windows Application Packaging Project](https://docs.microsoft.com/en-us/windows/msix/packaging-tool/create-app-package)
2. Create packaging project
3. Add your Flutter app as reference
4. Build MSIX package

### Step 3: Submit to Microsoft Store

1. Go to [Partner Center](https://partner.microsoft.com/dashboard)
2. Create new app submission
3. Upload MSIX package
4. Fill in store listing
5. Submit for certification

---

## 🔧 Pre-Publishing Checklist

### General
- [ ] Update version number in `pubspec.yaml`
- [ ] Update app name and description
- [ ] Test on target devices/platforms
- [ ] Remove debug code and print statements
- [ ] Test all form validations
- [ ] Test PDF generation
- [ ] Test signature capture
- [ ] Verify data persistence works

### Web Specific
- [ ] Update `web/index.html` title and meta tags
- [ ] Update `web/manifest.json`
- [ ] Test on different browsers
- [ ] Verify HTTPS works (if applicable)
- [ ] Test responsive design

### Android Specific
- [ ] Create signing keystore
- [ ] Update `AndroidManifest.xml`
- [ ] Set proper permissions
- [ ] Test on different Android versions
- [ ] Create app icon (all sizes)

### iOS Specific
- [ ] Configure Bundle Identifier
- [ ] Set up code signing
- [ ] Update `Info.plist`
- [ ] Create app icons
- [ ] Test on iOS devices

### Security & Privacy
- [ ] Review data collection practices
- [ ] Add privacy policy (if collecting data)
- [ ] Secure sensitive data (SSN, etc.)
- [ ] Implement proper error handling
- [ ] Add terms of service

---

## 📝 Quick Commands Reference

```bash
# Build commands
flutter build web --release                    # Web
flutter build apk --release                    # Android APK
flutter build appbundle --release              # Android Bundle
flutter build ios --release                    # iOS
flutter build windows --release                # Windows

# Clean build
flutter clean
flutter pub get

# Check for issues
flutter analyze
flutter doctor
```

---

## 🚀 Recommended: Start with Web

For quickest deployment, start with web publishing:

1. **Build:**
   ```bash
   cd tint_waiver_app
   flutter build web --release
   ```

2. **Deploy to XAMPP:**
   - Copy `build/web/*` to your XAMPP htdocs folder
   - Access via browser

3. **Or deploy to production:**
   - Use Firebase Hosting, Netlify, or your web server
   - Ensure HTTPS is enabled for production

---

## 📚 Additional Resources

- [Flutter Deployment Guide](https://docs.flutter.dev/deployment)
- [Google Play Console](https://play.google.com/console)
- [App Store Connect](https://appstoreconnect.apple.com)
- [Firebase Hosting](https://firebase.google.com/docs/hosting)
- [Netlify](https://www.netlify.com/)

---

## Need Help?

- Check Flutter documentation: https://docs.flutter.dev
- Flutter community: https://flutter.dev/community
- Stack Overflow: Tag questions with `flutter`

