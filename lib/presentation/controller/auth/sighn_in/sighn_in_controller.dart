import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_route.dart';
import 'package:third_app/config/validators.dart';
import 'package:third_app/domain/usecases/do_login_with_email_password.dart';

class SighnInController extends GetxController {
  final DoLoginWithEmailPassword doLoginWithEmailPassword;

  SighnInController({required this.doLoginWithEmailPassword});

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

  void navigateToSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  void navigateToForget() {
    Get.toNamed(AppRoutes.forgetpassScreen);
  }

  Future<void> signInWithEmailAndPassword(
      String username, String password) async {
    try {
      final result = await doLoginWithEmailPassword.execute(username, password);
      if (result['success'] == true) {
        Get.offAllNamed(AppRoutes.homeScreen);
        Get.snackbar('success', 'signed in succefull');
      } else {
        Get.snackbar('fail', 'sign in fail');
      }
    } catch (e) {
      Get.snackbar(
          'Error', 'An error occurred while signing in: ${e.toString()}');
    }
  }
}
