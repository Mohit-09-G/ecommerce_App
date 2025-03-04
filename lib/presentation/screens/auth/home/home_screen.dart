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
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            print("click");
          },
          tooltip: 'Open menu',
          icon: Image.asset("assets/images/sidebar.png"),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset("assets/images/appbar.png"),
                Text(
                  'Stylish',
                  style: TextStyle(
                      fontFamily: "Libre Caslon Text",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 22 / 18,
                      color: AppColor.appbartextcolor),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.navigateToProfile();
            },
            icon: Image.asset("assets/images/profile.png"),
          )
        ],
      ),
      backgroundColor: AppColor.backGroundColor,
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
