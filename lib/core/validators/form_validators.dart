class FormValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (value.trim().length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value.trim())) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');
    if (!regex.hasMatch(value)) {
      return "Password must contain at least 1 uppercase and 1 number";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Phone number must contain only digits";
    }

    if (!value.startsWith('0')) {
      return "Phone number must start with 0";
    }

    if (value.length != 11) {
      return "Phone number must be 11 digits";
    }

    if (!RegExp(r'^01[0,1,2,5][0-9]{8}$').hasMatch(value)) {
      return "Invalid Egyptian phone number format";
    }

    return null;
  }
}
