import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';
import 'package:third_app/config/app_image.dart';
import 'package:third_app/presentation/controller/auth/onboard/onboard_contoller.dart';
import 'package:third_app/presentation/screens/auth/onboard/widgets/onboard_screen.dart';
import 'package:third_app/presentation/screens/auth/onboard/widgets/onborad_indicator.dart';

class OnboardPage extends GetView<OnboardContoller> {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) => controller.currentPage.value = index,
              children: const [
                OnboardScreen(
                    image: AppImage.onBoarding1,
                    description1: "Choose Products",
                    description2:
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
                OnboardScreen(
                    image: AppImage.onBoarding2,
                    description1: "Make Payment",
                    description2:
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
                OnboardScreen(
                    image: AppImage.onBoarding3,
                    description1: "Get Your Order",
                    description2:
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.  Velit officia consequat duis enim velit mollit.")
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      if (controller.currentPage.value != 0) {
                        controller.prevPage();
                      }
                    },
                    child: Text(
                      "Prev",
                      style: TextStyle(
                          color: controller.currentPage.value == 0
                              ? Colors.transparent
                              : AppColor.appgreyColor,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
                Obx(() => PageIndicator(
                      count: 3,
                      currentIndex: controller.currentPage.value,
                      dotSize: 8.0,
                      pillWidth: 24.0,
                      spacing: 8.0,
                    )),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.nextPage();
                    },
                    child: Text(
                      controller.currentPage.value == 2
                          ? " Get Started "
                          : "Next",
                      style: TextStyle(
                          color: AppColor.appredColor,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
