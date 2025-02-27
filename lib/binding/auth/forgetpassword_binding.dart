import 'package:get/get.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/forgetPasword/forget_password_controller.dart';

class ForgetpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpasswordController>(
        () => getIt<ForgetpasswordController>());
  }
}
