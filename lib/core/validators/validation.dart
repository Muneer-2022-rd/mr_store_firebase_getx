class TValidator {

static String? validateEmptyText(String? value, String? fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is Required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required.';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain one uppercase letter.';
    // }
    // if (!value.contains(RegExp(r'[0-9]'))) {
    //   return 'Password must contain one number.';
    // }
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'Password must contain one special character.';
    // }
    return null;
  }
}
