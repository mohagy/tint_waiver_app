class Validators {
  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.length < 7) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? date(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date is required';
    }
    // Format: yyyy/mm/dd
    final dateRegex = RegExp(r'^\d{4}/\d{2}/\d{2}$');
    if (!dateRegex.hasMatch(value)) {
      return 'Enter date in yyyy/mm/dd format';
    }
    return null;
  }

  static String? tin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'TIN is required';
    }
    if (value.length < 9) {
      return 'Enter a valid 9-digit TIN';
    }
    return null;
  }
}
