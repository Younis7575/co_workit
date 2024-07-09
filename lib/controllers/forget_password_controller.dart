import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PasswordController extends GetxController {
  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmNewPassword = ''.obs;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? validateOldPassword(String value) {
    if (value.isEmpty) {
      return 'Old Password is required';
    }
    return null;
  }

  String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return 'New Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmNewPassword(String value) {
    if (value.isEmpty) {
      return 'Confirm New Password is required';
    } else if (value != newPasswordController.text) {
      return 'New Password and Confirm New Password do not match';
    }
    return null;
  }

  void resetPassword() {
    if (formKey.currentState!.validate()) {
      // Perform the password reset operation
      print('Password reset successful');
      Get.snackbar('Success', 'Password reset successful');
    }
  }
}
