import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_route.dart';

class OnboardContoller extends GetxController {
  RxInt currentPage = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      pageController.nextPage(
          duration: const Duration(microseconds: 500), curve: Curves.easeInOut);
    } else {
      completeOnboard();
    }
  }

  void prevPage() {
    pageController.previousPage(
      duration: Duration(microseconds: 500),
      curve: Curves.linear,
    );
  }

  void completeOnboard() {
    Get.offAllNamed(AppRoutes.signInScreen);
  }
}
