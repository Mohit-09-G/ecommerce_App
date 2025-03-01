import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/route_manager.dart';
import 'package:third_app/config/app_route.dart';

class SplashContoller extends GetxController {
  @override
  void onInit() {
    _navigationNext();
    super.onInit();
  }

  void _navigationNext() async {
    await Future.delayed(Duration(seconds: 3));
    FirebaseAuth.instance.currentUser != null
        ? Get.offNamed(AppRoutes.homeScreen)
        : Get.offNamed(AppRoutes.onBoardScreen);
  }
}
