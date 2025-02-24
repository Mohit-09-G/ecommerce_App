class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    if (value.length > 254) {
      return 'Email address is too long';
    }

    final parts = value.split('@');
    if (parts[0].length > 64) {
      return 'Local part of email is too long';
    }

    if (parts[1].length > 255) {
      return 'Domain part of email is too long';
    }

    if (value.contains('..')) {
      return 'Email cannot contain two consecutive dots';
    }

    if (value.startsWith('.') || value.endsWith('.')) {
      return 'Email cannot start or end with a dot';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
