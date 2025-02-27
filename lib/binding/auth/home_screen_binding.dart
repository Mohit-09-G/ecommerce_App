import 'package:get/get.dart';
import 'package:third_app/di/injections.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => getIt<HomeScreenController>());
  }
}
