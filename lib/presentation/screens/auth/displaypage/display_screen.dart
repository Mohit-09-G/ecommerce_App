// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

class DisplayScreen extends StatelessWidget {
  DisplayScreen({super.key});
  HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return homeScreenController.isDetailLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Card(
                  color: Colors.grey,
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            homeScreenController.characterById.value.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Name: ${homeScreenController.characterById.value.name}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Gender: ${homeScreenController.characterById.value.gender.name}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Species: ${homeScreenController.characterById.value.species.name}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Status: ${homeScreenController.characterById.value.status.name}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Episodes: ${homeScreenController.characterById.value.episode.length.toString()}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
