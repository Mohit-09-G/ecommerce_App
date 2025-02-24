import 'package:get/get.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/sighn_in/sighn_in_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SighnInController>(() => getIt<SighnInController>());

    Get.put<SighnInController>(getIt<SighnInController>());
  }
}
