import 'package:easy_localization/easy_localization.dart';

class FormValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "name_is_required".tr();
    }
    if (value.trim().length < 3) {
      return "name_min_length".tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "email_is_required".tr();
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value.trim())) {
      return "invalid_email".tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "password_is_required".tr();
    }
    if (value.length < 8) {
      return "password_min_length".tr();
    }
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');
    if (!regex.hasMatch(value)) {
      return "password_requirements".tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "confirm_your_password".tr();
    }
    if (value != password) {
      return "passwords_do_not_match".tr();
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "phone_is_required".tr();
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "phone_digits_only".tr();
    }

    if (!value.startsWith('0')) {
      return "phone_start_with_0".tr();
    }

    if (value.length != 11) {
      return "phone_length".tr();
    }

    if (!RegExp(r'^01[0,1,2,5][0-9]{8}$').hasMatch(value)) {
      return "invalid_egyptian_phone".tr();
    }

    return null;
  }

  static String? validateLoginEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "email_is_required".tr();
    }

    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "password_is_required".tr();
    }

    return null;
  }
}
