import 'package:get/instance_manager.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/splash/splash_contoller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SplashContoller>(() => getIt<SplashContoller>());
    Get.put<SplashContoller>(getIt<SplashContoller>());
  }
}
