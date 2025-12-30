# Tint Waiver Application

A Flutter web application for submitting tint waiver applications to the Ministry of Home Affairs, Republic of Guyana.

## Features

- Complete online form for tint waiver applications
- Personal, employer, business, and vehicle information sections
- Digital signature support
- PDF generation
- Form validation and draft saving
- Information about Motor Vehicles and Road Traffic (Tint) Regulations 2025
- Exemption eligibility and application process details

## Requirements

- Flutter SDK (latest stable version)
- Dart SDK
- Web browser for running the web version

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/tint_waiver_app.git
cd tint_waiver_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run -d chrome
```

## Building for Web

To build the web version:

```bash
flutter build web --base-href /tint_waiver_app/
```

The built files will be in the `build/web` directory.

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── models/
│   └── waiver_form_model.dart # Form data model
├── screens/
│   └── home_screen.dart       # Main form screen
├── services/
│   ├── pdf_service.dart      # PDF generation service
│   └── storage_service.dart  # Local storage service
├── utils/
│   ├── formatters.dart       # Input formatters
│   └── validators.dart       # Form validators
└── widgets/
    ├── form_field_widgets.dart # Custom form fields
    ├── section_header.dart    # Section header widget
    └── signature_pad.dart     # Signature pad widget
```

## License

[Add your license here]

## Contact

[Add contact information if needed]
