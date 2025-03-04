import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_route.dart';

class ProfileScreenController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signOut() async {
    await auth.signOut();
    Get.offAllNamed(AppRoutes.signInScreen);
  }

  void backButton() {
    Get.back();
  }
}
