import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';

import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';
import 'package:third_app/presentation/screens/auth/home/widgets/grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.find<HomeScreenController>();

    return Scaffold(
      backgroundColor: AppColor.appblackColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (controller.characterList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CharacterGridView(
                itemCount: controller.characterList.length,
                characters: controller.characterList);
          }
        }),
      ),
    );
  }
}
