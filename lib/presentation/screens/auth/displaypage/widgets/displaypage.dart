// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';
import 'package:third_app/presentation/screens/auth/displaypage/display_screen.dart';

class Displaypage extends StatelessWidget {
  Displaypage({
    super.key,
  });
  HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: DisplayScreen());
  }
}
