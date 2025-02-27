import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_route.dart';
import 'package:third_app/config/validators.dart';
import 'package:third_app/domain/usecases/create_account_usecases.dart';

class SignUpController extends GetxController {
  final CreateAccountUsecases createAccountUsecases;

  SignUpController(this.createAccountUsecases);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final RxBool isFormValid = false.obs;
  final RxString emailError = RxString('');
  final RxString passwordError = RxString('');
  final RxString confirmpasswordError = RxString('');
  final RxBool obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

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

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void navigateToSignIn() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  Future<void> creatAccount() async {
    if (passwordController.text != confirmpasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }
    try {
      final user = await createAccountUsecases.execute(
          emailController.text, passwordController.text);
      // print(user);
      if (user != null) {
        Get.offAllNamed(AppRoutes.signInScreen);
        Get.snackbar('Success', 'Account created successfully');
      } else {
        Get.snackbar('Error', 'Failed to create account');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
