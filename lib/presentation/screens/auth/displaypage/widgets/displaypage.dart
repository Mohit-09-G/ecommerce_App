// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';
import 'package:third_app/presentation/screens/auth/displaypage/display_screen.dart';

class Displaypage extends StatelessWidget {
  Displaypage({
    super.key,
  });
  HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backGroundColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          actions: [
            Stack(
              alignment: Alignment(0.5, -1.0),
              children: [
                IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined)),
                Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepOrangeAccent),
                  child: Obx(
                    () => Text(
                      textAlign: TextAlign.center,
                      homeScreenController.checkoutList.length.toString(),
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        body: DisplayScreen());
  }
}
