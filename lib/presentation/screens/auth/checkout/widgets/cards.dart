import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';
import 'package:third_app/data/model/charachter_model.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.find();
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 14,
            spreadRadius: -8,
            offset: Offset(0, 6)),
        BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 9,
            spreadRadius: -7,
            offset: Offset(0, -4))
      ]),
      child: Card(
        color: Color(0xFFFFFFFF),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(shape: BoxShape.rectangle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            Image.network(controller.characterById.value.image),
                      )),
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    controller.mapByID.length.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 22 / 14),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Variations :",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 22 / 12),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(
                                                  color: Color(0xFF0E0808),
                                                  width: 0.3),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0.5,
                                                vertical: 0.10),
                                            child: Center(
                                              child: Text(
                                                controller.characterById.value
                                                    .species.name,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    height: 22 / 10,
                                                    color:
                                                        AppColor.appblackColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(
                                                  color: Color(0xFF0E0808),
                                                  width: 0.3),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0.5,
                                                vertical: 0.10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  size: 6,
                                                  color: controller
                                                              .characterById
                                                              .value
                                                              .status
                                                              .name ==
                                                          Status.ALIVE.name
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  controller.characterById.value
                                                      .status.name,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 22 / 10,
                                                      color: AppColor
                                                          .appblackColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: AppColor.appblackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 22 / 12,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 13,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 13,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 13,
                                ),
                                Icon(
                                  Icons.star_half,
                                  size: 13,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        border: Border.all(
                                            color: Color(0xFFCACACA),
                                            width: 0.3),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          "\$${controller.characterById.value.episode.length.toString()}.00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 22 / 16,
                                              color: AppColor.appblackColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "upto 33% off",
                                        style: TextStyle(
                                            height: 22 / 8,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffEB3030)),
                                      ),
                                      Text(
                                        "\$ 64.00",
                                        style: TextStyle(
                                            color: Color(0xffA7A7A7),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 22 / 12,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Color(0xff737373)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(color: Color(0xffBBBBBB)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Order(${controller.characterListOfCart.length.toString()})  :",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                        height: 22 / 12),
                  ),
                  Text(
                    "\$${controller.characterById.value.episode.length.toString()}.00",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        height: 22 / 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
