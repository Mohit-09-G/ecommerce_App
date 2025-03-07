import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';
import 'package:third_app/data/model/charachter_model.dart';

import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

class ItemsCard extends StatelessWidget {
  final int index;
  const ItemsCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.find();

    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 14,
            spreadRadius: -8,
            offset: Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 14,
            spreadRadius: -7,
            offset: Offset(0, -4),
          ),
        ]),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  controller.checkoutList[index]
                                      .characterGroups[0].image,
                                  fit: BoxFit.fill,
                                  width: 133,
                                  height: 126,
                                ))
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.checkoutList[index]
                                          .characterGroups.first.name,
                                      style: TextStyle(
                                          color: AppColor.appblackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Variations :",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.appblackColor,
                                        height: 22 / 12),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                border: Border.all(
                                                    color: Color(0xff0E0808),
                                                    width: 0.3)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: FittedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller
                                                            .checkoutList[index]
                                                            .characterGroups
                                                            .first
                                                            .status
                                                            .name
                                                            .capitalize
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: controller
                                                                      .checkoutList[
                                                                          index]
                                                                      .characterGroups
                                                                      .first
                                                                      .status ==
                                                                  Status.ALIVE
                                                              ? Colors.green
                                                              : Colors.red,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                border: Border.all(
                                                    color: Color(0xff0E0808),
                                                    width: 0.3)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 6,
                                              ),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                controller
                                                    .checkoutList[index]
                                                    .characterGroups
                                                    .first
                                                    .gender
                                                    .name
                                                    .capitalize
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "4.5",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              height: 22 / 12,
                                              color: AppColor.appblackColor),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.star_rate,
                                            size: 16, color: Color(0xffF7B305)),
                                        Icon(Icons.star_rate,
                                            size: 16, color: Color(0xffF7B305)),
                                        Icon(Icons.star_rate,
                                            size: 16, color: Color(0xffF7B305)),
                                        Icon(Icons.star_rate,
                                            size: 16, color: Color(0xffF7B305)),
                                        Icon(
                                          Icons.star_half,
                                          size: 16,
                                          color: Color(0xffBBBBBB),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 0, right: 8, bottom: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              color: Color(0xffCACACA),
                                              width: 0.3)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                          child: Text(
                                            "\$ ${controller.checkoutList[index].characterGroups.first.episode.length.toString()}.00",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.appblackColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "upto 33% off",
                                          style: TextStyle(
                                            color: Color(0xffEB3030),
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "\$64.00",
                                          style: TextStyle(
                                            color: Color(0xffA7A7A7),
                                            fontSize: 15,
                                            decorationThickness: 0.5,
                                            decorationColor: Color(0xff737373),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      color: Color(0xffBBBBBB),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Order (${controller.checkoutList[index].characterGroups.length.toString()})   : ",
                          style: TextStyle(
                              color: AppColor.appblackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 22 / 12),
                        ),
                        Text(
                          "\$ ${controller.checkoutList[index].characterGroups.length.toString()}.00",
                          style: TextStyle(
                              color: AppColor.appblackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 22 / 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
