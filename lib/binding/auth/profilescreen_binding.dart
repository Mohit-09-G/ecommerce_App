import 'package:get/get.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/appbar/profile_screen_controller.dart';

class ProfilescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileScreenController>(
        () => getIt<ProfileScreenController>());
  }
}
