import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/validators.dart';

class SighnInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isFormValid = false.obs;
  final RxString emailError = RxString('');
  final RxString passwordError = RxString('');
  final RxBool obscurePassword = true.obs;
  void validateForm() {
    isFormValid.value = emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void validateEmail(String value) {
    emailError.value = Validators.validateEmail(value) ?? "";
    validateForm();
  }

  void validatePassword(String value) {
    passwordError.value = Validators.validatePassword(value) ?? "";
    validateForm();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }
}
