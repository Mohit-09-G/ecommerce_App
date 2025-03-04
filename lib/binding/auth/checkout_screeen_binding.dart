import 'package:get/get.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/checkout/checkout_screen_controller.dart';

class CheckoutScreeenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutScreenController>(
        () => getIt<CheckoutScreenController>());
  }
}
