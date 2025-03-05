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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 14,
            spreadRadius: -8,
            offset: Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 9,
            spreadRadius: -7,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Card(
        color: Color(0xFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  controller.characterById.value.image,
                  width: 100, // Set a fixed width for image
                  height: 100, // Set a fixed height for image
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),

              // Character Details Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Character Info Section
                    Text(
                      controller.mapByID.length.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 22 / 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),

                    // Variations Section
                    Row(
                      children: [
                        _buildVariationBox(
                            controller.characterById.value.species.name),
                        SizedBox(width: 5),
                        _buildVariationStatusBox(
                            controller.characterById.value.status.name),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Rating Section
                    Row(
                      children: [
                        Text(
                          "4.5",
                          style: TextStyle(
                            color: AppColor.appblackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                        _buildRatingStars(),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Price Section
                    Row(
                      children: [
                        _buildPriceBox(
                            "\$${controller.characterById.value.episode.length.toString()}.00"),
                        SizedBox(width: 10),
                        _buildDiscountInfo(),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Divider Line
                    Divider(color: Color(0xffBBBBBB)),

                    // Total Order Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Order(${controller.characterListOfCart.length.toString()})  :",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Text(
                          "\$${controller.characterById.value.episode.length.toString()}.00",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function for creating variation boxes
  Widget _buildVariationBox(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border.all(color: Color(0xFF0E0808), width: 0.3),
        borderRadius: BorderRadius.circular(2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColor.appblackColor),
        ),
      ),
    );
  }

  Widget _buildVariationStatusBox(String status) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border.all(color: Color(0xFF0E0808), width: 0.3),
        borderRadius: BorderRadius.circular(2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 6,
            color: status == Status.ALIVE.name ? Colors.green : Colors.red,
          ),
          SizedBox(width: 5),
          Text(
            status,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColor.appblackColor),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars() {
    return Row(
      children: [
        Icon(Icons.star, size: 13),
        Icon(Icons.star, size: 13),
        Icon(Icons.star, size: 13),
        Icon(Icons.star_half, size: 13),
      ],
    );
  }

  Widget _buildPriceBox(String price) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border.all(color: Color(0xFFCACACA), width: 0.3),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          price,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.appblackColor),
        ),
      ),
    );
  }

  Widget _buildDiscountInfo() {
    return Column(
      children: [
        Text(
          "upto 33% off",
          style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: Color(0xffEB3030)),
        ),
        Text(
          "\$64.00",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xffA7A7A7),
            decoration: TextDecoration.lineThrough,
            decorationColor: Color(0xff737373),
          ),
        ),
      ],
    );
  }
}
