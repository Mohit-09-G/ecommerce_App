import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/validators.dart';

class ForgetpasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final RxBool isFormValid = false.obs;
  final RxString emailError = RxString('');

  void validateForm() {
    isFormValid.value =
        emailError.value.isEmpty && emailController.text.isNotEmpty;
  }

  void validateEmail(String value) {
    emailError.value = Validators.validateEmail(value) ?? "";
    validateForm();
  }
}
