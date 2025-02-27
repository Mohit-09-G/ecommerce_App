import 'package:get/instance_manager.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => getIt<SignUpController>());
  }
}
