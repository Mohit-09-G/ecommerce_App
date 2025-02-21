import 'package:get/get.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/onboard/onboard_contoller.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<OnboardContoller>(() => getIt<OnboardContoller>());

    Get.put<OnboardContoller>(getIt<OnboardContoller>());
  }
}
