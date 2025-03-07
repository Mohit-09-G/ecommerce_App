// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';
import 'package:third_app/presentation/screens/auth/commonwidget/cart_button.dart';
import 'package:third_app/presentation/screens/auth/commonwidget/squarebutton.dart';

class DisplayScreen extends StatelessWidget {
  DisplayScreen({super.key});
  HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return homeScreenController.isDetailLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          height: 250,
                                          homeScreenController
                                              .characterById.value.image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name: ${homeScreenController.characterById.value.name}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Gender: ${homeScreenController.characterById.value.gender.name}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Species: ${homeScreenController.characterById.value.species.name}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Status: ${homeScreenController.characterById.value.status.name}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Episodes: ${homeScreenController.characterById.value.episode.length.toString()}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 5),
                                child: homeScreenController
                                        .getCharacterGroupById(
                                            homeScreenController
                                                .characterById.value.id)
                                        .isEmpty
                                    ? Squarebutton(
                                        height: 50,
                                        buttontext: "Add to cart",
                                        ontap: () {
                                          homeScreenController.addToList();
                                        })
                                    : CartButton(
                                        onDecrement: () {
                                          homeScreenController.removefromList();
                                        },
                                        initialQuantity: homeScreenController
                                            .getCharacterGroupById(
                                                homeScreenController
                                                    .characterById.value.id)
                                            .length
                                            .toString(),
                                        onIncrement: () {
                                          homeScreenController.addToList();
                                        },
                                      )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Squarebutton(
                                  height: 50,
                                  buttontext: "checkout",
                                  ontap: () {
                                    homeScreenController.navigateToCheckout();
                                  }),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Squarebutton(
                                  height: 50,
                                  buttontext: "View All Episodes",
                                  ontap: () {
                                    homeScreenController.navigateTOAllEpisode();
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
      },
    );
  }
}
